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

#load "renderer.jai";
#load "d3d_backend.jai";

RENDERING_BACKEND: enum {
    D3D11; VULKAN; METAL;
} : .D3D11;

//hwnd: HWND;
//WIN_WIDTH  :: 1280;
//WIN_HEIGHT :: 720;

render :: () {
    // set shaders
    ID3D11DeviceContext_VSSetConstantBuffers(d3d_context, 0, 1, *constant_buffer);
    ID3D11DeviceContext_VSSetShader(d3d_context, vertex_shader, null, 0); 
    ID3D11DeviceContext_PSSetShader(d3d_context, pixel_shader, null, 0);

    // Set buffers
    vertex_stride: u32 = 6 * size_of(float);
    vertex_offset: u32 = 0; 
    ID3D11DeviceContext_IASetVertexBuffers(d3d_context, 0, 1, *vertex_buffer, *vertex_stride, *vertex_offset);
    ID3D11DeviceContext_IASetIndexBuffer(d3d_context, index_buffer, .R32_UINT, 0);
    ID3D11DeviceContext_IASetPrimitiveTopology(d3d_context, D3D11_PRIMITIVE_TOPOLOGY.TRIANGLELIST);
    ID3D11DeviceContext_IASetInputLayout(d3d_context, vertex_layout);

    // draw
    ID3D11DeviceContext_DrawIndexedInstanced(d3d_context, 36, NUM_VIEWS, 0, 0, 0);
}

main :: () {
    defer log("Program exited gracefully...");

    ok, swapchain := xr_init(); defer cleanup_device();
    if !ok {
        log_error("Could not initialize OpenXR!");
        return;
    }

    on_fail :: #code {
        log_error("Program panicked!");
        exit(1);
    };
    
    session_state   := XrSessionState.UNKNOWN;
    session_running := false;
    run_framecycle  := false;
    should_quit     := false;
    while !should_quit {
        defer if should_quit xr_check(xrRequestExitSession(xr_session));

        reset_temporary_storage();
        
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
        while xrPollEvent(xr_instance, *xr_event) == .XR_SUCCESS if xr_event.type == {
            case .EVENT_DATA_INSTANCE_LOSS_PENDING; {
                event := cast(*XrEventDataInstanceLossPending) *xr_event;
                log("EVENT: instance loss pending at %! Destroying instance.", event.lossTime);
                should_quit = true;
                continue;
            }
            case .EVENT_DATA_SESSION_STATE_CHANGED; {
                event := cast(*XrEventDataSessionStateChanged) *xr_event;
                // TODO: log_info
                log("[INFO] XrSessionState: % -> %", session_state, event.state);
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
                            xr_check(xrBeginSession(xr_session, *session_begin_info));
                            session_running = true;
                        }
                        run_framecycle = true;
                    }

                    case .STOPPING; {
                        if session_running {
                            xr_check(xrEndSession(xr_session));
                            log("ending session!");
                            session_running = false;
                        }
                        run_framecycle = false;
                    }

                    case .LOSS_PENDING; #through;
                    case .EXITING; {
                        xr_check(xrDestroySession(xr_session));
                        should_quit    = true;
                        run_framecycle = false;
                    }
                }
            }
            case .EVENT_DATA_INTERACTION_PROFILE_CHANGED; {
                log("EVENT: interaction profile changed.");
                //event := cast(*EventDataInteractionProfileChanged) xr_event;
                //state := InteractionProfileState.{type = .INTERACTION_PROFILE_STATE, next = null};
                // this is unused because we are not using controllers, yet
            }
        }

        // TODO: put game here

        if !run_framecycle {
            log_error("DROPPED A FRAME!!!");
            continue;
        }
        
        // render the frame
        {
            using swapchain;

            // start the frame
            frame_state      := XrFrameState.{type = .FRAME_STATE};
            frame_wait_info  := XrFrameWaitInfo.{type = .FRAME_WAIT_INFO};
            xr_check(xrWaitFrame(xr_session, *frame_wait_info, *frame_state));
            frame_begin_info := XrFrameBeginInfo.{type = .FRAME_BEGIN_INFO };
            xr_check(xrBeginFrame(xr_session, *frame_begin_info));

            // TODO: add last minute hadn adjustments before the frame is sent

            // set up the compositor layers that we are going to be rendering to
            layer: *XrCompositionLayerBaseHeader;
            layer_projection := XrCompositionLayerProjection.{type=.COMPOSITION_LAYER_PROJECTION};
            

            // find the views
            views: [2]XrView; for * views it.type = .VIEW;
            view_locate_info: XrViewLocateInfo; {
                using view_locate_info;
                type                  = .VIEW_LOCATE_INFO;
                viewConfigurationType = .PRIMARY_STEREO;
                displayTime           = frame_state.predictedDisplayTime;
                space                 = xr_play_space;
            }
            view_state := XrViewState.{type = .VIEW_STATE};
            view_count := cast(u32) views.count;
            xr_check(xrLocateViews(
                xr_session, *view_locate_info, *view_state, xx views.count, *view_count, views.data
            ));
            assert(view_count == views.count, tprint("% != %", view_count, views.count));
            for * projection_views {
                using it;
                pose = views[it_index].pose;
                fov  = views[it_index].fov;
                subImage.swapchain = color_handle;
                subImage.imageRect.offset = .{};
                subImage.imageRect.extent = .{2316, 2572}; // TODO: save the screen dimensions
            }

            // get the textures and render to them
            acquired_index: u32;
            acquire_info := XrSwapchainImageAcquireInfo.{type = .SWAPCHAIN_IMAGE_ACQUIRE_INFO};
            xr_check(xrAcquireSwapchainImage(color_handle, *acquire_info, *acquired_index));

            wait_info := XrSwapchainImageWaitInfo.{type = .SWAPCHAIN_IMAGE_WAIT_INFO, timeout = 1000};
            xr_check(xrWaitSwapchainImage(color_handle, *wait_info));

            viewports: [2]D3D11_VIEWPORT;
            for * viewports {
                using it; using projection_views[it_index].subImage.imageRect;
                TopLeftX = xx offset.x;
                TopLeftY = xx offset.y;
                Width    = xx extent.width;
                Height   = xx extent.height;
                MinDepth = 0;
                MaxDepth = 1;
            }

            // clear the buffers
            using D3D11_CLEAR_FLAG;

            color: [4]float  = .[0.50, 1, 0.75, 0];
            ID3D11DeviceContext_RSSetViewports(d3d_context, viewports.count, viewports.data);
            ID3D11DeviceContext_ClearDepthStencilView(d3d_context, depth_buffers[acquired_index], xx DEPTH | STENCIL, 1, 0);
            ID3D11DeviceContext_ClearRenderTargetView(d3d_context, render_buffers[acquired_index], *color);
            ID3D11DeviceContext_OMSetRenderTargets(d3d_context, 1, *render_buffers[acquired_index], depth_buffers[acquired_index]);

            // update matrices and plop them into the constant buffer
            mapped_data: D3D11_MAPPED_SUBRESOURCE;
            ID3D11DeviceContext_Map(d3d_context, constant_buffer, 0, .WRITE_DISCARD, 0, *mapped_data);

            const_buffer: []Matrix4;
            const_buffer.data = mapped_data.pData; const_buffer.count = NUM_MATRICES;
            
            for projection_views {
                view_mat := Matrix4_Identity;
                proj_mat := Matrix4_Identity;
                
                //view_mat = translate(rotation_matrix(Matrix4, reinterpret_cast(Quaternion, it.pose.orientation)),
                //reinterpret_cast(Vector3, it.pose.position));
                view_mat = rotate    (view_mat, reinterpret_cast(Quaternion, it.pose.orientation));
                view_mat = translate (view_mat, reinterpret_cast(Vector3, it.pose.position));

                //proj_mat = Matrix4_Identity;
                n := NEAR_Z;
                f := FAR_Z;
                ymax := n * tan(it.fov.angleUp - it.fov.angleDown);
                ymin := - ymax;
                xmin := ymin * aspect_ratio;
                xmax := ymax * aspect_ratio;
                proj_mat = make_frustum_matrix(xmin, xmax, ymin, ymax, n, f);
                //proj_mat = make_projection_matrix(it.fov.angleUp - it.fov.angleDown, aspect_ratio, NEAR_Z, FAR_Z, depth_range_01=true);
                
                const_buffer[1+it_index] = proj_mat * view_mat;
            }

            const_buffer[0] = Matrix4_Identity;
            //const_buffer[1] = Matrix4_Identity;
            const_buffer[2] = Matrix4_Identity;
            
            render();

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
            frame_end_info: XrFrameEndInfo; {
                using frame_end_info;
                type                 = .FRAME_END_INFO;
                displayTime          = frame_state.predictedDisplayTime;
                layerCount           = xx should_submit; // NOTE: casting bool to int because we should only have 1 layer
                layers               = xx **projection_layer;
                environmentBlendMode = .OPAQUE;
            }
            
            xr_check(xrEndFrame(xr_session, *frame_end_info));
        }
    }
}
