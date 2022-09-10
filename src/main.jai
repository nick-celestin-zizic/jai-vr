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
    
    if !d3d_init() {
        log_error("Could not create device!");
        return;
    }
    defer cleanup_device();

    ok, swapchain := xr_init();
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

        // TODO: all of this should be done in the render thread
        if !run_framecycle {
            log("not doing anything this frame...");
            continue;
        }

        xr_render_frame(*swapchain);
    }
}

render_game :: (rt_view: **ID3D11RenderTargetView) {
    // Clear the back buffer
    color: [4] float = .[0.75, 0.5, 0.75, 1];
    ID3D11DeviceContext_ClearRenderTargetView(d3d_context, <<rt_view, *color);

    // set the buffer to active
    ID3D11DeviceContext_OMSetRenderTargets(d3d_context, 1, rt_view, null);
    
    // Render a triangle 
    ID3D11DeviceContext_VSSetShader(d3d_context, vertex_shader, null, 0); 
    ID3D11DeviceContext_PSSetShader(d3d_context, pixel_shader, null, 0); 
    ID3D11DeviceContext_Draw(d3d_context, 3, 0);
}

#import "dxgi";
#import "d3d11"()(INCLUDE_DEBUG_BINDINGS = true);
#import "d3d_compiler";
driver_type := D3D_DRIVER_TYPE.NULL;
feature_level := D3D_FEATURE_LEVEL._11_0;

d3d_device         : *ID3D11Device;
d3d_context        : *ID3D11DeviceContext;
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
// TODO: eventually we'll just compile the shader at compile time and not store the source at all
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
            // DirectX 11.0 platforms will not recognize D3D_FEATURE_LEVEL_11_1 so we need to retry without it.
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
