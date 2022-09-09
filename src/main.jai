#import "Basic";
#import "Window_Creation";
#import "Input";
#import "Math";

#import "Util";

#import "Windows";
#import "Windows_Utf8";

gltf :: #import "GLTF";

// TODD: remove this once we're done
#import "Code_Traverse";

DEBUG :: 0;


hwnd : HWND;
WIN_WIDTH  :: 1280;
WIN_HEIGHT :: 720;

main :: () {
    defer log("Program exited gracefully...");
    
    hwnd = create_window(WIN_WIDTH, WIN_HEIGHT, "VR COOL");
    if !hwnd {
        log_error("Could not init window!");
        return;
    }

    ok := d3d_init();
    if !ok {
        log_error("Could not create device!");
        return;
    }
    defer cleanup_device();

    if !xr_init() {
        log_error("Could not initialize OpenXR!");
        return;
    }
    
    session_state   := XrSessionState.UNKNOWN;
    session_running := false;
    run_framecycle  := false;
    
    should_quit := false;
    while !should_quit {
        defer if should_quit {
            log("requesting exit");
            xr_check(xrRequestExitSession(session));
        }
        
        update_window_events();
        for events_this_frame {
            if it.type == {
                case .QUIT; should_quit = true;
                case .KEYBOARD; {
                    if !it.key_pressed continue;
                    if it.key_code == .ESCAPE then should_quit = true;
                }
            }
        }

        xr_event := XrEventDataBuffer.{ type = .EVENT_DATA_BUFFER };
        poll_result := xrPollEvent(xr_instance, *xr_event);

        on_fail :: #code {
            log_error("Killing application");
            exit(1);
        };
        
        while poll_result == .XR_SUCCESS {
            defer {
                xr_event.type = .EVENT_DATA_BUFFER;
			          poll_result = xrPollEvent(xr_instance, *xr_event); // honestly have no idea why i have to do this but i will experiment l8r
            }
            
            if xr_event.type == {
                case .EVENT_DATA_INSTANCE_LOSS_PENDING; {
                    event := cast(*XrEventDataInstanceLossPending) *xr_event;
                    log("EVENT: instance loss pending at %! Destroying instance.", event.lossTime);
                    should_quit = true;
                    continue;
                }
                case .EVENT_DATA_SESSION_STATE_CHANGED; {
                    event := cast(*XrEventDataSessionStateChanged) *xr_event;
                    log("EVENT: session state changed from % to %", session_state, event.state);
                    session_state = event.state;
                    if session_state == {
                        case .MAX_ENUM; #through;
                        case .IDLE;     #through;
                        case .UNKNOWN; run_framecycle = false;

                        case .FOCUSED;      #through;
                        case .SYNCHRONIZED; #through;
                        case .VISIBLE; run_framecycle = true;

                        case .READY; {
                            if !session_running {
                                session_begin_info := XrSessionBeginInfo.{
                                    type = .SESSION_BEGIN_INFO,
                                    primaryViewConfigurationType = .PRIMARY_STEREO
                                };
                                xr_check(xrBeginSession(session, *session_begin_info));
                                log("session started!");
                                session_running = true;
                            }
                            run_framecycle = true;
                        }

                        case .STOPPING; {
                            if session_running {
                                xr_check(xrEndSession(session));
                                log("ending session!");
                                session_running = false;
                            }
                            run_framecycle = false;
                        }

                        case .LOSS_PENDING; #through;
                        case .EXITING; {
                            xr_check(xrDestroySession(session));
                            should_quit    = true;
                            run_framecycle = false;
                        }
                    }
                }
                case .EVENT_DATA_INTERACTION_PROFILE_CHANGED; {
                    log("EVENT: interaction profile changed.");
                    //event := cast(*EventDataInteractionProfileChanged) xr_event;
                    //state := InteractionProfileState.{type = .INTERACTION_PROFILE_STATE, next = null};
                    // this is unused because we are not using controllers
                }
            }
        }

        if !run_framecycle {
            log("not doing anything this frame...");
            continue;
        }

        frame_state     := XrFrameState.{type = .FRAME_STATE, next = null};
        frame_wait_info := XrFrameWaitInfo.{type = .FRAME_WAIT_INFO, next = null};
        xr_check(xrWaitFrame(session, *frame_wait_info, *frame_state));

        view_locate_info: XrViewLocateInfo = ---; {
            using view_locate_info;
            type                  = .VIEW_LOCATE_INFO;
            next                  = null;
            viewConfigurationType = .PRIMARY_STEREO;
            displayTime           = frame_state.predictedDisplayTime;
            space                 = play_space;
        }
        view_state := XrViewState.{type = .VIEW_STATE, next = null};
        view_count := cast(u32) views.count;
        xr_check(xrLocateViews(session, *view_locate_info, *view_state, xx views.count, *view_count, views.data));
        if views.count != view_count print("WEIRD: % != %\n", view_count, views.count);

        frame_begin_info := XrFrameBeginInfo.{type = .FRAME_BEGIN_INFO };
        xr_check(xrBeginFrame(session, *frame_begin_info));
        for 0..view_count-1 {
            if !frame_state.shouldRender {
                print("Skipping rendering work.\n");
                continue;
            }

            acquire_info := XrSwapchainImageAcquireInfo.{type = .SWAPCHAIN_IMAGE_ACQUIRE_INFO, next = null};
            acquired_index: u32;
            xr_check(xrAcquireSwapchainImage(swapchains[it], *acquire_info, *acquired_index));

            wait_info := XrSwapchainImageWaitInfo.{type = .SWAPCHAIN_IMAGE_WAIT_INFO, next = null, timeout = 1000};
            xr_check(xrWaitSwapchainImage(swapchains[it], *wait_info));

            depth_acquired_index := U32_MAX;
            depth_acquire_info := XrSwapchainImageAcquireInfo.{type = .SWAPCHAIN_IMAGE_ACQUIRE_INFO, next = null};
            xr_check(xrAcquireSwapchainImage(depth.swapchains[it], *depth_acquire_info, *depth_acquired_index));
            
            depth_wait_info := XrSwapchainImageWaitInfo.{type = .SWAPCHAIN_IMAGE_WAIT_INFO, next = null, timeout = 1000};
            xr_check(xrWaitSwapchainImage(depth.swapchains[it], *depth_wait_info));

            projection_views[it].pose = views[it].pose;
            projection_views[it].fov  = views[it].fov;

            depth_image := depth.swapchain_images[it][depth_acquired_index].texture;

            w := viewconfig_views[it].recommendedImageRectWidth;
            h := viewconfig_views[it].recommendedImageRectHeight;
            
            render(it, acquired_index);

            release_info := XrSwapchainImageReleaseInfo.{type = .SWAPCHAIN_IMAGE_RELEASE_INFO, next = null};
            xr_check(xrReleaseSwapchainImage(swapchains[it], *release_info));

            
            depth_release_info := XrSwapchainImageReleaseInfo.{type = .SWAPCHAIN_IMAGE_RELEASE_INFO, next = null};
            xr_check(xrReleaseSwapchainImage(depth.swapchains[it], *depth_release_info));
        }

        projection_layer : XrCompositionLayerProjection = ---; {
            using projection_layer;
            type       = .COMPOSITION_LAYER_PROJECTION;
            next       = null;
            layerFlags = 0;
            space      = play_space;
            viewCount  = view_count;
            views      = projection_views.data;
        }

        submitted_layer_count : u32 = 1;
        submitted_layers: [1]*XrCompositionLayerBaseHeader;
        submitted_layers[0] = xx *projection_layer;

        if view_state.viewStateFlags & XR_VIEW_STATE_ORIENTATION_VALID_BIT == 0 {
            print("Submitting 0 layers because orientation was invalid.\n");
            submitted_layer_count = 0;
        }

        if !frame_state.shouldRender {
            print("Submitting 0 layers because frame_state.shouldRender = false.\n");
            submitted_layer_count = 0;
        }

        frame_end_info : XrFrameEndInfo = ---; {
            using frame_end_info;
            type                 = .FRAME_END_INFO;
            next                 = null;
            displayTime          = frame_state.predictedDisplayTime;
            layerCount           = submitted_layer_count;
            layers               = submitted_layers.data;
            environmentBlendMode = .OPAQUE;
        }

        xr_check(xrEndFrame(session, *frame_end_info));
    }
}

render :: (eye_idx: int, image_idx: u32) {
    on_fail :: #code exit(69);
    rt_view := *render_target_views[eye_idx][image_idx];
    
    ID3D11DeviceContext_OMSetRenderTargets(d3d_context, 1, rt_view, null);
    // Clear the back buffer
    color: [4] float;// = .[0.5, 0.5, 00.5, 1];
    ID3D11DeviceContext_ClearRenderTargetView(d3d_context, <<rt_view, *color); 
    
    // Render a triangle 
    ID3D11DeviceContext_VSSetShader(d3d_context, vertex_shader, null, 0); 
    ID3D11DeviceContext_PSSetShader(d3d_context, pixel_shader, null, 0); 
    ID3D11DeviceContext_Draw(d3d_context, 3, 0 );

    // TODO: mayne I just create the swapchains in d3d code and just point their textures to the XrSwapchains ones
    //hr := IDXGISwapChain_Present(xx swapchains[i], 0, 0);
    //if FAILED(hr) {
    //log_error("Present failed: %", hr);
    //exit(1);
    //}
    
    
    // Present the information rendered to the back buffer to the front buffer (the screen)
    /*
    hr := IDXGISwapChain_Present(swap_chain, 0, 0); 
    if FAILED(hr) {
        log_error("Present failed: %", hr);
    }
    */
}

#import "XR";
XR_EXTENSIONS        :: *u8.[XR_KHR_D3D11_ENABLE_EXTENSION_NAME.data, XR_EXT_DEBUG_UTILS_EXTENSION_NAME.data];
WINDOW_NAME          :: "COOL EPIC WOW";
ENGINE_NAME          :: "WOWO SOO COOL";
NUM_VIEWS            :: 2;
NUM_SWAPCHAIN_IMAGES :: 3;
NEAR_Z :: 0.001; // TODO: DO THIS RIGHT
FAR_\Z :: 10;
IDENTITY_POSE :: XrPosef.{
    orientation = .{x = 0, y = 0, z = 0, w = 1},
    position    = .{x = 0, y = 0, z = 0},
};

// TODO: this is not needed? I think I just need a d3d depth stencil
Depth :: struct {
    infos            : [NUM_VIEWS]XrCompositionLayerDepthInfoKHR;
    swapchains       : [NUM_VIEWS]XrSwapchain;
    swapchain_images : [NUM_VIEWS][NUM_SWAPCHAIN_IMAGES]XrSwapchainImageD3D11KHR;
    stencil_views    : [NUM_VIEWS][NUM_SWAPCHAIN_IMAGES]*ID3D11DepthStencilView;
}

depth            : Depth;
xr_instance      : XrInstance;
xr_debug         : XrDebugUtilsMessengerEXT;
play_space       : XrSpace;
session          : XrSession;
viewconfig_views : [NUM_VIEWS]XrViewConfigurationView;
views            : [NUM_VIEWS]XrView;
projection_views : [NUM_VIEWS]XrCompositionLayerProjectionView;

swapchains        : [NUM_VIEWS]XrSwapchain;
swapchain_images  : [NUM_VIEWS][NUM_SWAPCHAIN_IMAGES]XrSwapchainImageD3D11KHR;
render_target_views: [NUM_VIEWS][NUM_SWAPCHAIN_IMAGES]*ID3D11RenderTargetView;

xr_init :: () -> bool {
    on_fail :: #code return false;
    
    //disable_logging();
    
    xr_print_api_layers();

    ext_count : u32 = 0;
    xr_check(xrEnumerateInstanceExtensionProperties(null, 0, *ext_count, null));

    d3d11_supported := false;
    depth_supported := false;
    debug_supported := false; // TODO: make this not required if you are in release mode
    {
        ext_props := NewArray(ext_count, XrExtensionProperties, allocator = temp); scope_reset_temp();

        for * ext_props it.type = .EXTENSION_PROPERTIES;

        xr_check(xrEnumerateInstanceExtensionProperties(null, ext_count, *ext_count, ext_props.data));

        log("Runtime supports % extensions", ext_count);

        for ext_props {
            ext_name := to_string(it.extensionName.data);
            log("\t% v%", ext_name, it.extensionVersion);
            
            if ext_name == XR_KHR_D3D11_ENABLE_EXTENSION_NAME            then d3d11_supported = true;
            if ext_name == XR_KHR_COMPOSITION_LAYER_DEPTH_EXTENSION_NAME then depth_supported = true;
            if ext_name == XR_EXT_DEBUG_UTILS_EXTENSION_NAME             then debug_supported = true;
        }
    }

    if !d3d11_supported {
        log_error("D3D11 is not supported!");
        return false;
    }

    if !depth_supported {
        log_error("Depth is not supported!");
        return false;
    }

    if !debug_supported {
        log_error("Debug is not supported!");
        return false;
    }
    
    instance_create_info := XrInstanceCreateInfo.{
        type                  = .INSTANCE_CREATE_INFO,
        next                  = null,
        createFlags           = 0,
        enabledApiLayerCount  = 0,
        enabledApiLayerNames  = null,
        enabledExtensionCount = XR_EXTENSIONS.count,
        enabledExtensionNames = XR_EXTENSIONS.data,
        
        applicationInfo        = .{
            applicationVersion = 1,
            engineVersion      = 0,
            apiVersion         = XR_CURRENT_API_VERSION,
            applicationName    = #run cast([128] u8) WINDOW_NAME,
            engineName         = #run cast([128] u8) ENGINE_NAME,
        }
    };
    xr_check(xrCreateInstance(*instance_create_info, *xr_instance));

    // TODO: do the same thing we do for the opengl pointers if it isnt too much of a pain
    load_extension_function_pointers(xr_instance);

    debug_info := XrDebugUtilsMessengerCreateInfoEXT.{type = .XR_TYPE_DEBUG_UTILS_MESSENGER_CREATE_INFO_EXT}; {
        using debug_info;
        messageTypes =
            XR_DEBUG_UTILS_MESSAGE_TYPE_GENERAL_BIT_EXT     |
		        XR_DEBUG_UTILS_MESSAGE_TYPE_VALIDATION_BIT_EXT  |
		        XR_DEBUG_UTILS_MESSAGE_TYPE_PERFORMANCE_BIT_EXT |
		        XR_DEBUG_UTILS_MESSAGE_TYPE_CONFORMANCE_BIT_EXT;
        messageSeverities =
		        XR_DEBUG_UTILS_MESSAGE_SEVERITY_VERBOSE_BIT_EXT |
		        XR_DEBUG_UTILS_MESSAGE_SEVERITY_INFO_BIT_EXT    |
		        XR_DEBUG_UTILS_MESSAGE_SEVERITY_WARNING_BIT_EXT |
		        XR_DEBUG_UTILS_MESSAGE_SEVERITY_ERROR_BIT_EXT;
        userCallback = (severity: XrDebugUtilsMessageSeverityFlagsEXT, types: XrDebugUtilsMessageTypeFlagsEXT, msg: *XrDebugUtilsMessengerCallbackDataEXT, user_data: *void) -> XrBool32 #c_call{
            new_context: Context;

            TEMPORARY_STORAGE_SIZE :: 1000;
            storage_buf: [TEMPORARY_STORAGE_SIZE] u8;

            storage: Temporary_Storage;
            storage.data = storage_buf.data;
            storage.size = TEMPORARY_STORAGE_SIZE;
            new_context.temporary_storage = *storage;

            //new_context.logger = default_logger; // TODO: make this my custom logger once i have one

            push_context new_context {
                // TODO actual logging
                dump(severity);
                dump(to_string(msg.functionName));
                dump(to_string(msg.message));
            }
            return XR_FALSE;
        };
    }
    xr_check(xrCreateDebugUtilsMessengerEXT(xr_instance, *debug_info, *xr_debug));
    

    xr_print_instance_properties(xr_instance);

    system_get_info := XrSystemGetInfo.{
        type         = .SYSTEM_GET_INFO,
        formFactor   = .HEAD_MOUNTED_DISPLAY,
        next         = null,
    };
    system_id: u64 = XR_NULL_SYSTEM_ID;
    xr_check(xrGetSystem(xr_instance, *system_get_info, *system_id));

    system_props := XrSystemProperties.{ type = .SYSTEM_PROPERTIES };
    xr_check(xrGetSystemProperties(xr_instance, system_id, *system_props));
    xr_print_system_properties(system_props);

    view_count: u32 = 0;
    xr_check(xrEnumerateViewConfigurationViews(xr_instance, system_id, .PRIMARY_STEREO, 0, *view_count, null));
    
    if view_count < NUM_VIEWS {
        log_error("bro you don't have enough views to do stereoscopic vr...");
        return false;
    } else if view_count > NUM_VIEWS {
        log("This is weird. You have % views, but it's probably fine right?", view_count);
    }

    for * viewconfig_views it.type = .VIEW_CONFIGURATION_VIEW;
    xr_check(xrEnumerateViewConfigurationViews(xr_instance, system_id, .PRIMARY_STEREO, view_count, *view_count, viewconfig_views.data));
    xr_print_viewconfig_view_info(viewconfig_views);
    
    d3d11_reqs := XrGraphicsRequirementsD3D11KHR.{ type = .GRAPHICS_REQUIREMENTS_D3D11_KHR };
    xr_check(xrGetD3D11GraphicsRequirementsKHR(xr_instance, system_id, *d3d11_reqs));

    graphics_binding_d3d11       := XrGraphicsBindingD3D11KHR.{ type = .GRAPHICS_BINDING_D3D11_KHR };
    graphics_binding_d3d11.device = d3d_device;
    
    session_create_info: XrSessionCreateInfo; {
        using session_create_info;
        type     = .SESSION_CREATE_INFO;
        next     = *graphics_binding_d3d11;
        systemId = system_id;
    }
    xr_check(xrCreateSession(xr_instance, *session_create_info, *session));

    log("Successfully created a session with D3D11!!");

    play_space_create_info := XrReferenceSpaceCreateInfo.{
        type                 = .REFERENCE_SPACE_CREATE_INFO,
        next                 = null,
        referenceSpaceType   = .LOCAL,
        poseInReferenceSpace = IDENTITY_POSE,
    };
    xr_check(xrCreateReferenceSpace(session, *play_space_create_info, *play_space));

    
    swapchain_format_count: u32 = ---;
    xr_check(xrEnumerateSwapchainFormats(session, 0, *swapchain_format_count, null));
    swapchain_formats := NewArray(swapchain_format_count, s64, allocator = temp); scope_reset_temp();
    xr_check(xrEnumerateSwapchainFormats(session, swapchain_format_count, *swapchain_format_count, swapchain_formats.data));

    found_format := false;
    for swapchain_formats if xx it == SWAP_CHAIN_FORMAT {
        found_format = true;
        break;
    }
    if !found_format {
        log_error("Device does not support the required swapchain format %.", SWAP_CHAIN_FORMAT);
        return false;
    }

    // normal swapchains
    for i: 0..NUM_VIEWS-1 {
        swapchain_create_info: XrSwapchainCreateInfo = ---; {
            using swapchain_create_info;
            type        = .SWAPCHAIN_CREATE_INFO;
            usageFlags  = XR_SWAPCHAIN_USAGE_SAMPLED_BIT | XR_SWAPCHAIN_USAGE_COLOR_ATTACHMENT_BIT;
            createFlags = 0;
            format      = xx SWAP_CHAIN_FORMAT;
            sampleCount = viewconfig_views[i].recommendedSwapchainSampleCount;
            width       = viewconfig_views[i].recommendedImageRectWidth;
            height      = viewconfig_views[i].recommendedImageRectHeight;
            faceCount   = 1;
            arraySize   = 1;
            mipCount    = 1;
            next        = null;
        }

        image_length: u32 = 0;
        xr_check(xrCreateSwapchain(session, *swapchain_create_info, *swapchains[i]));
        xr_check(xrEnumerateSwapchainImages(swapchains[i], 0, *image_length, null));
        if image_length != NUM_SWAPCHAIN_IMAGES {
            log_error("invalid number of swapchain images, wanted %, but got %",
                      NUM_SWAPCHAIN_IMAGES, image_length);
            return false;
        }

        for * swapchain_images[i] it.type = .SWAPCHAIN_IMAGE_D3D11_KHR;

        xr_check(xrEnumerateSwapchainImages(swapchains[i], image_length,
                                            *image_length, xx swapchain_images[i].data));
        
        desc: D3D11_RENDER_TARGET_VIEW_DESC; {
            using desc;
            Format = SWAP_CHAIN_FORMAT;
            ViewDimension = .TEXTURE2D;
            Texture2D = .{};
        }
        for 0..NUM_SWAPCHAIN_IMAGES-1 {
            hr := ID3D11Device_CreateRenderTargetView(d3d_device, swapchain_images[i][it].texture, *desc, *render_target_views[i][it]);
            if FAILED(hr) {
                log_error("could not create render targe!");
                return false;
            }
        }
    }

    // depth swapchain
    for i: 0..NUM_VIEWS-1 {
        swapchain_create_info: XrSwapchainCreateInfo = ---; {
            using swapchain_create_info;
            type        = .SWAPCHAIN_CREATE_INFO;
            usageFlags  = XR_SWAPCHAIN_USAGE_DEPTH_STENCIL_ATTACHMENT_BIT;
            createFlags = 0;
            format      = xx SWAP_CHAIN_FORMAT;
            sampleCount = viewconfig_views[i].recommendedSwapchainSampleCount;
            width       = viewconfig_views[i].recommendedImageRectWidth;
            height      = viewconfig_views[i].recommendedImageRectHeight;
            faceCount   = 1;
            arraySize   = 1;
            mipCount    = 1;
            next        = null;
        }

        image_length: u32 = 0;
        xr_check(xrCreateSwapchain(session, *swapchain_create_info, *depth.swapchains[i]));
        xr_check(xrEnumerateSwapchainImages(depth.swapchains[i], 0, *image_length, null));
        if image_length != NUM_SWAPCHAIN_IMAGES {
            log_error("invalid number of swapchain images. Wanted %, but got %",
                      NUM_SWAPCHAIN_IMAGES, image_length);
            return false;
        }
        
        for * depth.swapchain_images[i] it.type = .SWAPCHAIN_IMAGE_D3D11_KHR;

        xr_check(xrEnumerateSwapchainImages(depth.swapchains[i], image_length,
                                            *image_length, xx depth.swapchain_images[i].data));

        // TODO: figure out what do here bc this gives me invalid param stuff
#if 0 {
        desc: D3D11_DEPTH_STENCIL_VIEW_DESC; {
            using desc;
            Format = SWAP_CHAIN_FORMAT;
            ViewDimension = .TEXTURE2D;
            Flags = 0;
            Texture2D = .{};
        }
        for 0..NUM_SWAPCHAIN_IMAGES-1 {
            hr := ID3D11Device_CreateDepthStencilView(d3d_device, depth.swapchain_images[i][it].texture, *desc, *depth.stencil_views[i][it]);
            if FAILED(hr) {
            code := <<cast(*u32)*hr; // EEK
                err: string = ---;
                err.count = FormatMessageA(
                    FORMAT_MESSAGE_ALLOCATE_BUFFER | FORMAT_MESSAGE_FROM_SYSTEM, null,
                    code, MAKELANGID(LANG_NEUTRAL, SUBLANG_DEFAULT), xx *err.data, 0, null
                );
                
                print("failed with code %:\n  %\n", code, err);
                
                LocalFree(err.data);
                return false;
            }
        }
}
    }
    //return false;

    for * views it.type = .VIEW;
    for * projection_views {
        using it;
        type = .COMPOSITION_LAYER_PROJECTION_VIEW;

        using subImage;
        swapchain       = swapchains[it_index];
        imageArrayIndex = 0;

        using imageRect;
        offset.x      = 0;
        offset.y      = 0;
        extent.width  = xx viewconfig_views[it_index].recommendedImageRectWidth;
        extent.height = xx viewconfig_views[it_index].recommendedImageRectHeight;
    }
    
    for * depth.infos {
        using it;
            type     = .COMPOSITION_LAYER_DEPTH_INFO_KHR;
            next     = null;
            minDepth = 0;
            maxDepth = 1;
            nearZ    = NEAR_Z;
            farZ     = FAR_Z;

            using subImage;
            swapchain       = depth.swapchains[it_index];
            imageArrayIndex = 0;

            using imageRect;
            offset.x      = 0;
            offset.y      = 0;
            extent.width  = xx viewconfig_views[it_index].recommendedImageRectWidth;
            extent.height = xx viewconfig_views[it_index].recommendedImageRectHeight;

            projection_views[it_index].next = it;
    }
    
    
    
    return true;
}

xr_print_instance_properties :: (instance: XrInstance) {
    on_fail :: #code exit(1);
    
    instance_props := XrInstanceProperties.{
        type = .INSTANCE_PROPERTIES,
        next = null,
    };

    xr_check(xrGetInstanceProperties(instance, *instance_props));

    using instance_props;
    log("Runtime Name: %\nRuntime Version: %.%.%", to_string(runtimeName.data),
          XR_VERSION_MAJOR(runtimeVersion), XR_VERSION_MINOR(runtimeVersion), XR_VERSION_PATCH(runtimeVersion));
}

xr_print_api_layers :: () {
    on_fail :: #code {
        log_error("could not print api layers");
        exit(1);
    };
    
    count : u32 = 0;
    instance := null;
    
    xr_check(xrEnumerateApiLayerProperties(0, *count, null));
    if !count {
        log("no API layers");
        return;
    }

    props := NewArray(count, XrApiLayerProperties);
    defer array_free(props);

    for * props {
        dump(<<it);
        it.type = .API_LAYER_PROPERTIES;
        it.next = null;
    }
    
    xr_check(xrEnumerateApiLayerProperties(count, *count, props.data));

    log("API layers:");
    for props print("\t% v%: %", it.layerName, it.layerVersion, it.description);
}

xr_print_system_properties :: (using system_properties: XrSystemProperties) {
    log("System properties for system %: \"%\", vendor ID %", systemId, to_string(systemName).data, vendorId);
    log("\tMax layers: %\n\tMax swapchain height: %\n\tMax swapchain width: %\n\tOrientation Tracking: %\n\tPosition Tracking: %",
          graphicsProperties.maxLayerCount, graphicsProperties.maxSwapchainImageHeight, graphicsProperties.maxSwapchainImageWidth,
          trackingProperties.orientationTracking, trackingProperties.positionTracking);
}

xr_print_viewconfig_view_info :: (viewconfig_views: [] XrViewConfigurationView) {
    for viewconfig_views {
        log("View Configuration View %:", it_index);
        log("\tResolution: Recommended %x%, Max %x%\n\tSwapchain Samples: Recommended %, Max %",
              it.recommendedImageRectWidth, it.recommendedImageRectHeight,
              it.maxImageRectWidth, it.maxImageRectHeight,
              it.recommendedSwapchainSampleCount, it.maxSwapchainSampleCount);
    }
}

#import "dxgi";
#import "d3d11"()(INCLUDE_DEBUG_BINDINGS = true);
#import "d3d_compiler";
driver_type := D3D_DRIVER_TYPE.NULL;
feature_level := D3D_FEATURE_LEVEL._11_0;

SWAP_CHAIN_FORMAT :: DXGI_FORMAT.R8G8B8A8_UNORM_SRGB;
d3d_device         : *ID3D11Device;
d3d_context        : *ID3D11DeviceContext;
//swap_chain         : *IDXGISwapChain;
//render_target_view : *ID3D11RenderTargetView;
vertex_shader      : *ID3D11VertexShader;
pixel_shader       : *ID3D11PixelShader;
vertex_layout      : *ID3D11InputLayout;
vertex_buffer      : *ID3D11Buffer;
d3d_init :: () -> bool {
    on_fail :: #code return false;
    disable_logging();
    
    result: HRESULT = S_OK;
    flags: D3D11_CREATE_DEVICE_FLAG;
    flags |= .DEBUG;

    driver_types   := D3D_DRIVER_TYPE.[.HARDWARE, .WARP, .REFERENCE];
    feature_levels := D3D_FEATURE_LEVEL.[._11_1, ._11_0, ._10_1, ._10_0];
    
    for driver_types {
        result = D3D11CreateDevice(null, it, null, flags, feature_levels.data, feature_levels.count, D3D11_SDK_VERSION, *d3d_device, *feature_level, *d3d_context);
 
        if result == E_INVALIDARG {
            // DirectX 11.0 platforms will not recognize D3D_FEATURE_LEVEL_11_1 so we need to retry without it.
            result = D3D11CreateDevice(null, it, null, flags, feature_levels.data + 1, feature_levels.count - 1, D3D11_SDK_VERSION, *d3d_device, *feature_level, *d3d_context);
        }
 
        if SUCCEEDED(result) break;
    }
    check_hresult(result);

    assert(d3d_device != null);
    log("Created D3D11 device % with feature level %", d3d_device, feature_level);

    // Obtain DXGI factory from device (since we used null for pAdapter above) 
    dxgi_factory : *IDXGIFactory1;
    {
        dxgi_device : *IDXGIDevice;
        IUnknown_QueryInterface(d3d_device, *uid(IDXGIDevice_UUID), xx *dxgi_device);        
        
        adapter : *IDXGIAdapter;
        result = IDXGIDevice_GetAdapter(dxgi_device, *adapter);
        if SUCCEEDED(result) {
            result = IDXGIObject_GetParent(adapter, *uid(IDXGIFactory1_UUID), xx *dxgi_factory); 
            IUnknown_Release(adapter); 
        } 
        IUnknown_Release(dxgi_device);
    }

    log("Create swap chain");

    rc : RECT;
    GetClientRect(hwnd, *rc); 
    width := rc.right - rc.left; 
    height := rc.bottom - rc.top;

    IDXGIFactory_MakeWindowAssociation(dxgi_factory, hwnd, cast (u32) DXGI_MWA.NO_ALT_ENTER);
    
#if 0 {
    swap_chain_desc: DXGI_SWAP_CHAIN_DESC; {
        using swap_chain_desc;
        BufferCount                        = 1;
        BufferDesc.Width                   = xx width; 
        BufferDesc.Height                  = xx height; 
        BufferDesc.Format                  =  SWAP_CHAIN_FORMAT;
        BufferDesc.RefreshRate.Numerator   = 60; 
        BufferDesc.RefreshRate.Denominator = 1; 
        BufferUsage                        = .RENDER_TARGET_OUTPUT; 
        OutputWindow                       = hwnd; 
        SampleDesc.Count                   = 1; 
        SampleDesc.Quality                 = 0; 
        Windowed                           = BOOL.TRUE;
    }
    
    IDXGIFactory_CreateSwapChain(dxgi_factory, d3d_device, *swap_chain_desc, *swap_chain);
    log("Create a render target view");
    back_buffer: *ID3D11Texture2D;
    IDXGISwapChain_GetBuffer(swap_chain, 0, *uid(ID3D11Texture2D_UUID), xx *back_buffer);
    
    {
        defer IUnknown_Release(back_buffer);
        ID3D11Device_CreateRenderTargetView(d3d_device, back_buffer, null, *render_target_view);
    }

    ID3D11DeviceContext_OMSetRenderTargets(d3d_context, 1, *render_target_view, null);
}
    
    IUnknown_Release(dxgi_factory);
    
    log("Setup the viewport");

    viewport: D3D11_VIEWPORT; {
        using viewport;
        Width    = xx width; 
        Height   = xx height; 
        MinDepth = 0.0;
        MaxDepth = 1.0;
        TopLeftX = 0;
        TopLeftY = 0;
    }
    ID3D11DeviceContext_RSSetViewports(d3d_context, 1, *viewport);

    log("Compile the vertex shader");

    vs: string;
    vs, result = compile_shader(shader_text, "VS", "vs_4_0");
    check_hresult(result);
    assert(vs.data != null);

    ID3D11Device_CreateVertexShader(d3d_device, vs.data, cast(u64) vs.count, null, *vertex_shader);

    layout: [1]D3D11_INPUT_ELEMENT_DESC; {
        using layout[0];
        SemanticName         = "POSITION".data;
        SemanticIndex        = 0;
        Format               = .R32G32B32_FLOAT;
        InputSlot            = 0;
        AlignedByteOffset    = 0;
        InputSlotClass       = .VERTEX_DATA;
        InstanceDataStepRate = 0;
    }

    {
        defer free(vs);
        ID3D11Device_CreateInputLayout(
            d3d_device, layout.data, cast(u32) layout.count,
            vs.data, cast(u64) vs.count, *vertex_layout
        );
    }

    ID3D11DeviceContext_IASetInputLayout(d3d_context, vertex_layout);

    log("Compile the pixel shader");

    ps: string;
    ps, result = compile_shader(shader_text, "PS", "ps_4_0");
    check_hresult(result);

    ID3D11Device_CreatePixelShader(d3d_device, ps.data, cast(u64) ps.count, null, *pixel_shader);

    log("Create vertex buffer");

    // BUG: this causes a weird error
    //vertices :: Vector3.[ .{ 0.0,  0.5, 0.5 },
    //                      .{ 0.5, -0.5, 0.5 },
    //                      .{-0.5, -0.5, 0.5 } ];
    vertices: [3]Vector3;
    vertices[0] = .{ 0.0,  1.0, 1.0 };
    vertices[1] = .{ 1.0, -1.0, 1.0 };
    vertices[2] = .{-1.0, -1.0, 1.0 };
    
    buffer_desc: D3D11_BUFFER_DESC; {
        using buffer_desc;
        Usage          = .DEFAULT; 
        ByteWidth      = size_of(Vector3) * 3;
        BindFlags      = .VERTEX_BUFFER;
        CPUAccessFlags = 0;
    }

    init_data: D3D11_SUBRESOURCE_DATA;
    init_data.pSysMem = vertices.data;

    ID3D11Device_CreateBuffer(d3d_device, *buffer_desc, *init_data, *vertex_buffer);

    // Set vertex buffer 
    stride: u32 = size_of(Vector3);
    offset: u32 = 0; 
    ID3D11DeviceContext_IASetVertexBuffers(d3d_context, 0, 1, *vertex_buffer, *stride, *offset); 

    // Set primitive topology 
    ID3D11DeviceContext_IASetPrimitiveTopology(d3d_context, D3D11_PRIMITIVE_TOPOLOGY.TRIANGLELIST);
 
    return true;
}

cleanup_device :: () {
    if d3d_context ID3D11DeviceContext_ClearState(d3d_context);    
    if vertex_buffer IUnknown_Release(vertex_buffer);
    if vertex_layout IUnknown_Release(vertex_layout);
    if vertex_shader IUnknown_Release(vertex_shader);
    if pixel_shader IUnknown_Release(pixel_shader);
    //if render_target_view IUnknown_Release(render_target_view);
    //if swap_chain1 swap_chain1.Release(swap_chain1);
    //if swap_chain IUnknown_Release(swap_chain);
    //if d3d_context1 d3d_context1.Release(d3d_context1);
    if d3d_context IUnknown_Release(d3d_context);
    //if d3d_device1 d3d_device1.Release(d3d_device1);
    if d3d_device IUnknown_Release(d3d_device);   
}

compile_shader :: (src: string, entry_point: string, shader_model: string) -> string, HRESULT {
    flags := D3DCOMPILE.ENABLE_STRICTNESS;

    // Set the D3DCOMPILE_DEBUG flag to embed debug information in the shaders. 
    // Setting this flag improves the shader debugging experience, but still allows  
    // the shaders to be optimized and to run exactly the way they will run in  
    // the release configuration of this program. 
    flags |= .DEBUG; 
    
    // Disable optimizations to further improve shader debugging 
    flags |= .SKIP_OPTIMIZATION;

    defines: []string;
    bytecode, errors, result := D3DCompile(src, "source", defines, null, entry_point, shader_model, xx flags, 0);
    defer free(errors);

    if FAILED(result) {
        free(bytecode);
        if errors log_error("Error msg: %", errors);
        return "", result;
    }
    
    return bytecode, result;
}

shader_text :: #string END
float4 VS(float4 Pos : POSITION) : SV_POSITION {
    return Pos;
}

float4 PS(float4 Pos : SV_POSITION) : SV_Target {
    return float4(.1, 1, .8, 1);
}
END

#import "Compiler";
#run check_shader();
check_shader :: () { // compile the shader in order to check for errors
    on_fail :: #code compiler_report("shader does not compile");
    result: HRESULT;
    
    flags: D3D11_CREATE_DEVICE_FLAG;
    flags |= .DEBUG;

    driver_types   := D3D_DRIVER_TYPE.[.HARDWARE, .WARP, .REFERENCE];
    feature_levels := D3D_FEATURE_LEVEL.[._11_1, ._11_0, ._10_1, ._10_0];

    for driver_types {
        result = D3D11CreateDevice(null, it, null, flags, feature_levels.data, feature_levels.count, D3D11_SDK_VERSION, *d3d_device, *feature_level, *d3d_context);
 
        if result == E_INVALIDARG {
            // DirectX 11.0 platforms will not recognize D3D_FEATURE_LEVEL_11_1 so we need to retry without it.\
            result = D3D11CreateDevice(null, it, null, flags, feature_levels.data + 1, feature_levels.count - 1, D3D11_SDK_VERSION, *d3d_device, *feature_level, *d3d_context);
        }
 
        if SUCCEEDED(result) break;
    }

    check_hresult(result);
    
    vs: string;
    vs, result = compile_shader(shader_text, "VS", "vs_4_0");
    check_hresult(result);
    assert(vs.data != null);

    ID3D11Device_CreateVertexShader(d3d_device, vs.data, cast(u64) vs.count, null, *vertex_shader);

    layout: [1]D3D11_INPUT_ELEMENT_DESC; {
        using layout[0];
        SemanticName         = "POSITION".data;
        SemanticIndex        = 0;
        Format               = .R32G32B32_FLOAT;
        InputSlot            = 0;
        AlignedByteOffset    = 0;
        InputSlotClass       = .VERTEX_DATA;
        InstanceDataStepRate = 0;
    }

    {
        defer free(vs);
        ID3D11Device_CreateInputLayout(
            d3d_device, layout.data, cast(u32) layout.count,
            vs.data, cast(u64) vs.count, *vertex_layout);
    }

    ID3D11DeviceContext_IASetInputLayout(d3d_context, vertex_layout);

    ps: string;
    ps, result = compile_shader(shader_text, "PS", "ps_4_0");
    check_hresult(result);

    ID3D11Device_CreatePixelShader(d3d_device, ps.data, cast(u64) ps.count, null, *pixel_shader);

    print("the shader compiles :)\n");
}

// --- OLD SHIT ------
#if 0 {
vert_shader :: #string END
#version 330 core
#extension GL_ARB_explicit_uniform_location : require
layout(location = 0) in vec3 aPos;
layout(location = 2) uniform mat4 model;
layout(location = 3) uniform mat4 view;
layout(location = 4) uniform mat4 proj;
layout(location = 5) in vec2 aColor;

out vec2 vertexColor;
void main() {
    gl_Position = proj * view * model * vec4(aPos, 1.0);
    vertexColor = aColor;
}
END;

fragment_shader :: #string END
#version 330 core
#extension GL_ARB_explicit_uniform_location : require
layout(location = 0) out vec4 FragColor;
layout(location = 1) uniform vec3 uniformColor;
    in vec2 vertexColor;
void main() {
    FragColor = gl_FragCoord;
}
END;

gl_load_used_procs :: inline () { generated_gl_load_used_procs(); }

gl_init :: (swapchain_lengths: []u32, using gl_rendering: *Renderer) {
    gl_load_used_procs();
    
    framebuffers = NewArray(swapchain_lengths.count, []GLuint); // LEAK
    for * framebuffers {
        (<< it) = NewArray(swapchain_lengths[it_index], GLuint); // LEAK
        glGenFramebuffers(swapchain_lengths[it_index], it.data);
    }

    result: s32;
    info_log: [512]u8;
    
    vert_shader_id := glCreateShader(GL_VERTEX_SHADER);
    vertex_src := *u8.[vert_shader.data];
    glShaderSource(vert_shader_id, 1, vertex_src.data, null);
    glCompileShader(vert_shader_id);
    glGetShaderiv(vert_shader_id, GL_COMPILE_STATUS, *result);
    if !result {
        glGetShaderInfoLog(vert_shader_id, 512, null, info_log.data);
            print("Could not compile vertex shader: %\n", to_string(info_log.data));
        exit(1);
    } else {
        print("Compiled vertex shader.\n");
    }

    fragment_shader_id := glCreateShader(GL_FRAGMENT_SHADER);
    fragment_src := *u8.[fragment_shader.data];
    glShaderSource(fragment_shader_id, 1, fragment_src.data, null);
    glCompileShader(fragment_shader_id);
    glGetShaderiv(fragment_shader_id, GL_COMPILE_STATUS, *result);
    if !result {
        glGetShaderInfoLog(fragment_shader_id, 512, null, info_log.data);
        print("Could not compile fragment shader: %\n", to_string(info_log.data));
        exit(1);
    } else {
        print("Compiled fragment shader.\n");
    }

    shader_program_id = glCreateProgram();
    glAttachShader(shader_program_id, vert_shader_id);
    glAttachShader(shader_program_id, fragment_shader_id);
    glLinkProgram(shader_program_id);
    glGetProgramiv(shader_program_id, GL_LINK_STATUS, *result);
    if !result {
        glGetProgramInfoLog(shader_program_id, 512, null, info_log.data);
        print("Could not link shader program: %\n", to_string(info_log.data));
    } else {
        print("Linked shader program.\n");
    }

    glDeleteShader(vert_shader_id);
	  glDeleteShader(fragment_shader_id); // TODO: don't delete this and set up hot reloading for frag only

    vertices := float.[ -0.5, -0.5, -0.5, 0.0, 0.0, 0.5,  -0.5, -0.5, 1.0, 0.0,
	                      0.5,  0.5,  -0.5, 1.0, 1.0, 0.5,  0.5,  -0.5, 1.0, 1.0,
	                      -0.5, 0.5,  -0.5, 0.0, 1.0, -0.5, -0.5, -0.5, 0.0, 0.0,
                        
	                      -0.5, -0.5, 0.5,  0.0, 0.0, 0.5,  -0.5, 0.5,  1.0, 0.0,
	                      0.5,  0.5,  0.5,  1.0, 1.0, 0.5,  0.5,  0.5,  1.0, 1.0,
	                      -0.5, 0.5,  0.5,  0.0, 1.0, -0.5, -0.5, 0.5,  0.0, 0.0,
                        
	                      -0.5, 0.5,  0.5,  1.0, 0.0, -0.5, 0.5,  -0.5, 1.0, 1.0,
	                      -0.5, -0.5, -0.5, 0.0, 1.0, -0.5, -0.5, -0.5, 0.0, 1.0,
	                      -0.5, -0.5, 0.5,  0.0, 0.0, -0.5, 0.5,  0.5,  1.0, 0.0,
                        
	                      0.5,  0.5,  0.5,  1.0, 0.0, 0.5,  0.5,  -0.5, 1.0, 1.0,
	                      0.5,  -0.5, -0.5, 0.0, 1.0, 0.5,  -0.5, -0.5, 0.0, 1.0,
	                      0.5,  -0.5, 0.5,  0.0, 0.0, 0.5,  0.5,  0.5,  1.0, 0.0,
                        
	                      -0.5, -0.5, -0.5, 0.0, 1.0, 0.5,  -0.5, -0.5, 1.0, 1.0,
	                      0.5,  -0.5, 0.5,  1.0, 0.0, 0.5,  -0.5, 0.5,  1.0, 0.0,
	                      -0.5, -0.5, 0.5,  0.0, 0.0, -0.5, -0.5, -0.5, 0.0, 1.0,
                        
	                      -0.5, 0.5,  -0.5, 0.0, 1.0, 0.5,  0.5,  -0.5, 1.0, 1.0,
	                      0.5,  0.5,  0.5,  1.0, 0.0, 0.5,  0.5,  0.5,  1.0, 0.0,
	                      -0.5, 0.5,  0.5,  0.0, 0.0, -0.5, 0.5,  -0.5, 0.0, 1.0 ];

    VBO: GLuint;
    glGenBuffers(1, *VBO);

    glGenVertexArrays(1, *VAO);

    glBindVertexArray(VAO);
    glBindBuffer(GL_ARRAY_BUFFER, VBO);
    glBufferData(GL_ARRAY_BUFFER, vertices.count * size_of(float), vertices.data, GL_DYNAMIC_DRAW);
    glVertexAttribPointer(0, 3, GL_FLOAT, GL_FALSE, 5 * size_of(float), null);
    glEnableVertexAttribArray(0);

    glBufferData(GL_ARRAY_BUFFER, vertices.count * size_of(float), vertices.data , GL_DYNAMIC_DRAW);
    glVertexAttribPointer(5, 2, GL_FLOAT, GL_FALSE, 5 * size_of(float), xx (3 * size_of(float)));

    glEnable(GL_DEPTH_TEST);
}
}
