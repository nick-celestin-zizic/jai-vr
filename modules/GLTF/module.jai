//
// This file was auto-generated using the following command:
//
// jai build.jai
//



cgltf_size :: u64;
cgltf_float :: float;
cgltf_int :: s32;
cgltf_uint :: u32;
cgltf_bool :: s32;

File_Type :: enum s32 {
    INVALID :: 0;
    GLTF    :: 1;
    GLB     :: 2;

    cgltf_file_type_invalid :: INVALID;
    cgltf_file_type_gltf    :: GLTF;
    cgltf_file_type_glb     :: GLB;
}

cgltf_file_type :: File_Type;

Result :: enum s32 {
    SUCCESS         :: 0;
    DATA_TOO_SHORT  :: 1;
    UNKNOWN_FORMAT  :: 2;
    INVALID_JSON    :: 3;
    INVALID_GLTF    :: 4;
    INVALID_OPTIONS :: 5;
    FILE_NOT_FOUND  :: 6;
    IO_ERROR        :: 7;
    OUT_OF_MEMORY   :: 8;
    LEGACY_GLTF     :: 9;

    cgltf_result_success         :: SUCCESS;
    cgltf_result_data_too_short  :: DATA_TOO_SHORT;
    cgltf_result_unknown_format  :: UNKNOWN_FORMAT;
    cgltf_result_invalid_json    :: INVALID_JSON;
    cgltf_result_invalid_gltf    :: INVALID_GLTF;
    cgltf_result_invalid_options :: INVALID_OPTIONS;
    cgltf_result_file_not_found  :: FILE_NOT_FOUND;
    cgltf_result_io_error        :: IO_ERROR;
    cgltf_result_out_of_memory   :: OUT_OF_MEMORY;
    cgltf_result_legacy_gltf     :: LEGACY_GLTF;
}

cgltf_result :: Result;

Memory_Options :: struct {
    alloc:     #type (a0: *void, a1: cgltf_size) -> *void #c_call;
    free:      #type (a0: *void, a1: *void) -> void #c_call;
    user_data: *void;
}
#run {
    instance: Memory_Options;
    assert(((cast(*void)(*instance.alloc)) - cast(*void)(*instance)) == 0, "Memory_Options.alloc has unexpected offset % instead of 0", ((cast(*void)(*instance.alloc)) - cast(*void)(*instance)));
    assert(size_of(type_of(Memory_Options.alloc)) == 8, "Memory_Options.alloc has unexpected size % instead of 8", size_of(type_of(Memory_Options.alloc)));
    assert(((cast(*void)(*instance.free)) - cast(*void)(*instance)) == 8, "Memory_Options.free has unexpected offset % instead of 8", ((cast(*void)(*instance.free)) - cast(*void)(*instance)));
    assert(size_of(type_of(Memory_Options.free)) == 8, "Memory_Options.free has unexpected size % instead of 8", size_of(type_of(Memory_Options.free)));
    assert(((cast(*void)(*instance.user_data)) - cast(*void)(*instance)) == 16, "Memory_Options.user_data has unexpected offset % instead of 16", ((cast(*void)(*instance.user_data)) - cast(*void)(*instance)));
    assert(size_of(type_of(Memory_Options.user_data)) == 8, "Memory_Options.user_data has unexpected size % instead of 8", size_of(type_of(Memory_Options.user_data)));
    assert(size_of(Memory_Options) == 24, "Memory_Options has size % instead of 24", size_of(Memory_Options));
}

cgltf_memory_options :: Memory_Options;

File_Options :: struct {
    read:      #type (a0: *Memory_Options, a1: *File_Options, a2: *u8, a3: *cgltf_size, a4: **void) -> cgltf_result #c_call;
    release:   #type (a0: *Memory_Options, a1: *File_Options, a2: *void) -> void #c_call;
    user_data: *void;
}
#run {
    instance: File_Options;
    assert(((cast(*void)(*instance.read)) - cast(*void)(*instance)) == 0, "File_Options.read has unexpected offset % instead of 0", ((cast(*void)(*instance.read)) - cast(*void)(*instance)));
    assert(size_of(type_of(File_Options.read)) == 8, "File_Options.read has unexpected size % instead of 8", size_of(type_of(File_Options.read)));
    assert(((cast(*void)(*instance.release)) - cast(*void)(*instance)) == 8, "File_Options.release has unexpected offset % instead of 8", ((cast(*void)(*instance.release)) - cast(*void)(*instance)));
    assert(size_of(type_of(File_Options.release)) == 8, "File_Options.release has unexpected size % instead of 8", size_of(type_of(File_Options.release)));
    assert(((cast(*void)(*instance.user_data)) - cast(*void)(*instance)) == 16, "File_Options.user_data has unexpected offset % instead of 16", ((cast(*void)(*instance.user_data)) - cast(*void)(*instance)));
    assert(size_of(type_of(File_Options.user_data)) == 8, "File_Options.user_data has unexpected size % instead of 8", size_of(type_of(File_Options.user_data)));
    assert(size_of(File_Options) == 24, "File_Options has size % instead of 24", size_of(File_Options));
}

cgltf_file_options :: File_Options;

Options :: struct {
    type:             cgltf_file_type; /* invalid == auto detect */
    json_token_count: cgltf_size; /* 0 == auto */
    memory:           cgltf_memory_options;
    file:             cgltf_file_options;
}
#run {
    instance: Options;
    assert(((cast(*void)(*instance.type)) - cast(*void)(*instance)) == 0, "Options.type has unexpected offset % instead of 0", ((cast(*void)(*instance.type)) - cast(*void)(*instance)));
    assert(size_of(type_of(Options.type)) == 4, "Options.type has unexpected size % instead of 4", size_of(type_of(Options.type)));
    assert(((cast(*void)(*instance.json_token_count)) - cast(*void)(*instance)) == 8, "Options.json_token_count has unexpected offset % instead of 8", ((cast(*void)(*instance.json_token_count)) - cast(*void)(*instance)));
    assert(size_of(type_of(Options.json_token_count)) == 8, "Options.json_token_count has unexpected size % instead of 8", size_of(type_of(Options.json_token_count)));
    assert(((cast(*void)(*instance.memory)) - cast(*void)(*instance)) == 16, "Options.memory has unexpected offset % instead of 16", ((cast(*void)(*instance.memory)) - cast(*void)(*instance)));
    assert(size_of(type_of(Options.memory)) == 24, "Options.memory has unexpected size % instead of 24", size_of(type_of(Options.memory)));
    assert(((cast(*void)(*instance.file)) - cast(*void)(*instance)) == 40, "Options.file has unexpected offset % instead of 40", ((cast(*void)(*instance.file)) - cast(*void)(*instance)));
    assert(size_of(type_of(Options.file)) == 24, "Options.file has unexpected size % instead of 24", size_of(type_of(Options.file)));
    assert(size_of(Options) == 64, "Options has size % instead of 64", size_of(Options));
}

cgltf_options :: Options;

Buffer_View_Type :: enum s32 {
    INVALID  :: 0;
    INDICES  :: 1;
    VERTICES :: 2;

    cgltf_buffer_view_type_invalid  :: INVALID;
    cgltf_buffer_view_type_indices  :: INDICES;
    cgltf_buffer_view_type_vertices :: VERTICES;
}

cgltf_buffer_view_type :: Buffer_View_Type;

Attribute_Type :: enum s32 {
    INVALID  :: 0;
    POSITION :: 1;
    NORMAL   :: 2;
    TANGENT  :: 3;
    TEXCOORD :: 4;
    COLOR    :: 5;
    JOINTS   :: 6;
    WEIGHTS  :: 7;

    cgltf_attribute_type_invalid  :: INVALID;
    cgltf_attribute_type_position :: POSITION;
    cgltf_attribute_type_normal   :: NORMAL;
    cgltf_attribute_type_tangent  :: TANGENT;
    cgltf_attribute_type_texcoord :: TEXCOORD;
    cgltf_attribute_type_color    :: COLOR;
    cgltf_attribute_type_joints   :: JOINTS;
    cgltf_attribute_type_weights  :: WEIGHTS;
}

cgltf_attribute_type :: Attribute_Type;

Component_Type :: enum s32 {
    INVALID :: 0;
    R_8     :: 1;
    R_8U    :: 2;
    R_16    :: 3;
    R_16U   :: 4;
    R_32U   :: 5;
    R_32F   :: 6;

    cgltf_component_type_invalid :: INVALID;
    cgltf_component_type_r_8     :: R_8;
    cgltf_component_type_r_8u    :: R_8U;
    cgltf_component_type_r_16    :: R_16;
    cgltf_component_type_r_16u   :: R_16U;
    cgltf_component_type_r_32u   :: R_32U;
    cgltf_component_type_r_32f   :: R_32F;
}

cgltf_component_type :: Component_Type;

Type :: enum s32 {
    INVALID :: 0;
    SCALAR  :: 1;
    VEC2    :: 2;
    VEC3    :: 3;
    VEC4    :: 4;
    MAT2    :: 5;
    MAT3    :: 6;
    MAT4    :: 7;

    cgltf_type_invalid :: INVALID;
    cgltf_type_scalar  :: SCALAR;
    cgltf_type_vec2    :: VEC2;
    cgltf_type_vec3    :: VEC3;
    cgltf_type_vec4    :: VEC4;
    cgltf_type_mat2    :: MAT2;
    cgltf_type_mat3    :: MAT3;
    cgltf_type_mat4    :: MAT4;
}

cgltf_type :: Type;

Primitive_Type :: enum s32 {
    POINTS         :: 0;
    LINES          :: 1;
    LINE_LOOP      :: 2;
    LINE_STRIP     :: 3;
    TRIANGLES      :: 4;
    TRIANGLE_STRIP :: 5;
    TRIANGLE_FAN   :: 6;

    cgltf_primitive_type_points         :: POINTS;
    cgltf_primitive_type_lines          :: LINES;
    cgltf_primitive_type_line_loop      :: LINE_LOOP;
    cgltf_primitive_type_line_strip     :: LINE_STRIP;
    cgltf_primitive_type_triangles      :: TRIANGLES;
    cgltf_primitive_type_triangle_strip :: TRIANGLE_STRIP;
    cgltf_primitive_type_triangle_fan   :: TRIANGLE_FAN;
}

cgltf_primitive_type :: Primitive_Type;

Alpha_Mode :: enum s32 {
    OPAQUE :: 0;
    MASK   :: 1;
    BLEND  :: 2;

    cgltf_alpha_mode_opaque :: OPAQUE;
    cgltf_alpha_mode_mask   :: MASK;
    cgltf_alpha_mode_blend  :: BLEND;
}

cgltf_alpha_mode :: Alpha_Mode;

Animation_Path_Type :: enum s32 {
    INVALID     :: 0;
    TRANSLATION :: 1;
    ROTATION    :: 2;
    SCALE       :: 3;
    WEIGHTS     :: 4;

    cgltf_animation_path_type_invalid     :: INVALID;
    cgltf_animation_path_type_translation :: TRANSLATION;
    cgltf_animation_path_type_rotation    :: ROTATION;
    cgltf_animation_path_type_scale       :: SCALE;
    cgltf_animation_path_type_weights     :: WEIGHTS;
}

cgltf_animation_path_type :: Animation_Path_Type;

Interpolation_Type :: enum s32 {
    LINEAR       :: 0;
    STEP         :: 1;
    CUBIC_SPLINE :: 2;

    cgltf_interpolation_type_linear       :: LINEAR;
    cgltf_interpolation_type_step         :: STEP;
    cgltf_interpolation_type_cubic_spline :: CUBIC_SPLINE;
}

cgltf_interpolation_type :: Interpolation_Type;

Camera_Type :: enum s32 {
    INVALID      :: 0;
    PERSPECTIVE  :: 1;
    ORTHOGRAPHIC :: 2;

    cgltf_camera_type_invalid      :: INVALID;
    cgltf_camera_type_perspective  :: PERSPECTIVE;
    cgltf_camera_type_orthographic :: ORTHOGRAPHIC;
}

cgltf_camera_type :: Camera_Type;

Light_Type :: enum s32 {
    INVALID     :: 0;
    DIRECTIONAL :: 1;
    POINT       :: 2;
    SPOT        :: 3;

    cgltf_light_type_invalid     :: INVALID;
    cgltf_light_type_directional :: DIRECTIONAL;
    cgltf_light_type_point       :: POINT;
    cgltf_light_type_spot        :: SPOT;
}

cgltf_light_type :: Light_Type;

Data_Free_Method :: enum s32 {
    NONE         :: 0;
    FILE_RELEASE :: 1;
    MEMORY_FREE  :: 2;

    cgltf_data_free_method_none         :: NONE;
    cgltf_data_free_method_file_release :: FILE_RELEASE;
    cgltf_data_free_method_memory_free  :: MEMORY_FREE;
}

cgltf_data_free_method :: Data_Free_Method;

Extras :: struct {
    start_offset: cgltf_size;
    end_offset:   cgltf_size;
}
#run {
    instance: Extras;
    assert(((cast(*void)(*instance.start_offset)) - cast(*void)(*instance)) == 0, "Extras.start_offset has unexpected offset % instead of 0", ((cast(*void)(*instance.start_offset)) - cast(*void)(*instance)));
    assert(size_of(type_of(Extras.start_offset)) == 8, "Extras.start_offset has unexpected size % instead of 8", size_of(type_of(Extras.start_offset)));
    assert(((cast(*void)(*instance.end_offset)) - cast(*void)(*instance)) == 8, "Extras.end_offset has unexpected offset % instead of 8", ((cast(*void)(*instance.end_offset)) - cast(*void)(*instance)));
    assert(size_of(type_of(Extras.end_offset)) == 8, "Extras.end_offset has unexpected size % instead of 8", size_of(type_of(Extras.end_offset)));
    assert(size_of(Extras) == 16, "Extras has size % instead of 16", size_of(Extras));
}

cgltf_extras :: Extras;

Extension :: struct {
    name: *u8;
    data: *u8;
}
#run {
    instance: Extension;
    assert(((cast(*void)(*instance.name)) - cast(*void)(*instance)) == 0, "Extension.name has unexpected offset % instead of 0", ((cast(*void)(*instance.name)) - cast(*void)(*instance)));
    assert(size_of(type_of(Extension.name)) == 8, "Extension.name has unexpected size % instead of 8", size_of(type_of(Extension.name)));
    assert(((cast(*void)(*instance.data)) - cast(*void)(*instance)) == 8, "Extension.data has unexpected offset % instead of 8", ((cast(*void)(*instance.data)) - cast(*void)(*instance)));
    assert(size_of(type_of(Extension.data)) == 8, "Extension.data has unexpected size % instead of 8", size_of(type_of(Extension.data)));
    assert(size_of(Extension) == 16, "Extension has size % instead of 16", size_of(Extension));
}

cgltf_extension :: Extension;

Buffer :: struct {
    name:             *u8;
    size:             cgltf_size;
    uri:              *u8;
    data:             *void; /* loaded by cgltf_load_buffers */
    data_free_method: cgltf_data_free_method;
    extras:           cgltf_extras;
    extensions_count: cgltf_size;
    extensions:       *cgltf_extension;
}
#run {
    instance: Buffer;
    assert(((cast(*void)(*instance.name)) - cast(*void)(*instance)) == 0, "Buffer.name has unexpected offset % instead of 0", ((cast(*void)(*instance.name)) - cast(*void)(*instance)));
    assert(size_of(type_of(Buffer.name)) == 8, "Buffer.name has unexpected size % instead of 8", size_of(type_of(Buffer.name)));
    assert(((cast(*void)(*instance.size)) - cast(*void)(*instance)) == 8, "Buffer.size has unexpected offset % instead of 8", ((cast(*void)(*instance.size)) - cast(*void)(*instance)));
    assert(size_of(type_of(Buffer.size)) == 8, "Buffer.size has unexpected size % instead of 8", size_of(type_of(Buffer.size)));
    assert(((cast(*void)(*instance.uri)) - cast(*void)(*instance)) == 16, "Buffer.uri has unexpected offset % instead of 16", ((cast(*void)(*instance.uri)) - cast(*void)(*instance)));
    assert(size_of(type_of(Buffer.uri)) == 8, "Buffer.uri has unexpected size % instead of 8", size_of(type_of(Buffer.uri)));
    assert(((cast(*void)(*instance.data)) - cast(*void)(*instance)) == 24, "Buffer.data has unexpected offset % instead of 24", ((cast(*void)(*instance.data)) - cast(*void)(*instance)));
    assert(size_of(type_of(Buffer.data)) == 8, "Buffer.data has unexpected size % instead of 8", size_of(type_of(Buffer.data)));
    assert(((cast(*void)(*instance.data_free_method)) - cast(*void)(*instance)) == 32, "Buffer.data_free_method has unexpected offset % instead of 32", ((cast(*void)(*instance.data_free_method)) - cast(*void)(*instance)));
    assert(size_of(type_of(Buffer.data_free_method)) == 4, "Buffer.data_free_method has unexpected size % instead of 4", size_of(type_of(Buffer.data_free_method)));
    assert(((cast(*void)(*instance.extras)) - cast(*void)(*instance)) == 40, "Buffer.extras has unexpected offset % instead of 40", ((cast(*void)(*instance.extras)) - cast(*void)(*instance)));
    assert(size_of(type_of(Buffer.extras)) == 16, "Buffer.extras has unexpected size % instead of 16", size_of(type_of(Buffer.extras)));
    assert(((cast(*void)(*instance.extensions_count)) - cast(*void)(*instance)) == 56, "Buffer.extensions_count has unexpected offset % instead of 56", ((cast(*void)(*instance.extensions_count)) - cast(*void)(*instance)));
    assert(size_of(type_of(Buffer.extensions_count)) == 8, "Buffer.extensions_count has unexpected size % instead of 8", size_of(type_of(Buffer.extensions_count)));
    assert(((cast(*void)(*instance.extensions)) - cast(*void)(*instance)) == 64, "Buffer.extensions has unexpected offset % instead of 64", ((cast(*void)(*instance.extensions)) - cast(*void)(*instance)));
    assert(size_of(type_of(Buffer.extensions)) == 8, "Buffer.extensions has unexpected size % instead of 8", size_of(type_of(Buffer.extensions)));
    assert(size_of(Buffer) == 72, "Buffer has size % instead of 72", size_of(Buffer));
}

cgltf_buffer :: Buffer;

Meshopt_Compression_Mode :: enum s32 {
    INVALID    :: 0;
    ATTRIBUTES :: 1;
    TRIANGLES  :: 2;
    INDICES    :: 3;

    cgltf_meshopt_compression_mode_invalid    :: INVALID;
    cgltf_meshopt_compression_mode_attributes :: ATTRIBUTES;
    cgltf_meshopt_compression_mode_triangles  :: TRIANGLES;
    cgltf_meshopt_compression_mode_indices    :: INDICES;
}

cgltf_meshopt_compression_mode :: Meshopt_Compression_Mode;

Meshopt_Compression_Filter :: enum s32 {
    NONE        :: 0;
    OCTAHEDRAL  :: 1;
    QUATERNION  :: 2;
    EXPONENTIAL :: 3;

    cgltf_meshopt_compression_filter_none        :: NONE;
    cgltf_meshopt_compression_filter_octahedral  :: OCTAHEDRAL;
    cgltf_meshopt_compression_filter_quaternion  :: QUATERNION;
    cgltf_meshopt_compression_filter_exponential :: EXPONENTIAL;
}

cgltf_meshopt_compression_filter :: Meshopt_Compression_Filter;

Meshopt_Compression :: struct {
    buffer: *cgltf_buffer;
    offset: cgltf_size;
    size:   cgltf_size;
    stride: cgltf_size;
    count:  cgltf_size;
    mode:   cgltf_meshopt_compression_mode;
    filter: cgltf_meshopt_compression_filter;
}
#run {
    instance: Meshopt_Compression;
    assert(((cast(*void)(*instance.buffer)) - cast(*void)(*instance)) == 0, "Meshopt_Compression.buffer has unexpected offset % instead of 0", ((cast(*void)(*instance.buffer)) - cast(*void)(*instance)));
    assert(size_of(type_of(Meshopt_Compression.buffer)) == 8, "Meshopt_Compression.buffer has unexpected size % instead of 8", size_of(type_of(Meshopt_Compression.buffer)));
    assert(((cast(*void)(*instance.offset)) - cast(*void)(*instance)) == 8, "Meshopt_Compression.offset has unexpected offset % instead of 8", ((cast(*void)(*instance.offset)) - cast(*void)(*instance)));
    assert(size_of(type_of(Meshopt_Compression.offset)) == 8, "Meshopt_Compression.offset has unexpected size % instead of 8", size_of(type_of(Meshopt_Compression.offset)));
    assert(((cast(*void)(*instance.size)) - cast(*void)(*instance)) == 16, "Meshopt_Compression.size has unexpected offset % instead of 16", ((cast(*void)(*instance.size)) - cast(*void)(*instance)));
    assert(size_of(type_of(Meshopt_Compression.size)) == 8, "Meshopt_Compression.size has unexpected size % instead of 8", size_of(type_of(Meshopt_Compression.size)));
    assert(((cast(*void)(*instance.stride)) - cast(*void)(*instance)) == 24, "Meshopt_Compression.stride has unexpected offset % instead of 24", ((cast(*void)(*instance.stride)) - cast(*void)(*instance)));
    assert(size_of(type_of(Meshopt_Compression.stride)) == 8, "Meshopt_Compression.stride has unexpected size % instead of 8", size_of(type_of(Meshopt_Compression.stride)));
    assert(((cast(*void)(*instance.count)) - cast(*void)(*instance)) == 32, "Meshopt_Compression.count has unexpected offset % instead of 32", ((cast(*void)(*instance.count)) - cast(*void)(*instance)));
    assert(size_of(type_of(Meshopt_Compression.count)) == 8, "Meshopt_Compression.count has unexpected size % instead of 8", size_of(type_of(Meshopt_Compression.count)));
    assert(((cast(*void)(*instance.mode)) - cast(*void)(*instance)) == 40, "Meshopt_Compression.mode has unexpected offset % instead of 40", ((cast(*void)(*instance.mode)) - cast(*void)(*instance)));
    assert(size_of(type_of(Meshopt_Compression.mode)) == 4, "Meshopt_Compression.mode has unexpected size % instead of 4", size_of(type_of(Meshopt_Compression.mode)));
    assert(((cast(*void)(*instance.filter)) - cast(*void)(*instance)) == 44, "Meshopt_Compression.filter has unexpected offset % instead of 44", ((cast(*void)(*instance.filter)) - cast(*void)(*instance)));
    assert(size_of(type_of(Meshopt_Compression.filter)) == 4, "Meshopt_Compression.filter has unexpected size % instead of 4", size_of(type_of(Meshopt_Compression.filter)));
    assert(size_of(Meshopt_Compression) == 48, "Meshopt_Compression has size % instead of 48", size_of(Meshopt_Compression));
}

cgltf_meshopt_compression :: Meshopt_Compression;

Buffer_View :: struct {
    name:                    *u8;
    buffer:                  *cgltf_buffer;
    offset:                  cgltf_size;
    size:                    cgltf_size;
    stride:                  cgltf_size; /* 0 == automatically determined by accessor */
    type:                    cgltf_buffer_view_type;
    data:                    *void; /* overrides buffer->data if present, filled by extensions */
    has_meshopt_compression: cgltf_bool;
    meshopt_compression:     cgltf_meshopt_compression;
    extras:                  cgltf_extras;
    extensions_count:        cgltf_size;
    extensions:              *cgltf_extension;
}
#run {
    instance: Buffer_View;
    assert(((cast(*void)(*instance.name)) - cast(*void)(*instance)) == 0, "Buffer_View.name has unexpected offset % instead of 0", ((cast(*void)(*instance.name)) - cast(*void)(*instance)));
    assert(size_of(type_of(Buffer_View.name)) == 8, "Buffer_View.name has unexpected size % instead of 8", size_of(type_of(Buffer_View.name)));
    assert(((cast(*void)(*instance.buffer)) - cast(*void)(*instance)) == 8, "Buffer_View.buffer has unexpected offset % instead of 8", ((cast(*void)(*instance.buffer)) - cast(*void)(*instance)));
    assert(size_of(type_of(Buffer_View.buffer)) == 8, "Buffer_View.buffer has unexpected size % instead of 8", size_of(type_of(Buffer_View.buffer)));
    assert(((cast(*void)(*instance.offset)) - cast(*void)(*instance)) == 16, "Buffer_View.offset has unexpected offset % instead of 16", ((cast(*void)(*instance.offset)) - cast(*void)(*instance)));
    assert(size_of(type_of(Buffer_View.offset)) == 8, "Buffer_View.offset has unexpected size % instead of 8", size_of(type_of(Buffer_View.offset)));
    assert(((cast(*void)(*instance.size)) - cast(*void)(*instance)) == 24, "Buffer_View.size has unexpected offset % instead of 24", ((cast(*void)(*instance.size)) - cast(*void)(*instance)));
    assert(size_of(type_of(Buffer_View.size)) == 8, "Buffer_View.size has unexpected size % instead of 8", size_of(type_of(Buffer_View.size)));
    assert(((cast(*void)(*instance.stride)) - cast(*void)(*instance)) == 32, "Buffer_View.stride has unexpected offset % instead of 32", ((cast(*void)(*instance.stride)) - cast(*void)(*instance)));
    assert(size_of(type_of(Buffer_View.stride)) == 8, "Buffer_View.stride has unexpected size % instead of 8", size_of(type_of(Buffer_View.stride)));
    assert(((cast(*void)(*instance.type)) - cast(*void)(*instance)) == 40, "Buffer_View.type has unexpected offset % instead of 40", ((cast(*void)(*instance.type)) - cast(*void)(*instance)));
    assert(size_of(type_of(Buffer_View.type)) == 4, "Buffer_View.type has unexpected size % instead of 4", size_of(type_of(Buffer_View.type)));
    assert(((cast(*void)(*instance.data)) - cast(*void)(*instance)) == 48, "Buffer_View.data has unexpected offset % instead of 48", ((cast(*void)(*instance.data)) - cast(*void)(*instance)));
    assert(size_of(type_of(Buffer_View.data)) == 8, "Buffer_View.data has unexpected size % instead of 8", size_of(type_of(Buffer_View.data)));
    assert(((cast(*void)(*instance.has_meshopt_compression)) - cast(*void)(*instance)) == 56, "Buffer_View.has_meshopt_compression has unexpected offset % instead of 56", ((cast(*void)(*instance.has_meshopt_compression)) - cast(*void)(*instance)));
    assert(size_of(type_of(Buffer_View.has_meshopt_compression)) == 4, "Buffer_View.has_meshopt_compression has unexpected size % instead of 4", size_of(type_of(Buffer_View.has_meshopt_compression)));
    assert(((cast(*void)(*instance.meshopt_compression)) - cast(*void)(*instance)) == 64, "Buffer_View.meshopt_compression has unexpected offset % instead of 64", ((cast(*void)(*instance.meshopt_compression)) - cast(*void)(*instance)));
    assert(size_of(type_of(Buffer_View.meshopt_compression)) == 48, "Buffer_View.meshopt_compression has unexpected size % instead of 48", size_of(type_of(Buffer_View.meshopt_compression)));
    assert(((cast(*void)(*instance.extras)) - cast(*void)(*instance)) == 112, "Buffer_View.extras has unexpected offset % instead of 112", ((cast(*void)(*instance.extras)) - cast(*void)(*instance)));
    assert(size_of(type_of(Buffer_View.extras)) == 16, "Buffer_View.extras has unexpected size % instead of 16", size_of(type_of(Buffer_View.extras)));
    assert(((cast(*void)(*instance.extensions_count)) - cast(*void)(*instance)) == 128, "Buffer_View.extensions_count has unexpected offset % instead of 128", ((cast(*void)(*instance.extensions_count)) - cast(*void)(*instance)));
    assert(size_of(type_of(Buffer_View.extensions_count)) == 8, "Buffer_View.extensions_count has unexpected size % instead of 8", size_of(type_of(Buffer_View.extensions_count)));
    assert(((cast(*void)(*instance.extensions)) - cast(*void)(*instance)) == 136, "Buffer_View.extensions has unexpected offset % instead of 136", ((cast(*void)(*instance.extensions)) - cast(*void)(*instance)));
    assert(size_of(type_of(Buffer_View.extensions)) == 8, "Buffer_View.extensions has unexpected size % instead of 8", size_of(type_of(Buffer_View.extensions)));
    assert(size_of(Buffer_View) == 144, "Buffer_View has size % instead of 144", size_of(Buffer_View));
}

cgltf_buffer_view :: Buffer_View;

Accessor_Sparse :: struct {
    count:                    cgltf_size;
    indices_buffer_view:      *cgltf_buffer_view;
    indices_byte_offset:      cgltf_size;
    indices_component_type:   cgltf_component_type;
    values_buffer_view:       *cgltf_buffer_view;
    values_byte_offset:       cgltf_size;
    extras:                   cgltf_extras;
    indices_extras:           cgltf_extras;
    values_extras:            cgltf_extras;
    extensions_count:         cgltf_size;
    extensions:               *cgltf_extension;
    indices_extensions_count: cgltf_size;
    indices_extensions:       *cgltf_extension;
    values_extensions_count:  cgltf_size;
    values_extensions:        *cgltf_extension;
}
#run {
    instance: Accessor_Sparse;
    assert(((cast(*void)(*instance.count)) - cast(*void)(*instance)) == 0, "Accessor_Sparse.count has unexpected offset % instead of 0", ((cast(*void)(*instance.count)) - cast(*void)(*instance)));
    assert(size_of(type_of(Accessor_Sparse.count)) == 8, "Accessor_Sparse.count has unexpected size % instead of 8", size_of(type_of(Accessor_Sparse.count)));
    assert(((cast(*void)(*instance.indices_buffer_view)) - cast(*void)(*instance)) == 8, "Accessor_Sparse.indices_buffer_view has unexpected offset % instead of 8", ((cast(*void)(*instance.indices_buffer_view)) - cast(*void)(*instance)));
    assert(size_of(type_of(Accessor_Sparse.indices_buffer_view)) == 8, "Accessor_Sparse.indices_buffer_view has unexpected size % instead of 8", size_of(type_of(Accessor_Sparse.indices_buffer_view)));
    assert(((cast(*void)(*instance.indices_byte_offset)) - cast(*void)(*instance)) == 16, "Accessor_Sparse.indices_byte_offset has unexpected offset % instead of 16", ((cast(*void)(*instance.indices_byte_offset)) - cast(*void)(*instance)));
    assert(size_of(type_of(Accessor_Sparse.indices_byte_offset)) == 8, "Accessor_Sparse.indices_byte_offset has unexpected size % instead of 8", size_of(type_of(Accessor_Sparse.indices_byte_offset)));
    assert(((cast(*void)(*instance.indices_component_type)) - cast(*void)(*instance)) == 24, "Accessor_Sparse.indices_component_type has unexpected offset % instead of 24", ((cast(*void)(*instance.indices_component_type)) - cast(*void)(*instance)));
    assert(size_of(type_of(Accessor_Sparse.indices_component_type)) == 4, "Accessor_Sparse.indices_component_type has unexpected size % instead of 4", size_of(type_of(Accessor_Sparse.indices_component_type)));
    assert(((cast(*void)(*instance.values_buffer_view)) - cast(*void)(*instance)) == 32, "Accessor_Sparse.values_buffer_view has unexpected offset % instead of 32", ((cast(*void)(*instance.values_buffer_view)) - cast(*void)(*instance)));
    assert(size_of(type_of(Accessor_Sparse.values_buffer_view)) == 8, "Accessor_Sparse.values_buffer_view has unexpected size % instead of 8", size_of(type_of(Accessor_Sparse.values_buffer_view)));
    assert(((cast(*void)(*instance.values_byte_offset)) - cast(*void)(*instance)) == 40, "Accessor_Sparse.values_byte_offset has unexpected offset % instead of 40", ((cast(*void)(*instance.values_byte_offset)) - cast(*void)(*instance)));
    assert(size_of(type_of(Accessor_Sparse.values_byte_offset)) == 8, "Accessor_Sparse.values_byte_offset has unexpected size % instead of 8", size_of(type_of(Accessor_Sparse.values_byte_offset)));
    assert(((cast(*void)(*instance.extras)) - cast(*void)(*instance)) == 48, "Accessor_Sparse.extras has unexpected offset % instead of 48", ((cast(*void)(*instance.extras)) - cast(*void)(*instance)));
    assert(size_of(type_of(Accessor_Sparse.extras)) == 16, "Accessor_Sparse.extras has unexpected size % instead of 16", size_of(type_of(Accessor_Sparse.extras)));
    assert(((cast(*void)(*instance.indices_extras)) - cast(*void)(*instance)) == 64, "Accessor_Sparse.indices_extras has unexpected offset % instead of 64", ((cast(*void)(*instance.indices_extras)) - cast(*void)(*instance)));
    assert(size_of(type_of(Accessor_Sparse.indices_extras)) == 16, "Accessor_Sparse.indices_extras has unexpected size % instead of 16", size_of(type_of(Accessor_Sparse.indices_extras)));
    assert(((cast(*void)(*instance.values_extras)) - cast(*void)(*instance)) == 80, "Accessor_Sparse.values_extras has unexpected offset % instead of 80", ((cast(*void)(*instance.values_extras)) - cast(*void)(*instance)));
    assert(size_of(type_of(Accessor_Sparse.values_extras)) == 16, "Accessor_Sparse.values_extras has unexpected size % instead of 16", size_of(type_of(Accessor_Sparse.values_extras)));
    assert(((cast(*void)(*instance.extensions_count)) - cast(*void)(*instance)) == 96, "Accessor_Sparse.extensions_count has unexpected offset % instead of 96", ((cast(*void)(*instance.extensions_count)) - cast(*void)(*instance)));
    assert(size_of(type_of(Accessor_Sparse.extensions_count)) == 8, "Accessor_Sparse.extensions_count has unexpected size % instead of 8", size_of(type_of(Accessor_Sparse.extensions_count)));
    assert(((cast(*void)(*instance.extensions)) - cast(*void)(*instance)) == 104, "Accessor_Sparse.extensions has unexpected offset % instead of 104", ((cast(*void)(*instance.extensions)) - cast(*void)(*instance)));
    assert(size_of(type_of(Accessor_Sparse.extensions)) == 8, "Accessor_Sparse.extensions has unexpected size % instead of 8", size_of(type_of(Accessor_Sparse.extensions)));
    assert(((cast(*void)(*instance.indices_extensions_count)) - cast(*void)(*instance)) == 112, "Accessor_Sparse.indices_extensions_count has unexpected offset % instead of 112", ((cast(*void)(*instance.indices_extensions_count)) - cast(*void)(*instance)));
    assert(size_of(type_of(Accessor_Sparse.indices_extensions_count)) == 8, "Accessor_Sparse.indices_extensions_count has unexpected size % instead of 8", size_of(type_of(Accessor_Sparse.indices_extensions_count)));
    assert(((cast(*void)(*instance.indices_extensions)) - cast(*void)(*instance)) == 120, "Accessor_Sparse.indices_extensions has unexpected offset % instead of 120", ((cast(*void)(*instance.indices_extensions)) - cast(*void)(*instance)));
    assert(size_of(type_of(Accessor_Sparse.indices_extensions)) == 8, "Accessor_Sparse.indices_extensions has unexpected size % instead of 8", size_of(type_of(Accessor_Sparse.indices_extensions)));
    assert(((cast(*void)(*instance.values_extensions_count)) - cast(*void)(*instance)) == 128, "Accessor_Sparse.values_extensions_count has unexpected offset % instead of 128", ((cast(*void)(*instance.values_extensions_count)) - cast(*void)(*instance)));
    assert(size_of(type_of(Accessor_Sparse.values_extensions_count)) == 8, "Accessor_Sparse.values_extensions_count has unexpected size % instead of 8", size_of(type_of(Accessor_Sparse.values_extensions_count)));
    assert(((cast(*void)(*instance.values_extensions)) - cast(*void)(*instance)) == 136, "Accessor_Sparse.values_extensions has unexpected offset % instead of 136", ((cast(*void)(*instance.values_extensions)) - cast(*void)(*instance)));
    assert(size_of(type_of(Accessor_Sparse.values_extensions)) == 8, "Accessor_Sparse.values_extensions has unexpected size % instead of 8", size_of(type_of(Accessor_Sparse.values_extensions)));
    assert(size_of(Accessor_Sparse) == 144, "Accessor_Sparse has size % instead of 144", size_of(Accessor_Sparse));
}

cgltf_accessor_sparse :: Accessor_Sparse;

Accessor :: struct {
    name:             *u8;
    component_type:   cgltf_component_type;
    normalized:       cgltf_bool;
    type:             cgltf_type;
    offset:           cgltf_size;
    count:            cgltf_size;
    stride:           cgltf_size;
    buffer_view:      *cgltf_buffer_view;
    has_min:          cgltf_bool;
    min:              [16] cgltf_float;
    has_max:          cgltf_bool;
    max:              [16] cgltf_float;
    is_sparse:        cgltf_bool;
    sparse:           cgltf_accessor_sparse;
    extras:           cgltf_extras;
    extensions_count: cgltf_size;
    extensions:       *cgltf_extension;
}
#run {
    instance: Accessor;
    assert(((cast(*void)(*instance.name)) - cast(*void)(*instance)) == 0, "Accessor.name has unexpected offset % instead of 0", ((cast(*void)(*instance.name)) - cast(*void)(*instance)));
    assert(size_of(type_of(Accessor.name)) == 8, "Accessor.name has unexpected size % instead of 8", size_of(type_of(Accessor.name)));
    assert(((cast(*void)(*instance.component_type)) - cast(*void)(*instance)) == 8, "Accessor.component_type has unexpected offset % instead of 8", ((cast(*void)(*instance.component_type)) - cast(*void)(*instance)));
    assert(size_of(type_of(Accessor.component_type)) == 4, "Accessor.component_type has unexpected size % instead of 4", size_of(type_of(Accessor.component_type)));
    assert(((cast(*void)(*instance.normalized)) - cast(*void)(*instance)) == 12, "Accessor.normalized has unexpected offset % instead of 12", ((cast(*void)(*instance.normalized)) - cast(*void)(*instance)));
    assert(size_of(type_of(Accessor.normalized)) == 4, "Accessor.normalized has unexpected size % instead of 4", size_of(type_of(Accessor.normalized)));
    assert(((cast(*void)(*instance.type)) - cast(*void)(*instance)) == 16, "Accessor.type has unexpected offset % instead of 16", ((cast(*void)(*instance.type)) - cast(*void)(*instance)));
    assert(size_of(type_of(Accessor.type)) == 4, "Accessor.type has unexpected size % instead of 4", size_of(type_of(Accessor.type)));
    assert(((cast(*void)(*instance.offset)) - cast(*void)(*instance)) == 24, "Accessor.offset has unexpected offset % instead of 24", ((cast(*void)(*instance.offset)) - cast(*void)(*instance)));
    assert(size_of(type_of(Accessor.offset)) == 8, "Accessor.offset has unexpected size % instead of 8", size_of(type_of(Accessor.offset)));
    assert(((cast(*void)(*instance.count)) - cast(*void)(*instance)) == 32, "Accessor.count has unexpected offset % instead of 32", ((cast(*void)(*instance.count)) - cast(*void)(*instance)));
    assert(size_of(type_of(Accessor.count)) == 8, "Accessor.count has unexpected size % instead of 8", size_of(type_of(Accessor.count)));
    assert(((cast(*void)(*instance.stride)) - cast(*void)(*instance)) == 40, "Accessor.stride has unexpected offset % instead of 40", ((cast(*void)(*instance.stride)) - cast(*void)(*instance)));
    assert(size_of(type_of(Accessor.stride)) == 8, "Accessor.stride has unexpected size % instead of 8", size_of(type_of(Accessor.stride)));
    assert(((cast(*void)(*instance.buffer_view)) - cast(*void)(*instance)) == 48, "Accessor.buffer_view has unexpected offset % instead of 48", ((cast(*void)(*instance.buffer_view)) - cast(*void)(*instance)));
    assert(size_of(type_of(Accessor.buffer_view)) == 8, "Accessor.buffer_view has unexpected size % instead of 8", size_of(type_of(Accessor.buffer_view)));
    assert(((cast(*void)(*instance.has_min)) - cast(*void)(*instance)) == 56, "Accessor.has_min has unexpected offset % instead of 56", ((cast(*void)(*instance.has_min)) - cast(*void)(*instance)));
    assert(size_of(type_of(Accessor.has_min)) == 4, "Accessor.has_min has unexpected size % instead of 4", size_of(type_of(Accessor.has_min)));
    assert(((cast(*void)(*instance.min)) - cast(*void)(*instance)) == 60, "Accessor.min has unexpected offset % instead of 60", ((cast(*void)(*instance.min)) - cast(*void)(*instance)));
    assert(size_of(type_of(Accessor.min)) == 64, "Accessor.min has unexpected size % instead of 64", size_of(type_of(Accessor.min)));
    assert(((cast(*void)(*instance.has_max)) - cast(*void)(*instance)) == 124, "Accessor.has_max has unexpected offset % instead of 124", ((cast(*void)(*instance.has_max)) - cast(*void)(*instance)));
    assert(size_of(type_of(Accessor.has_max)) == 4, "Accessor.has_max has unexpected size % instead of 4", size_of(type_of(Accessor.has_max)));
    assert(((cast(*void)(*instance.max)) - cast(*void)(*instance)) == 128, "Accessor.max has unexpected offset % instead of 128", ((cast(*void)(*instance.max)) - cast(*void)(*instance)));
    assert(size_of(type_of(Accessor.max)) == 64, "Accessor.max has unexpected size % instead of 64", size_of(type_of(Accessor.max)));
    assert(((cast(*void)(*instance.is_sparse)) - cast(*void)(*instance)) == 192, "Accessor.is_sparse has unexpected offset % instead of 192", ((cast(*void)(*instance.is_sparse)) - cast(*void)(*instance)));
    assert(size_of(type_of(Accessor.is_sparse)) == 4, "Accessor.is_sparse has unexpected size % instead of 4", size_of(type_of(Accessor.is_sparse)));
    assert(((cast(*void)(*instance.sparse)) - cast(*void)(*instance)) == 200, "Accessor.sparse has unexpected offset % instead of 200", ((cast(*void)(*instance.sparse)) - cast(*void)(*instance)));
    assert(size_of(type_of(Accessor.sparse)) == 144, "Accessor.sparse has unexpected size % instead of 144", size_of(type_of(Accessor.sparse)));
    assert(((cast(*void)(*instance.extras)) - cast(*void)(*instance)) == 344, "Accessor.extras has unexpected offset % instead of 344", ((cast(*void)(*instance.extras)) - cast(*void)(*instance)));
    assert(size_of(type_of(Accessor.extras)) == 16, "Accessor.extras has unexpected size % instead of 16", size_of(type_of(Accessor.extras)));
    assert(((cast(*void)(*instance.extensions_count)) - cast(*void)(*instance)) == 360, "Accessor.extensions_count has unexpected offset % instead of 360", ((cast(*void)(*instance.extensions_count)) - cast(*void)(*instance)));
    assert(size_of(type_of(Accessor.extensions_count)) == 8, "Accessor.extensions_count has unexpected size % instead of 8", size_of(type_of(Accessor.extensions_count)));
    assert(((cast(*void)(*instance.extensions)) - cast(*void)(*instance)) == 368, "Accessor.extensions has unexpected offset % instead of 368", ((cast(*void)(*instance.extensions)) - cast(*void)(*instance)));
    assert(size_of(type_of(Accessor.extensions)) == 8, "Accessor.extensions has unexpected size % instead of 8", size_of(type_of(Accessor.extensions)));
    assert(size_of(Accessor) == 376, "Accessor has size % instead of 376", size_of(Accessor));
}

cgltf_accessor :: Accessor;

Attribute :: struct {
    name:  *u8;
    type:  cgltf_attribute_type;
    index: cgltf_int;
    data:  *cgltf_accessor;
}
#run {
    instance: Attribute;
    assert(((cast(*void)(*instance.name)) - cast(*void)(*instance)) == 0, "Attribute.name has unexpected offset % instead of 0", ((cast(*void)(*instance.name)) - cast(*void)(*instance)));
    assert(size_of(type_of(Attribute.name)) == 8, "Attribute.name has unexpected size % instead of 8", size_of(type_of(Attribute.name)));
    assert(((cast(*void)(*instance.type)) - cast(*void)(*instance)) == 8, "Attribute.type has unexpected offset % instead of 8", ((cast(*void)(*instance.type)) - cast(*void)(*instance)));
    assert(size_of(type_of(Attribute.type)) == 4, "Attribute.type has unexpected size % instead of 4", size_of(type_of(Attribute.type)));
    assert(((cast(*void)(*instance.index)) - cast(*void)(*instance)) == 12, "Attribute.index has unexpected offset % instead of 12", ((cast(*void)(*instance.index)) - cast(*void)(*instance)));
    assert(size_of(type_of(Attribute.index)) == 4, "Attribute.index has unexpected size % instead of 4", size_of(type_of(Attribute.index)));
    assert(((cast(*void)(*instance.data)) - cast(*void)(*instance)) == 16, "Attribute.data has unexpected offset % instead of 16", ((cast(*void)(*instance.data)) - cast(*void)(*instance)));
    assert(size_of(type_of(Attribute.data)) == 8, "Attribute.data has unexpected size % instead of 8", size_of(type_of(Attribute.data)));
    assert(size_of(Attribute) == 24, "Attribute has size % instead of 24", size_of(Attribute));
}

cgltf_attribute :: Attribute;

Image :: struct {
    name:             *u8;
    uri:              *u8;
    buffer_view:      *cgltf_buffer_view;
    mime_type:        *u8;
    extras:           cgltf_extras;
    extensions_count: cgltf_size;
    extensions:       *cgltf_extension;
}
#run {
    instance: Image;
    assert(((cast(*void)(*instance.name)) - cast(*void)(*instance)) == 0, "Image.name has unexpected offset % instead of 0", ((cast(*void)(*instance.name)) - cast(*void)(*instance)));
    assert(size_of(type_of(Image.name)) == 8, "Image.name has unexpected size % instead of 8", size_of(type_of(Image.name)));
    assert(((cast(*void)(*instance.uri)) - cast(*void)(*instance)) == 8, "Image.uri has unexpected offset % instead of 8", ((cast(*void)(*instance.uri)) - cast(*void)(*instance)));
    assert(size_of(type_of(Image.uri)) == 8, "Image.uri has unexpected size % instead of 8", size_of(type_of(Image.uri)));
    assert(((cast(*void)(*instance.buffer_view)) - cast(*void)(*instance)) == 16, "Image.buffer_view has unexpected offset % instead of 16", ((cast(*void)(*instance.buffer_view)) - cast(*void)(*instance)));
    assert(size_of(type_of(Image.buffer_view)) == 8, "Image.buffer_view has unexpected size % instead of 8", size_of(type_of(Image.buffer_view)));
    assert(((cast(*void)(*instance.mime_type)) - cast(*void)(*instance)) == 24, "Image.mime_type has unexpected offset % instead of 24", ((cast(*void)(*instance.mime_type)) - cast(*void)(*instance)));
    assert(size_of(type_of(Image.mime_type)) == 8, "Image.mime_type has unexpected size % instead of 8", size_of(type_of(Image.mime_type)));
    assert(((cast(*void)(*instance.extras)) - cast(*void)(*instance)) == 32, "Image.extras has unexpected offset % instead of 32", ((cast(*void)(*instance.extras)) - cast(*void)(*instance)));
    assert(size_of(type_of(Image.extras)) == 16, "Image.extras has unexpected size % instead of 16", size_of(type_of(Image.extras)));
    assert(((cast(*void)(*instance.extensions_count)) - cast(*void)(*instance)) == 48, "Image.extensions_count has unexpected offset % instead of 48", ((cast(*void)(*instance.extensions_count)) - cast(*void)(*instance)));
    assert(size_of(type_of(Image.extensions_count)) == 8, "Image.extensions_count has unexpected size % instead of 8", size_of(type_of(Image.extensions_count)));
    assert(((cast(*void)(*instance.extensions)) - cast(*void)(*instance)) == 56, "Image.extensions has unexpected offset % instead of 56", ((cast(*void)(*instance.extensions)) - cast(*void)(*instance)));
    assert(size_of(type_of(Image.extensions)) == 8, "Image.extensions has unexpected size % instead of 8", size_of(type_of(Image.extensions)));
    assert(size_of(Image) == 64, "Image has size % instead of 64", size_of(Image));
}

cgltf_image :: Image;

Sampler :: struct {
    name:             *u8;
    mag_filter:       cgltf_int;
    min_filter:       cgltf_int;
    wrap_s:           cgltf_int;
    wrap_t:           cgltf_int;
    extras:           cgltf_extras;
    extensions_count: cgltf_size;
    extensions:       *cgltf_extension;
}
#run {
    instance: Sampler;
    assert(((cast(*void)(*instance.name)) - cast(*void)(*instance)) == 0, "Sampler.name has unexpected offset % instead of 0", ((cast(*void)(*instance.name)) - cast(*void)(*instance)));
    assert(size_of(type_of(Sampler.name)) == 8, "Sampler.name has unexpected size % instead of 8", size_of(type_of(Sampler.name)));
    assert(((cast(*void)(*instance.mag_filter)) - cast(*void)(*instance)) == 8, "Sampler.mag_filter has unexpected offset % instead of 8", ((cast(*void)(*instance.mag_filter)) - cast(*void)(*instance)));
    assert(size_of(type_of(Sampler.mag_filter)) == 4, "Sampler.mag_filter has unexpected size % instead of 4", size_of(type_of(Sampler.mag_filter)));
    assert(((cast(*void)(*instance.min_filter)) - cast(*void)(*instance)) == 12, "Sampler.min_filter has unexpected offset % instead of 12", ((cast(*void)(*instance.min_filter)) - cast(*void)(*instance)));
    assert(size_of(type_of(Sampler.min_filter)) == 4, "Sampler.min_filter has unexpected size % instead of 4", size_of(type_of(Sampler.min_filter)));
    assert(((cast(*void)(*instance.wrap_s)) - cast(*void)(*instance)) == 16, "Sampler.wrap_s has unexpected offset % instead of 16", ((cast(*void)(*instance.wrap_s)) - cast(*void)(*instance)));
    assert(size_of(type_of(Sampler.wrap_s)) == 4, "Sampler.wrap_s has unexpected size % instead of 4", size_of(type_of(Sampler.wrap_s)));
    assert(((cast(*void)(*instance.wrap_t)) - cast(*void)(*instance)) == 20, "Sampler.wrap_t has unexpected offset % instead of 20", ((cast(*void)(*instance.wrap_t)) - cast(*void)(*instance)));
    assert(size_of(type_of(Sampler.wrap_t)) == 4, "Sampler.wrap_t has unexpected size % instead of 4", size_of(type_of(Sampler.wrap_t)));
    assert(((cast(*void)(*instance.extras)) - cast(*void)(*instance)) == 24, "Sampler.extras has unexpected offset % instead of 24", ((cast(*void)(*instance.extras)) - cast(*void)(*instance)));
    assert(size_of(type_of(Sampler.extras)) == 16, "Sampler.extras has unexpected size % instead of 16", size_of(type_of(Sampler.extras)));
    assert(((cast(*void)(*instance.extensions_count)) - cast(*void)(*instance)) == 40, "Sampler.extensions_count has unexpected offset % instead of 40", ((cast(*void)(*instance.extensions_count)) - cast(*void)(*instance)));
    assert(size_of(type_of(Sampler.extensions_count)) == 8, "Sampler.extensions_count has unexpected size % instead of 8", size_of(type_of(Sampler.extensions_count)));
    assert(((cast(*void)(*instance.extensions)) - cast(*void)(*instance)) == 48, "Sampler.extensions has unexpected offset % instead of 48", ((cast(*void)(*instance.extensions)) - cast(*void)(*instance)));
    assert(size_of(type_of(Sampler.extensions)) == 8, "Sampler.extensions has unexpected size % instead of 8", size_of(type_of(Sampler.extensions)));
    assert(size_of(Sampler) == 56, "Sampler has size % instead of 56", size_of(Sampler));
}

cgltf_sampler :: Sampler;

Texture :: struct {
    name:             *u8;
    image:            *cgltf_image;
    sampler:          *cgltf_sampler;
    has_basisu:       cgltf_bool;
    basisu_image:     *cgltf_image;
    extras:           cgltf_extras;
    extensions_count: cgltf_size;
    extensions:       *cgltf_extension;
}
#run {
    instance: Texture;
    assert(((cast(*void)(*instance.name)) - cast(*void)(*instance)) == 0, "Texture.name has unexpected offset % instead of 0", ((cast(*void)(*instance.name)) - cast(*void)(*instance)));
    assert(size_of(type_of(Texture.name)) == 8, "Texture.name has unexpected size % instead of 8", size_of(type_of(Texture.name)));
    assert(((cast(*void)(*instance.image)) - cast(*void)(*instance)) == 8, "Texture.image has unexpected offset % instead of 8", ((cast(*void)(*instance.image)) - cast(*void)(*instance)));
    assert(size_of(type_of(Texture.image)) == 8, "Texture.image has unexpected size % instead of 8", size_of(type_of(Texture.image)));
    assert(((cast(*void)(*instance.sampler)) - cast(*void)(*instance)) == 16, "Texture.sampler has unexpected offset % instead of 16", ((cast(*void)(*instance.sampler)) - cast(*void)(*instance)));
    assert(size_of(type_of(Texture.sampler)) == 8, "Texture.sampler has unexpected size % instead of 8", size_of(type_of(Texture.sampler)));
    assert(((cast(*void)(*instance.has_basisu)) - cast(*void)(*instance)) == 24, "Texture.has_basisu has unexpected offset % instead of 24", ((cast(*void)(*instance.has_basisu)) - cast(*void)(*instance)));
    assert(size_of(type_of(Texture.has_basisu)) == 4, "Texture.has_basisu has unexpected size % instead of 4", size_of(type_of(Texture.has_basisu)));
    assert(((cast(*void)(*instance.basisu_image)) - cast(*void)(*instance)) == 32, "Texture.basisu_image has unexpected offset % instead of 32", ((cast(*void)(*instance.basisu_image)) - cast(*void)(*instance)));
    assert(size_of(type_of(Texture.basisu_image)) == 8, "Texture.basisu_image has unexpected size % instead of 8", size_of(type_of(Texture.basisu_image)));
    assert(((cast(*void)(*instance.extras)) - cast(*void)(*instance)) == 40, "Texture.extras has unexpected offset % instead of 40", ((cast(*void)(*instance.extras)) - cast(*void)(*instance)));
    assert(size_of(type_of(Texture.extras)) == 16, "Texture.extras has unexpected size % instead of 16", size_of(type_of(Texture.extras)));
    assert(((cast(*void)(*instance.extensions_count)) - cast(*void)(*instance)) == 56, "Texture.extensions_count has unexpected offset % instead of 56", ((cast(*void)(*instance.extensions_count)) - cast(*void)(*instance)));
    assert(size_of(type_of(Texture.extensions_count)) == 8, "Texture.extensions_count has unexpected size % instead of 8", size_of(type_of(Texture.extensions_count)));
    assert(((cast(*void)(*instance.extensions)) - cast(*void)(*instance)) == 64, "Texture.extensions has unexpected offset % instead of 64", ((cast(*void)(*instance.extensions)) - cast(*void)(*instance)));
    assert(size_of(type_of(Texture.extensions)) == 8, "Texture.extensions has unexpected size % instead of 8", size_of(type_of(Texture.extensions)));
    assert(size_of(Texture) == 72, "Texture has size % instead of 72", size_of(Texture));
}

cgltf_texture :: Texture;

Texture_Transform :: struct {
    offset:       [2] cgltf_float;
    rotation:     cgltf_float;
    scale:        [2] cgltf_float;
    has_texcoord: cgltf_bool;
    texcoord:     cgltf_int;
}
#run {
    instance: Texture_Transform;
    assert(((cast(*void)(*instance.offset)) - cast(*void)(*instance)) == 0, "Texture_Transform.offset has unexpected offset % instead of 0", ((cast(*void)(*instance.offset)) - cast(*void)(*instance)));
    assert(size_of(type_of(Texture_Transform.offset)) == 8, "Texture_Transform.offset has unexpected size % instead of 8", size_of(type_of(Texture_Transform.offset)));
    assert(((cast(*void)(*instance.rotation)) - cast(*void)(*instance)) == 8, "Texture_Transform.rotation has unexpected offset % instead of 8", ((cast(*void)(*instance.rotation)) - cast(*void)(*instance)));
    assert(size_of(type_of(Texture_Transform.rotation)) == 4, "Texture_Transform.rotation has unexpected size % instead of 4", size_of(type_of(Texture_Transform.rotation)));
    assert(((cast(*void)(*instance.scale)) - cast(*void)(*instance)) == 12, "Texture_Transform.scale has unexpected offset % instead of 12", ((cast(*void)(*instance.scale)) - cast(*void)(*instance)));
    assert(size_of(type_of(Texture_Transform.scale)) == 8, "Texture_Transform.scale has unexpected size % instead of 8", size_of(type_of(Texture_Transform.scale)));
    assert(((cast(*void)(*instance.has_texcoord)) - cast(*void)(*instance)) == 20, "Texture_Transform.has_texcoord has unexpected offset % instead of 20", ((cast(*void)(*instance.has_texcoord)) - cast(*void)(*instance)));
    assert(size_of(type_of(Texture_Transform.has_texcoord)) == 4, "Texture_Transform.has_texcoord has unexpected size % instead of 4", size_of(type_of(Texture_Transform.has_texcoord)));
    assert(((cast(*void)(*instance.texcoord)) - cast(*void)(*instance)) == 24, "Texture_Transform.texcoord has unexpected offset % instead of 24", ((cast(*void)(*instance.texcoord)) - cast(*void)(*instance)));
    assert(size_of(type_of(Texture_Transform.texcoord)) == 4, "Texture_Transform.texcoord has unexpected size % instead of 4", size_of(type_of(Texture_Transform.texcoord)));
    assert(size_of(Texture_Transform) == 28, "Texture_Transform has size % instead of 28", size_of(Texture_Transform));
}

cgltf_texture_transform :: Texture_Transform;

Texture_View :: struct {
    texture:          *cgltf_texture;
    texcoord:         cgltf_int;
    scale:            cgltf_float; /* equivalent to strength for occlusion_texture */
    has_transform:    cgltf_bool;
    transform:        cgltf_texture_transform;
    extras:           cgltf_extras;
    extensions_count: cgltf_size;
    extensions:       *cgltf_extension;
}
#run {
    instance: Texture_View;
    assert(((cast(*void)(*instance.texture)) - cast(*void)(*instance)) == 0, "Texture_View.texture has unexpected offset % instead of 0", ((cast(*void)(*instance.texture)) - cast(*void)(*instance)));
    assert(size_of(type_of(Texture_View.texture)) == 8, "Texture_View.texture has unexpected size % instead of 8", size_of(type_of(Texture_View.texture)));
    assert(((cast(*void)(*instance.texcoord)) - cast(*void)(*instance)) == 8, "Texture_View.texcoord has unexpected offset % instead of 8", ((cast(*void)(*instance.texcoord)) - cast(*void)(*instance)));
    assert(size_of(type_of(Texture_View.texcoord)) == 4, "Texture_View.texcoord has unexpected size % instead of 4", size_of(type_of(Texture_View.texcoord)));
    assert(((cast(*void)(*instance.scale)) - cast(*void)(*instance)) == 12, "Texture_View.scale has unexpected offset % instead of 12", ((cast(*void)(*instance.scale)) - cast(*void)(*instance)));
    assert(size_of(type_of(Texture_View.scale)) == 4, "Texture_View.scale has unexpected size % instead of 4", size_of(type_of(Texture_View.scale)));
    assert(((cast(*void)(*instance.has_transform)) - cast(*void)(*instance)) == 16, "Texture_View.has_transform has unexpected offset % instead of 16", ((cast(*void)(*instance.has_transform)) - cast(*void)(*instance)));
    assert(size_of(type_of(Texture_View.has_transform)) == 4, "Texture_View.has_transform has unexpected size % instead of 4", size_of(type_of(Texture_View.has_transform)));
    assert(((cast(*void)(*instance.transform)) - cast(*void)(*instance)) == 20, "Texture_View.transform has unexpected offset % instead of 20", ((cast(*void)(*instance.transform)) - cast(*void)(*instance)));
    assert(size_of(type_of(Texture_View.transform)) == 28, "Texture_View.transform has unexpected size % instead of 28", size_of(type_of(Texture_View.transform)));
    assert(((cast(*void)(*instance.extras)) - cast(*void)(*instance)) == 48, "Texture_View.extras has unexpected offset % instead of 48", ((cast(*void)(*instance.extras)) - cast(*void)(*instance)));
    assert(size_of(type_of(Texture_View.extras)) == 16, "Texture_View.extras has unexpected size % instead of 16", size_of(type_of(Texture_View.extras)));
    assert(((cast(*void)(*instance.extensions_count)) - cast(*void)(*instance)) == 64, "Texture_View.extensions_count has unexpected offset % instead of 64", ((cast(*void)(*instance.extensions_count)) - cast(*void)(*instance)));
    assert(size_of(type_of(Texture_View.extensions_count)) == 8, "Texture_View.extensions_count has unexpected size % instead of 8", size_of(type_of(Texture_View.extensions_count)));
    assert(((cast(*void)(*instance.extensions)) - cast(*void)(*instance)) == 72, "Texture_View.extensions has unexpected offset % instead of 72", ((cast(*void)(*instance.extensions)) - cast(*void)(*instance)));
    assert(size_of(type_of(Texture_View.extensions)) == 8, "Texture_View.extensions has unexpected size % instead of 8", size_of(type_of(Texture_View.extensions)));
    assert(size_of(Texture_View) == 80, "Texture_View has size % instead of 80", size_of(Texture_View));
}

cgltf_texture_view :: Texture_View;

Pbr_Metallic_Roughness :: struct {
    base_color_texture:         cgltf_texture_view;
    metallic_roughness_texture: cgltf_texture_view;

    base_color_factor:          [4] cgltf_float;
    metallic_factor:            cgltf_float;
    roughness_factor:           cgltf_float;

    extras:                     cgltf_extras;
}
#run {
    instance: Pbr_Metallic_Roughness;
    assert(((cast(*void)(*instance.base_color_texture)) - cast(*void)(*instance)) == 0, "Pbr_Metallic_Roughness.base_color_texture has unexpected offset % instead of 0", ((cast(*void)(*instance.base_color_texture)) - cast(*void)(*instance)));
    assert(size_of(type_of(Pbr_Metallic_Roughness.base_color_texture)) == 80, "Pbr_Metallic_Roughness.base_color_texture has unexpected size % instead of 80", size_of(type_of(Pbr_Metallic_Roughness.base_color_texture)));
    assert(((cast(*void)(*instance.metallic_roughness_texture)) - cast(*void)(*instance)) == 80, "Pbr_Metallic_Roughness.metallic_roughness_texture has unexpected offset % instead of 80", ((cast(*void)(*instance.metallic_roughness_texture)) - cast(*void)(*instance)));
    assert(size_of(type_of(Pbr_Metallic_Roughness.metallic_roughness_texture)) == 80, "Pbr_Metallic_Roughness.metallic_roughness_texture has unexpected size % instead of 80", size_of(type_of(Pbr_Metallic_Roughness.metallic_roughness_texture)));
    assert(((cast(*void)(*instance.base_color_factor)) - cast(*void)(*instance)) == 160, "Pbr_Metallic_Roughness.base_color_factor has unexpected offset % instead of 160", ((cast(*void)(*instance.base_color_factor)) - cast(*void)(*instance)));
    assert(size_of(type_of(Pbr_Metallic_Roughness.base_color_factor)) == 16, "Pbr_Metallic_Roughness.base_color_factor has unexpected size % instead of 16", size_of(type_of(Pbr_Metallic_Roughness.base_color_factor)));
    assert(((cast(*void)(*instance.metallic_factor)) - cast(*void)(*instance)) == 176, "Pbr_Metallic_Roughness.metallic_factor has unexpected offset % instead of 176", ((cast(*void)(*instance.metallic_factor)) - cast(*void)(*instance)));
    assert(size_of(type_of(Pbr_Metallic_Roughness.metallic_factor)) == 4, "Pbr_Metallic_Roughness.metallic_factor has unexpected size % instead of 4", size_of(type_of(Pbr_Metallic_Roughness.metallic_factor)));
    assert(((cast(*void)(*instance.roughness_factor)) - cast(*void)(*instance)) == 180, "Pbr_Metallic_Roughness.roughness_factor has unexpected offset % instead of 180", ((cast(*void)(*instance.roughness_factor)) - cast(*void)(*instance)));
    assert(size_of(type_of(Pbr_Metallic_Roughness.roughness_factor)) == 4, "Pbr_Metallic_Roughness.roughness_factor has unexpected size % instead of 4", size_of(type_of(Pbr_Metallic_Roughness.roughness_factor)));
    assert(((cast(*void)(*instance.extras)) - cast(*void)(*instance)) == 184, "Pbr_Metallic_Roughness.extras has unexpected offset % instead of 184", ((cast(*void)(*instance.extras)) - cast(*void)(*instance)));
    assert(size_of(type_of(Pbr_Metallic_Roughness.extras)) == 16, "Pbr_Metallic_Roughness.extras has unexpected size % instead of 16", size_of(type_of(Pbr_Metallic_Roughness.extras)));
    assert(size_of(Pbr_Metallic_Roughness) == 200, "Pbr_Metallic_Roughness has size % instead of 200", size_of(Pbr_Metallic_Roughness));
}

cgltf_pbr_metallic_roughness :: Pbr_Metallic_Roughness;

Pbr_Specular_Glossiness :: struct {
    diffuse_texture:             cgltf_texture_view;
    specular_glossiness_texture: cgltf_texture_view;

    diffuse_factor:              [4] cgltf_float;
    specular_factor:             [3] cgltf_float;
    glossiness_factor:           cgltf_float;
}
#run {
    instance: Pbr_Specular_Glossiness;
    assert(((cast(*void)(*instance.diffuse_texture)) - cast(*void)(*instance)) == 0, "Pbr_Specular_Glossiness.diffuse_texture has unexpected offset % instead of 0", ((cast(*void)(*instance.diffuse_texture)) - cast(*void)(*instance)));
    assert(size_of(type_of(Pbr_Specular_Glossiness.diffuse_texture)) == 80, "Pbr_Specular_Glossiness.diffuse_texture has unexpected size % instead of 80", size_of(type_of(Pbr_Specular_Glossiness.diffuse_texture)));
    assert(((cast(*void)(*instance.specular_glossiness_texture)) - cast(*void)(*instance)) == 80, "Pbr_Specular_Glossiness.specular_glossiness_texture has unexpected offset % instead of 80", ((cast(*void)(*instance.specular_glossiness_texture)) - cast(*void)(*instance)));
    assert(size_of(type_of(Pbr_Specular_Glossiness.specular_glossiness_texture)) == 80, "Pbr_Specular_Glossiness.specular_glossiness_texture has unexpected size % instead of 80", size_of(type_of(Pbr_Specular_Glossiness.specular_glossiness_texture)));
    assert(((cast(*void)(*instance.diffuse_factor)) - cast(*void)(*instance)) == 160, "Pbr_Specular_Glossiness.diffuse_factor has unexpected offset % instead of 160", ((cast(*void)(*instance.diffuse_factor)) - cast(*void)(*instance)));
    assert(size_of(type_of(Pbr_Specular_Glossiness.diffuse_factor)) == 16, "Pbr_Specular_Glossiness.diffuse_factor has unexpected size % instead of 16", size_of(type_of(Pbr_Specular_Glossiness.diffuse_factor)));
    assert(((cast(*void)(*instance.specular_factor)) - cast(*void)(*instance)) == 176, "Pbr_Specular_Glossiness.specular_factor has unexpected offset % instead of 176", ((cast(*void)(*instance.specular_factor)) - cast(*void)(*instance)));
    assert(size_of(type_of(Pbr_Specular_Glossiness.specular_factor)) == 12, "Pbr_Specular_Glossiness.specular_factor has unexpected size % instead of 12", size_of(type_of(Pbr_Specular_Glossiness.specular_factor)));
    assert(((cast(*void)(*instance.glossiness_factor)) - cast(*void)(*instance)) == 188, "Pbr_Specular_Glossiness.glossiness_factor has unexpected offset % instead of 188", ((cast(*void)(*instance.glossiness_factor)) - cast(*void)(*instance)));
    assert(size_of(type_of(Pbr_Specular_Glossiness.glossiness_factor)) == 4, "Pbr_Specular_Glossiness.glossiness_factor has unexpected size % instead of 4", size_of(type_of(Pbr_Specular_Glossiness.glossiness_factor)));
    assert(size_of(Pbr_Specular_Glossiness) == 192, "Pbr_Specular_Glossiness has size % instead of 192", size_of(Pbr_Specular_Glossiness));
}

cgltf_pbr_specular_glossiness :: Pbr_Specular_Glossiness;

Clearcoat :: struct {
    clearcoat_texture:           cgltf_texture_view;
    clearcoat_roughness_texture: cgltf_texture_view;
    clearcoat_normal_texture:    cgltf_texture_view;

    clearcoat_factor:            cgltf_float;
    clearcoat_roughness_factor:  cgltf_float;
}
#run {
    instance: Clearcoat;
    assert(((cast(*void)(*instance.clearcoat_texture)) - cast(*void)(*instance)) == 0, "Clearcoat.clearcoat_texture has unexpected offset % instead of 0", ((cast(*void)(*instance.clearcoat_texture)) - cast(*void)(*instance)));
    assert(size_of(type_of(Clearcoat.clearcoat_texture)) == 80, "Clearcoat.clearcoat_texture has unexpected size % instead of 80", size_of(type_of(Clearcoat.clearcoat_texture)));
    assert(((cast(*void)(*instance.clearcoat_roughness_texture)) - cast(*void)(*instance)) == 80, "Clearcoat.clearcoat_roughness_texture has unexpected offset % instead of 80", ((cast(*void)(*instance.clearcoat_roughness_texture)) - cast(*void)(*instance)));
    assert(size_of(type_of(Clearcoat.clearcoat_roughness_texture)) == 80, "Clearcoat.clearcoat_roughness_texture has unexpected size % instead of 80", size_of(type_of(Clearcoat.clearcoat_roughness_texture)));
    assert(((cast(*void)(*instance.clearcoat_normal_texture)) - cast(*void)(*instance)) == 160, "Clearcoat.clearcoat_normal_texture has unexpected offset % instead of 160", ((cast(*void)(*instance.clearcoat_normal_texture)) - cast(*void)(*instance)));
    assert(size_of(type_of(Clearcoat.clearcoat_normal_texture)) == 80, "Clearcoat.clearcoat_normal_texture has unexpected size % instead of 80", size_of(type_of(Clearcoat.clearcoat_normal_texture)));
    assert(((cast(*void)(*instance.clearcoat_factor)) - cast(*void)(*instance)) == 240, "Clearcoat.clearcoat_factor has unexpected offset % instead of 240", ((cast(*void)(*instance.clearcoat_factor)) - cast(*void)(*instance)));
    assert(size_of(type_of(Clearcoat.clearcoat_factor)) == 4, "Clearcoat.clearcoat_factor has unexpected size % instead of 4", size_of(type_of(Clearcoat.clearcoat_factor)));
    assert(((cast(*void)(*instance.clearcoat_roughness_factor)) - cast(*void)(*instance)) == 244, "Clearcoat.clearcoat_roughness_factor has unexpected offset % instead of 244", ((cast(*void)(*instance.clearcoat_roughness_factor)) - cast(*void)(*instance)));
    assert(size_of(type_of(Clearcoat.clearcoat_roughness_factor)) == 4, "Clearcoat.clearcoat_roughness_factor has unexpected size % instead of 4", size_of(type_of(Clearcoat.clearcoat_roughness_factor)));
    assert(size_of(Clearcoat) == 248, "Clearcoat has size % instead of 248", size_of(Clearcoat));
}

cgltf_clearcoat :: Clearcoat;

Transmission :: struct {
    transmission_texture: cgltf_texture_view;
    transmission_factor:  cgltf_float;
}
#run {
    instance: Transmission;
    assert(((cast(*void)(*instance.transmission_texture)) - cast(*void)(*instance)) == 0, "Transmission.transmission_texture has unexpected offset % instead of 0", ((cast(*void)(*instance.transmission_texture)) - cast(*void)(*instance)));
    assert(size_of(type_of(Transmission.transmission_texture)) == 80, "Transmission.transmission_texture has unexpected size % instead of 80", size_of(type_of(Transmission.transmission_texture)));
    assert(((cast(*void)(*instance.transmission_factor)) - cast(*void)(*instance)) == 80, "Transmission.transmission_factor has unexpected offset % instead of 80", ((cast(*void)(*instance.transmission_factor)) - cast(*void)(*instance)));
    assert(size_of(type_of(Transmission.transmission_factor)) == 4, "Transmission.transmission_factor has unexpected size % instead of 4", size_of(type_of(Transmission.transmission_factor)));
    assert(size_of(Transmission) == 88, "Transmission has size % instead of 88", size_of(Transmission));
}

cgltf_transmission :: Transmission;

Ior :: struct {
    ior: cgltf_float;
}
#run {
    instance: Ior;
    assert(((cast(*void)(*instance.ior)) - cast(*void)(*instance)) == 0, "Ior.ior has unexpected offset % instead of 0", ((cast(*void)(*instance.ior)) - cast(*void)(*instance)));
    assert(size_of(type_of(Ior.ior)) == 4, "Ior.ior has unexpected size % instead of 4", size_of(type_of(Ior.ior)));
    assert(size_of(Ior) == 4, "Ior has size % instead of 4", size_of(Ior));
}

cgltf_ior :: Ior;

Specular :: struct {
    specular_texture:       cgltf_texture_view;
    specular_color_texture: cgltf_texture_view;
    specular_color_factor:  [3] cgltf_float;
    specular_factor:        cgltf_float;
}
#run {
    instance: Specular;
    assert(((cast(*void)(*instance.specular_texture)) - cast(*void)(*instance)) == 0, "Specular.specular_texture has unexpected offset % instead of 0", ((cast(*void)(*instance.specular_texture)) - cast(*void)(*instance)));
    assert(size_of(type_of(Specular.specular_texture)) == 80, "Specular.specular_texture has unexpected size % instead of 80", size_of(type_of(Specular.specular_texture)));
    assert(((cast(*void)(*instance.specular_color_texture)) - cast(*void)(*instance)) == 80, "Specular.specular_color_texture has unexpected offset % instead of 80", ((cast(*void)(*instance.specular_color_texture)) - cast(*void)(*instance)));
    assert(size_of(type_of(Specular.specular_color_texture)) == 80, "Specular.specular_color_texture has unexpected size % instead of 80", size_of(type_of(Specular.specular_color_texture)));
    assert(((cast(*void)(*instance.specular_color_factor)) - cast(*void)(*instance)) == 160, "Specular.specular_color_factor has unexpected offset % instead of 160", ((cast(*void)(*instance.specular_color_factor)) - cast(*void)(*instance)));
    assert(size_of(type_of(Specular.specular_color_factor)) == 12, "Specular.specular_color_factor has unexpected size % instead of 12", size_of(type_of(Specular.specular_color_factor)));
    assert(((cast(*void)(*instance.specular_factor)) - cast(*void)(*instance)) == 172, "Specular.specular_factor has unexpected offset % instead of 172", ((cast(*void)(*instance.specular_factor)) - cast(*void)(*instance)));
    assert(size_of(type_of(Specular.specular_factor)) == 4, "Specular.specular_factor has unexpected size % instead of 4", size_of(type_of(Specular.specular_factor)));
    assert(size_of(Specular) == 176, "Specular has size % instead of 176", size_of(Specular));
}

cgltf_specular :: Specular;

Volume :: struct {
    thickness_texture:    cgltf_texture_view;
    thickness_factor:     cgltf_float;
    attenuation_color:    [3] cgltf_float;
    attenuation_distance: cgltf_float;
}
#run {
    instance: Volume;
    assert(((cast(*void)(*instance.thickness_texture)) - cast(*void)(*instance)) == 0, "Volume.thickness_texture has unexpected offset % instead of 0", ((cast(*void)(*instance.thickness_texture)) - cast(*void)(*instance)));
    assert(size_of(type_of(Volume.thickness_texture)) == 80, "Volume.thickness_texture has unexpected size % instead of 80", size_of(type_of(Volume.thickness_texture)));
    assert(((cast(*void)(*instance.thickness_factor)) - cast(*void)(*instance)) == 80, "Volume.thickness_factor has unexpected offset % instead of 80", ((cast(*void)(*instance.thickness_factor)) - cast(*void)(*instance)));
    assert(size_of(type_of(Volume.thickness_factor)) == 4, "Volume.thickness_factor has unexpected size % instead of 4", size_of(type_of(Volume.thickness_factor)));
    assert(((cast(*void)(*instance.attenuation_color)) - cast(*void)(*instance)) == 84, "Volume.attenuation_color has unexpected offset % instead of 84", ((cast(*void)(*instance.attenuation_color)) - cast(*void)(*instance)));
    assert(size_of(type_of(Volume.attenuation_color)) == 12, "Volume.attenuation_color has unexpected size % instead of 12", size_of(type_of(Volume.attenuation_color)));
    assert(((cast(*void)(*instance.attenuation_distance)) - cast(*void)(*instance)) == 96, "Volume.attenuation_distance has unexpected offset % instead of 96", ((cast(*void)(*instance.attenuation_distance)) - cast(*void)(*instance)));
    assert(size_of(type_of(Volume.attenuation_distance)) == 4, "Volume.attenuation_distance has unexpected size % instead of 4", size_of(type_of(Volume.attenuation_distance)));
    assert(size_of(Volume) == 104, "Volume has size % instead of 104", size_of(Volume));
}

cgltf_volume :: Volume;

Sheen :: struct {
    sheen_color_texture:     cgltf_texture_view;
    sheen_color_factor:      [3] cgltf_float;
    sheen_roughness_texture: cgltf_texture_view;
    sheen_roughness_factor:  cgltf_float;
}
#run {
    instance: Sheen;
    assert(((cast(*void)(*instance.sheen_color_texture)) - cast(*void)(*instance)) == 0, "Sheen.sheen_color_texture has unexpected offset % instead of 0", ((cast(*void)(*instance.sheen_color_texture)) - cast(*void)(*instance)));
    assert(size_of(type_of(Sheen.sheen_color_texture)) == 80, "Sheen.sheen_color_texture has unexpected size % instead of 80", size_of(type_of(Sheen.sheen_color_texture)));
    assert(((cast(*void)(*instance.sheen_color_factor)) - cast(*void)(*instance)) == 80, "Sheen.sheen_color_factor has unexpected offset % instead of 80", ((cast(*void)(*instance.sheen_color_factor)) - cast(*void)(*instance)));
    assert(size_of(type_of(Sheen.sheen_color_factor)) == 12, "Sheen.sheen_color_factor has unexpected size % instead of 12", size_of(type_of(Sheen.sheen_color_factor)));
    assert(((cast(*void)(*instance.sheen_roughness_texture)) - cast(*void)(*instance)) == 96, "Sheen.sheen_roughness_texture has unexpected offset % instead of 96", ((cast(*void)(*instance.sheen_roughness_texture)) - cast(*void)(*instance)));
    assert(size_of(type_of(Sheen.sheen_roughness_texture)) == 80, "Sheen.sheen_roughness_texture has unexpected size % instead of 80", size_of(type_of(Sheen.sheen_roughness_texture)));
    assert(((cast(*void)(*instance.sheen_roughness_factor)) - cast(*void)(*instance)) == 176, "Sheen.sheen_roughness_factor has unexpected offset % instead of 176", ((cast(*void)(*instance.sheen_roughness_factor)) - cast(*void)(*instance)));
    assert(size_of(type_of(Sheen.sheen_roughness_factor)) == 4, "Sheen.sheen_roughness_factor has unexpected size % instead of 4", size_of(type_of(Sheen.sheen_roughness_factor)));
    assert(size_of(Sheen) == 184, "Sheen has size % instead of 184", size_of(Sheen));
}

cgltf_sheen :: Sheen;

Emissive_Strength :: struct {
    emissive_strength: cgltf_float;
}
#run {
    instance: Emissive_Strength;
    assert(((cast(*void)(*instance.emissive_strength)) - cast(*void)(*instance)) == 0, "Emissive_Strength.emissive_strength has unexpected offset % instead of 0", ((cast(*void)(*instance.emissive_strength)) - cast(*void)(*instance)));
    assert(size_of(type_of(Emissive_Strength.emissive_strength)) == 4, "Emissive_Strength.emissive_strength has unexpected size % instead of 4", size_of(type_of(Emissive_Strength.emissive_strength)));
    assert(size_of(Emissive_Strength) == 4, "Emissive_Strength has size % instead of 4", size_of(Emissive_Strength));
}

cgltf_emissive_strength :: Emissive_Strength;

Material :: struct {
    name:                        *u8;
    has_pbr_metallic_roughness:  cgltf_bool;
    has_pbr_specular_glossiness: cgltf_bool;
    has_clearcoat:               cgltf_bool;
    has_transmission:            cgltf_bool;
    has_volume:                  cgltf_bool;
    has_ior:                     cgltf_bool;
    has_specular:                cgltf_bool;
    has_sheen:                   cgltf_bool;
    has_emissive_strength:       cgltf_bool;
    pbr_metallic_roughness:      cgltf_pbr_metallic_roughness;
    pbr_specular_glossiness:     cgltf_pbr_specular_glossiness;
    clearcoat:                   cgltf_clearcoat;
    ior:                         cgltf_ior;
    specular:                    cgltf_specular;
    sheen:                       cgltf_sheen;
    transmission:                cgltf_transmission;
    volume:                      cgltf_volume;
    emissive_strength:           cgltf_emissive_strength;
    normal_texture:              cgltf_texture_view;
    occlusion_texture:           cgltf_texture_view;
    emissive_texture:            cgltf_texture_view;
    emissive_factor:             [3] cgltf_float;
    alpha_mode:                  cgltf_alpha_mode;
    alpha_cutoff:                cgltf_float;
    double_sided:                cgltf_bool;
    unlit:                       cgltf_bool;
    extras:                      cgltf_extras;
    extensions_count:            cgltf_size;
    extensions:                  *cgltf_extension;
}
#run {
    instance: Material;
    assert(((cast(*void)(*instance.name)) - cast(*void)(*instance)) == 0, "Material.name has unexpected offset % instead of 0", ((cast(*void)(*instance.name)) - cast(*void)(*instance)));
    assert(size_of(type_of(Material.name)) == 8, "Material.name has unexpected size % instead of 8", size_of(type_of(Material.name)));
    assert(((cast(*void)(*instance.has_pbr_metallic_roughness)) - cast(*void)(*instance)) == 8, "Material.has_pbr_metallic_roughness has unexpected offset % instead of 8", ((cast(*void)(*instance.has_pbr_metallic_roughness)) - cast(*void)(*instance)));
    assert(size_of(type_of(Material.has_pbr_metallic_roughness)) == 4, "Material.has_pbr_metallic_roughness has unexpected size % instead of 4", size_of(type_of(Material.has_pbr_metallic_roughness)));
    assert(((cast(*void)(*instance.has_pbr_specular_glossiness)) - cast(*void)(*instance)) == 12, "Material.has_pbr_specular_glossiness has unexpected offset % instead of 12", ((cast(*void)(*instance.has_pbr_specular_glossiness)) - cast(*void)(*instance)));
    assert(size_of(type_of(Material.has_pbr_specular_glossiness)) == 4, "Material.has_pbr_specular_glossiness has unexpected size % instead of 4", size_of(type_of(Material.has_pbr_specular_glossiness)));
    assert(((cast(*void)(*instance.has_clearcoat)) - cast(*void)(*instance)) == 16, "Material.has_clearcoat has unexpected offset % instead of 16", ((cast(*void)(*instance.has_clearcoat)) - cast(*void)(*instance)));
    assert(size_of(type_of(Material.has_clearcoat)) == 4, "Material.has_clearcoat has unexpected size % instead of 4", size_of(type_of(Material.has_clearcoat)));
    assert(((cast(*void)(*instance.has_transmission)) - cast(*void)(*instance)) == 20, "Material.has_transmission has unexpected offset % instead of 20", ((cast(*void)(*instance.has_transmission)) - cast(*void)(*instance)));
    assert(size_of(type_of(Material.has_transmission)) == 4, "Material.has_transmission has unexpected size % instead of 4", size_of(type_of(Material.has_transmission)));
    assert(((cast(*void)(*instance.has_volume)) - cast(*void)(*instance)) == 24, "Material.has_volume has unexpected offset % instead of 24", ((cast(*void)(*instance.has_volume)) - cast(*void)(*instance)));
    assert(size_of(type_of(Material.has_volume)) == 4, "Material.has_volume has unexpected size % instead of 4", size_of(type_of(Material.has_volume)));
    assert(((cast(*void)(*instance.has_ior)) - cast(*void)(*instance)) == 28, "Material.has_ior has unexpected offset % instead of 28", ((cast(*void)(*instance.has_ior)) - cast(*void)(*instance)));
    assert(size_of(type_of(Material.has_ior)) == 4, "Material.has_ior has unexpected size % instead of 4", size_of(type_of(Material.has_ior)));
    assert(((cast(*void)(*instance.has_specular)) - cast(*void)(*instance)) == 32, "Material.has_specular has unexpected offset % instead of 32", ((cast(*void)(*instance.has_specular)) - cast(*void)(*instance)));
    assert(size_of(type_of(Material.has_specular)) == 4, "Material.has_specular has unexpected size % instead of 4", size_of(type_of(Material.has_specular)));
    assert(((cast(*void)(*instance.has_sheen)) - cast(*void)(*instance)) == 36, "Material.has_sheen has unexpected offset % instead of 36", ((cast(*void)(*instance.has_sheen)) - cast(*void)(*instance)));
    assert(size_of(type_of(Material.has_sheen)) == 4, "Material.has_sheen has unexpected size % instead of 4", size_of(type_of(Material.has_sheen)));
    assert(((cast(*void)(*instance.has_emissive_strength)) - cast(*void)(*instance)) == 40, "Material.has_emissive_strength has unexpected offset % instead of 40", ((cast(*void)(*instance.has_emissive_strength)) - cast(*void)(*instance)));
    assert(size_of(type_of(Material.has_emissive_strength)) == 4, "Material.has_emissive_strength has unexpected size % instead of 4", size_of(type_of(Material.has_emissive_strength)));
    assert(((cast(*void)(*instance.pbr_metallic_roughness)) - cast(*void)(*instance)) == 48, "Material.pbr_metallic_roughness has unexpected offset % instead of 48", ((cast(*void)(*instance.pbr_metallic_roughness)) - cast(*void)(*instance)));
    assert(size_of(type_of(Material.pbr_metallic_roughness)) == 200, "Material.pbr_metallic_roughness has unexpected size % instead of 200", size_of(type_of(Material.pbr_metallic_roughness)));
    assert(((cast(*void)(*instance.pbr_specular_glossiness)) - cast(*void)(*instance)) == 248, "Material.pbr_specular_glossiness has unexpected offset % instead of 248", ((cast(*void)(*instance.pbr_specular_glossiness)) - cast(*void)(*instance)));
    assert(size_of(type_of(Material.pbr_specular_glossiness)) == 192, "Material.pbr_specular_glossiness has unexpected size % instead of 192", size_of(type_of(Material.pbr_specular_glossiness)));
    assert(((cast(*void)(*instance.clearcoat)) - cast(*void)(*instance)) == 440, "Material.clearcoat has unexpected offset % instead of 440", ((cast(*void)(*instance.clearcoat)) - cast(*void)(*instance)));
    assert(size_of(type_of(Material.clearcoat)) == 248, "Material.clearcoat has unexpected size % instead of 248", size_of(type_of(Material.clearcoat)));
    assert(((cast(*void)(*instance.ior)) - cast(*void)(*instance)) == 688, "Material.ior has unexpected offset % instead of 688", ((cast(*void)(*instance.ior)) - cast(*void)(*instance)));
    assert(size_of(type_of(Material.ior)) == 4, "Material.ior has unexpected size % instead of 4", size_of(type_of(Material.ior)));
    assert(((cast(*void)(*instance.specular)) - cast(*void)(*instance)) == 696, "Material.specular has unexpected offset % instead of 696", ((cast(*void)(*instance.specular)) - cast(*void)(*instance)));
    assert(size_of(type_of(Material.specular)) == 176, "Material.specular has unexpected size % instead of 176", size_of(type_of(Material.specular)));
    assert(((cast(*void)(*instance.sheen)) - cast(*void)(*instance)) == 872, "Material.sheen has unexpected offset % instead of 872", ((cast(*void)(*instance.sheen)) - cast(*void)(*instance)));
    assert(size_of(type_of(Material.sheen)) == 184, "Material.sheen has unexpected size % instead of 184", size_of(type_of(Material.sheen)));
    assert(((cast(*void)(*instance.transmission)) - cast(*void)(*instance)) == 1056, "Material.transmission has unexpected offset % instead of 1056", ((cast(*void)(*instance.transmission)) - cast(*void)(*instance)));
    assert(size_of(type_of(Material.transmission)) == 88, "Material.transmission has unexpected size % instead of 88", size_of(type_of(Material.transmission)));
    assert(((cast(*void)(*instance.volume)) - cast(*void)(*instance)) == 1144, "Material.volume has unexpected offset % instead of 1144", ((cast(*void)(*instance.volume)) - cast(*void)(*instance)));
    assert(size_of(type_of(Material.volume)) == 104, "Material.volume has unexpected size % instead of 104", size_of(type_of(Material.volume)));
    assert(((cast(*void)(*instance.emissive_strength)) - cast(*void)(*instance)) == 1248, "Material.emissive_strength has unexpected offset % instead of 1248", ((cast(*void)(*instance.emissive_strength)) - cast(*void)(*instance)));
    assert(size_of(type_of(Material.emissive_strength)) == 4, "Material.emissive_strength has unexpected size % instead of 4", size_of(type_of(Material.emissive_strength)));
    assert(((cast(*void)(*instance.normal_texture)) - cast(*void)(*instance)) == 1256, "Material.normal_texture has unexpected offset % instead of 1256", ((cast(*void)(*instance.normal_texture)) - cast(*void)(*instance)));
    assert(size_of(type_of(Material.normal_texture)) == 80, "Material.normal_texture has unexpected size % instead of 80", size_of(type_of(Material.normal_texture)));
    assert(((cast(*void)(*instance.occlusion_texture)) - cast(*void)(*instance)) == 1336, "Material.occlusion_texture has unexpected offset % instead of 1336", ((cast(*void)(*instance.occlusion_texture)) - cast(*void)(*instance)));
    assert(size_of(type_of(Material.occlusion_texture)) == 80, "Material.occlusion_texture has unexpected size % instead of 80", size_of(type_of(Material.occlusion_texture)));
    assert(((cast(*void)(*instance.emissive_texture)) - cast(*void)(*instance)) == 1416, "Material.emissive_texture has unexpected offset % instead of 1416", ((cast(*void)(*instance.emissive_texture)) - cast(*void)(*instance)));
    assert(size_of(type_of(Material.emissive_texture)) == 80, "Material.emissive_texture has unexpected size % instead of 80", size_of(type_of(Material.emissive_texture)));
    assert(((cast(*void)(*instance.emissive_factor)) - cast(*void)(*instance)) == 1496, "Material.emissive_factor has unexpected offset % instead of 1496", ((cast(*void)(*instance.emissive_factor)) - cast(*void)(*instance)));
    assert(size_of(type_of(Material.emissive_factor)) == 12, "Material.emissive_factor has unexpected size % instead of 12", size_of(type_of(Material.emissive_factor)));
    assert(((cast(*void)(*instance.alpha_mode)) - cast(*void)(*instance)) == 1508, "Material.alpha_mode has unexpected offset % instead of 1508", ((cast(*void)(*instance.alpha_mode)) - cast(*void)(*instance)));
    assert(size_of(type_of(Material.alpha_mode)) == 4, "Material.alpha_mode has unexpected size % instead of 4", size_of(type_of(Material.alpha_mode)));
    assert(((cast(*void)(*instance.alpha_cutoff)) - cast(*void)(*instance)) == 1512, "Material.alpha_cutoff has unexpected offset % instead of 1512", ((cast(*void)(*instance.alpha_cutoff)) - cast(*void)(*instance)));
    assert(size_of(type_of(Material.alpha_cutoff)) == 4, "Material.alpha_cutoff has unexpected size % instead of 4", size_of(type_of(Material.alpha_cutoff)));
    assert(((cast(*void)(*instance.double_sided)) - cast(*void)(*instance)) == 1516, "Material.double_sided has unexpected offset % instead of 1516", ((cast(*void)(*instance.double_sided)) - cast(*void)(*instance)));
    assert(size_of(type_of(Material.double_sided)) == 4, "Material.double_sided has unexpected size % instead of 4", size_of(type_of(Material.double_sided)));
    assert(((cast(*void)(*instance.unlit)) - cast(*void)(*instance)) == 1520, "Material.unlit has unexpected offset % instead of 1520", ((cast(*void)(*instance.unlit)) - cast(*void)(*instance)));
    assert(size_of(type_of(Material.unlit)) == 4, "Material.unlit has unexpected size % instead of 4", size_of(type_of(Material.unlit)));
    assert(((cast(*void)(*instance.extras)) - cast(*void)(*instance)) == 1528, "Material.extras has unexpected offset % instead of 1528", ((cast(*void)(*instance.extras)) - cast(*void)(*instance)));
    assert(size_of(type_of(Material.extras)) == 16, "Material.extras has unexpected size % instead of 16", size_of(type_of(Material.extras)));
    assert(((cast(*void)(*instance.extensions_count)) - cast(*void)(*instance)) == 1544, "Material.extensions_count has unexpected offset % instead of 1544", ((cast(*void)(*instance.extensions_count)) - cast(*void)(*instance)));
    assert(size_of(type_of(Material.extensions_count)) == 8, "Material.extensions_count has unexpected size % instead of 8", size_of(type_of(Material.extensions_count)));
    assert(((cast(*void)(*instance.extensions)) - cast(*void)(*instance)) == 1552, "Material.extensions has unexpected offset % instead of 1552", ((cast(*void)(*instance.extensions)) - cast(*void)(*instance)));
    assert(size_of(type_of(Material.extensions)) == 8, "Material.extensions has unexpected size % instead of 8", size_of(type_of(Material.extensions)));
    assert(size_of(Material) == 1560, "Material has size % instead of 1560", size_of(Material));
}

cgltf_material :: Material;

Material_Mapping :: struct {
    variant:  cgltf_size;
    material: *cgltf_material;
    extras:   cgltf_extras;
}
#run {
    instance: Material_Mapping;
    assert(((cast(*void)(*instance.variant)) - cast(*void)(*instance)) == 0, "Material_Mapping.variant has unexpected offset % instead of 0", ((cast(*void)(*instance.variant)) - cast(*void)(*instance)));
    assert(size_of(type_of(Material_Mapping.variant)) == 8, "Material_Mapping.variant has unexpected size % instead of 8", size_of(type_of(Material_Mapping.variant)));
    assert(((cast(*void)(*instance.material)) - cast(*void)(*instance)) == 8, "Material_Mapping.material has unexpected offset % instead of 8", ((cast(*void)(*instance.material)) - cast(*void)(*instance)));
    assert(size_of(type_of(Material_Mapping.material)) == 8, "Material_Mapping.material has unexpected size % instead of 8", size_of(type_of(Material_Mapping.material)));
    assert(((cast(*void)(*instance.extras)) - cast(*void)(*instance)) == 16, "Material_Mapping.extras has unexpected offset % instead of 16", ((cast(*void)(*instance.extras)) - cast(*void)(*instance)));
    assert(size_of(type_of(Material_Mapping.extras)) == 16, "Material_Mapping.extras has unexpected size % instead of 16", size_of(type_of(Material_Mapping.extras)));
    assert(size_of(Material_Mapping) == 32, "Material_Mapping has size % instead of 32", size_of(Material_Mapping));
}

cgltf_material_mapping :: Material_Mapping;

Morph_Target :: struct {
    attributes:       *cgltf_attribute;
    attributes_count: cgltf_size;
}
#run {
    instance: Morph_Target;
    assert(((cast(*void)(*instance.attributes)) - cast(*void)(*instance)) == 0, "Morph_Target.attributes has unexpected offset % instead of 0", ((cast(*void)(*instance.attributes)) - cast(*void)(*instance)));
    assert(size_of(type_of(Morph_Target.attributes)) == 8, "Morph_Target.attributes has unexpected size % instead of 8", size_of(type_of(Morph_Target.attributes)));
    assert(((cast(*void)(*instance.attributes_count)) - cast(*void)(*instance)) == 8, "Morph_Target.attributes_count has unexpected offset % instead of 8", ((cast(*void)(*instance.attributes_count)) - cast(*void)(*instance)));
    assert(size_of(type_of(Morph_Target.attributes_count)) == 8, "Morph_Target.attributes_count has unexpected size % instead of 8", size_of(type_of(Morph_Target.attributes_count)));
    assert(size_of(Morph_Target) == 16, "Morph_Target has size % instead of 16", size_of(Morph_Target));
}

cgltf_morph_target :: Morph_Target;

Draco_Mesh_Compression :: struct {
    buffer_view:      *cgltf_buffer_view;
    attributes:       *cgltf_attribute;
    attributes_count: cgltf_size;
}
#run {
    instance: Draco_Mesh_Compression;
    assert(((cast(*void)(*instance.buffer_view)) - cast(*void)(*instance)) == 0, "Draco_Mesh_Compression.buffer_view has unexpected offset % instead of 0", ((cast(*void)(*instance.buffer_view)) - cast(*void)(*instance)));
    assert(size_of(type_of(Draco_Mesh_Compression.buffer_view)) == 8, "Draco_Mesh_Compression.buffer_view has unexpected size % instead of 8", size_of(type_of(Draco_Mesh_Compression.buffer_view)));
    assert(((cast(*void)(*instance.attributes)) - cast(*void)(*instance)) == 8, "Draco_Mesh_Compression.attributes has unexpected offset % instead of 8", ((cast(*void)(*instance.attributes)) - cast(*void)(*instance)));
    assert(size_of(type_of(Draco_Mesh_Compression.attributes)) == 8, "Draco_Mesh_Compression.attributes has unexpected size % instead of 8", size_of(type_of(Draco_Mesh_Compression.attributes)));
    assert(((cast(*void)(*instance.attributes_count)) - cast(*void)(*instance)) == 16, "Draco_Mesh_Compression.attributes_count has unexpected offset % instead of 16", ((cast(*void)(*instance.attributes_count)) - cast(*void)(*instance)));
    assert(size_of(type_of(Draco_Mesh_Compression.attributes_count)) == 8, "Draco_Mesh_Compression.attributes_count has unexpected size % instead of 8", size_of(type_of(Draco_Mesh_Compression.attributes_count)));
    assert(size_of(Draco_Mesh_Compression) == 24, "Draco_Mesh_Compression has size % instead of 24", size_of(Draco_Mesh_Compression));
}

cgltf_draco_mesh_compression :: Draco_Mesh_Compression;

Primitive :: struct {
    type:                       cgltf_primitive_type;
    indices:                    *cgltf_accessor;
    material:                   *cgltf_material;
    attributes:                 *cgltf_attribute;
    attributes_count:           cgltf_size;
    targets:                    *cgltf_morph_target;
    targets_count:              cgltf_size;
    extras:                     cgltf_extras;
    has_draco_mesh_compression: cgltf_bool;
    draco_mesh_compression:     cgltf_draco_mesh_compression;
    mappings:                   *cgltf_material_mapping;
    mappings_count:             cgltf_size;
    extensions_count:           cgltf_size;
    extensions:                 *cgltf_extension;
}
#run {
    instance: Primitive;
    assert(((cast(*void)(*instance.type)) - cast(*void)(*instance)) == 0, "Primitive.type has unexpected offset % instead of 0", ((cast(*void)(*instance.type)) - cast(*void)(*instance)));
    assert(size_of(type_of(Primitive.type)) == 4, "Primitive.type has unexpected size % instead of 4", size_of(type_of(Primitive.type)));
    assert(((cast(*void)(*instance.indices)) - cast(*void)(*instance)) == 8, "Primitive.indices has unexpected offset % instead of 8", ((cast(*void)(*instance.indices)) - cast(*void)(*instance)));
    assert(size_of(type_of(Primitive.indices)) == 8, "Primitive.indices has unexpected size % instead of 8", size_of(type_of(Primitive.indices)));
    assert(((cast(*void)(*instance.material)) - cast(*void)(*instance)) == 16, "Primitive.material has unexpected offset % instead of 16", ((cast(*void)(*instance.material)) - cast(*void)(*instance)));
    assert(size_of(type_of(Primitive.material)) == 8, "Primitive.material has unexpected size % instead of 8", size_of(type_of(Primitive.material)));
    assert(((cast(*void)(*instance.attributes)) - cast(*void)(*instance)) == 24, "Primitive.attributes has unexpected offset % instead of 24", ((cast(*void)(*instance.attributes)) - cast(*void)(*instance)));
    assert(size_of(type_of(Primitive.attributes)) == 8, "Primitive.attributes has unexpected size % instead of 8", size_of(type_of(Primitive.attributes)));
    assert(((cast(*void)(*instance.attributes_count)) - cast(*void)(*instance)) == 32, "Primitive.attributes_count has unexpected offset % instead of 32", ((cast(*void)(*instance.attributes_count)) - cast(*void)(*instance)));
    assert(size_of(type_of(Primitive.attributes_count)) == 8, "Primitive.attributes_count has unexpected size % instead of 8", size_of(type_of(Primitive.attributes_count)));
    assert(((cast(*void)(*instance.targets)) - cast(*void)(*instance)) == 40, "Primitive.targets has unexpected offset % instead of 40", ((cast(*void)(*instance.targets)) - cast(*void)(*instance)));
    assert(size_of(type_of(Primitive.targets)) == 8, "Primitive.targets has unexpected size % instead of 8", size_of(type_of(Primitive.targets)));
    assert(((cast(*void)(*instance.targets_count)) - cast(*void)(*instance)) == 48, "Primitive.targets_count has unexpected offset % instead of 48", ((cast(*void)(*instance.targets_count)) - cast(*void)(*instance)));
    assert(size_of(type_of(Primitive.targets_count)) == 8, "Primitive.targets_count has unexpected size % instead of 8", size_of(type_of(Primitive.targets_count)));
    assert(((cast(*void)(*instance.extras)) - cast(*void)(*instance)) == 56, "Primitive.extras has unexpected offset % instead of 56", ((cast(*void)(*instance.extras)) - cast(*void)(*instance)));
    assert(size_of(type_of(Primitive.extras)) == 16, "Primitive.extras has unexpected size % instead of 16", size_of(type_of(Primitive.extras)));
    assert(((cast(*void)(*instance.has_draco_mesh_compression)) - cast(*void)(*instance)) == 72, "Primitive.has_draco_mesh_compression has unexpected offset % instead of 72", ((cast(*void)(*instance.has_draco_mesh_compression)) - cast(*void)(*instance)));
    assert(size_of(type_of(Primitive.has_draco_mesh_compression)) == 4, "Primitive.has_draco_mesh_compression has unexpected size % instead of 4", size_of(type_of(Primitive.has_draco_mesh_compression)));
    assert(((cast(*void)(*instance.draco_mesh_compression)) - cast(*void)(*instance)) == 80, "Primitive.draco_mesh_compression has unexpected offset % instead of 80", ((cast(*void)(*instance.draco_mesh_compression)) - cast(*void)(*instance)));
    assert(size_of(type_of(Primitive.draco_mesh_compression)) == 24, "Primitive.draco_mesh_compression has unexpected size % instead of 24", size_of(type_of(Primitive.draco_mesh_compression)));
    assert(((cast(*void)(*instance.mappings)) - cast(*void)(*instance)) == 104, "Primitive.mappings has unexpected offset % instead of 104", ((cast(*void)(*instance.mappings)) - cast(*void)(*instance)));
    assert(size_of(type_of(Primitive.mappings)) == 8, "Primitive.mappings has unexpected size % instead of 8", size_of(type_of(Primitive.mappings)));
    assert(((cast(*void)(*instance.mappings_count)) - cast(*void)(*instance)) == 112, "Primitive.mappings_count has unexpected offset % instead of 112", ((cast(*void)(*instance.mappings_count)) - cast(*void)(*instance)));
    assert(size_of(type_of(Primitive.mappings_count)) == 8, "Primitive.mappings_count has unexpected size % instead of 8", size_of(type_of(Primitive.mappings_count)));
    assert(((cast(*void)(*instance.extensions_count)) - cast(*void)(*instance)) == 120, "Primitive.extensions_count has unexpected offset % instead of 120", ((cast(*void)(*instance.extensions_count)) - cast(*void)(*instance)));
    assert(size_of(type_of(Primitive.extensions_count)) == 8, "Primitive.extensions_count has unexpected size % instead of 8", size_of(type_of(Primitive.extensions_count)));
    assert(((cast(*void)(*instance.extensions)) - cast(*void)(*instance)) == 128, "Primitive.extensions has unexpected offset % instead of 128", ((cast(*void)(*instance.extensions)) - cast(*void)(*instance)));
    assert(size_of(type_of(Primitive.extensions)) == 8, "Primitive.extensions has unexpected size % instead of 8", size_of(type_of(Primitive.extensions)));
    assert(size_of(Primitive) == 136, "Primitive has size % instead of 136", size_of(Primitive));
}

cgltf_primitive :: Primitive;

Mesh :: struct {
    name:               *u8;
    primitives:         *cgltf_primitive;
    primitives_count:   cgltf_size;
    weights:            *cgltf_float;
    weights_count:      cgltf_size;
    target_names:       **u8;
    target_names_count: cgltf_size;
    extras:             cgltf_extras;
    extensions_count:   cgltf_size;
    extensions:         *cgltf_extension;
}
#run {
    instance: Mesh;
    assert(((cast(*void)(*instance.name)) - cast(*void)(*instance)) == 0, "Mesh.name has unexpected offset % instead of 0", ((cast(*void)(*instance.name)) - cast(*void)(*instance)));
    assert(size_of(type_of(Mesh.name)) == 8, "Mesh.name has unexpected size % instead of 8", size_of(type_of(Mesh.name)));
    assert(((cast(*void)(*instance.primitives)) - cast(*void)(*instance)) == 8, "Mesh.primitives has unexpected offset % instead of 8", ((cast(*void)(*instance.primitives)) - cast(*void)(*instance)));
    assert(size_of(type_of(Mesh.primitives)) == 8, "Mesh.primitives has unexpected size % instead of 8", size_of(type_of(Mesh.primitives)));
    assert(((cast(*void)(*instance.primitives_count)) - cast(*void)(*instance)) == 16, "Mesh.primitives_count has unexpected offset % instead of 16", ((cast(*void)(*instance.primitives_count)) - cast(*void)(*instance)));
    assert(size_of(type_of(Mesh.primitives_count)) == 8, "Mesh.primitives_count has unexpected size % instead of 8", size_of(type_of(Mesh.primitives_count)));
    assert(((cast(*void)(*instance.weights)) - cast(*void)(*instance)) == 24, "Mesh.weights has unexpected offset % instead of 24", ((cast(*void)(*instance.weights)) - cast(*void)(*instance)));
    assert(size_of(type_of(Mesh.weights)) == 8, "Mesh.weights has unexpected size % instead of 8", size_of(type_of(Mesh.weights)));
    assert(((cast(*void)(*instance.weights_count)) - cast(*void)(*instance)) == 32, "Mesh.weights_count has unexpected offset % instead of 32", ((cast(*void)(*instance.weights_count)) - cast(*void)(*instance)));
    assert(size_of(type_of(Mesh.weights_count)) == 8, "Mesh.weights_count has unexpected size % instead of 8", size_of(type_of(Mesh.weights_count)));
    assert(((cast(*void)(*instance.target_names)) - cast(*void)(*instance)) == 40, "Mesh.target_names has unexpected offset % instead of 40", ((cast(*void)(*instance.target_names)) - cast(*void)(*instance)));
    assert(size_of(type_of(Mesh.target_names)) == 8, "Mesh.target_names has unexpected size % instead of 8", size_of(type_of(Mesh.target_names)));
    assert(((cast(*void)(*instance.target_names_count)) - cast(*void)(*instance)) == 48, "Mesh.target_names_count has unexpected offset % instead of 48", ((cast(*void)(*instance.target_names_count)) - cast(*void)(*instance)));
    assert(size_of(type_of(Mesh.target_names_count)) == 8, "Mesh.target_names_count has unexpected size % instead of 8", size_of(type_of(Mesh.target_names_count)));
    assert(((cast(*void)(*instance.extras)) - cast(*void)(*instance)) == 56, "Mesh.extras has unexpected offset % instead of 56", ((cast(*void)(*instance.extras)) - cast(*void)(*instance)));
    assert(size_of(type_of(Mesh.extras)) == 16, "Mesh.extras has unexpected size % instead of 16", size_of(type_of(Mesh.extras)));
    assert(((cast(*void)(*instance.extensions_count)) - cast(*void)(*instance)) == 72, "Mesh.extensions_count has unexpected offset % instead of 72", ((cast(*void)(*instance.extensions_count)) - cast(*void)(*instance)));
    assert(size_of(type_of(Mesh.extensions_count)) == 8, "Mesh.extensions_count has unexpected size % instead of 8", size_of(type_of(Mesh.extensions_count)));
    assert(((cast(*void)(*instance.extensions)) - cast(*void)(*instance)) == 80, "Mesh.extensions has unexpected offset % instead of 80", ((cast(*void)(*instance.extensions)) - cast(*void)(*instance)));
    assert(size_of(type_of(Mesh.extensions)) == 8, "Mesh.extensions has unexpected size % instead of 8", size_of(type_of(Mesh.extensions)));
    assert(size_of(Mesh) == 88, "Mesh has size % instead of 88", size_of(Mesh));
}

cgltf_mesh :: Mesh;

cgltf_node :: Node;

Skin :: struct {
    name:                  *u8;
    joints:                **cgltf_node;
    joints_count:          cgltf_size;
    skeleton:              *cgltf_node;
    inverse_bind_matrices: *cgltf_accessor;
    extras:                cgltf_extras;
    extensions_count:      cgltf_size;
    extensions:            *cgltf_extension;
}
#run {
    instance: Skin;
    assert(((cast(*void)(*instance.name)) - cast(*void)(*instance)) == 0, "Skin.name has unexpected offset % instead of 0", ((cast(*void)(*instance.name)) - cast(*void)(*instance)));
    assert(size_of(type_of(Skin.name)) == 8, "Skin.name has unexpected size % instead of 8", size_of(type_of(Skin.name)));
    assert(((cast(*void)(*instance.joints)) - cast(*void)(*instance)) == 8, "Skin.joints has unexpected offset % instead of 8", ((cast(*void)(*instance.joints)) - cast(*void)(*instance)));
    assert(size_of(type_of(Skin.joints)) == 8, "Skin.joints has unexpected size % instead of 8", size_of(type_of(Skin.joints)));
    assert(((cast(*void)(*instance.joints_count)) - cast(*void)(*instance)) == 16, "Skin.joints_count has unexpected offset % instead of 16", ((cast(*void)(*instance.joints_count)) - cast(*void)(*instance)));
    assert(size_of(type_of(Skin.joints_count)) == 8, "Skin.joints_count has unexpected size % instead of 8", size_of(type_of(Skin.joints_count)));
    assert(((cast(*void)(*instance.skeleton)) - cast(*void)(*instance)) == 24, "Skin.skeleton has unexpected offset % instead of 24", ((cast(*void)(*instance.skeleton)) - cast(*void)(*instance)));
    assert(size_of(type_of(Skin.skeleton)) == 8, "Skin.skeleton has unexpected size % instead of 8", size_of(type_of(Skin.skeleton)));
    assert(((cast(*void)(*instance.inverse_bind_matrices)) - cast(*void)(*instance)) == 32, "Skin.inverse_bind_matrices has unexpected offset % instead of 32", ((cast(*void)(*instance.inverse_bind_matrices)) - cast(*void)(*instance)));
    assert(size_of(type_of(Skin.inverse_bind_matrices)) == 8, "Skin.inverse_bind_matrices has unexpected size % instead of 8", size_of(type_of(Skin.inverse_bind_matrices)));
    assert(((cast(*void)(*instance.extras)) - cast(*void)(*instance)) == 40, "Skin.extras has unexpected offset % instead of 40", ((cast(*void)(*instance.extras)) - cast(*void)(*instance)));
    assert(size_of(type_of(Skin.extras)) == 16, "Skin.extras has unexpected size % instead of 16", size_of(type_of(Skin.extras)));
    assert(((cast(*void)(*instance.extensions_count)) - cast(*void)(*instance)) == 56, "Skin.extensions_count has unexpected offset % instead of 56", ((cast(*void)(*instance.extensions_count)) - cast(*void)(*instance)));
    assert(size_of(type_of(Skin.extensions_count)) == 8, "Skin.extensions_count has unexpected size % instead of 8", size_of(type_of(Skin.extensions_count)));
    assert(((cast(*void)(*instance.extensions)) - cast(*void)(*instance)) == 64, "Skin.extensions has unexpected offset % instead of 64", ((cast(*void)(*instance.extensions)) - cast(*void)(*instance)));
    assert(size_of(type_of(Skin.extensions)) == 8, "Skin.extensions has unexpected size % instead of 8", size_of(type_of(Skin.extensions)));
    assert(size_of(Skin) == 72, "Skin has size % instead of 72", size_of(Skin));
}

cgltf_skin :: Skin;

Camera_Perspective :: struct {
    has_aspect_ratio: cgltf_bool;
    aspect_ratio:     cgltf_float;
    yfov:             cgltf_float;
    has_zfar:         cgltf_bool;
    zfar:             cgltf_float;
    znear:            cgltf_float;
    extras:           cgltf_extras;
}
#run {
    instance: Camera_Perspective;
    assert(((cast(*void)(*instance.has_aspect_ratio)) - cast(*void)(*instance)) == 0, "Camera_Perspective.has_aspect_ratio has unexpected offset % instead of 0", ((cast(*void)(*instance.has_aspect_ratio)) - cast(*void)(*instance)));
    assert(size_of(type_of(Camera_Perspective.has_aspect_ratio)) == 4, "Camera_Perspective.has_aspect_ratio has unexpected size % instead of 4", size_of(type_of(Camera_Perspective.has_aspect_ratio)));
    assert(((cast(*void)(*instance.aspect_ratio)) - cast(*void)(*instance)) == 4, "Camera_Perspective.aspect_ratio has unexpected offset % instead of 4", ((cast(*void)(*instance.aspect_ratio)) - cast(*void)(*instance)));
    assert(size_of(type_of(Camera_Perspective.aspect_ratio)) == 4, "Camera_Perspective.aspect_ratio has unexpected size % instead of 4", size_of(type_of(Camera_Perspective.aspect_ratio)));
    assert(((cast(*void)(*instance.yfov)) - cast(*void)(*instance)) == 8, "Camera_Perspective.yfov has unexpected offset % instead of 8", ((cast(*void)(*instance.yfov)) - cast(*void)(*instance)));
    assert(size_of(type_of(Camera_Perspective.yfov)) == 4, "Camera_Perspective.yfov has unexpected size % instead of 4", size_of(type_of(Camera_Perspective.yfov)));
    assert(((cast(*void)(*instance.has_zfar)) - cast(*void)(*instance)) == 12, "Camera_Perspective.has_zfar has unexpected offset % instead of 12", ((cast(*void)(*instance.has_zfar)) - cast(*void)(*instance)));
    assert(size_of(type_of(Camera_Perspective.has_zfar)) == 4, "Camera_Perspective.has_zfar has unexpected size % instead of 4", size_of(type_of(Camera_Perspective.has_zfar)));
    assert(((cast(*void)(*instance.zfar)) - cast(*void)(*instance)) == 16, "Camera_Perspective.zfar has unexpected offset % instead of 16", ((cast(*void)(*instance.zfar)) - cast(*void)(*instance)));
    assert(size_of(type_of(Camera_Perspective.zfar)) == 4, "Camera_Perspective.zfar has unexpected size % instead of 4", size_of(type_of(Camera_Perspective.zfar)));
    assert(((cast(*void)(*instance.znear)) - cast(*void)(*instance)) == 20, "Camera_Perspective.znear has unexpected offset % instead of 20", ((cast(*void)(*instance.znear)) - cast(*void)(*instance)));
    assert(size_of(type_of(Camera_Perspective.znear)) == 4, "Camera_Perspective.znear has unexpected size % instead of 4", size_of(type_of(Camera_Perspective.znear)));
    assert(((cast(*void)(*instance.extras)) - cast(*void)(*instance)) == 24, "Camera_Perspective.extras has unexpected offset % instead of 24", ((cast(*void)(*instance.extras)) - cast(*void)(*instance)));
    assert(size_of(type_of(Camera_Perspective.extras)) == 16, "Camera_Perspective.extras has unexpected size % instead of 16", size_of(type_of(Camera_Perspective.extras)));
    assert(size_of(Camera_Perspective) == 40, "Camera_Perspective has size % instead of 40", size_of(Camera_Perspective));
}

cgltf_camera_perspective :: Camera_Perspective;

Camera_Orthographic :: struct {
    xmag:   cgltf_float;
    ymag:   cgltf_float;
    zfar:   cgltf_float;
    znear:  cgltf_float;
    extras: cgltf_extras;
}
#run {
    instance: Camera_Orthographic;
    assert(((cast(*void)(*instance.xmag)) - cast(*void)(*instance)) == 0, "Camera_Orthographic.xmag has unexpected offset % instead of 0", ((cast(*void)(*instance.xmag)) - cast(*void)(*instance)));
    assert(size_of(type_of(Camera_Orthographic.xmag)) == 4, "Camera_Orthographic.xmag has unexpected size % instead of 4", size_of(type_of(Camera_Orthographic.xmag)));
    assert(((cast(*void)(*instance.ymag)) - cast(*void)(*instance)) == 4, "Camera_Orthographic.ymag has unexpected offset % instead of 4", ((cast(*void)(*instance.ymag)) - cast(*void)(*instance)));
    assert(size_of(type_of(Camera_Orthographic.ymag)) == 4, "Camera_Orthographic.ymag has unexpected size % instead of 4", size_of(type_of(Camera_Orthographic.ymag)));
    assert(((cast(*void)(*instance.zfar)) - cast(*void)(*instance)) == 8, "Camera_Orthographic.zfar has unexpected offset % instead of 8", ((cast(*void)(*instance.zfar)) - cast(*void)(*instance)));
    assert(size_of(type_of(Camera_Orthographic.zfar)) == 4, "Camera_Orthographic.zfar has unexpected size % instead of 4", size_of(type_of(Camera_Orthographic.zfar)));
    assert(((cast(*void)(*instance.znear)) - cast(*void)(*instance)) == 12, "Camera_Orthographic.znear has unexpected offset % instead of 12", ((cast(*void)(*instance.znear)) - cast(*void)(*instance)));
    assert(size_of(type_of(Camera_Orthographic.znear)) == 4, "Camera_Orthographic.znear has unexpected size % instead of 4", size_of(type_of(Camera_Orthographic.znear)));
    assert(((cast(*void)(*instance.extras)) - cast(*void)(*instance)) == 16, "Camera_Orthographic.extras has unexpected offset % instead of 16", ((cast(*void)(*instance.extras)) - cast(*void)(*instance)));
    assert(size_of(type_of(Camera_Orthographic.extras)) == 16, "Camera_Orthographic.extras has unexpected size % instead of 16", size_of(type_of(Camera_Orthographic.extras)));
    assert(size_of(Camera_Orthographic) == 32, "Camera_Orthographic has size % instead of 32", size_of(Camera_Orthographic));
}

cgltf_camera_orthographic :: Camera_Orthographic;

Camera :: struct {
    name:             *u8;
    type:             cgltf_camera_type;
    data:             union {
        perspective:  cgltf_camera_perspective;
        orthographic: cgltf_camera_orthographic;
    };

    extras:           cgltf_extras;
    extensions_count: cgltf_size;
    extensions:       *cgltf_extension;
}
#run {
    instance: Camera;
    assert(((cast(*void)(*instance.name)) - cast(*void)(*instance)) == 0, "Camera.name has unexpected offset % instead of 0", ((cast(*void)(*instance.name)) - cast(*void)(*instance)));
    assert(size_of(type_of(Camera.name)) == 8, "Camera.name has unexpected size % instead of 8", size_of(type_of(Camera.name)));
    assert(((cast(*void)(*instance.type)) - cast(*void)(*instance)) == 8, "Camera.type has unexpected offset % instead of 8", ((cast(*void)(*instance.type)) - cast(*void)(*instance)));
    assert(size_of(type_of(Camera.type)) == 4, "Camera.type has unexpected size % instead of 4", size_of(type_of(Camera.type)));
    assert(((cast(*void)(*instance.data)) - cast(*void)(*instance)) == 16, "Camera.data has unexpected offset % instead of 16", ((cast(*void)(*instance.data)) - cast(*void)(*instance)));
    assert(size_of(type_of(Camera.data)) == 40, "Camera.data has unexpected size % instead of 40", size_of(type_of(Camera.data)));
    assert(((cast(*void)(*instance.extras)) - cast(*void)(*instance)) == 56, "Camera.extras has unexpected offset % instead of 56", ((cast(*void)(*instance.extras)) - cast(*void)(*instance)));
    assert(size_of(type_of(Camera.extras)) == 16, "Camera.extras has unexpected size % instead of 16", size_of(type_of(Camera.extras)));
    assert(((cast(*void)(*instance.extensions_count)) - cast(*void)(*instance)) == 72, "Camera.extensions_count has unexpected offset % instead of 72", ((cast(*void)(*instance.extensions_count)) - cast(*void)(*instance)));
    assert(size_of(type_of(Camera.extensions_count)) == 8, "Camera.extensions_count has unexpected size % instead of 8", size_of(type_of(Camera.extensions_count)));
    assert(((cast(*void)(*instance.extensions)) - cast(*void)(*instance)) == 80, "Camera.extensions has unexpected offset % instead of 80", ((cast(*void)(*instance.extensions)) - cast(*void)(*instance)));
    assert(size_of(type_of(Camera.extensions)) == 8, "Camera.extensions has unexpected size % instead of 8", size_of(type_of(Camera.extensions)));
    assert(size_of(Camera) == 88, "Camera has size % instead of 88", size_of(Camera));
}

cgltf_camera :: Camera;

Light :: struct {
    name:                  *u8;
    color:                 [3] cgltf_float;
    intensity:             cgltf_float;
    type:                  cgltf_light_type;
    range:                 cgltf_float;
    spot_inner_cone_angle: cgltf_float;
    spot_outer_cone_angle: cgltf_float;
    extras:                cgltf_extras;
}
#run {
    instance: Light;
    assert(((cast(*void)(*instance.name)) - cast(*void)(*instance)) == 0, "Light.name has unexpected offset % instead of 0", ((cast(*void)(*instance.name)) - cast(*void)(*instance)));
    assert(size_of(type_of(Light.name)) == 8, "Light.name has unexpected size % instead of 8", size_of(type_of(Light.name)));
    assert(((cast(*void)(*instance.color)) - cast(*void)(*instance)) == 8, "Light.color has unexpected offset % instead of 8", ((cast(*void)(*instance.color)) - cast(*void)(*instance)));
    assert(size_of(type_of(Light.color)) == 12, "Light.color has unexpected size % instead of 12", size_of(type_of(Light.color)));
    assert(((cast(*void)(*instance.intensity)) - cast(*void)(*instance)) == 20, "Light.intensity has unexpected offset % instead of 20", ((cast(*void)(*instance.intensity)) - cast(*void)(*instance)));
    assert(size_of(type_of(Light.intensity)) == 4, "Light.intensity has unexpected size % instead of 4", size_of(type_of(Light.intensity)));
    assert(((cast(*void)(*instance.type)) - cast(*void)(*instance)) == 24, "Light.type has unexpected offset % instead of 24", ((cast(*void)(*instance.type)) - cast(*void)(*instance)));
    assert(size_of(type_of(Light.type)) == 4, "Light.type has unexpected size % instead of 4", size_of(type_of(Light.type)));
    assert(((cast(*void)(*instance.range)) - cast(*void)(*instance)) == 28, "Light.range has unexpected offset % instead of 28", ((cast(*void)(*instance.range)) - cast(*void)(*instance)));
    assert(size_of(type_of(Light.range)) == 4, "Light.range has unexpected size % instead of 4", size_of(type_of(Light.range)));
    assert(((cast(*void)(*instance.spot_inner_cone_angle)) - cast(*void)(*instance)) == 32, "Light.spot_inner_cone_angle has unexpected offset % instead of 32", ((cast(*void)(*instance.spot_inner_cone_angle)) - cast(*void)(*instance)));
    assert(size_of(type_of(Light.spot_inner_cone_angle)) == 4, "Light.spot_inner_cone_angle has unexpected size % instead of 4", size_of(type_of(Light.spot_inner_cone_angle)));
    assert(((cast(*void)(*instance.spot_outer_cone_angle)) - cast(*void)(*instance)) == 36, "Light.spot_outer_cone_angle has unexpected offset % instead of 36", ((cast(*void)(*instance.spot_outer_cone_angle)) - cast(*void)(*instance)));
    assert(size_of(type_of(Light.spot_outer_cone_angle)) == 4, "Light.spot_outer_cone_angle has unexpected size % instead of 4", size_of(type_of(Light.spot_outer_cone_angle)));
    assert(((cast(*void)(*instance.extras)) - cast(*void)(*instance)) == 40, "Light.extras has unexpected offset % instead of 40", ((cast(*void)(*instance.extras)) - cast(*void)(*instance)));
    assert(size_of(type_of(Light.extras)) == 16, "Light.extras has unexpected size % instead of 16", size_of(type_of(Light.extras)));
    assert(size_of(Light) == 56, "Light has size % instead of 56", size_of(Light));
}

cgltf_light :: Light;

Node :: struct {
    name:             *u8;
    parent:           *Node;
    children:         **Node;
    children_count:   cgltf_size;
    skin:             *cgltf_skin;
    mesh:             *cgltf_mesh;
    camera:           *cgltf_camera;
    light:            *cgltf_light;
    weights:          *cgltf_float;
    weights_count:    cgltf_size;
    has_translation:  cgltf_bool;
    has_rotation:     cgltf_bool;
    has_scale:        cgltf_bool;
    has_matrix:       cgltf_bool;
    translation:      [3] cgltf_float;
    rotation:         [4] cgltf_float;
    scale:            [3] cgltf_float;
    matrix:           [16] cgltf_float;
    extras:           cgltf_extras;
    extensions_count: cgltf_size;
    extensions:       *cgltf_extension;
}
#run {
    instance: Node;
    assert(((cast(*void)(*instance.name)) - cast(*void)(*instance)) == 0, "Node.name has unexpected offset % instead of 0", ((cast(*void)(*instance.name)) - cast(*void)(*instance)));
    assert(size_of(type_of(Node.name)) == 8, "Node.name has unexpected size % instead of 8", size_of(type_of(Node.name)));
    assert(((cast(*void)(*instance.parent)) - cast(*void)(*instance)) == 8, "Node.parent has unexpected offset % instead of 8", ((cast(*void)(*instance.parent)) - cast(*void)(*instance)));
    assert(size_of(type_of(Node.parent)) == 8, "Node.parent has unexpected size % instead of 8", size_of(type_of(Node.parent)));
    assert(((cast(*void)(*instance.children)) - cast(*void)(*instance)) == 16, "Node.children has unexpected offset % instead of 16", ((cast(*void)(*instance.children)) - cast(*void)(*instance)));
    assert(size_of(type_of(Node.children)) == 8, "Node.children has unexpected size % instead of 8", size_of(type_of(Node.children)));
    assert(((cast(*void)(*instance.children_count)) - cast(*void)(*instance)) == 24, "Node.children_count has unexpected offset % instead of 24", ((cast(*void)(*instance.children_count)) - cast(*void)(*instance)));
    assert(size_of(type_of(Node.children_count)) == 8, "Node.children_count has unexpected size % instead of 8", size_of(type_of(Node.children_count)));
    assert(((cast(*void)(*instance.skin)) - cast(*void)(*instance)) == 32, "Node.skin has unexpected offset % instead of 32", ((cast(*void)(*instance.skin)) - cast(*void)(*instance)));
    assert(size_of(type_of(Node.skin)) == 8, "Node.skin has unexpected size % instead of 8", size_of(type_of(Node.skin)));
    assert(((cast(*void)(*instance.mesh)) - cast(*void)(*instance)) == 40, "Node.mesh has unexpected offset % instead of 40", ((cast(*void)(*instance.mesh)) - cast(*void)(*instance)));
    assert(size_of(type_of(Node.mesh)) == 8, "Node.mesh has unexpected size % instead of 8", size_of(type_of(Node.mesh)));
    assert(((cast(*void)(*instance.camera)) - cast(*void)(*instance)) == 48, "Node.camera has unexpected offset % instead of 48", ((cast(*void)(*instance.camera)) - cast(*void)(*instance)));
    assert(size_of(type_of(Node.camera)) == 8, "Node.camera has unexpected size % instead of 8", size_of(type_of(Node.camera)));
    assert(((cast(*void)(*instance.light)) - cast(*void)(*instance)) == 56, "Node.light has unexpected offset % instead of 56", ((cast(*void)(*instance.light)) - cast(*void)(*instance)));
    assert(size_of(type_of(Node.light)) == 8, "Node.light has unexpected size % instead of 8", size_of(type_of(Node.light)));
    assert(((cast(*void)(*instance.weights)) - cast(*void)(*instance)) == 64, "Node.weights has unexpected offset % instead of 64", ((cast(*void)(*instance.weights)) - cast(*void)(*instance)));
    assert(size_of(type_of(Node.weights)) == 8, "Node.weights has unexpected size % instead of 8", size_of(type_of(Node.weights)));
    assert(((cast(*void)(*instance.weights_count)) - cast(*void)(*instance)) == 72, "Node.weights_count has unexpected offset % instead of 72", ((cast(*void)(*instance.weights_count)) - cast(*void)(*instance)));
    assert(size_of(type_of(Node.weights_count)) == 8, "Node.weights_count has unexpected size % instead of 8", size_of(type_of(Node.weights_count)));
    assert(((cast(*void)(*instance.has_translation)) - cast(*void)(*instance)) == 80, "Node.has_translation has unexpected offset % instead of 80", ((cast(*void)(*instance.has_translation)) - cast(*void)(*instance)));
    assert(size_of(type_of(Node.has_translation)) == 4, "Node.has_translation has unexpected size % instead of 4", size_of(type_of(Node.has_translation)));
    assert(((cast(*void)(*instance.has_rotation)) - cast(*void)(*instance)) == 84, "Node.has_rotation has unexpected offset % instead of 84", ((cast(*void)(*instance.has_rotation)) - cast(*void)(*instance)));
    assert(size_of(type_of(Node.has_rotation)) == 4, "Node.has_rotation has unexpected size % instead of 4", size_of(type_of(Node.has_rotation)));
    assert(((cast(*void)(*instance.has_scale)) - cast(*void)(*instance)) == 88, "Node.has_scale has unexpected offset % instead of 88", ((cast(*void)(*instance.has_scale)) - cast(*void)(*instance)));
    assert(size_of(type_of(Node.has_scale)) == 4, "Node.has_scale has unexpected size % instead of 4", size_of(type_of(Node.has_scale)));
    assert(((cast(*void)(*instance.has_matrix)) - cast(*void)(*instance)) == 92, "Node.has_matrix has unexpected offset % instead of 92", ((cast(*void)(*instance.has_matrix)) - cast(*void)(*instance)));
    assert(size_of(type_of(Node.has_matrix)) == 4, "Node.has_matrix has unexpected size % instead of 4", size_of(type_of(Node.has_matrix)));
    assert(((cast(*void)(*instance.translation)) - cast(*void)(*instance)) == 96, "Node.translation has unexpected offset % instead of 96", ((cast(*void)(*instance.translation)) - cast(*void)(*instance)));
    assert(size_of(type_of(Node.translation)) == 12, "Node.translation has unexpected size % instead of 12", size_of(type_of(Node.translation)));
    assert(((cast(*void)(*instance.rotation)) - cast(*void)(*instance)) == 108, "Node.rotation has unexpected offset % instead of 108", ((cast(*void)(*instance.rotation)) - cast(*void)(*instance)));
    assert(size_of(type_of(Node.rotation)) == 16, "Node.rotation has unexpected size % instead of 16", size_of(type_of(Node.rotation)));
    assert(((cast(*void)(*instance.scale)) - cast(*void)(*instance)) == 124, "Node.scale has unexpected offset % instead of 124", ((cast(*void)(*instance.scale)) - cast(*void)(*instance)));
    assert(size_of(type_of(Node.scale)) == 12, "Node.scale has unexpected size % instead of 12", size_of(type_of(Node.scale)));
    assert(((cast(*void)(*instance.matrix)) - cast(*void)(*instance)) == 136, "Node.matrix has unexpected offset % instead of 136", ((cast(*void)(*instance.matrix)) - cast(*void)(*instance)));
    assert(size_of(type_of(Node.matrix)) == 64, "Node.matrix has unexpected size % instead of 64", size_of(type_of(Node.matrix)));
    assert(((cast(*void)(*instance.extras)) - cast(*void)(*instance)) == 200, "Node.extras has unexpected offset % instead of 200", ((cast(*void)(*instance.extras)) - cast(*void)(*instance)));
    assert(size_of(type_of(Node.extras)) == 16, "Node.extras has unexpected size % instead of 16", size_of(type_of(Node.extras)));
    assert(((cast(*void)(*instance.extensions_count)) - cast(*void)(*instance)) == 216, "Node.extensions_count has unexpected offset % instead of 216", ((cast(*void)(*instance.extensions_count)) - cast(*void)(*instance)));
    assert(size_of(type_of(Node.extensions_count)) == 8, "Node.extensions_count has unexpected size % instead of 8", size_of(type_of(Node.extensions_count)));
    assert(((cast(*void)(*instance.extensions)) - cast(*void)(*instance)) == 224, "Node.extensions has unexpected offset % instead of 224", ((cast(*void)(*instance.extensions)) - cast(*void)(*instance)));
    assert(size_of(type_of(Node.extensions)) == 8, "Node.extensions has unexpected size % instead of 8", size_of(type_of(Node.extensions)));
    assert(size_of(Node) == 232, "Node has size % instead of 232", size_of(Node));
}

Scene :: struct {
    name:             *u8;
    nodes:            **cgltf_node;
    nodes_count:      cgltf_size;
    extras:           cgltf_extras;
    extensions_count: cgltf_size;
    extensions:       *cgltf_extension;
}
#run {
    instance: Scene;
    assert(((cast(*void)(*instance.name)) - cast(*void)(*instance)) == 0, "Scene.name has unexpected offset % instead of 0", ((cast(*void)(*instance.name)) - cast(*void)(*instance)));
    assert(size_of(type_of(Scene.name)) == 8, "Scene.name has unexpected size % instead of 8", size_of(type_of(Scene.name)));
    assert(((cast(*void)(*instance.nodes)) - cast(*void)(*instance)) == 8, "Scene.nodes has unexpected offset % instead of 8", ((cast(*void)(*instance.nodes)) - cast(*void)(*instance)));
    assert(size_of(type_of(Scene.nodes)) == 8, "Scene.nodes has unexpected size % instead of 8", size_of(type_of(Scene.nodes)));
    assert(((cast(*void)(*instance.nodes_count)) - cast(*void)(*instance)) == 16, "Scene.nodes_count has unexpected offset % instead of 16", ((cast(*void)(*instance.nodes_count)) - cast(*void)(*instance)));
    assert(size_of(type_of(Scene.nodes_count)) == 8, "Scene.nodes_count has unexpected size % instead of 8", size_of(type_of(Scene.nodes_count)));
    assert(((cast(*void)(*instance.extras)) - cast(*void)(*instance)) == 24, "Scene.extras has unexpected offset % instead of 24", ((cast(*void)(*instance.extras)) - cast(*void)(*instance)));
    assert(size_of(type_of(Scene.extras)) == 16, "Scene.extras has unexpected size % instead of 16", size_of(type_of(Scene.extras)));
    assert(((cast(*void)(*instance.extensions_count)) - cast(*void)(*instance)) == 40, "Scene.extensions_count has unexpected offset % instead of 40", ((cast(*void)(*instance.extensions_count)) - cast(*void)(*instance)));
    assert(size_of(type_of(Scene.extensions_count)) == 8, "Scene.extensions_count has unexpected size % instead of 8", size_of(type_of(Scene.extensions_count)));
    assert(((cast(*void)(*instance.extensions)) - cast(*void)(*instance)) == 48, "Scene.extensions has unexpected offset % instead of 48", ((cast(*void)(*instance.extensions)) - cast(*void)(*instance)));
    assert(size_of(type_of(Scene.extensions)) == 8, "Scene.extensions has unexpected size % instead of 8", size_of(type_of(Scene.extensions)));
    assert(size_of(Scene) == 56, "Scene has size % instead of 56", size_of(Scene));
}

cgltf_scene :: Scene;

Animation_Sampler :: struct {
    input:            *cgltf_accessor;
    output:           *cgltf_accessor;
    interpolation:    cgltf_interpolation_type;
    extras:           cgltf_extras;
    extensions_count: cgltf_size;
    extensions:       *cgltf_extension;
}
#run {
    instance: Animation_Sampler;
    assert(((cast(*void)(*instance.input)) - cast(*void)(*instance)) == 0, "Animation_Sampler.input has unexpected offset % instead of 0", ((cast(*void)(*instance.input)) - cast(*void)(*instance)));
    assert(size_of(type_of(Animation_Sampler.input)) == 8, "Animation_Sampler.input has unexpected size % instead of 8", size_of(type_of(Animation_Sampler.input)));
    assert(((cast(*void)(*instance.output)) - cast(*void)(*instance)) == 8, "Animation_Sampler.output has unexpected offset % instead of 8", ((cast(*void)(*instance.output)) - cast(*void)(*instance)));
    assert(size_of(type_of(Animation_Sampler.output)) == 8, "Animation_Sampler.output has unexpected size % instead of 8", size_of(type_of(Animation_Sampler.output)));
    assert(((cast(*void)(*instance.interpolation)) - cast(*void)(*instance)) == 16, "Animation_Sampler.interpolation has unexpected offset % instead of 16", ((cast(*void)(*instance.interpolation)) - cast(*void)(*instance)));
    assert(size_of(type_of(Animation_Sampler.interpolation)) == 4, "Animation_Sampler.interpolation has unexpected size % instead of 4", size_of(type_of(Animation_Sampler.interpolation)));
    assert(((cast(*void)(*instance.extras)) - cast(*void)(*instance)) == 24, "Animation_Sampler.extras has unexpected offset % instead of 24", ((cast(*void)(*instance.extras)) - cast(*void)(*instance)));
    assert(size_of(type_of(Animation_Sampler.extras)) == 16, "Animation_Sampler.extras has unexpected size % instead of 16", size_of(type_of(Animation_Sampler.extras)));
    assert(((cast(*void)(*instance.extensions_count)) - cast(*void)(*instance)) == 40, "Animation_Sampler.extensions_count has unexpected offset % instead of 40", ((cast(*void)(*instance.extensions_count)) - cast(*void)(*instance)));
    assert(size_of(type_of(Animation_Sampler.extensions_count)) == 8, "Animation_Sampler.extensions_count has unexpected size % instead of 8", size_of(type_of(Animation_Sampler.extensions_count)));
    assert(((cast(*void)(*instance.extensions)) - cast(*void)(*instance)) == 48, "Animation_Sampler.extensions has unexpected offset % instead of 48", ((cast(*void)(*instance.extensions)) - cast(*void)(*instance)));
    assert(size_of(type_of(Animation_Sampler.extensions)) == 8, "Animation_Sampler.extensions has unexpected size % instead of 8", size_of(type_of(Animation_Sampler.extensions)));
    assert(size_of(Animation_Sampler) == 56, "Animation_Sampler has size % instead of 56", size_of(Animation_Sampler));
}

cgltf_animation_sampler :: Animation_Sampler;

Animation_Channel :: struct {
    sampler:          *cgltf_animation_sampler;
    target_node:      *cgltf_node;
    target_path:      cgltf_animation_path_type;
    extras:           cgltf_extras;
    extensions_count: cgltf_size;
    extensions:       *cgltf_extension;
}
#run {
    instance: Animation_Channel;
    assert(((cast(*void)(*instance.sampler)) - cast(*void)(*instance)) == 0, "Animation_Channel.sampler has unexpected offset % instead of 0", ((cast(*void)(*instance.sampler)) - cast(*void)(*instance)));
    assert(size_of(type_of(Animation_Channel.sampler)) == 8, "Animation_Channel.sampler has unexpected size % instead of 8", size_of(type_of(Animation_Channel.sampler)));
    assert(((cast(*void)(*instance.target_node)) - cast(*void)(*instance)) == 8, "Animation_Channel.target_node has unexpected offset % instead of 8", ((cast(*void)(*instance.target_node)) - cast(*void)(*instance)));
    assert(size_of(type_of(Animation_Channel.target_node)) == 8, "Animation_Channel.target_node has unexpected size % instead of 8", size_of(type_of(Animation_Channel.target_node)));
    assert(((cast(*void)(*instance.target_path)) - cast(*void)(*instance)) == 16, "Animation_Channel.target_path has unexpected offset % instead of 16", ((cast(*void)(*instance.target_path)) - cast(*void)(*instance)));
    assert(size_of(type_of(Animation_Channel.target_path)) == 4, "Animation_Channel.target_path has unexpected size % instead of 4", size_of(type_of(Animation_Channel.target_path)));
    assert(((cast(*void)(*instance.extras)) - cast(*void)(*instance)) == 24, "Animation_Channel.extras has unexpected offset % instead of 24", ((cast(*void)(*instance.extras)) - cast(*void)(*instance)));
    assert(size_of(type_of(Animation_Channel.extras)) == 16, "Animation_Channel.extras has unexpected size % instead of 16", size_of(type_of(Animation_Channel.extras)));
    assert(((cast(*void)(*instance.extensions_count)) - cast(*void)(*instance)) == 40, "Animation_Channel.extensions_count has unexpected offset % instead of 40", ((cast(*void)(*instance.extensions_count)) - cast(*void)(*instance)));
    assert(size_of(type_of(Animation_Channel.extensions_count)) == 8, "Animation_Channel.extensions_count has unexpected size % instead of 8", size_of(type_of(Animation_Channel.extensions_count)));
    assert(((cast(*void)(*instance.extensions)) - cast(*void)(*instance)) == 48, "Animation_Channel.extensions has unexpected offset % instead of 48", ((cast(*void)(*instance.extensions)) - cast(*void)(*instance)));
    assert(size_of(type_of(Animation_Channel.extensions)) == 8, "Animation_Channel.extensions has unexpected size % instead of 8", size_of(type_of(Animation_Channel.extensions)));
    assert(size_of(Animation_Channel) == 56, "Animation_Channel has size % instead of 56", size_of(Animation_Channel));
}

cgltf_animation_channel :: Animation_Channel;

Animation :: struct {
    name:             *u8;
    samplers:         *cgltf_animation_sampler;
    samplers_count:   cgltf_size;
    channels:         *cgltf_animation_channel;
    channels_count:   cgltf_size;
    extras:           cgltf_extras;
    extensions_count: cgltf_size;
    extensions:       *cgltf_extension;
}
#run {
    instance: Animation;
    assert(((cast(*void)(*instance.name)) - cast(*void)(*instance)) == 0, "Animation.name has unexpected offset % instead of 0", ((cast(*void)(*instance.name)) - cast(*void)(*instance)));
    assert(size_of(type_of(Animation.name)) == 8, "Animation.name has unexpected size % instead of 8", size_of(type_of(Animation.name)));
    assert(((cast(*void)(*instance.samplers)) - cast(*void)(*instance)) == 8, "Animation.samplers has unexpected offset % instead of 8", ((cast(*void)(*instance.samplers)) - cast(*void)(*instance)));
    assert(size_of(type_of(Animation.samplers)) == 8, "Animation.samplers has unexpected size % instead of 8", size_of(type_of(Animation.samplers)));
    assert(((cast(*void)(*instance.samplers_count)) - cast(*void)(*instance)) == 16, "Animation.samplers_count has unexpected offset % instead of 16", ((cast(*void)(*instance.samplers_count)) - cast(*void)(*instance)));
    assert(size_of(type_of(Animation.samplers_count)) == 8, "Animation.samplers_count has unexpected size % instead of 8", size_of(type_of(Animation.samplers_count)));
    assert(((cast(*void)(*instance.channels)) - cast(*void)(*instance)) == 24, "Animation.channels has unexpected offset % instead of 24", ((cast(*void)(*instance.channels)) - cast(*void)(*instance)));
    assert(size_of(type_of(Animation.channels)) == 8, "Animation.channels has unexpected size % instead of 8", size_of(type_of(Animation.channels)));
    assert(((cast(*void)(*instance.channels_count)) - cast(*void)(*instance)) == 32, "Animation.channels_count has unexpected offset % instead of 32", ((cast(*void)(*instance.channels_count)) - cast(*void)(*instance)));
    assert(size_of(type_of(Animation.channels_count)) == 8, "Animation.channels_count has unexpected size % instead of 8", size_of(type_of(Animation.channels_count)));
    assert(((cast(*void)(*instance.extras)) - cast(*void)(*instance)) == 40, "Animation.extras has unexpected offset % instead of 40", ((cast(*void)(*instance.extras)) - cast(*void)(*instance)));
    assert(size_of(type_of(Animation.extras)) == 16, "Animation.extras has unexpected size % instead of 16", size_of(type_of(Animation.extras)));
    assert(((cast(*void)(*instance.extensions_count)) - cast(*void)(*instance)) == 56, "Animation.extensions_count has unexpected offset % instead of 56", ((cast(*void)(*instance.extensions_count)) - cast(*void)(*instance)));
    assert(size_of(type_of(Animation.extensions_count)) == 8, "Animation.extensions_count has unexpected size % instead of 8", size_of(type_of(Animation.extensions_count)));
    assert(((cast(*void)(*instance.extensions)) - cast(*void)(*instance)) == 64, "Animation.extensions has unexpected offset % instead of 64", ((cast(*void)(*instance.extensions)) - cast(*void)(*instance)));
    assert(size_of(type_of(Animation.extensions)) == 8, "Animation.extensions has unexpected size % instead of 8", size_of(type_of(Animation.extensions)));
    assert(size_of(Animation) == 72, "Animation has size % instead of 72", size_of(Animation));
}

cgltf_animation :: Animation;

Material_Variant :: struct {
    name:   *u8;
    extras: cgltf_extras;
}
#run {
    instance: Material_Variant;
    assert(((cast(*void)(*instance.name)) - cast(*void)(*instance)) == 0, "Material_Variant.name has unexpected offset % instead of 0", ((cast(*void)(*instance.name)) - cast(*void)(*instance)));
    assert(size_of(type_of(Material_Variant.name)) == 8, "Material_Variant.name has unexpected size % instead of 8", size_of(type_of(Material_Variant.name)));
    assert(((cast(*void)(*instance.extras)) - cast(*void)(*instance)) == 8, "Material_Variant.extras has unexpected offset % instead of 8", ((cast(*void)(*instance.extras)) - cast(*void)(*instance)));
    assert(size_of(type_of(Material_Variant.extras)) == 16, "Material_Variant.extras has unexpected size % instead of 16", size_of(type_of(Material_Variant.extras)));
    assert(size_of(Material_Variant) == 24, "Material_Variant has size % instead of 24", size_of(Material_Variant));
}

cgltf_material_variant :: Material_Variant;

Asset :: struct {
    copyright:        *u8;
    generator:        *u8;
    version:          *u8;
    min_version:      *u8;
    extras:           cgltf_extras;
    extensions_count: cgltf_size;
    extensions:       *cgltf_extension;
}
#run {
    instance: Asset;
    assert(((cast(*void)(*instance.copyright)) - cast(*void)(*instance)) == 0, "Asset.copyright has unexpected offset % instead of 0", ((cast(*void)(*instance.copyright)) - cast(*void)(*instance)));
    assert(size_of(type_of(Asset.copyright)) == 8, "Asset.copyright has unexpected size % instead of 8", size_of(type_of(Asset.copyright)));
    assert(((cast(*void)(*instance.generator)) - cast(*void)(*instance)) == 8, "Asset.generator has unexpected offset % instead of 8", ((cast(*void)(*instance.generator)) - cast(*void)(*instance)));
    assert(size_of(type_of(Asset.generator)) == 8, "Asset.generator has unexpected size % instead of 8", size_of(type_of(Asset.generator)));
    assert(((cast(*void)(*instance.version)) - cast(*void)(*instance)) == 16, "Asset.version has unexpected offset % instead of 16", ((cast(*void)(*instance.version)) - cast(*void)(*instance)));
    assert(size_of(type_of(Asset.version)) == 8, "Asset.version has unexpected size % instead of 8", size_of(type_of(Asset.version)));
    assert(((cast(*void)(*instance.min_version)) - cast(*void)(*instance)) == 24, "Asset.min_version has unexpected offset % instead of 24", ((cast(*void)(*instance.min_version)) - cast(*void)(*instance)));
    assert(size_of(type_of(Asset.min_version)) == 8, "Asset.min_version has unexpected size % instead of 8", size_of(type_of(Asset.min_version)));
    assert(((cast(*void)(*instance.extras)) - cast(*void)(*instance)) == 32, "Asset.extras has unexpected offset % instead of 32", ((cast(*void)(*instance.extras)) - cast(*void)(*instance)));
    assert(size_of(type_of(Asset.extras)) == 16, "Asset.extras has unexpected size % instead of 16", size_of(type_of(Asset.extras)));
    assert(((cast(*void)(*instance.extensions_count)) - cast(*void)(*instance)) == 48, "Asset.extensions_count has unexpected offset % instead of 48", ((cast(*void)(*instance.extensions_count)) - cast(*void)(*instance)));
    assert(size_of(type_of(Asset.extensions_count)) == 8, "Asset.extensions_count has unexpected size % instead of 8", size_of(type_of(Asset.extensions_count)));
    assert(((cast(*void)(*instance.extensions)) - cast(*void)(*instance)) == 56, "Asset.extensions has unexpected offset % instead of 56", ((cast(*void)(*instance.extensions)) - cast(*void)(*instance)));
    assert(size_of(type_of(Asset.extensions)) == 8, "Asset.extensions has unexpected size % instead of 8", size_of(type_of(Asset.extensions)));
    assert(size_of(Asset) == 64, "Asset has size % instead of 64", size_of(Asset));
}

cgltf_asset :: Asset;

Data :: struct {
    file_type:                 cgltf_file_type;
    file_data:                 *void;

    asset:                     cgltf_asset;

    meshes:                    *cgltf_mesh;
    meshes_count:              cgltf_size;

    materials:                 *cgltf_material;
    materials_count:           cgltf_size;

    accessors:                 *cgltf_accessor;
    accessors_count:           cgltf_size;

    buffer_views:              *cgltf_buffer_view;
    buffer_views_count:        cgltf_size;

    buffers:                   *cgltf_buffer;
    buffers_count:             cgltf_size;

    images:                    *cgltf_image;
    images_count:              cgltf_size;

    textures:                  *cgltf_texture;
    textures_count:            cgltf_size;

    samplers:                  *cgltf_sampler;
    samplers_count:            cgltf_size;

    skins:                     *cgltf_skin;
    skins_count:               cgltf_size;

    cameras:                   *cgltf_camera;
    cameras_count:             cgltf_size;

    lights:                    *cgltf_light;
    lights_count:              cgltf_size;

    nodes:                     *cgltf_node;
    nodes_count:               cgltf_size;

    scenes:                    *cgltf_scene;
    scenes_count:              cgltf_size;

    scene:                     *cgltf_scene;

    animations:                *cgltf_animation;
    animations_count:          cgltf_size;

    variants:                  *cgltf_material_variant;
    variants_count:            cgltf_size;

    extras:                    cgltf_extras;

    data_extensions_count:     cgltf_size;
    data_extensions:           *cgltf_extension;

    extensions_used:           **u8;
    extensions_used_count:     cgltf_size;

    extensions_required:       **u8;
    extensions_required_count: cgltf_size;

    json:                      *u8;
    json_size:                 cgltf_size;

    bin:                       *void;
    bin_size:                  cgltf_size;

    memory:                    cgltf_memory_options;
    file:                      cgltf_file_options;
}
#run {
    instance: Data;
    assert(((cast(*void)(*instance.file_type)) - cast(*void)(*instance)) == 0, "Data.file_type has unexpected offset % instead of 0", ((cast(*void)(*instance.file_type)) - cast(*void)(*instance)));
    assert(size_of(type_of(Data.file_type)) == 4, "Data.file_type has unexpected size % instead of 4", size_of(type_of(Data.file_type)));
    assert(((cast(*void)(*instance.file_data)) - cast(*void)(*instance)) == 8, "Data.file_data has unexpected offset % instead of 8", ((cast(*void)(*instance.file_data)) - cast(*void)(*instance)));
    assert(size_of(type_of(Data.file_data)) == 8, "Data.file_data has unexpected size % instead of 8", size_of(type_of(Data.file_data)));
    assert(((cast(*void)(*instance.asset)) - cast(*void)(*instance)) == 16, "Data.asset has unexpected offset % instead of 16", ((cast(*void)(*instance.asset)) - cast(*void)(*instance)));
    assert(size_of(type_of(Data.asset)) == 64, "Data.asset has unexpected size % instead of 64", size_of(type_of(Data.asset)));
    assert(((cast(*void)(*instance.meshes)) - cast(*void)(*instance)) == 80, "Data.meshes has unexpected offset % instead of 80", ((cast(*void)(*instance.meshes)) - cast(*void)(*instance)));
    assert(size_of(type_of(Data.meshes)) == 8, "Data.meshes has unexpected size % instead of 8", size_of(type_of(Data.meshes)));
    assert(((cast(*void)(*instance.meshes_count)) - cast(*void)(*instance)) == 88, "Data.meshes_count has unexpected offset % instead of 88", ((cast(*void)(*instance.meshes_count)) - cast(*void)(*instance)));
    assert(size_of(type_of(Data.meshes_count)) == 8, "Data.meshes_count has unexpected size % instead of 8", size_of(type_of(Data.meshes_count)));
    assert(((cast(*void)(*instance.materials)) - cast(*void)(*instance)) == 96, "Data.materials has unexpected offset % instead of 96", ((cast(*void)(*instance.materials)) - cast(*void)(*instance)));
    assert(size_of(type_of(Data.materials)) == 8, "Data.materials has unexpected size % instead of 8", size_of(type_of(Data.materials)));
    assert(((cast(*void)(*instance.materials_count)) - cast(*void)(*instance)) == 104, "Data.materials_count has unexpected offset % instead of 104", ((cast(*void)(*instance.materials_count)) - cast(*void)(*instance)));
    assert(size_of(type_of(Data.materials_count)) == 8, "Data.materials_count has unexpected size % instead of 8", size_of(type_of(Data.materials_count)));
    assert(((cast(*void)(*instance.accessors)) - cast(*void)(*instance)) == 112, "Data.accessors has unexpected offset % instead of 112", ((cast(*void)(*instance.accessors)) - cast(*void)(*instance)));
    assert(size_of(type_of(Data.accessors)) == 8, "Data.accessors has unexpected size % instead of 8", size_of(type_of(Data.accessors)));
    assert(((cast(*void)(*instance.accessors_count)) - cast(*void)(*instance)) == 120, "Data.accessors_count has unexpected offset % instead of 120", ((cast(*void)(*instance.accessors_count)) - cast(*void)(*instance)));
    assert(size_of(type_of(Data.accessors_count)) == 8, "Data.accessors_count has unexpected size % instead of 8", size_of(type_of(Data.accessors_count)));
    assert(((cast(*void)(*instance.buffer_views)) - cast(*void)(*instance)) == 128, "Data.buffer_views has unexpected offset % instead of 128", ((cast(*void)(*instance.buffer_views)) - cast(*void)(*instance)));
    assert(size_of(type_of(Data.buffer_views)) == 8, "Data.buffer_views has unexpected size % instead of 8", size_of(type_of(Data.buffer_views)));
    assert(((cast(*void)(*instance.buffer_views_count)) - cast(*void)(*instance)) == 136, "Data.buffer_views_count has unexpected offset % instead of 136", ((cast(*void)(*instance.buffer_views_count)) - cast(*void)(*instance)));
    assert(size_of(type_of(Data.buffer_views_count)) == 8, "Data.buffer_views_count has unexpected size % instead of 8", size_of(type_of(Data.buffer_views_count)));
    assert(((cast(*void)(*instance.buffers)) - cast(*void)(*instance)) == 144, "Data.buffers has unexpected offset % instead of 144", ((cast(*void)(*instance.buffers)) - cast(*void)(*instance)));
    assert(size_of(type_of(Data.buffers)) == 8, "Data.buffers has unexpected size % instead of 8", size_of(type_of(Data.buffers)));
    assert(((cast(*void)(*instance.buffers_count)) - cast(*void)(*instance)) == 152, "Data.buffers_count has unexpected offset % instead of 152", ((cast(*void)(*instance.buffers_count)) - cast(*void)(*instance)));
    assert(size_of(type_of(Data.buffers_count)) == 8, "Data.buffers_count has unexpected size % instead of 8", size_of(type_of(Data.buffers_count)));
    assert(((cast(*void)(*instance.images)) - cast(*void)(*instance)) == 160, "Data.images has unexpected offset % instead of 160", ((cast(*void)(*instance.images)) - cast(*void)(*instance)));
    assert(size_of(type_of(Data.images)) == 8, "Data.images has unexpected size % instead of 8", size_of(type_of(Data.images)));
    assert(((cast(*void)(*instance.images_count)) - cast(*void)(*instance)) == 168, "Data.images_count has unexpected offset % instead of 168", ((cast(*void)(*instance.images_count)) - cast(*void)(*instance)));
    assert(size_of(type_of(Data.images_count)) == 8, "Data.images_count has unexpected size % instead of 8", size_of(type_of(Data.images_count)));
    assert(((cast(*void)(*instance.textures)) - cast(*void)(*instance)) == 176, "Data.textures has unexpected offset % instead of 176", ((cast(*void)(*instance.textures)) - cast(*void)(*instance)));
    assert(size_of(type_of(Data.textures)) == 8, "Data.textures has unexpected size % instead of 8", size_of(type_of(Data.textures)));
    assert(((cast(*void)(*instance.textures_count)) - cast(*void)(*instance)) == 184, "Data.textures_count has unexpected offset % instead of 184", ((cast(*void)(*instance.textures_count)) - cast(*void)(*instance)));
    assert(size_of(type_of(Data.textures_count)) == 8, "Data.textures_count has unexpected size % instead of 8", size_of(type_of(Data.textures_count)));
    assert(((cast(*void)(*instance.samplers)) - cast(*void)(*instance)) == 192, "Data.samplers has unexpected offset % instead of 192", ((cast(*void)(*instance.samplers)) - cast(*void)(*instance)));
    assert(size_of(type_of(Data.samplers)) == 8, "Data.samplers has unexpected size % instead of 8", size_of(type_of(Data.samplers)));
    assert(((cast(*void)(*instance.samplers_count)) - cast(*void)(*instance)) == 200, "Data.samplers_count has unexpected offset % instead of 200", ((cast(*void)(*instance.samplers_count)) - cast(*void)(*instance)));
    assert(size_of(type_of(Data.samplers_count)) == 8, "Data.samplers_count has unexpected size % instead of 8", size_of(type_of(Data.samplers_count)));
    assert(((cast(*void)(*instance.skins)) - cast(*void)(*instance)) == 208, "Data.skins has unexpected offset % instead of 208", ((cast(*void)(*instance.skins)) - cast(*void)(*instance)));
    assert(size_of(type_of(Data.skins)) == 8, "Data.skins has unexpected size % instead of 8", size_of(type_of(Data.skins)));
    assert(((cast(*void)(*instance.skins_count)) - cast(*void)(*instance)) == 216, "Data.skins_count has unexpected offset % instead of 216", ((cast(*void)(*instance.skins_count)) - cast(*void)(*instance)));
    assert(size_of(type_of(Data.skins_count)) == 8, "Data.skins_count has unexpected size % instead of 8", size_of(type_of(Data.skins_count)));
    assert(((cast(*void)(*instance.cameras)) - cast(*void)(*instance)) == 224, "Data.cameras has unexpected offset % instead of 224", ((cast(*void)(*instance.cameras)) - cast(*void)(*instance)));
    assert(size_of(type_of(Data.cameras)) == 8, "Data.cameras has unexpected size % instead of 8", size_of(type_of(Data.cameras)));
    assert(((cast(*void)(*instance.cameras_count)) - cast(*void)(*instance)) == 232, "Data.cameras_count has unexpected offset % instead of 232", ((cast(*void)(*instance.cameras_count)) - cast(*void)(*instance)));
    assert(size_of(type_of(Data.cameras_count)) == 8, "Data.cameras_count has unexpected size % instead of 8", size_of(type_of(Data.cameras_count)));
    assert(((cast(*void)(*instance.lights)) - cast(*void)(*instance)) == 240, "Data.lights has unexpected offset % instead of 240", ((cast(*void)(*instance.lights)) - cast(*void)(*instance)));
    assert(size_of(type_of(Data.lights)) == 8, "Data.lights has unexpected size % instead of 8", size_of(type_of(Data.lights)));
    assert(((cast(*void)(*instance.lights_count)) - cast(*void)(*instance)) == 248, "Data.lights_count has unexpected offset % instead of 248", ((cast(*void)(*instance.lights_count)) - cast(*void)(*instance)));
    assert(size_of(type_of(Data.lights_count)) == 8, "Data.lights_count has unexpected size % instead of 8", size_of(type_of(Data.lights_count)));
    assert(((cast(*void)(*instance.nodes)) - cast(*void)(*instance)) == 256, "Data.nodes has unexpected offset % instead of 256", ((cast(*void)(*instance.nodes)) - cast(*void)(*instance)));
    assert(size_of(type_of(Data.nodes)) == 8, "Data.nodes has unexpected size % instead of 8", size_of(type_of(Data.nodes)));
    assert(((cast(*void)(*instance.nodes_count)) - cast(*void)(*instance)) == 264, "Data.nodes_count has unexpected offset % instead of 264", ((cast(*void)(*instance.nodes_count)) - cast(*void)(*instance)));
    assert(size_of(type_of(Data.nodes_count)) == 8, "Data.nodes_count has unexpected size % instead of 8", size_of(type_of(Data.nodes_count)));
    assert(((cast(*void)(*instance.scenes)) - cast(*void)(*instance)) == 272, "Data.scenes has unexpected offset % instead of 272", ((cast(*void)(*instance.scenes)) - cast(*void)(*instance)));
    assert(size_of(type_of(Data.scenes)) == 8, "Data.scenes has unexpected size % instead of 8", size_of(type_of(Data.scenes)));
    assert(((cast(*void)(*instance.scenes_count)) - cast(*void)(*instance)) == 280, "Data.scenes_count has unexpected offset % instead of 280", ((cast(*void)(*instance.scenes_count)) - cast(*void)(*instance)));
    assert(size_of(type_of(Data.scenes_count)) == 8, "Data.scenes_count has unexpected size % instead of 8", size_of(type_of(Data.scenes_count)));
    assert(((cast(*void)(*instance.scene)) - cast(*void)(*instance)) == 288, "Data.scene has unexpected offset % instead of 288", ((cast(*void)(*instance.scene)) - cast(*void)(*instance)));
    assert(size_of(type_of(Data.scene)) == 8, "Data.scene has unexpected size % instead of 8", size_of(type_of(Data.scene)));
    assert(((cast(*void)(*instance.animations)) - cast(*void)(*instance)) == 296, "Data.animations has unexpected offset % instead of 296", ((cast(*void)(*instance.animations)) - cast(*void)(*instance)));
    assert(size_of(type_of(Data.animations)) == 8, "Data.animations has unexpected size % instead of 8", size_of(type_of(Data.animations)));
    assert(((cast(*void)(*instance.animations_count)) - cast(*void)(*instance)) == 304, "Data.animations_count has unexpected offset % instead of 304", ((cast(*void)(*instance.animations_count)) - cast(*void)(*instance)));
    assert(size_of(type_of(Data.animations_count)) == 8, "Data.animations_count has unexpected size % instead of 8", size_of(type_of(Data.animations_count)));
    assert(((cast(*void)(*instance.variants)) - cast(*void)(*instance)) == 312, "Data.variants has unexpected offset % instead of 312", ((cast(*void)(*instance.variants)) - cast(*void)(*instance)));
    assert(size_of(type_of(Data.variants)) == 8, "Data.variants has unexpected size % instead of 8", size_of(type_of(Data.variants)));
    assert(((cast(*void)(*instance.variants_count)) - cast(*void)(*instance)) == 320, "Data.variants_count has unexpected offset % instead of 320", ((cast(*void)(*instance.variants_count)) - cast(*void)(*instance)));
    assert(size_of(type_of(Data.variants_count)) == 8, "Data.variants_count has unexpected size % instead of 8", size_of(type_of(Data.variants_count)));
    assert(((cast(*void)(*instance.extras)) - cast(*void)(*instance)) == 328, "Data.extras has unexpected offset % instead of 328", ((cast(*void)(*instance.extras)) - cast(*void)(*instance)));
    assert(size_of(type_of(Data.extras)) == 16, "Data.extras has unexpected size % instead of 16", size_of(type_of(Data.extras)));
    assert(((cast(*void)(*instance.data_extensions_count)) - cast(*void)(*instance)) == 344, "Data.data_extensions_count has unexpected offset % instead of 344", ((cast(*void)(*instance.data_extensions_count)) - cast(*void)(*instance)));
    assert(size_of(type_of(Data.data_extensions_count)) == 8, "Data.data_extensions_count has unexpected size % instead of 8", size_of(type_of(Data.data_extensions_count)));
    assert(((cast(*void)(*instance.data_extensions)) - cast(*void)(*instance)) == 352, "Data.data_extensions has unexpected offset % instead of 352", ((cast(*void)(*instance.data_extensions)) - cast(*void)(*instance)));
    assert(size_of(type_of(Data.data_extensions)) == 8, "Data.data_extensions has unexpected size % instead of 8", size_of(type_of(Data.data_extensions)));
    assert(((cast(*void)(*instance.extensions_used)) - cast(*void)(*instance)) == 360, "Data.extensions_used has unexpected offset % instead of 360", ((cast(*void)(*instance.extensions_used)) - cast(*void)(*instance)));
    assert(size_of(type_of(Data.extensions_used)) == 8, "Data.extensions_used has unexpected size % instead of 8", size_of(type_of(Data.extensions_used)));
    assert(((cast(*void)(*instance.extensions_used_count)) - cast(*void)(*instance)) == 368, "Data.extensions_used_count has unexpected offset % instead of 368", ((cast(*void)(*instance.extensions_used_count)) - cast(*void)(*instance)));
    assert(size_of(type_of(Data.extensions_used_count)) == 8, "Data.extensions_used_count has unexpected size % instead of 8", size_of(type_of(Data.extensions_used_count)));
    assert(((cast(*void)(*instance.extensions_required)) - cast(*void)(*instance)) == 376, "Data.extensions_required has unexpected offset % instead of 376", ((cast(*void)(*instance.extensions_required)) - cast(*void)(*instance)));
    assert(size_of(type_of(Data.extensions_required)) == 8, "Data.extensions_required has unexpected size % instead of 8", size_of(type_of(Data.extensions_required)));
    assert(((cast(*void)(*instance.extensions_required_count)) - cast(*void)(*instance)) == 384, "Data.extensions_required_count has unexpected offset % instead of 384", ((cast(*void)(*instance.extensions_required_count)) - cast(*void)(*instance)));
    assert(size_of(type_of(Data.extensions_required_count)) == 8, "Data.extensions_required_count has unexpected size % instead of 8", size_of(type_of(Data.extensions_required_count)));
    assert(((cast(*void)(*instance.json)) - cast(*void)(*instance)) == 392, "Data.json has unexpected offset % instead of 392", ((cast(*void)(*instance.json)) - cast(*void)(*instance)));
    assert(size_of(type_of(Data.json)) == 8, "Data.json has unexpected size % instead of 8", size_of(type_of(Data.json)));
    assert(((cast(*void)(*instance.json_size)) - cast(*void)(*instance)) == 400, "Data.json_size has unexpected offset % instead of 400", ((cast(*void)(*instance.json_size)) - cast(*void)(*instance)));
    assert(size_of(type_of(Data.json_size)) == 8, "Data.json_size has unexpected size % instead of 8", size_of(type_of(Data.json_size)));
    assert(((cast(*void)(*instance.bin)) - cast(*void)(*instance)) == 408, "Data.bin has unexpected offset % instead of 408", ((cast(*void)(*instance.bin)) - cast(*void)(*instance)));
    assert(size_of(type_of(Data.bin)) == 8, "Data.bin has unexpected size % instead of 8", size_of(type_of(Data.bin)));
    assert(((cast(*void)(*instance.bin_size)) - cast(*void)(*instance)) == 416, "Data.bin_size has unexpected offset % instead of 416", ((cast(*void)(*instance.bin_size)) - cast(*void)(*instance)));
    assert(size_of(type_of(Data.bin_size)) == 8, "Data.bin_size has unexpected size % instead of 8", size_of(type_of(Data.bin_size)));
    assert(((cast(*void)(*instance.memory)) - cast(*void)(*instance)) == 424, "Data.memory has unexpected offset % instead of 424", ((cast(*void)(*instance.memory)) - cast(*void)(*instance)));
    assert(size_of(type_of(Data.memory)) == 24, "Data.memory has unexpected size % instead of 24", size_of(type_of(Data.memory)));
    assert(((cast(*void)(*instance.file)) - cast(*void)(*instance)) == 448, "Data.file has unexpected offset % instead of 448", ((cast(*void)(*instance.file)) - cast(*void)(*instance)));
    assert(size_of(type_of(Data.file)) == 24, "Data.file has unexpected size % instead of 24", size_of(type_of(Data.file)));
    assert(size_of(Data) == 472, "Data has size % instead of 472", size_of(Data));
}

cgltf_data :: Data;

parse :: (options: *cgltf_options, data: *void, size: cgltf_size, out_data: **cgltf_data) -> cgltf_result #foreign cgltf "cgltf_parse";

parse_file :: (options: *cgltf_options, path: *u8, out_data: **cgltf_data) -> cgltf_result #foreign cgltf "cgltf_parse_file";

load_buffers :: (options: *cgltf_options, data: *cgltf_data, gltf_path: *u8) -> cgltf_result #foreign cgltf "cgltf_load_buffers";

load_buffer_base64 :: (options: *cgltf_options, size: cgltf_size, base64: *u8, out_data: **void) -> cgltf_result #foreign cgltf "cgltf_load_buffer_base64";

decode_string :: (_string: *u8) -> cgltf_size #foreign cgltf "cgltf_decode_string";
decode_uri :: (uri: *u8) -> cgltf_size #foreign cgltf "cgltf_decode_uri";

validate :: (data: *cgltf_data) -> cgltf_result #foreign cgltf "cgltf_validate";

free :: (data: *cgltf_data) -> void #foreign cgltf "cgltf_free";

node_transform_local :: (node: *cgltf_node, out_matrix: *cgltf_float) -> void #foreign cgltf "cgltf_node_transform_local";
node_transform_world :: (node: *cgltf_node, out_matrix: *cgltf_float) -> void #foreign cgltf "cgltf_node_transform_world";

accessor_read_float :: (accessor: *cgltf_accessor, index: cgltf_size, out: *cgltf_float, element_size: cgltf_size) -> cgltf_bool #foreign cgltf "cgltf_accessor_read_float";
accessor_read_uint :: (accessor: *cgltf_accessor, index: cgltf_size, out: *cgltf_uint, element_size: cgltf_size) -> cgltf_bool #foreign cgltf "cgltf_accessor_read_uint";
accessor_read_index :: (accessor: *cgltf_accessor, index: cgltf_size) -> cgltf_size #foreign cgltf "cgltf_accessor_read_index";

num_components :: (type: cgltf_type) -> cgltf_size #foreign cgltf "cgltf_num_components";

accessor_unpack_floats :: (accessor: *cgltf_accessor, out: *cgltf_float, float_count: cgltf_size) -> cgltf_size #foreign cgltf "cgltf_accessor_unpack_floats";

copy_extras_json :: (data: *cgltf_data, extras: *cgltf_extras, dest: *u8, dest_size: *cgltf_size) -> cgltf_result #foreign cgltf "cgltf_copy_extras_json";

write_file :: (options: *cgltf_options, path: *u8, data: *cgltf_data) -> cgltf_result #foreign cgltf "cgltf_write_file";
write :: (options: *cgltf_options, buffer: *u8, size: cgltf_size, data: *cgltf_data) -> cgltf_size #foreign cgltf "cgltf_write";

#scope_file

#import "Basic"; // For assert
cgltf :: #foreign_library,no_dll "./cgltf";
