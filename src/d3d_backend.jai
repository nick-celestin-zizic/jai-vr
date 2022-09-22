d3d_device    : *ID3D11Device;
d3d_context   : *ID3D11DeviceContext;
vertex_shader : *ID3D11VertexShader;
pixel_shader  : *ID3D11PixelShader;
d3d_init :: (adapter_luid: LUID) -> bool {
    on_fail :: #code return false;
    
    flags: D3D11_CREATE_DEVICE_FLAG;
    flags |= .DEBUG;
    
    feature_levels := D3D_FEATURE_LEVEL.[._11_1, ._11_0, ._10_1, ._10_0];

    adapter: *IDXGIAdapter1; {
        curr_\adapter: *IDXGIAdapter1;
        dxgi_\factory: *IDXGIFactory1;

        adapter_desc: DXGI_ADAPTER_DESC1;
        
        CreateDXGIFactory1(uid(IDXGIFactory1_UUID), xx *dxgi_factory);

        curr: u32 = 0;
        while IDXGIFactory1_EnumAdapters1(dxgi_factory, curr, *curr_adapter) == S_OK {
            curr += 1;

            IDXGIAdapter1_GetDesc1(curr_adapter, *adapter_desc);
            if memcmp(*adapter_desc.AdapterLuid, *adapter_luid, size_of(type_of(adapter_luid))) == 0 {
                adapter = curr_adapter;
                break;
            }

            IUnknown_Release(curr_adapter);
            curr_adapter = null;
        }
        
        IUnknown_Release(dxgi_factory);
    } if !adapter {
        log_error("Could not find the given adapter");
        return false;   
    }
    
    D3D11CreateDevice(adapter, .UNKNOWN, null, flags,
                      feature_levels.data, feature_levels.count,
                      D3D11_SDK_VERSION, *d3d_device, *feature_level, *d3d_context);
    IUnknown_Release(adapter);

    assert(d3d_device != null && d3d_context != null);
    log("Created D3D11 device % with feature level %", <<d3d_device, feature_level);

    // init the graphics state
    // TOOD: get this part out of here?? Idk will figure it out once I have actual stuff to load
    log("Creating the shaders");
    ID3D11Device_CreateVertexShader(d3d_device, VS_BIN.data, cast(u64) VS_BIN.count, null, *vertex_shader);
    ID3D11Device_CreatePixelShader(d3d_device, PS_BIN.data, cast(u64) PS_BIN.count, null, *pixel_shader);

    // TODO: parse shader at compile time and generate this????
    layout_desc := D3D11_INPUT_ELEMENT_DESC.[
            .{ SemanticName         = "POSITION".data,
               SemanticIndex        = 0,
               Format               = .R32G32B32_FLOAT,
               InputSlot            = 0,
               AlignedByteOffset    = 0,
               InputSlotClass       = .VERTEX_DATA,
               InstanceDataStepRate = 0 },
            .{ SemanticName         = "COLOR".data,
               SemanticIndex        = 0,
               Format               = .R32G32B32_FLOAT,
               InputSlot            = 0,
               AlignedByteOffset    = 12,
               InputSlotClass       = .VERTEX_DATA,
               InstanceDataStepRate = 0 }
    ];
    ID3D11Device_CreateInputLayout(d3d_device, layout_desc.data, layout_desc.count, VS_BIN.data, cast(u64) VS_BIN.count, *vertex_layout);
    ID3D11DeviceContext_IASetInputLayout(d3d_context, vertex_layout);

    // Create vertex buffer
    vertices := [6]float.[ .[-0.5,-0.5,-0.5,   0,   0,   0],
                           .[-0.5,-0.5, 0.5,   0,   0,   1],
                           .[-0.5, 0.5,-0.5,   0,   1,   0],
                           .[-0.5, 0.5, 0.5,   0,   1,   1],
                           
                           .[ 0.5,-0.5,-0.5,   1,   0,   0],
                           .[ 0.5,-0.5, 0.5,   1,   0,   1],
                           .[ 0.5, 0.5,-0.5,   1,   1,   0],
                           .[ 0.5, 0.5, 0.5,   1,   1,   1], ];
    vertex_buffer_desc: D3D11_BUFFER_DESC; {
        using vertex_buffer_desc;
        Usage          = .DEFAULT; 
        ByteWidth      = size_of(type_of(vertices));
        BindFlags      = .VERTEX_BUFFER;
        CPUAccessFlags = 0;
    }
    vertex_init_data: D3D11_SUBRESOURCE_DATA;
    vertex_init_data.pSysMem = vertices.data;
    ID3D11Device_CreateBuffer(d3d_device, *vertex_buffer_desc, *vertex_init_data, *vertex_buffer);

    // Create index buffer
    indices := s32.[ 0,2,1, // -x
                     1,2,3,
                     
                     4,5,6, // +x
                     5,7,6,
                     
                     0,1,5, // -y
                     0,5,4,
                     
                     2,6,7, // +y
                     2,7,3,
                     
                     0,4,6, // -z
                     0,6,2,
                     
                     1,3,7, // +z
                     1,7,5, ];
    index_buffer_desc: D3D11_BUFFER_DESC; {
        using index_buffer_desc;
        Usage          = .DEFAULT; 
        ByteWidth      = size_of(type_of(indices));
        BindFlags      = .VERTEX_BUFFER;
        CPUAccessFlags = 0;
    }
    index_init_data: D3D11_SUBRESOURCE_DATA;
    index_init_data.pSysMem = indices.data;
    ID3D11Device_CreateBuffer(d3d_device, *index_buffer_desc, *index_init_data, *index_buffer);

    // create constant buffer
    cb_desc := D3D11_BUFFER_DESC.{
        ByteWidth           = CONST_BUFFER_SIZE,
        Usage               = .DYNAMIC,
        BindFlags           = .CONSTANT_BUFFER,
        CPUAccessFlags      = .WRITE,
        MiscFlags           = 0,
        StructureByteStride = 0,
    };
    cb_init_data: D3D11_SUBRESOURCE_DATA;
    
    #import "Math";
    initial_buffer := Matrix4.[Matrix4_Identity, Matrix4_Identity, Matrix4_Identity];
    //translate(initial_buffer.data, .{0, 1, 0});
    #assert size_of(type_of(initial_buffer)) == CONST_BUFFER_SIZE;
    
    cb_init_data.pSysMem = initial_buffer.data;
    ID3D11Device_CreateBuffer(d3d_device, *cb_desc, *cb_init_data, *constant_buffer);
    
 
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

MAT_SIZE          :: 16 * size_of(float);
NUM_MATRICES      :: 3;
CONST_BUFFER_SIZE :: NUM_MATRICES * MAT_SIZE; // 1 for the model and 2 for the view_projection

vertex\ _buffer: *ID3D11Buffer;
index\  _buffer: *ID3D11Buffer;
constant_buffer: *ID3D11Buffer;
vertex_layout: *ID3D11InputLayout;

#scope_file
#import "dxgi";
#import "d3d11"()(INCLUDE_DEBUG_BINDINGS = true);
#import "d3d_compiler";
#import "Compiler";
#import "File";

feature_level := D3D_FEATURE_LEVEL._11_0;

VS_BIN, PS_BIN :: #run compile_shaders(read_entire_file(tprint("%0%", #filepath, "shader.hlsl")));

compile_shaders :: (src: string) -> string, string { // compile the shader in order to check for errors
    flags := D3DCOMPILE.ENABLE_STRICTNESS | .DEBUG | .SKIP_OPTIMIZATION;
    
    defines: []string;
    vs, vs_errors, vs_result := D3DCompile(src, "source", defines, null, "vs_main", "vs_4_0", xx flags, 0);
    defer free(vs_errors);
    if FAILED(vs_result) {
        free(vs);
        if vs_errors compiler_report(tprint("Could not compile vertex shader (%): %", vs_result, vs_errors));
        return "", "";
    }
    
    ps, ps_errors, ps_result := D3DCompile(src, "source", defines, null, "ps_main", "ps_4_0", xx flags, 0);
    defer free(ps_errors);
    if FAILED(ps_result) {
        free(ps);
        if ps_errors compiler_report(tprint("Could not compile pixel shader (%): %", ps_result, ps_errors));
        return "", "";
    }

    return vs, ps;
}
