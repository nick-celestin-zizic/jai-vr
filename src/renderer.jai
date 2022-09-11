#import "XR";
// TODO: this is the best format for me but idk if its universal or not so we should probably try checking

RENDERING_BACKEND: enum {
    D3D11;
} : .D3D11;

SWAPCHAIN_COLOR_FORMAT :: DXGI_FORMAT.R8G8B8A8_UNORM_SRGB;
SWAPCHAIN_DEPTH_FORMAT :: DXGI_FORMAT.D32_FLOAT;

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

Swapchain :: struct {
    color_handle: XrSwapchain;
    depth_handle: XrSwapchain;
    
    projection_views: [2]XrCompositionLayerProjectionView; // one for each eye
    
    // These two are jointly allocated
    render_buffers: []*ID3D11RenderTargetView;
    depth\_buffers: []*ID3D11DepthStencilView;
}

swapchain_init_buffers :: inline (using swapchain: *Swapchain) -> bool {
    on_fail :: #code return false;
    
    num_buffers: u32 = 0;
    xr_check(xrEnumerateSwapchainImages(color_handle, 0, *num_buffers, null));
    
    render_size := size_of(*ID3D11RenderTargetView) * num_buffers;
    depth\_size := size_of(*ID3D11DepthStencilView) * num_buffers;
    memory := alloc(render_size + depth_size);

    render_buffers.data  = memory;
    render_buffers.count = num_buffers;

    depth_buffers.data  = memory + render_size;
    depth_buffers.count = num_buffers;
    
    // this is basically a wrapper for a d3d texture so we just alloc space for the pointers and then we take them out
    swapchain_images := NewArray(num_buffers, XrSwapchainImageD3D11KHR, allocator = temp);
    for * swapchain_images it.type = .SWAPCHAIN_IMAGE_D3D11_KHR;
    xr_check(xrEnumerateSwapchainImages(color_handle, num_buffers, *num_buffers, xx swapchain_images.data));
    
    desc: D3D11_RENDER_TARGET_VIEW_DESC; {
        using desc;
        Format = SWAPCHAIN_COLOR_FORMAT;
        ViewDimension = .TEXTURE2DARRAY;
        Texture2DArray = .{ ArraySize = 2 };
    }
    for swapchain_images {
        hr := ID3D11Device_CreateRenderTargetView(d3d_device, it.texture, *desc, *render_buffers[it_index]);
        if FAILED(hr) {
            log_error("could not create render targe!");
            #insert on_fail;
        }
    }

    return true;
}

swapchain_free_buffers :: inline (using swapchain: *Swapchain) { free(cast(*void) render_buffers.data); }

xr_instance   : XrInstance;
xr_debug      : XrDebugUtilsMessengerEXT;
xr_session    : XrSession;
xr_play_space : XrSpace;
xr_init :: () -> bool, Swapchain  {
    on_fail :: #code return false, .{};

    // check if extensions are supported
    ext_count: u32 = 0;
    xr_check(xrEnumerateInstanceExtensionProperties(null, 0, *ext_count, null));
    
    d3d11_supported := false;
    depth_supported := false;
    debug_supported := false; // TODO: make this not required if you are in release mode
    {
        ext_props := NewArray(ext_count, XrExtensionProperties, allocator = temp); scope_reset_temp();

        for * ext_props it.type = .EXTENSION_PROPERTIES;

        xr_check(xrEnumerateInstanceExtensionProperties(null, ext_count, *ext_count, ext_props.data));

        //log("Runtime supports % extensions", ext_count);

        for ext_props {
            ext_name := to_string(it.extensionName.data);
            //log("\t% v%", ext_name, it.extensionVersion);
            
            if ext_name == XR_KHR_D3D11_ENABLE_EXTENSION_NAME            then d3d11_supported = true;
            if ext_name == XR_KHR_COMPOSITION_LAYER_DEPTH_EXTENSION_NAME then depth_supported = true;
            if ext_name == XR_EXT_DEBUG_UTILS_EXTENSION_NAME             then debug_supported = true;
        }
    }

    if !d3d11_supported {
        log_error("D3D11 is not supported!");
        #insert on_fail;
    }

    if !depth_supported {
        log_error("Depth is not supported!");
        #insert on_fail;
    }

    if !debug_supported {
        log_error("Debug is not supported!");
        #insert on_fail;
    }

    // initialize instance
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
            applicationName    = #run cast([128]u8) WINDOW_NAME,
            engineName         = #run cast([128]u8) ENGINE_NAME,
        }
    };
    xr_check(xrCreateInstance(*instance_create_info, *xr_instance));
    xr_log_instance_properties(xr_instance);
    
    // TODO: do the same thing we do for the opengl pointers if it isnt too much of a pain
    load_extension_function_pointers(xr_instance);

    // initialize debug info
    debug_info := XrDebugUtilsMessengerCreateInfoEXT.{type = .XR_TYPE_DEBUG_UTILS_MESSENGER_CREATE_INFO_EXT}; {
        using debug_info;
        messageTypes = .ALL;
        using XrDebugUtilsMessageSeverityFlagsEXT;
        messageSeverities = INFO | WARNING | ERROR;
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
                using msg;
                name := to_string(functionName);
                if sessionLabelCount log("!!!!!!! LABEL COUNT IS NONZEROO");
                log("[%] % - %0%",
                    severity, to_string(messageId), ifx name then tprint("%: ", name) else "", to_string(message));
            }
            return XR_FALSE;
        };
    }
    xr_check(xrCreateDebugUtilsMessengerEXT(xr_instance, *debug_info, *xr_debug));

    // get system properties used in swapchain creation
    system_get_info := XrSystemGetInfo.{
        type         = .SYSTEM_GET_INFO,
        formFactor   = .HEAD_MOUNTED_DISPLAY,
        next         = null,
    };
    system_id: u64 = XR_NULL_SYSTEM_ID;
    xr_check(xrGetSystem(xr_instance, *system_get_info, *system_id));
    
    xr_log_system_properties(system_id);
    
    view_count: u32;
    xr_check(xrEnumerateViewConfigurationViews(xr_instance, system_id, .PRIMARY_STEREO, 0, *view_count, null));
    
    if view_count < NUM_VIEWS {
        log_error("bro you don't have enough views to do stereoscopic vr...");
        #insert on_fail;
    } else if view_count > NUM_VIEWS log("This is weird. You have % views, but it's probably fine right?", view_count);

    // initialize session and play space
#if RENDERING_BACKEND == .D3D11 {
    graphics_reqs := XrGraphicsRequirementsD3D11KHR.{type = .GRAPHICS_REQUIREMENTS_D3D11_KHR};
    xr_check(xrGetD3D11GraphicsRequirementsKHR(xr_instance, system_id, *graphics_reqs));
    
    graphics_binding       := XrGraphicsBindingD3D11KHR.{type = .GRAPHICS_BINDING_D3D11_KHR};
    graphics_binding.device = d3d_device;
} else compiler_report("the only working backend is Direct3D11");
    
    session_create_info: XrSessionCreateInfo; {
        using session_create_info;
        type     = .SESSION_CREATE_INFO;
        next     = *graphics_binding;
        systemId = system_id;
    }
    xr_check(xrCreateSession(xr_instance, *session_create_info, *xr_session));

    log("Successfully created a session with D3D11!!");

    play_space_create_info := XrReferenceSpaceCreateInfo.{
        type                 = .REFERENCE_SPACE_CREATE_INFO,
        next                 = null,
        referenceSpaceType   = .LOCAL,
        poseInReferenceSpace = IDENTITY_POSE,
    };
    xr_check(xrCreateReferenceSpace(xr_session, *play_space_create_info, *xr_play_space));

    // make sure that we support the correct swapchain formats
    // TODO: use fallback format?
    swapchain_format_count: u32 = ---;
    xr_check(xrEnumerateSwapchainFormats(xr_session, 0, *swapchain_format_count, null));
    swapchain_formats := NewArray(swapchain_format_count, s64, allocator = temp);
    xr_check(xrEnumerateSwapchainFormats(xr_session, swapchain_format_count, *swapchain_format_count, swapchain_formats.data));
    
    found_format := false;
    for swapchain_formats if xx it == SWAPCHAIN_COLOR_FORMAT {
        found_format = true;
        break;
    }
    if !found_format {
        log_error("Device does not support the required swapchain format %.", SWAPCHAIN_COLOR_FORMAT);
        #insert on_fail;
    }

    viewconfig_views: [NUM_VIEWS]XrViewConfigurationView;
    for * viewconfig_views it.type = .VIEW_CONFIGURATION_VIEW;
    xr_check(xrEnumerateViewConfigurationViews(xr_instance, system_id, .PRIMARY_STEREO, view_count, *view_count, viewconfig_views.data));

    xr_log_viewconfig_view_info(viewconfig_views);
    
    // create the swapchain
    using swapchain: Swapchain;
    
    swapchain_create_info: XrSwapchainCreateInfo; {
        using swapchain_create_info;
        type        = .SWAPCHAIN_CREATE_INFO;
        usageFlags  = XR_SWAPCHAIN_USAGE_SAMPLED_BIT | XR_SWAPCHAIN_USAGE_COLOR_ATTACHMENT_BIT;
        createFlags = 0;
        format      = xx SWAPCHAIN_COLOR_FORMAT;
        sampleCount = viewconfig_views[0].recommendedSwapchainSampleCount;
        width       = viewconfig_views[0].recommendedImageRectWidth;
        height      = viewconfig_views[0].recommendedImageRectHeight;
        faceCount   = 1;
        arraySize   = 2;
        mipCount    = 1;
    }
    xr_check(xrCreateSwapchain(xr_session, *swapchain_create_info, *color_handle));
    
    swapchain_init_buffers(*swapchain);
    
    for * projection_views {
        it.type = .COMPOSITION_LAYER_PROJECTION_VIEW;
        
        it.subImage.swapchain       = color_handle;
        it.subImage.imageArrayIndex = xx it_index;
        
        it.subImage.imageRect.offset.x      = 0;
        it.subImage.imageRect.offset.y      = 0;
        it.subImage.imageRect.extent.width  = xx viewconfig_views[it_index].recommendedImageRectWidth;
        it.subImage.imageRect.extent.height = xx viewconfig_views[it_index].recommendedImageRectHeight;
    }
    
    return true, swapchain;
}

xr_render_frame :: (using swapchain: *Swapchain) {
    on_fail :: #code {
        log_error("xr_render_frame PANICKED");
        exit(1);
    };

    // wait for frame to be ready and then start it
    views: [2]XrView;
    for * views it.type = .VIEW; // TODO: just have a metaprog that just has the defalut types be correct
    
    frame_state     := XrFrameState.{type = .FRAME_STATE};
    frame_wait_info := XrFrameWaitInfo.{type = .FRAME_WAIT_INFO};
    xr_check(xrWaitFrame(xr_session, *frame_wait_info, *frame_state));

    view_locate_info: XrViewLocateInfo = ---; {
        using view_locate_info;
        type                  = .VIEW_LOCATE_INFO;
        viewConfigurationType = .PRIMARY_STEREO;
        displayTime           = frame_state.predictedDisplayTime;
        space                 = xr_play_space;
    }
    view_state := XrViewState.{type = .VIEW_STATE};
    view_count := cast(u32) views.count;
    xr_check(xrLocateViews(xr_session, *view_locate_info, *view_state, xx views.count, *view_count, views.data));
    assert(view_count == views.count, tprint("% != %", view_count, views.count));
    for views {
        projection_views[it_index].pose = it.pose;
        projection_views[it_index].fov  = it.fov;
   }
    
    frame_begin_info := XrFrameBeginInfo.{type = .FRAME_BEGIN_INFO };
    xr_check(xrBeginFrame(xr_session, *frame_begin_info));

    // get the textures and render to them
    acquired_index: u32;
    acquire_info := XrSwapchainImageAcquireInfo.{type = .SWAPCHAIN_IMAGE_ACQUIRE_INFO};
    xr_check(xrAcquireSwapchainImage(color_handle, *acquire_info, *acquired_index));

    wait_info := XrSwapchainImageWaitInfo.{type = .SWAPCHAIN_IMAGE_WAIT_INFO, timeout = 1000};
    xr_check(xrWaitSwapchainImage(color_handle, *wait_info));
    
    render_game(*render_buffers[acquired_index]);

    release_info := XrSwapchainImageReleaseInfo.{type = .SWAPCHAIN_IMAGE_RELEASE_INFO, next = null};
    xr_check(xrReleaseSwapchainImage(color_handle, *release_info));
    
    // submit the frame
    projection_layer: XrCompositionLayerProjection; {
        using projection_layer;
        type       = .COMPOSITION_LAYER_PROJECTION;
        space      = xr_play_space;
        viewCount  = view_count;
        views      = projection_views.data;
    }
    should_submit := true;
    if view_state.viewStateFlags & XR_VIEW_STATE_ORIENTATION_VALID_BIT == 0 {
        log("Not submitting layer because orientation was invalid.\n");
        should_submit := false;
    }
    if !frame_state.shouldRender {
        log("Not submitting layer because frame_state.shouldRender = false.\n");
        should_submit := false;
    }
    frame_end_info : XrFrameEndInfo = ---; {
        using frame_end_info;
        type                 = .FRAME_END_INFO;
        displayTime          = frame_state.predictedDisplayTime;
        layerCount           = xx should_submit; // NOTE: casting bool to int because we should only have 1 layer
        layers               = xx **projection_layer;
        environmentBlendMode = .OPAQUE;
    }
    xr_check(xrEndFrame(xr_session, *frame_end_info));
}

#scope_file
xr_log_instance_properties :: (instance: XrInstance) {
    on_fail :: #code exit(1);
    
    instance_props := XrInstanceProperties.{
        type = .INSTANCE_PROPERTIES,
        next = null,
    };

    xr_check(xrGetInstanceProperties(instance, *instance_props));

    using instance_props;
    log("[INFO] Runtime Name: %\nRuntime Version: %.%.%", to_string(runtimeName.data),
          XR_VERSION_MAJOR(runtimeVersion), XR_VERSION_MINOR(runtimeVersion), XR_VERSION_PATCH(runtimeVersion));
}

xr_log_system_properties :: (system_id: u64) {
    on_fail :: #code exit(69);
    
    using system_props := XrSystemProperties.{ type = .SYSTEM_PROPERTIES };
    xr_check(xrGetSystemProperties(xr_instance, system_id, *system_props));
    
    log("[INFO] System properties for system %: \"%\", vendor ID %\n\tMax layers: %\n\tMax swapchain height: %\n\tMax swapchain width: %\n\tOrientation Tracking: %\n\tPosition Tracking: %",
        systemId, to_string(systemName).data, vendorId,
        graphicsProperties.maxLayerCount, graphicsProperties.maxSwapchainImageHeight, graphicsProperties.maxSwapchainImageWidth,
        trackingProperties.orientationTracking, trackingProperties.positionTracking);
}

xr_log_viewconfig_view_info :: (viewconfig_views: [] XrViewConfigurationView) {
    for viewconfig_views log(
        "[INFO] View Configuration View %:\n\tResolution: Recommended %x%, Max %x%\n\tSwapchain Samples: Recommended %, Max %",
        it_index, it.recommendedImageRectWidth, it.recommendedImageRectHeight,
        it.maxImageRectWidth, it.maxImageRectHeight,
        it.recommendedSwapchainSampleCount, it.maxSwapchainSampleCount
    );
}
