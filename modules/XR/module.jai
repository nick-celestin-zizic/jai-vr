//
// This file was auto-generated using the following command:
//
// jai build.jai
//
#import "Windows";
#import "d3d11";
#import "Compiler";
#import "Math";
XR_MAKE_VERSION :: inline (major: u64, minor: u64, patch: u64) -> u64 {
    return (((major) & 0xffff) << 48) | (((minor) & 0xffff) << 32) | ((patch) & 0xffffffff);
}

XR_VERSION_MAJOR :: inline (version: u64) -> u16 {
    return cast(u16) ((version >> 48) & 0xffff);
}

XR_VERSION_MINOR :: inline (version: u64) -> u16 {
    return cast(u16) ((version >> 32) & 0xffff);
}

XR_VERSION_PATCH :: inline (version: u64) -> u16 {
    return cast(u16) (version & 0xffffffff);
}

XR_CURRENT_API_VERSION :: #run XR_MAKE_VERSION(1, 0, 24);

check_xr_result :: (r: XrResult) -> XrResult { return r; }

xr_check :: (result: XrResult, using loc := #caller_location, code := #caller_code) #expand {
    if ((cast(s32) result) + 0) < 0 {
    //if (cast(s32) result) < 0 { // WTFFFF
        
        result_c_str : [XR_MAX_RESULT_STRING_SIZE] u8;
        xrResultToString(`xr_instance, result, *result_c_str);
        log_error("%:%:%:%failed with code %:\n  %",
                  fully_pathed_filename, line_number, character_number,
                  #insert -> string {
                      _, exprs := compiler_get_nodes(code);
                      name := "\"\";";
                      for exprs {
                          if it.kind == .PROCEDURE_CALL {
                              pc := cast(*Code_Procedure_Call) it;
                              ident := cast(*Code_Ident) pc.procedure_expression;
                              if ident.name != "xr_check" then name = tprint("\" % \";", ident.name);
                          }
                      }
                      return name;
                  }, result, to_string(result_c_str.data));
        #insert `on_fail;
    }
}

load_extension_function_pointers :: (xr_instance: XrInstance) {
    on_fail :: #code exit(1);
    xr_check(xrGetInstanceProcAddr(xr_instance, "xrGetD3D11GraphicsRequirementsKHR", cast(*PFN_xrVoidFunction) *xrGetD3D11GraphicsRequirementsKHR));
    xr_check(xrGetInstanceProcAddr(xr_instance, "xrCreateDebugUtilsMessengerEXT", cast(*PFN_xrVoidFunction) *xrCreateDebugUtilsMessengerEXT));
    xr_check(xrGetInstanceProcAddr(xr_instance, "xrDestroyDebugUtilsMessengerEXT", cast(*PFN_xrVoidFunction) *xrDestroyDebugUtilsMessengerEXT));
    
}

// extension function pointers
xrCreateSpatialAnchorMSFT: PFN_xrCreateSpatialAnchorMSFT;
xrCreateSpatialAnchorSpaceMSFT: PFN_xrCreateSpatialAnchorSpaceMSFT;
xrDestroySpatialAnchorMSFT: PFN_xrDestroySpatialAnchorMSFT;
xrCreateSceneObserverMSFT: PFN_xrCreateSceneObserverMSFT;
xrDestroySceneObserverMSFT: PFN_xrDestroySceneObserverMSFT;
xrCreateSceneMSFT: PFN_xrCreateSceneMSFT;
xrDestroySceneMSFT: PFN_xrDestroySceneMSFT;
xrComputeNewSceneMSFT: PFN_xrComputeNewSceneMSFT;
xrGetSceneComputeStateMSFT: PFN_xrGetSceneComputeStateMSFT;
xrGetSceneComponentsMSFT: PFN_xrGetSceneComponentsMSFT;
xrLocateSceneComponentsMSFT: PFN_xrLocateSceneComponentsMSFT;
xrEnumerateSceneComputeFeaturesMSFT: PFN_xrEnumerateSceneComputeFeaturesMSFT;
xrGetSceneMeshBuffersMSFT: PFN_xrGetSceneMeshBuffersMSFT;
xrGetVisibilityMaskKHR: PFN_xrGetVisibilityMaskKHR;
xrCreateHandTrackerEXT: PFN_xrCreateHandTrackerEXT;
xrDestroyHandTrackerEXT: PFN_xrDestroyHandTrackerEXT;
xrLocateHandJointsEXT: PFN_xrLocateHandJointsEXT;
xrCreateHandMeshSpaceMSFT: PFN_xrCreateHandMeshSpaceMSFT;
xrUpdateHandMeshMSFT: PFN_xrUpdateHandMeshMSFT;
xrEnumerateColorSpacesFB: PFN_xrEnumerateColorSpacesFB;
xrSetColorSpaceFB: PFN_xrSetColorSpaceFB;
xrCreateSpatialGraphNodeSpaceMSFT: PFN_xrCreateSpatialGraphNodeSpaceMSFT;
xrCreateDebugUtilsMessengerEXT: PFN_xrCreateDebugUtilsMessengerEXT;
xrDestroyDebugUtilsMessengerEXT: PFN_xrDestroyDebugUtilsMessengerEXT;
//xrConvertTimespecTimeToTimeKHR: PFN_xrConvertTimespecTimeToTimeKHR;
//xrConvertTimeToTimespecTimeKHR: PFN_xrConvertTimeToTimespecTimeKHR;

GraphicsBindingOpenGLWin32KHR :: struct {
    type: XrStructureType;
    next: *void;
    hDC: HDC;
    hGLRC: HGLRC;
}

GraphicsRequirementsOpenGLKHR :: struct {
    type: XrStructureType;
    next: *void;
    minApiVersionSupported: XrVersion;
    maxApiVersionSupported: XrVersion;
}

XrGraphicsRequirementsD3D11KHR :: struct {
    type: XrStructureType;
    next: *void;
    adapterLuid: LUID;
    min_feature_level: D3D_FEATURE_LEVEL;
}

SwapchainImageOpenGLKHR :: struct {
    type: XrStructureType;
    next: *void;
    image: u32;
}

XrSwapchainImageD3D11KHR :: struct {
    type: XrStructureType;
    next: *void;
    texture: *ID3D11Texture2D;
}

// sigh.......
XR_KHR_D3D11_enable_SPEC_VERSION  :: 9;
XR_KHR_D3D11_ENABLE_EXTENSION_NAME :: "XR_KHR_D3D11_enable";

// XrGraphicsBindingD3D11KHR extends XrSessionCreateInfo
XrGraphicsBindingD3D11KHR :: struct {
    type: XrStructureType; 
    next: *void;
    device: *ID3D11Device;
}

xrGetD3D11GraphicsRequirementsKHR : (instance: XrInstance, systemId: XrSystemId, graphicsRequirements: *XrGraphicsRequirementsD3D11KHR) -> XrResult #c_call #no_context = ---;

Matrix4x4f :: struct {
    m: [16]float;
}

GraphicsApi :: enum {
    VULKAN; OPENGL; OPENGL_ES;
}

XrDebugUtilsMessageSeverityFlagsEXT :: enum_flags XrFlags64 {
    VERBOSE :: 1;
    INFO    :: 16;
    WARNING :: 256;
    ERROR   :: 4096;
    ALL     :: VERBOSE | INFO | WARNING | ERROR;
}

XrDebugUtilsMessageTypeFlagsEXT :: enum_flags XrFlags64 {
    GENERAL     :: 1;
    VALIDATION  :: 2;
    PERFORMANCE :: 4;
    CONFORMANCE :: 8;
    ALL         :: GENERAL | VALIDATION | PERFORMANCE | CONFORMANCE;
}

// TODO: probably just get rid of these...

XrMatrix4x4f_CreateProjectionFov :: inline (result: *Matrix4x4f, graphicsApi: GraphicsApi, fov: XrFovf, nearZ: float, farZ: float) {
    tanAngleLeft  := tan(fov.angleLeft);
	  tanAngleRight := tan(fov.angleRight);

	  tanAngleDown  := tan(fov.angleDown);
	  tanAngleUp    := tan(fov.angleUp);

	  tanAngleWidth := tanAngleRight - tanAngleLeft;

    tanAngleHeight := ifx graphicsApi == .VULKAN then (tanAngleDown - tanAngleUp) else (tanAngleUp - tanAngleDown);

    offsetZ := ifx (graphicsApi == .OPENGL || graphicsApi == .OPENGL_ES) then nearZ else 0;

    if farZ < nearZ {
        // place the far plane at infinity
		    result.m[0] = 2 / tanAngleWidth;
		    result.m[4] = 0;
		    result.m[8] = (tanAngleRight + tanAngleLeft) / tanAngleWidth;
		    result.m[12] = 0;

		    result.m[1] = 0;
		    result.m[5] = 2 / tanAngleHeight;
		    result.m[9] = (tanAngleUp + tanAngleDown) / tanAngleHeight;
		    result.m[13] = 0;

		    result.m[2] = 0;
		    result.m[6] = 0;
		    result.m[10] = -1;
		    result.m[14] = -(nearZ + offsetZ);

		    result.m[3] = 0;
		    result.m[7] = 0;
		    result.m[11] = -1;
		    result.m[15] = 0;
	  } else {
		    // normal projection
		    result.m[0] = 2 / tanAngleWidth;
		    result.m[4] = 0;
		    result.m[8] = (tanAngleRight + tanAngleLeft) / tanAngleWidth;
		    result.m[12] = 0;

		    result.m[1] = 0;
		    result.m[5] = 2 / tanAngleHeight;
		    result.m[9] = (tanAngleUp + tanAngleDown) / tanAngleHeight;
		    result.m[13] = 0;

		    result.m[2] = 0;
		    result.m[6] = 0;
		    result.m[10] = -(farZ + offsetZ) / (farZ - nearZ);
		    result.m[14] = -(farZ * (nearZ + offsetZ)) / (farZ - nearZ);

		    result.m[3] = 0;
		    result.m[7] = 0;
		    result.m[11] = -1;
		    result.m[15] = 0;
	  }
}

XrMatrix4x4f_CreateViewMatrix :: inline (result: *Matrix4x4f, translation: *XrVector3f, rotation: XrQuaternionf) {
    rotationMatrix : Matrix4x4f = ---;
    XrMatrix4x4f_CreateFromQuaternion(*rotationMatrix, rotation);

    translationMatrix : Matrix4x4f = ---;
    XrMatrix4x4f_CreateTranslation(*translationMatrix, translation.x, translation.y, translation.z);

    viewMatrix : Matrix4x4f = ---;
    XrMatrix4x4f_Multiply(*viewMatrix, *translationMatrix, *rotationMatrix);

    XrMatrix4x4f_Invert(result, *viewMatrix);
}

XrMatrix4x4f_CreateFromQuaternion :: inline (result: *Matrix4x4f, quat: XrQuaternionf) {
    x2 := quat.x + quat.x;
	  y2 := quat.y + quat.y;
	  z2 := quat.z + quat.z;

	  xx2 := quat.x * x2;
	  yy2 := quat.y * y2;
	  zz2 := quat.z * z2;

	  yz2 := quat.y * z2;
	  wx2 := quat.w * x2;
	  xy2 := quat.x * y2;
	  wz2 := quat.w * z2;
	  xz2 := quat.x * z2;
	  wy2 := quat.w * y2;

    result.m[0] = 1.0 - yy2 - zz2;
	  result.m[1] = xy2 + wz2;
	  result.m[2] = xz2 - wy2;
	  result.m[3] = 0.0;

	  result.m[4] = xy2 - wz2;
	  result.m[5] = 1.0 - xx2 - zz2;
	  result.m[6] = yz2 + wx2;
	  result.m[7] = 0.0;

	  result.m[8] = xz2 + wy2;
	  result.m[9] = yz2 - wx2;
	  result.m[10] = 1.0 - xx2 - yy2;
	  result.m[11] = 0.0;

	  result.m[12] = 0.0;
	  result.m[13] = 0.0;
	  result.m[14] = 0.0;
	  result.m[15] = 1.0;
}

XrMatrix4x4f_CreateTranslation :: inline (result: *Matrix4x4f, x: float, y: float, z: float) {
    result.m[0] = 1.0;
	  result.m[1] = 0.0;
	  result.m[2] = 0.0;
	  result.m[3] = 0.0;
	  result.m[4] = 0.0;
	  result.m[5] = 1.0;
	  result.m[6] = 0.0;
	  result.m[7] = 0.0;
	  result.m[8] = 0.0;
	  result.m[9] = 0.0;
	  result.m[10] = 1.0;
	  result.m[11] = 0.0;
	  result.m[12] = x;
	  result.m[13] = y;
	  result.m[14] = z;
	  result.m[15] = 1.0;
}

XrMatrix4x4f_Multiply :: inline (result: *Matrix4x4f, a: *Matrix4x4f, b: *Matrix4x4f) {
    result.m[0] = a.m[0] * b.m[0] + a.m[4] * b.m[1] + a.m[8] * b.m[2] + a.m[12] * b.m[3];
	  result.m[1] = a.m[1] * b.m[0] + a.m[5] * b.m[1] + a.m[9] * b.m[2] + a.m[13] * b.m[3];
	  result.m[2] = a.m[2] * b.m[0] + a.m[6] * b.m[1] + a.m[10] * b.m[2] + a.m[14] * b.m[3];
	  result.m[3] = a.m[3] * b.m[0] + a.m[7] * b.m[1] + a.m[11] * b.m[2] + a.m[15] * b.m[3];

	  result.m[4] = a.m[0] * b.m[4] + a.m[4] * b.m[5] + a.m[8] * b.m[6] + a.m[12] * b.m[7];
	  result.m[5] = a.m[1] * b.m[4] + a.m[5] * b.m[5] + a.m[9] * b.m[6] + a.m[13] * b.m[7];
	  result.m[6] = a.m[2] * b.m[4] + a.m[6] * b.m[5] + a.m[10] * b.m[6] + a.m[14] * b.m[7];
	  result.m[7] = a.m[3] * b.m[4] + a.m[7] * b.m[5] + a.m[11] * b.m[6] + a.m[15] * b.m[7];

	  result.m[8] = a.m[0] * b.m[8] + a.m[4] * b.m[9] + a.m[8] * b.m[10] + a.m[12] * b.m[11];
	  result.m[9] = a.m[1] * b.m[8] + a.m[5] * b.m[9] + a.m[9] * b.m[10] + a.m[13] * b.m[11];
	  result.m[10] = a.m[2] * b.m[8] + a.m[6] * b.m[9] + a.m[10] * b.m[10] + a.m[14] * b.m[11];
	  result.m[11] = a.m[3] * b.m[8] + a.m[7] * b.m[9] + a.m[11] * b.m[10] + a.m[15] * b.m[11];

	  result.m[12] =
	      a.m[0] * b.m[12] + a.m[4] * b.m[13] + a.m[8] * b.m[14] + a.m[12] * b.m[15];
	  result.m[13] =
	      a.m[1] * b.m[12] + a.m[5] * b.m[13] + a.m[9] * b.m[14] + a.m[13] * b.m[15];
	  result.m[14] =
	      a.m[2] * b.m[12] + a.m[6] * b.m[13] + a.m[10] * b.m[14] + a.m[14] * b.m[15];
	  result.m[15] =
	      a.m[3] * b.m[12] + a.m[7] * b.m[13] + a.m[11] * b.m[14] + a.m[15] * b.m[15];
}

XrMatrix4x4f_Invert :: inline (result: *Matrix4x4f, src: *Matrix4x4f) {
    result.m[0] = src.m[0];
	  result.m[1] = src.m[4];
	  result.m[2] = src.m[8];
	  result.m[3] = 0.0;
	  result.m[4] = src.m[1];
	  result.m[5] = src.m[5];
	  result.m[6] = src.m[9];
	  result.m[7] = 0.0;
	  result.m[8] = src.m[2];
	  result.m[9] = src.m[6];
	  result.m[10] = src.m[10];
	  result.m[11] = 0.0;
	  result.m[12] = -(src.m[0] * src.m[12] + src.m[1] * src.m[13] + src.m[2] * src.m[14]);
	  result.m[13] = -(src.m[4] * src.m[12] + src.m[5] * src.m[13] + src.m[6] * src.m[14]);
	  result.m[14] = -(src.m[8] * src.m[12] + src.m[9] * src.m[13] + src.m[10] * src.m[14]);
	  result.m[15] = 1.0;
}



OPENXR_H_ :: 1;

XR_VERSION_1_0 :: 1;

OPENXR_PLATFORM_DEFINES_H_ :: 1;

PFN_xrQueryPerformanceMetricsCounterMETA :: #type (a0: XrSession, a1: XrPath, a2: *XrPerformanceMetricsCounterMETA) -> XrResult #c_call;

PFN_xrGetPerformanceMetricsStateMETA :: #type (a0: XrSession, a1: *XrPerformanceMetricsStateMETA) -> XrResult #c_call;

XR_PTR_SIZE :: 8;

XR_CPP11_ENABLED :: 1;

XR_CPP_NULLPTR_SUPPORTED :: 1;

PFN_xrSetPerformanceMetricsStateMETA :: #type (a0: XrSession, a1: *XrPerformanceMetricsStateMETA) -> XrResult #c_call;

XR_MIN_COMPOSITION_LAYERS_SUPPORTED :: 16;

PFN_xrEnumeratePerformanceMetricsCounterPathsMETA :: #type (a0: XrInstance, a1: u32, a2: *u32, a3: *XrPath) -> XrResult #c_call;

XR_NULL_SYSTEM_ID :: 0;

XR_NULL_PATH :: 0;

XR_NO_DURATION :: 0;

XR_INFINITE_DURATION :: 0x7fffffffffffffff;

XR_MIN_HAPTIC_DURATION :: -1;

XR_FREQUENCY_UNSPECIFIED :: 0;

XrPerformanceMetricsCounterMETA :: struct {
    type:         XrStructureType;
    next:         *void;
    counterFlags: XrPerformanceMetricsCounterFlagsMETA;
    counterUnit:  XrPerformanceMetricsCounterUnitMETA;
    uintValue:    u32;
    floatValue:   float;
}
#run {
    instance: XrPerformanceMetricsCounterMETA;
    assert(((cast(*void)(*instance.type)) - cast(*void)(*instance)) == 0, "XrPerformanceMetricsCounterMETA.type has unexpected offset % instead of 0", ((cast(*void)(*instance.type)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrPerformanceMetricsCounterMETA.type)) == 4, "XrPerformanceMetricsCounterMETA.type has unexpected size % instead of 4", size_of(type_of(XrPerformanceMetricsCounterMETA.type)));
    assert(((cast(*void)(*instance.next)) - cast(*void)(*instance)) == 8, "XrPerformanceMetricsCounterMETA.next has unexpected offset % instead of 8", ((cast(*void)(*instance.next)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrPerformanceMetricsCounterMETA.next)) == 8, "XrPerformanceMetricsCounterMETA.next has unexpected size % instead of 8", size_of(type_of(XrPerformanceMetricsCounterMETA.next)));
    assert(((cast(*void)(*instance.counterFlags)) - cast(*void)(*instance)) == 16, "XrPerformanceMetricsCounterMETA.counterFlags has unexpected offset % instead of 16", ((cast(*void)(*instance.counterFlags)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrPerformanceMetricsCounterMETA.counterFlags)) == 8, "XrPerformanceMetricsCounterMETA.counterFlags has unexpected size % instead of 8", size_of(type_of(XrPerformanceMetricsCounterMETA.counterFlags)));
    assert(((cast(*void)(*instance.counterUnit)) - cast(*void)(*instance)) == 24, "XrPerformanceMetricsCounterMETA.counterUnit has unexpected offset % instead of 24", ((cast(*void)(*instance.counterUnit)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrPerformanceMetricsCounterMETA.counterUnit)) == 4, "XrPerformanceMetricsCounterMETA.counterUnit has unexpected size % instead of 4", size_of(type_of(XrPerformanceMetricsCounterMETA.counterUnit)));
    assert(((cast(*void)(*instance.uintValue)) - cast(*void)(*instance)) == 28, "XrPerformanceMetricsCounterMETA.uintValue has unexpected offset % instead of 28", ((cast(*void)(*instance.uintValue)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrPerformanceMetricsCounterMETA.uintValue)) == 4, "XrPerformanceMetricsCounterMETA.uintValue has unexpected size % instead of 4", size_of(type_of(XrPerformanceMetricsCounterMETA.uintValue)));
    assert(((cast(*void)(*instance.floatValue)) - cast(*void)(*instance)) == 32, "XrPerformanceMetricsCounterMETA.floatValue has unexpected offset % instead of 32", ((cast(*void)(*instance.floatValue)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrPerformanceMetricsCounterMETA.floatValue)) == 4, "XrPerformanceMetricsCounterMETA.floatValue has unexpected size % instead of 4", size_of(type_of(XrPerformanceMetricsCounterMETA.floatValue)));
    assert(size_of(XrPerformanceMetricsCounterMETA) == 40, "XrPerformanceMetricsCounterMETA has size % instead of 40", size_of(XrPerformanceMetricsCounterMETA));
}

XR_TRUE :: 1;
XR_FALSE :: 0;
XR_MAX_EXTENSION_NAME_SIZE :: 128;
XR_MAX_API_LAYER_NAME_SIZE :: 256;
XR_MAX_API_LAYER_DESCRIPTION_SIZE :: 256;
XR_MAX_SYSTEM_NAME_SIZE :: 256;
XR_MAX_APPLICATION_NAME_SIZE :: 128;
XR_MAX_ENGINE_NAME_SIZE :: 128;
XR_MAX_RUNTIME_NAME_SIZE :: 128;
XR_MAX_PATH_LENGTH :: 256;
XR_MAX_STRUCTURE_NAME_SIZE :: 64;
XR_MAX_RESULT_STRING_SIZE :: 64;
XR_MAX_ACTION_SET_NAME_SIZE :: 64;
XR_MAX_LOCALIZED_ACTION_SET_NAME_SIZE :: 128;
XR_MAX_ACTION_NAME_SIZE :: 64;
XR_MAX_LOCALIZED_ACTION_NAME_SIZE :: 128;

XR_KHR_composition_layer_cube :: 1;
XR_KHR_composition_layer_cube_SPEC_VERSION :: 8;
XR_KHR_COMPOSITION_LAYER_CUBE_EXTENSION_NAME :: "XR_KHR_composition_layer_cube";

XR_KHR_composition_layer_depth :: 1;
XR_KHR_composition_layer_depth_SPEC_VERSION :: 6;
XR_KHR_COMPOSITION_LAYER_DEPTH_EXTENSION_NAME :: "XR_KHR_composition_layer_depth";

XR_KHR_composition_layer_cylinder :: 1;
XR_KHR_composition_layer_cylinder_SPEC_VERSION :: 4;
XR_KHR_COMPOSITION_LAYER_CYLINDER_EXTENSION_NAME :: "XR_KHR_composition_layer_cylinder";

XR_KHR_composition_layer_equirect :: 1;
XR_KHR_composition_layer_equirect_SPEC_VERSION :: 3;
XR_KHR_COMPOSITION_LAYER_EQUIRECT_EXTENSION_NAME :: "XR_KHR_composition_layer_equirect";

XR_KHR_visibility_mask :: 1;
XR_KHR_visibility_mask_SPEC_VERSION :: 2;
XR_KHR_VISIBILITY_MASK_EXTENSION_NAME :: "XR_KHR_visibility_mask";

XR_KHR_composition_layer_color_scale_bias :: 1;
XR_KHR_composition_layer_color_scale_bias_SPEC_VERSION :: 5;
XR_KHR_COMPOSITION_LAYER_COLOR_SCALE_BIAS_EXTENSION_NAME :: "XR_KHR_composition_layer_color_scale_bias";

XR_KHR_loader_init :: 1;
XR_KHR_loader_init_SPEC_VERSION :: 1;
XR_KHR_LOADER_INIT_EXTENSION_NAME :: "XR_KHR_loader_init";

XR_KHR_composition_layer_equirect2 :: 1;
XR_KHR_composition_layer_equirect2_SPEC_VERSION :: 1;
XR_KHR_COMPOSITION_LAYER_EQUIRECT2_EXTENSION_NAME :: "XR_KHR_composition_layer_equirect2";

XR_KHR_binding_modification :: 1;
XR_KHR_binding_modification_SPEC_VERSION :: 1;
XR_KHR_BINDING_MODIFICATION_EXTENSION_NAME :: "XR_KHR_binding_modification";

XR_KHR_swapchain_usage_input_attachment_bit :: 1;
XR_KHR_swapchain_usage_input_attachment_bit_SPEC_VERSION :: 3;
XR_KHR_SWAPCHAIN_USAGE_INPUT_ATTACHMENT_BIT_EXTENSION_NAME :: "XR_KHR_swapchain_usage_input_attachment_bit";

XR_EXT_performance_settings :: 1;
XR_EXT_performance_settings_SPEC_VERSION :: 3;
XR_EXT_PERFORMANCE_SETTINGS_EXTENSION_NAME :: "XR_EXT_performance_settings";

XR_EXT_thermal_query :: 1;
XR_EXT_thermal_query_SPEC_VERSION :: 2;
XR_EXT_THERMAL_QUERY_EXTENSION_NAME :: "XR_EXT_thermal_query";

XR_EXT_debug_utils :: 1;

XR_EXT_debug_utils_SPEC_VERSION :: 4;
XR_EXT_DEBUG_UTILS_EXTENSION_NAME :: "XR_EXT_debug_utils";

XR_EXT_eye_gaze_interaction :: 1;
XR_EXT_eye_gaze_interaction_SPEC_VERSION :: 2;
XR_EXT_EYE_GAZE_INTERACTION_EXTENSION_NAME :: "XR_EXT_eye_gaze_interaction";

XR_EXTX_overlay :: 1;
XR_EXTX_overlay_SPEC_VERSION :: 5;
XR_EXTX_OVERLAY_EXTENSION_NAME :: "XR_EXTX_overlay";

XR_VARJO_quad_views :: 1;
XR_VARJO_quad_views_SPEC_VERSION :: 1;
XR_VARJO_QUAD_VIEWS_EXTENSION_NAME :: "XR_VARJO_quad_views";

XR_MSFT_unbounded_reference_space :: 1;
XR_MSFT_unbounded_reference_space_SPEC_VERSION :: 1;
XR_MSFT_UNBOUNDED_REFERENCE_SPACE_EXTENSION_NAME :: "XR_MSFT_unbounded_reference_space";

XR_MSFT_spatial_anchor :: 1;

XR_MSFT_spatial_anchor_SPEC_VERSION :: 2;
XR_MSFT_SPATIAL_ANCHOR_EXTENSION_NAME :: "XR_MSFT_spatial_anchor";

XR_FB_composition_layer_image_layout :: 1;
XR_FB_composition_layer_image_layout_SPEC_VERSION :: 1;
XR_FB_COMPOSITION_LAYER_IMAGE_LAYOUT_EXTENSION_NAME :: "XR_FB_composition_layer_image_layout";

XR_FB_composition_layer_alpha_blend :: 1;
XR_FB_composition_layer_alpha_blend_SPEC_VERSION :: 2;
XR_FB_COMPOSITION_LAYER_ALPHA_BLEND_EXTENSION_NAME :: "XR_FB_composition_layer_alpha_blend";

XR_MND_headless :: 1;
XR_MND_headless_SPEC_VERSION :: 2;
XR_MND_HEADLESS_EXTENSION_NAME :: "XR_MND_headless";

XR_OCULUS_android_session_state_enable :: 1;
XR_OCULUS_android_session_state_enable_SPEC_VERSION :: 1;
XR_OCULUS_ANDROID_SESSION_STATE_ENABLE_EXTENSION_NAME :: "XR_OCULUS_android_session_state_enable";

XR_EXT_view_configuration_depth_range :: 1;
XR_EXT_view_configuration_depth_range_SPEC_VERSION :: 1;
XR_EXT_VIEW_CONFIGURATION_DEPTH_RANGE_EXTENSION_NAME :: "XR_EXT_view_configuration_depth_range";

XR_EXT_conformance_automation :: 1;
XR_EXT_conformance_automation_SPEC_VERSION :: 3;
XR_EXT_CONFORMANCE_AUTOMATION_EXTENSION_NAME :: "XR_EXT_conformance_automation";

XR_MSFT_spatial_graph_bridge :: 1;

XR_MSFT_spatial_graph_bridge_SPEC_VERSION :: 2;
XR_MSFT_SPATIAL_GRAPH_BRIDGE_EXTENSION_NAME :: "XR_MSFT_spatial_graph_bridge";
XR_GUID_SIZE_MSFT :: 16;

XR_MSFT_hand_interaction :: 1;
XR_MSFT_hand_interaction_SPEC_VERSION :: 1;
XR_MSFT_HAND_INTERACTION_EXTENSION_NAME :: "XR_MSFT_hand_interaction";

XR_EXT_hand_tracking :: 1;

XR_HAND_JOINT_COUNT_EXT :: 26;

XR_EXT_hand_tracking_SPEC_VERSION :: 4;
XR_EXT_HAND_TRACKING_EXTENSION_NAME :: "XR_EXT_hand_tracking";

XR_MSFT_hand_tracking_mesh :: 1;
XR_MSFT_hand_tracking_mesh_SPEC_VERSION :: 4;
XR_MSFT_HAND_TRACKING_MESH_EXTENSION_NAME :: "XR_MSFT_hand_tracking_mesh";

XR_MSFT_secondary_view_configuration :: 1;
XR_MSFT_secondary_view_configuration_SPEC_VERSION :: 1;
XR_MSFT_SECONDARY_VIEW_CONFIGURATION_EXTENSION_NAME :: "XR_MSFT_secondary_view_configuration";

XR_MSFT_first_person_observer :: 1;
XR_MSFT_first_person_observer_SPEC_VERSION :: 1;
XR_MSFT_FIRST_PERSON_OBSERVER_EXTENSION_NAME :: "XR_MSFT_first_person_observer";

XR_MSFT_controller_model :: 1;

XR_NULL_CONTROLLER_MODEL_KEY_MSFT :: 0;

XR_MSFT_controller_model_SPEC_VERSION :: 2;
XR_MSFT_CONTROLLER_MODEL_EXTENSION_NAME :: "XR_MSFT_controller_model";
XR_MAX_CONTROLLER_MODEL_NODE_NAME_SIZE_MSFT :: 64;

XR_EXT_win32_appcontainer_compatible :: 1;
XR_EXT_win32_appcontainer_compatible_SPEC_VERSION :: 1;
XR_EXT_WIN32_APPCONTAINER_COMPATIBLE_EXTENSION_NAME :: "XR_EXT_win32_appcontainer_compatible";

XR_EPIC_view_configuration_fov :: 1;
XR_EPIC_view_configuration_fov_SPEC_VERSION :: 2;
XR_EPIC_VIEW_CONFIGURATION_FOV_EXTENSION_NAME :: "XR_EPIC_view_configuration_fov";

XR_MSFT_composition_layer_reprojection :: 1;
XR_MSFT_composition_layer_reprojection_SPEC_VERSION :: 1;
XR_MSFT_COMPOSITION_LAYER_REPROJECTION_EXTENSION_NAME :: "XR_MSFT_composition_layer_reprojection";

XR_HUAWEI_controller_interaction :: 1;
XR_HUAWEI_controller_interaction_SPEC_VERSION :: 1;
XR_HUAWEI_CONTROLLER_INTERACTION_EXTENSION_NAME :: "XR_HUAWEI_controller_interaction";

XR_FB_swapchain_update_state :: 1;
XR_FB_swapchain_update_state_SPEC_VERSION :: 3;
XR_FB_SWAPCHAIN_UPDATE_STATE_EXTENSION_NAME :: "XR_FB_swapchain_update_state";

XR_FB_composition_layer_secure_content :: 1;
XR_FB_composition_layer_secure_content_SPEC_VERSION :: 1;
XR_FB_COMPOSITION_LAYER_SECURE_CONTENT_EXTENSION_NAME :: "XR_FB_composition_layer_secure_content";

XR_EXT_dpad_binding :: 1;
XR_EXT_dpad_binding_SPEC_VERSION :: 1;
XR_EXT_DPAD_BINDING_EXTENSION_NAME :: "XR_EXT_dpad_binding";

XR_VALVE_analog_threshold :: 1;
XR_VALVE_analog_threshold_SPEC_VERSION :: 2;
XR_VALVE_ANALOG_THRESHOLD_EXTENSION_NAME :: "XR_VALVE_analog_threshold";

XR_EXT_hand_joints_motion_range :: 1;
XR_EXT_hand_joints_motion_range_SPEC_VERSION :: 1;
XR_EXT_HAND_JOINTS_MOTION_RANGE_EXTENSION_NAME :: "XR_EXT_hand_joints_motion_range";

XR_EXT_samsung_odyssey_controller :: 1;
XR_EXT_samsung_odyssey_controller_SPEC_VERSION :: 1;
XR_EXT_SAMSUNG_ODYSSEY_CONTROLLER_EXTENSION_NAME :: "XR_EXT_samsung_odyssey_controller";

XR_EXT_hp_mixed_reality_controller :: 1;
XR_EXT_hp_mixed_reality_controller_SPEC_VERSION :: 1;
XR_EXT_HP_MIXED_REALITY_CONTROLLER_EXTENSION_NAME :: "XR_EXT_hp_mixed_reality_controller";

XR_MND_swapchain_usage_input_attachment_bit :: 1;
XR_MND_swapchain_usage_input_attachment_bit_SPEC_VERSION :: 2;
XR_MND_SWAPCHAIN_USAGE_INPUT_ATTACHMENT_BIT_EXTENSION_NAME :: "XR_MND_swapchain_usage_input_attachment_bit";

XR_MSFT_scene_understanding :: 1;

XR_MSFT_scene_understanding_SPEC_VERSION :: 1;
XR_MSFT_SCENE_UNDERSTANDING_EXTENSION_NAME :: "XR_MSFT_scene_understanding";

XR_MSFT_scene_understanding_serialization :: 1;
XR_MSFT_scene_understanding_serialization_SPEC_VERSION :: 1;
XR_MSFT_SCENE_UNDERSTANDING_SERIALIZATION_EXTENSION_NAME :: "XR_MSFT_scene_understanding_serialization";

XR_FB_display_refresh_rate :: 1;
XR_FB_display_refresh_rate_SPEC_VERSION :: 1;
XR_FB_DISPLAY_REFRESH_RATE_EXTENSION_NAME :: "XR_FB_display_refresh_rate";

XR_HTC_vive_cosmos_controller_interaction :: 1;
XR_HTC_vive_cosmos_controller_interaction_SPEC_VERSION :: 1;
XR_HTC_VIVE_COSMOS_CONTROLLER_INTERACTION_EXTENSION_NAME :: "XR_HTC_vive_cosmos_controller_interaction";

XR_HTCX_vive_tracker_interaction :: 1;
XR_HTCX_vive_tracker_interaction_SPEC_VERSION :: 1;
XR_HTCX_VIVE_TRACKER_INTERACTION_EXTENSION_NAME :: "XR_HTCX_vive_tracker_interaction";

XR_HTC_facial_tracking :: 1;

XR_FACIAL_EXPRESSION_EYE_COUNT_HTC :: 14;

XR_FACIAL_EXPRESSION_LIP_COUNT_HTC :: 37;

XR_HTC_facial_tracking_SPEC_VERSION :: 1;
XR_HTC_FACIAL_TRACKING_EXTENSION_NAME :: "XR_HTC_facial_tracking";

XR_HTC_vive_focus3_controller_interaction :: 1;
XR_HTC_vive_focus3_controller_interaction_SPEC_VERSION :: 2;
XR_HTC_VIVE_FOCUS3_CONTROLLER_INTERACTION_EXTENSION_NAME :: "XR_HTC_vive_focus3_controller_interaction";

XR_HTC_hand_interaction :: 1;
XR_HTC_hand_interaction_SPEC_VERSION :: 1;
XR_HTC_HAND_INTERACTION_EXTENSION_NAME :: "XR_HTC_hand_interaction";

XR_HTC_vive_wrist_tracker_interaction :: 1;
XR_HTC_vive_wrist_tracker_interaction_SPEC_VERSION :: 1;
XR_HTC_VIVE_WRIST_TRACKER_INTERACTION_EXTENSION_NAME :: "XR_HTC_vive_wrist_tracker_interaction";

XR_FB_color_space :: 1;
XR_FB_color_space_SPEC_VERSION :: 2;
XR_FB_COLOR_SPACE_EXTENSION_NAME :: "XR_FB_color_space";

XR_FB_hand_tracking_mesh :: 1;
XR_FB_hand_tracking_mesh_SPEC_VERSION :: 2;
XR_FB_HAND_TRACKING_MESH_EXTENSION_NAME :: "XR_FB_hand_tracking_mesh";

XR_FB_hand_tracking_aim :: 1;
XR_FB_hand_tracking_aim_SPEC_VERSION :: 2;
XR_FB_HAND_TRACKING_AIM_EXTENSION_NAME :: "XR_FB_hand_tracking_aim";

XR_FB_hand_tracking_capsules :: 1;
XR_HAND_TRACKING_CAPSULE_POINT_COUNT_FB :: 2;
XR_HAND_TRACKING_CAPSULE_COUNT_FB :: 19;
XR_FB_hand_tracking_capsules_SPEC_VERSION :: 3;
XR_FB_HAND_TRACKING_CAPSULES_EXTENSION_NAME :: "XR_FB_hand_tracking_capsules";
XR_FB_HAND_TRACKING_CAPSULE_POINT_COUNT :: XR_HAND_TRACKING_CAPSULE_POINT_COUNT_FB;
XR_FB_HAND_TRACKING_CAPSULE_COUNT :: XR_HAND_TRACKING_CAPSULE_COUNT_FB;

XR_FB_spatial_entity :: 1;

XR_UUID_SIZE_EXT :: 16;
XR_FB_spatial_entity_SPEC_VERSION :: 1;
XR_FB_SPATIAL_ENTITY_EXTENSION_NAME :: "XR_FB_spatial_entity";

XR_FB_foveation :: 1;

XR_FB_foveation_SPEC_VERSION :: 1;
XR_FB_FOVEATION_EXTENSION_NAME :: "XR_FB_foveation";

XR_FB_foveation_configuration :: 1;
XR_FB_foveation_configuration_SPEC_VERSION :: 1;
XR_FB_FOVEATION_CONFIGURATION_EXTENSION_NAME :: "XR_FB_foveation_configuration";

XR_FB_keyboard_tracking :: 1;
XR_FB_keyboard_tracking_SPEC_VERSION :: 1;
XR_FB_KEYBOARD_TRACKING_EXTENSION_NAME :: "XR_FB_keyboard_tracking";
XR_MAX_KEYBOARD_TRACKING_NAME_SIZE_FB :: 128;

XR_FB_triangle_mesh :: 1;

XR_FB_triangle_mesh_SPEC_VERSION :: 2;
XR_FB_TRIANGLE_MESH_EXTENSION_NAME :: "XR_FB_triangle_mesh";

XR_FB_passthrough :: 1;

XR_FB_passthrough_SPEC_VERSION :: 2;
XR_FB_PASSTHROUGH_EXTENSION_NAME :: "XR_FB_passthrough";
XR_PASSTHROUGH_COLOR_MAP_MONO_SIZE_FB :: 256;

XR_FB_render_model :: 1;

XR_NULL_RENDER_MODEL_KEY_FB :: 0;

XR_FB_render_model_SPEC_VERSION :: 2;
XR_FB_RENDER_MODEL_EXTENSION_NAME :: "XR_FB_render_model";
XR_MAX_RENDER_MODEL_NAME_SIZE_FB :: 64;

XR_VARJO_foveated_rendering :: 1;
XR_VARJO_foveated_rendering_SPEC_VERSION :: 2;
XR_VARJO_FOVEATED_RENDERING_EXTENSION_NAME :: "XR_VARJO_foveated_rendering";

XR_VARJO_composition_layer_depth_test :: 1;
XR_VARJO_composition_layer_depth_test_SPEC_VERSION :: 2;
XR_VARJO_COMPOSITION_LAYER_DEPTH_TEST_EXTENSION_NAME :: "XR_VARJO_composition_layer_depth_test";

XR_VARJO_environment_depth_estimation :: 1;
XR_VARJO_environment_depth_estimation_SPEC_VERSION :: 1;
XR_VARJO_ENVIRONMENT_DEPTH_ESTIMATION_EXTENSION_NAME :: "XR_VARJO_environment_depth_estimation";

XR_VARJO_marker_tracking :: 1;
XR_VARJO_marker_tracking_SPEC_VERSION :: 1;
XR_VARJO_MARKER_TRACKING_EXTENSION_NAME :: "XR_VARJO_marker_tracking";

XR_VARJO_view_offset :: 1;
XR_VARJO_view_offset_SPEC_VERSION :: 1;
XR_VARJO_VIEW_OFFSET_EXTENSION_NAME :: "XR_VARJO_view_offset";

XR_MSFT_spatial_anchor_persistence :: 1;

XR_MAX_SPATIAL_ANCHOR_NAME_SIZE_MSFT :: 256;
XR_MSFT_spatial_anchor_persistence_SPEC_VERSION :: 2;
XR_MSFT_SPATIAL_ANCHOR_PERSISTENCE_EXTENSION_NAME :: "XR_MSFT_spatial_anchor_persistence";

XR_ULTRALEAP_hand_tracking_forearm :: 1;

XR_HAND_FOREARM_JOINT_COUNT_ULTRALEAP :: 27;

XR_ULTRALEAP_hand_tracking_forearm_SPEC_VERSION :: 1;
XR_ULTRALEAP_HAND_TRACKING_FOREARM_EXTENSION_NAME :: "XR_ULTRALEAP_hand_tracking_forearm";

XR_FB_spatial_entity_query :: 1;
XR_FB_spatial_entity_query_SPEC_VERSION :: 1;
XR_FB_SPATIAL_ENTITY_QUERY_EXTENSION_NAME :: "XR_FB_spatial_entity_query";

XR_FB_spatial_entity_storage :: 1;
XR_FB_spatial_entity_storage_SPEC_VERSION :: 1;
XR_FB_SPATIAL_ENTITY_STORAGE_EXTENSION_NAME :: "XR_FB_spatial_entity_storage";

XR_FB_space_warp :: 1;
XR_FB_space_warp_SPEC_VERSION :: 2;
XR_FB_SPACE_WARP_EXTENSION_NAME :: "XR_FB_space_warp";

XR_FB_scene :: 1;
XR_FB_scene_SPEC_VERSION :: 1;
XR_FB_SCENE_EXTENSION_NAME :: "XR_FB_scene";

XR_EXT_palm_pose :: 1;
XR_EXT_palm_pose_SPEC_VERSION :: 2;
XR_EXT_PALM_POSE_EXTENSION_NAME :: "XR_EXT_palm_pose";

XR_ALMALENCE_digital_lens_control :: 1;
XR_ALMALENCE_digital_lens_control_SPEC_VERSION :: 1;
XR_ALMALENCE_DIGITAL_LENS_CONTROL_EXTENSION_NAME :: "XR_ALMALENCE_digital_lens_control";

XR_FB_spatial_entity_container :: 1;
XR_FB_spatial_entity_container_SPEC_VERSION :: 2;
XR_FB_SPATIAL_ENTITY_CONTAINER_EXTENSION_NAME :: "XR_FB_spatial_entity_container";

XR_FB_passthrough_keyboard_hands :: 1;
XR_FB_passthrough_keyboard_hands_SPEC_VERSION :: 2;
XR_FB_PASSTHROUGH_KEYBOARD_HANDS_EXTENSION_NAME :: "XR_FB_passthrough_keyboard_hands";

XR_FB_composition_layer_settings :: 1;
XR_FB_composition_layer_settings_SPEC_VERSION :: 1;
XR_FB_COMPOSITION_LAYER_SETTINGS_EXTENSION_NAME :: "XR_FB_composition_layer_settings";

XR_META_performance_metrics :: 1;
XR_META_performance_metrics_SPEC_VERSION :: 1;
XR_META_PERFORMANCE_METRICS_EXTENSION_NAME :: "XR_META_performance_metrics";

XR_EXT_uuid :: 1;
XR_EXT_uuid_SPEC_VERSION :: 1;
XR_EXT_UUID_EXTENSION_NAME :: "XR_EXT_uuid";

OPENXR_PLATFORM_H_ :: 1;

OPENXR_REFLECTION_H_ :: 1;

XrVersion :: u64;
XrFlags64 :: u64;
XrSystemId :: u64;
XrBool32 :: u32;
XrPath :: u64;
XrTime :: s64;
XrDuration :: s64;
XrInstance_T :: struct {}
XrInstance :: *XrInstance_T;
XrSession_T :: struct {}
XrSession :: *XrSession_T;
XrSpace_T :: struct {}
XrSpace :: *XrSpace_T;
XrAction_T :: struct {}
XrAction :: *XrAction_T;
XrSwapchain_T :: struct {}
XrSwapchain :: *XrSwapchain_T;
XrActionSet_T :: struct {}
XrActionSet :: *XrActionSet_T;

XrResult :: enum s32 {
    XR_SUCCESS                                         :: 0;
    XR_TIMEOUT_EXPIRED                                 :: 1;
    XR_SESSION_LOSS_PENDING                            :: 3;
    XR_EVENT_UNAVAILABLE                               :: 4;
    XR_SPACE_BOUNDS_UNAVAILABLE                        :: 7;
    XR_SESSION_NOT_FOCUSED                             :: 8;
    XR_FRAME_DISCARDED                                 :: 9;
    VALIDATION_FAILURE                                 :: -1;
    RUNTIME_FAILURE                                    :: -2;
    OUT_OF_MEMORY                                      :: -3;
    API_VERSION_UNSUPPORTED                            :: -4;
    INITIALIZATION_FAILED                              :: -6;
    FUNCTION_UNSUPPORTED                               :: -7;
    FEATURE_UNSUPPORTED                                :: -8;
    EXTENSION_NOT_PRESENT                              :: -9;
    LIMIT_REACHED                                      :: -10;
    SIZE_INSUFFICIENT                                  :: -11;
    HANDLE_INVALID                                     :: -12;
    INSTANCE_LOST                                      :: -13;
    SESSION_RUNNING                                    :: -14;
    SESSION_NOT_RUNNING                                :: -16;
    SESSION_LOST                                       :: -17;
    SYSTEM_INVALID                                     :: -18;
    PATH_INVALID                                       :: -19;
    PATH_COUNT_EXCEEDED                                :: -20;
    PATH_FORMAT_INVALID                                :: -21;
    PATH_UNSUPPORTED                                   :: -22;
    LAYER_INVALID                                      :: -23;
    LAYER_LIMIT_EXCEEDED                               :: -24;
    SWAPCHAIN_RECT_INVALID                             :: -25;
    SWAPCHAIN_FORMAT_UNSUPPORTED                       :: -26;
    ACTION_TYPE_MISMATCH                               :: -27;
    SESSION_NOT_READY                                  :: -28;
    SESSION_NOT_STOPPING                               :: -29;
    TIME_INVALID                                       :: -30;
    REFERENCE_SPACE_UNSUPPORTED                        :: -31;
    FILE_ACCESS_ERROR                                  :: -32;
    FILE_CONTENTS_INVALID                              :: -33;
    FORM_FACTOR_UNSUPPORTED                            :: -34;
    FORM_FACTOR_UNAVAILABLE                            :: -35;
    API_LAYER_NOT_PRESENT                              :: -36;
    CALL_ORDER_INVALID                                 :: -37;
    GRAPHICS_DEVICE_INVALID                            :: -38;
    POSE_INVALID                                       :: -39;
    INDEX_OUT_OF_RANGE                                 :: -40;
    VIEW_CONFIGURATION_TYPE_UNSUPPORTED                :: -41;
    ENVIRONMENT_BLEND_MODE_UNSUPPORTED                 :: -42;
    NAME_DUPLICATED                                    :: -44;
    NAME_INVALID                                       :: -45;
    ACTIONSET_NOT_ATTACHED                             :: -46;
    ACTIONSETS_ALREADY_ATTACHED                        :: -47;
    LOCALIZED_NAME_DUPLICATED                          :: -48;
    LOCALIZED_NAME_INVALID                             :: -49;
    GRAPHICS_REQUIREMENTS_CALL_MISSING                 :: -50;
    RUNTIME_UNAVAILABLE                                :: -51;
    ANDROID_THREAD_SETTINGS_ID_INVALID_KHR             :: -1000003000;
    ANDROID_THREAD_SETTINGS_FAILURE_KHR                :: -1000003001;
    CREATE_SPATIAL_ANCHOR_FAILED_MSFT                  :: -1000039001;
    SECONDARY_VIEW_CONFIGURATION_TYPE_NOT_ENABLED_MSFT :: -1000053000;
    CONTROLLER_MODEL_KEY_INVALID_MSFT                  :: -1000055000;
    REPROJECTION_MODE_UNSUPPORTED_MSFT                 :: -1000066000;
    COMPUTE_NEW_SCENE_NOT_COMPLETED_MSFT               :: -1000097000;
    SCENE_COMPONENT_ID_INVALID_MSFT                    :: -1000097001;
    SCENE_COMPONENT_TYPE_MISMATCH_MSFT                 :: -1000097002;
    SCENE_MESH_BUFFER_ID_INVALID_MSFT                  :: -1000097003;
    SCENE_COMPUTE_FEATURE_INCOMPATIBLE_MSFT            :: -1000097004;
    SCENE_COMPUTE_CONSISTENCY_MISMATCH_MSFT            :: -1000097005;
    DISPLAY_REFRESH_RATE_UNSUPPORTED_FB                :: -1000101000;
    COLOR_SPACE_UNSUPPORTED_FB                         :: -1000108000;
    SPACE_COMPONENT_NOT_SUPPORTED_FB                   :: -1000113000;
    SPACE_COMPONENT_NOT_ENABLED_FB                     :: -1000113001;
    SPACE_COMPONENT_STATUS_PENDING_FB                  :: -1000113002;
    SPACE_COMPONENT_STATUS_ALREADY_SET_FB              :: -1000113003;
    UNEXPECTED_STATE_PASSTHROUGH_FB                    :: -1000118000;
    FEATURE_ALREADY_CREATED_PASSTHROUGH_FB             :: -1000118001;
    FEATURE_REQUIRED_PASSTHROUGH_FB                    :: -1000118002;
    NOT_PERMITTED_PASSTHROUGH_FB                       :: -1000118003;
    INSUFFICIENT_RESOURCES_PASSTHROUGH_FB              :: -1000118004;
    UNKNOWN_PASSTHROUGH_FB                             :: -1000118050;
    RENDER_MODEL_KEY_INVALID_FB                        :: -1000119000;
    XR_RENDER_MODEL_UNAVAILABLE_FB                     :: 1000119020;
    MARKER_NOT_TRACKED_VARJO                           :: -1000124000;
    MARKER_ID_INVALID_VARJO                            :: -1000124001;
    SPATIAL_ANCHOR_NAME_NOT_FOUND_MSFT                 :: -1000142001;
    SPATIAL_ANCHOR_NAME_INVALID_MSFT                   :: -1000142002;
    XR_RESULT_MAX_ENUM                                 :: 2147483647;

    XR_ERROR_VALIDATION_FAILURE                                 :: VALIDATION_FAILURE;
    XR_ERROR_RUNTIME_FAILURE                                    :: RUNTIME_FAILURE;
    XR_ERROR_OUT_OF_MEMORY                                      :: OUT_OF_MEMORY;
    XR_ERROR_API_VERSION_UNSUPPORTED                            :: API_VERSION_UNSUPPORTED;
    XR_ERROR_INITIALIZATION_FAILED                              :: INITIALIZATION_FAILED;
    XR_ERROR_FUNCTION_UNSUPPORTED                               :: FUNCTION_UNSUPPORTED;
    XR_ERROR_FEATURE_UNSUPPORTED                                :: FEATURE_UNSUPPORTED;
    XR_ERROR_EXTENSION_NOT_PRESENT                              :: EXTENSION_NOT_PRESENT;
    XR_ERROR_LIMIT_REACHED                                      :: LIMIT_REACHED;
    XR_ERROR_SIZE_INSUFFICIENT                                  :: SIZE_INSUFFICIENT;
    XR_ERROR_HANDLE_INVALID                                     :: HANDLE_INVALID;
    XR_ERROR_INSTANCE_LOST                                      :: INSTANCE_LOST;
    XR_ERROR_SESSION_RUNNING                                    :: SESSION_RUNNING;
    XR_ERROR_SESSION_NOT_RUNNING                                :: SESSION_NOT_RUNNING;
    XR_ERROR_SESSION_LOST                                       :: SESSION_LOST;
    XR_ERROR_SYSTEM_INVALID                                     :: SYSTEM_INVALID;
    XR_ERROR_PATH_INVALID                                       :: PATH_INVALID;
    XR_ERROR_PATH_COUNT_EXCEEDED                                :: PATH_COUNT_EXCEEDED;
    XR_ERROR_PATH_FORMAT_INVALID                                :: PATH_FORMAT_INVALID;
    XR_ERROR_PATH_UNSUPPORTED                                   :: PATH_UNSUPPORTED;
    XR_ERROR_LAYER_INVALID                                      :: LAYER_INVALID;
    XR_ERROR_LAYER_LIMIT_EXCEEDED                               :: LAYER_LIMIT_EXCEEDED;
    XR_ERROR_SWAPCHAIN_RECT_INVALID                             :: SWAPCHAIN_RECT_INVALID;
    XR_ERROR_SWAPCHAIN_FORMAT_UNSUPPORTED                       :: SWAPCHAIN_FORMAT_UNSUPPORTED;
    XR_ERROR_ACTION_TYPE_MISMATCH                               :: ACTION_TYPE_MISMATCH;
    XR_ERROR_SESSION_NOT_READY                                  :: SESSION_NOT_READY;
    XR_ERROR_SESSION_NOT_STOPPING                               :: SESSION_NOT_STOPPING;
    XR_ERROR_TIME_INVALID                                       :: TIME_INVALID;
    XR_ERROR_REFERENCE_SPACE_UNSUPPORTED                        :: REFERENCE_SPACE_UNSUPPORTED;
    XR_ERROR_FILE_ACCESS_ERROR                                  :: FILE_ACCESS_ERROR;
    XR_ERROR_FILE_CONTENTS_INVALID                              :: FILE_CONTENTS_INVALID;
    XR_ERROR_FORM_FACTOR_UNSUPPORTED                            :: FORM_FACTOR_UNSUPPORTED;
    XR_ERROR_FORM_FACTOR_UNAVAILABLE                            :: FORM_FACTOR_UNAVAILABLE;
    XR_ERROR_API_LAYER_NOT_PRESENT                              :: API_LAYER_NOT_PRESENT;
    XR_ERROR_CALL_ORDER_INVALID                                 :: CALL_ORDER_INVALID;
    XR_ERROR_GRAPHICS_DEVICE_INVALID                            :: GRAPHICS_DEVICE_INVALID;
    XR_ERROR_POSE_INVALID                                       :: POSE_INVALID;
    XR_ERROR_INDEX_OUT_OF_RANGE                                 :: INDEX_OUT_OF_RANGE;
    XR_ERROR_VIEW_CONFIGURATION_TYPE_UNSUPPORTED                :: VIEW_CONFIGURATION_TYPE_UNSUPPORTED;
    XR_ERROR_ENVIRONMENT_BLEND_MODE_UNSUPPORTED                 :: ENVIRONMENT_BLEND_MODE_UNSUPPORTED;
    XR_ERROR_NAME_DUPLICATED                                    :: NAME_DUPLICATED;
    XR_ERROR_NAME_INVALID                                       :: NAME_INVALID;
    XR_ERROR_ACTIONSET_NOT_ATTACHED                             :: ACTIONSET_NOT_ATTACHED;
    XR_ERROR_ACTIONSETS_ALREADY_ATTACHED                        :: ACTIONSETS_ALREADY_ATTACHED;
    XR_ERROR_LOCALIZED_NAME_DUPLICATED                          :: LOCALIZED_NAME_DUPLICATED;
    XR_ERROR_LOCALIZED_NAME_INVALID                             :: LOCALIZED_NAME_INVALID;
    XR_ERROR_GRAPHICS_REQUIREMENTS_CALL_MISSING                 :: GRAPHICS_REQUIREMENTS_CALL_MISSING;
    XR_ERROR_RUNTIME_UNAVAILABLE                                :: RUNTIME_UNAVAILABLE;
    XR_ERROR_ANDROID_THREAD_SETTINGS_ID_INVALID_KHR             :: ANDROID_THREAD_SETTINGS_ID_INVALID_KHR;
    XR_ERROR_ANDROID_THREAD_SETTINGS_FAILURE_KHR                :: ANDROID_THREAD_SETTINGS_FAILURE_KHR;
    XR_ERROR_CREATE_SPATIAL_ANCHOR_FAILED_MSFT                  :: CREATE_SPATIAL_ANCHOR_FAILED_MSFT;
    XR_ERROR_SECONDARY_VIEW_CONFIGURATION_TYPE_NOT_ENABLED_MSFT :: SECONDARY_VIEW_CONFIGURATION_TYPE_NOT_ENABLED_MSFT;
    XR_ERROR_CONTROLLER_MODEL_KEY_INVALID_MSFT                  :: CONTROLLER_MODEL_KEY_INVALID_MSFT;
    XR_ERROR_REPROJECTION_MODE_UNSUPPORTED_MSFT                 :: REPROJECTION_MODE_UNSUPPORTED_MSFT;
    XR_ERROR_COMPUTE_NEW_SCENE_NOT_COMPLETED_MSFT               :: COMPUTE_NEW_SCENE_NOT_COMPLETED_MSFT;
    XR_ERROR_SCENE_COMPONENT_ID_INVALID_MSFT                    :: SCENE_COMPONENT_ID_INVALID_MSFT;
    XR_ERROR_SCENE_COMPONENT_TYPE_MISMATCH_MSFT                 :: SCENE_COMPONENT_TYPE_MISMATCH_MSFT;
    XR_ERROR_SCENE_MESH_BUFFER_ID_INVALID_MSFT                  :: SCENE_MESH_BUFFER_ID_INVALID_MSFT;
    XR_ERROR_SCENE_COMPUTE_FEATURE_INCOMPATIBLE_MSFT            :: SCENE_COMPUTE_FEATURE_INCOMPATIBLE_MSFT;
    XR_ERROR_SCENE_COMPUTE_CONSISTENCY_MISMATCH_MSFT            :: SCENE_COMPUTE_CONSISTENCY_MISMATCH_MSFT;
    XR_ERROR_DISPLAY_REFRESH_RATE_UNSUPPORTED_FB                :: DISPLAY_REFRESH_RATE_UNSUPPORTED_FB;
    XR_ERROR_COLOR_SPACE_UNSUPPORTED_FB                         :: COLOR_SPACE_UNSUPPORTED_FB;
    XR_ERROR_SPACE_COMPONENT_NOT_SUPPORTED_FB                   :: SPACE_COMPONENT_NOT_SUPPORTED_FB;
    XR_ERROR_SPACE_COMPONENT_NOT_ENABLED_FB                     :: SPACE_COMPONENT_NOT_ENABLED_FB;
    XR_ERROR_SPACE_COMPONENT_STATUS_PENDING_FB                  :: SPACE_COMPONENT_STATUS_PENDING_FB;
    XR_ERROR_SPACE_COMPONENT_STATUS_ALREADY_SET_FB              :: SPACE_COMPONENT_STATUS_ALREADY_SET_FB;
    XR_ERROR_UNEXPECTED_STATE_PASSTHROUGH_FB                    :: UNEXPECTED_STATE_PASSTHROUGH_FB;
    XR_ERROR_FEATURE_ALREADY_CREATED_PASSTHROUGH_FB             :: FEATURE_ALREADY_CREATED_PASSTHROUGH_FB;
    XR_ERROR_FEATURE_REQUIRED_PASSTHROUGH_FB                    :: FEATURE_REQUIRED_PASSTHROUGH_FB;
    XR_ERROR_NOT_PERMITTED_PASSTHROUGH_FB                       :: NOT_PERMITTED_PASSTHROUGH_FB;
    XR_ERROR_INSUFFICIENT_RESOURCES_PASSTHROUGH_FB              :: INSUFFICIENT_RESOURCES_PASSTHROUGH_FB;
    XR_ERROR_UNKNOWN_PASSTHROUGH_FB                             :: UNKNOWN_PASSTHROUGH_FB;
    XR_ERROR_RENDER_MODEL_KEY_INVALID_FB                        :: RENDER_MODEL_KEY_INVALID_FB;

    XR_ERROR_MARKER_NOT_TRACKED_VARJO                           :: MARKER_NOT_TRACKED_VARJO;
    XR_ERROR_MARKER_ID_INVALID_VARJO                            :: MARKER_ID_INVALID_VARJO;
    XR_ERROR_SPATIAL_ANCHOR_NAME_NOT_FOUND_MSFT                 :: SPATIAL_ANCHOR_NAME_NOT_FOUND_MSFT;
    XR_ERROR_SPATIAL_ANCHOR_NAME_INVALID_MSFT                   :: SPATIAL_ANCHOR_NAME_INVALID_MSFT;
}

XrStructureType :: enum s32 {
    UNKNOWN                                                 :: 0;
    API_LAYER_PROPERTIES                                    :: 1;
    EXTENSION_PROPERTIES                                    :: 2;
    INSTANCE_CREATE_INFO                                    :: 3;
    SYSTEM_GET_INFO                                         :: 4;
    SYSTEM_PROPERTIES                                       :: 5;
    VIEW_LOCATE_INFO                                        :: 6;
    VIEW                                                    :: 7;
    SESSION_CREATE_INFO                                     :: 8;
    SWAPCHAIN_CREATE_INFO                                   :: 9;
    SESSION_BEGIN_INFO                                      :: 10;
    VIEW_STATE                                              :: 11;
    FRAME_END_INFO                                          :: 12;
    HAPTIC_VIBRATION                                        :: 13;
    EVENT_DATA_BUFFER                                       :: 16;
    EVENT_DATA_INSTANCE_LOSS_PENDING                        :: 17;
    EVENT_DATA_SESSION_STATE_CHANGED                        :: 18;
    ACTION_STATE_BOOLEAN                                    :: 23;
    ACTION_STATE_FLOAT                                      :: 24;
    ACTION_STATE_VECTOR2F                                   :: 25;
    ACTION_STATE_POSE                                       :: 27;
    ACTION_SET_CREATE_INFO                                  :: 28;
    ACTION_CREATE_INFO                                      :: 29;
    INSTANCE_PROPERTIES                                     :: 32;
    FRAME_WAIT_INFO                                         :: 33;
    COMPOSITION_LAYER_PROJECTION                            :: 35;
    COMPOSITION_LAYER_QUAD                                  :: 36;
    REFERENCE_SPACE_CREATE_INFO                             :: 37;
    ACTION_SPACE_CREATE_INFO                                :: 38;
    EVENT_DATA_REFERENCE_SPACE_CHANGE_PENDING               :: 40;
    VIEW_CONFIGURATION_VIEW                                 :: 41;
    SPACE_LOCATION                                          :: 42;
    SPACE_VELOCITY                                          :: 43;
    FRAME_STATE                                             :: 44;
    VIEW_CONFIGURATION_PROPERTIES                           :: 45;
    FRAME_BEGIN_INFO                                        :: 46;
    COMPOSITION_LAYER_PROJECTION_VIEW                       :: 48;
    EVENT_DATA_EVENTS_LOST                                  :: 49;
    INTERACTION_PROFILE_SUGGESTED_BINDING                   :: 51;
    EVENT_DATA_INTERACTION_PROFILE_CHANGED                  :: 52;
    INTERACTION_PROFILE_STATE                               :: 53;
    SWAPCHAIN_IMAGE_ACQUIRE_INFO                            :: 55;
    SWAPCHAIN_IMAGE_WAIT_INFO                               :: 56;
    SWAPCHAIN_IMAGE_RELEASE_INFO                            :: 57;
    ACTION_STATE_GET_INFO                                   :: 58;
    HAPTIC_ACTION_INFO                                      :: 59;
    SESSION_ACTION_SETS_ATTACH_INFO                         :: 60;
    ACTIONS_SYNC_INFO                                       :: 61;
    BOUND_SOURCES_FOR_ACTION_ENUMERATE_INFO                 :: 62;
    INPUT_SOURCE_LOCALIZED_NAME_GET_INFO                    :: 63;
    COMPOSITION_LAYER_CUBE_KHR                              :: 1000006000;
    INSTANCE_CREATE_INFO_ANDROID_KHR                        :: 1000008000;
    COMPOSITION_LAYER_DEPTH_INFO_KHR                        :: 1000010000;
    VULKAN_SWAPCHAIN_FORMAT_LIST_CREATE_INFO_KHR            :: 1000014000;
    EVENT_DATA_PERF_SETTINGS_EXT                            :: 1000015000;
    COMPOSITION_LAYER_CYLINDER_KHR                          :: 1000017000;
    COMPOSITION_LAYER_EQUIRECT_KHR                          :: 1000018000;
    DEBUG_UTILS_OBJECT_NAME_INFO_EXT                        :: 1000019000;
    DEBUG_UTILS_MESSENGER_CALLBACK_DATA_EXT                 :: 1000019001;
    DEBUG_UTILS_MESSENGER_CREATE_INFO_EXT                   :: 1000019002;
    DEBUG_UTILS_LABEL_EXT                                   :: 1000019003;
    GRAPHICS_BINDING_OPENGL_WIN32_KHR                       :: 1000023000;
    GRAPHICS_BINDING_OPENGL_XLIB_KHR                        :: 1000023001;
    GRAPHICS_BINDING_OPENGL_XCB_KHR                         :: 1000023002;
    GRAPHICS_BINDING_OPENGL_WAYLAND_KHR                     :: 1000023003;
    SWAPCHAIN_IMAGE_OPENGL_KHR                              :: 1000023004;
    GRAPHICS_REQUIREMENTS_OPENGL_KHR                        :: 1000023005;
    GRAPHICS_BINDING_OPENGL_ES_ANDROID_KHR                  :: 1000024001;
    SWAPCHAIN_IMAGE_OPENGL_ES_KHR                           :: 1000024002;
    GRAPHICS_REQUIREMENTS_OPENGL_ES_KHR                     :: 1000024003;
    GRAPHICS_BINDING_VULKAN_KHR                             :: 1000025000;
    SWAPCHAIN_IMAGE_VULKAN_KHR                              :: 1000025001;
    GRAPHICS_REQUIREMENTS_VULKAN_KHR                        :: 1000025002;
    GRAPHICS_BINDING_D3D11_KHR                              :: 1000027000;
    SWAPCHAIN_IMAGE_D3D11_KHR                               :: 1000027001;
    GRAPHICS_REQUIREMENTS_D3D11_KHR                         :: 1000027002;
    GRAPHICS_BINDING_D3D12_KHR                              :: 1000028000;
    SWAPCHAIN_IMAGE_D3D12_KHR                               :: 1000028001;
    GRAPHICS_REQUIREMENTS_D3D12_KHR                         :: 1000028002;
    SYSTEM_EYE_GAZE_INTERACTION_PROPERTIES_EXT              :: 1000030000;
    EYE_GAZE_SAMPLE_TIME_EXT                                :: 1000030001;
    VISIBILITY_MASK_KHR                                     :: 1000031000;
    EVENT_DATA_VISIBILITY_MASK_CHANGED_KHR                  :: 1000031001;
    SESSION_CREATE_INFO_OVERLAY_EXTX                        :: 1000033000;
    EVENT_DATA_MAIN_SESSION_VISIBILITY_CHANGED_EXTX         :: 1000033003;
    COMPOSITION_LAYER_COLOR_SCALE_BIAS_KHR                  :: 1000034000;
    SPATIAL_ANCHOR_CREATE_INFO_MSFT                         :: 1000039000;
    SPATIAL_ANCHOR_SPACE_CREATE_INFO_MSFT                   :: 1000039001;
    COMPOSITION_LAYER_IMAGE_LAYOUT_FB                       :: 1000040000;
    COMPOSITION_LAYER_ALPHA_BLEND_FB                        :: 1000041001;
    VIEW_CONFIGURATION_DEPTH_RANGE_EXT                      :: 1000046000;
    GRAPHICS_BINDING_EGL_MNDX                               :: 1000048004;
    SPATIAL_GRAPH_NODE_SPACE_CREATE_INFO_MSFT               :: 1000049000;
    SPATIAL_GRAPH_STATIC_NODE_BINDING_CREATE_INFO_MSFT      :: 1000049001;
    SPATIAL_GRAPH_NODE_BINDING_PROPERTIES_GET_INFO_MSFT     :: 1000049002;
    SPATIAL_GRAPH_NODE_BINDING_PROPERTIES_MSFT              :: 1000049003;
    SYSTEM_HAND_TRACKING_PROPERTIES_EXT                     :: 1000051000;
    HAND_TRACKER_CREATE_INFO_EXT                            :: 1000051001;
    HAND_JOINTS_LOCATE_INFO_EXT                             :: 1000051002;
    HAND_JOINT_LOCATIONS_EXT                                :: 1000051003;
    HAND_JOINT_VELOCITIES_EXT                               :: 1000051004;
    SYSTEM_HAND_TRACKING_MESH_PROPERTIES_MSFT               :: 1000052000;
    HAND_MESH_SPACE_CREATE_INFO_MSFT                        :: 1000052001;
    HAND_MESH_UPDATE_INFO_MSFT                              :: 1000052002;
    HAND_MESH_MSFT                                          :: 1000052003;
    HAND_POSE_TYPE_INFO_MSFT                                :: 1000052004;
    SECONDARY_VIEW_CONFIGURATION_SESSION_BEGIN_INFO_MSFT    :: 1000053000;
    SECONDARY_VIEW_CONFIGURATION_STATE_MSFT                 :: 1000053001;
    SECONDARY_VIEW_CONFIGURATION_FRAME_STATE_MSFT           :: 1000053002;
    SECONDARY_VIEW_CONFIGURATION_FRAME_END_INFO_MSFT        :: 1000053003;
    SECONDARY_VIEW_CONFIGURATION_LAYER_INFO_MSFT            :: 1000053004;
    SECONDARY_VIEW_CONFIGURATION_SWAPCHAIN_CREATE_INFO_MSFT :: 1000053005;
    CONTROLLER_MODEL_KEY_STATE_MSFT                         :: 1000055000;
    CONTROLLER_MODEL_NODE_PROPERTIES_MSFT                   :: 1000055001;
    CONTROLLER_MODEL_PROPERTIES_MSFT                        :: 1000055002;
    CONTROLLER_MODEL_NODE_STATE_MSFT                        :: 1000055003;
    CONTROLLER_MODEL_STATE_MSFT                             :: 1000055004;
    VIEW_CONFIGURATION_VIEW_FOV_EPIC                        :: 1000059000;
    HOLOGRAPHIC_WINDOW_ATTACHMENT_MSFT                      :: 1000063000;
    COMPOSITION_LAYER_REPROJECTION_INFO_MSFT                :: 1000066000;
    COMPOSITION_LAYER_REPROJECTION_PLANE_OVERRIDE_MSFT      :: 1000066001;
    ANDROID_SURFACE_SWAPCHAIN_CREATE_INFO_FB                :: 1000070000;
    COMPOSITION_LAYER_SECURE_CONTENT_FB                     :: 1000072000;
    INTERACTION_PROFILE_DPAD_BINDING_EXT                    :: 1000078000;
    INTERACTION_PROFILE_ANALOG_THRESHOLD_VALVE              :: 1000079000;
    HAND_JOINTS_MOTION_RANGE_INFO_EXT                       :: 1000080000;
    LOADER_INIT_INFO_ANDROID_KHR                            :: 1000089000;
    VULKAN_INSTANCE_CREATE_INFO_KHR                         :: 1000090000;
    VULKAN_DEVICE_CREATE_INFO_KHR                           :: 1000090001;
    VULKAN_GRAPHICS_DEVICE_GET_INFO_KHR                     :: 1000090003;
    COMPOSITION_LAYER_EQUIRECT2_KHR                         :: 1000091000;
    SCENE_OBSERVER_CREATE_INFO_MSFT                         :: 1000097000;
    SCENE_CREATE_INFO_MSFT                                  :: 1000097001;
    NEW_SCENE_COMPUTE_INFO_MSFT                             :: 1000097002;
    VISUAL_MESH_COMPUTE_LOD_INFO_MSFT                       :: 1000097003;
    SCENE_COMPONENTS_MSFT                                   :: 1000097004;
    SCENE_COMPONENTS_GET_INFO_MSFT                          :: 1000097005;
    SCENE_COMPONENT_LOCATIONS_MSFT                          :: 1000097006;
    SCENE_COMPONENTS_LOCATE_INFO_MSFT                       :: 1000097007;
    SCENE_OBJECTS_MSFT                                      :: 1000097008;
    SCENE_COMPONENT_PARENT_FILTER_INFO_MSFT                 :: 1000097009;
    SCENE_OBJECT_TYPES_FILTER_INFO_MSFT                     :: 1000097010;
    SCENE_PLANES_MSFT                                       :: 1000097011;
    SCENE_PLANE_ALIGNMENT_FILTER_INFO_MSFT                  :: 1000097012;
    SCENE_MESHES_MSFT                                       :: 1000097013;
    SCENE_MESH_BUFFERS_GET_INFO_MSFT                        :: 1000097014;
    SCENE_MESH_BUFFERS_MSFT                                 :: 1000097015;
    SCENE_MESH_VERTEX_BUFFER_MSFT                           :: 1000097016;
    SCENE_MESH_INDICES_UINT32_MSFT                          :: 1000097017;
    SCENE_MESH_INDICES_UINT16_MSFT                          :: 1000097018;
    SERIALIZED_SCENE_FRAGMENT_DATA_GET_INFO_MSFT            :: 1000098000;
    SCENE_DESERIALIZE_INFO_MSFT                             :: 1000098001;
    EVENT_DATA_DISPLAY_REFRESH_RATE_CHANGED_FB              :: 1000101000;
    VIVE_TRACKER_PATHS_HTCX                                 :: 1000103000;
    EVENT_DATA_VIVE_TRACKER_CONNECTED_HTCX                  :: 1000103001;
    SYSTEM_FACIAL_TRACKING_PROPERTIES_HTC                   :: 1000104000;
    FACIAL_TRACKER_CREATE_INFO_HTC                          :: 1000104001;
    FACIAL_EXPRESSIONS_HTC                                  :: 1000104002;
    SYSTEM_COLOR_SPACE_PROPERTIES_FB                        :: 1000108000;
    HAND_TRACKING_MESH_FB                                   :: 1000110001;
    HAND_TRACKING_SCALE_FB                                  :: 1000110003;
    HAND_TRACKING_AIM_STATE_FB                              :: 1000111001;
    HAND_TRACKING_CAPSULES_STATE_FB                         :: 1000112000;
    SYSTEM_SPATIAL_ENTITY_PROPERTIES_FB                     :: 1000113004;
    SPATIAL_ANCHOR_CREATE_INFO_FB                           :: 1000113003;
    SPACE_COMPONENT_STATUS_SET_INFO_FB                      :: 1000113007;
    SPACE_COMPONENT_STATUS_FB                               :: 1000113001;
    EVENT_DATA_SPATIAL_ANCHOR_CREATE_COMPLETE_FB            :: 1000113005;
    EVENT_DATA_SPACE_SET_STATUS_COMPLETE_FB                 :: 1000113006;
    FOVEATION_PROFILE_CREATE_INFO_FB                        :: 1000114000;
    SWAPCHAIN_CREATE_INFO_FOVEATION_FB                      :: 1000114001;
    SWAPCHAIN_STATE_FOVEATION_FB                            :: 1000114002;
    FOVEATION_LEVEL_PROFILE_CREATE_INFO_FB                  :: 1000115000;
    KEYBOARD_SPACE_CREATE_INFO_FB                           :: 1000116009;
    KEYBOARD_TRACKING_QUERY_FB                              :: 1000116004;
    SYSTEM_KEYBOARD_TRACKING_PROPERTIES_FB                  :: 1000116002;
    TRIANGLE_MESH_CREATE_INFO_FB                            :: 1000117001;
    SYSTEM_PASSTHROUGH_PROPERTIES_FB                        :: 1000118000;
    PASSTHROUGH_CREATE_INFO_FB                              :: 1000118001;
    PASSTHROUGH_LAYER_CREATE_INFO_FB                        :: 1000118002;
    COMPOSITION_LAYER_PASSTHROUGH_FB                        :: 1000118003;
    GEOMETRY_INSTANCE_CREATE_INFO_FB                        :: 1000118004;
    GEOMETRY_INSTANCE_TRANSFORM_FB                          :: 1000118005;
    PASSTHROUGH_STYLE_FB                                    :: 1000118020;
    PASSTHROUGH_COLOR_MAP_MONO_TO_RGBA_FB                   :: 1000118021;
    PASSTHROUGH_COLOR_MAP_MONO_TO_MONO_FB                   :: 1000118022;
    PASSTHROUGH_BRIGHTNESS_CONTRAST_SATURATION_FB           :: 1000118023;
    EVENT_DATA_PASSTHROUGH_STATE_CHANGED_FB                 :: 1000118030;
    RENDER_MODEL_PATH_INFO_FB                               :: 1000119000;
    RENDER_MODEL_PROPERTIES_FB                              :: 1000119001;
    RENDER_MODEL_BUFFER_FB                                  :: 1000119002;
    RENDER_MODEL_LOAD_INFO_FB                               :: 1000119003;
    SYSTEM_RENDER_MODEL_PROPERTIES_FB                       :: 1000119004;
    RENDER_MODEL_CAPABILITIES_REQUEST_FB                    :: 1000119005;
    BINDING_MODIFICATIONS_KHR                               :: 1000120000;
    VIEW_LOCATE_FOVEATED_RENDERING_VARJO                    :: 1000121000;
    FOVEATED_VIEW_CONFIGURATION_VIEW_VARJO                  :: 1000121001;
    SYSTEM_FOVEATED_RENDERING_PROPERTIES_VARJO              :: 1000121002;
    COMPOSITION_LAYER_DEPTH_TEST_VARJO                      :: 1000122000;
    SYSTEM_MARKER_TRACKING_PROPERTIES_VARJO                 :: 1000124000;
    EVENT_DATA_MARKER_TRACKING_UPDATE_VARJO                 :: 1000124001;
    MARKER_SPACE_CREATE_INFO_VARJO                          :: 1000124002;
    SPATIAL_ANCHOR_PERSISTENCE_INFO_MSFT                    :: 1000142000;
    SPATIAL_ANCHOR_FROM_PERSISTED_ANCHOR_CREATE_INFO_MSFT   :: 1000142001;
    SPACE_QUERY_INFO_FB                                     :: 1000156001;
    SPACE_QUERY_RESULTS_FB                                  :: 1000156002;
    SPACE_STORAGE_LOCATION_FILTER_INFO_FB                   :: 1000156003;
    SPACE_UUID_FILTER_INFO_FB                               :: 1000156054;
    SPACE_COMPONENT_FILTER_INFO_FB                          :: 1000156052;
    EVENT_DATA_SPACE_QUERY_RESULTS_AVAILABLE_FB             :: 1000156103;
    EVENT_DATA_SPACE_QUERY_COMPLETE_FB                      :: 1000156104;
    SPACE_SAVE_INFO_FB                                      :: 1000158000;
    SPACE_ERASE_INFO_FB                                     :: 1000158001;
    EVENT_DATA_SPACE_SAVE_COMPLETE_FB                       :: 1000158106;
    EVENT_DATA_SPACE_ERASE_COMPLETE_FB                      :: 1000158107;
    SWAPCHAIN_IMAGE_FOVEATION_VULKAN_FB                     :: 1000160000;
    SWAPCHAIN_STATE_ANDROID_SURFACE_DIMENSIONS_FB           :: 1000161000;
    SWAPCHAIN_STATE_SAMPLER_OPENGL_ES_FB                    :: 1000162000;
    SWAPCHAIN_STATE_SAMPLER_VULKAN_FB                       :: 1000163000;
    COMPOSITION_LAYER_SPACE_WARP_INFO_FB                    :: 1000171000;
    SYSTEM_SPACE_WARP_PROPERTIES_FB                         :: 1000171001;
    SEMANTIC_LABELS_FB                                      :: 1000175000;
    ROOM_LAYOUT_FB                                          :: 1000175001;
    BOUNDARY_2D_FB                                          :: 1000175002;
    DIGITAL_LENS_CONTROL_ALMALENCE                          :: 1000196000;
    SPACE_CONTAINER_FB                                      :: 1000199000;
    PASSTHROUGH_KEYBOARD_HANDS_INTENSITY_FB                 :: 1000203002;
    COMPOSITION_LAYER_SETTINGS_FB                           :: 1000204000;
    VULKAN_SWAPCHAIN_CREATE_INFO_META                       :: 1000227000;
    PERFORMANCE_METRICS_STATE_META                          :: 1000232001;
    PERFORMANCE_METRICS_COUNTER_META                        :: 1000232002;
    GRAPHICS_BINDING_VULKAN2_KHR                            :: 1000025000;
    SWAPCHAIN_IMAGE_VULKAN2_KHR                             :: 1000025001;
    GRAPHICS_REQUIREMENTS_VULKAN2_KHR                       :: 1000025002;
    XR_STRUCTURE_TYPE_MAX_ENUM                              :: 2147483647;

    XR_TYPE_UNKNOWN                                                 :: UNKNOWN;
    XR_TYPE_API_LAYER_PROPERTIES                                    :: API_LAYER_PROPERTIES;
    XR_TYPE_EXTENSION_PROPERTIES                                    :: EXTENSION_PROPERTIES;
    XR_TYPE_INSTANCE_CREATE_INFO                                    :: INSTANCE_CREATE_INFO;
    XR_TYPE_SYSTEM_GET_INFO                                         :: SYSTEM_GET_INFO;
    XR_TYPE_SYSTEM_PROPERTIES                                       :: SYSTEM_PROPERTIES;
    XR_TYPE_VIEW_LOCATE_INFO                                        :: VIEW_LOCATE_INFO;
    XR_TYPE_VIEW                                                    :: VIEW;
    XR_TYPE_SESSION_CREATE_INFO                                     :: SESSION_CREATE_INFO;
    XR_TYPE_SWAPCHAIN_CREATE_INFO                                   :: SWAPCHAIN_CREATE_INFO;
    XR_TYPE_SESSION_BEGIN_INFO                                      :: SESSION_BEGIN_INFO;
    XR_TYPE_VIEW_STATE                                              :: VIEW_STATE;
    XR_TYPE_FRAME_END_INFO                                          :: FRAME_END_INFO;
    XR_TYPE_HAPTIC_VIBRATION                                        :: HAPTIC_VIBRATION;
    XR_TYPE_EVENT_DATA_BUFFER                                       :: EVENT_DATA_BUFFER;
    XR_TYPE_EVENT_DATA_INSTANCE_LOSS_PENDING                        :: EVENT_DATA_INSTANCE_LOSS_PENDING;
    XR_TYPE_EVENT_DATA_SESSION_STATE_CHANGED                        :: EVENT_DATA_SESSION_STATE_CHANGED;
    XR_TYPE_ACTION_STATE_BOOLEAN                                    :: ACTION_STATE_BOOLEAN;
    XR_TYPE_ACTION_STATE_FLOAT                                      :: ACTION_STATE_FLOAT;
    XR_TYPE_ACTION_STATE_VECTOR2F                                   :: ACTION_STATE_VECTOR2F;
    XR_TYPE_ACTION_STATE_POSE                                       :: ACTION_STATE_POSE;
    XR_TYPE_ACTION_SET_CREATE_INFO                                  :: ACTION_SET_CREATE_INFO;
    XR_TYPE_ACTION_CREATE_INFO                                      :: ACTION_CREATE_INFO;
    XR_TYPE_INSTANCE_PROPERTIES                                     :: INSTANCE_PROPERTIES;
    XR_TYPE_FRAME_WAIT_INFO                                         :: FRAME_WAIT_INFO;
    XR_TYPE_COMPOSITION_LAYER_PROJECTION                            :: COMPOSITION_LAYER_PROJECTION;
    XR_TYPE_COMPOSITION_LAYER_QUAD                                  :: COMPOSITION_LAYER_QUAD;
    XR_TYPE_REFERENCE_SPACE_CREATE_INFO                             :: REFERENCE_SPACE_CREATE_INFO;
    XR_TYPE_ACTION_SPACE_CREATE_INFO                                :: ACTION_SPACE_CREATE_INFO;
    XR_TYPE_EVENT_DATA_REFERENCE_SPACE_CHANGE_PENDING               :: EVENT_DATA_REFERENCE_SPACE_CHANGE_PENDING;
    XR_TYPE_VIEW_CONFIGURATION_VIEW                                 :: VIEW_CONFIGURATION_VIEW;
    XR_TYPE_SPACE_LOCATION                                          :: SPACE_LOCATION;
    XR_TYPE_SPACE_VELOCITY                                          :: SPACE_VELOCITY;
    XR_TYPE_FRAME_STATE                                             :: FRAME_STATE;
    XR_TYPE_VIEW_CONFIGURATION_PROPERTIES                           :: VIEW_CONFIGURATION_PROPERTIES;
    XR_TYPE_FRAME_BEGIN_INFO                                        :: FRAME_BEGIN_INFO;
    XR_TYPE_COMPOSITION_LAYER_PROJECTION_VIEW                       :: COMPOSITION_LAYER_PROJECTION_VIEW;
    XR_TYPE_EVENT_DATA_EVENTS_LOST                                  :: EVENT_DATA_EVENTS_LOST;
    XR_TYPE_INTERACTION_PROFILE_SUGGESTED_BINDING                   :: INTERACTION_PROFILE_SUGGESTED_BINDING;
    XR_TYPE_EVENT_DATA_INTERACTION_PROFILE_CHANGED                  :: EVENT_DATA_INTERACTION_PROFILE_CHANGED;
    XR_TYPE_INTERACTION_PROFILE_STATE                               :: INTERACTION_PROFILE_STATE;
    XR_TYPE_SWAPCHAIN_IMAGE_ACQUIRE_INFO                            :: SWAPCHAIN_IMAGE_ACQUIRE_INFO;
    XR_TYPE_SWAPCHAIN_IMAGE_WAIT_INFO                               :: SWAPCHAIN_IMAGE_WAIT_INFO;
    XR_TYPE_SWAPCHAIN_IMAGE_RELEASE_INFO                            :: SWAPCHAIN_IMAGE_RELEASE_INFO;
    XR_TYPE_ACTION_STATE_GET_INFO                                   :: ACTION_STATE_GET_INFO;
    XR_TYPE_HAPTIC_ACTION_INFO                                      :: HAPTIC_ACTION_INFO;
    XR_TYPE_SESSION_ACTION_SETS_ATTACH_INFO                         :: SESSION_ACTION_SETS_ATTACH_INFO;
    XR_TYPE_ACTIONS_SYNC_INFO                                       :: ACTIONS_SYNC_INFO;
    XR_TYPE_BOUND_SOURCES_FOR_ACTION_ENUMERATE_INFO                 :: BOUND_SOURCES_FOR_ACTION_ENUMERATE_INFO;
    XR_TYPE_INPUT_SOURCE_LOCALIZED_NAME_GET_INFO                    :: INPUT_SOURCE_LOCALIZED_NAME_GET_INFO;
    XR_TYPE_COMPOSITION_LAYER_CUBE_KHR                              :: COMPOSITION_LAYER_CUBE_KHR;
    XR_TYPE_INSTANCE_CREATE_INFO_ANDROID_KHR                        :: INSTANCE_CREATE_INFO_ANDROID_KHR;
    XR_TYPE_COMPOSITION_LAYER_DEPTH_INFO_KHR                        :: COMPOSITION_LAYER_DEPTH_INFO_KHR;
    XR_TYPE_VULKAN_SWAPCHAIN_FORMAT_LIST_CREATE_INFO_KHR            :: VULKAN_SWAPCHAIN_FORMAT_LIST_CREATE_INFO_KHR;
    XR_TYPE_EVENT_DATA_PERF_SETTINGS_EXT                            :: EVENT_DATA_PERF_SETTINGS_EXT;
    XR_TYPE_COMPOSITION_LAYER_CYLINDER_KHR                          :: COMPOSITION_LAYER_CYLINDER_KHR;
    XR_TYPE_COMPOSITION_LAYER_EQUIRECT_KHR                          :: COMPOSITION_LAYER_EQUIRECT_KHR;
    XR_TYPE_DEBUG_UTILS_OBJECT_NAME_INFO_EXT                        :: DEBUG_UTILS_OBJECT_NAME_INFO_EXT;
    XR_TYPE_DEBUG_UTILS_MESSENGER_CALLBACK_DATA_EXT                 :: DEBUG_UTILS_MESSENGER_CALLBACK_DATA_EXT;
    XR_TYPE_DEBUG_UTILS_MESSENGER_CREATE_INFO_EXT                   :: DEBUG_UTILS_MESSENGER_CREATE_INFO_EXT;
    XR_TYPE_DEBUG_UTILS_LABEL_EXT                                   :: DEBUG_UTILS_LABEL_EXT;
    XR_TYPE_GRAPHICS_BINDING_OPENGL_WIN32_KHR                       :: GRAPHICS_BINDING_OPENGL_WIN32_KHR;
    XR_TYPE_GRAPHICS_BINDING_OPENGL_XLIB_KHR                        :: GRAPHICS_BINDING_OPENGL_XLIB_KHR;
    XR_TYPE_GRAPHICS_BINDING_OPENGL_XCB_KHR                         :: GRAPHICS_BINDING_OPENGL_XCB_KHR;
    XR_TYPE_GRAPHICS_BINDING_OPENGL_WAYLAND_KHR                     :: GRAPHICS_BINDING_OPENGL_WAYLAND_KHR;
    XR_TYPE_SWAPCHAIN_IMAGE_OPENGL_KHR                              :: SWAPCHAIN_IMAGE_OPENGL_KHR;
    XR_TYPE_GRAPHICS_REQUIREMENTS_OPENGL_KHR                        :: GRAPHICS_REQUIREMENTS_OPENGL_KHR;
    XR_TYPE_GRAPHICS_BINDING_OPENGL_ES_ANDROID_KHR                  :: GRAPHICS_BINDING_OPENGL_ES_ANDROID_KHR;
    XR_TYPE_SWAPCHAIN_IMAGE_OPENGL_ES_KHR                           :: SWAPCHAIN_IMAGE_OPENGL_ES_KHR;
    XR_TYPE_GRAPHICS_REQUIREMENTS_OPENGL_ES_KHR                     :: GRAPHICS_REQUIREMENTS_OPENGL_ES_KHR;
    XR_TYPE_GRAPHICS_BINDING_VULKAN_KHR                             :: GRAPHICS_BINDING_VULKAN_KHR;
    XR_TYPE_SWAPCHAIN_IMAGE_VULKAN_KHR                              :: SWAPCHAIN_IMAGE_VULKAN_KHR;
    XR_TYPE_GRAPHICS_REQUIREMENTS_VULKAN_KHR                        :: GRAPHICS_REQUIREMENTS_VULKAN_KHR;
    XR_TYPE_GRAPHICS_BINDING_D3D11_KHR                              :: GRAPHICS_BINDING_D3D11_KHR;
    XR_TYPE_SWAPCHAIN_IMAGE_D3D11_KHR                               :: SWAPCHAIN_IMAGE_D3D11_KHR;
    XR_TYPE_GRAPHICS_REQUIREMENTS_D3D11_KHR                         :: GRAPHICS_REQUIREMENTS_D3D11_KHR;
    XR_TYPE_GRAPHICS_BINDING_D3D12_KHR                              :: GRAPHICS_BINDING_D3D12_KHR;
    XR_TYPE_SWAPCHAIN_IMAGE_D3D12_KHR                               :: SWAPCHAIN_IMAGE_D3D12_KHR;
    XR_TYPE_GRAPHICS_REQUIREMENTS_D3D12_KHR                         :: GRAPHICS_REQUIREMENTS_D3D12_KHR;
    XR_TYPE_SYSTEM_EYE_GAZE_INTERACTION_PROPERTIES_EXT              :: SYSTEM_EYE_GAZE_INTERACTION_PROPERTIES_EXT;
    XR_TYPE_EYE_GAZE_SAMPLE_TIME_EXT                                :: EYE_GAZE_SAMPLE_TIME_EXT;
    XR_TYPE_VISIBILITY_MASK_KHR                                     :: VISIBILITY_MASK_KHR;
    XR_TYPE_EVENT_DATA_VISIBILITY_MASK_CHANGED_KHR                  :: EVENT_DATA_VISIBILITY_MASK_CHANGED_KHR;
    XR_TYPE_SESSION_CREATE_INFO_OVERLAY_EXTX                        :: SESSION_CREATE_INFO_OVERLAY_EXTX;
    XR_TYPE_EVENT_DATA_MAIN_SESSION_VISIBILITY_CHANGED_EXTX         :: EVENT_DATA_MAIN_SESSION_VISIBILITY_CHANGED_EXTX;
    XR_TYPE_COMPOSITION_LAYER_COLOR_SCALE_BIAS_KHR                  :: COMPOSITION_LAYER_COLOR_SCALE_BIAS_KHR;
    XR_TYPE_SPATIAL_ANCHOR_CREATE_INFO_MSFT                         :: SPATIAL_ANCHOR_CREATE_INFO_MSFT;
    XR_TYPE_SPATIAL_ANCHOR_SPACE_CREATE_INFO_MSFT                   :: SPATIAL_ANCHOR_SPACE_CREATE_INFO_MSFT;
    XR_TYPE_COMPOSITION_LAYER_IMAGE_LAYOUT_FB                       :: COMPOSITION_LAYER_IMAGE_LAYOUT_FB;
    XR_TYPE_COMPOSITION_LAYER_ALPHA_BLEND_FB                        :: COMPOSITION_LAYER_ALPHA_BLEND_FB;
    XR_TYPE_VIEW_CONFIGURATION_DEPTH_RANGE_EXT                      :: VIEW_CONFIGURATION_DEPTH_RANGE_EXT;
    XR_TYPE_GRAPHICS_BINDING_EGL_MNDX                               :: GRAPHICS_BINDING_EGL_MNDX;
    XR_TYPE_SPATIAL_GRAPH_NODE_SPACE_CREATE_INFO_MSFT               :: SPATIAL_GRAPH_NODE_SPACE_CREATE_INFO_MSFT;
    XR_TYPE_SPATIAL_GRAPH_STATIC_NODE_BINDING_CREATE_INFO_MSFT      :: SPATIAL_GRAPH_STATIC_NODE_BINDING_CREATE_INFO_MSFT;
    XR_TYPE_SPATIAL_GRAPH_NODE_BINDING_PROPERTIES_GET_INFO_MSFT     :: SPATIAL_GRAPH_NODE_BINDING_PROPERTIES_GET_INFO_MSFT;
    XR_TYPE_SPATIAL_GRAPH_NODE_BINDING_PROPERTIES_MSFT              :: SPATIAL_GRAPH_NODE_BINDING_PROPERTIES_MSFT;
    XR_TYPE_SYSTEM_HAND_TRACKING_PROPERTIES_EXT                     :: SYSTEM_HAND_TRACKING_PROPERTIES_EXT;
    XR_TYPE_HAND_TRACKER_CREATE_INFO_EXT                            :: HAND_TRACKER_CREATE_INFO_EXT;
    XR_TYPE_HAND_JOINTS_LOCATE_INFO_EXT                             :: HAND_JOINTS_LOCATE_INFO_EXT;
    XR_TYPE_HAND_JOINT_LOCATIONS_EXT                                :: HAND_JOINT_LOCATIONS_EXT;
    XR_TYPE_HAND_JOINT_VELOCITIES_EXT                               :: HAND_JOINT_VELOCITIES_EXT;
    XR_TYPE_SYSTEM_HAND_TRACKING_MESH_PROPERTIES_MSFT               :: SYSTEM_HAND_TRACKING_MESH_PROPERTIES_MSFT;
    XR_TYPE_HAND_MESH_SPACE_CREATE_INFO_MSFT                        :: HAND_MESH_SPACE_CREATE_INFO_MSFT;
    XR_TYPE_HAND_MESH_UPDATE_INFO_MSFT                              :: HAND_MESH_UPDATE_INFO_MSFT;
    XR_TYPE_HAND_MESH_MSFT                                          :: HAND_MESH_MSFT;
    XR_TYPE_HAND_POSE_TYPE_INFO_MSFT                                :: HAND_POSE_TYPE_INFO_MSFT;
    XR_TYPE_SECONDARY_VIEW_CONFIGURATION_SESSION_BEGIN_INFO_MSFT    :: SECONDARY_VIEW_CONFIGURATION_SESSION_BEGIN_INFO_MSFT;
    XR_TYPE_SECONDARY_VIEW_CONFIGURATION_STATE_MSFT                 :: SECONDARY_VIEW_CONFIGURATION_STATE_MSFT;
    XR_TYPE_SECONDARY_VIEW_CONFIGURATION_FRAME_STATE_MSFT           :: SECONDARY_VIEW_CONFIGURATION_FRAME_STATE_MSFT;
    XR_TYPE_SECONDARY_VIEW_CONFIGURATION_FRAME_END_INFO_MSFT        :: SECONDARY_VIEW_CONFIGURATION_FRAME_END_INFO_MSFT;
    XR_TYPE_SECONDARY_VIEW_CONFIGURATION_LAYER_INFO_MSFT            :: SECONDARY_VIEW_CONFIGURATION_LAYER_INFO_MSFT;
    XR_TYPE_SECONDARY_VIEW_CONFIGURATION_SWAPCHAIN_CREATE_INFO_MSFT :: SECONDARY_VIEW_CONFIGURATION_SWAPCHAIN_CREATE_INFO_MSFT;
    XR_TYPE_CONTROLLER_MODEL_KEY_STATE_MSFT                         :: CONTROLLER_MODEL_KEY_STATE_MSFT;
    XR_TYPE_CONTROLLER_MODEL_NODE_PROPERTIES_MSFT                   :: CONTROLLER_MODEL_NODE_PROPERTIES_MSFT;
    XR_TYPE_CONTROLLER_MODEL_PROPERTIES_MSFT                        :: CONTROLLER_MODEL_PROPERTIES_MSFT;
    XR_TYPE_CONTROLLER_MODEL_NODE_STATE_MSFT                        :: CONTROLLER_MODEL_NODE_STATE_MSFT;
    XR_TYPE_CONTROLLER_MODEL_STATE_MSFT                             :: CONTROLLER_MODEL_STATE_MSFT;
    XR_TYPE_VIEW_CONFIGURATION_VIEW_FOV_EPIC                        :: VIEW_CONFIGURATION_VIEW_FOV_EPIC;
    XR_TYPE_HOLOGRAPHIC_WINDOW_ATTACHMENT_MSFT                      :: HOLOGRAPHIC_WINDOW_ATTACHMENT_MSFT;
    XR_TYPE_COMPOSITION_LAYER_REPROJECTION_INFO_MSFT                :: COMPOSITION_LAYER_REPROJECTION_INFO_MSFT;
    XR_TYPE_COMPOSITION_LAYER_REPROJECTION_PLANE_OVERRIDE_MSFT      :: COMPOSITION_LAYER_REPROJECTION_PLANE_OVERRIDE_MSFT;
    XR_TYPE_ANDROID_SURFACE_SWAPCHAIN_CREATE_INFO_FB                :: ANDROID_SURFACE_SWAPCHAIN_CREATE_INFO_FB;
    XR_TYPE_COMPOSITION_LAYER_SECURE_CONTENT_FB                     :: COMPOSITION_LAYER_SECURE_CONTENT_FB;
    XR_TYPE_INTERACTION_PROFILE_DPAD_BINDING_EXT                    :: INTERACTION_PROFILE_DPAD_BINDING_EXT;
    XR_TYPE_INTERACTION_PROFILE_ANALOG_THRESHOLD_VALVE              :: INTERACTION_PROFILE_ANALOG_THRESHOLD_VALVE;
    XR_TYPE_HAND_JOINTS_MOTION_RANGE_INFO_EXT                       :: HAND_JOINTS_MOTION_RANGE_INFO_EXT;
    XR_TYPE_LOADER_INIT_INFO_ANDROID_KHR                            :: LOADER_INIT_INFO_ANDROID_KHR;
    XR_TYPE_VULKAN_INSTANCE_CREATE_INFO_KHR                         :: VULKAN_INSTANCE_CREATE_INFO_KHR;
    XR_TYPE_VULKAN_DEVICE_CREATE_INFO_KHR                           :: VULKAN_DEVICE_CREATE_INFO_KHR;
    XR_TYPE_VULKAN_GRAPHICS_DEVICE_GET_INFO_KHR                     :: VULKAN_GRAPHICS_DEVICE_GET_INFO_KHR;
    XR_TYPE_COMPOSITION_LAYER_EQUIRECT2_KHR                         :: COMPOSITION_LAYER_EQUIRECT2_KHR;
    XR_TYPE_SCENE_OBSERVER_CREATE_INFO_MSFT                         :: SCENE_OBSERVER_CREATE_INFO_MSFT;
    XR_TYPE_SCENE_CREATE_INFO_MSFT                                  :: SCENE_CREATE_INFO_MSFT;
    XR_TYPE_NEW_SCENE_COMPUTE_INFO_MSFT                             :: NEW_SCENE_COMPUTE_INFO_MSFT;
    XR_TYPE_VISUAL_MESH_COMPUTE_LOD_INFO_MSFT                       :: VISUAL_MESH_COMPUTE_LOD_INFO_MSFT;
    XR_TYPE_SCENE_COMPONENTS_MSFT                                   :: SCENE_COMPONENTS_MSFT;
    XR_TYPE_SCENE_COMPONENTS_GET_INFO_MSFT                          :: SCENE_COMPONENTS_GET_INFO_MSFT;
    XR_TYPE_SCENE_COMPONENT_LOCATIONS_MSFT                          :: SCENE_COMPONENT_LOCATIONS_MSFT;
    XR_TYPE_SCENE_COMPONENTS_LOCATE_INFO_MSFT                       :: SCENE_COMPONENTS_LOCATE_INFO_MSFT;
    XR_TYPE_SCENE_OBJECTS_MSFT                                      :: SCENE_OBJECTS_MSFT;
    XR_TYPE_SCENE_COMPONENT_PARENT_FILTER_INFO_MSFT                 :: SCENE_COMPONENT_PARENT_FILTER_INFO_MSFT;
    XR_TYPE_SCENE_OBJECT_TYPES_FILTER_INFO_MSFT                     :: SCENE_OBJECT_TYPES_FILTER_INFO_MSFT;
    XR_TYPE_SCENE_PLANES_MSFT                                       :: SCENE_PLANES_MSFT;
    XR_TYPE_SCENE_PLANE_ALIGNMENT_FILTER_INFO_MSFT                  :: SCENE_PLANE_ALIGNMENT_FILTER_INFO_MSFT;
    XR_TYPE_SCENE_MESHES_MSFT                                       :: SCENE_MESHES_MSFT;
    XR_TYPE_SCENE_MESH_BUFFERS_GET_INFO_MSFT                        :: SCENE_MESH_BUFFERS_GET_INFO_MSFT;
    XR_TYPE_SCENE_MESH_BUFFERS_MSFT                                 :: SCENE_MESH_BUFFERS_MSFT;
    XR_TYPE_SCENE_MESH_VERTEX_BUFFER_MSFT                           :: SCENE_MESH_VERTEX_BUFFER_MSFT;
    XR_TYPE_SCENE_MESH_INDICES_UINT32_MSFT                          :: SCENE_MESH_INDICES_UINT32_MSFT;
    XR_TYPE_SCENE_MESH_INDICES_UINT16_MSFT                          :: SCENE_MESH_INDICES_UINT16_MSFT;
    XR_TYPE_SERIALIZED_SCENE_FRAGMENT_DATA_GET_INFO_MSFT            :: SERIALIZED_SCENE_FRAGMENT_DATA_GET_INFO_MSFT;
    XR_TYPE_SCENE_DESERIALIZE_INFO_MSFT                             :: SCENE_DESERIALIZE_INFO_MSFT;
    XR_TYPE_EVENT_DATA_DISPLAY_REFRESH_RATE_CHANGED_FB              :: EVENT_DATA_DISPLAY_REFRESH_RATE_CHANGED_FB;
    XR_TYPE_VIVE_TRACKER_PATHS_HTCX                                 :: VIVE_TRACKER_PATHS_HTCX;
    XR_TYPE_EVENT_DATA_VIVE_TRACKER_CONNECTED_HTCX                  :: EVENT_DATA_VIVE_TRACKER_CONNECTED_HTCX;
    XR_TYPE_SYSTEM_FACIAL_TRACKING_PROPERTIES_HTC                   :: SYSTEM_FACIAL_TRACKING_PROPERTIES_HTC;
    XR_TYPE_FACIAL_TRACKER_CREATE_INFO_HTC                          :: FACIAL_TRACKER_CREATE_INFO_HTC;
    XR_TYPE_FACIAL_EXPRESSIONS_HTC                                  :: FACIAL_EXPRESSIONS_HTC;
    XR_TYPE_SYSTEM_COLOR_SPACE_PROPERTIES_FB                        :: SYSTEM_COLOR_SPACE_PROPERTIES_FB;
    XR_TYPE_HAND_TRACKING_MESH_FB                                   :: HAND_TRACKING_MESH_FB;
    XR_TYPE_HAND_TRACKING_SCALE_FB                                  :: HAND_TRACKING_SCALE_FB;
    XR_TYPE_HAND_TRACKING_AIM_STATE_FB                              :: HAND_TRACKING_AIM_STATE_FB;
    XR_TYPE_HAND_TRACKING_CAPSULES_STATE_FB                         :: HAND_TRACKING_CAPSULES_STATE_FB;
    XR_TYPE_SYSTEM_SPATIAL_ENTITY_PROPERTIES_FB                     :: SYSTEM_SPATIAL_ENTITY_PROPERTIES_FB;
    XR_TYPE_SPATIAL_ANCHOR_CREATE_INFO_FB                           :: SPATIAL_ANCHOR_CREATE_INFO_FB;
    XR_TYPE_SPACE_COMPONENT_STATUS_SET_INFO_FB                      :: SPACE_COMPONENT_STATUS_SET_INFO_FB;
    XR_TYPE_SPACE_COMPONENT_STATUS_FB                               :: SPACE_COMPONENT_STATUS_FB;
    XR_TYPE_EVENT_DATA_SPATIAL_ANCHOR_CREATE_COMPLETE_FB            :: EVENT_DATA_SPATIAL_ANCHOR_CREATE_COMPLETE_FB;
    XR_TYPE_EVENT_DATA_SPACE_SET_STATUS_COMPLETE_FB                 :: EVENT_DATA_SPACE_SET_STATUS_COMPLETE_FB;
    XR_TYPE_FOVEATION_PROFILE_CREATE_INFO_FB                        :: FOVEATION_PROFILE_CREATE_INFO_FB;
    XR_TYPE_SWAPCHAIN_CREATE_INFO_FOVEATION_FB                      :: SWAPCHAIN_CREATE_INFO_FOVEATION_FB;
    XR_TYPE_SWAPCHAIN_STATE_FOVEATION_FB                            :: SWAPCHAIN_STATE_FOVEATION_FB;
    XR_TYPE_FOVEATION_LEVEL_PROFILE_CREATE_INFO_FB                  :: FOVEATION_LEVEL_PROFILE_CREATE_INFO_FB;
    XR_TYPE_KEYBOARD_SPACE_CREATE_INFO_FB                           :: KEYBOARD_SPACE_CREATE_INFO_FB;
    XR_TYPE_KEYBOARD_TRACKING_QUERY_FB                              :: KEYBOARD_TRACKING_QUERY_FB;
    XR_TYPE_SYSTEM_KEYBOARD_TRACKING_PROPERTIES_FB                  :: SYSTEM_KEYBOARD_TRACKING_PROPERTIES_FB;
    XR_TYPE_TRIANGLE_MESH_CREATE_INFO_FB                            :: TRIANGLE_MESH_CREATE_INFO_FB;
    XR_TYPE_SYSTEM_PASSTHROUGH_PROPERTIES_FB                        :: SYSTEM_PASSTHROUGH_PROPERTIES_FB;
    XR_TYPE_PASSTHROUGH_CREATE_INFO_FB                              :: PASSTHROUGH_CREATE_INFO_FB;
    XR_TYPE_PASSTHROUGH_LAYER_CREATE_INFO_FB                        :: PASSTHROUGH_LAYER_CREATE_INFO_FB;
    XR_TYPE_COMPOSITION_LAYER_PASSTHROUGH_FB                        :: COMPOSITION_LAYER_PASSTHROUGH_FB;
    XR_TYPE_GEOMETRY_INSTANCE_CREATE_INFO_FB                        :: GEOMETRY_INSTANCE_CREATE_INFO_FB;
    XR_TYPE_GEOMETRY_INSTANCE_TRANSFORM_FB                          :: GEOMETRY_INSTANCE_TRANSFORM_FB;
    XR_TYPE_PASSTHROUGH_STYLE_FB                                    :: PASSTHROUGH_STYLE_FB;
    XR_TYPE_PASSTHROUGH_COLOR_MAP_MONO_TO_RGBA_FB                   :: PASSTHROUGH_COLOR_MAP_MONO_TO_RGBA_FB;
    XR_TYPE_PASSTHROUGH_COLOR_MAP_MONO_TO_MONO_FB                   :: PASSTHROUGH_COLOR_MAP_MONO_TO_MONO_FB;
    XR_TYPE_PASSTHROUGH_BRIGHTNESS_CONTRAST_SATURATION_FB           :: PASSTHROUGH_BRIGHTNESS_CONTRAST_SATURATION_FB;
    XR_TYPE_EVENT_DATA_PASSTHROUGH_STATE_CHANGED_FB                 :: EVENT_DATA_PASSTHROUGH_STATE_CHANGED_FB;
    XR_TYPE_RENDER_MODEL_PATH_INFO_FB                               :: RENDER_MODEL_PATH_INFO_FB;
    XR_TYPE_RENDER_MODEL_PROPERTIES_FB                              :: RENDER_MODEL_PROPERTIES_FB;
    XR_TYPE_RENDER_MODEL_BUFFER_FB                                  :: RENDER_MODEL_BUFFER_FB;
    XR_TYPE_RENDER_MODEL_LOAD_INFO_FB                               :: RENDER_MODEL_LOAD_INFO_FB;
    XR_TYPE_SYSTEM_RENDER_MODEL_PROPERTIES_FB                       :: SYSTEM_RENDER_MODEL_PROPERTIES_FB;
    XR_TYPE_RENDER_MODEL_CAPABILITIES_REQUEST_FB                    :: RENDER_MODEL_CAPABILITIES_REQUEST_FB;
    XR_TYPE_BINDING_MODIFICATIONS_KHR                               :: BINDING_MODIFICATIONS_KHR;
    XR_TYPE_VIEW_LOCATE_FOVEATED_RENDERING_VARJO                    :: VIEW_LOCATE_FOVEATED_RENDERING_VARJO;
    XR_TYPE_FOVEATED_VIEW_CONFIGURATION_VIEW_VARJO                  :: FOVEATED_VIEW_CONFIGURATION_VIEW_VARJO;
    XR_TYPE_SYSTEM_FOVEATED_RENDERING_PROPERTIES_VARJO              :: SYSTEM_FOVEATED_RENDERING_PROPERTIES_VARJO;
    XR_TYPE_COMPOSITION_LAYER_DEPTH_TEST_VARJO                      :: COMPOSITION_LAYER_DEPTH_TEST_VARJO;
    XR_TYPE_SYSTEM_MARKER_TRACKING_PROPERTIES_VARJO                 :: SYSTEM_MARKER_TRACKING_PROPERTIES_VARJO;
    XR_TYPE_EVENT_DATA_MARKER_TRACKING_UPDATE_VARJO                 :: EVENT_DATA_MARKER_TRACKING_UPDATE_VARJO;
    XR_TYPE_MARKER_SPACE_CREATE_INFO_VARJO                          :: MARKER_SPACE_CREATE_INFO_VARJO;
    XR_TYPE_SPATIAL_ANCHOR_PERSISTENCE_INFO_MSFT                    :: SPATIAL_ANCHOR_PERSISTENCE_INFO_MSFT;
    XR_TYPE_SPATIAL_ANCHOR_FROM_PERSISTED_ANCHOR_CREATE_INFO_MSFT   :: SPATIAL_ANCHOR_FROM_PERSISTED_ANCHOR_CREATE_INFO_MSFT;
    XR_TYPE_SPACE_QUERY_INFO_FB                                     :: SPACE_QUERY_INFO_FB;
    XR_TYPE_SPACE_QUERY_RESULTS_FB                                  :: SPACE_QUERY_RESULTS_FB;
    XR_TYPE_SPACE_STORAGE_LOCATION_FILTER_INFO_FB                   :: SPACE_STORAGE_LOCATION_FILTER_INFO_FB;
    XR_TYPE_SPACE_UUID_FILTER_INFO_FB                               :: SPACE_UUID_FILTER_INFO_FB;
    XR_TYPE_SPACE_COMPONENT_FILTER_INFO_FB                          :: SPACE_COMPONENT_FILTER_INFO_FB;
    XR_TYPE_EVENT_DATA_SPACE_QUERY_RESULTS_AVAILABLE_FB             :: EVENT_DATA_SPACE_QUERY_RESULTS_AVAILABLE_FB;
    XR_TYPE_EVENT_DATA_SPACE_QUERY_COMPLETE_FB                      :: EVENT_DATA_SPACE_QUERY_COMPLETE_FB;
    XR_TYPE_SPACE_SAVE_INFO_FB                                      :: SPACE_SAVE_INFO_FB;
    XR_TYPE_SPACE_ERASE_INFO_FB                                     :: SPACE_ERASE_INFO_FB;
    XR_TYPE_EVENT_DATA_SPACE_SAVE_COMPLETE_FB                       :: EVENT_DATA_SPACE_SAVE_COMPLETE_FB;
    XR_TYPE_EVENT_DATA_SPACE_ERASE_COMPLETE_FB                      :: EVENT_DATA_SPACE_ERASE_COMPLETE_FB;
    XR_TYPE_SWAPCHAIN_IMAGE_FOVEATION_VULKAN_FB                     :: SWAPCHAIN_IMAGE_FOVEATION_VULKAN_FB;
    XR_TYPE_SWAPCHAIN_STATE_ANDROID_SURFACE_DIMENSIONS_FB           :: SWAPCHAIN_STATE_ANDROID_SURFACE_DIMENSIONS_FB;
    XR_TYPE_SWAPCHAIN_STATE_SAMPLER_OPENGL_ES_FB                    :: SWAPCHAIN_STATE_SAMPLER_OPENGL_ES_FB;
    XR_TYPE_SWAPCHAIN_STATE_SAMPLER_VULKAN_FB                       :: SWAPCHAIN_STATE_SAMPLER_VULKAN_FB;
    XR_TYPE_COMPOSITION_LAYER_SPACE_WARP_INFO_FB                    :: COMPOSITION_LAYER_SPACE_WARP_INFO_FB;
    XR_TYPE_SYSTEM_SPACE_WARP_PROPERTIES_FB                         :: SYSTEM_SPACE_WARP_PROPERTIES_FB;
    XR_TYPE_SEMANTIC_LABELS_FB                                      :: SEMANTIC_LABELS_FB;
    XR_TYPE_ROOM_LAYOUT_FB                                          :: ROOM_LAYOUT_FB;
    XR_TYPE_BOUNDARY_2D_FB                                          :: BOUNDARY_2D_FB;
    XR_TYPE_DIGITAL_LENS_CONTROL_ALMALENCE                          :: DIGITAL_LENS_CONTROL_ALMALENCE;
    XR_TYPE_SPACE_CONTAINER_FB                                      :: SPACE_CONTAINER_FB;
    XR_TYPE_PASSTHROUGH_KEYBOARD_HANDS_INTENSITY_FB                 :: PASSTHROUGH_KEYBOARD_HANDS_INTENSITY_FB;
    XR_TYPE_COMPOSITION_LAYER_SETTINGS_FB                           :: COMPOSITION_LAYER_SETTINGS_FB;
    XR_TYPE_VULKAN_SWAPCHAIN_CREATE_INFO_META                       :: VULKAN_SWAPCHAIN_CREATE_INFO_META;
    XR_TYPE_PERFORMANCE_METRICS_STATE_META                          :: PERFORMANCE_METRICS_STATE_META;
    XR_TYPE_PERFORMANCE_METRICS_COUNTER_META                        :: PERFORMANCE_METRICS_COUNTER_META;
    XR_TYPE_GRAPHICS_BINDING_VULKAN2_KHR                            :: GRAPHICS_BINDING_VULKAN2_KHR;
    XR_TYPE_SWAPCHAIN_IMAGE_VULKAN2_KHR                             :: SWAPCHAIN_IMAGE_VULKAN2_KHR;
    XR_TYPE_GRAPHICS_REQUIREMENTS_VULKAN2_KHR                       :: GRAPHICS_REQUIREMENTS_VULKAN2_KHR;
}

XrFormFactor :: enum s32 {
    HEAD_MOUNTED_DISPLAY :: 1;
    HANDHELD_DISPLAY     :: 2;
    MAX_ENUM             :: 2147483647;

    XR_FORM_FACTOR_HEAD_MOUNTED_DISPLAY :: HEAD_MOUNTED_DISPLAY;
    XR_FORM_FACTOR_HANDHELD_DISPLAY     :: HANDHELD_DISPLAY;
    XR_FORM_FACTOR_MAX_ENUM             :: MAX_ENUM;
}

XrViewConfigurationType :: enum s32 {
    PRIMARY_MONO                              :: 1;
    PRIMARY_STEREO                            :: 2;
    PRIMARY_QUAD_VARJO                        :: 1000037000;
    SECONDARY_MONO_FIRST_PERSON_OBSERVER_MSFT :: 1000054000;
    MAX_ENUM                                  :: 2147483647;

    XR_VIEW_CONFIGURATION_TYPE_PRIMARY_MONO                              :: PRIMARY_MONO;
    XR_VIEW_CONFIGURATION_TYPE_PRIMARY_STEREO                            :: PRIMARY_STEREO;
    XR_VIEW_CONFIGURATION_TYPE_PRIMARY_QUAD_VARJO                        :: PRIMARY_QUAD_VARJO;
    XR_VIEW_CONFIGURATION_TYPE_SECONDARY_MONO_FIRST_PERSON_OBSERVER_MSFT :: SECONDARY_MONO_FIRST_PERSON_OBSERVER_MSFT;
    XR_VIEW_CONFIGURATION_TYPE_MAX_ENUM                                  :: MAX_ENUM;
}

XrEnvironmentBlendMode :: enum s32 {
    OPAQUE      :: 1;
    ADDITIVE    :: 2;
    ALPHA_BLEND :: 3;
    MAX_ENUM    :: 2147483647;

    XR_ENVIRONMENT_BLEND_MODE_OPAQUE      :: OPAQUE;
    XR_ENVIRONMENT_BLEND_MODE_ADDITIVE    :: ADDITIVE;
    XR_ENVIRONMENT_BLEND_MODE_ALPHA_BLEND :: ALPHA_BLEND;
    XR_ENVIRONMENT_BLEND_MODE_MAX_ENUM    :: MAX_ENUM;
}

XrReferenceSpaceType :: enum s32 {
    VIEW               :: 1;
    LOCAL              :: 2;
    STAGE              :: 3;
    UNBOUNDED_MSFT     :: 1000038000;
    COMBINED_EYE_VARJO :: 1000121000;
    MAX_ENUM           :: 2147483647;

    XR_REFERENCE_SPACE_TYPE_VIEW               :: VIEW;
    XR_REFERENCE_SPACE_TYPE_LOCAL              :: LOCAL;
    XR_REFERENCE_SPACE_TYPE_STAGE              :: STAGE;
    XR_REFERENCE_SPACE_TYPE_UNBOUNDED_MSFT     :: UNBOUNDED_MSFT;
    XR_REFERENCE_SPACE_TYPE_COMBINED_EYE_VARJO :: COMBINED_EYE_VARJO;
    XR_REFERENCE_SPACE_TYPE_MAX_ENUM           :: MAX_ENUM;
}

XrActionType :: enum s32 {
    BOOLEAN_INPUT    :: 1;
    FLOAT_INPUT      :: 2;
    VECTOR2F_INPUT   :: 3;
    POSE_INPUT       :: 4;
    VIBRATION_OUTPUT :: 100;
    MAX_ENUM         :: 2147483647;

    XR_ACTION_TYPE_BOOLEAN_INPUT    :: BOOLEAN_INPUT;
    XR_ACTION_TYPE_FLOAT_INPUT      :: FLOAT_INPUT;
    XR_ACTION_TYPE_VECTOR2F_INPUT   :: VECTOR2F_INPUT;
    XR_ACTION_TYPE_POSE_INPUT       :: POSE_INPUT;
    XR_ACTION_TYPE_VIBRATION_OUTPUT :: VIBRATION_OUTPUT;
    XR_ACTION_TYPE_MAX_ENUM         :: MAX_ENUM;
}

XrEyeVisibility :: enum s32 {
    BOTH     :: 0;
    LEFT     :: 1;
    RIGHT    :: 2;
    MAX_ENUM :: 2147483647;

    XR_EYE_VISIBILITY_BOTH     :: BOTH;
    XR_EYE_VISIBILITY_LEFT     :: LEFT;
    XR_EYE_VISIBILITY_RIGHT    :: RIGHT;
    XR_EYE_VISIBILITY_MAX_ENUM :: MAX_ENUM;
}

XrSessionState :: enum s32 {
    UNKNOWN      :: 0;
    IDLE         :: 1;
    READY        :: 2;
    SYNCHRONIZED :: 3;
    VISIBLE      :: 4;
    FOCUSED      :: 5;
    STOPPING     :: 6;
    LOSS_PENDING :: 7;
    EXITING      :: 8;
    MAX_ENUM     :: 2147483647;

    XR_SESSION_STATE_UNKNOWN      :: UNKNOWN;
    XR_SESSION_STATE_IDLE         :: IDLE;
    XR_SESSION_STATE_READY        :: READY;
    XR_SESSION_STATE_SYNCHRONIZED :: SYNCHRONIZED;
    XR_SESSION_STATE_VISIBLE      :: VISIBLE;
    XR_SESSION_STATE_FOCUSED      :: FOCUSED;
    XR_SESSION_STATE_STOPPING     :: STOPPING;
    XR_SESSION_STATE_LOSS_PENDING :: LOSS_PENDING;
    XR_SESSION_STATE_EXITING      :: EXITING;
    XR_SESSION_STATE_MAX_ENUM     :: MAX_ENUM;
}

XrObjectType :: enum s32 {
    UNKNOWN                              :: 0;
    INSTANCE                             :: 1;
    SESSION                              :: 2;
    SWAPCHAIN                            :: 3;
    SPACE                                :: 4;
    ACTION_SET                           :: 5;
    ACTION                               :: 6;
    DEBUG_UTILS_MESSENGER_EXT            :: 1000019000;
    SPATIAL_ANCHOR_MSFT                  :: 1000039000;
    SPATIAL_GRAPH_NODE_BINDING_MSFT      :: 1000049000;
    HAND_TRACKER_EXT                     :: 1000051000;
    SCENE_OBSERVER_MSFT                  :: 1000097000;
    SCENE_MSFT                           :: 1000097001;
    FACIAL_TRACKER_HTC                   :: 1000104000;
    FOVEATION_PROFILE_FB                 :: 1000114000;
    TRIANGLE_MESH_FB                     :: 1000117000;
    PASSTHROUGH_FB                       :: 1000118000;
    PASSTHROUGH_LAYER_FB                 :: 1000118002;
    GEOMETRY_INSTANCE_FB                 :: 1000118004;
    SPATIAL_ANCHOR_STORE_CONNECTION_MSFT :: 1000142000;
    MAX_ENUM                             :: 2147483647;

    XR_OBJECT_TYPE_UNKNOWN                              :: UNKNOWN;
    XR_OBJECT_TYPE_INSTANCE                             :: INSTANCE;
    XR_OBJECT_TYPE_SESSION                              :: SESSION;
    XR_OBJECT_TYPE_SWAPCHAIN                            :: SWAPCHAIN;
    XR_OBJECT_TYPE_SPACE                                :: SPACE;
    XR_OBJECT_TYPE_ACTION_SET                           :: ACTION_SET;
    XR_OBJECT_TYPE_ACTION                               :: ACTION;
    XR_OBJECT_TYPE_DEBUG_UTILS_MESSENGER_EXT            :: DEBUG_UTILS_MESSENGER_EXT;
    XR_OBJECT_TYPE_SPATIAL_ANCHOR_MSFT                  :: SPATIAL_ANCHOR_MSFT;
    XR_OBJECT_TYPE_SPATIAL_GRAPH_NODE_BINDING_MSFT      :: SPATIAL_GRAPH_NODE_BINDING_MSFT;
    XR_OBJECT_TYPE_HAND_TRACKER_EXT                     :: HAND_TRACKER_EXT;
    XR_OBJECT_TYPE_SCENE_OBSERVER_MSFT                  :: SCENE_OBSERVER_MSFT;
    XR_OBJECT_TYPE_SCENE_MSFT                           :: SCENE_MSFT;
    XR_OBJECT_TYPE_FACIAL_TRACKER_HTC                   :: FACIAL_TRACKER_HTC;
    XR_OBJECT_TYPE_FOVEATION_PROFILE_FB                 :: FOVEATION_PROFILE_FB;
    XR_OBJECT_TYPE_TRIANGLE_MESH_FB                     :: TRIANGLE_MESH_FB;
    XR_OBJECT_TYPE_PASSTHROUGH_FB                       :: PASSTHROUGH_FB;
    XR_OBJECT_TYPE_PASSTHROUGH_LAYER_FB                 :: PASSTHROUGH_LAYER_FB;
    XR_OBJECT_TYPE_GEOMETRY_INSTANCE_FB                 :: GEOMETRY_INSTANCE_FB;
    XR_OBJECT_TYPE_SPATIAL_ANCHOR_STORE_CONNECTION_MSFT :: SPATIAL_ANCHOR_STORE_CONNECTION_MSFT;
    XR_OBJECT_TYPE_MAX_ENUM                             :: MAX_ENUM;
}

XrInstanceCreateFlags :: XrFlags64;

// Flag bits for XrInstanceCreateFlags
XrSessionCreateFlags :: XrFlags64;

// Flag bits for XrSessionCreateFlags
XrSpaceVelocityFlags :: XrFlags64;

// Flag bits for XrSpaceVelocityFlags
XR_SPACE_VELOCITY_LINEAR_VALID_BIT: XrSpaceVelocityFlags : 1;
XR_SPACE_VELOCITY_ANGULAR_VALID_BIT: XrSpaceVelocityFlags : 2;

XrSpaceLocationFlags :: XrFlags64;

// Flag bits for XrSpaceLocationFlags
XR_SPACE_LOCATION_ORIENTATION_VALID_BIT: XrSpaceLocationFlags : 1;
XR_SPACE_LOCATION_POSITION_VALID_BIT: XrSpaceLocationFlags : 2;
XR_SPACE_LOCATION_ORIENTATION_TRACKED_BIT: XrSpaceLocationFlags : 4;
XR_SPACE_LOCATION_POSITION_TRACKED_BIT: XrSpaceLocationFlags : 8;

XrSwapchainCreateFlags :: XrFlags64;

// Flag bits for XrSwapchainCreateFlags
XR_SWAPCHAIN_CREATE_PROTECTED_CONTENT_BIT: XrSwapchainCreateFlags : 1;
XR_SWAPCHAIN_CREATE_STATIC_IMAGE_BIT: XrSwapchainCreateFlags : 2;

XrSwapchainUsageFlags :: XrFlags64;

// Flag bits for XrSwapchainUsageFlags
XR_SWAPCHAIN_USAGE_COLOR_ATTACHMENT_BIT: XrSwapchainUsageFlags : 1;
XR_SWAPCHAIN_USAGE_DEPTH_STENCIL_ATTACHMENT_BIT: XrSwapchainUsageFlags : 2;
XR_SWAPCHAIN_USAGE_UNORDERED_ACCESS_BIT: XrSwapchainUsageFlags : 4;
XR_SWAPCHAIN_USAGE_TRANSFER_SRC_BIT: XrSwapchainUsageFlags : 8;
XR_SWAPCHAIN_USAGE_TRANSFER_DST_BIT: XrSwapchainUsageFlags : 16;
XR_SWAPCHAIN_USAGE_SAMPLED_BIT: XrSwapchainUsageFlags : 32;
XR_SWAPCHAIN_USAGE_MUTABLE_FORMAT_BIT: XrSwapchainUsageFlags : 64;
XR_SWAPCHAIN_USAGE_INPUT_ATTACHMENT_BIT_MND: XrSwapchainUsageFlags : 128;
XR_SWAPCHAIN_USAGE_INPUT_ATTACHMENT_BIT_KHR: XrSwapchainUsageFlags : 128; // alias of XR_SWAPCHAIN_USAGE_INPUT_ATTACHMENT_BIT_MND

XrCompositionLayerFlags :: XrFlags64;

// Flag bits for XrCompositionLayerFlags
XR_COMPOSITION_LAYER_CORRECT_CHROMATIC_ABERRATION_BIT: XrCompositionLayerFlags : 1;
XR_COMPOSITION_LAYER_BLEND_TEXTURE_SOURCE_ALPHA_BIT: XrCompositionLayerFlags : 2;
XR_COMPOSITION_LAYER_UNPREMULTIPLIED_ALPHA_BIT: XrCompositionLayerFlags : 4;

XrViewStateFlags :: XrFlags64;

// Flag bits for XrViewStateFlags
XR_VIEW_STATE_ORIENTATION_VALID_BIT: XrViewStateFlags : 1;
XR_VIEW_STATE_POSITION_VALID_BIT: XrViewStateFlags : 2;
XR_VIEW_STATE_ORIENTATION_TRACKED_BIT: XrViewStateFlags : 4;
XR_VIEW_STATE_POSITION_TRACKED_BIT: XrViewStateFlags : 8;

XrInputSourceLocalizedNameFlags :: XrFlags64;

// Flag bits for XrInputSourceLocalizedNameFlags
XR_INPUT_SOURCE_LOCALIZED_NAME_USER_PATH_BIT: XrInputSourceLocalizedNameFlags : 1;
XR_INPUT_SOURCE_LOCALIZED_NAME_INTERACTION_PROFILE_BIT: XrInputSourceLocalizedNameFlags : 2;
XR_INPUT_SOURCE_LOCALIZED_NAME_COMPONENT_BIT: XrInputSourceLocalizedNameFlags : 4;

PFN_xrVoidFunction :: #type () -> void #c_call;
XrApiLayerProperties :: struct {
    type:         XrStructureType;
    next:         *void;
    layerName:    [256] u8;
    specVersion:  XrVersion;
    layerVersion: u32;
    description:  [256] u8;
}
#run {
    instance: XrApiLayerProperties;
    assert(((cast(*void)(*instance.type)) - cast(*void)(*instance)) == 0, "XrApiLayerProperties.type has unexpected offset % instead of 0", ((cast(*void)(*instance.type)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrApiLayerProperties.type)) == 4, "XrApiLayerProperties.type has unexpected size % instead of 4", size_of(type_of(XrApiLayerProperties.type)));
    assert(((cast(*void)(*instance.next)) - cast(*void)(*instance)) == 8, "XrApiLayerProperties.next has unexpected offset % instead of 8", ((cast(*void)(*instance.next)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrApiLayerProperties.next)) == 8, "XrApiLayerProperties.next has unexpected size % instead of 8", size_of(type_of(XrApiLayerProperties.next)));
    assert(((cast(*void)(*instance.layerName)) - cast(*void)(*instance)) == 16, "XrApiLayerProperties.layerName has unexpected offset % instead of 16", ((cast(*void)(*instance.layerName)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrApiLayerProperties.layerName)) == 256, "XrApiLayerProperties.layerName has unexpected size % instead of 256", size_of(type_of(XrApiLayerProperties.layerName)));
    assert(((cast(*void)(*instance.specVersion)) - cast(*void)(*instance)) == 272, "XrApiLayerProperties.specVersion has unexpected offset % instead of 272", ((cast(*void)(*instance.specVersion)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrApiLayerProperties.specVersion)) == 8, "XrApiLayerProperties.specVersion has unexpected size % instead of 8", size_of(type_of(XrApiLayerProperties.specVersion)));
    assert(((cast(*void)(*instance.layerVersion)) - cast(*void)(*instance)) == 280, "XrApiLayerProperties.layerVersion has unexpected offset % instead of 280", ((cast(*void)(*instance.layerVersion)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrApiLayerProperties.layerVersion)) == 4, "XrApiLayerProperties.layerVersion has unexpected size % instead of 4", size_of(type_of(XrApiLayerProperties.layerVersion)));
    assert(((cast(*void)(*instance.description)) - cast(*void)(*instance)) == 284, "XrApiLayerProperties.description has unexpected offset % instead of 284", ((cast(*void)(*instance.description)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrApiLayerProperties.description)) == 256, "XrApiLayerProperties.description has unexpected size % instead of 256", size_of(type_of(XrApiLayerProperties.description)));
    assert(size_of(XrApiLayerProperties) == 544, "XrApiLayerProperties has size % instead of 544", size_of(XrApiLayerProperties));
}

XrExtensionProperties :: struct {
    type:             XrStructureType;
    next:             *void;
    extensionName:    [128] u8;
    extensionVersion: u32;
}
#run {
    instance: XrExtensionProperties;
    assert(((cast(*void)(*instance.type)) - cast(*void)(*instance)) == 0, "XrExtensionProperties.type has unexpected offset % instead of 0", ((cast(*void)(*instance.type)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrExtensionProperties.type)) == 4, "XrExtensionProperties.type has unexpected size % instead of 4", size_of(type_of(XrExtensionProperties.type)));
    assert(((cast(*void)(*instance.next)) - cast(*void)(*instance)) == 8, "XrExtensionProperties.next has unexpected offset % instead of 8", ((cast(*void)(*instance.next)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrExtensionProperties.next)) == 8, "XrExtensionProperties.next has unexpected size % instead of 8", size_of(type_of(XrExtensionProperties.next)));
    assert(((cast(*void)(*instance.extensionName)) - cast(*void)(*instance)) == 16, "XrExtensionProperties.extensionName has unexpected offset % instead of 16", ((cast(*void)(*instance.extensionName)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrExtensionProperties.extensionName)) == 128, "XrExtensionProperties.extensionName has unexpected size % instead of 128", size_of(type_of(XrExtensionProperties.extensionName)));
    assert(((cast(*void)(*instance.extensionVersion)) - cast(*void)(*instance)) == 144, "XrExtensionProperties.extensionVersion has unexpected offset % instead of 144", ((cast(*void)(*instance.extensionVersion)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrExtensionProperties.extensionVersion)) == 4, "XrExtensionProperties.extensionVersion has unexpected size % instead of 4", size_of(type_of(XrExtensionProperties.extensionVersion)));
    assert(size_of(XrExtensionProperties) == 152, "XrExtensionProperties has size % instead of 152", size_of(XrExtensionProperties));
}

XrApplicationInfo :: struct {
    applicationName:    [128] u8;
    applicationVersion: u32;
    engineName:         [128] u8;
    engineVersion:      u32;
    apiVersion:         XrVersion;
}
#run {
    instance: XrApplicationInfo;
    assert(((cast(*void)(*instance.applicationName)) - cast(*void)(*instance)) == 0, "XrApplicationInfo.applicationName has unexpected offset % instead of 0", ((cast(*void)(*instance.applicationName)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrApplicationInfo.applicationName)) == 128, "XrApplicationInfo.applicationName has unexpected size % instead of 128", size_of(type_of(XrApplicationInfo.applicationName)));
    assert(((cast(*void)(*instance.applicationVersion)) - cast(*void)(*instance)) == 128, "XrApplicationInfo.applicationVersion has unexpected offset % instead of 128", ((cast(*void)(*instance.applicationVersion)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrApplicationInfo.applicationVersion)) == 4, "XrApplicationInfo.applicationVersion has unexpected size % instead of 4", size_of(type_of(XrApplicationInfo.applicationVersion)));
    assert(((cast(*void)(*instance.engineName)) - cast(*void)(*instance)) == 132, "XrApplicationInfo.engineName has unexpected offset % instead of 132", ((cast(*void)(*instance.engineName)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrApplicationInfo.engineName)) == 128, "XrApplicationInfo.engineName has unexpected size % instead of 128", size_of(type_of(XrApplicationInfo.engineName)));
    assert(((cast(*void)(*instance.engineVersion)) - cast(*void)(*instance)) == 260, "XrApplicationInfo.engineVersion has unexpected offset % instead of 260", ((cast(*void)(*instance.engineVersion)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrApplicationInfo.engineVersion)) == 4, "XrApplicationInfo.engineVersion has unexpected size % instead of 4", size_of(type_of(XrApplicationInfo.engineVersion)));
    assert(((cast(*void)(*instance.apiVersion)) - cast(*void)(*instance)) == 264, "XrApplicationInfo.apiVersion has unexpected offset % instead of 264", ((cast(*void)(*instance.apiVersion)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrApplicationInfo.apiVersion)) == 8, "XrApplicationInfo.apiVersion has unexpected size % instead of 8", size_of(type_of(XrApplicationInfo.apiVersion)));
    assert(size_of(XrApplicationInfo) == 272, "XrApplicationInfo has size % instead of 272", size_of(XrApplicationInfo));
}

XrInstanceCreateInfo :: struct {
    type:                  XrStructureType;
    next:                  *void;
    createFlags:           XrInstanceCreateFlags;
    applicationInfo:       XrApplicationInfo;
    enabledApiLayerCount:  u32;
    enabledApiLayerNames:  **u8;
    enabledExtensionCount: u32;
    enabledExtensionNames: **u8;
}
#run {
    instance: XrInstanceCreateInfo;
    assert(((cast(*void)(*instance.type)) - cast(*void)(*instance)) == 0, "XrInstanceCreateInfo.type has unexpected offset % instead of 0", ((cast(*void)(*instance.type)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrInstanceCreateInfo.type)) == 4, "XrInstanceCreateInfo.type has unexpected size % instead of 4", size_of(type_of(XrInstanceCreateInfo.type)));
    assert(((cast(*void)(*instance.next)) - cast(*void)(*instance)) == 8, "XrInstanceCreateInfo.next has unexpected offset % instead of 8", ((cast(*void)(*instance.next)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrInstanceCreateInfo.next)) == 8, "XrInstanceCreateInfo.next has unexpected size % instead of 8", size_of(type_of(XrInstanceCreateInfo.next)));
    assert(((cast(*void)(*instance.createFlags)) - cast(*void)(*instance)) == 16, "XrInstanceCreateInfo.createFlags has unexpected offset % instead of 16", ((cast(*void)(*instance.createFlags)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrInstanceCreateInfo.createFlags)) == 8, "XrInstanceCreateInfo.createFlags has unexpected size % instead of 8", size_of(type_of(XrInstanceCreateInfo.createFlags)));
    assert(((cast(*void)(*instance.applicationInfo)) - cast(*void)(*instance)) == 24, "XrInstanceCreateInfo.applicationInfo has unexpected offset % instead of 24", ((cast(*void)(*instance.applicationInfo)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrInstanceCreateInfo.applicationInfo)) == 272, "XrInstanceCreateInfo.applicationInfo has unexpected size % instead of 272", size_of(type_of(XrInstanceCreateInfo.applicationInfo)));
    assert(((cast(*void)(*instance.enabledApiLayerCount)) - cast(*void)(*instance)) == 296, "XrInstanceCreateInfo.enabledApiLayerCount has unexpected offset % instead of 296", ((cast(*void)(*instance.enabledApiLayerCount)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrInstanceCreateInfo.enabledApiLayerCount)) == 4, "XrInstanceCreateInfo.enabledApiLayerCount has unexpected size % instead of 4", size_of(type_of(XrInstanceCreateInfo.enabledApiLayerCount)));
    assert(((cast(*void)(*instance.enabledApiLayerNames)) - cast(*void)(*instance)) == 304, "XrInstanceCreateInfo.enabledApiLayerNames has unexpected offset % instead of 304", ((cast(*void)(*instance.enabledApiLayerNames)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrInstanceCreateInfo.enabledApiLayerNames)) == 8, "XrInstanceCreateInfo.enabledApiLayerNames has unexpected size % instead of 8", size_of(type_of(XrInstanceCreateInfo.enabledApiLayerNames)));
    assert(((cast(*void)(*instance.enabledExtensionCount)) - cast(*void)(*instance)) == 312, "XrInstanceCreateInfo.enabledExtensionCount has unexpected offset % instead of 312", ((cast(*void)(*instance.enabledExtensionCount)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrInstanceCreateInfo.enabledExtensionCount)) == 4, "XrInstanceCreateInfo.enabledExtensionCount has unexpected size % instead of 4", size_of(type_of(XrInstanceCreateInfo.enabledExtensionCount)));
    assert(((cast(*void)(*instance.enabledExtensionNames)) - cast(*void)(*instance)) == 320, "XrInstanceCreateInfo.enabledExtensionNames has unexpected offset % instead of 320", ((cast(*void)(*instance.enabledExtensionNames)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrInstanceCreateInfo.enabledExtensionNames)) == 8, "XrInstanceCreateInfo.enabledExtensionNames has unexpected size % instead of 8", size_of(type_of(XrInstanceCreateInfo.enabledExtensionNames)));
    assert(size_of(XrInstanceCreateInfo) == 328, "XrInstanceCreateInfo has size % instead of 328", size_of(XrInstanceCreateInfo));
}

XrInstanceProperties :: struct {
    type:           XrStructureType;
    next:           *void;
    runtimeVersion: XrVersion;
    runtimeName:    [128] u8;
}
#run {
    instance: XrInstanceProperties;
    assert(((cast(*void)(*instance.type)) - cast(*void)(*instance)) == 0, "XrInstanceProperties.type has unexpected offset % instead of 0", ((cast(*void)(*instance.type)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrInstanceProperties.type)) == 4, "XrInstanceProperties.type has unexpected size % instead of 4", size_of(type_of(XrInstanceProperties.type)));
    assert(((cast(*void)(*instance.next)) - cast(*void)(*instance)) == 8, "XrInstanceProperties.next has unexpected offset % instead of 8", ((cast(*void)(*instance.next)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrInstanceProperties.next)) == 8, "XrInstanceProperties.next has unexpected size % instead of 8", size_of(type_of(XrInstanceProperties.next)));
    assert(((cast(*void)(*instance.runtimeVersion)) - cast(*void)(*instance)) == 16, "XrInstanceProperties.runtimeVersion has unexpected offset % instead of 16", ((cast(*void)(*instance.runtimeVersion)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrInstanceProperties.runtimeVersion)) == 8, "XrInstanceProperties.runtimeVersion has unexpected size % instead of 8", size_of(type_of(XrInstanceProperties.runtimeVersion)));
    assert(((cast(*void)(*instance.runtimeName)) - cast(*void)(*instance)) == 24, "XrInstanceProperties.runtimeName has unexpected offset % instead of 24", ((cast(*void)(*instance.runtimeName)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrInstanceProperties.runtimeName)) == 128, "XrInstanceProperties.runtimeName has unexpected size % instead of 128", size_of(type_of(XrInstanceProperties.runtimeName)));
    assert(size_of(XrInstanceProperties) == 152, "XrInstanceProperties has size % instead of 152", size_of(XrInstanceProperties));
}

XrEventDataBuffer :: struct {
    type:    XrStructureType;
    next:    *void;
    varying: [4000] u8;
}
#run {
    instance: XrEventDataBuffer;
    assert(((cast(*void)(*instance.type)) - cast(*void)(*instance)) == 0, "XrEventDataBuffer.type has unexpected offset % instead of 0", ((cast(*void)(*instance.type)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrEventDataBuffer.type)) == 4, "XrEventDataBuffer.type has unexpected size % instead of 4", size_of(type_of(XrEventDataBuffer.type)));
    assert(((cast(*void)(*instance.next)) - cast(*void)(*instance)) == 8, "XrEventDataBuffer.next has unexpected offset % instead of 8", ((cast(*void)(*instance.next)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrEventDataBuffer.next)) == 8, "XrEventDataBuffer.next has unexpected size % instead of 8", size_of(type_of(XrEventDataBuffer.next)));
    assert(((cast(*void)(*instance.varying)) - cast(*void)(*instance)) == 16, "XrEventDataBuffer.varying has unexpected offset % instead of 16", ((cast(*void)(*instance.varying)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrEventDataBuffer.varying)) == 4000, "XrEventDataBuffer.varying has unexpected size % instead of 4000", size_of(type_of(XrEventDataBuffer.varying)));
    assert(size_of(XrEventDataBuffer) == 4016, "XrEventDataBuffer has size % instead of 4016", size_of(XrEventDataBuffer));
}

XrSystemGetInfo :: struct {
    type:       XrStructureType;
    next:       *void;
    formFactor: XrFormFactor;
}
#run {
    instance: XrSystemGetInfo;
    assert(((cast(*void)(*instance.type)) - cast(*void)(*instance)) == 0, "XrSystemGetInfo.type has unexpected offset % instead of 0", ((cast(*void)(*instance.type)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrSystemGetInfo.type)) == 4, "XrSystemGetInfo.type has unexpected size % instead of 4", size_of(type_of(XrSystemGetInfo.type)));
    assert(((cast(*void)(*instance.next)) - cast(*void)(*instance)) == 8, "XrSystemGetInfo.next has unexpected offset % instead of 8", ((cast(*void)(*instance.next)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrSystemGetInfo.next)) == 8, "XrSystemGetInfo.next has unexpected size % instead of 8", size_of(type_of(XrSystemGetInfo.next)));
    assert(((cast(*void)(*instance.formFactor)) - cast(*void)(*instance)) == 16, "XrSystemGetInfo.formFactor has unexpected offset % instead of 16", ((cast(*void)(*instance.formFactor)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrSystemGetInfo.formFactor)) == 4, "XrSystemGetInfo.formFactor has unexpected size % instead of 4", size_of(type_of(XrSystemGetInfo.formFactor)));
    assert(size_of(XrSystemGetInfo) == 24, "XrSystemGetInfo has size % instead of 24", size_of(XrSystemGetInfo));
}

XrSystemGraphicsProperties :: struct {
    maxSwapchainImageHeight: u32;
    maxSwapchainImageWidth:  u32;
    maxLayerCount:           u32;
}
#run {
    instance: XrSystemGraphicsProperties;
    assert(((cast(*void)(*instance.maxSwapchainImageHeight)) - cast(*void)(*instance)) == 0, "XrSystemGraphicsProperties.maxSwapchainImageHeight has unexpected offset % instead of 0", ((cast(*void)(*instance.maxSwapchainImageHeight)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrSystemGraphicsProperties.maxSwapchainImageHeight)) == 4, "XrSystemGraphicsProperties.maxSwapchainImageHeight has unexpected size % instead of 4", size_of(type_of(XrSystemGraphicsProperties.maxSwapchainImageHeight)));
    assert(((cast(*void)(*instance.maxSwapchainImageWidth)) - cast(*void)(*instance)) == 4, "XrSystemGraphicsProperties.maxSwapchainImageWidth has unexpected offset % instead of 4", ((cast(*void)(*instance.maxSwapchainImageWidth)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrSystemGraphicsProperties.maxSwapchainImageWidth)) == 4, "XrSystemGraphicsProperties.maxSwapchainImageWidth has unexpected size % instead of 4", size_of(type_of(XrSystemGraphicsProperties.maxSwapchainImageWidth)));
    assert(((cast(*void)(*instance.maxLayerCount)) - cast(*void)(*instance)) == 8, "XrSystemGraphicsProperties.maxLayerCount has unexpected offset % instead of 8", ((cast(*void)(*instance.maxLayerCount)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrSystemGraphicsProperties.maxLayerCount)) == 4, "XrSystemGraphicsProperties.maxLayerCount has unexpected size % instead of 4", size_of(type_of(XrSystemGraphicsProperties.maxLayerCount)));
    assert(size_of(XrSystemGraphicsProperties) == 12, "XrSystemGraphicsProperties has size % instead of 12", size_of(XrSystemGraphicsProperties));
}

XrSystemTrackingProperties :: struct {
    orientationTracking: XrBool32;
    positionTracking:    XrBool32;
}
#run {
    instance: XrSystemTrackingProperties;
    assert(((cast(*void)(*instance.orientationTracking)) - cast(*void)(*instance)) == 0, "XrSystemTrackingProperties.orientationTracking has unexpected offset % instead of 0", ((cast(*void)(*instance.orientationTracking)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrSystemTrackingProperties.orientationTracking)) == 4, "XrSystemTrackingProperties.orientationTracking has unexpected size % instead of 4", size_of(type_of(XrSystemTrackingProperties.orientationTracking)));
    assert(((cast(*void)(*instance.positionTracking)) - cast(*void)(*instance)) == 4, "XrSystemTrackingProperties.positionTracking has unexpected offset % instead of 4", ((cast(*void)(*instance.positionTracking)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrSystemTrackingProperties.positionTracking)) == 4, "XrSystemTrackingProperties.positionTracking has unexpected size % instead of 4", size_of(type_of(XrSystemTrackingProperties.positionTracking)));
    assert(size_of(XrSystemTrackingProperties) == 8, "XrSystemTrackingProperties has size % instead of 8", size_of(XrSystemTrackingProperties));
}

XrSystemProperties :: struct {
    type:               XrStructureType;
    next:               *void;
    systemId:           XrSystemId;
    vendorId:           u32;
    systemName:         [256] u8;
    graphicsProperties: XrSystemGraphicsProperties;
    trackingProperties: XrSystemTrackingProperties;
}
#run {
    instance: XrSystemProperties;
    assert(((cast(*void)(*instance.type)) - cast(*void)(*instance)) == 0, "XrSystemProperties.type has unexpected offset % instead of 0", ((cast(*void)(*instance.type)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrSystemProperties.type)) == 4, "XrSystemProperties.type has unexpected size % instead of 4", size_of(type_of(XrSystemProperties.type)));
    assert(((cast(*void)(*instance.next)) - cast(*void)(*instance)) == 8, "XrSystemProperties.next has unexpected offset % instead of 8", ((cast(*void)(*instance.next)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrSystemProperties.next)) == 8, "XrSystemProperties.next has unexpected size % instead of 8", size_of(type_of(XrSystemProperties.next)));
    assert(((cast(*void)(*instance.systemId)) - cast(*void)(*instance)) == 16, "XrSystemProperties.systemId has unexpected offset % instead of 16", ((cast(*void)(*instance.systemId)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrSystemProperties.systemId)) == 8, "XrSystemProperties.systemId has unexpected size % instead of 8", size_of(type_of(XrSystemProperties.systemId)));
    assert(((cast(*void)(*instance.vendorId)) - cast(*void)(*instance)) == 24, "XrSystemProperties.vendorId has unexpected offset % instead of 24", ((cast(*void)(*instance.vendorId)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrSystemProperties.vendorId)) == 4, "XrSystemProperties.vendorId has unexpected size % instead of 4", size_of(type_of(XrSystemProperties.vendorId)));
    assert(((cast(*void)(*instance.systemName)) - cast(*void)(*instance)) == 28, "XrSystemProperties.systemName has unexpected offset % instead of 28", ((cast(*void)(*instance.systemName)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrSystemProperties.systemName)) == 256, "XrSystemProperties.systemName has unexpected size % instead of 256", size_of(type_of(XrSystemProperties.systemName)));
    assert(((cast(*void)(*instance.graphicsProperties)) - cast(*void)(*instance)) == 284, "XrSystemProperties.graphicsProperties has unexpected offset % instead of 284", ((cast(*void)(*instance.graphicsProperties)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrSystemProperties.graphicsProperties)) == 12, "XrSystemProperties.graphicsProperties has unexpected size % instead of 12", size_of(type_of(XrSystemProperties.graphicsProperties)));
    assert(((cast(*void)(*instance.trackingProperties)) - cast(*void)(*instance)) == 296, "XrSystemProperties.trackingProperties has unexpected offset % instead of 296", ((cast(*void)(*instance.trackingProperties)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrSystemProperties.trackingProperties)) == 8, "XrSystemProperties.trackingProperties has unexpected size % instead of 8", size_of(type_of(XrSystemProperties.trackingProperties)));
    assert(size_of(XrSystemProperties) == 304, "XrSystemProperties has size % instead of 304", size_of(XrSystemProperties));
}

XrSessionCreateInfo :: struct {
    type:        XrStructureType;
    next:        *void;
    createFlags: XrSessionCreateFlags;
    systemId:    XrSystemId;
}
#run {
    instance: XrSessionCreateInfo;
    assert(((cast(*void)(*instance.type)) - cast(*void)(*instance)) == 0, "XrSessionCreateInfo.type has unexpected offset % instead of 0", ((cast(*void)(*instance.type)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrSessionCreateInfo.type)) == 4, "XrSessionCreateInfo.type has unexpected size % instead of 4", size_of(type_of(XrSessionCreateInfo.type)));
    assert(((cast(*void)(*instance.next)) - cast(*void)(*instance)) == 8, "XrSessionCreateInfo.next has unexpected offset % instead of 8", ((cast(*void)(*instance.next)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrSessionCreateInfo.next)) == 8, "XrSessionCreateInfo.next has unexpected size % instead of 8", size_of(type_of(XrSessionCreateInfo.next)));
    assert(((cast(*void)(*instance.createFlags)) - cast(*void)(*instance)) == 16, "XrSessionCreateInfo.createFlags has unexpected offset % instead of 16", ((cast(*void)(*instance.createFlags)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrSessionCreateInfo.createFlags)) == 8, "XrSessionCreateInfo.createFlags has unexpected size % instead of 8", size_of(type_of(XrSessionCreateInfo.createFlags)));
    assert(((cast(*void)(*instance.systemId)) - cast(*void)(*instance)) == 24, "XrSessionCreateInfo.systemId has unexpected offset % instead of 24", ((cast(*void)(*instance.systemId)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrSessionCreateInfo.systemId)) == 8, "XrSessionCreateInfo.systemId has unexpected size % instead of 8", size_of(type_of(XrSessionCreateInfo.systemId)));
    assert(size_of(XrSessionCreateInfo) == 32, "XrSessionCreateInfo has size % instead of 32", size_of(XrSessionCreateInfo));
}

XrVector3f :: struct {
    x: float;
    y: float;
    z: float;
}
#run {
    instance: XrVector3f;
    assert(((cast(*void)(*instance.x)) - cast(*void)(*instance)) == 0, "XrVector3f.x has unexpected offset % instead of 0", ((cast(*void)(*instance.x)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrVector3f.x)) == 4, "XrVector3f.x has unexpected size % instead of 4", size_of(type_of(XrVector3f.x)));
    assert(((cast(*void)(*instance.y)) - cast(*void)(*instance)) == 4, "XrVector3f.y has unexpected offset % instead of 4", ((cast(*void)(*instance.y)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrVector3f.y)) == 4, "XrVector3f.y has unexpected size % instead of 4", size_of(type_of(XrVector3f.y)));
    assert(((cast(*void)(*instance.z)) - cast(*void)(*instance)) == 8, "XrVector3f.z has unexpected offset % instead of 8", ((cast(*void)(*instance.z)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrVector3f.z)) == 4, "XrVector3f.z has unexpected size % instead of 4", size_of(type_of(XrVector3f.z)));
    assert(size_of(XrVector3f) == 12, "XrVector3f has size % instead of 12", size_of(XrVector3f));
}

// XrSpaceVelocity extends XrSpaceLocation
XrSpaceVelocity :: struct {
    type:            XrStructureType;
    next:            *void;
    velocityFlags:   XrSpaceVelocityFlags;
    linearVelocity:  XrVector3f;
    angularVelocity: XrVector3f;
}
#run {
    instance: XrSpaceVelocity;
    assert(((cast(*void)(*instance.type)) - cast(*void)(*instance)) == 0, "XrSpaceVelocity.type has unexpected offset % instead of 0", ((cast(*void)(*instance.type)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrSpaceVelocity.type)) == 4, "XrSpaceVelocity.type has unexpected size % instead of 4", size_of(type_of(XrSpaceVelocity.type)));
    assert(((cast(*void)(*instance.next)) - cast(*void)(*instance)) == 8, "XrSpaceVelocity.next has unexpected offset % instead of 8", ((cast(*void)(*instance.next)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrSpaceVelocity.next)) == 8, "XrSpaceVelocity.next has unexpected size % instead of 8", size_of(type_of(XrSpaceVelocity.next)));
    assert(((cast(*void)(*instance.velocityFlags)) - cast(*void)(*instance)) == 16, "XrSpaceVelocity.velocityFlags has unexpected offset % instead of 16", ((cast(*void)(*instance.velocityFlags)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrSpaceVelocity.velocityFlags)) == 8, "XrSpaceVelocity.velocityFlags has unexpected size % instead of 8", size_of(type_of(XrSpaceVelocity.velocityFlags)));
    assert(((cast(*void)(*instance.linearVelocity)) - cast(*void)(*instance)) == 24, "XrSpaceVelocity.linearVelocity has unexpected offset % instead of 24", ((cast(*void)(*instance.linearVelocity)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrSpaceVelocity.linearVelocity)) == 12, "XrSpaceVelocity.linearVelocity has unexpected size % instead of 12", size_of(type_of(XrSpaceVelocity.linearVelocity)));
    assert(((cast(*void)(*instance.angularVelocity)) - cast(*void)(*instance)) == 36, "XrSpaceVelocity.angularVelocity has unexpected offset % instead of 36", ((cast(*void)(*instance.angularVelocity)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrSpaceVelocity.angularVelocity)) == 12, "XrSpaceVelocity.angularVelocity has unexpected size % instead of 12", size_of(type_of(XrSpaceVelocity.angularVelocity)));
    assert(size_of(XrSpaceVelocity) == 48, "XrSpaceVelocity has size % instead of 48", size_of(XrSpaceVelocity));
}

XrQuaternionf :: struct {
    x: float;
    y: float;
    z: float;
    w: float;
}
#run {
    instance: XrQuaternionf;
    assert(((cast(*void)(*instance.x)) - cast(*void)(*instance)) == 0, "XrQuaternionf.x has unexpected offset % instead of 0", ((cast(*void)(*instance.x)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrQuaternionf.x)) == 4, "XrQuaternionf.x has unexpected size % instead of 4", size_of(type_of(XrQuaternionf.x)));
    assert(((cast(*void)(*instance.y)) - cast(*void)(*instance)) == 4, "XrQuaternionf.y has unexpected offset % instead of 4", ((cast(*void)(*instance.y)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrQuaternionf.y)) == 4, "XrQuaternionf.y has unexpected size % instead of 4", size_of(type_of(XrQuaternionf.y)));
    assert(((cast(*void)(*instance.z)) - cast(*void)(*instance)) == 8, "XrQuaternionf.z has unexpected offset % instead of 8", ((cast(*void)(*instance.z)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrQuaternionf.z)) == 4, "XrQuaternionf.z has unexpected size % instead of 4", size_of(type_of(XrQuaternionf.z)));
    assert(((cast(*void)(*instance.w)) - cast(*void)(*instance)) == 12, "XrQuaternionf.w has unexpected offset % instead of 12", ((cast(*void)(*instance.w)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrQuaternionf.w)) == 4, "XrQuaternionf.w has unexpected size % instead of 4", size_of(type_of(XrQuaternionf.w)));
    assert(size_of(XrQuaternionf) == 16, "XrQuaternionf has size % instead of 16", size_of(XrQuaternionf));
}

XrPosef :: struct {
    orientation: XrQuaternionf;
    position:    XrVector3f;
}
#run {
    instance: XrPosef;
    assert(((cast(*void)(*instance.orientation)) - cast(*void)(*instance)) == 0, "XrPosef.orientation has unexpected offset % instead of 0", ((cast(*void)(*instance.orientation)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrPosef.orientation)) == 16, "XrPosef.orientation has unexpected size % instead of 16", size_of(type_of(XrPosef.orientation)));
    assert(((cast(*void)(*instance.position)) - cast(*void)(*instance)) == 16, "XrPosef.position has unexpected offset % instead of 16", ((cast(*void)(*instance.position)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrPosef.position)) == 12, "XrPosef.position has unexpected size % instead of 12", size_of(type_of(XrPosef.position)));
    assert(size_of(XrPosef) == 28, "XrPosef has size % instead of 28", size_of(XrPosef));
}

XrReferenceSpaceCreateInfo :: struct {
    type:                 XrStructureType;
    next:                 *void;
    referenceSpaceType:   XrReferenceSpaceType;
    poseInReferenceSpace: XrPosef;
}
#run {
    instance: XrReferenceSpaceCreateInfo;
    assert(((cast(*void)(*instance.type)) - cast(*void)(*instance)) == 0, "XrReferenceSpaceCreateInfo.type has unexpected offset % instead of 0", ((cast(*void)(*instance.type)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrReferenceSpaceCreateInfo.type)) == 4, "XrReferenceSpaceCreateInfo.type has unexpected size % instead of 4", size_of(type_of(XrReferenceSpaceCreateInfo.type)));
    assert(((cast(*void)(*instance.next)) - cast(*void)(*instance)) == 8, "XrReferenceSpaceCreateInfo.next has unexpected offset % instead of 8", ((cast(*void)(*instance.next)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrReferenceSpaceCreateInfo.next)) == 8, "XrReferenceSpaceCreateInfo.next has unexpected size % instead of 8", size_of(type_of(XrReferenceSpaceCreateInfo.next)));
    assert(((cast(*void)(*instance.referenceSpaceType)) - cast(*void)(*instance)) == 16, "XrReferenceSpaceCreateInfo.referenceSpaceType has unexpected offset % instead of 16", ((cast(*void)(*instance.referenceSpaceType)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrReferenceSpaceCreateInfo.referenceSpaceType)) == 4, "XrReferenceSpaceCreateInfo.referenceSpaceType has unexpected size % instead of 4", size_of(type_of(XrReferenceSpaceCreateInfo.referenceSpaceType)));
    assert(((cast(*void)(*instance.poseInReferenceSpace)) - cast(*void)(*instance)) == 20, "XrReferenceSpaceCreateInfo.poseInReferenceSpace has unexpected offset % instead of 20", ((cast(*void)(*instance.poseInReferenceSpace)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrReferenceSpaceCreateInfo.poseInReferenceSpace)) == 28, "XrReferenceSpaceCreateInfo.poseInReferenceSpace has unexpected size % instead of 28", size_of(type_of(XrReferenceSpaceCreateInfo.poseInReferenceSpace)));
    assert(size_of(XrReferenceSpaceCreateInfo) == 48, "XrReferenceSpaceCreateInfo has size % instead of 48", size_of(XrReferenceSpaceCreateInfo));
}

XrExtent2Df :: struct {
    width:  float;
    height: float;
}
#run {
    instance: XrExtent2Df;
    assert(((cast(*void)(*instance.width)) - cast(*void)(*instance)) == 0, "XrExtent2Df.width has unexpected offset % instead of 0", ((cast(*void)(*instance.width)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrExtent2Df.width)) == 4, "XrExtent2Df.width has unexpected size % instead of 4", size_of(type_of(XrExtent2Df.width)));
    assert(((cast(*void)(*instance.height)) - cast(*void)(*instance)) == 4, "XrExtent2Df.height has unexpected offset % instead of 4", ((cast(*void)(*instance.height)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrExtent2Df.height)) == 4, "XrExtent2Df.height has unexpected size % instead of 4", size_of(type_of(XrExtent2Df.height)));
    assert(size_of(XrExtent2Df) == 8, "XrExtent2Df has size % instead of 8", size_of(XrExtent2Df));
}

XrActionSpaceCreateInfo :: struct {
    type:              XrStructureType;
    next:              *void;
    action:            XrAction;
    subactionPath:     XrPath;
    poseInActionSpace: XrPosef;
}
#run {
    instance: XrActionSpaceCreateInfo;
    assert(((cast(*void)(*instance.type)) - cast(*void)(*instance)) == 0, "XrActionSpaceCreateInfo.type has unexpected offset % instead of 0", ((cast(*void)(*instance.type)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrActionSpaceCreateInfo.type)) == 4, "XrActionSpaceCreateInfo.type has unexpected size % instead of 4", size_of(type_of(XrActionSpaceCreateInfo.type)));
    assert(((cast(*void)(*instance.next)) - cast(*void)(*instance)) == 8, "XrActionSpaceCreateInfo.next has unexpected offset % instead of 8", ((cast(*void)(*instance.next)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrActionSpaceCreateInfo.next)) == 8, "XrActionSpaceCreateInfo.next has unexpected size % instead of 8", size_of(type_of(XrActionSpaceCreateInfo.next)));
    assert(((cast(*void)(*instance.action)) - cast(*void)(*instance)) == 16, "XrActionSpaceCreateInfo.action has unexpected offset % instead of 16", ((cast(*void)(*instance.action)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrActionSpaceCreateInfo.action)) == 8, "XrActionSpaceCreateInfo.action has unexpected size % instead of 8", size_of(type_of(XrActionSpaceCreateInfo.action)));
    assert(((cast(*void)(*instance.subactionPath)) - cast(*void)(*instance)) == 24, "XrActionSpaceCreateInfo.subactionPath has unexpected offset % instead of 24", ((cast(*void)(*instance.subactionPath)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrActionSpaceCreateInfo.subactionPath)) == 8, "XrActionSpaceCreateInfo.subactionPath has unexpected size % instead of 8", size_of(type_of(XrActionSpaceCreateInfo.subactionPath)));
    assert(((cast(*void)(*instance.poseInActionSpace)) - cast(*void)(*instance)) == 32, "XrActionSpaceCreateInfo.poseInActionSpace has unexpected offset % instead of 32", ((cast(*void)(*instance.poseInActionSpace)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrActionSpaceCreateInfo.poseInActionSpace)) == 28, "XrActionSpaceCreateInfo.poseInActionSpace has unexpected size % instead of 28", size_of(type_of(XrActionSpaceCreateInfo.poseInActionSpace)));
    assert(size_of(XrActionSpaceCreateInfo) == 64, "XrActionSpaceCreateInfo has size % instead of 64", size_of(XrActionSpaceCreateInfo));
}

XrSpaceLocation :: struct {
    type:          XrStructureType;
    next:          *void;
    locationFlags: XrSpaceLocationFlags;
    pose:          XrPosef;
}
#run {
    instance: XrSpaceLocation;
    assert(((cast(*void)(*instance.type)) - cast(*void)(*instance)) == 0, "XrSpaceLocation.type has unexpected offset % instead of 0", ((cast(*void)(*instance.type)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrSpaceLocation.type)) == 4, "XrSpaceLocation.type has unexpected size % instead of 4", size_of(type_of(XrSpaceLocation.type)));
    assert(((cast(*void)(*instance.next)) - cast(*void)(*instance)) == 8, "XrSpaceLocation.next has unexpected offset % instead of 8", ((cast(*void)(*instance.next)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrSpaceLocation.next)) == 8, "XrSpaceLocation.next has unexpected size % instead of 8", size_of(type_of(XrSpaceLocation.next)));
    assert(((cast(*void)(*instance.locationFlags)) - cast(*void)(*instance)) == 16, "XrSpaceLocation.locationFlags has unexpected offset % instead of 16", ((cast(*void)(*instance.locationFlags)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrSpaceLocation.locationFlags)) == 8, "XrSpaceLocation.locationFlags has unexpected size % instead of 8", size_of(type_of(XrSpaceLocation.locationFlags)));
    assert(((cast(*void)(*instance.pose)) - cast(*void)(*instance)) == 24, "XrSpaceLocation.pose has unexpected offset % instead of 24", ((cast(*void)(*instance.pose)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrSpaceLocation.pose)) == 28, "XrSpaceLocation.pose has unexpected size % instead of 28", size_of(type_of(XrSpaceLocation.pose)));
    assert(size_of(XrSpaceLocation) == 56, "XrSpaceLocation has size % instead of 56", size_of(XrSpaceLocation));
}

XrViewConfigurationProperties :: struct {
    type:                  XrStructureType;
    next:                  *void;
    viewConfigurationType: XrViewConfigurationType;
    fovMutable:            XrBool32;
}
#run {
    instance: XrViewConfigurationProperties;
    assert(((cast(*void)(*instance.type)) - cast(*void)(*instance)) == 0, "XrViewConfigurationProperties.type has unexpected offset % instead of 0", ((cast(*void)(*instance.type)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrViewConfigurationProperties.type)) == 4, "XrViewConfigurationProperties.type has unexpected size % instead of 4", size_of(type_of(XrViewConfigurationProperties.type)));
    assert(((cast(*void)(*instance.next)) - cast(*void)(*instance)) == 8, "XrViewConfigurationProperties.next has unexpected offset % instead of 8", ((cast(*void)(*instance.next)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrViewConfigurationProperties.next)) == 8, "XrViewConfigurationProperties.next has unexpected size % instead of 8", size_of(type_of(XrViewConfigurationProperties.next)));
    assert(((cast(*void)(*instance.viewConfigurationType)) - cast(*void)(*instance)) == 16, "XrViewConfigurationProperties.viewConfigurationType has unexpected offset % instead of 16", ((cast(*void)(*instance.viewConfigurationType)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrViewConfigurationProperties.viewConfigurationType)) == 4, "XrViewConfigurationProperties.viewConfigurationType has unexpected size % instead of 4", size_of(type_of(XrViewConfigurationProperties.viewConfigurationType)));
    assert(((cast(*void)(*instance.fovMutable)) - cast(*void)(*instance)) == 20, "XrViewConfigurationProperties.fovMutable has unexpected offset % instead of 20", ((cast(*void)(*instance.fovMutable)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrViewConfigurationProperties.fovMutable)) == 4, "XrViewConfigurationProperties.fovMutable has unexpected size % instead of 4", size_of(type_of(XrViewConfigurationProperties.fovMutable)));
    assert(size_of(XrViewConfigurationProperties) == 24, "XrViewConfigurationProperties has size % instead of 24", size_of(XrViewConfigurationProperties));
}

XrViewConfigurationView :: struct {
    type:                            XrStructureType;
    next:                            *void;
    recommendedImageRectWidth:       u32;
    maxImageRectWidth:               u32;
    recommendedImageRectHeight:      u32;
    maxImageRectHeight:              u32;
    recommendedSwapchainSampleCount: u32;
    maxSwapchainSampleCount:         u32;
}
#run {
    instance: XrViewConfigurationView;
    assert(((cast(*void)(*instance.type)) - cast(*void)(*instance)) == 0, "XrViewConfigurationView.type has unexpected offset % instead of 0", ((cast(*void)(*instance.type)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrViewConfigurationView.type)) == 4, "XrViewConfigurationView.type has unexpected size % instead of 4", size_of(type_of(XrViewConfigurationView.type)));
    assert(((cast(*void)(*instance.next)) - cast(*void)(*instance)) == 8, "XrViewConfigurationView.next has unexpected offset % instead of 8", ((cast(*void)(*instance.next)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrViewConfigurationView.next)) == 8, "XrViewConfigurationView.next has unexpected size % instead of 8", size_of(type_of(XrViewConfigurationView.next)));
    assert(((cast(*void)(*instance.recommendedImageRectWidth)) - cast(*void)(*instance)) == 16, "XrViewConfigurationView.recommendedImageRectWidth has unexpected offset % instead of 16", ((cast(*void)(*instance.recommendedImageRectWidth)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrViewConfigurationView.recommendedImageRectWidth)) == 4, "XrViewConfigurationView.recommendedImageRectWidth has unexpected size % instead of 4", size_of(type_of(XrViewConfigurationView.recommendedImageRectWidth)));
    assert(((cast(*void)(*instance.maxImageRectWidth)) - cast(*void)(*instance)) == 20, "XrViewConfigurationView.maxImageRectWidth has unexpected offset % instead of 20", ((cast(*void)(*instance.maxImageRectWidth)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrViewConfigurationView.maxImageRectWidth)) == 4, "XrViewConfigurationView.maxImageRectWidth has unexpected size % instead of 4", size_of(type_of(XrViewConfigurationView.maxImageRectWidth)));
    assert(((cast(*void)(*instance.recommendedImageRectHeight)) - cast(*void)(*instance)) == 24, "XrViewConfigurationView.recommendedImageRectHeight has unexpected offset % instead of 24", ((cast(*void)(*instance.recommendedImageRectHeight)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrViewConfigurationView.recommendedImageRectHeight)) == 4, "XrViewConfigurationView.recommendedImageRectHeight has unexpected size % instead of 4", size_of(type_of(XrViewConfigurationView.recommendedImageRectHeight)));
    assert(((cast(*void)(*instance.maxImageRectHeight)) - cast(*void)(*instance)) == 28, "XrViewConfigurationView.maxImageRectHeight has unexpected offset % instead of 28", ((cast(*void)(*instance.maxImageRectHeight)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrViewConfigurationView.maxImageRectHeight)) == 4, "XrViewConfigurationView.maxImageRectHeight has unexpected size % instead of 4", size_of(type_of(XrViewConfigurationView.maxImageRectHeight)));
    assert(((cast(*void)(*instance.recommendedSwapchainSampleCount)) - cast(*void)(*instance)) == 32, "XrViewConfigurationView.recommendedSwapchainSampleCount has unexpected offset % instead of 32", ((cast(*void)(*instance.recommendedSwapchainSampleCount)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrViewConfigurationView.recommendedSwapchainSampleCount)) == 4, "XrViewConfigurationView.recommendedSwapchainSampleCount has unexpected size % instead of 4", size_of(type_of(XrViewConfigurationView.recommendedSwapchainSampleCount)));
    assert(((cast(*void)(*instance.maxSwapchainSampleCount)) - cast(*void)(*instance)) == 36, "XrViewConfigurationView.maxSwapchainSampleCount has unexpected offset % instead of 36", ((cast(*void)(*instance.maxSwapchainSampleCount)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrViewConfigurationView.maxSwapchainSampleCount)) == 4, "XrViewConfigurationView.maxSwapchainSampleCount has unexpected size % instead of 4", size_of(type_of(XrViewConfigurationView.maxSwapchainSampleCount)));
    assert(size_of(XrViewConfigurationView) == 40, "XrViewConfigurationView has size % instead of 40", size_of(XrViewConfigurationView));
}

XrSwapchainCreateInfo :: struct {
    type:        XrStructureType;
    next:        *void;
    createFlags: XrSwapchainCreateFlags;
    usageFlags:  XrSwapchainUsageFlags;
    format:      s64;
    sampleCount: u32;
    width:       u32;
    height:      u32;
    faceCount:   u32;
    arraySize:   u32;
    mipCount:    u32;
}
#run {
    instance: XrSwapchainCreateInfo;
    assert(((cast(*void)(*instance.type)) - cast(*void)(*instance)) == 0, "XrSwapchainCreateInfo.type has unexpected offset % instead of 0", ((cast(*void)(*instance.type)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrSwapchainCreateInfo.type)) == 4, "XrSwapchainCreateInfo.type has unexpected size % instead of 4", size_of(type_of(XrSwapchainCreateInfo.type)));
    assert(((cast(*void)(*instance.next)) - cast(*void)(*instance)) == 8, "XrSwapchainCreateInfo.next has unexpected offset % instead of 8", ((cast(*void)(*instance.next)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrSwapchainCreateInfo.next)) == 8, "XrSwapchainCreateInfo.next has unexpected size % instead of 8", size_of(type_of(XrSwapchainCreateInfo.next)));
    assert(((cast(*void)(*instance.createFlags)) - cast(*void)(*instance)) == 16, "XrSwapchainCreateInfo.createFlags has unexpected offset % instead of 16", ((cast(*void)(*instance.createFlags)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrSwapchainCreateInfo.createFlags)) == 8, "XrSwapchainCreateInfo.createFlags has unexpected size % instead of 8", size_of(type_of(XrSwapchainCreateInfo.createFlags)));
    assert(((cast(*void)(*instance.usageFlags)) - cast(*void)(*instance)) == 24, "XrSwapchainCreateInfo.usageFlags has unexpected offset % instead of 24", ((cast(*void)(*instance.usageFlags)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrSwapchainCreateInfo.usageFlags)) == 8, "XrSwapchainCreateInfo.usageFlags has unexpected size % instead of 8", size_of(type_of(XrSwapchainCreateInfo.usageFlags)));
    assert(((cast(*void)(*instance.format)) - cast(*void)(*instance)) == 32, "XrSwapchainCreateInfo.format has unexpected offset % instead of 32", ((cast(*void)(*instance.format)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrSwapchainCreateInfo.format)) == 8, "XrSwapchainCreateInfo.format has unexpected size % instead of 8", size_of(type_of(XrSwapchainCreateInfo.format)));
    assert(((cast(*void)(*instance.sampleCount)) - cast(*void)(*instance)) == 40, "XrSwapchainCreateInfo.sampleCount has unexpected offset % instead of 40", ((cast(*void)(*instance.sampleCount)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrSwapchainCreateInfo.sampleCount)) == 4, "XrSwapchainCreateInfo.sampleCount has unexpected size % instead of 4", size_of(type_of(XrSwapchainCreateInfo.sampleCount)));
    assert(((cast(*void)(*instance.width)) - cast(*void)(*instance)) == 44, "XrSwapchainCreateInfo.width has unexpected offset % instead of 44", ((cast(*void)(*instance.width)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrSwapchainCreateInfo.width)) == 4, "XrSwapchainCreateInfo.width has unexpected size % instead of 4", size_of(type_of(XrSwapchainCreateInfo.width)));
    assert(((cast(*void)(*instance.height)) - cast(*void)(*instance)) == 48, "XrSwapchainCreateInfo.height has unexpected offset % instead of 48", ((cast(*void)(*instance.height)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrSwapchainCreateInfo.height)) == 4, "XrSwapchainCreateInfo.height has unexpected size % instead of 4", size_of(type_of(XrSwapchainCreateInfo.height)));
    assert(((cast(*void)(*instance.faceCount)) - cast(*void)(*instance)) == 52, "XrSwapchainCreateInfo.faceCount has unexpected offset % instead of 52", ((cast(*void)(*instance.faceCount)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrSwapchainCreateInfo.faceCount)) == 4, "XrSwapchainCreateInfo.faceCount has unexpected size % instead of 4", size_of(type_of(XrSwapchainCreateInfo.faceCount)));
    assert(((cast(*void)(*instance.arraySize)) - cast(*void)(*instance)) == 56, "XrSwapchainCreateInfo.arraySize has unexpected offset % instead of 56", ((cast(*void)(*instance.arraySize)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrSwapchainCreateInfo.arraySize)) == 4, "XrSwapchainCreateInfo.arraySize has unexpected size % instead of 4", size_of(type_of(XrSwapchainCreateInfo.arraySize)));
    assert(((cast(*void)(*instance.mipCount)) - cast(*void)(*instance)) == 60, "XrSwapchainCreateInfo.mipCount has unexpected offset % instead of 60", ((cast(*void)(*instance.mipCount)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrSwapchainCreateInfo.mipCount)) == 4, "XrSwapchainCreateInfo.mipCount has unexpected size % instead of 4", size_of(type_of(XrSwapchainCreateInfo.mipCount)));
    assert(size_of(XrSwapchainCreateInfo) == 64, "XrSwapchainCreateInfo has size % instead of 64", size_of(XrSwapchainCreateInfo));
}

XrSwapchainImageBaseHeader :: struct {
    type: XrStructureType;
    next: *void;
}
#run {
    instance: XrSwapchainImageBaseHeader;
    assert(((cast(*void)(*instance.type)) - cast(*void)(*instance)) == 0, "XrSwapchainImageBaseHeader.type has unexpected offset % instead of 0", ((cast(*void)(*instance.type)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrSwapchainImageBaseHeader.type)) == 4, "XrSwapchainImageBaseHeader.type has unexpected size % instead of 4", size_of(type_of(XrSwapchainImageBaseHeader.type)));
    assert(((cast(*void)(*instance.next)) - cast(*void)(*instance)) == 8, "XrSwapchainImageBaseHeader.next has unexpected offset % instead of 8", ((cast(*void)(*instance.next)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrSwapchainImageBaseHeader.next)) == 8, "XrSwapchainImageBaseHeader.next has unexpected size % instead of 8", size_of(type_of(XrSwapchainImageBaseHeader.next)));
    assert(size_of(XrSwapchainImageBaseHeader) == 16, "XrSwapchainImageBaseHeader has size % instead of 16", size_of(XrSwapchainImageBaseHeader));
}

XrSwapchainImageAcquireInfo :: struct {
    type: XrStructureType;
    next: *void;
}
#run {
    instance: XrSwapchainImageAcquireInfo;
    assert(((cast(*void)(*instance.type)) - cast(*void)(*instance)) == 0, "XrSwapchainImageAcquireInfo.type has unexpected offset % instead of 0", ((cast(*void)(*instance.type)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrSwapchainImageAcquireInfo.type)) == 4, "XrSwapchainImageAcquireInfo.type has unexpected size % instead of 4", size_of(type_of(XrSwapchainImageAcquireInfo.type)));
    assert(((cast(*void)(*instance.next)) - cast(*void)(*instance)) == 8, "XrSwapchainImageAcquireInfo.next has unexpected offset % instead of 8", ((cast(*void)(*instance.next)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrSwapchainImageAcquireInfo.next)) == 8, "XrSwapchainImageAcquireInfo.next has unexpected size % instead of 8", size_of(type_of(XrSwapchainImageAcquireInfo.next)));
    assert(size_of(XrSwapchainImageAcquireInfo) == 16, "XrSwapchainImageAcquireInfo has size % instead of 16", size_of(XrSwapchainImageAcquireInfo));
}

XrSwapchainImageWaitInfo :: struct {
    type:    XrStructureType;
    next:    *void;
    timeout: XrDuration;
}
#run {
    instance: XrSwapchainImageWaitInfo;
    assert(((cast(*void)(*instance.type)) - cast(*void)(*instance)) == 0, "XrSwapchainImageWaitInfo.type has unexpected offset % instead of 0", ((cast(*void)(*instance.type)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrSwapchainImageWaitInfo.type)) == 4, "XrSwapchainImageWaitInfo.type has unexpected size % instead of 4", size_of(type_of(XrSwapchainImageWaitInfo.type)));
    assert(((cast(*void)(*instance.next)) - cast(*void)(*instance)) == 8, "XrSwapchainImageWaitInfo.next has unexpected offset % instead of 8", ((cast(*void)(*instance.next)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrSwapchainImageWaitInfo.next)) == 8, "XrSwapchainImageWaitInfo.next has unexpected size % instead of 8", size_of(type_of(XrSwapchainImageWaitInfo.next)));
    assert(((cast(*void)(*instance.timeout)) - cast(*void)(*instance)) == 16, "XrSwapchainImageWaitInfo.timeout has unexpected offset % instead of 16", ((cast(*void)(*instance.timeout)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrSwapchainImageWaitInfo.timeout)) == 8, "XrSwapchainImageWaitInfo.timeout has unexpected size % instead of 8", size_of(type_of(XrSwapchainImageWaitInfo.timeout)));
    assert(size_of(XrSwapchainImageWaitInfo) == 24, "XrSwapchainImageWaitInfo has size % instead of 24", size_of(XrSwapchainImageWaitInfo));
}

XrSwapchainImageReleaseInfo :: struct {
    type: XrStructureType;
    next: *void;
}
#run {
    instance: XrSwapchainImageReleaseInfo;
    assert(((cast(*void)(*instance.type)) - cast(*void)(*instance)) == 0, "XrSwapchainImageReleaseInfo.type has unexpected offset % instead of 0", ((cast(*void)(*instance.type)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrSwapchainImageReleaseInfo.type)) == 4, "XrSwapchainImageReleaseInfo.type has unexpected size % instead of 4", size_of(type_of(XrSwapchainImageReleaseInfo.type)));
    assert(((cast(*void)(*instance.next)) - cast(*void)(*instance)) == 8, "XrSwapchainImageReleaseInfo.next has unexpected offset % instead of 8", ((cast(*void)(*instance.next)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrSwapchainImageReleaseInfo.next)) == 8, "XrSwapchainImageReleaseInfo.next has unexpected size % instead of 8", size_of(type_of(XrSwapchainImageReleaseInfo.next)));
    assert(size_of(XrSwapchainImageReleaseInfo) == 16, "XrSwapchainImageReleaseInfo has size % instead of 16", size_of(XrSwapchainImageReleaseInfo));
}

XrSessionBeginInfo :: struct {
    type:                         XrStructureType;
    next:                         *void;
    primaryViewConfigurationType: XrViewConfigurationType;
}
#run {
    instance: XrSessionBeginInfo;
    assert(((cast(*void)(*instance.type)) - cast(*void)(*instance)) == 0, "XrSessionBeginInfo.type has unexpected offset % instead of 0", ((cast(*void)(*instance.type)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrSessionBeginInfo.type)) == 4, "XrSessionBeginInfo.type has unexpected size % instead of 4", size_of(type_of(XrSessionBeginInfo.type)));
    assert(((cast(*void)(*instance.next)) - cast(*void)(*instance)) == 8, "XrSessionBeginInfo.next has unexpected offset % instead of 8", ((cast(*void)(*instance.next)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrSessionBeginInfo.next)) == 8, "XrSessionBeginInfo.next has unexpected size % instead of 8", size_of(type_of(XrSessionBeginInfo.next)));
    assert(((cast(*void)(*instance.primaryViewConfigurationType)) - cast(*void)(*instance)) == 16, "XrSessionBeginInfo.primaryViewConfigurationType has unexpected offset % instead of 16", ((cast(*void)(*instance.primaryViewConfigurationType)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrSessionBeginInfo.primaryViewConfigurationType)) == 4, "XrSessionBeginInfo.primaryViewConfigurationType has unexpected size % instead of 4", size_of(type_of(XrSessionBeginInfo.primaryViewConfigurationType)));
    assert(size_of(XrSessionBeginInfo) == 24, "XrSessionBeginInfo has size % instead of 24", size_of(XrSessionBeginInfo));
}

XrFrameWaitInfo :: struct {
    type: XrStructureType;
    next: *void;
}
#run {
    instance: XrFrameWaitInfo;
    assert(((cast(*void)(*instance.type)) - cast(*void)(*instance)) == 0, "XrFrameWaitInfo.type has unexpected offset % instead of 0", ((cast(*void)(*instance.type)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrFrameWaitInfo.type)) == 4, "XrFrameWaitInfo.type has unexpected size % instead of 4", size_of(type_of(XrFrameWaitInfo.type)));
    assert(((cast(*void)(*instance.next)) - cast(*void)(*instance)) == 8, "XrFrameWaitInfo.next has unexpected offset % instead of 8", ((cast(*void)(*instance.next)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrFrameWaitInfo.next)) == 8, "XrFrameWaitInfo.next has unexpected size % instead of 8", size_of(type_of(XrFrameWaitInfo.next)));
    assert(size_of(XrFrameWaitInfo) == 16, "XrFrameWaitInfo has size % instead of 16", size_of(XrFrameWaitInfo));
}

XrFrameState :: struct {
    type:                   XrStructureType;
    next:                   *void;
    predictedDisplayTime:   XrTime;
    predictedDisplayPeriod: XrDuration;
    shouldRender:           XrBool32;
}
#run {
    instance: XrFrameState;
    assert(((cast(*void)(*instance.type)) - cast(*void)(*instance)) == 0, "XrFrameState.type has unexpected offset % instead of 0", ((cast(*void)(*instance.type)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrFrameState.type)) == 4, "XrFrameState.type has unexpected size % instead of 4", size_of(type_of(XrFrameState.type)));
    assert(((cast(*void)(*instance.next)) - cast(*void)(*instance)) == 8, "XrFrameState.next has unexpected offset % instead of 8", ((cast(*void)(*instance.next)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrFrameState.next)) == 8, "XrFrameState.next has unexpected size % instead of 8", size_of(type_of(XrFrameState.next)));
    assert(((cast(*void)(*instance.predictedDisplayTime)) - cast(*void)(*instance)) == 16, "XrFrameState.predictedDisplayTime has unexpected offset % instead of 16", ((cast(*void)(*instance.predictedDisplayTime)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrFrameState.predictedDisplayTime)) == 8, "XrFrameState.predictedDisplayTime has unexpected size % instead of 8", size_of(type_of(XrFrameState.predictedDisplayTime)));
    assert(((cast(*void)(*instance.predictedDisplayPeriod)) - cast(*void)(*instance)) == 24, "XrFrameState.predictedDisplayPeriod has unexpected offset % instead of 24", ((cast(*void)(*instance.predictedDisplayPeriod)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrFrameState.predictedDisplayPeriod)) == 8, "XrFrameState.predictedDisplayPeriod has unexpected size % instead of 8", size_of(type_of(XrFrameState.predictedDisplayPeriod)));
    assert(((cast(*void)(*instance.shouldRender)) - cast(*void)(*instance)) == 32, "XrFrameState.shouldRender has unexpected offset % instead of 32", ((cast(*void)(*instance.shouldRender)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrFrameState.shouldRender)) == 4, "XrFrameState.shouldRender has unexpected size % instead of 4", size_of(type_of(XrFrameState.shouldRender)));
    assert(size_of(XrFrameState) == 40, "XrFrameState has size % instead of 40", size_of(XrFrameState));
}

XrFrameBeginInfo :: struct {
    type: XrStructureType;
    next: *void;
}
#run {
    instance: XrFrameBeginInfo;
    assert(((cast(*void)(*instance.type)) - cast(*void)(*instance)) == 0, "XrFrameBeginInfo.type has unexpected offset % instead of 0", ((cast(*void)(*instance.type)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrFrameBeginInfo.type)) == 4, "XrFrameBeginInfo.type has unexpected size % instead of 4", size_of(type_of(XrFrameBeginInfo.type)));
    assert(((cast(*void)(*instance.next)) - cast(*void)(*instance)) == 8, "XrFrameBeginInfo.next has unexpected offset % instead of 8", ((cast(*void)(*instance.next)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrFrameBeginInfo.next)) == 8, "XrFrameBeginInfo.next has unexpected size % instead of 8", size_of(type_of(XrFrameBeginInfo.next)));
    assert(size_of(XrFrameBeginInfo) == 16, "XrFrameBeginInfo has size % instead of 16", size_of(XrFrameBeginInfo));
}

XrCompositionLayerBaseHeader :: struct {
    type:       XrStructureType;
    next:       *void;
    layerFlags: XrCompositionLayerFlags;
    space:      XrSpace;
}
#run {
    instance: XrCompositionLayerBaseHeader;
    assert(((cast(*void)(*instance.type)) - cast(*void)(*instance)) == 0, "XrCompositionLayerBaseHeader.type has unexpected offset % instead of 0", ((cast(*void)(*instance.type)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrCompositionLayerBaseHeader.type)) == 4, "XrCompositionLayerBaseHeader.type has unexpected size % instead of 4", size_of(type_of(XrCompositionLayerBaseHeader.type)));
    assert(((cast(*void)(*instance.next)) - cast(*void)(*instance)) == 8, "XrCompositionLayerBaseHeader.next has unexpected offset % instead of 8", ((cast(*void)(*instance.next)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrCompositionLayerBaseHeader.next)) == 8, "XrCompositionLayerBaseHeader.next has unexpected size % instead of 8", size_of(type_of(XrCompositionLayerBaseHeader.next)));
    assert(((cast(*void)(*instance.layerFlags)) - cast(*void)(*instance)) == 16, "XrCompositionLayerBaseHeader.layerFlags has unexpected offset % instead of 16", ((cast(*void)(*instance.layerFlags)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrCompositionLayerBaseHeader.layerFlags)) == 8, "XrCompositionLayerBaseHeader.layerFlags has unexpected size % instead of 8", size_of(type_of(XrCompositionLayerBaseHeader.layerFlags)));
    assert(((cast(*void)(*instance.space)) - cast(*void)(*instance)) == 24, "XrCompositionLayerBaseHeader.space has unexpected offset % instead of 24", ((cast(*void)(*instance.space)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrCompositionLayerBaseHeader.space)) == 8, "XrCompositionLayerBaseHeader.space has unexpected size % instead of 8", size_of(type_of(XrCompositionLayerBaseHeader.space)));
    assert(size_of(XrCompositionLayerBaseHeader) == 32, "XrCompositionLayerBaseHeader has size % instead of 32", size_of(XrCompositionLayerBaseHeader));
}

XrFrameEndInfo :: struct {
    type:                 XrStructureType;
    next:                 *void;
    displayTime:          XrTime;
    environmentBlendMode: XrEnvironmentBlendMode;
    layerCount:           u32;
    layers:               **XrCompositionLayerBaseHeader;
}
#run {
    instance: XrFrameEndInfo;
    assert(((cast(*void)(*instance.type)) - cast(*void)(*instance)) == 0, "XrFrameEndInfo.type has unexpected offset % instead of 0", ((cast(*void)(*instance.type)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrFrameEndInfo.type)) == 4, "XrFrameEndInfo.type has unexpected size % instead of 4", size_of(type_of(XrFrameEndInfo.type)));
    assert(((cast(*void)(*instance.next)) - cast(*void)(*instance)) == 8, "XrFrameEndInfo.next has unexpected offset % instead of 8", ((cast(*void)(*instance.next)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrFrameEndInfo.next)) == 8, "XrFrameEndInfo.next has unexpected size % instead of 8", size_of(type_of(XrFrameEndInfo.next)));
    assert(((cast(*void)(*instance.displayTime)) - cast(*void)(*instance)) == 16, "XrFrameEndInfo.displayTime has unexpected offset % instead of 16", ((cast(*void)(*instance.displayTime)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrFrameEndInfo.displayTime)) == 8, "XrFrameEndInfo.displayTime has unexpected size % instead of 8", size_of(type_of(XrFrameEndInfo.displayTime)));
    assert(((cast(*void)(*instance.environmentBlendMode)) - cast(*void)(*instance)) == 24, "XrFrameEndInfo.environmentBlendMode has unexpected offset % instead of 24", ((cast(*void)(*instance.environmentBlendMode)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrFrameEndInfo.environmentBlendMode)) == 4, "XrFrameEndInfo.environmentBlendMode has unexpected size % instead of 4", size_of(type_of(XrFrameEndInfo.environmentBlendMode)));
    assert(((cast(*void)(*instance.layerCount)) - cast(*void)(*instance)) == 28, "XrFrameEndInfo.layerCount has unexpected offset % instead of 28", ((cast(*void)(*instance.layerCount)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrFrameEndInfo.layerCount)) == 4, "XrFrameEndInfo.layerCount has unexpected size % instead of 4", size_of(type_of(XrFrameEndInfo.layerCount)));
    assert(((cast(*void)(*instance.layers)) - cast(*void)(*instance)) == 32, "XrFrameEndInfo.layers has unexpected offset % instead of 32", ((cast(*void)(*instance.layers)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrFrameEndInfo.layers)) == 8, "XrFrameEndInfo.layers has unexpected size % instead of 8", size_of(type_of(XrFrameEndInfo.layers)));
    assert(size_of(XrFrameEndInfo) == 40, "XrFrameEndInfo has size % instead of 40", size_of(XrFrameEndInfo));
}

XrViewLocateInfo :: struct {
    type:                  XrStructureType;
    next:                  *void;
    viewConfigurationType: XrViewConfigurationType;
    displayTime:           XrTime;
    space:                 XrSpace;
}
#run {
    instance: XrViewLocateInfo;
    assert(((cast(*void)(*instance.type)) - cast(*void)(*instance)) == 0, "XrViewLocateInfo.type has unexpected offset % instead of 0", ((cast(*void)(*instance.type)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrViewLocateInfo.type)) == 4, "XrViewLocateInfo.type has unexpected size % instead of 4", size_of(type_of(XrViewLocateInfo.type)));
    assert(((cast(*void)(*instance.next)) - cast(*void)(*instance)) == 8, "XrViewLocateInfo.next has unexpected offset % instead of 8", ((cast(*void)(*instance.next)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrViewLocateInfo.next)) == 8, "XrViewLocateInfo.next has unexpected size % instead of 8", size_of(type_of(XrViewLocateInfo.next)));
    assert(((cast(*void)(*instance.viewConfigurationType)) - cast(*void)(*instance)) == 16, "XrViewLocateInfo.viewConfigurationType has unexpected offset % instead of 16", ((cast(*void)(*instance.viewConfigurationType)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrViewLocateInfo.viewConfigurationType)) == 4, "XrViewLocateInfo.viewConfigurationType has unexpected size % instead of 4", size_of(type_of(XrViewLocateInfo.viewConfigurationType)));
    assert(((cast(*void)(*instance.displayTime)) - cast(*void)(*instance)) == 24, "XrViewLocateInfo.displayTime has unexpected offset % instead of 24", ((cast(*void)(*instance.displayTime)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrViewLocateInfo.displayTime)) == 8, "XrViewLocateInfo.displayTime has unexpected size % instead of 8", size_of(type_of(XrViewLocateInfo.displayTime)));
    assert(((cast(*void)(*instance.space)) - cast(*void)(*instance)) == 32, "XrViewLocateInfo.space has unexpected offset % instead of 32", ((cast(*void)(*instance.space)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrViewLocateInfo.space)) == 8, "XrViewLocateInfo.space has unexpected size % instead of 8", size_of(type_of(XrViewLocateInfo.space)));
    assert(size_of(XrViewLocateInfo) == 40, "XrViewLocateInfo has size % instead of 40", size_of(XrViewLocateInfo));
}

XrViewState :: struct {
    type:           XrStructureType;
    next:           *void;
    viewStateFlags: XrViewStateFlags;
}
#run {
    instance: XrViewState;
    assert(((cast(*void)(*instance.type)) - cast(*void)(*instance)) == 0, "XrViewState.type has unexpected offset % instead of 0", ((cast(*void)(*instance.type)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrViewState.type)) == 4, "XrViewState.type has unexpected size % instead of 4", size_of(type_of(XrViewState.type)));
    assert(((cast(*void)(*instance.next)) - cast(*void)(*instance)) == 8, "XrViewState.next has unexpected offset % instead of 8", ((cast(*void)(*instance.next)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrViewState.next)) == 8, "XrViewState.next has unexpected size % instead of 8", size_of(type_of(XrViewState.next)));
    assert(((cast(*void)(*instance.viewStateFlags)) - cast(*void)(*instance)) == 16, "XrViewState.viewStateFlags has unexpected offset % instead of 16", ((cast(*void)(*instance.viewStateFlags)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrViewState.viewStateFlags)) == 8, "XrViewState.viewStateFlags has unexpected size % instead of 8", size_of(type_of(XrViewState.viewStateFlags)));
    assert(size_of(XrViewState) == 24, "XrViewState has size % instead of 24", size_of(XrViewState));
}

XrFovf :: struct {
    angleLeft:  float;
    angleRight: float;
    angleUp:    float;
    angleDown:  float;
}
#run {
    instance: XrFovf;
    assert(((cast(*void)(*instance.angleLeft)) - cast(*void)(*instance)) == 0, "XrFovf.angleLeft has unexpected offset % instead of 0", ((cast(*void)(*instance.angleLeft)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrFovf.angleLeft)) == 4, "XrFovf.angleLeft has unexpected size % instead of 4", size_of(type_of(XrFovf.angleLeft)));
    assert(((cast(*void)(*instance.angleRight)) - cast(*void)(*instance)) == 4, "XrFovf.angleRight has unexpected offset % instead of 4", ((cast(*void)(*instance.angleRight)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrFovf.angleRight)) == 4, "XrFovf.angleRight has unexpected size % instead of 4", size_of(type_of(XrFovf.angleRight)));
    assert(((cast(*void)(*instance.angleUp)) - cast(*void)(*instance)) == 8, "XrFovf.angleUp has unexpected offset % instead of 8", ((cast(*void)(*instance.angleUp)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrFovf.angleUp)) == 4, "XrFovf.angleUp has unexpected size % instead of 4", size_of(type_of(XrFovf.angleUp)));
    assert(((cast(*void)(*instance.angleDown)) - cast(*void)(*instance)) == 12, "XrFovf.angleDown has unexpected offset % instead of 12", ((cast(*void)(*instance.angleDown)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrFovf.angleDown)) == 4, "XrFovf.angleDown has unexpected size % instead of 4", size_of(type_of(XrFovf.angleDown)));
    assert(size_of(XrFovf) == 16, "XrFovf has size % instead of 16", size_of(XrFovf));
}

XrView :: struct {
    type: XrStructureType;
    next: *void;
    pose: XrPosef;
    fov:  XrFovf;
}
#run {
    instance: XrView;
    assert(((cast(*void)(*instance.type)) - cast(*void)(*instance)) == 0, "XrView.type has unexpected offset % instead of 0", ((cast(*void)(*instance.type)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrView.type)) == 4, "XrView.type has unexpected size % instead of 4", size_of(type_of(XrView.type)));
    assert(((cast(*void)(*instance.next)) - cast(*void)(*instance)) == 8, "XrView.next has unexpected offset % instead of 8", ((cast(*void)(*instance.next)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrView.next)) == 8, "XrView.next has unexpected size % instead of 8", size_of(type_of(XrView.next)));
    assert(((cast(*void)(*instance.pose)) - cast(*void)(*instance)) == 16, "XrView.pose has unexpected offset % instead of 16", ((cast(*void)(*instance.pose)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrView.pose)) == 28, "XrView.pose has unexpected size % instead of 28", size_of(type_of(XrView.pose)));
    assert(((cast(*void)(*instance.fov)) - cast(*void)(*instance)) == 44, "XrView.fov has unexpected offset % instead of 44", ((cast(*void)(*instance.fov)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrView.fov)) == 16, "XrView.fov has unexpected size % instead of 16", size_of(type_of(XrView.fov)));
    assert(size_of(XrView) == 64, "XrView has size % instead of 64", size_of(XrView));
}

XrActionSetCreateInfo :: struct {
    type:                   XrStructureType;
    next:                   *void;
    actionSetName:          [64] u8;
    localizedActionSetName: [128] u8;
    priority:               u32;
}
#run {
    instance: XrActionSetCreateInfo;
    assert(((cast(*void)(*instance.type)) - cast(*void)(*instance)) == 0, "XrActionSetCreateInfo.type has unexpected offset % instead of 0", ((cast(*void)(*instance.type)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrActionSetCreateInfo.type)) == 4, "XrActionSetCreateInfo.type has unexpected size % instead of 4", size_of(type_of(XrActionSetCreateInfo.type)));
    assert(((cast(*void)(*instance.next)) - cast(*void)(*instance)) == 8, "XrActionSetCreateInfo.next has unexpected offset % instead of 8", ((cast(*void)(*instance.next)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrActionSetCreateInfo.next)) == 8, "XrActionSetCreateInfo.next has unexpected size % instead of 8", size_of(type_of(XrActionSetCreateInfo.next)));
    assert(((cast(*void)(*instance.actionSetName)) - cast(*void)(*instance)) == 16, "XrActionSetCreateInfo.actionSetName has unexpected offset % instead of 16", ((cast(*void)(*instance.actionSetName)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrActionSetCreateInfo.actionSetName)) == 64, "XrActionSetCreateInfo.actionSetName has unexpected size % instead of 64", size_of(type_of(XrActionSetCreateInfo.actionSetName)));
    assert(((cast(*void)(*instance.localizedActionSetName)) - cast(*void)(*instance)) == 80, "XrActionSetCreateInfo.localizedActionSetName has unexpected offset % instead of 80", ((cast(*void)(*instance.localizedActionSetName)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrActionSetCreateInfo.localizedActionSetName)) == 128, "XrActionSetCreateInfo.localizedActionSetName has unexpected size % instead of 128", size_of(type_of(XrActionSetCreateInfo.localizedActionSetName)));
    assert(((cast(*void)(*instance.priority)) - cast(*void)(*instance)) == 208, "XrActionSetCreateInfo.priority has unexpected offset % instead of 208", ((cast(*void)(*instance.priority)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrActionSetCreateInfo.priority)) == 4, "XrActionSetCreateInfo.priority has unexpected size % instead of 4", size_of(type_of(XrActionSetCreateInfo.priority)));
    assert(size_of(XrActionSetCreateInfo) == 216, "XrActionSetCreateInfo has size % instead of 216", size_of(XrActionSetCreateInfo));
}

XrActionCreateInfo :: struct {
    type:                XrStructureType;
    next:                *void;
    actionName:          [64] u8;
    actionType:          XrActionType;
    countSubactionPaths: u32;
    subactionPaths:      *XrPath;
    localizedActionName: [128] u8;
}
#run {
    instance: XrActionCreateInfo;
    assert(((cast(*void)(*instance.type)) - cast(*void)(*instance)) == 0, "XrActionCreateInfo.type has unexpected offset % instead of 0", ((cast(*void)(*instance.type)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrActionCreateInfo.type)) == 4, "XrActionCreateInfo.type has unexpected size % instead of 4", size_of(type_of(XrActionCreateInfo.type)));
    assert(((cast(*void)(*instance.next)) - cast(*void)(*instance)) == 8, "XrActionCreateInfo.next has unexpected offset % instead of 8", ((cast(*void)(*instance.next)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrActionCreateInfo.next)) == 8, "XrActionCreateInfo.next has unexpected size % instead of 8", size_of(type_of(XrActionCreateInfo.next)));
    assert(((cast(*void)(*instance.actionName)) - cast(*void)(*instance)) == 16, "XrActionCreateInfo.actionName has unexpected offset % instead of 16", ((cast(*void)(*instance.actionName)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrActionCreateInfo.actionName)) == 64, "XrActionCreateInfo.actionName has unexpected size % instead of 64", size_of(type_of(XrActionCreateInfo.actionName)));
    assert(((cast(*void)(*instance.actionType)) - cast(*void)(*instance)) == 80, "XrActionCreateInfo.actionType has unexpected offset % instead of 80", ((cast(*void)(*instance.actionType)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrActionCreateInfo.actionType)) == 4, "XrActionCreateInfo.actionType has unexpected size % instead of 4", size_of(type_of(XrActionCreateInfo.actionType)));
    assert(((cast(*void)(*instance.countSubactionPaths)) - cast(*void)(*instance)) == 84, "XrActionCreateInfo.countSubactionPaths has unexpected offset % instead of 84", ((cast(*void)(*instance.countSubactionPaths)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrActionCreateInfo.countSubactionPaths)) == 4, "XrActionCreateInfo.countSubactionPaths has unexpected size % instead of 4", size_of(type_of(XrActionCreateInfo.countSubactionPaths)));
    assert(((cast(*void)(*instance.subactionPaths)) - cast(*void)(*instance)) == 88, "XrActionCreateInfo.subactionPaths has unexpected offset % instead of 88", ((cast(*void)(*instance.subactionPaths)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrActionCreateInfo.subactionPaths)) == 8, "XrActionCreateInfo.subactionPaths has unexpected size % instead of 8", size_of(type_of(XrActionCreateInfo.subactionPaths)));
    assert(((cast(*void)(*instance.localizedActionName)) - cast(*void)(*instance)) == 96, "XrActionCreateInfo.localizedActionName has unexpected offset % instead of 96", ((cast(*void)(*instance.localizedActionName)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrActionCreateInfo.localizedActionName)) == 128, "XrActionCreateInfo.localizedActionName has unexpected size % instead of 128", size_of(type_of(XrActionCreateInfo.localizedActionName)));
    assert(size_of(XrActionCreateInfo) == 224, "XrActionCreateInfo has size % instead of 224", size_of(XrActionCreateInfo));
}

XrActionSuggestedBinding :: struct {
    action:  XrAction;
    binding: XrPath;
}
#run {
    instance: XrActionSuggestedBinding;
    assert(((cast(*void)(*instance.action)) - cast(*void)(*instance)) == 0, "XrActionSuggestedBinding.action has unexpected offset % instead of 0", ((cast(*void)(*instance.action)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrActionSuggestedBinding.action)) == 8, "XrActionSuggestedBinding.action has unexpected size % instead of 8", size_of(type_of(XrActionSuggestedBinding.action)));
    assert(((cast(*void)(*instance.binding)) - cast(*void)(*instance)) == 8, "XrActionSuggestedBinding.binding has unexpected offset % instead of 8", ((cast(*void)(*instance.binding)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrActionSuggestedBinding.binding)) == 8, "XrActionSuggestedBinding.binding has unexpected size % instead of 8", size_of(type_of(XrActionSuggestedBinding.binding)));
    assert(size_of(XrActionSuggestedBinding) == 16, "XrActionSuggestedBinding has size % instead of 16", size_of(XrActionSuggestedBinding));
}

XrInteractionProfileSuggestedBinding :: struct {
    type:                   XrStructureType;
    next:                   *void;
    interactionProfile:     XrPath;
    countSuggestedBindings: u32;
    suggestedBindings:      *XrActionSuggestedBinding;
}
#run {
    instance: XrInteractionProfileSuggestedBinding;
    assert(((cast(*void)(*instance.type)) - cast(*void)(*instance)) == 0, "XrInteractionProfileSuggestedBinding.type has unexpected offset % instead of 0", ((cast(*void)(*instance.type)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrInteractionProfileSuggestedBinding.type)) == 4, "XrInteractionProfileSuggestedBinding.type has unexpected size % instead of 4", size_of(type_of(XrInteractionProfileSuggestedBinding.type)));
    assert(((cast(*void)(*instance.next)) - cast(*void)(*instance)) == 8, "XrInteractionProfileSuggestedBinding.next has unexpected offset % instead of 8", ((cast(*void)(*instance.next)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrInteractionProfileSuggestedBinding.next)) == 8, "XrInteractionProfileSuggestedBinding.next has unexpected size % instead of 8", size_of(type_of(XrInteractionProfileSuggestedBinding.next)));
    assert(((cast(*void)(*instance.interactionProfile)) - cast(*void)(*instance)) == 16, "XrInteractionProfileSuggestedBinding.interactionProfile has unexpected offset % instead of 16", ((cast(*void)(*instance.interactionProfile)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrInteractionProfileSuggestedBinding.interactionProfile)) == 8, "XrInteractionProfileSuggestedBinding.interactionProfile has unexpected size % instead of 8", size_of(type_of(XrInteractionProfileSuggestedBinding.interactionProfile)));
    assert(((cast(*void)(*instance.countSuggestedBindings)) - cast(*void)(*instance)) == 24, "XrInteractionProfileSuggestedBinding.countSuggestedBindings has unexpected offset % instead of 24", ((cast(*void)(*instance.countSuggestedBindings)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrInteractionProfileSuggestedBinding.countSuggestedBindings)) == 4, "XrInteractionProfileSuggestedBinding.countSuggestedBindings has unexpected size % instead of 4", size_of(type_of(XrInteractionProfileSuggestedBinding.countSuggestedBindings)));
    assert(((cast(*void)(*instance.suggestedBindings)) - cast(*void)(*instance)) == 32, "XrInteractionProfileSuggestedBinding.suggestedBindings has unexpected offset % instead of 32", ((cast(*void)(*instance.suggestedBindings)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrInteractionProfileSuggestedBinding.suggestedBindings)) == 8, "XrInteractionProfileSuggestedBinding.suggestedBindings has unexpected size % instead of 8", size_of(type_of(XrInteractionProfileSuggestedBinding.suggestedBindings)));
    assert(size_of(XrInteractionProfileSuggestedBinding) == 40, "XrInteractionProfileSuggestedBinding has size % instead of 40", size_of(XrInteractionProfileSuggestedBinding));
}

XrSessionActionSetsAttachInfo :: struct {
    type:            XrStructureType;
    next:            *void;
    countActionSets: u32;
    actionSets:      *XrActionSet;
}
#run {
    instance: XrSessionActionSetsAttachInfo;
    assert(((cast(*void)(*instance.type)) - cast(*void)(*instance)) == 0, "XrSessionActionSetsAttachInfo.type has unexpected offset % instead of 0", ((cast(*void)(*instance.type)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrSessionActionSetsAttachInfo.type)) == 4, "XrSessionActionSetsAttachInfo.type has unexpected size % instead of 4", size_of(type_of(XrSessionActionSetsAttachInfo.type)));
    assert(((cast(*void)(*instance.next)) - cast(*void)(*instance)) == 8, "XrSessionActionSetsAttachInfo.next has unexpected offset % instead of 8", ((cast(*void)(*instance.next)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrSessionActionSetsAttachInfo.next)) == 8, "XrSessionActionSetsAttachInfo.next has unexpected size % instead of 8", size_of(type_of(XrSessionActionSetsAttachInfo.next)));
    assert(((cast(*void)(*instance.countActionSets)) - cast(*void)(*instance)) == 16, "XrSessionActionSetsAttachInfo.countActionSets has unexpected offset % instead of 16", ((cast(*void)(*instance.countActionSets)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrSessionActionSetsAttachInfo.countActionSets)) == 4, "XrSessionActionSetsAttachInfo.countActionSets has unexpected size % instead of 4", size_of(type_of(XrSessionActionSetsAttachInfo.countActionSets)));
    assert(((cast(*void)(*instance.actionSets)) - cast(*void)(*instance)) == 24, "XrSessionActionSetsAttachInfo.actionSets has unexpected offset % instead of 24", ((cast(*void)(*instance.actionSets)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrSessionActionSetsAttachInfo.actionSets)) == 8, "XrSessionActionSetsAttachInfo.actionSets has unexpected size % instead of 8", size_of(type_of(XrSessionActionSetsAttachInfo.actionSets)));
    assert(size_of(XrSessionActionSetsAttachInfo) == 32, "XrSessionActionSetsAttachInfo has size % instead of 32", size_of(XrSessionActionSetsAttachInfo));
}

XrInteractionProfileState :: struct {
    type:               XrStructureType;
    next:               *void;
    interactionProfile: XrPath;
}
#run {
    instance: XrInteractionProfileState;
    assert(((cast(*void)(*instance.type)) - cast(*void)(*instance)) == 0, "XrInteractionProfileState.type has unexpected offset % instead of 0", ((cast(*void)(*instance.type)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrInteractionProfileState.type)) == 4, "XrInteractionProfileState.type has unexpected size % instead of 4", size_of(type_of(XrInteractionProfileState.type)));
    assert(((cast(*void)(*instance.next)) - cast(*void)(*instance)) == 8, "XrInteractionProfileState.next has unexpected offset % instead of 8", ((cast(*void)(*instance.next)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrInteractionProfileState.next)) == 8, "XrInteractionProfileState.next has unexpected size % instead of 8", size_of(type_of(XrInteractionProfileState.next)));
    assert(((cast(*void)(*instance.interactionProfile)) - cast(*void)(*instance)) == 16, "XrInteractionProfileState.interactionProfile has unexpected offset % instead of 16", ((cast(*void)(*instance.interactionProfile)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrInteractionProfileState.interactionProfile)) == 8, "XrInteractionProfileState.interactionProfile has unexpected size % instead of 8", size_of(type_of(XrInteractionProfileState.interactionProfile)));
    assert(size_of(XrInteractionProfileState) == 24, "XrInteractionProfileState has size % instead of 24", size_of(XrInteractionProfileState));
}

XrActionStateGetInfo :: struct {
    type:          XrStructureType;
    next:          *void;
    action:        XrAction;
    subactionPath: XrPath;
}
#run {
    instance: XrActionStateGetInfo;
    assert(((cast(*void)(*instance.type)) - cast(*void)(*instance)) == 0, "XrActionStateGetInfo.type has unexpected offset % instead of 0", ((cast(*void)(*instance.type)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrActionStateGetInfo.type)) == 4, "XrActionStateGetInfo.type has unexpected size % instead of 4", size_of(type_of(XrActionStateGetInfo.type)));
    assert(((cast(*void)(*instance.next)) - cast(*void)(*instance)) == 8, "XrActionStateGetInfo.next has unexpected offset % instead of 8", ((cast(*void)(*instance.next)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrActionStateGetInfo.next)) == 8, "XrActionStateGetInfo.next has unexpected size % instead of 8", size_of(type_of(XrActionStateGetInfo.next)));
    assert(((cast(*void)(*instance.action)) - cast(*void)(*instance)) == 16, "XrActionStateGetInfo.action has unexpected offset % instead of 16", ((cast(*void)(*instance.action)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrActionStateGetInfo.action)) == 8, "XrActionStateGetInfo.action has unexpected size % instead of 8", size_of(type_of(XrActionStateGetInfo.action)));
    assert(((cast(*void)(*instance.subactionPath)) - cast(*void)(*instance)) == 24, "XrActionStateGetInfo.subactionPath has unexpected offset % instead of 24", ((cast(*void)(*instance.subactionPath)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrActionStateGetInfo.subactionPath)) == 8, "XrActionStateGetInfo.subactionPath has unexpected size % instead of 8", size_of(type_of(XrActionStateGetInfo.subactionPath)));
    assert(size_of(XrActionStateGetInfo) == 32, "XrActionStateGetInfo has size % instead of 32", size_of(XrActionStateGetInfo));
}

XrActionStateBoolean :: struct {
    type:                 XrStructureType;
    next:                 *void;
    currentState:         XrBool32;
    changedSinceLastSync: XrBool32;
    lastChangeTime:       XrTime;
    isActive:             XrBool32;
}
#run {
    instance: XrActionStateBoolean;
    assert(((cast(*void)(*instance.type)) - cast(*void)(*instance)) == 0, "XrActionStateBoolean.type has unexpected offset % instead of 0", ((cast(*void)(*instance.type)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrActionStateBoolean.type)) == 4, "XrActionStateBoolean.type has unexpected size % instead of 4", size_of(type_of(XrActionStateBoolean.type)));
    assert(((cast(*void)(*instance.next)) - cast(*void)(*instance)) == 8, "XrActionStateBoolean.next has unexpected offset % instead of 8", ((cast(*void)(*instance.next)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrActionStateBoolean.next)) == 8, "XrActionStateBoolean.next has unexpected size % instead of 8", size_of(type_of(XrActionStateBoolean.next)));
    assert(((cast(*void)(*instance.currentState)) - cast(*void)(*instance)) == 16, "XrActionStateBoolean.currentState has unexpected offset % instead of 16", ((cast(*void)(*instance.currentState)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrActionStateBoolean.currentState)) == 4, "XrActionStateBoolean.currentState has unexpected size % instead of 4", size_of(type_of(XrActionStateBoolean.currentState)));
    assert(((cast(*void)(*instance.changedSinceLastSync)) - cast(*void)(*instance)) == 20, "XrActionStateBoolean.changedSinceLastSync has unexpected offset % instead of 20", ((cast(*void)(*instance.changedSinceLastSync)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrActionStateBoolean.changedSinceLastSync)) == 4, "XrActionStateBoolean.changedSinceLastSync has unexpected size % instead of 4", size_of(type_of(XrActionStateBoolean.changedSinceLastSync)));
    assert(((cast(*void)(*instance.lastChangeTime)) - cast(*void)(*instance)) == 24, "XrActionStateBoolean.lastChangeTime has unexpected offset % instead of 24", ((cast(*void)(*instance.lastChangeTime)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrActionStateBoolean.lastChangeTime)) == 8, "XrActionStateBoolean.lastChangeTime has unexpected size % instead of 8", size_of(type_of(XrActionStateBoolean.lastChangeTime)));
    assert(((cast(*void)(*instance.isActive)) - cast(*void)(*instance)) == 32, "XrActionStateBoolean.isActive has unexpected offset % instead of 32", ((cast(*void)(*instance.isActive)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrActionStateBoolean.isActive)) == 4, "XrActionStateBoolean.isActive has unexpected size % instead of 4", size_of(type_of(XrActionStateBoolean.isActive)));
    assert(size_of(XrActionStateBoolean) == 40, "XrActionStateBoolean has size % instead of 40", size_of(XrActionStateBoolean));
}

XrActionStateFloat :: struct {
    type:                 XrStructureType;
    next:                 *void;
    currentState:         float;
    changedSinceLastSync: XrBool32;
    lastChangeTime:       XrTime;
    isActive:             XrBool32;
}
#run {
    instance: XrActionStateFloat;
    assert(((cast(*void)(*instance.type)) - cast(*void)(*instance)) == 0, "XrActionStateFloat.type has unexpected offset % instead of 0", ((cast(*void)(*instance.type)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrActionStateFloat.type)) == 4, "XrActionStateFloat.type has unexpected size % instead of 4", size_of(type_of(XrActionStateFloat.type)));
    assert(((cast(*void)(*instance.next)) - cast(*void)(*instance)) == 8, "XrActionStateFloat.next has unexpected offset % instead of 8", ((cast(*void)(*instance.next)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrActionStateFloat.next)) == 8, "XrActionStateFloat.next has unexpected size % instead of 8", size_of(type_of(XrActionStateFloat.next)));
    assert(((cast(*void)(*instance.currentState)) - cast(*void)(*instance)) == 16, "XrActionStateFloat.currentState has unexpected offset % instead of 16", ((cast(*void)(*instance.currentState)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrActionStateFloat.currentState)) == 4, "XrActionStateFloat.currentState has unexpected size % instead of 4", size_of(type_of(XrActionStateFloat.currentState)));
    assert(((cast(*void)(*instance.changedSinceLastSync)) - cast(*void)(*instance)) == 20, "XrActionStateFloat.changedSinceLastSync has unexpected offset % instead of 20", ((cast(*void)(*instance.changedSinceLastSync)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrActionStateFloat.changedSinceLastSync)) == 4, "XrActionStateFloat.changedSinceLastSync has unexpected size % instead of 4", size_of(type_of(XrActionStateFloat.changedSinceLastSync)));
    assert(((cast(*void)(*instance.lastChangeTime)) - cast(*void)(*instance)) == 24, "XrActionStateFloat.lastChangeTime has unexpected offset % instead of 24", ((cast(*void)(*instance.lastChangeTime)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrActionStateFloat.lastChangeTime)) == 8, "XrActionStateFloat.lastChangeTime has unexpected size % instead of 8", size_of(type_of(XrActionStateFloat.lastChangeTime)));
    assert(((cast(*void)(*instance.isActive)) - cast(*void)(*instance)) == 32, "XrActionStateFloat.isActive has unexpected offset % instead of 32", ((cast(*void)(*instance.isActive)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrActionStateFloat.isActive)) == 4, "XrActionStateFloat.isActive has unexpected size % instead of 4", size_of(type_of(XrActionStateFloat.isActive)));
    assert(size_of(XrActionStateFloat) == 40, "XrActionStateFloat has size % instead of 40", size_of(XrActionStateFloat));
}

XrVector2f :: struct {
    x: float;
    y: float;
}
#run {
    instance: XrVector2f;
    assert(((cast(*void)(*instance.x)) - cast(*void)(*instance)) == 0, "XrVector2f.x has unexpected offset % instead of 0", ((cast(*void)(*instance.x)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrVector2f.x)) == 4, "XrVector2f.x has unexpected size % instead of 4", size_of(type_of(XrVector2f.x)));
    assert(((cast(*void)(*instance.y)) - cast(*void)(*instance)) == 4, "XrVector2f.y has unexpected offset % instead of 4", ((cast(*void)(*instance.y)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrVector2f.y)) == 4, "XrVector2f.y has unexpected size % instead of 4", size_of(type_of(XrVector2f.y)));
    assert(size_of(XrVector2f) == 8, "XrVector2f has size % instead of 8", size_of(XrVector2f));
}

XrActionStateVector2f :: struct {
    type:                 XrStructureType;
    next:                 *void;
    currentState:         XrVector2f;
    changedSinceLastSync: XrBool32;
    lastChangeTime:       XrTime;
    isActive:             XrBool32;
}
#run {
    instance: XrActionStateVector2f;
    assert(((cast(*void)(*instance.type)) - cast(*void)(*instance)) == 0, "XrActionStateVector2f.type has unexpected offset % instead of 0", ((cast(*void)(*instance.type)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrActionStateVector2f.type)) == 4, "XrActionStateVector2f.type has unexpected size % instead of 4", size_of(type_of(XrActionStateVector2f.type)));
    assert(((cast(*void)(*instance.next)) - cast(*void)(*instance)) == 8, "XrActionStateVector2f.next has unexpected offset % instead of 8", ((cast(*void)(*instance.next)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrActionStateVector2f.next)) == 8, "XrActionStateVector2f.next has unexpected size % instead of 8", size_of(type_of(XrActionStateVector2f.next)));
    assert(((cast(*void)(*instance.currentState)) - cast(*void)(*instance)) == 16, "XrActionStateVector2f.currentState has unexpected offset % instead of 16", ((cast(*void)(*instance.currentState)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrActionStateVector2f.currentState)) == 8, "XrActionStateVector2f.currentState has unexpected size % instead of 8", size_of(type_of(XrActionStateVector2f.currentState)));
    assert(((cast(*void)(*instance.changedSinceLastSync)) - cast(*void)(*instance)) == 24, "XrActionStateVector2f.changedSinceLastSync has unexpected offset % instead of 24", ((cast(*void)(*instance.changedSinceLastSync)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrActionStateVector2f.changedSinceLastSync)) == 4, "XrActionStateVector2f.changedSinceLastSync has unexpected size % instead of 4", size_of(type_of(XrActionStateVector2f.changedSinceLastSync)));
    assert(((cast(*void)(*instance.lastChangeTime)) - cast(*void)(*instance)) == 32, "XrActionStateVector2f.lastChangeTime has unexpected offset % instead of 32", ((cast(*void)(*instance.lastChangeTime)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrActionStateVector2f.lastChangeTime)) == 8, "XrActionStateVector2f.lastChangeTime has unexpected size % instead of 8", size_of(type_of(XrActionStateVector2f.lastChangeTime)));
    assert(((cast(*void)(*instance.isActive)) - cast(*void)(*instance)) == 40, "XrActionStateVector2f.isActive has unexpected offset % instead of 40", ((cast(*void)(*instance.isActive)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrActionStateVector2f.isActive)) == 4, "XrActionStateVector2f.isActive has unexpected size % instead of 4", size_of(type_of(XrActionStateVector2f.isActive)));
    assert(size_of(XrActionStateVector2f) == 48, "XrActionStateVector2f has size % instead of 48", size_of(XrActionStateVector2f));
}

XrActionStatePose :: struct {
    type:     XrStructureType;
    next:     *void;
    isActive: XrBool32;
}
#run {
    instance: XrActionStatePose;
    assert(((cast(*void)(*instance.type)) - cast(*void)(*instance)) == 0, "XrActionStatePose.type has unexpected offset % instead of 0", ((cast(*void)(*instance.type)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrActionStatePose.type)) == 4, "XrActionStatePose.type has unexpected size % instead of 4", size_of(type_of(XrActionStatePose.type)));
    assert(((cast(*void)(*instance.next)) - cast(*void)(*instance)) == 8, "XrActionStatePose.next has unexpected offset % instead of 8", ((cast(*void)(*instance.next)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrActionStatePose.next)) == 8, "XrActionStatePose.next has unexpected size % instead of 8", size_of(type_of(XrActionStatePose.next)));
    assert(((cast(*void)(*instance.isActive)) - cast(*void)(*instance)) == 16, "XrActionStatePose.isActive has unexpected offset % instead of 16", ((cast(*void)(*instance.isActive)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrActionStatePose.isActive)) == 4, "XrActionStatePose.isActive has unexpected size % instead of 4", size_of(type_of(XrActionStatePose.isActive)));
    assert(size_of(XrActionStatePose) == 24, "XrActionStatePose has size % instead of 24", size_of(XrActionStatePose));
}

XrActiveActionSet :: struct {
    actionSet:     XrActionSet;
    subactionPath: XrPath;
}
#run {
    instance: XrActiveActionSet;
    assert(((cast(*void)(*instance.actionSet)) - cast(*void)(*instance)) == 0, "XrActiveActionSet.actionSet has unexpected offset % instead of 0", ((cast(*void)(*instance.actionSet)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrActiveActionSet.actionSet)) == 8, "XrActiveActionSet.actionSet has unexpected size % instead of 8", size_of(type_of(XrActiveActionSet.actionSet)));
    assert(((cast(*void)(*instance.subactionPath)) - cast(*void)(*instance)) == 8, "XrActiveActionSet.subactionPath has unexpected offset % instead of 8", ((cast(*void)(*instance.subactionPath)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrActiveActionSet.subactionPath)) == 8, "XrActiveActionSet.subactionPath has unexpected size % instead of 8", size_of(type_of(XrActiveActionSet.subactionPath)));
    assert(size_of(XrActiveActionSet) == 16, "XrActiveActionSet has size % instead of 16", size_of(XrActiveActionSet));
}

XrActionsSyncInfo :: struct {
    type:                  XrStructureType;
    next:                  *void;
    countActiveActionSets: u32;
    activeActionSets:      *XrActiveActionSet;
}
#run {
    instance: XrActionsSyncInfo;
    assert(((cast(*void)(*instance.type)) - cast(*void)(*instance)) == 0, "XrActionsSyncInfo.type has unexpected offset % instead of 0", ((cast(*void)(*instance.type)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrActionsSyncInfo.type)) == 4, "XrActionsSyncInfo.type has unexpected size % instead of 4", size_of(type_of(XrActionsSyncInfo.type)));
    assert(((cast(*void)(*instance.next)) - cast(*void)(*instance)) == 8, "XrActionsSyncInfo.next has unexpected offset % instead of 8", ((cast(*void)(*instance.next)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrActionsSyncInfo.next)) == 8, "XrActionsSyncInfo.next has unexpected size % instead of 8", size_of(type_of(XrActionsSyncInfo.next)));
    assert(((cast(*void)(*instance.countActiveActionSets)) - cast(*void)(*instance)) == 16, "XrActionsSyncInfo.countActiveActionSets has unexpected offset % instead of 16", ((cast(*void)(*instance.countActiveActionSets)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrActionsSyncInfo.countActiveActionSets)) == 4, "XrActionsSyncInfo.countActiveActionSets has unexpected size % instead of 4", size_of(type_of(XrActionsSyncInfo.countActiveActionSets)));
    assert(((cast(*void)(*instance.activeActionSets)) - cast(*void)(*instance)) == 24, "XrActionsSyncInfo.activeActionSets has unexpected offset % instead of 24", ((cast(*void)(*instance.activeActionSets)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrActionsSyncInfo.activeActionSets)) == 8, "XrActionsSyncInfo.activeActionSets has unexpected size % instead of 8", size_of(type_of(XrActionsSyncInfo.activeActionSets)));
    assert(size_of(XrActionsSyncInfo) == 32, "XrActionsSyncInfo has size % instead of 32", size_of(XrActionsSyncInfo));
}

XrBoundSourcesForActionEnumerateInfo :: struct {
    type:   XrStructureType;
    next:   *void;
    action: XrAction;
}
#run {
    instance: XrBoundSourcesForActionEnumerateInfo;
    assert(((cast(*void)(*instance.type)) - cast(*void)(*instance)) == 0, "XrBoundSourcesForActionEnumerateInfo.type has unexpected offset % instead of 0", ((cast(*void)(*instance.type)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrBoundSourcesForActionEnumerateInfo.type)) == 4, "XrBoundSourcesForActionEnumerateInfo.type has unexpected size % instead of 4", size_of(type_of(XrBoundSourcesForActionEnumerateInfo.type)));
    assert(((cast(*void)(*instance.next)) - cast(*void)(*instance)) == 8, "XrBoundSourcesForActionEnumerateInfo.next has unexpected offset % instead of 8", ((cast(*void)(*instance.next)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrBoundSourcesForActionEnumerateInfo.next)) == 8, "XrBoundSourcesForActionEnumerateInfo.next has unexpected size % instead of 8", size_of(type_of(XrBoundSourcesForActionEnumerateInfo.next)));
    assert(((cast(*void)(*instance.action)) - cast(*void)(*instance)) == 16, "XrBoundSourcesForActionEnumerateInfo.action has unexpected offset % instead of 16", ((cast(*void)(*instance.action)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrBoundSourcesForActionEnumerateInfo.action)) == 8, "XrBoundSourcesForActionEnumerateInfo.action has unexpected size % instead of 8", size_of(type_of(XrBoundSourcesForActionEnumerateInfo.action)));
    assert(size_of(XrBoundSourcesForActionEnumerateInfo) == 24, "XrBoundSourcesForActionEnumerateInfo has size % instead of 24", size_of(XrBoundSourcesForActionEnumerateInfo));
}

XrInputSourceLocalizedNameGetInfo :: struct {
    type:            XrStructureType;
    next:            *void;
    sourcePath:      XrPath;
    whichComponents: XrInputSourceLocalizedNameFlags;
}
#run {
    instance: XrInputSourceLocalizedNameGetInfo;
    assert(((cast(*void)(*instance.type)) - cast(*void)(*instance)) == 0, "XrInputSourceLocalizedNameGetInfo.type has unexpected offset % instead of 0", ((cast(*void)(*instance.type)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrInputSourceLocalizedNameGetInfo.type)) == 4, "XrInputSourceLocalizedNameGetInfo.type has unexpected size % instead of 4", size_of(type_of(XrInputSourceLocalizedNameGetInfo.type)));
    assert(((cast(*void)(*instance.next)) - cast(*void)(*instance)) == 8, "XrInputSourceLocalizedNameGetInfo.next has unexpected offset % instead of 8", ((cast(*void)(*instance.next)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrInputSourceLocalizedNameGetInfo.next)) == 8, "XrInputSourceLocalizedNameGetInfo.next has unexpected size % instead of 8", size_of(type_of(XrInputSourceLocalizedNameGetInfo.next)));
    assert(((cast(*void)(*instance.sourcePath)) - cast(*void)(*instance)) == 16, "XrInputSourceLocalizedNameGetInfo.sourcePath has unexpected offset % instead of 16", ((cast(*void)(*instance.sourcePath)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrInputSourceLocalizedNameGetInfo.sourcePath)) == 8, "XrInputSourceLocalizedNameGetInfo.sourcePath has unexpected size % instead of 8", size_of(type_of(XrInputSourceLocalizedNameGetInfo.sourcePath)));
    assert(((cast(*void)(*instance.whichComponents)) - cast(*void)(*instance)) == 24, "XrInputSourceLocalizedNameGetInfo.whichComponents has unexpected offset % instead of 24", ((cast(*void)(*instance.whichComponents)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrInputSourceLocalizedNameGetInfo.whichComponents)) == 8, "XrInputSourceLocalizedNameGetInfo.whichComponents has unexpected size % instead of 8", size_of(type_of(XrInputSourceLocalizedNameGetInfo.whichComponents)));
    assert(size_of(XrInputSourceLocalizedNameGetInfo) == 32, "XrInputSourceLocalizedNameGetInfo has size % instead of 32", size_of(XrInputSourceLocalizedNameGetInfo));
}

XrHapticActionInfo :: struct {
    type:          XrStructureType;
    next:          *void;
    action:        XrAction;
    subactionPath: XrPath;
}
#run {
    instance: XrHapticActionInfo;
    assert(((cast(*void)(*instance.type)) - cast(*void)(*instance)) == 0, "XrHapticActionInfo.type has unexpected offset % instead of 0", ((cast(*void)(*instance.type)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrHapticActionInfo.type)) == 4, "XrHapticActionInfo.type has unexpected size % instead of 4", size_of(type_of(XrHapticActionInfo.type)));
    assert(((cast(*void)(*instance.next)) - cast(*void)(*instance)) == 8, "XrHapticActionInfo.next has unexpected offset % instead of 8", ((cast(*void)(*instance.next)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrHapticActionInfo.next)) == 8, "XrHapticActionInfo.next has unexpected size % instead of 8", size_of(type_of(XrHapticActionInfo.next)));
    assert(((cast(*void)(*instance.action)) - cast(*void)(*instance)) == 16, "XrHapticActionInfo.action has unexpected offset % instead of 16", ((cast(*void)(*instance.action)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrHapticActionInfo.action)) == 8, "XrHapticActionInfo.action has unexpected size % instead of 8", size_of(type_of(XrHapticActionInfo.action)));
    assert(((cast(*void)(*instance.subactionPath)) - cast(*void)(*instance)) == 24, "XrHapticActionInfo.subactionPath has unexpected offset % instead of 24", ((cast(*void)(*instance.subactionPath)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrHapticActionInfo.subactionPath)) == 8, "XrHapticActionInfo.subactionPath has unexpected size % instead of 8", size_of(type_of(XrHapticActionInfo.subactionPath)));
    assert(size_of(XrHapticActionInfo) == 32, "XrHapticActionInfo has size % instead of 32", size_of(XrHapticActionInfo));
}

XrHapticBaseHeader :: struct {
    type: XrStructureType;
    next: *void;
}
#run {
    instance: XrHapticBaseHeader;
    assert(((cast(*void)(*instance.type)) - cast(*void)(*instance)) == 0, "XrHapticBaseHeader.type has unexpected offset % instead of 0", ((cast(*void)(*instance.type)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrHapticBaseHeader.type)) == 4, "XrHapticBaseHeader.type has unexpected size % instead of 4", size_of(type_of(XrHapticBaseHeader.type)));
    assert(((cast(*void)(*instance.next)) - cast(*void)(*instance)) == 8, "XrHapticBaseHeader.next has unexpected offset % instead of 8", ((cast(*void)(*instance.next)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrHapticBaseHeader.next)) == 8, "XrHapticBaseHeader.next has unexpected size % instead of 8", size_of(type_of(XrHapticBaseHeader.next)));
    assert(size_of(XrHapticBaseHeader) == 16, "XrHapticBaseHeader has size % instead of 16", size_of(XrHapticBaseHeader));
}

XrBaseInStructure :: struct {
    type: XrStructureType;
    next: *XrBaseInStructure;
}
#run {
    instance: XrBaseInStructure;
    assert(((cast(*void)(*instance.type)) - cast(*void)(*instance)) == 0, "XrBaseInStructure.type has unexpected offset % instead of 0", ((cast(*void)(*instance.type)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrBaseInStructure.type)) == 4, "XrBaseInStructure.type has unexpected size % instead of 4", size_of(type_of(XrBaseInStructure.type)));
    assert(((cast(*void)(*instance.next)) - cast(*void)(*instance)) == 8, "XrBaseInStructure.next has unexpected offset % instead of 8", ((cast(*void)(*instance.next)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrBaseInStructure.next)) == 8, "XrBaseInStructure.next has unexpected size % instead of 8", size_of(type_of(XrBaseInStructure.next)));
    assert(size_of(XrBaseInStructure) == 16, "XrBaseInStructure has size % instead of 16", size_of(XrBaseInStructure));
}

XrBaseOutStructure :: struct {
    type: XrStructureType;
    next: *XrBaseOutStructure;
}
#run {
    instance: XrBaseOutStructure;
    assert(((cast(*void)(*instance.type)) - cast(*void)(*instance)) == 0, "XrBaseOutStructure.type has unexpected offset % instead of 0", ((cast(*void)(*instance.type)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrBaseOutStructure.type)) == 4, "XrBaseOutStructure.type has unexpected size % instead of 4", size_of(type_of(XrBaseOutStructure.type)));
    assert(((cast(*void)(*instance.next)) - cast(*void)(*instance)) == 8, "XrBaseOutStructure.next has unexpected offset % instead of 8", ((cast(*void)(*instance.next)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrBaseOutStructure.next)) == 8, "XrBaseOutStructure.next has unexpected size % instead of 8", size_of(type_of(XrBaseOutStructure.next)));
    assert(size_of(XrBaseOutStructure) == 16, "XrBaseOutStructure has size % instead of 16", size_of(XrBaseOutStructure));
}

XrOffset2Di :: struct {
    x: s32;
    y: s32;
}
#run {
    instance: XrOffset2Di;
    assert(((cast(*void)(*instance.x)) - cast(*void)(*instance)) == 0, "XrOffset2Di.x has unexpected offset % instead of 0", ((cast(*void)(*instance.x)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrOffset2Di.x)) == 4, "XrOffset2Di.x has unexpected size % instead of 4", size_of(type_of(XrOffset2Di.x)));
    assert(((cast(*void)(*instance.y)) - cast(*void)(*instance)) == 4, "XrOffset2Di.y has unexpected offset % instead of 4", ((cast(*void)(*instance.y)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrOffset2Di.y)) == 4, "XrOffset2Di.y has unexpected size % instead of 4", size_of(type_of(XrOffset2Di.y)));
    assert(size_of(XrOffset2Di) == 8, "XrOffset2Di has size % instead of 8", size_of(XrOffset2Di));
}

XrExtent2Di :: struct {
    width:  s32;
    height: s32;
}
#run {
    instance: XrExtent2Di;
    assert(((cast(*void)(*instance.width)) - cast(*void)(*instance)) == 0, "XrExtent2Di.width has unexpected offset % instead of 0", ((cast(*void)(*instance.width)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrExtent2Di.width)) == 4, "XrExtent2Di.width has unexpected size % instead of 4", size_of(type_of(XrExtent2Di.width)));
    assert(((cast(*void)(*instance.height)) - cast(*void)(*instance)) == 4, "XrExtent2Di.height has unexpected offset % instead of 4", ((cast(*void)(*instance.height)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrExtent2Di.height)) == 4, "XrExtent2Di.height has unexpected size % instead of 4", size_of(type_of(XrExtent2Di.height)));
    assert(size_of(XrExtent2Di) == 8, "XrExtent2Di has size % instead of 8", size_of(XrExtent2Di));
}

XrRect2Di :: struct {
    offset: XrOffset2Di;
    extent: XrExtent2Di;
}
#run {
    instance: XrRect2Di;
    assert(((cast(*void)(*instance.offset)) - cast(*void)(*instance)) == 0, "XrRect2Di.offset has unexpected offset % instead of 0", ((cast(*void)(*instance.offset)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrRect2Di.offset)) == 8, "XrRect2Di.offset has unexpected size % instead of 8", size_of(type_of(XrRect2Di.offset)));
    assert(((cast(*void)(*instance.extent)) - cast(*void)(*instance)) == 8, "XrRect2Di.extent has unexpected offset % instead of 8", ((cast(*void)(*instance.extent)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrRect2Di.extent)) == 8, "XrRect2Di.extent has unexpected size % instead of 8", size_of(type_of(XrRect2Di.extent)));
    assert(size_of(XrRect2Di) == 16, "XrRect2Di has size % instead of 16", size_of(XrRect2Di));
}

XrSwapchainSubImage :: struct {
    swapchain:       XrSwapchain;
    imageRect:       XrRect2Di;
    imageArrayIndex: u32;
}
#run {
    instance: XrSwapchainSubImage;
    assert(((cast(*void)(*instance.swapchain)) - cast(*void)(*instance)) == 0, "XrSwapchainSubImage.swapchain has unexpected offset % instead of 0", ((cast(*void)(*instance.swapchain)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrSwapchainSubImage.swapchain)) == 8, "XrSwapchainSubImage.swapchain has unexpected size % instead of 8", size_of(type_of(XrSwapchainSubImage.swapchain)));
    assert(((cast(*void)(*instance.imageRect)) - cast(*void)(*instance)) == 8, "XrSwapchainSubImage.imageRect has unexpected offset % instead of 8", ((cast(*void)(*instance.imageRect)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrSwapchainSubImage.imageRect)) == 16, "XrSwapchainSubImage.imageRect has unexpected size % instead of 16", size_of(type_of(XrSwapchainSubImage.imageRect)));
    assert(((cast(*void)(*instance.imageArrayIndex)) - cast(*void)(*instance)) == 24, "XrSwapchainSubImage.imageArrayIndex has unexpected offset % instead of 24", ((cast(*void)(*instance.imageArrayIndex)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrSwapchainSubImage.imageArrayIndex)) == 4, "XrSwapchainSubImage.imageArrayIndex has unexpected size % instead of 4", size_of(type_of(XrSwapchainSubImage.imageArrayIndex)));
    assert(size_of(XrSwapchainSubImage) == 32, "XrSwapchainSubImage has size % instead of 32", size_of(XrSwapchainSubImage));
}

XrCompositionLayerProjectionView :: struct {
    type:     XrStructureType;
    next:     *void;
    pose:     XrPosef;
    fov:      XrFovf;
    subImage: XrSwapchainSubImage;
}
#run {
    instance: XrCompositionLayerProjectionView;
    assert(((cast(*void)(*instance.type)) - cast(*void)(*instance)) == 0, "XrCompositionLayerProjectionView.type has unexpected offset % instead of 0", ((cast(*void)(*instance.type)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrCompositionLayerProjectionView.type)) == 4, "XrCompositionLayerProjectionView.type has unexpected size % instead of 4", size_of(type_of(XrCompositionLayerProjectionView.type)));
    assert(((cast(*void)(*instance.next)) - cast(*void)(*instance)) == 8, "XrCompositionLayerProjectionView.next has unexpected offset % instead of 8", ((cast(*void)(*instance.next)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrCompositionLayerProjectionView.next)) == 8, "XrCompositionLayerProjectionView.next has unexpected size % instead of 8", size_of(type_of(XrCompositionLayerProjectionView.next)));
    assert(((cast(*void)(*instance.pose)) - cast(*void)(*instance)) == 16, "XrCompositionLayerProjectionView.pose has unexpected offset % instead of 16", ((cast(*void)(*instance.pose)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrCompositionLayerProjectionView.pose)) == 28, "XrCompositionLayerProjectionView.pose has unexpected size % instead of 28", size_of(type_of(XrCompositionLayerProjectionView.pose)));
    assert(((cast(*void)(*instance.fov)) - cast(*void)(*instance)) == 44, "XrCompositionLayerProjectionView.fov has unexpected offset % instead of 44", ((cast(*void)(*instance.fov)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrCompositionLayerProjectionView.fov)) == 16, "XrCompositionLayerProjectionView.fov has unexpected size % instead of 16", size_of(type_of(XrCompositionLayerProjectionView.fov)));
    assert(((cast(*void)(*instance.subImage)) - cast(*void)(*instance)) == 64, "XrCompositionLayerProjectionView.subImage has unexpected offset % instead of 64", ((cast(*void)(*instance.subImage)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrCompositionLayerProjectionView.subImage)) == 32, "XrCompositionLayerProjectionView.subImage has unexpected size % instead of 32", size_of(type_of(XrCompositionLayerProjectionView.subImage)));
    assert(size_of(XrCompositionLayerProjectionView) == 96, "XrCompositionLayerProjectionView has size % instead of 96", size_of(XrCompositionLayerProjectionView));
}

XrCompositionLayerProjection :: struct {
    type:       XrStructureType;
    next:       *void;
    layerFlags: XrCompositionLayerFlags;
    space:      XrSpace;
    viewCount:  u32;
    views:      *XrCompositionLayerProjectionView;
}
#run {
    instance: XrCompositionLayerProjection;
    assert(((cast(*void)(*instance.type)) - cast(*void)(*instance)) == 0, "XrCompositionLayerProjection.type has unexpected offset % instead of 0", ((cast(*void)(*instance.type)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrCompositionLayerProjection.type)) == 4, "XrCompositionLayerProjection.type has unexpected size % instead of 4", size_of(type_of(XrCompositionLayerProjection.type)));
    assert(((cast(*void)(*instance.next)) - cast(*void)(*instance)) == 8, "XrCompositionLayerProjection.next has unexpected offset % instead of 8", ((cast(*void)(*instance.next)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrCompositionLayerProjection.next)) == 8, "XrCompositionLayerProjection.next has unexpected size % instead of 8", size_of(type_of(XrCompositionLayerProjection.next)));
    assert(((cast(*void)(*instance.layerFlags)) - cast(*void)(*instance)) == 16, "XrCompositionLayerProjection.layerFlags has unexpected offset % instead of 16", ((cast(*void)(*instance.layerFlags)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrCompositionLayerProjection.layerFlags)) == 8, "XrCompositionLayerProjection.layerFlags has unexpected size % instead of 8", size_of(type_of(XrCompositionLayerProjection.layerFlags)));
    assert(((cast(*void)(*instance.space)) - cast(*void)(*instance)) == 24, "XrCompositionLayerProjection.space has unexpected offset % instead of 24", ((cast(*void)(*instance.space)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrCompositionLayerProjection.space)) == 8, "XrCompositionLayerProjection.space has unexpected size % instead of 8", size_of(type_of(XrCompositionLayerProjection.space)));
    assert(((cast(*void)(*instance.viewCount)) - cast(*void)(*instance)) == 32, "XrCompositionLayerProjection.viewCount has unexpected offset % instead of 32", ((cast(*void)(*instance.viewCount)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrCompositionLayerProjection.viewCount)) == 4, "XrCompositionLayerProjection.viewCount has unexpected size % instead of 4", size_of(type_of(XrCompositionLayerProjection.viewCount)));
    assert(((cast(*void)(*instance.views)) - cast(*void)(*instance)) == 40, "XrCompositionLayerProjection.views has unexpected offset % instead of 40", ((cast(*void)(*instance.views)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrCompositionLayerProjection.views)) == 8, "XrCompositionLayerProjection.views has unexpected size % instead of 8", size_of(type_of(XrCompositionLayerProjection.views)));
    assert(size_of(XrCompositionLayerProjection) == 48, "XrCompositionLayerProjection has size % instead of 48", size_of(XrCompositionLayerProjection));
}

XrCompositionLayerQuad :: struct {
    type:          XrStructureType;
    next:          *void;
    layerFlags:    XrCompositionLayerFlags;
    space:         XrSpace;
    eyeVisibility: XrEyeVisibility;
    subImage:      XrSwapchainSubImage;
    pose:          XrPosef;
    size:          XrExtent2Df;
}
#run {
    instance: XrCompositionLayerQuad;
    assert(((cast(*void)(*instance.type)) - cast(*void)(*instance)) == 0, "XrCompositionLayerQuad.type has unexpected offset % instead of 0", ((cast(*void)(*instance.type)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrCompositionLayerQuad.type)) == 4, "XrCompositionLayerQuad.type has unexpected size % instead of 4", size_of(type_of(XrCompositionLayerQuad.type)));
    assert(((cast(*void)(*instance.next)) - cast(*void)(*instance)) == 8, "XrCompositionLayerQuad.next has unexpected offset % instead of 8", ((cast(*void)(*instance.next)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrCompositionLayerQuad.next)) == 8, "XrCompositionLayerQuad.next has unexpected size % instead of 8", size_of(type_of(XrCompositionLayerQuad.next)));
    assert(((cast(*void)(*instance.layerFlags)) - cast(*void)(*instance)) == 16, "XrCompositionLayerQuad.layerFlags has unexpected offset % instead of 16", ((cast(*void)(*instance.layerFlags)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrCompositionLayerQuad.layerFlags)) == 8, "XrCompositionLayerQuad.layerFlags has unexpected size % instead of 8", size_of(type_of(XrCompositionLayerQuad.layerFlags)));
    assert(((cast(*void)(*instance.space)) - cast(*void)(*instance)) == 24, "XrCompositionLayerQuad.space has unexpected offset % instead of 24", ((cast(*void)(*instance.space)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrCompositionLayerQuad.space)) == 8, "XrCompositionLayerQuad.space has unexpected size % instead of 8", size_of(type_of(XrCompositionLayerQuad.space)));
    assert(((cast(*void)(*instance.eyeVisibility)) - cast(*void)(*instance)) == 32, "XrCompositionLayerQuad.eyeVisibility has unexpected offset % instead of 32", ((cast(*void)(*instance.eyeVisibility)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrCompositionLayerQuad.eyeVisibility)) == 4, "XrCompositionLayerQuad.eyeVisibility has unexpected size % instead of 4", size_of(type_of(XrCompositionLayerQuad.eyeVisibility)));
    assert(((cast(*void)(*instance.subImage)) - cast(*void)(*instance)) == 40, "XrCompositionLayerQuad.subImage has unexpected offset % instead of 40", ((cast(*void)(*instance.subImage)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrCompositionLayerQuad.subImage)) == 32, "XrCompositionLayerQuad.subImage has unexpected size % instead of 32", size_of(type_of(XrCompositionLayerQuad.subImage)));
    assert(((cast(*void)(*instance.pose)) - cast(*void)(*instance)) == 72, "XrCompositionLayerQuad.pose has unexpected offset % instead of 72", ((cast(*void)(*instance.pose)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrCompositionLayerQuad.pose)) == 28, "XrCompositionLayerQuad.pose has unexpected size % instead of 28", size_of(type_of(XrCompositionLayerQuad.pose)));
    assert(((cast(*void)(*instance.size)) - cast(*void)(*instance)) == 100, "XrCompositionLayerQuad.size has unexpected offset % instead of 100", ((cast(*void)(*instance.size)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrCompositionLayerQuad.size)) == 8, "XrCompositionLayerQuad.size has unexpected size % instead of 8", size_of(type_of(XrCompositionLayerQuad.size)));
    assert(size_of(XrCompositionLayerQuad) == 112, "XrCompositionLayerQuad has size % instead of 112", size_of(XrCompositionLayerQuad));
}

XrEventDataBaseHeader :: struct {
    type: XrStructureType;
    next: *void;
}
#run {
    instance: XrEventDataBaseHeader;
    assert(((cast(*void)(*instance.type)) - cast(*void)(*instance)) == 0, "XrEventDataBaseHeader.type has unexpected offset % instead of 0", ((cast(*void)(*instance.type)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrEventDataBaseHeader.type)) == 4, "XrEventDataBaseHeader.type has unexpected size % instead of 4", size_of(type_of(XrEventDataBaseHeader.type)));
    assert(((cast(*void)(*instance.next)) - cast(*void)(*instance)) == 8, "XrEventDataBaseHeader.next has unexpected offset % instead of 8", ((cast(*void)(*instance.next)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrEventDataBaseHeader.next)) == 8, "XrEventDataBaseHeader.next has unexpected size % instead of 8", size_of(type_of(XrEventDataBaseHeader.next)));
    assert(size_of(XrEventDataBaseHeader) == 16, "XrEventDataBaseHeader has size % instead of 16", size_of(XrEventDataBaseHeader));
}

XrEventDataEventsLost :: struct {
    type:           XrStructureType;
    next:           *void;
    lostEventCount: u32;
}
#run {
    instance: XrEventDataEventsLost;
    assert(((cast(*void)(*instance.type)) - cast(*void)(*instance)) == 0, "XrEventDataEventsLost.type has unexpected offset % instead of 0", ((cast(*void)(*instance.type)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrEventDataEventsLost.type)) == 4, "XrEventDataEventsLost.type has unexpected size % instead of 4", size_of(type_of(XrEventDataEventsLost.type)));
    assert(((cast(*void)(*instance.next)) - cast(*void)(*instance)) == 8, "XrEventDataEventsLost.next has unexpected offset % instead of 8", ((cast(*void)(*instance.next)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrEventDataEventsLost.next)) == 8, "XrEventDataEventsLost.next has unexpected size % instead of 8", size_of(type_of(XrEventDataEventsLost.next)));
    assert(((cast(*void)(*instance.lostEventCount)) - cast(*void)(*instance)) == 16, "XrEventDataEventsLost.lostEventCount has unexpected offset % instead of 16", ((cast(*void)(*instance.lostEventCount)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrEventDataEventsLost.lostEventCount)) == 4, "XrEventDataEventsLost.lostEventCount has unexpected size % instead of 4", size_of(type_of(XrEventDataEventsLost.lostEventCount)));
    assert(size_of(XrEventDataEventsLost) == 24, "XrEventDataEventsLost has size % instead of 24", size_of(XrEventDataEventsLost));
}

XrEventDataInstanceLossPending :: struct {
    type:     XrStructureType;
    next:     *void;
    lossTime: XrTime;
}
#run {
    instance: XrEventDataInstanceLossPending;
    assert(((cast(*void)(*instance.type)) - cast(*void)(*instance)) == 0, "XrEventDataInstanceLossPending.type has unexpected offset % instead of 0", ((cast(*void)(*instance.type)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrEventDataInstanceLossPending.type)) == 4, "XrEventDataInstanceLossPending.type has unexpected size % instead of 4", size_of(type_of(XrEventDataInstanceLossPending.type)));
    assert(((cast(*void)(*instance.next)) - cast(*void)(*instance)) == 8, "XrEventDataInstanceLossPending.next has unexpected offset % instead of 8", ((cast(*void)(*instance.next)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrEventDataInstanceLossPending.next)) == 8, "XrEventDataInstanceLossPending.next has unexpected size % instead of 8", size_of(type_of(XrEventDataInstanceLossPending.next)));
    assert(((cast(*void)(*instance.lossTime)) - cast(*void)(*instance)) == 16, "XrEventDataInstanceLossPending.lossTime has unexpected offset % instead of 16", ((cast(*void)(*instance.lossTime)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrEventDataInstanceLossPending.lossTime)) == 8, "XrEventDataInstanceLossPending.lossTime has unexpected size % instead of 8", size_of(type_of(XrEventDataInstanceLossPending.lossTime)));
    assert(size_of(XrEventDataInstanceLossPending) == 24, "XrEventDataInstanceLossPending has size % instead of 24", size_of(XrEventDataInstanceLossPending));
}

XrEventDataSessionStateChanged :: struct {
    type:    XrStructureType;
    next:    *void;
    session: XrSession;
    state:   XrSessionState;
    time:    XrTime;
}
#run {
    instance: XrEventDataSessionStateChanged;
    assert(((cast(*void)(*instance.type)) - cast(*void)(*instance)) == 0, "XrEventDataSessionStateChanged.type has unexpected offset % instead of 0", ((cast(*void)(*instance.type)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrEventDataSessionStateChanged.type)) == 4, "XrEventDataSessionStateChanged.type has unexpected size % instead of 4", size_of(type_of(XrEventDataSessionStateChanged.type)));
    assert(((cast(*void)(*instance.next)) - cast(*void)(*instance)) == 8, "XrEventDataSessionStateChanged.next has unexpected offset % instead of 8", ((cast(*void)(*instance.next)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrEventDataSessionStateChanged.next)) == 8, "XrEventDataSessionStateChanged.next has unexpected size % instead of 8", size_of(type_of(XrEventDataSessionStateChanged.next)));
    assert(((cast(*void)(*instance.session)) - cast(*void)(*instance)) == 16, "XrEventDataSessionStateChanged.session has unexpected offset % instead of 16", ((cast(*void)(*instance.session)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrEventDataSessionStateChanged.session)) == 8, "XrEventDataSessionStateChanged.session has unexpected size % instead of 8", size_of(type_of(XrEventDataSessionStateChanged.session)));
    assert(((cast(*void)(*instance.state)) - cast(*void)(*instance)) == 24, "XrEventDataSessionStateChanged.state has unexpected offset % instead of 24", ((cast(*void)(*instance.state)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrEventDataSessionStateChanged.state)) == 4, "XrEventDataSessionStateChanged.state has unexpected size % instead of 4", size_of(type_of(XrEventDataSessionStateChanged.state)));
    assert(((cast(*void)(*instance.time)) - cast(*void)(*instance)) == 32, "XrEventDataSessionStateChanged.time has unexpected offset % instead of 32", ((cast(*void)(*instance.time)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrEventDataSessionStateChanged.time)) == 8, "XrEventDataSessionStateChanged.time has unexpected size % instead of 8", size_of(type_of(XrEventDataSessionStateChanged.time)));
    assert(size_of(XrEventDataSessionStateChanged) == 40, "XrEventDataSessionStateChanged has size % instead of 40", size_of(XrEventDataSessionStateChanged));
}

XrEventDataReferenceSpaceChangePending :: struct {
    type:                XrStructureType;
    next:                *void;
    session:             XrSession;
    referenceSpaceType:  XrReferenceSpaceType;
    changeTime:          XrTime;
    poseValid:           XrBool32;
    poseInPreviousSpace: XrPosef;
}
#run {
    instance: XrEventDataReferenceSpaceChangePending;
    assert(((cast(*void)(*instance.type)) - cast(*void)(*instance)) == 0, "XrEventDataReferenceSpaceChangePending.type has unexpected offset % instead of 0", ((cast(*void)(*instance.type)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrEventDataReferenceSpaceChangePending.type)) == 4, "XrEventDataReferenceSpaceChangePending.type has unexpected size % instead of 4", size_of(type_of(XrEventDataReferenceSpaceChangePending.type)));
    assert(((cast(*void)(*instance.next)) - cast(*void)(*instance)) == 8, "XrEventDataReferenceSpaceChangePending.next has unexpected offset % instead of 8", ((cast(*void)(*instance.next)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrEventDataReferenceSpaceChangePending.next)) == 8, "XrEventDataReferenceSpaceChangePending.next has unexpected size % instead of 8", size_of(type_of(XrEventDataReferenceSpaceChangePending.next)));
    assert(((cast(*void)(*instance.session)) - cast(*void)(*instance)) == 16, "XrEventDataReferenceSpaceChangePending.session has unexpected offset % instead of 16", ((cast(*void)(*instance.session)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrEventDataReferenceSpaceChangePending.session)) == 8, "XrEventDataReferenceSpaceChangePending.session has unexpected size % instead of 8", size_of(type_of(XrEventDataReferenceSpaceChangePending.session)));
    assert(((cast(*void)(*instance.referenceSpaceType)) - cast(*void)(*instance)) == 24, "XrEventDataReferenceSpaceChangePending.referenceSpaceType has unexpected offset % instead of 24", ((cast(*void)(*instance.referenceSpaceType)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrEventDataReferenceSpaceChangePending.referenceSpaceType)) == 4, "XrEventDataReferenceSpaceChangePending.referenceSpaceType has unexpected size % instead of 4", size_of(type_of(XrEventDataReferenceSpaceChangePending.referenceSpaceType)));
    assert(((cast(*void)(*instance.changeTime)) - cast(*void)(*instance)) == 32, "XrEventDataReferenceSpaceChangePending.changeTime has unexpected offset % instead of 32", ((cast(*void)(*instance.changeTime)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrEventDataReferenceSpaceChangePending.changeTime)) == 8, "XrEventDataReferenceSpaceChangePending.changeTime has unexpected size % instead of 8", size_of(type_of(XrEventDataReferenceSpaceChangePending.changeTime)));
    assert(((cast(*void)(*instance.poseValid)) - cast(*void)(*instance)) == 40, "XrEventDataReferenceSpaceChangePending.poseValid has unexpected offset % instead of 40", ((cast(*void)(*instance.poseValid)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrEventDataReferenceSpaceChangePending.poseValid)) == 4, "XrEventDataReferenceSpaceChangePending.poseValid has unexpected size % instead of 4", size_of(type_of(XrEventDataReferenceSpaceChangePending.poseValid)));
    assert(((cast(*void)(*instance.poseInPreviousSpace)) - cast(*void)(*instance)) == 44, "XrEventDataReferenceSpaceChangePending.poseInPreviousSpace has unexpected offset % instead of 44", ((cast(*void)(*instance.poseInPreviousSpace)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrEventDataReferenceSpaceChangePending.poseInPreviousSpace)) == 28, "XrEventDataReferenceSpaceChangePending.poseInPreviousSpace has unexpected size % instead of 28", size_of(type_of(XrEventDataReferenceSpaceChangePending.poseInPreviousSpace)));
    assert(size_of(XrEventDataReferenceSpaceChangePending) == 72, "XrEventDataReferenceSpaceChangePending has size % instead of 72", size_of(XrEventDataReferenceSpaceChangePending));
}

XrEventDataInteractionProfileChanged :: struct {
    type:    XrStructureType;
    next:    *void;
    session: XrSession;
}
#run {
    instance: XrEventDataInteractionProfileChanged;
    assert(((cast(*void)(*instance.type)) - cast(*void)(*instance)) == 0, "XrEventDataInteractionProfileChanged.type has unexpected offset % instead of 0", ((cast(*void)(*instance.type)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrEventDataInteractionProfileChanged.type)) == 4, "XrEventDataInteractionProfileChanged.type has unexpected size % instead of 4", size_of(type_of(XrEventDataInteractionProfileChanged.type)));
    assert(((cast(*void)(*instance.next)) - cast(*void)(*instance)) == 8, "XrEventDataInteractionProfileChanged.next has unexpected offset % instead of 8", ((cast(*void)(*instance.next)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrEventDataInteractionProfileChanged.next)) == 8, "XrEventDataInteractionProfileChanged.next has unexpected size % instead of 8", size_of(type_of(XrEventDataInteractionProfileChanged.next)));
    assert(((cast(*void)(*instance.session)) - cast(*void)(*instance)) == 16, "XrEventDataInteractionProfileChanged.session has unexpected offset % instead of 16", ((cast(*void)(*instance.session)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrEventDataInteractionProfileChanged.session)) == 8, "XrEventDataInteractionProfileChanged.session has unexpected size % instead of 8", size_of(type_of(XrEventDataInteractionProfileChanged.session)));
    assert(size_of(XrEventDataInteractionProfileChanged) == 24, "XrEventDataInteractionProfileChanged has size % instead of 24", size_of(XrEventDataInteractionProfileChanged));
}

XrHapticVibration :: struct {
    type:      XrStructureType;
    next:      *void;
    duration:  XrDuration;
    frequency: float;
    amplitude: float;
}
#run {
    instance: XrHapticVibration;
    assert(((cast(*void)(*instance.type)) - cast(*void)(*instance)) == 0, "XrHapticVibration.type has unexpected offset % instead of 0", ((cast(*void)(*instance.type)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrHapticVibration.type)) == 4, "XrHapticVibration.type has unexpected size % instead of 4", size_of(type_of(XrHapticVibration.type)));
    assert(((cast(*void)(*instance.next)) - cast(*void)(*instance)) == 8, "XrHapticVibration.next has unexpected offset % instead of 8", ((cast(*void)(*instance.next)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrHapticVibration.next)) == 8, "XrHapticVibration.next has unexpected size % instead of 8", size_of(type_of(XrHapticVibration.next)));
    assert(((cast(*void)(*instance.duration)) - cast(*void)(*instance)) == 16, "XrHapticVibration.duration has unexpected offset % instead of 16", ((cast(*void)(*instance.duration)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrHapticVibration.duration)) == 8, "XrHapticVibration.duration has unexpected size % instead of 8", size_of(type_of(XrHapticVibration.duration)));
    assert(((cast(*void)(*instance.frequency)) - cast(*void)(*instance)) == 24, "XrHapticVibration.frequency has unexpected offset % instead of 24", ((cast(*void)(*instance.frequency)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrHapticVibration.frequency)) == 4, "XrHapticVibration.frequency has unexpected size % instead of 4", size_of(type_of(XrHapticVibration.frequency)));
    assert(((cast(*void)(*instance.amplitude)) - cast(*void)(*instance)) == 28, "XrHapticVibration.amplitude has unexpected offset % instead of 28", ((cast(*void)(*instance.amplitude)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrHapticVibration.amplitude)) == 4, "XrHapticVibration.amplitude has unexpected size % instead of 4", size_of(type_of(XrHapticVibration.amplitude)));
    assert(size_of(XrHapticVibration) == 32, "XrHapticVibration has size % instead of 32", size_of(XrHapticVibration));
}

XrOffset2Df :: struct {
    x: float;
    y: float;
}
#run {
    instance: XrOffset2Df;
    assert(((cast(*void)(*instance.x)) - cast(*void)(*instance)) == 0, "XrOffset2Df.x has unexpected offset % instead of 0", ((cast(*void)(*instance.x)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrOffset2Df.x)) == 4, "XrOffset2Df.x has unexpected size % instead of 4", size_of(type_of(XrOffset2Df.x)));
    assert(((cast(*void)(*instance.y)) - cast(*void)(*instance)) == 4, "XrOffset2Df.y has unexpected offset % instead of 4", ((cast(*void)(*instance.y)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrOffset2Df.y)) == 4, "XrOffset2Df.y has unexpected size % instead of 4", size_of(type_of(XrOffset2Df.y)));
    assert(size_of(XrOffset2Df) == 8, "XrOffset2Df has size % instead of 8", size_of(XrOffset2Df));
}

XrRect2Df :: struct {
    offset: XrOffset2Df;
    extent: XrExtent2Df;
}
#run {
    instance: XrRect2Df;
    assert(((cast(*void)(*instance.offset)) - cast(*void)(*instance)) == 0, "XrRect2Df.offset has unexpected offset % instead of 0", ((cast(*void)(*instance.offset)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrRect2Df.offset)) == 8, "XrRect2Df.offset has unexpected size % instead of 8", size_of(type_of(XrRect2Df.offset)));
    assert(((cast(*void)(*instance.extent)) - cast(*void)(*instance)) == 8, "XrRect2Df.extent has unexpected offset % instead of 8", ((cast(*void)(*instance.extent)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrRect2Df.extent)) == 8, "XrRect2Df.extent has unexpected size % instead of 8", size_of(type_of(XrRect2Df.extent)));
    assert(size_of(XrRect2Df) == 16, "XrRect2Df has size % instead of 16", size_of(XrRect2Df));
}

XrVector4f :: struct {
    x: float;
    y: float;
    z: float;
    w: float;
}
#run {
    instance: XrVector4f;
    assert(((cast(*void)(*instance.x)) - cast(*void)(*instance)) == 0, "XrVector4f.x has unexpected offset % instead of 0", ((cast(*void)(*instance.x)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrVector4f.x)) == 4, "XrVector4f.x has unexpected size % instead of 4", size_of(type_of(XrVector4f.x)));
    assert(((cast(*void)(*instance.y)) - cast(*void)(*instance)) == 4, "XrVector4f.y has unexpected offset % instead of 4", ((cast(*void)(*instance.y)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrVector4f.y)) == 4, "XrVector4f.y has unexpected size % instead of 4", size_of(type_of(XrVector4f.y)));
    assert(((cast(*void)(*instance.z)) - cast(*void)(*instance)) == 8, "XrVector4f.z has unexpected offset % instead of 8", ((cast(*void)(*instance.z)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrVector4f.z)) == 4, "XrVector4f.z has unexpected size % instead of 4", size_of(type_of(XrVector4f.z)));
    assert(((cast(*void)(*instance.w)) - cast(*void)(*instance)) == 12, "XrVector4f.w has unexpected offset % instead of 12", ((cast(*void)(*instance.w)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrVector4f.w)) == 4, "XrVector4f.w has unexpected size % instead of 4", size_of(type_of(XrVector4f.w)));
    assert(size_of(XrVector4f) == 16, "XrVector4f has size % instead of 16", size_of(XrVector4f));
}

XrColor4f :: struct {
    r: float;
    g: float;
    b: float;
    a: float;
}
#run {
    instance: XrColor4f;
    assert(((cast(*void)(*instance.r)) - cast(*void)(*instance)) == 0, "XrColor4f.r has unexpected offset % instead of 0", ((cast(*void)(*instance.r)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrColor4f.r)) == 4, "XrColor4f.r has unexpected size % instead of 4", size_of(type_of(XrColor4f.r)));
    assert(((cast(*void)(*instance.g)) - cast(*void)(*instance)) == 4, "XrColor4f.g has unexpected offset % instead of 4", ((cast(*void)(*instance.g)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrColor4f.g)) == 4, "XrColor4f.g has unexpected size % instead of 4", size_of(type_of(XrColor4f.g)));
    assert(((cast(*void)(*instance.b)) - cast(*void)(*instance)) == 8, "XrColor4f.b has unexpected offset % instead of 8", ((cast(*void)(*instance.b)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrColor4f.b)) == 4, "XrColor4f.b has unexpected size % instead of 4", size_of(type_of(XrColor4f.b)));
    assert(((cast(*void)(*instance.a)) - cast(*void)(*instance)) == 12, "XrColor4f.a has unexpected offset % instead of 12", ((cast(*void)(*instance.a)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrColor4f.a)) == 4, "XrColor4f.a has unexpected size % instead of 4", size_of(type_of(XrColor4f.a)));
    assert(size_of(XrColor4f) == 16, "XrColor4f has size % instead of 16", size_of(XrColor4f));
}

PFN_xrGetInstanceProcAddr :: #type (a0: XrInstance, a1: *u8, a2: *PFN_xrVoidFunction) -> XrResult #c_call;
PFN_xrEnumerateApiLayerProperties :: #type (a0: u32, a1: *u32, a2: *XrApiLayerProperties) -> XrResult #c_call;
PFN_xrEnumerateInstanceExtensionProperties :: #type (a0: *u8, a1: u32, a2: *u32, a3: *XrExtensionProperties) -> XrResult #c_call;
PFN_xrCreateInstance :: #type (a0: *XrInstanceCreateInfo, a1: *XrInstance) -> XrResult #c_call;
PFN_xrDestroyInstance :: #type (a0: XrInstance) -> XrResult #c_call;
PFN_xrGetInstanceProperties :: #type (a0: XrInstance, a1: *XrInstanceProperties) -> XrResult #c_call;
PFN_xrPollEvent :: #type (a0: XrInstance, a1: *XrEventDataBuffer) -> XrResult #c_call;
PFN_xrResultToString :: #type (a0: XrInstance, a1: XrResult, a2: *[64] u8) -> XrResult #c_call;
PFN_xrStructureTypeToString :: #type (a0: XrInstance, a1: XrStructureType, a2: *[64] u8) -> XrResult #c_call;
PFN_xrGetSystem :: #type (a0: XrInstance, a1: *XrSystemGetInfo, a2: *XrSystemId) -> XrResult #c_call;
PFN_xrGetSystemProperties :: #type (a0: XrInstance, a1: XrSystemId, a2: *XrSystemProperties) -> XrResult #c_call;
PFN_xrEnumerateEnvironmentBlendModes :: #type (a0: XrInstance, a1: XrSystemId, a2: XrViewConfigurationType, a3: u32, a4: *u32, a5: *XrEnvironmentBlendMode) -> XrResult #c_call;
PFN_xrCreateSession :: #type (a0: XrInstance, a1: *XrSessionCreateInfo, a2: *XrSession) -> XrResult #c_call;
PFN_xrDestroySession :: #type (a0: XrSession) -> XrResult #c_call;
PFN_xrEnumerateReferenceSpaces :: #type (a0: XrSession, a1: u32, a2: *u32, a3: *XrReferenceSpaceType) -> XrResult #c_call;
PFN_xrCreateReferenceSpace :: #type (a0: XrSession, a1: *XrReferenceSpaceCreateInfo, a2: *XrSpace) -> XrResult #c_call;
PFN_xrGetReferenceSpaceBoundsRect :: #type (a0: XrSession, a1: XrReferenceSpaceType, a2: *XrExtent2Df) -> XrResult #c_call;
PFN_xrCreateActionSpace :: #type (a0: XrSession, a1: *XrActionSpaceCreateInfo, a2: *XrSpace) -> XrResult #c_call;
PFN_xrLocateSpace :: #type (a0: XrSpace, a1: XrSpace, a2: XrTime, a3: *XrSpaceLocation) -> XrResult #c_call;
PFN_xrDestroySpace :: #type (a0: XrSpace) -> XrResult #c_call;
PFN_xrEnumerateViewConfigurations :: #type (a0: XrInstance, a1: XrSystemId, a2: u32, a3: *u32, a4: *XrViewConfigurationType) -> XrResult #c_call;
PFN_xrGetViewConfigurationProperties :: #type (a0: XrInstance, a1: XrSystemId, a2: XrViewConfigurationType, a3: *XrViewConfigurationProperties) -> XrResult #c_call;
PFN_xrEnumerateViewConfigurationViews :: #type (a0: XrInstance, a1: XrSystemId, a2: XrViewConfigurationType, a3: u32, a4: *u32, a5: *XrViewConfigurationView) -> XrResult #c_call;
PFN_xrEnumerateSwapchainFormats :: #type (a0: XrSession, a1: u32, a2: *u32, a3: *s64) -> XrResult #c_call;
PFN_xrCreateSwapchain :: #type (a0: XrSession, a1: *XrSwapchainCreateInfo, a2: *XrSwapchain) -> XrResult #c_call;
PFN_xrDestroySwapchain :: #type (a0: XrSwapchain) -> XrResult #c_call;
PFN_xrEnumerateSwapchainImages :: #type (a0: XrSwapchain, a1: u32, a2: *u32, a3: *XrSwapchainImageBaseHeader) -> XrResult #c_call;
PFN_xrAcquireSwapchainImage :: #type (a0: XrSwapchain, a1: *XrSwapchainImageAcquireInfo, a2: *u32) -> XrResult #c_call;
PFN_xrWaitSwapchainImage :: #type (a0: XrSwapchain, a1: *XrSwapchainImageWaitInfo) -> XrResult #c_call;
PFN_xrReleaseSwapchainImage :: #type (a0: XrSwapchain, a1: *XrSwapchainImageReleaseInfo) -> XrResult #c_call;
PFN_xrBeginSession :: #type (a0: XrSession, a1: *XrSessionBeginInfo) -> XrResult #c_call;
PFN_xrEndSession :: #type (a0: XrSession) -> XrResult #c_call;
PFN_xrRequestExitSession :: #type (a0: XrSession) -> XrResult #c_call;
PFN_xrWaitFrame :: #type (a0: XrSession, a1: *XrFrameWaitInfo, a2: *XrFrameState) -> XrResult #c_call;
PFN_xrBeginFrame :: #type (a0: XrSession, a1: *XrFrameBeginInfo) -> XrResult #c_call;
PFN_xrEndFrame :: #type (a0: XrSession, a1: *XrFrameEndInfo) -> XrResult #c_call;
PFN_xrLocateViews :: #type (a0: XrSession, a1: *XrViewLocateInfo, a2: *XrViewState, a3: u32, a4: *u32, a5: *XrView) -> XrResult #c_call;
PFN_xrStringToPath :: #type (a0: XrInstance, a1: *u8, a2: *XrPath) -> XrResult #c_call;
PFN_xrPathToString :: #type (a0: XrInstance, a1: XrPath, a2: u32, a3: *u32, a4: *u8) -> XrResult #c_call;
PFN_xrCreateActionSet :: #type (a0: XrInstance, a1: *XrActionSetCreateInfo, a2: *XrActionSet) -> XrResult #c_call;
PFN_xrDestroyActionSet :: #type (a0: XrActionSet) -> XrResult #c_call;
PFN_xrCreateAction :: #type (a0: XrActionSet, a1: *XrActionCreateInfo, a2: *XrAction) -> XrResult #c_call;
PFN_xrDestroyAction :: #type (a0: XrAction) -> XrResult #c_call;
PFN_xrSuggestInteractionProfileBindings :: #type (a0: XrInstance, a1: *XrInteractionProfileSuggestedBinding) -> XrResult #c_call;
PFN_xrAttachSessionActionSets :: #type (a0: XrSession, a1: *XrSessionActionSetsAttachInfo) -> XrResult #c_call;
PFN_xrGetCurrentInteractionProfile :: #type (a0: XrSession, a1: XrPath, a2: *XrInteractionProfileState) -> XrResult #c_call;
PFN_xrGetActionStateBoolean :: #type (a0: XrSession, a1: *XrActionStateGetInfo, a2: *XrActionStateBoolean) -> XrResult #c_call;
PFN_xrGetActionStateFloat :: #type (a0: XrSession, a1: *XrActionStateGetInfo, a2: *XrActionStateFloat) -> XrResult #c_call;
PFN_xrGetActionStateVector2f :: #type (a0: XrSession, a1: *XrActionStateGetInfo, a2: *XrActionStateVector2f) -> XrResult #c_call;
PFN_xrGetActionStatePose :: #type (a0: XrSession, a1: *XrActionStateGetInfo, a2: *XrActionStatePose) -> XrResult #c_call;
PFN_xrSyncActions :: #type (a0: XrSession, a1: *XrActionsSyncInfo) -> XrResult #c_call;
PFN_xrEnumerateBoundSourcesForAction :: #type (a0: XrSession, a1: *XrBoundSourcesForActionEnumerateInfo, a2: u32, a3: *u32, a4: *XrPath) -> XrResult #c_call;
PFN_xrGetInputSourceLocalizedName :: #type (a0: XrSession, a1: *XrInputSourceLocalizedNameGetInfo, a2: u32, a3: *u32, a4: *u8) -> XrResult #c_call;
PFN_xrApplyHapticFeedback :: #type (a0: XrSession, a1: *XrHapticActionInfo, a2: *XrHapticBaseHeader) -> XrResult #c_call;
PFN_xrStopHapticFeedback :: #type (a0: XrSession, a1: *XrHapticActionInfo) -> XrResult #c_call;

xrGetInstanceProcAddr :: (instance: XrInstance, name: *u8, function: *PFN_xrVoidFunction) -> XrResult #foreign openxr_loader;

xrEnumerateApiLayerProperties :: (propertyCapacityInput: u32, propertyCountOutput: *u32, properties: *XrApiLayerProperties) -> XrResult #foreign openxr_loader;

xrEnumerateInstanceExtensionProperties :: (layerName: *u8, propertyCapacityInput: u32, propertyCountOutput: *u32, properties: *XrExtensionProperties) -> XrResult #foreign openxr_loader;

xrCreateInstance :: (createInfo: *XrInstanceCreateInfo, instance: *XrInstance) -> XrResult #foreign openxr_loader;

xrDestroyInstance :: (instance: XrInstance) -> XrResult #foreign openxr_loader;

xrGetInstanceProperties :: (instance: XrInstance, instanceProperties: *XrInstanceProperties) -> XrResult #foreign openxr_loader;

xrPollEvent :: (instance: XrInstance, eventData: *XrEventDataBuffer) -> XrResult #foreign openxr_loader;

xrResultToString :: (instance: XrInstance, value: XrResult, buffer: *[64] u8) -> XrResult #foreign openxr_loader;

xrStructureTypeToString :: (instance: XrInstance, value: XrStructureType, buffer: *[64] u8) -> XrResult #foreign openxr_loader;

xrGetSystem :: (instance: XrInstance, getInfo: *XrSystemGetInfo, systemId: *XrSystemId) -> XrResult #foreign openxr_loader;

xrGetSystemProperties :: (instance: XrInstance, systemId: XrSystemId, properties: *XrSystemProperties) -> XrResult #foreign openxr_loader;

xrEnumerateEnvironmentBlendModes :: (instance: XrInstance, systemId: XrSystemId, viewConfigurationType: XrViewConfigurationType, environmentBlendModeCapacityInput: u32, environmentBlendModeCountOutput: *u32, environmentBlendModes: *XrEnvironmentBlendMode) -> XrResult #foreign openxr_loader;

xrCreateSession :: (instance: XrInstance, createInfo: *XrSessionCreateInfo, session: *XrSession) -> XrResult #foreign openxr_loader;

xrDestroySession :: (session: XrSession) -> XrResult #foreign openxr_loader;

xrEnumerateReferenceSpaces :: (session: XrSession, spaceCapacityInput: u32, spaceCountOutput: *u32, spaces: *XrReferenceSpaceType) -> XrResult #foreign openxr_loader;

xrCreateReferenceSpace :: (session: XrSession, createInfo: *XrReferenceSpaceCreateInfo, space: *XrSpace) -> XrResult #foreign openxr_loader;

xrGetReferenceSpaceBoundsRect :: (session: XrSession, referenceSpaceType: XrReferenceSpaceType, bounds: *XrExtent2Df) -> XrResult #foreign openxr_loader;

xrCreateActionSpace :: (session: XrSession, createInfo: *XrActionSpaceCreateInfo, space: *XrSpace) -> XrResult #foreign openxr_loader;

xrLocateSpace :: (space: XrSpace, baseSpace: XrSpace, time: XrTime, location: *XrSpaceLocation) -> XrResult #foreign openxr_loader;

xrDestroySpace :: (space: XrSpace) -> XrResult #foreign openxr_loader;

xrEnumerateViewConfigurations :: (instance: XrInstance, systemId: XrSystemId, viewConfigurationTypeCapacityInput: u32, viewConfigurationTypeCountOutput: *u32, viewConfigurationTypes: *XrViewConfigurationType) -> XrResult #foreign openxr_loader;

xrGetViewConfigurationProperties :: (instance: XrInstance, systemId: XrSystemId, viewConfigurationType: XrViewConfigurationType, configurationProperties: *XrViewConfigurationProperties) -> XrResult #foreign openxr_loader;

xrEnumerateViewConfigurationViews :: (instance: XrInstance, systemId: XrSystemId, viewConfigurationType: XrViewConfigurationType, viewCapacityInput: u32, viewCountOutput: *u32, views: *XrViewConfigurationView) -> XrResult #foreign openxr_loader;

xrEnumerateSwapchainFormats :: (session: XrSession, formatCapacityInput: u32, formatCountOutput: *u32, formats: *s64) -> XrResult #foreign openxr_loader;

xrCreateSwapchain :: (session: XrSession, createInfo: *XrSwapchainCreateInfo, swapchain: *XrSwapchain) -> XrResult #foreign openxr_loader;

xrDestroySwapchain :: (swapchain: XrSwapchain) -> XrResult #foreign openxr_loader;

xrEnumerateSwapchainImages :: (swapchain: XrSwapchain, imageCapacityInput: u32, imageCountOutput: *u32, images: *XrSwapchainImageBaseHeader) -> XrResult #foreign openxr_loader;

xrAcquireSwapchainImage :: (swapchain: XrSwapchain, acquireInfo: *XrSwapchainImageAcquireInfo, index: *u32) -> XrResult #foreign openxr_loader;

xrWaitSwapchainImage :: (swapchain: XrSwapchain, waitInfo: *XrSwapchainImageWaitInfo) -> XrResult #foreign openxr_loader;

xrReleaseSwapchainImage :: (swapchain: XrSwapchain, releaseInfo: *XrSwapchainImageReleaseInfo) -> XrResult #foreign openxr_loader;

xrBeginSession :: (session: XrSession, beginInfo: *XrSessionBeginInfo) -> XrResult #foreign openxr_loader;

xrEndSession :: (session: XrSession) -> XrResult #foreign openxr_loader;

xrRequestExitSession :: (session: XrSession) -> XrResult #foreign openxr_loader;

xrWaitFrame :: (session: XrSession, frameWaitInfo: *XrFrameWaitInfo, frameState: *XrFrameState) -> XrResult #foreign openxr_loader;

xrBeginFrame :: (session: XrSession, frameBeginInfo: *XrFrameBeginInfo) -> XrResult #foreign openxr_loader;

xrEndFrame :: (session: XrSession, frameEndInfo: *XrFrameEndInfo) -> XrResult #foreign openxr_loader;

xrLocateViews :: (session: XrSession, viewLocateInfo: *XrViewLocateInfo, viewState: *XrViewState, viewCapacityInput: u32, viewCountOutput: *u32, views: *XrView) -> XrResult #foreign openxr_loader;

xrStringToPath :: (instance: XrInstance, pathString: *u8, path: *XrPath) -> XrResult #foreign openxr_loader;

xrPathToString :: (instance: XrInstance, path: XrPath, bufferCapacityInput: u32, bufferCountOutput: *u32, buffer: *u8) -> XrResult #foreign openxr_loader;

xrCreateActionSet :: (instance: XrInstance, createInfo: *XrActionSetCreateInfo, actionSet: *XrActionSet) -> XrResult #foreign openxr_loader;

xrDestroyActionSet :: (actionSet: XrActionSet) -> XrResult #foreign openxr_loader;

xrCreateAction :: (actionSet: XrActionSet, createInfo: *XrActionCreateInfo, action: *XrAction) -> XrResult #foreign openxr_loader;

xrDestroyAction :: (action: XrAction) -> XrResult #foreign openxr_loader;

xrSuggestInteractionProfileBindings :: (instance: XrInstance, suggestedBindings: *XrInteractionProfileSuggestedBinding) -> XrResult #foreign openxr_loader;

xrAttachSessionActionSets :: (session: XrSession, attachInfo: *XrSessionActionSetsAttachInfo) -> XrResult #foreign openxr_loader;

xrGetCurrentInteractionProfile :: (session: XrSession, topLevelUserPath: XrPath, interactionProfile: *XrInteractionProfileState) -> XrResult #foreign openxr_loader;

xrGetActionStateBoolean :: (session: XrSession, getInfo: *XrActionStateGetInfo, state: *XrActionStateBoolean) -> XrResult #foreign openxr_loader;

xrGetActionStateFloat :: (session: XrSession, getInfo: *XrActionStateGetInfo, state: *XrActionStateFloat) -> XrResult #foreign openxr_loader;

xrGetActionStateVector2f :: (session: XrSession, getInfo: *XrActionStateGetInfo, state: *XrActionStateVector2f) -> XrResult #foreign openxr_loader;

xrGetActionStatePose :: (session: XrSession, getInfo: *XrActionStateGetInfo, state: *XrActionStatePose) -> XrResult #foreign openxr_loader;

xrSyncActions :: (session: XrSession, syncInfo: *XrActionsSyncInfo) -> XrResult #foreign openxr_loader;

xrEnumerateBoundSourcesForAction :: (session: XrSession, enumerateInfo: *XrBoundSourcesForActionEnumerateInfo, sourceCapacityInput: u32, sourceCountOutput: *u32, sources: *XrPath) -> XrResult #foreign openxr_loader;

xrGetInputSourceLocalizedName :: (session: XrSession, getInfo: *XrInputSourceLocalizedNameGetInfo, bufferCapacityInput: u32, bufferCountOutput: *u32, buffer: *u8) -> XrResult #foreign openxr_loader;

xrApplyHapticFeedback :: (session: XrSession, hapticActionInfo: *XrHapticActionInfo, hapticFeedback: *XrHapticBaseHeader) -> XrResult #foreign openxr_loader;

xrStopHapticFeedback :: (session: XrSession, hapticActionInfo: *XrHapticActionInfo) -> XrResult #foreign openxr_loader;

XrCompositionLayerCubeKHR :: struct {
    type:            XrStructureType;
    next:            *void;
    layerFlags:      XrCompositionLayerFlags;
    space:           XrSpace;
    eyeVisibility:   XrEyeVisibility;
    swapchain:       XrSwapchain;
    imageArrayIndex: u32;
    orientation:     XrQuaternionf;
}
#run {
    instance: XrCompositionLayerCubeKHR;
    assert(((cast(*void)(*instance.type)) - cast(*void)(*instance)) == 0, "XrCompositionLayerCubeKHR.type has unexpected offset % instead of 0", ((cast(*void)(*instance.type)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrCompositionLayerCubeKHR.type)) == 4, "XrCompositionLayerCubeKHR.type has unexpected size % instead of 4", size_of(type_of(XrCompositionLayerCubeKHR.type)));
    assert(((cast(*void)(*instance.next)) - cast(*void)(*instance)) == 8, "XrCompositionLayerCubeKHR.next has unexpected offset % instead of 8", ((cast(*void)(*instance.next)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrCompositionLayerCubeKHR.next)) == 8, "XrCompositionLayerCubeKHR.next has unexpected size % instead of 8", size_of(type_of(XrCompositionLayerCubeKHR.next)));
    assert(((cast(*void)(*instance.layerFlags)) - cast(*void)(*instance)) == 16, "XrCompositionLayerCubeKHR.layerFlags has unexpected offset % instead of 16", ((cast(*void)(*instance.layerFlags)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrCompositionLayerCubeKHR.layerFlags)) == 8, "XrCompositionLayerCubeKHR.layerFlags has unexpected size % instead of 8", size_of(type_of(XrCompositionLayerCubeKHR.layerFlags)));
    assert(((cast(*void)(*instance.space)) - cast(*void)(*instance)) == 24, "XrCompositionLayerCubeKHR.space has unexpected offset % instead of 24", ((cast(*void)(*instance.space)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrCompositionLayerCubeKHR.space)) == 8, "XrCompositionLayerCubeKHR.space has unexpected size % instead of 8", size_of(type_of(XrCompositionLayerCubeKHR.space)));
    assert(((cast(*void)(*instance.eyeVisibility)) - cast(*void)(*instance)) == 32, "XrCompositionLayerCubeKHR.eyeVisibility has unexpected offset % instead of 32", ((cast(*void)(*instance.eyeVisibility)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrCompositionLayerCubeKHR.eyeVisibility)) == 4, "XrCompositionLayerCubeKHR.eyeVisibility has unexpected size % instead of 4", size_of(type_of(XrCompositionLayerCubeKHR.eyeVisibility)));
    assert(((cast(*void)(*instance.swapchain)) - cast(*void)(*instance)) == 40, "XrCompositionLayerCubeKHR.swapchain has unexpected offset % instead of 40", ((cast(*void)(*instance.swapchain)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrCompositionLayerCubeKHR.swapchain)) == 8, "XrCompositionLayerCubeKHR.swapchain has unexpected size % instead of 8", size_of(type_of(XrCompositionLayerCubeKHR.swapchain)));
    assert(((cast(*void)(*instance.imageArrayIndex)) - cast(*void)(*instance)) == 48, "XrCompositionLayerCubeKHR.imageArrayIndex has unexpected offset % instead of 48", ((cast(*void)(*instance.imageArrayIndex)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrCompositionLayerCubeKHR.imageArrayIndex)) == 4, "XrCompositionLayerCubeKHR.imageArrayIndex has unexpected size % instead of 4", size_of(type_of(XrCompositionLayerCubeKHR.imageArrayIndex)));
    assert(((cast(*void)(*instance.orientation)) - cast(*void)(*instance)) == 52, "XrCompositionLayerCubeKHR.orientation has unexpected offset % instead of 52", ((cast(*void)(*instance.orientation)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrCompositionLayerCubeKHR.orientation)) == 16, "XrCompositionLayerCubeKHR.orientation has unexpected size % instead of 16", size_of(type_of(XrCompositionLayerCubeKHR.orientation)));
    assert(size_of(XrCompositionLayerCubeKHR) == 72, "XrCompositionLayerCubeKHR has size % instead of 72", size_of(XrCompositionLayerCubeKHR));
}

// XrCompositionLayerDepthInfoKHR extends XrCompositionLayerProjectionView
XrCompositionLayerDepthInfoKHR :: struct {
    type:     XrStructureType;
    next:     *void;
    subImage: XrSwapchainSubImage;
    minDepth: float;
    maxDepth: float;
    nearZ:    float;
    farZ:     float;
}
#run {
    instance: XrCompositionLayerDepthInfoKHR;
    assert(((cast(*void)(*instance.type)) - cast(*void)(*instance)) == 0, "XrCompositionLayerDepthInfoKHR.type has unexpected offset % instead of 0", ((cast(*void)(*instance.type)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrCompositionLayerDepthInfoKHR.type)) == 4, "XrCompositionLayerDepthInfoKHR.type has unexpected size % instead of 4", size_of(type_of(XrCompositionLayerDepthInfoKHR.type)));
    assert(((cast(*void)(*instance.next)) - cast(*void)(*instance)) == 8, "XrCompositionLayerDepthInfoKHR.next has unexpected offset % instead of 8", ((cast(*void)(*instance.next)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrCompositionLayerDepthInfoKHR.next)) == 8, "XrCompositionLayerDepthInfoKHR.next has unexpected size % instead of 8", size_of(type_of(XrCompositionLayerDepthInfoKHR.next)));
    assert(((cast(*void)(*instance.subImage)) - cast(*void)(*instance)) == 16, "XrCompositionLayerDepthInfoKHR.subImage has unexpected offset % instead of 16", ((cast(*void)(*instance.subImage)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrCompositionLayerDepthInfoKHR.subImage)) == 32, "XrCompositionLayerDepthInfoKHR.subImage has unexpected size % instead of 32", size_of(type_of(XrCompositionLayerDepthInfoKHR.subImage)));
    assert(((cast(*void)(*instance.minDepth)) - cast(*void)(*instance)) == 48, "XrCompositionLayerDepthInfoKHR.minDepth has unexpected offset % instead of 48", ((cast(*void)(*instance.minDepth)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrCompositionLayerDepthInfoKHR.minDepth)) == 4, "XrCompositionLayerDepthInfoKHR.minDepth has unexpected size % instead of 4", size_of(type_of(XrCompositionLayerDepthInfoKHR.minDepth)));
    assert(((cast(*void)(*instance.maxDepth)) - cast(*void)(*instance)) == 52, "XrCompositionLayerDepthInfoKHR.maxDepth has unexpected offset % instead of 52", ((cast(*void)(*instance.maxDepth)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrCompositionLayerDepthInfoKHR.maxDepth)) == 4, "XrCompositionLayerDepthInfoKHR.maxDepth has unexpected size % instead of 4", size_of(type_of(XrCompositionLayerDepthInfoKHR.maxDepth)));
    assert(((cast(*void)(*instance.nearZ)) - cast(*void)(*instance)) == 56, "XrCompositionLayerDepthInfoKHR.nearZ has unexpected offset % instead of 56", ((cast(*void)(*instance.nearZ)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrCompositionLayerDepthInfoKHR.nearZ)) == 4, "XrCompositionLayerDepthInfoKHR.nearZ has unexpected size % instead of 4", size_of(type_of(XrCompositionLayerDepthInfoKHR.nearZ)));
    assert(((cast(*void)(*instance.farZ)) - cast(*void)(*instance)) == 60, "XrCompositionLayerDepthInfoKHR.farZ has unexpected offset % instead of 60", ((cast(*void)(*instance.farZ)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrCompositionLayerDepthInfoKHR.farZ)) == 4, "XrCompositionLayerDepthInfoKHR.farZ has unexpected size % instead of 4", size_of(type_of(XrCompositionLayerDepthInfoKHR.farZ)));
    assert(size_of(XrCompositionLayerDepthInfoKHR) == 64, "XrCompositionLayerDepthInfoKHR has size % instead of 64", size_of(XrCompositionLayerDepthInfoKHR));
}

XrCompositionLayerCylinderKHR :: struct {
    type:          XrStructureType;
    next:          *void;
    layerFlags:    XrCompositionLayerFlags;
    space:         XrSpace;
    eyeVisibility: XrEyeVisibility;
    subImage:      XrSwapchainSubImage;
    pose:          XrPosef;
    radius:        float;
    centralAngle:  float;
    aspectRatio:   float;
}
#run {
    instance: XrCompositionLayerCylinderKHR;
    assert(((cast(*void)(*instance.type)) - cast(*void)(*instance)) == 0, "XrCompositionLayerCylinderKHR.type has unexpected offset % instead of 0", ((cast(*void)(*instance.type)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrCompositionLayerCylinderKHR.type)) == 4, "XrCompositionLayerCylinderKHR.type has unexpected size % instead of 4", size_of(type_of(XrCompositionLayerCylinderKHR.type)));
    assert(((cast(*void)(*instance.next)) - cast(*void)(*instance)) == 8, "XrCompositionLayerCylinderKHR.next has unexpected offset % instead of 8", ((cast(*void)(*instance.next)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrCompositionLayerCylinderKHR.next)) == 8, "XrCompositionLayerCylinderKHR.next has unexpected size % instead of 8", size_of(type_of(XrCompositionLayerCylinderKHR.next)));
    assert(((cast(*void)(*instance.layerFlags)) - cast(*void)(*instance)) == 16, "XrCompositionLayerCylinderKHR.layerFlags has unexpected offset % instead of 16", ((cast(*void)(*instance.layerFlags)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrCompositionLayerCylinderKHR.layerFlags)) == 8, "XrCompositionLayerCylinderKHR.layerFlags has unexpected size % instead of 8", size_of(type_of(XrCompositionLayerCylinderKHR.layerFlags)));
    assert(((cast(*void)(*instance.space)) - cast(*void)(*instance)) == 24, "XrCompositionLayerCylinderKHR.space has unexpected offset % instead of 24", ((cast(*void)(*instance.space)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrCompositionLayerCylinderKHR.space)) == 8, "XrCompositionLayerCylinderKHR.space has unexpected size % instead of 8", size_of(type_of(XrCompositionLayerCylinderKHR.space)));
    assert(((cast(*void)(*instance.eyeVisibility)) - cast(*void)(*instance)) == 32, "XrCompositionLayerCylinderKHR.eyeVisibility has unexpected offset % instead of 32", ((cast(*void)(*instance.eyeVisibility)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrCompositionLayerCylinderKHR.eyeVisibility)) == 4, "XrCompositionLayerCylinderKHR.eyeVisibility has unexpected size % instead of 4", size_of(type_of(XrCompositionLayerCylinderKHR.eyeVisibility)));
    assert(((cast(*void)(*instance.subImage)) - cast(*void)(*instance)) == 40, "XrCompositionLayerCylinderKHR.subImage has unexpected offset % instead of 40", ((cast(*void)(*instance.subImage)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrCompositionLayerCylinderKHR.subImage)) == 32, "XrCompositionLayerCylinderKHR.subImage has unexpected size % instead of 32", size_of(type_of(XrCompositionLayerCylinderKHR.subImage)));
    assert(((cast(*void)(*instance.pose)) - cast(*void)(*instance)) == 72, "XrCompositionLayerCylinderKHR.pose has unexpected offset % instead of 72", ((cast(*void)(*instance.pose)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrCompositionLayerCylinderKHR.pose)) == 28, "XrCompositionLayerCylinderKHR.pose has unexpected size % instead of 28", size_of(type_of(XrCompositionLayerCylinderKHR.pose)));
    assert(((cast(*void)(*instance.radius)) - cast(*void)(*instance)) == 100, "XrCompositionLayerCylinderKHR.radius has unexpected offset % instead of 100", ((cast(*void)(*instance.radius)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrCompositionLayerCylinderKHR.radius)) == 4, "XrCompositionLayerCylinderKHR.radius has unexpected size % instead of 4", size_of(type_of(XrCompositionLayerCylinderKHR.radius)));
    assert(((cast(*void)(*instance.centralAngle)) - cast(*void)(*instance)) == 104, "XrCompositionLayerCylinderKHR.centralAngle has unexpected offset % instead of 104", ((cast(*void)(*instance.centralAngle)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrCompositionLayerCylinderKHR.centralAngle)) == 4, "XrCompositionLayerCylinderKHR.centralAngle has unexpected size % instead of 4", size_of(type_of(XrCompositionLayerCylinderKHR.centralAngle)));
    assert(((cast(*void)(*instance.aspectRatio)) - cast(*void)(*instance)) == 108, "XrCompositionLayerCylinderKHR.aspectRatio has unexpected offset % instead of 108", ((cast(*void)(*instance.aspectRatio)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrCompositionLayerCylinderKHR.aspectRatio)) == 4, "XrCompositionLayerCylinderKHR.aspectRatio has unexpected size % instead of 4", size_of(type_of(XrCompositionLayerCylinderKHR.aspectRatio)));
    assert(size_of(XrCompositionLayerCylinderKHR) == 112, "XrCompositionLayerCylinderKHR has size % instead of 112", size_of(XrCompositionLayerCylinderKHR));
}

XrCompositionLayerEquirectKHR :: struct {
    type:          XrStructureType;
    next:          *void;
    layerFlags:    XrCompositionLayerFlags;
    space:         XrSpace;
    eyeVisibility: XrEyeVisibility;
    subImage:      XrSwapchainSubImage;
    pose:          XrPosef;
    radius:        float;
    scale:         XrVector2f;
    bias:          XrVector2f;
}
#run {
    instance: XrCompositionLayerEquirectKHR;
    assert(((cast(*void)(*instance.type)) - cast(*void)(*instance)) == 0, "XrCompositionLayerEquirectKHR.type has unexpected offset % instead of 0", ((cast(*void)(*instance.type)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrCompositionLayerEquirectKHR.type)) == 4, "XrCompositionLayerEquirectKHR.type has unexpected size % instead of 4", size_of(type_of(XrCompositionLayerEquirectKHR.type)));
    assert(((cast(*void)(*instance.next)) - cast(*void)(*instance)) == 8, "XrCompositionLayerEquirectKHR.next has unexpected offset % instead of 8", ((cast(*void)(*instance.next)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrCompositionLayerEquirectKHR.next)) == 8, "XrCompositionLayerEquirectKHR.next has unexpected size % instead of 8", size_of(type_of(XrCompositionLayerEquirectKHR.next)));
    assert(((cast(*void)(*instance.layerFlags)) - cast(*void)(*instance)) == 16, "XrCompositionLayerEquirectKHR.layerFlags has unexpected offset % instead of 16", ((cast(*void)(*instance.layerFlags)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrCompositionLayerEquirectKHR.layerFlags)) == 8, "XrCompositionLayerEquirectKHR.layerFlags has unexpected size % instead of 8", size_of(type_of(XrCompositionLayerEquirectKHR.layerFlags)));
    assert(((cast(*void)(*instance.space)) - cast(*void)(*instance)) == 24, "XrCompositionLayerEquirectKHR.space has unexpected offset % instead of 24", ((cast(*void)(*instance.space)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrCompositionLayerEquirectKHR.space)) == 8, "XrCompositionLayerEquirectKHR.space has unexpected size % instead of 8", size_of(type_of(XrCompositionLayerEquirectKHR.space)));
    assert(((cast(*void)(*instance.eyeVisibility)) - cast(*void)(*instance)) == 32, "XrCompositionLayerEquirectKHR.eyeVisibility has unexpected offset % instead of 32", ((cast(*void)(*instance.eyeVisibility)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrCompositionLayerEquirectKHR.eyeVisibility)) == 4, "XrCompositionLayerEquirectKHR.eyeVisibility has unexpected size % instead of 4", size_of(type_of(XrCompositionLayerEquirectKHR.eyeVisibility)));
    assert(((cast(*void)(*instance.subImage)) - cast(*void)(*instance)) == 40, "XrCompositionLayerEquirectKHR.subImage has unexpected offset % instead of 40", ((cast(*void)(*instance.subImage)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrCompositionLayerEquirectKHR.subImage)) == 32, "XrCompositionLayerEquirectKHR.subImage has unexpected size % instead of 32", size_of(type_of(XrCompositionLayerEquirectKHR.subImage)));
    assert(((cast(*void)(*instance.pose)) - cast(*void)(*instance)) == 72, "XrCompositionLayerEquirectKHR.pose has unexpected offset % instead of 72", ((cast(*void)(*instance.pose)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrCompositionLayerEquirectKHR.pose)) == 28, "XrCompositionLayerEquirectKHR.pose has unexpected size % instead of 28", size_of(type_of(XrCompositionLayerEquirectKHR.pose)));
    assert(((cast(*void)(*instance.radius)) - cast(*void)(*instance)) == 100, "XrCompositionLayerEquirectKHR.radius has unexpected offset % instead of 100", ((cast(*void)(*instance.radius)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrCompositionLayerEquirectKHR.radius)) == 4, "XrCompositionLayerEquirectKHR.radius has unexpected size % instead of 4", size_of(type_of(XrCompositionLayerEquirectKHR.radius)));
    assert(((cast(*void)(*instance.scale)) - cast(*void)(*instance)) == 104, "XrCompositionLayerEquirectKHR.scale has unexpected offset % instead of 104", ((cast(*void)(*instance.scale)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrCompositionLayerEquirectKHR.scale)) == 8, "XrCompositionLayerEquirectKHR.scale has unexpected size % instead of 8", size_of(type_of(XrCompositionLayerEquirectKHR.scale)));
    assert(((cast(*void)(*instance.bias)) - cast(*void)(*instance)) == 112, "XrCompositionLayerEquirectKHR.bias has unexpected offset % instead of 112", ((cast(*void)(*instance.bias)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrCompositionLayerEquirectKHR.bias)) == 8, "XrCompositionLayerEquirectKHR.bias has unexpected size % instead of 8", size_of(type_of(XrCompositionLayerEquirectKHR.bias)));
    assert(size_of(XrCompositionLayerEquirectKHR) == 120, "XrCompositionLayerEquirectKHR has size % instead of 120", size_of(XrCompositionLayerEquirectKHR));
}

XrVisibilityMaskTypeKHR :: enum s32 {
    HIDDEN_TRIANGLE_MESH_KHR  :: 1;
    VISIBLE_TRIANGLE_MESH_KHR :: 2;
    LINE_LOOP_KHR             :: 3;
    MAX_ENUM_KHR              :: 2147483647;

    XR_VISIBILITY_MASK_TYPE_HIDDEN_TRIANGLE_MESH_KHR  :: HIDDEN_TRIANGLE_MESH_KHR;
    XR_VISIBILITY_MASK_TYPE_VISIBLE_TRIANGLE_MESH_KHR :: VISIBLE_TRIANGLE_MESH_KHR;
    XR_VISIBILITY_MASK_TYPE_LINE_LOOP_KHR             :: LINE_LOOP_KHR;
    XR_VISIBILITY_MASK_TYPE_MAX_ENUM_KHR              :: MAX_ENUM_KHR;
}

XrVisibilityMaskKHR :: struct {
    type:                XrStructureType;
    next:                *void;
    vertexCapacityInput: u32;
    vertexCountOutput:   u32;
    vertices:            *XrVector2f;
    indexCapacityInput:  u32;
    indexCountOutput:    u32;
    indices:             *u32;
}
#run {
    instance: XrVisibilityMaskKHR;
    assert(((cast(*void)(*instance.type)) - cast(*void)(*instance)) == 0, "XrVisibilityMaskKHR.type has unexpected offset % instead of 0", ((cast(*void)(*instance.type)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrVisibilityMaskKHR.type)) == 4, "XrVisibilityMaskKHR.type has unexpected size % instead of 4", size_of(type_of(XrVisibilityMaskKHR.type)));
    assert(((cast(*void)(*instance.next)) - cast(*void)(*instance)) == 8, "XrVisibilityMaskKHR.next has unexpected offset % instead of 8", ((cast(*void)(*instance.next)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrVisibilityMaskKHR.next)) == 8, "XrVisibilityMaskKHR.next has unexpected size % instead of 8", size_of(type_of(XrVisibilityMaskKHR.next)));
    assert(((cast(*void)(*instance.vertexCapacityInput)) - cast(*void)(*instance)) == 16, "XrVisibilityMaskKHR.vertexCapacityInput has unexpected offset % instead of 16", ((cast(*void)(*instance.vertexCapacityInput)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrVisibilityMaskKHR.vertexCapacityInput)) == 4, "XrVisibilityMaskKHR.vertexCapacityInput has unexpected size % instead of 4", size_of(type_of(XrVisibilityMaskKHR.vertexCapacityInput)));
    assert(((cast(*void)(*instance.vertexCountOutput)) - cast(*void)(*instance)) == 20, "XrVisibilityMaskKHR.vertexCountOutput has unexpected offset % instead of 20", ((cast(*void)(*instance.vertexCountOutput)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrVisibilityMaskKHR.vertexCountOutput)) == 4, "XrVisibilityMaskKHR.vertexCountOutput has unexpected size % instead of 4", size_of(type_of(XrVisibilityMaskKHR.vertexCountOutput)));
    assert(((cast(*void)(*instance.vertices)) - cast(*void)(*instance)) == 24, "XrVisibilityMaskKHR.vertices has unexpected offset % instead of 24", ((cast(*void)(*instance.vertices)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrVisibilityMaskKHR.vertices)) == 8, "XrVisibilityMaskKHR.vertices has unexpected size % instead of 8", size_of(type_of(XrVisibilityMaskKHR.vertices)));
    assert(((cast(*void)(*instance.indexCapacityInput)) - cast(*void)(*instance)) == 32, "XrVisibilityMaskKHR.indexCapacityInput has unexpected offset % instead of 32", ((cast(*void)(*instance.indexCapacityInput)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrVisibilityMaskKHR.indexCapacityInput)) == 4, "XrVisibilityMaskKHR.indexCapacityInput has unexpected size % instead of 4", size_of(type_of(XrVisibilityMaskKHR.indexCapacityInput)));
    assert(((cast(*void)(*instance.indexCountOutput)) - cast(*void)(*instance)) == 36, "XrVisibilityMaskKHR.indexCountOutput has unexpected offset % instead of 36", ((cast(*void)(*instance.indexCountOutput)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrVisibilityMaskKHR.indexCountOutput)) == 4, "XrVisibilityMaskKHR.indexCountOutput has unexpected size % instead of 4", size_of(type_of(XrVisibilityMaskKHR.indexCountOutput)));
    assert(((cast(*void)(*instance.indices)) - cast(*void)(*instance)) == 40, "XrVisibilityMaskKHR.indices has unexpected offset % instead of 40", ((cast(*void)(*instance.indices)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrVisibilityMaskKHR.indices)) == 8, "XrVisibilityMaskKHR.indices has unexpected size % instead of 8", size_of(type_of(XrVisibilityMaskKHR.indices)));
    assert(size_of(XrVisibilityMaskKHR) == 48, "XrVisibilityMaskKHR has size % instead of 48", size_of(XrVisibilityMaskKHR));
}

XrEventDataVisibilityMaskChangedKHR :: struct {
    type:                  XrStructureType;
    next:                  *void;
    session:               XrSession;
    viewConfigurationType: XrViewConfigurationType;
    viewIndex:             u32;
}
#run {
    instance: XrEventDataVisibilityMaskChangedKHR;
    assert(((cast(*void)(*instance.type)) - cast(*void)(*instance)) == 0, "XrEventDataVisibilityMaskChangedKHR.type has unexpected offset % instead of 0", ((cast(*void)(*instance.type)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrEventDataVisibilityMaskChangedKHR.type)) == 4, "XrEventDataVisibilityMaskChangedKHR.type has unexpected size % instead of 4", size_of(type_of(XrEventDataVisibilityMaskChangedKHR.type)));
    assert(((cast(*void)(*instance.next)) - cast(*void)(*instance)) == 8, "XrEventDataVisibilityMaskChangedKHR.next has unexpected offset % instead of 8", ((cast(*void)(*instance.next)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrEventDataVisibilityMaskChangedKHR.next)) == 8, "XrEventDataVisibilityMaskChangedKHR.next has unexpected size % instead of 8", size_of(type_of(XrEventDataVisibilityMaskChangedKHR.next)));
    assert(((cast(*void)(*instance.session)) - cast(*void)(*instance)) == 16, "XrEventDataVisibilityMaskChangedKHR.session has unexpected offset % instead of 16", ((cast(*void)(*instance.session)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrEventDataVisibilityMaskChangedKHR.session)) == 8, "XrEventDataVisibilityMaskChangedKHR.session has unexpected size % instead of 8", size_of(type_of(XrEventDataVisibilityMaskChangedKHR.session)));
    assert(((cast(*void)(*instance.viewConfigurationType)) - cast(*void)(*instance)) == 24, "XrEventDataVisibilityMaskChangedKHR.viewConfigurationType has unexpected offset % instead of 24", ((cast(*void)(*instance.viewConfigurationType)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrEventDataVisibilityMaskChangedKHR.viewConfigurationType)) == 4, "XrEventDataVisibilityMaskChangedKHR.viewConfigurationType has unexpected size % instead of 4", size_of(type_of(XrEventDataVisibilityMaskChangedKHR.viewConfigurationType)));
    assert(((cast(*void)(*instance.viewIndex)) - cast(*void)(*instance)) == 28, "XrEventDataVisibilityMaskChangedKHR.viewIndex has unexpected offset % instead of 28", ((cast(*void)(*instance.viewIndex)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrEventDataVisibilityMaskChangedKHR.viewIndex)) == 4, "XrEventDataVisibilityMaskChangedKHR.viewIndex has unexpected size % instead of 4", size_of(type_of(XrEventDataVisibilityMaskChangedKHR.viewIndex)));
    assert(size_of(XrEventDataVisibilityMaskChangedKHR) == 32, "XrEventDataVisibilityMaskChangedKHR has size % instead of 32", size_of(XrEventDataVisibilityMaskChangedKHR));
}

PFN_xrGetVisibilityMaskKHR :: #type (a0: XrSession, a1: XrViewConfigurationType, a2: u32, a3: XrVisibilityMaskTypeKHR, a4: *XrVisibilityMaskKHR) -> XrResult #c_call;

// XrCompositionLayerColorScaleBiasKHR extends XrCompositionLayerBaseHeader
XrCompositionLayerColorScaleBiasKHR :: struct {
    type:       XrStructureType;
    next:       *void;
    colorScale: XrColor4f;
    colorBias:  XrColor4f;
}
#run {
    instance: XrCompositionLayerColorScaleBiasKHR;
    assert(((cast(*void)(*instance.type)) - cast(*void)(*instance)) == 0, "XrCompositionLayerColorScaleBiasKHR.type has unexpected offset % instead of 0", ((cast(*void)(*instance.type)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrCompositionLayerColorScaleBiasKHR.type)) == 4, "XrCompositionLayerColorScaleBiasKHR.type has unexpected size % instead of 4", size_of(type_of(XrCompositionLayerColorScaleBiasKHR.type)));
    assert(((cast(*void)(*instance.next)) - cast(*void)(*instance)) == 8, "XrCompositionLayerColorScaleBiasKHR.next has unexpected offset % instead of 8", ((cast(*void)(*instance.next)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrCompositionLayerColorScaleBiasKHR.next)) == 8, "XrCompositionLayerColorScaleBiasKHR.next has unexpected size % instead of 8", size_of(type_of(XrCompositionLayerColorScaleBiasKHR.next)));
    assert(((cast(*void)(*instance.colorScale)) - cast(*void)(*instance)) == 16, "XrCompositionLayerColorScaleBiasKHR.colorScale has unexpected offset % instead of 16", ((cast(*void)(*instance.colorScale)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrCompositionLayerColorScaleBiasKHR.colorScale)) == 16, "XrCompositionLayerColorScaleBiasKHR.colorScale has unexpected size % instead of 16", size_of(type_of(XrCompositionLayerColorScaleBiasKHR.colorScale)));
    assert(((cast(*void)(*instance.colorBias)) - cast(*void)(*instance)) == 32, "XrCompositionLayerColorScaleBiasKHR.colorBias has unexpected offset % instead of 32", ((cast(*void)(*instance.colorBias)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrCompositionLayerColorScaleBiasKHR.colorBias)) == 16, "XrCompositionLayerColorScaleBiasKHR.colorBias has unexpected size % instead of 16", size_of(type_of(XrCompositionLayerColorScaleBiasKHR.colorBias)));
    assert(size_of(XrCompositionLayerColorScaleBiasKHR) == 48, "XrCompositionLayerColorScaleBiasKHR has size % instead of 48", size_of(XrCompositionLayerColorScaleBiasKHR));
}

XrLoaderInitInfoBaseHeaderKHR :: struct {
    type: XrStructureType;
    next: *void;
}
#run {
    instance: XrLoaderInitInfoBaseHeaderKHR;
    assert(((cast(*void)(*instance.type)) - cast(*void)(*instance)) == 0, "XrLoaderInitInfoBaseHeaderKHR.type has unexpected offset % instead of 0", ((cast(*void)(*instance.type)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrLoaderInitInfoBaseHeaderKHR.type)) == 4, "XrLoaderInitInfoBaseHeaderKHR.type has unexpected size % instead of 4", size_of(type_of(XrLoaderInitInfoBaseHeaderKHR.type)));
    assert(((cast(*void)(*instance.next)) - cast(*void)(*instance)) == 8, "XrLoaderInitInfoBaseHeaderKHR.next has unexpected offset % instead of 8", ((cast(*void)(*instance.next)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrLoaderInitInfoBaseHeaderKHR.next)) == 8, "XrLoaderInitInfoBaseHeaderKHR.next has unexpected size % instead of 8", size_of(type_of(XrLoaderInitInfoBaseHeaderKHR.next)));
    assert(size_of(XrLoaderInitInfoBaseHeaderKHR) == 16, "XrLoaderInitInfoBaseHeaderKHR has size % instead of 16", size_of(XrLoaderInitInfoBaseHeaderKHR));
}

PFN_xrInitializeLoaderKHR :: #type (a0: *XrLoaderInitInfoBaseHeaderKHR) -> XrResult #c_call;

XrCompositionLayerEquirect2KHR :: struct {
    type:                   XrStructureType;
    next:                   *void;
    layerFlags:             XrCompositionLayerFlags;
    space:                  XrSpace;
    eyeVisibility:          XrEyeVisibility;
    subImage:               XrSwapchainSubImage;
    pose:                   XrPosef;
    radius:                 float;
    centralHorizontalAngle: float;
    upperVerticalAngle:     float;
    lowerVerticalAngle:     float;
}
#run {
    instance: XrCompositionLayerEquirect2KHR;
    assert(((cast(*void)(*instance.type)) - cast(*void)(*instance)) == 0, "XrCompositionLayerEquirect2KHR.type has unexpected offset % instead of 0", ((cast(*void)(*instance.type)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrCompositionLayerEquirect2KHR.type)) == 4, "XrCompositionLayerEquirect2KHR.type has unexpected size % instead of 4", size_of(type_of(XrCompositionLayerEquirect2KHR.type)));
    assert(((cast(*void)(*instance.next)) - cast(*void)(*instance)) == 8, "XrCompositionLayerEquirect2KHR.next has unexpected offset % instead of 8", ((cast(*void)(*instance.next)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrCompositionLayerEquirect2KHR.next)) == 8, "XrCompositionLayerEquirect2KHR.next has unexpected size % instead of 8", size_of(type_of(XrCompositionLayerEquirect2KHR.next)));
    assert(((cast(*void)(*instance.layerFlags)) - cast(*void)(*instance)) == 16, "XrCompositionLayerEquirect2KHR.layerFlags has unexpected offset % instead of 16", ((cast(*void)(*instance.layerFlags)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrCompositionLayerEquirect2KHR.layerFlags)) == 8, "XrCompositionLayerEquirect2KHR.layerFlags has unexpected size % instead of 8", size_of(type_of(XrCompositionLayerEquirect2KHR.layerFlags)));
    assert(((cast(*void)(*instance.space)) - cast(*void)(*instance)) == 24, "XrCompositionLayerEquirect2KHR.space has unexpected offset % instead of 24", ((cast(*void)(*instance.space)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrCompositionLayerEquirect2KHR.space)) == 8, "XrCompositionLayerEquirect2KHR.space has unexpected size % instead of 8", size_of(type_of(XrCompositionLayerEquirect2KHR.space)));
    assert(((cast(*void)(*instance.eyeVisibility)) - cast(*void)(*instance)) == 32, "XrCompositionLayerEquirect2KHR.eyeVisibility has unexpected offset % instead of 32", ((cast(*void)(*instance.eyeVisibility)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrCompositionLayerEquirect2KHR.eyeVisibility)) == 4, "XrCompositionLayerEquirect2KHR.eyeVisibility has unexpected size % instead of 4", size_of(type_of(XrCompositionLayerEquirect2KHR.eyeVisibility)));
    assert(((cast(*void)(*instance.subImage)) - cast(*void)(*instance)) == 40, "XrCompositionLayerEquirect2KHR.subImage has unexpected offset % instead of 40", ((cast(*void)(*instance.subImage)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrCompositionLayerEquirect2KHR.subImage)) == 32, "XrCompositionLayerEquirect2KHR.subImage has unexpected size % instead of 32", size_of(type_of(XrCompositionLayerEquirect2KHR.subImage)));
    assert(((cast(*void)(*instance.pose)) - cast(*void)(*instance)) == 72, "XrCompositionLayerEquirect2KHR.pose has unexpected offset % instead of 72", ((cast(*void)(*instance.pose)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrCompositionLayerEquirect2KHR.pose)) == 28, "XrCompositionLayerEquirect2KHR.pose has unexpected size % instead of 28", size_of(type_of(XrCompositionLayerEquirect2KHR.pose)));
    assert(((cast(*void)(*instance.radius)) - cast(*void)(*instance)) == 100, "XrCompositionLayerEquirect2KHR.radius has unexpected offset % instead of 100", ((cast(*void)(*instance.radius)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrCompositionLayerEquirect2KHR.radius)) == 4, "XrCompositionLayerEquirect2KHR.radius has unexpected size % instead of 4", size_of(type_of(XrCompositionLayerEquirect2KHR.radius)));
    assert(((cast(*void)(*instance.centralHorizontalAngle)) - cast(*void)(*instance)) == 104, "XrCompositionLayerEquirect2KHR.centralHorizontalAngle has unexpected offset % instead of 104", ((cast(*void)(*instance.centralHorizontalAngle)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrCompositionLayerEquirect2KHR.centralHorizontalAngle)) == 4, "XrCompositionLayerEquirect2KHR.centralHorizontalAngle has unexpected size % instead of 4", size_of(type_of(XrCompositionLayerEquirect2KHR.centralHorizontalAngle)));
    assert(((cast(*void)(*instance.upperVerticalAngle)) - cast(*void)(*instance)) == 108, "XrCompositionLayerEquirect2KHR.upperVerticalAngle has unexpected offset % instead of 108", ((cast(*void)(*instance.upperVerticalAngle)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrCompositionLayerEquirect2KHR.upperVerticalAngle)) == 4, "XrCompositionLayerEquirect2KHR.upperVerticalAngle has unexpected size % instead of 4", size_of(type_of(XrCompositionLayerEquirect2KHR.upperVerticalAngle)));
    assert(((cast(*void)(*instance.lowerVerticalAngle)) - cast(*void)(*instance)) == 112, "XrCompositionLayerEquirect2KHR.lowerVerticalAngle has unexpected offset % instead of 112", ((cast(*void)(*instance.lowerVerticalAngle)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrCompositionLayerEquirect2KHR.lowerVerticalAngle)) == 4, "XrCompositionLayerEquirect2KHR.lowerVerticalAngle has unexpected size % instead of 4", size_of(type_of(XrCompositionLayerEquirect2KHR.lowerVerticalAngle)));
    assert(size_of(XrCompositionLayerEquirect2KHR) == 120, "XrCompositionLayerEquirect2KHR has size % instead of 120", size_of(XrCompositionLayerEquirect2KHR));
}

XrBindingModificationBaseHeaderKHR :: struct {
    type: XrStructureType;
    next: *void;
}
#run {
    instance: XrBindingModificationBaseHeaderKHR;
    assert(((cast(*void)(*instance.type)) - cast(*void)(*instance)) == 0, "XrBindingModificationBaseHeaderKHR.type has unexpected offset % instead of 0", ((cast(*void)(*instance.type)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrBindingModificationBaseHeaderKHR.type)) == 4, "XrBindingModificationBaseHeaderKHR.type has unexpected size % instead of 4", size_of(type_of(XrBindingModificationBaseHeaderKHR.type)));
    assert(((cast(*void)(*instance.next)) - cast(*void)(*instance)) == 8, "XrBindingModificationBaseHeaderKHR.next has unexpected offset % instead of 8", ((cast(*void)(*instance.next)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrBindingModificationBaseHeaderKHR.next)) == 8, "XrBindingModificationBaseHeaderKHR.next has unexpected size % instead of 8", size_of(type_of(XrBindingModificationBaseHeaderKHR.next)));
    assert(size_of(XrBindingModificationBaseHeaderKHR) == 16, "XrBindingModificationBaseHeaderKHR has size % instead of 16", size_of(XrBindingModificationBaseHeaderKHR));
}

// XrBindingModificationsKHR extends XrInteractionProfileSuggestedBinding
XrBindingModificationsKHR :: struct {
    type:                     XrStructureType;
    next:                     *void;
    bindingModificationCount: u32;
    bindingModifications:     **XrBindingModificationBaseHeaderKHR;
}
#run {
    instance: XrBindingModificationsKHR;
    assert(((cast(*void)(*instance.type)) - cast(*void)(*instance)) == 0, "XrBindingModificationsKHR.type has unexpected offset % instead of 0", ((cast(*void)(*instance.type)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrBindingModificationsKHR.type)) == 4, "XrBindingModificationsKHR.type has unexpected size % instead of 4", size_of(type_of(XrBindingModificationsKHR.type)));
    assert(((cast(*void)(*instance.next)) - cast(*void)(*instance)) == 8, "XrBindingModificationsKHR.next has unexpected offset % instead of 8", ((cast(*void)(*instance.next)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrBindingModificationsKHR.next)) == 8, "XrBindingModificationsKHR.next has unexpected size % instead of 8", size_of(type_of(XrBindingModificationsKHR.next)));
    assert(((cast(*void)(*instance.bindingModificationCount)) - cast(*void)(*instance)) == 16, "XrBindingModificationsKHR.bindingModificationCount has unexpected offset % instead of 16", ((cast(*void)(*instance.bindingModificationCount)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrBindingModificationsKHR.bindingModificationCount)) == 4, "XrBindingModificationsKHR.bindingModificationCount has unexpected size % instead of 4", size_of(type_of(XrBindingModificationsKHR.bindingModificationCount)));
    assert(((cast(*void)(*instance.bindingModifications)) - cast(*void)(*instance)) == 24, "XrBindingModificationsKHR.bindingModifications has unexpected offset % instead of 24", ((cast(*void)(*instance.bindingModifications)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrBindingModificationsKHR.bindingModifications)) == 8, "XrBindingModificationsKHR.bindingModifications has unexpected size % instead of 8", size_of(type_of(XrBindingModificationsKHR.bindingModifications)));
    assert(size_of(XrBindingModificationsKHR) == 32, "XrBindingModificationsKHR has size % instead of 32", size_of(XrBindingModificationsKHR));
}

XrPerfSettingsDomainEXT :: enum s32 {
    CPU_EXT      :: 1;
    GPU_EXT      :: 2;
    MAX_ENUM_EXT :: 2147483647;

    XR_PERF_SETTINGS_DOMAIN_CPU_EXT      :: CPU_EXT;
    XR_PERF_SETTINGS_DOMAIN_GPU_EXT      :: GPU_EXT;
    XR_PERF_SETTINGS_DOMAIN_MAX_ENUM_EXT :: MAX_ENUM_EXT;
}

XrPerfSettingsSubDomainEXT :: enum s32 {
    COMPOSITING_EXT :: 1;
    RENDERING_EXT   :: 2;
    THERMAL_EXT     :: 3;
    MAX_ENUM_EXT    :: 2147483647;

    XR_PERF_SETTINGS_SUB_DOMAIN_COMPOSITING_EXT :: COMPOSITING_EXT;
    XR_PERF_SETTINGS_SUB_DOMAIN_RENDERING_EXT   :: RENDERING_EXT;
    XR_PERF_SETTINGS_SUB_DOMAIN_THERMAL_EXT     :: THERMAL_EXT;
    XR_PERF_SETTINGS_SUB_DOMAIN_MAX_ENUM_EXT    :: MAX_ENUM_EXT;
}

XrPerfSettingsLevelEXT :: enum s32 {
    POWER_SAVINGS_EXT  :: 0;
    SUSTAINED_LOW_EXT  :: 25;
    SUSTAINED_HIGH_EXT :: 50;
    BOOST_EXT          :: 75;
    MAX_ENUM_EXT       :: 2147483647;

    XR_PERF_SETTINGS_LEVEL_POWER_SAVINGS_EXT  :: POWER_SAVINGS_EXT;
    XR_PERF_SETTINGS_LEVEL_SUSTAINED_LOW_EXT  :: SUSTAINED_LOW_EXT;
    XR_PERF_SETTINGS_LEVEL_SUSTAINED_HIGH_EXT :: SUSTAINED_HIGH_EXT;
    XR_PERF_SETTINGS_LEVEL_BOOST_EXT          :: BOOST_EXT;
    XR_PERF_SETTINGS_LEVEL_MAX_ENUM_EXT       :: MAX_ENUM_EXT;
}

XrPerfSettingsNotificationLevelEXT :: enum s32 {
    NOTIF_LEVEL_NORMAL_EXT          :: 0;
    NOTIF_LEVEL_WARNING_EXT         :: 25;
    NOTIF_LEVEL_IMPAIRED_EXT        :: 75;
    NOTIFICATION_LEVEL_MAX_ENUM_EXT :: 2147483647;

    XR_PERF_SETTINGS_NOTIF_LEVEL_NORMAL_EXT          :: NOTIF_LEVEL_NORMAL_EXT;
    XR_PERF_SETTINGS_NOTIF_LEVEL_WARNING_EXT         :: NOTIF_LEVEL_WARNING_EXT;
    XR_PERF_SETTINGS_NOTIF_LEVEL_IMPAIRED_EXT        :: NOTIF_LEVEL_IMPAIRED_EXT;
    XR_PERF_SETTINGS_NOTIFICATION_LEVEL_MAX_ENUM_EXT :: NOTIFICATION_LEVEL_MAX_ENUM_EXT;
}

XrEventDataPerfSettingsEXT :: struct {
    type:      XrStructureType;
    next:      *void;
    domain:    XrPerfSettingsDomainEXT;
    subDomain: XrPerfSettingsSubDomainEXT;
    fromLevel: XrPerfSettingsNotificationLevelEXT;
    toLevel:   XrPerfSettingsNotificationLevelEXT;
}
#run {
    instance: XrEventDataPerfSettingsEXT;
    assert(((cast(*void)(*instance.type)) - cast(*void)(*instance)) == 0, "XrEventDataPerfSettingsEXT.type has unexpected offset % instead of 0", ((cast(*void)(*instance.type)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrEventDataPerfSettingsEXT.type)) == 4, "XrEventDataPerfSettingsEXT.type has unexpected size % instead of 4", size_of(type_of(XrEventDataPerfSettingsEXT.type)));
    assert(((cast(*void)(*instance.next)) - cast(*void)(*instance)) == 8, "XrEventDataPerfSettingsEXT.next has unexpected offset % instead of 8", ((cast(*void)(*instance.next)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrEventDataPerfSettingsEXT.next)) == 8, "XrEventDataPerfSettingsEXT.next has unexpected size % instead of 8", size_of(type_of(XrEventDataPerfSettingsEXT.next)));
    assert(((cast(*void)(*instance.domain)) - cast(*void)(*instance)) == 16, "XrEventDataPerfSettingsEXT.domain has unexpected offset % instead of 16", ((cast(*void)(*instance.domain)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrEventDataPerfSettingsEXT.domain)) == 4, "XrEventDataPerfSettingsEXT.domain has unexpected size % instead of 4", size_of(type_of(XrEventDataPerfSettingsEXT.domain)));
    assert(((cast(*void)(*instance.subDomain)) - cast(*void)(*instance)) == 20, "XrEventDataPerfSettingsEXT.subDomain has unexpected offset % instead of 20", ((cast(*void)(*instance.subDomain)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrEventDataPerfSettingsEXT.subDomain)) == 4, "XrEventDataPerfSettingsEXT.subDomain has unexpected size % instead of 4", size_of(type_of(XrEventDataPerfSettingsEXT.subDomain)));
    assert(((cast(*void)(*instance.fromLevel)) - cast(*void)(*instance)) == 24, "XrEventDataPerfSettingsEXT.fromLevel has unexpected offset % instead of 24", ((cast(*void)(*instance.fromLevel)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrEventDataPerfSettingsEXT.fromLevel)) == 4, "XrEventDataPerfSettingsEXT.fromLevel has unexpected size % instead of 4", size_of(type_of(XrEventDataPerfSettingsEXT.fromLevel)));
    assert(((cast(*void)(*instance.toLevel)) - cast(*void)(*instance)) == 28, "XrEventDataPerfSettingsEXT.toLevel has unexpected offset % instead of 28", ((cast(*void)(*instance.toLevel)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrEventDataPerfSettingsEXT.toLevel)) == 4, "XrEventDataPerfSettingsEXT.toLevel has unexpected size % instead of 4", size_of(type_of(XrEventDataPerfSettingsEXT.toLevel)));
    assert(size_of(XrEventDataPerfSettingsEXT) == 32, "XrEventDataPerfSettingsEXT has size % instead of 32", size_of(XrEventDataPerfSettingsEXT));
}

PFN_xrPerfSettingsSetPerformanceLevelEXT :: #type (a0: XrSession, a1: XrPerfSettingsDomainEXT, a2: XrPerfSettingsLevelEXT) -> XrResult #c_call;

PFN_xrThermalGetTemperatureTrendEXT :: #type (a0: XrSession, a1: XrPerfSettingsDomainEXT, a2: *XrPerfSettingsNotificationLevelEXT, a3: *float, a4: *float) -> XrResult #c_call;

XrDebugUtilsMessengerEXT_T :: struct {}
XrDebugUtilsMessengerEXT :: *XrDebugUtilsMessengerEXT_T;

// Flag bits for XrDebugUtilsMessageSeverityFlagsEXT
XR_DEBUG_UTILS_MESSAGE_SEVERITY_VERBOSE_BIT_EXT: XrDebugUtilsMessageSeverityFlagsEXT : 1;
XR_DEBUG_UTILS_MESSAGE_SEVERITY_INFO_BIT_EXT: XrDebugUtilsMessageSeverityFlagsEXT : 16;
XR_DEBUG_UTILS_MESSAGE_SEVERITY_WARNING_BIT_EXT: XrDebugUtilsMessageSeverityFlagsEXT : 256;
XR_DEBUG_UTILS_MESSAGE_SEVERITY_ERROR_BIT_EXT: XrDebugUtilsMessageSeverityFlagsEXT : 4096;

// Flag bits for XrDebugUtilsMessageTypeFlagsEXT
XR_DEBUG_UTILS_MESSAGE_TYPE_GENERAL_BIT_EXT: XrDebugUtilsMessageTypeFlagsEXT : 1;
XR_DEBUG_UTILS_MESSAGE_TYPE_VALIDATION_BIT_EXT: XrDebugUtilsMessageTypeFlagsEXT : 2;
XR_DEBUG_UTILS_MESSAGE_TYPE_PERFORMANCE_BIT_EXT: XrDebugUtilsMessageTypeFlagsEXT : 4;
XR_DEBUG_UTILS_MESSAGE_TYPE_CONFORMANCE_BIT_EXT: XrDebugUtilsMessageTypeFlagsEXT : 8;

XrDebugUtilsObjectNameInfoEXT :: struct {
    type:         XrStructureType;
    next:         *void;
    objectType:   XrObjectType;
    objectHandle: u64;
    objectName:   *u8;
}
#run {
    instance: XrDebugUtilsObjectNameInfoEXT;
    assert(((cast(*void)(*instance.type)) - cast(*void)(*instance)) == 0, "XrDebugUtilsObjectNameInfoEXT.type has unexpected offset % instead of 0", ((cast(*void)(*instance.type)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrDebugUtilsObjectNameInfoEXT.type)) == 4, "XrDebugUtilsObjectNameInfoEXT.type has unexpected size % instead of 4", size_of(type_of(XrDebugUtilsObjectNameInfoEXT.type)));
    assert(((cast(*void)(*instance.next)) - cast(*void)(*instance)) == 8, "XrDebugUtilsObjectNameInfoEXT.next has unexpected offset % instead of 8", ((cast(*void)(*instance.next)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrDebugUtilsObjectNameInfoEXT.next)) == 8, "XrDebugUtilsObjectNameInfoEXT.next has unexpected size % instead of 8", size_of(type_of(XrDebugUtilsObjectNameInfoEXT.next)));
    assert(((cast(*void)(*instance.objectType)) - cast(*void)(*instance)) == 16, "XrDebugUtilsObjectNameInfoEXT.objectType has unexpected offset % instead of 16", ((cast(*void)(*instance.objectType)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrDebugUtilsObjectNameInfoEXT.objectType)) == 4, "XrDebugUtilsObjectNameInfoEXT.objectType has unexpected size % instead of 4", size_of(type_of(XrDebugUtilsObjectNameInfoEXT.objectType)));
    assert(((cast(*void)(*instance.objectHandle)) - cast(*void)(*instance)) == 24, "XrDebugUtilsObjectNameInfoEXT.objectHandle has unexpected offset % instead of 24", ((cast(*void)(*instance.objectHandle)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrDebugUtilsObjectNameInfoEXT.objectHandle)) == 8, "XrDebugUtilsObjectNameInfoEXT.objectHandle has unexpected size % instead of 8", size_of(type_of(XrDebugUtilsObjectNameInfoEXT.objectHandle)));
    assert(((cast(*void)(*instance.objectName)) - cast(*void)(*instance)) == 32, "XrDebugUtilsObjectNameInfoEXT.objectName has unexpected offset % instead of 32", ((cast(*void)(*instance.objectName)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrDebugUtilsObjectNameInfoEXT.objectName)) == 8, "XrDebugUtilsObjectNameInfoEXT.objectName has unexpected size % instead of 8", size_of(type_of(XrDebugUtilsObjectNameInfoEXT.objectName)));
    assert(size_of(XrDebugUtilsObjectNameInfoEXT) == 40, "XrDebugUtilsObjectNameInfoEXT has size % instead of 40", size_of(XrDebugUtilsObjectNameInfoEXT));
}

XrDebugUtilsLabelEXT :: struct {
    type:      XrStructureType;
    next:      *void;
    labelName: *u8;
}
#run {
    instance: XrDebugUtilsLabelEXT;
    assert(((cast(*void)(*instance.type)) - cast(*void)(*instance)) == 0, "XrDebugUtilsLabelEXT.type has unexpected offset % instead of 0", ((cast(*void)(*instance.type)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrDebugUtilsLabelEXT.type)) == 4, "XrDebugUtilsLabelEXT.type has unexpected size % instead of 4", size_of(type_of(XrDebugUtilsLabelEXT.type)));
    assert(((cast(*void)(*instance.next)) - cast(*void)(*instance)) == 8, "XrDebugUtilsLabelEXT.next has unexpected offset % instead of 8", ((cast(*void)(*instance.next)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrDebugUtilsLabelEXT.next)) == 8, "XrDebugUtilsLabelEXT.next has unexpected size % instead of 8", size_of(type_of(XrDebugUtilsLabelEXT.next)));
    assert(((cast(*void)(*instance.labelName)) - cast(*void)(*instance)) == 16, "XrDebugUtilsLabelEXT.labelName has unexpected offset % instead of 16", ((cast(*void)(*instance.labelName)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrDebugUtilsLabelEXT.labelName)) == 8, "XrDebugUtilsLabelEXT.labelName has unexpected size % instead of 8", size_of(type_of(XrDebugUtilsLabelEXT.labelName)));
    assert(size_of(XrDebugUtilsLabelEXT) == 24, "XrDebugUtilsLabelEXT has size % instead of 24", size_of(XrDebugUtilsLabelEXT));
}

XrDebugUtilsMessengerCallbackDataEXT :: struct {
    type:              XrStructureType;
    next:              *void;
    messageId:         *u8;
    functionName:      *u8;
    message:           *u8;
    objectCount:       u32;
    objects:           *XrDebugUtilsObjectNameInfoEXT;
    sessionLabelCount: u32;
    sessionLabels:     *XrDebugUtilsLabelEXT;
}
#run {
    instance: XrDebugUtilsMessengerCallbackDataEXT;
    assert(((cast(*void)(*instance.type)) - cast(*void)(*instance)) == 0, "XrDebugUtilsMessengerCallbackDataEXT.type has unexpected offset % instead of 0", ((cast(*void)(*instance.type)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrDebugUtilsMessengerCallbackDataEXT.type)) == 4, "XrDebugUtilsMessengerCallbackDataEXT.type has unexpected size % instead of 4", size_of(type_of(XrDebugUtilsMessengerCallbackDataEXT.type)));
    assert(((cast(*void)(*instance.next)) - cast(*void)(*instance)) == 8, "XrDebugUtilsMessengerCallbackDataEXT.next has unexpected offset % instead of 8", ((cast(*void)(*instance.next)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrDebugUtilsMessengerCallbackDataEXT.next)) == 8, "XrDebugUtilsMessengerCallbackDataEXT.next has unexpected size % instead of 8", size_of(type_of(XrDebugUtilsMessengerCallbackDataEXT.next)));
    assert(((cast(*void)(*instance.messageId)) - cast(*void)(*instance)) == 16, "XrDebugUtilsMessengerCallbackDataEXT.messageId has unexpected offset % instead of 16", ((cast(*void)(*instance.messageId)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrDebugUtilsMessengerCallbackDataEXT.messageId)) == 8, "XrDebugUtilsMessengerCallbackDataEXT.messageId has unexpected size % instead of 8", size_of(type_of(XrDebugUtilsMessengerCallbackDataEXT.messageId)));
    assert(((cast(*void)(*instance.functionName)) - cast(*void)(*instance)) == 24, "XrDebugUtilsMessengerCallbackDataEXT.functionName has unexpected offset % instead of 24", ((cast(*void)(*instance.functionName)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrDebugUtilsMessengerCallbackDataEXT.functionName)) == 8, "XrDebugUtilsMessengerCallbackDataEXT.functionName has unexpected size % instead of 8", size_of(type_of(XrDebugUtilsMessengerCallbackDataEXT.functionName)));
    assert(((cast(*void)(*instance.message)) - cast(*void)(*instance)) == 32, "XrDebugUtilsMessengerCallbackDataEXT.message has unexpected offset % instead of 32", ((cast(*void)(*instance.message)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrDebugUtilsMessengerCallbackDataEXT.message)) == 8, "XrDebugUtilsMessengerCallbackDataEXT.message has unexpected size % instead of 8", size_of(type_of(XrDebugUtilsMessengerCallbackDataEXT.message)));
    assert(((cast(*void)(*instance.objectCount)) - cast(*void)(*instance)) == 40, "XrDebugUtilsMessengerCallbackDataEXT.objectCount has unexpected offset % instead of 40", ((cast(*void)(*instance.objectCount)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrDebugUtilsMessengerCallbackDataEXT.objectCount)) == 4, "XrDebugUtilsMessengerCallbackDataEXT.objectCount has unexpected size % instead of 4", size_of(type_of(XrDebugUtilsMessengerCallbackDataEXT.objectCount)));
    assert(((cast(*void)(*instance.objects)) - cast(*void)(*instance)) == 48, "XrDebugUtilsMessengerCallbackDataEXT.objects has unexpected offset % instead of 48", ((cast(*void)(*instance.objects)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrDebugUtilsMessengerCallbackDataEXT.objects)) == 8, "XrDebugUtilsMessengerCallbackDataEXT.objects has unexpected size % instead of 8", size_of(type_of(XrDebugUtilsMessengerCallbackDataEXT.objects)));
    assert(((cast(*void)(*instance.sessionLabelCount)) - cast(*void)(*instance)) == 56, "XrDebugUtilsMessengerCallbackDataEXT.sessionLabelCount has unexpected offset % instead of 56", ((cast(*void)(*instance.sessionLabelCount)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrDebugUtilsMessengerCallbackDataEXT.sessionLabelCount)) == 4, "XrDebugUtilsMessengerCallbackDataEXT.sessionLabelCount has unexpected size % instead of 4", size_of(type_of(XrDebugUtilsMessengerCallbackDataEXT.sessionLabelCount)));
    assert(((cast(*void)(*instance.sessionLabels)) - cast(*void)(*instance)) == 64, "XrDebugUtilsMessengerCallbackDataEXT.sessionLabels has unexpected offset % instead of 64", ((cast(*void)(*instance.sessionLabels)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrDebugUtilsMessengerCallbackDataEXT.sessionLabels)) == 8, "XrDebugUtilsMessengerCallbackDataEXT.sessionLabels has unexpected size % instead of 8", size_of(type_of(XrDebugUtilsMessengerCallbackDataEXT.sessionLabels)));
    assert(size_of(XrDebugUtilsMessengerCallbackDataEXT) == 72, "XrDebugUtilsMessengerCallbackDataEXT has size % instead of 72", size_of(XrDebugUtilsMessengerCallbackDataEXT));
}

PFN_xrDebugUtilsMessengerCallbackEXT :: #type (a0: XrDebugUtilsMessageSeverityFlagsEXT, a1: XrDebugUtilsMessageTypeFlagsEXT, a2: *XrDebugUtilsMessengerCallbackDataEXT, a3: *void) -> XrBool32 #c_call;

// XrDebugUtilsMessengerCreateInfoEXT extends XrInstanceCreateInfo
XrDebugUtilsMessengerCreateInfoEXT :: struct {
    type:              XrStructureType;
    next:              *void;
    messageSeverities: XrDebugUtilsMessageSeverityFlagsEXT;
    messageTypes:      XrDebugUtilsMessageTypeFlagsEXT;
    userCallback:      PFN_xrDebugUtilsMessengerCallbackEXT;
    userData:          *void;
}
#run {
    instance: XrDebugUtilsMessengerCreateInfoEXT;
    assert(((cast(*void)(*instance.type)) - cast(*void)(*instance)) == 0, "XrDebugUtilsMessengerCreateInfoEXT.type has unexpected offset % instead of 0", ((cast(*void)(*instance.type)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrDebugUtilsMessengerCreateInfoEXT.type)) == 4, "XrDebugUtilsMessengerCreateInfoEXT.type has unexpected size % instead of 4", size_of(type_of(XrDebugUtilsMessengerCreateInfoEXT.type)));
    assert(((cast(*void)(*instance.next)) - cast(*void)(*instance)) == 8, "XrDebugUtilsMessengerCreateInfoEXT.next has unexpected offset % instead of 8", ((cast(*void)(*instance.next)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrDebugUtilsMessengerCreateInfoEXT.next)) == 8, "XrDebugUtilsMessengerCreateInfoEXT.next has unexpected size % instead of 8", size_of(type_of(XrDebugUtilsMessengerCreateInfoEXT.next)));
    assert(((cast(*void)(*instance.messageSeverities)) - cast(*void)(*instance)) == 16, "XrDebugUtilsMessengerCreateInfoEXT.messageSeverities has unexpected offset % instead of 16", ((cast(*void)(*instance.messageSeverities)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrDebugUtilsMessengerCreateInfoEXT.messageSeverities)) == 8, "XrDebugUtilsMessengerCreateInfoEXT.messageSeverities has unexpected size % instead of 8", size_of(type_of(XrDebugUtilsMessengerCreateInfoEXT.messageSeverities)));
    assert(((cast(*void)(*instance.messageTypes)) - cast(*void)(*instance)) == 24, "XrDebugUtilsMessengerCreateInfoEXT.messageTypes has unexpected offset % instead of 24", ((cast(*void)(*instance.messageTypes)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrDebugUtilsMessengerCreateInfoEXT.messageTypes)) == 8, "XrDebugUtilsMessengerCreateInfoEXT.messageTypes has unexpected size % instead of 8", size_of(type_of(XrDebugUtilsMessengerCreateInfoEXT.messageTypes)));
    assert(((cast(*void)(*instance.userCallback)) - cast(*void)(*instance)) == 32, "XrDebugUtilsMessengerCreateInfoEXT.userCallback has unexpected offset % instead of 32", ((cast(*void)(*instance.userCallback)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrDebugUtilsMessengerCreateInfoEXT.userCallback)) == 8, "XrDebugUtilsMessengerCreateInfoEXT.userCallback has unexpected size % instead of 8", size_of(type_of(XrDebugUtilsMessengerCreateInfoEXT.userCallback)));
    assert(((cast(*void)(*instance.userData)) - cast(*void)(*instance)) == 40, "XrDebugUtilsMessengerCreateInfoEXT.userData has unexpected offset % instead of 40", ((cast(*void)(*instance.userData)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrDebugUtilsMessengerCreateInfoEXT.userData)) == 8, "XrDebugUtilsMessengerCreateInfoEXT.userData has unexpected size % instead of 8", size_of(type_of(XrDebugUtilsMessengerCreateInfoEXT.userData)));
    assert(size_of(XrDebugUtilsMessengerCreateInfoEXT) == 48, "XrDebugUtilsMessengerCreateInfoEXT has size % instead of 48", size_of(XrDebugUtilsMessengerCreateInfoEXT));
}

PFN_xrSetDebugUtilsObjectNameEXT :: #type (a0: XrInstance, a1: *XrDebugUtilsObjectNameInfoEXT) -> XrResult #c_call;
PFN_xrCreateDebugUtilsMessengerEXT :: #type (a0: XrInstance, a1: *XrDebugUtilsMessengerCreateInfoEXT, a2: *XrDebugUtilsMessengerEXT) -> XrResult #c_call;
PFN_xrDestroyDebugUtilsMessengerEXT :: #type (a0: XrDebugUtilsMessengerEXT) -> XrResult #c_call;
PFN_xrSubmitDebugUtilsMessageEXT :: #type (a0: XrInstance, a1: XrDebugUtilsMessageSeverityFlagsEXT, a2: XrDebugUtilsMessageTypeFlagsEXT, a3: *XrDebugUtilsMessengerCallbackDataEXT) -> XrResult #c_call;
PFN_xrSessionBeginDebugUtilsLabelRegionEXT :: #type (a0: XrSession, a1: *XrDebugUtilsLabelEXT) -> XrResult #c_call;
PFN_xrSessionEndDebugUtilsLabelRegionEXT :: #type (a0: XrSession) -> XrResult #c_call;
PFN_xrSessionInsertDebugUtilsLabelEXT :: #type (a0: XrSession, a1: *XrDebugUtilsLabelEXT) -> XrResult #c_call;

// XrSystemEyeGazeInteractionPropertiesEXT extends XrSystemProperties
XrSystemEyeGazeInteractionPropertiesEXT :: struct {
    type:                       XrStructureType;
    next:                       *void;
    supportsEyeGazeInteraction: XrBool32;
}
#run {
    instance: XrSystemEyeGazeInteractionPropertiesEXT;
    assert(((cast(*void)(*instance.type)) - cast(*void)(*instance)) == 0, "XrSystemEyeGazeInteractionPropertiesEXT.type has unexpected offset % instead of 0", ((cast(*void)(*instance.type)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrSystemEyeGazeInteractionPropertiesEXT.type)) == 4, "XrSystemEyeGazeInteractionPropertiesEXT.type has unexpected size % instead of 4", size_of(type_of(XrSystemEyeGazeInteractionPropertiesEXT.type)));
    assert(((cast(*void)(*instance.next)) - cast(*void)(*instance)) == 8, "XrSystemEyeGazeInteractionPropertiesEXT.next has unexpected offset % instead of 8", ((cast(*void)(*instance.next)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrSystemEyeGazeInteractionPropertiesEXT.next)) == 8, "XrSystemEyeGazeInteractionPropertiesEXT.next has unexpected size % instead of 8", size_of(type_of(XrSystemEyeGazeInteractionPropertiesEXT.next)));
    assert(((cast(*void)(*instance.supportsEyeGazeInteraction)) - cast(*void)(*instance)) == 16, "XrSystemEyeGazeInteractionPropertiesEXT.supportsEyeGazeInteraction has unexpected offset % instead of 16", ((cast(*void)(*instance.supportsEyeGazeInteraction)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrSystemEyeGazeInteractionPropertiesEXT.supportsEyeGazeInteraction)) == 4, "XrSystemEyeGazeInteractionPropertiesEXT.supportsEyeGazeInteraction has unexpected size % instead of 4", size_of(type_of(XrSystemEyeGazeInteractionPropertiesEXT.supportsEyeGazeInteraction)));
    assert(size_of(XrSystemEyeGazeInteractionPropertiesEXT) == 24, "XrSystemEyeGazeInteractionPropertiesEXT has size % instead of 24", size_of(XrSystemEyeGazeInteractionPropertiesEXT));
}

// XrEyeGazeSampleTimeEXT extends XrSpaceLocation
XrEyeGazeSampleTimeEXT :: struct {
    type: XrStructureType;
    next: *void;
    time: XrTime;
}
#run {
    instance: XrEyeGazeSampleTimeEXT;
    assert(((cast(*void)(*instance.type)) - cast(*void)(*instance)) == 0, "XrEyeGazeSampleTimeEXT.type has unexpected offset % instead of 0", ((cast(*void)(*instance.type)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrEyeGazeSampleTimeEXT.type)) == 4, "XrEyeGazeSampleTimeEXT.type has unexpected size % instead of 4", size_of(type_of(XrEyeGazeSampleTimeEXT.type)));
    assert(((cast(*void)(*instance.next)) - cast(*void)(*instance)) == 8, "XrEyeGazeSampleTimeEXT.next has unexpected offset % instead of 8", ((cast(*void)(*instance.next)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrEyeGazeSampleTimeEXT.next)) == 8, "XrEyeGazeSampleTimeEXT.next has unexpected size % instead of 8", size_of(type_of(XrEyeGazeSampleTimeEXT.next)));
    assert(((cast(*void)(*instance.time)) - cast(*void)(*instance)) == 16, "XrEyeGazeSampleTimeEXT.time has unexpected offset % instead of 16", ((cast(*void)(*instance.time)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrEyeGazeSampleTimeEXT.time)) == 8, "XrEyeGazeSampleTimeEXT.time has unexpected size % instead of 8", size_of(type_of(XrEyeGazeSampleTimeEXT.time)));
    assert(size_of(XrEyeGazeSampleTimeEXT) == 24, "XrEyeGazeSampleTimeEXT has size % instead of 24", size_of(XrEyeGazeSampleTimeEXT));
}

XrOverlaySessionCreateFlagsEXTX :: XrFlags64;

// Flag bits for XrOverlaySessionCreateFlagsEXTX
XrOverlayMainSessionFlagsEXTX :: XrFlags64;

// Flag bits for XrOverlayMainSessionFlagsEXTX
XR_OVERLAY_MAIN_SESSION_ENABLED_COMPOSITION_LAYER_INFO_DEPTH_BIT_EXTX: XrOverlayMainSessionFlagsEXTX : 1;

// XrSessionCreateInfoOverlayEXTX extends XrSessionCreateInfo
XrSessionCreateInfoOverlayEXTX :: struct {
    type:                   XrStructureType;
    next:                   *void;
    createFlags:            XrOverlaySessionCreateFlagsEXTX;
    sessionLayersPlacement: u32;
}
#run {
    instance: XrSessionCreateInfoOverlayEXTX;
    assert(((cast(*void)(*instance.type)) - cast(*void)(*instance)) == 0, "XrSessionCreateInfoOverlayEXTX.type has unexpected offset % instead of 0", ((cast(*void)(*instance.type)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrSessionCreateInfoOverlayEXTX.type)) == 4, "XrSessionCreateInfoOverlayEXTX.type has unexpected size % instead of 4", size_of(type_of(XrSessionCreateInfoOverlayEXTX.type)));
    assert(((cast(*void)(*instance.next)) - cast(*void)(*instance)) == 8, "XrSessionCreateInfoOverlayEXTX.next has unexpected offset % instead of 8", ((cast(*void)(*instance.next)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrSessionCreateInfoOverlayEXTX.next)) == 8, "XrSessionCreateInfoOverlayEXTX.next has unexpected size % instead of 8", size_of(type_of(XrSessionCreateInfoOverlayEXTX.next)));
    assert(((cast(*void)(*instance.createFlags)) - cast(*void)(*instance)) == 16, "XrSessionCreateInfoOverlayEXTX.createFlags has unexpected offset % instead of 16", ((cast(*void)(*instance.createFlags)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrSessionCreateInfoOverlayEXTX.createFlags)) == 8, "XrSessionCreateInfoOverlayEXTX.createFlags has unexpected size % instead of 8", size_of(type_of(XrSessionCreateInfoOverlayEXTX.createFlags)));
    assert(((cast(*void)(*instance.sessionLayersPlacement)) - cast(*void)(*instance)) == 24, "XrSessionCreateInfoOverlayEXTX.sessionLayersPlacement has unexpected offset % instead of 24", ((cast(*void)(*instance.sessionLayersPlacement)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrSessionCreateInfoOverlayEXTX.sessionLayersPlacement)) == 4, "XrSessionCreateInfoOverlayEXTX.sessionLayersPlacement has unexpected size % instead of 4", size_of(type_of(XrSessionCreateInfoOverlayEXTX.sessionLayersPlacement)));
    assert(size_of(XrSessionCreateInfoOverlayEXTX) == 32, "XrSessionCreateInfoOverlayEXTX has size % instead of 32", size_of(XrSessionCreateInfoOverlayEXTX));
}

XrEventDataMainSessionVisibilityChangedEXTX :: struct {
    type:    XrStructureType;
    next:    *void;
    visible: XrBool32;
    flags:   XrOverlayMainSessionFlagsEXTX;
}
#run {
    instance: XrEventDataMainSessionVisibilityChangedEXTX;
    assert(((cast(*void)(*instance.type)) - cast(*void)(*instance)) == 0, "XrEventDataMainSessionVisibilityChangedEXTX.type has unexpected offset % instead of 0", ((cast(*void)(*instance.type)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrEventDataMainSessionVisibilityChangedEXTX.type)) == 4, "XrEventDataMainSessionVisibilityChangedEXTX.type has unexpected size % instead of 4", size_of(type_of(XrEventDataMainSessionVisibilityChangedEXTX.type)));
    assert(((cast(*void)(*instance.next)) - cast(*void)(*instance)) == 8, "XrEventDataMainSessionVisibilityChangedEXTX.next has unexpected offset % instead of 8", ((cast(*void)(*instance.next)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrEventDataMainSessionVisibilityChangedEXTX.next)) == 8, "XrEventDataMainSessionVisibilityChangedEXTX.next has unexpected size % instead of 8", size_of(type_of(XrEventDataMainSessionVisibilityChangedEXTX.next)));
    assert(((cast(*void)(*instance.visible)) - cast(*void)(*instance)) == 16, "XrEventDataMainSessionVisibilityChangedEXTX.visible has unexpected offset % instead of 16", ((cast(*void)(*instance.visible)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrEventDataMainSessionVisibilityChangedEXTX.visible)) == 4, "XrEventDataMainSessionVisibilityChangedEXTX.visible has unexpected size % instead of 4", size_of(type_of(XrEventDataMainSessionVisibilityChangedEXTX.visible)));
    assert(((cast(*void)(*instance.flags)) - cast(*void)(*instance)) == 24, "XrEventDataMainSessionVisibilityChangedEXTX.flags has unexpected offset % instead of 24", ((cast(*void)(*instance.flags)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrEventDataMainSessionVisibilityChangedEXTX.flags)) == 8, "XrEventDataMainSessionVisibilityChangedEXTX.flags has unexpected size % instead of 8", size_of(type_of(XrEventDataMainSessionVisibilityChangedEXTX.flags)));
    assert(size_of(XrEventDataMainSessionVisibilityChangedEXTX) == 32, "XrEventDataMainSessionVisibilityChangedEXTX has size % instead of 32", size_of(XrEventDataMainSessionVisibilityChangedEXTX));
}

XrSpatialAnchorMSFT_T :: struct {}
XrSpatialAnchorMSFT :: *XrSpatialAnchorMSFT_T;

XrSpatialAnchorCreateInfoMSFT :: struct {
    type:  XrStructureType;
    next:  *void;
    space: XrSpace;
    pose:  XrPosef;
    time:  XrTime;
}
#run {
    instance: XrSpatialAnchorCreateInfoMSFT;
    assert(((cast(*void)(*instance.type)) - cast(*void)(*instance)) == 0, "XrSpatialAnchorCreateInfoMSFT.type has unexpected offset % instead of 0", ((cast(*void)(*instance.type)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrSpatialAnchorCreateInfoMSFT.type)) == 4, "XrSpatialAnchorCreateInfoMSFT.type has unexpected size % instead of 4", size_of(type_of(XrSpatialAnchorCreateInfoMSFT.type)));
    assert(((cast(*void)(*instance.next)) - cast(*void)(*instance)) == 8, "XrSpatialAnchorCreateInfoMSFT.next has unexpected offset % instead of 8", ((cast(*void)(*instance.next)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrSpatialAnchorCreateInfoMSFT.next)) == 8, "XrSpatialAnchorCreateInfoMSFT.next has unexpected size % instead of 8", size_of(type_of(XrSpatialAnchorCreateInfoMSFT.next)));
    assert(((cast(*void)(*instance.space)) - cast(*void)(*instance)) == 16, "XrSpatialAnchorCreateInfoMSFT.space has unexpected offset % instead of 16", ((cast(*void)(*instance.space)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrSpatialAnchorCreateInfoMSFT.space)) == 8, "XrSpatialAnchorCreateInfoMSFT.space has unexpected size % instead of 8", size_of(type_of(XrSpatialAnchorCreateInfoMSFT.space)));
    assert(((cast(*void)(*instance.pose)) - cast(*void)(*instance)) == 24, "XrSpatialAnchorCreateInfoMSFT.pose has unexpected offset % instead of 24", ((cast(*void)(*instance.pose)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrSpatialAnchorCreateInfoMSFT.pose)) == 28, "XrSpatialAnchorCreateInfoMSFT.pose has unexpected size % instead of 28", size_of(type_of(XrSpatialAnchorCreateInfoMSFT.pose)));
    assert(((cast(*void)(*instance.time)) - cast(*void)(*instance)) == 56, "XrSpatialAnchorCreateInfoMSFT.time has unexpected offset % instead of 56", ((cast(*void)(*instance.time)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrSpatialAnchorCreateInfoMSFT.time)) == 8, "XrSpatialAnchorCreateInfoMSFT.time has unexpected size % instead of 8", size_of(type_of(XrSpatialAnchorCreateInfoMSFT.time)));
    assert(size_of(XrSpatialAnchorCreateInfoMSFT) == 64, "XrSpatialAnchorCreateInfoMSFT has size % instead of 64", size_of(XrSpatialAnchorCreateInfoMSFT));
}

XrSpatialAnchorSpaceCreateInfoMSFT :: struct {
    type:              XrStructureType;
    next:              *void;
    anchor:            XrSpatialAnchorMSFT;
    poseInAnchorSpace: XrPosef;
}
#run {
    instance: XrSpatialAnchorSpaceCreateInfoMSFT;
    assert(((cast(*void)(*instance.type)) - cast(*void)(*instance)) == 0, "XrSpatialAnchorSpaceCreateInfoMSFT.type has unexpected offset % instead of 0", ((cast(*void)(*instance.type)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrSpatialAnchorSpaceCreateInfoMSFT.type)) == 4, "XrSpatialAnchorSpaceCreateInfoMSFT.type has unexpected size % instead of 4", size_of(type_of(XrSpatialAnchorSpaceCreateInfoMSFT.type)));
    assert(((cast(*void)(*instance.next)) - cast(*void)(*instance)) == 8, "XrSpatialAnchorSpaceCreateInfoMSFT.next has unexpected offset % instead of 8", ((cast(*void)(*instance.next)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrSpatialAnchorSpaceCreateInfoMSFT.next)) == 8, "XrSpatialAnchorSpaceCreateInfoMSFT.next has unexpected size % instead of 8", size_of(type_of(XrSpatialAnchorSpaceCreateInfoMSFT.next)));
    assert(((cast(*void)(*instance.anchor)) - cast(*void)(*instance)) == 16, "XrSpatialAnchorSpaceCreateInfoMSFT.anchor has unexpected offset % instead of 16", ((cast(*void)(*instance.anchor)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrSpatialAnchorSpaceCreateInfoMSFT.anchor)) == 8, "XrSpatialAnchorSpaceCreateInfoMSFT.anchor has unexpected size % instead of 8", size_of(type_of(XrSpatialAnchorSpaceCreateInfoMSFT.anchor)));
    assert(((cast(*void)(*instance.poseInAnchorSpace)) - cast(*void)(*instance)) == 24, "XrSpatialAnchorSpaceCreateInfoMSFT.poseInAnchorSpace has unexpected offset % instead of 24", ((cast(*void)(*instance.poseInAnchorSpace)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrSpatialAnchorSpaceCreateInfoMSFT.poseInAnchorSpace)) == 28, "XrSpatialAnchorSpaceCreateInfoMSFT.poseInAnchorSpace has unexpected size % instead of 28", size_of(type_of(XrSpatialAnchorSpaceCreateInfoMSFT.poseInAnchorSpace)));
    assert(size_of(XrSpatialAnchorSpaceCreateInfoMSFT) == 56, "XrSpatialAnchorSpaceCreateInfoMSFT has size % instead of 56", size_of(XrSpatialAnchorSpaceCreateInfoMSFT));
}

PFN_xrCreateSpatialAnchorMSFT :: #type (a0: XrSession, a1: *XrSpatialAnchorCreateInfoMSFT, a2: *XrSpatialAnchorMSFT) -> XrResult #c_call;
PFN_xrCreateSpatialAnchorSpaceMSFT :: #type (a0: XrSession, a1: *XrSpatialAnchorSpaceCreateInfoMSFT, a2: *XrSpace) -> XrResult #c_call;
PFN_xrDestroySpatialAnchorMSFT :: #type (a0: XrSpatialAnchorMSFT) -> XrResult #c_call;

XrCompositionLayerImageLayoutFlagsFB :: XrFlags64;

// Flag bits for XrCompositionLayerImageLayoutFlagsFB
XR_COMPOSITION_LAYER_IMAGE_LAYOUT_VERTICAL_FLIP_BIT_FB: XrCompositionLayerImageLayoutFlagsFB : 1;

// XrCompositionLayerImageLayoutFB extends XrCompositionLayerBaseHeader
XrCompositionLayerImageLayoutFB :: struct {
    type:  XrStructureType;
    next:  *void;
    flags: XrCompositionLayerImageLayoutFlagsFB;
}
#run {
    instance: XrCompositionLayerImageLayoutFB;
    assert(((cast(*void)(*instance.type)) - cast(*void)(*instance)) == 0, "XrCompositionLayerImageLayoutFB.type has unexpected offset % instead of 0", ((cast(*void)(*instance.type)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrCompositionLayerImageLayoutFB.type)) == 4, "XrCompositionLayerImageLayoutFB.type has unexpected size % instead of 4", size_of(type_of(XrCompositionLayerImageLayoutFB.type)));
    assert(((cast(*void)(*instance.next)) - cast(*void)(*instance)) == 8, "XrCompositionLayerImageLayoutFB.next has unexpected offset % instead of 8", ((cast(*void)(*instance.next)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrCompositionLayerImageLayoutFB.next)) == 8, "XrCompositionLayerImageLayoutFB.next has unexpected size % instead of 8", size_of(type_of(XrCompositionLayerImageLayoutFB.next)));
    assert(((cast(*void)(*instance.flags)) - cast(*void)(*instance)) == 16, "XrCompositionLayerImageLayoutFB.flags has unexpected offset % instead of 16", ((cast(*void)(*instance.flags)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrCompositionLayerImageLayoutFB.flags)) == 8, "XrCompositionLayerImageLayoutFB.flags has unexpected size % instead of 8", size_of(type_of(XrCompositionLayerImageLayoutFB.flags)));
    assert(size_of(XrCompositionLayerImageLayoutFB) == 24, "XrCompositionLayerImageLayoutFB has size % instead of 24", size_of(XrCompositionLayerImageLayoutFB));
}

XrBlendFactorFB :: enum s32 {
    ZERO_FB                :: 0;
    ONE_FB                 :: 1;
    SRC_ALPHA_FB           :: 2;
    ONE_MINUS_SRC_ALPHA_FB :: 3;
    DST_ALPHA_FB           :: 4;
    ONE_MINUS_DST_ALPHA_FB :: 5;
    MAX_ENUM_FB            :: 2147483647;

    XR_BLEND_FACTOR_ZERO_FB                :: ZERO_FB;
    XR_BLEND_FACTOR_ONE_FB                 :: ONE_FB;
    XR_BLEND_FACTOR_SRC_ALPHA_FB           :: SRC_ALPHA_FB;
    XR_BLEND_FACTOR_ONE_MINUS_SRC_ALPHA_FB :: ONE_MINUS_SRC_ALPHA_FB;
    XR_BLEND_FACTOR_DST_ALPHA_FB           :: DST_ALPHA_FB;
    XR_BLEND_FACTOR_ONE_MINUS_DST_ALPHA_FB :: ONE_MINUS_DST_ALPHA_FB;
    XR_BLEND_FACTOR_MAX_ENUM_FB            :: MAX_ENUM_FB;
}

// XrCompositionLayerAlphaBlendFB extends XrCompositionLayerBaseHeader
XrCompositionLayerAlphaBlendFB :: struct {
    type:           XrStructureType;
    next:           *void;
    srcFactorColor: XrBlendFactorFB;
    dstFactorColor: XrBlendFactorFB;
    srcFactorAlpha: XrBlendFactorFB;
    dstFactorAlpha: XrBlendFactorFB;
}
#run {
    instance: XrCompositionLayerAlphaBlendFB;
    assert(((cast(*void)(*instance.type)) - cast(*void)(*instance)) == 0, "XrCompositionLayerAlphaBlendFB.type has unexpected offset % instead of 0", ((cast(*void)(*instance.type)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrCompositionLayerAlphaBlendFB.type)) == 4, "XrCompositionLayerAlphaBlendFB.type has unexpected size % instead of 4", size_of(type_of(XrCompositionLayerAlphaBlendFB.type)));
    assert(((cast(*void)(*instance.next)) - cast(*void)(*instance)) == 8, "XrCompositionLayerAlphaBlendFB.next has unexpected offset % instead of 8", ((cast(*void)(*instance.next)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrCompositionLayerAlphaBlendFB.next)) == 8, "XrCompositionLayerAlphaBlendFB.next has unexpected size % instead of 8", size_of(type_of(XrCompositionLayerAlphaBlendFB.next)));
    assert(((cast(*void)(*instance.srcFactorColor)) - cast(*void)(*instance)) == 16, "XrCompositionLayerAlphaBlendFB.srcFactorColor has unexpected offset % instead of 16", ((cast(*void)(*instance.srcFactorColor)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrCompositionLayerAlphaBlendFB.srcFactorColor)) == 4, "XrCompositionLayerAlphaBlendFB.srcFactorColor has unexpected size % instead of 4", size_of(type_of(XrCompositionLayerAlphaBlendFB.srcFactorColor)));
    assert(((cast(*void)(*instance.dstFactorColor)) - cast(*void)(*instance)) == 20, "XrCompositionLayerAlphaBlendFB.dstFactorColor has unexpected offset % instead of 20", ((cast(*void)(*instance.dstFactorColor)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrCompositionLayerAlphaBlendFB.dstFactorColor)) == 4, "XrCompositionLayerAlphaBlendFB.dstFactorColor has unexpected size % instead of 4", size_of(type_of(XrCompositionLayerAlphaBlendFB.dstFactorColor)));
    assert(((cast(*void)(*instance.srcFactorAlpha)) - cast(*void)(*instance)) == 24, "XrCompositionLayerAlphaBlendFB.srcFactorAlpha has unexpected offset % instead of 24", ((cast(*void)(*instance.srcFactorAlpha)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrCompositionLayerAlphaBlendFB.srcFactorAlpha)) == 4, "XrCompositionLayerAlphaBlendFB.srcFactorAlpha has unexpected size % instead of 4", size_of(type_of(XrCompositionLayerAlphaBlendFB.srcFactorAlpha)));
    assert(((cast(*void)(*instance.dstFactorAlpha)) - cast(*void)(*instance)) == 28, "XrCompositionLayerAlphaBlendFB.dstFactorAlpha has unexpected offset % instead of 28", ((cast(*void)(*instance.dstFactorAlpha)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrCompositionLayerAlphaBlendFB.dstFactorAlpha)) == 4, "XrCompositionLayerAlphaBlendFB.dstFactorAlpha has unexpected size % instead of 4", size_of(type_of(XrCompositionLayerAlphaBlendFB.dstFactorAlpha)));
    assert(size_of(XrCompositionLayerAlphaBlendFB) == 32, "XrCompositionLayerAlphaBlendFB has size % instead of 32", size_of(XrCompositionLayerAlphaBlendFB));
}

// XrViewConfigurationDepthRangeEXT extends XrViewConfigurationView
XrViewConfigurationDepthRangeEXT :: struct {
    type:             XrStructureType;
    next:             *void;
    recommendedNearZ: float;
    minNearZ:         float;
    recommendedFarZ:  float;
    maxFarZ:          float;
}
#run {
    instance: XrViewConfigurationDepthRangeEXT;
    assert(((cast(*void)(*instance.type)) - cast(*void)(*instance)) == 0, "XrViewConfigurationDepthRangeEXT.type has unexpected offset % instead of 0", ((cast(*void)(*instance.type)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrViewConfigurationDepthRangeEXT.type)) == 4, "XrViewConfigurationDepthRangeEXT.type has unexpected size % instead of 4", size_of(type_of(XrViewConfigurationDepthRangeEXT.type)));
    assert(((cast(*void)(*instance.next)) - cast(*void)(*instance)) == 8, "XrViewConfigurationDepthRangeEXT.next has unexpected offset % instead of 8", ((cast(*void)(*instance.next)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrViewConfigurationDepthRangeEXT.next)) == 8, "XrViewConfigurationDepthRangeEXT.next has unexpected size % instead of 8", size_of(type_of(XrViewConfigurationDepthRangeEXT.next)));
    assert(((cast(*void)(*instance.recommendedNearZ)) - cast(*void)(*instance)) == 16, "XrViewConfigurationDepthRangeEXT.recommendedNearZ has unexpected offset % instead of 16", ((cast(*void)(*instance.recommendedNearZ)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrViewConfigurationDepthRangeEXT.recommendedNearZ)) == 4, "XrViewConfigurationDepthRangeEXT.recommendedNearZ has unexpected size % instead of 4", size_of(type_of(XrViewConfigurationDepthRangeEXT.recommendedNearZ)));
    assert(((cast(*void)(*instance.minNearZ)) - cast(*void)(*instance)) == 20, "XrViewConfigurationDepthRangeEXT.minNearZ has unexpected offset % instead of 20", ((cast(*void)(*instance.minNearZ)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrViewConfigurationDepthRangeEXT.minNearZ)) == 4, "XrViewConfigurationDepthRangeEXT.minNearZ has unexpected size % instead of 4", size_of(type_of(XrViewConfigurationDepthRangeEXT.minNearZ)));
    assert(((cast(*void)(*instance.recommendedFarZ)) - cast(*void)(*instance)) == 24, "XrViewConfigurationDepthRangeEXT.recommendedFarZ has unexpected offset % instead of 24", ((cast(*void)(*instance.recommendedFarZ)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrViewConfigurationDepthRangeEXT.recommendedFarZ)) == 4, "XrViewConfigurationDepthRangeEXT.recommendedFarZ has unexpected size % instead of 4", size_of(type_of(XrViewConfigurationDepthRangeEXT.recommendedFarZ)));
    assert(((cast(*void)(*instance.maxFarZ)) - cast(*void)(*instance)) == 28, "XrViewConfigurationDepthRangeEXT.maxFarZ has unexpected offset % instead of 28", ((cast(*void)(*instance.maxFarZ)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrViewConfigurationDepthRangeEXT.maxFarZ)) == 4, "XrViewConfigurationDepthRangeEXT.maxFarZ has unexpected size % instead of 4", size_of(type_of(XrViewConfigurationDepthRangeEXT.maxFarZ)));
    assert(size_of(XrViewConfigurationDepthRangeEXT) == 32, "XrViewConfigurationDepthRangeEXT has size % instead of 32", size_of(XrViewConfigurationDepthRangeEXT));
}

PFN_xrSetInputDeviceActiveEXT :: #type (a0: XrSession, a1: XrPath, a2: XrPath, a3: XrBool32) -> XrResult #c_call;
PFN_xrSetInputDeviceStateBoolEXT :: #type (a0: XrSession, a1: XrPath, a2: XrPath, a3: XrBool32) -> XrResult #c_call;
PFN_xrSetInputDeviceStateFloatEXT :: #type (a0: XrSession, a1: XrPath, a2: XrPath, a3: float) -> XrResult #c_call;
PFN_xrSetInputDeviceStateVector2fEXT :: #type (a0: XrSession, a1: XrPath, a2: XrPath, a3: XrVector2f) -> XrResult #c_call;
PFN_xrSetInputDeviceLocationEXT :: #type (a0: XrSession, a1: XrPath, a2: XrPath, a3: XrSpace, a4: XrPosef) -> XrResult #c_call;

XrSpatialGraphNodeBindingMSFT_T :: struct {}
XrSpatialGraphNodeBindingMSFT :: *XrSpatialGraphNodeBindingMSFT_T;

XrSpatialGraphNodeTypeMSFT :: enum s32 {
    STATIC_MSFT   :: 1;
    DYNAMIC_MSFT  :: 2;
    MAX_ENUM_MSFT :: 2147483647;

    XR_SPATIAL_GRAPH_NODE_TYPE_STATIC_MSFT   :: STATIC_MSFT;
    XR_SPATIAL_GRAPH_NODE_TYPE_DYNAMIC_MSFT  :: DYNAMIC_MSFT;
    XR_SPATIAL_GRAPH_NODE_TYPE_MAX_ENUM_MSFT :: MAX_ENUM_MSFT;
}

XrSpatialGraphNodeSpaceCreateInfoMSFT :: struct {
    type:     XrStructureType;
    next:     *void;
    nodeType: XrSpatialGraphNodeTypeMSFT;
    nodeId:   [16] u8;
    pose:     XrPosef;
}
#run {
    instance: XrSpatialGraphNodeSpaceCreateInfoMSFT;
    assert(((cast(*void)(*instance.type)) - cast(*void)(*instance)) == 0, "XrSpatialGraphNodeSpaceCreateInfoMSFT.type has unexpected offset % instead of 0", ((cast(*void)(*instance.type)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrSpatialGraphNodeSpaceCreateInfoMSFT.type)) == 4, "XrSpatialGraphNodeSpaceCreateInfoMSFT.type has unexpected size % instead of 4", size_of(type_of(XrSpatialGraphNodeSpaceCreateInfoMSFT.type)));
    assert(((cast(*void)(*instance.next)) - cast(*void)(*instance)) == 8, "XrSpatialGraphNodeSpaceCreateInfoMSFT.next has unexpected offset % instead of 8", ((cast(*void)(*instance.next)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrSpatialGraphNodeSpaceCreateInfoMSFT.next)) == 8, "XrSpatialGraphNodeSpaceCreateInfoMSFT.next has unexpected size % instead of 8", size_of(type_of(XrSpatialGraphNodeSpaceCreateInfoMSFT.next)));
    assert(((cast(*void)(*instance.nodeType)) - cast(*void)(*instance)) == 16, "XrSpatialGraphNodeSpaceCreateInfoMSFT.nodeType has unexpected offset % instead of 16", ((cast(*void)(*instance.nodeType)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrSpatialGraphNodeSpaceCreateInfoMSFT.nodeType)) == 4, "XrSpatialGraphNodeSpaceCreateInfoMSFT.nodeType has unexpected size % instead of 4", size_of(type_of(XrSpatialGraphNodeSpaceCreateInfoMSFT.nodeType)));
    assert(((cast(*void)(*instance.nodeId)) - cast(*void)(*instance)) == 20, "XrSpatialGraphNodeSpaceCreateInfoMSFT.nodeId has unexpected offset % instead of 20", ((cast(*void)(*instance.nodeId)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrSpatialGraphNodeSpaceCreateInfoMSFT.nodeId)) == 16, "XrSpatialGraphNodeSpaceCreateInfoMSFT.nodeId has unexpected size % instead of 16", size_of(type_of(XrSpatialGraphNodeSpaceCreateInfoMSFT.nodeId)));
    assert(((cast(*void)(*instance.pose)) - cast(*void)(*instance)) == 36, "XrSpatialGraphNodeSpaceCreateInfoMSFT.pose has unexpected offset % instead of 36", ((cast(*void)(*instance.pose)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrSpatialGraphNodeSpaceCreateInfoMSFT.pose)) == 28, "XrSpatialGraphNodeSpaceCreateInfoMSFT.pose has unexpected size % instead of 28", size_of(type_of(XrSpatialGraphNodeSpaceCreateInfoMSFT.pose)));
    assert(size_of(XrSpatialGraphNodeSpaceCreateInfoMSFT) == 64, "XrSpatialGraphNodeSpaceCreateInfoMSFT has size % instead of 64", size_of(XrSpatialGraphNodeSpaceCreateInfoMSFT));
}

XrSpatialGraphStaticNodeBindingCreateInfoMSFT :: struct {
    type:        XrStructureType;
    next:        *void;
    space:       XrSpace;
    poseInSpace: XrPosef;
    time:        XrTime;
}
#run {
    instance: XrSpatialGraphStaticNodeBindingCreateInfoMSFT;
    assert(((cast(*void)(*instance.type)) - cast(*void)(*instance)) == 0, "XrSpatialGraphStaticNodeBindingCreateInfoMSFT.type has unexpected offset % instead of 0", ((cast(*void)(*instance.type)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrSpatialGraphStaticNodeBindingCreateInfoMSFT.type)) == 4, "XrSpatialGraphStaticNodeBindingCreateInfoMSFT.type has unexpected size % instead of 4", size_of(type_of(XrSpatialGraphStaticNodeBindingCreateInfoMSFT.type)));
    assert(((cast(*void)(*instance.next)) - cast(*void)(*instance)) == 8, "XrSpatialGraphStaticNodeBindingCreateInfoMSFT.next has unexpected offset % instead of 8", ((cast(*void)(*instance.next)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrSpatialGraphStaticNodeBindingCreateInfoMSFT.next)) == 8, "XrSpatialGraphStaticNodeBindingCreateInfoMSFT.next has unexpected size % instead of 8", size_of(type_of(XrSpatialGraphStaticNodeBindingCreateInfoMSFT.next)));
    assert(((cast(*void)(*instance.space)) - cast(*void)(*instance)) == 16, "XrSpatialGraphStaticNodeBindingCreateInfoMSFT.space has unexpected offset % instead of 16", ((cast(*void)(*instance.space)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrSpatialGraphStaticNodeBindingCreateInfoMSFT.space)) == 8, "XrSpatialGraphStaticNodeBindingCreateInfoMSFT.space has unexpected size % instead of 8", size_of(type_of(XrSpatialGraphStaticNodeBindingCreateInfoMSFT.space)));
    assert(((cast(*void)(*instance.poseInSpace)) - cast(*void)(*instance)) == 24, "XrSpatialGraphStaticNodeBindingCreateInfoMSFT.poseInSpace has unexpected offset % instead of 24", ((cast(*void)(*instance.poseInSpace)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrSpatialGraphStaticNodeBindingCreateInfoMSFT.poseInSpace)) == 28, "XrSpatialGraphStaticNodeBindingCreateInfoMSFT.poseInSpace has unexpected size % instead of 28", size_of(type_of(XrSpatialGraphStaticNodeBindingCreateInfoMSFT.poseInSpace)));
    assert(((cast(*void)(*instance.time)) - cast(*void)(*instance)) == 56, "XrSpatialGraphStaticNodeBindingCreateInfoMSFT.time has unexpected offset % instead of 56", ((cast(*void)(*instance.time)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrSpatialGraphStaticNodeBindingCreateInfoMSFT.time)) == 8, "XrSpatialGraphStaticNodeBindingCreateInfoMSFT.time has unexpected size % instead of 8", size_of(type_of(XrSpatialGraphStaticNodeBindingCreateInfoMSFT.time)));
    assert(size_of(XrSpatialGraphStaticNodeBindingCreateInfoMSFT) == 64, "XrSpatialGraphStaticNodeBindingCreateInfoMSFT has size % instead of 64", size_of(XrSpatialGraphStaticNodeBindingCreateInfoMSFT));
}

XrSpatialGraphNodeBindingPropertiesGetInfoMSFT :: struct {
    type: XrStructureType;
    next: *void;
}
#run {
    instance: XrSpatialGraphNodeBindingPropertiesGetInfoMSFT;
    assert(((cast(*void)(*instance.type)) - cast(*void)(*instance)) == 0, "XrSpatialGraphNodeBindingPropertiesGetInfoMSFT.type has unexpected offset % instead of 0", ((cast(*void)(*instance.type)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrSpatialGraphNodeBindingPropertiesGetInfoMSFT.type)) == 4, "XrSpatialGraphNodeBindingPropertiesGetInfoMSFT.type has unexpected size % instead of 4", size_of(type_of(XrSpatialGraphNodeBindingPropertiesGetInfoMSFT.type)));
    assert(((cast(*void)(*instance.next)) - cast(*void)(*instance)) == 8, "XrSpatialGraphNodeBindingPropertiesGetInfoMSFT.next has unexpected offset % instead of 8", ((cast(*void)(*instance.next)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrSpatialGraphNodeBindingPropertiesGetInfoMSFT.next)) == 8, "XrSpatialGraphNodeBindingPropertiesGetInfoMSFT.next has unexpected size % instead of 8", size_of(type_of(XrSpatialGraphNodeBindingPropertiesGetInfoMSFT.next)));
    assert(size_of(XrSpatialGraphNodeBindingPropertiesGetInfoMSFT) == 16, "XrSpatialGraphNodeBindingPropertiesGetInfoMSFT has size % instead of 16", size_of(XrSpatialGraphNodeBindingPropertiesGetInfoMSFT));
}

XrSpatialGraphNodeBindingPropertiesMSFT :: struct {
    type:            XrStructureType;
    next:            *void;
    nodeId:          [16] u8;
    poseInNodeSpace: XrPosef;
}
#run {
    instance: XrSpatialGraphNodeBindingPropertiesMSFT;
    assert(((cast(*void)(*instance.type)) - cast(*void)(*instance)) == 0, "XrSpatialGraphNodeBindingPropertiesMSFT.type has unexpected offset % instead of 0", ((cast(*void)(*instance.type)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrSpatialGraphNodeBindingPropertiesMSFT.type)) == 4, "XrSpatialGraphNodeBindingPropertiesMSFT.type has unexpected size % instead of 4", size_of(type_of(XrSpatialGraphNodeBindingPropertiesMSFT.type)));
    assert(((cast(*void)(*instance.next)) - cast(*void)(*instance)) == 8, "XrSpatialGraphNodeBindingPropertiesMSFT.next has unexpected offset % instead of 8", ((cast(*void)(*instance.next)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrSpatialGraphNodeBindingPropertiesMSFT.next)) == 8, "XrSpatialGraphNodeBindingPropertiesMSFT.next has unexpected size % instead of 8", size_of(type_of(XrSpatialGraphNodeBindingPropertiesMSFT.next)));
    assert(((cast(*void)(*instance.nodeId)) - cast(*void)(*instance)) == 16, "XrSpatialGraphNodeBindingPropertiesMSFT.nodeId has unexpected offset % instead of 16", ((cast(*void)(*instance.nodeId)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrSpatialGraphNodeBindingPropertiesMSFT.nodeId)) == 16, "XrSpatialGraphNodeBindingPropertiesMSFT.nodeId has unexpected size % instead of 16", size_of(type_of(XrSpatialGraphNodeBindingPropertiesMSFT.nodeId)));
    assert(((cast(*void)(*instance.poseInNodeSpace)) - cast(*void)(*instance)) == 32, "XrSpatialGraphNodeBindingPropertiesMSFT.poseInNodeSpace has unexpected offset % instead of 32", ((cast(*void)(*instance.poseInNodeSpace)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrSpatialGraphNodeBindingPropertiesMSFT.poseInNodeSpace)) == 28, "XrSpatialGraphNodeBindingPropertiesMSFT.poseInNodeSpace has unexpected size % instead of 28", size_of(type_of(XrSpatialGraphNodeBindingPropertiesMSFT.poseInNodeSpace)));
    assert(size_of(XrSpatialGraphNodeBindingPropertiesMSFT) == 64, "XrSpatialGraphNodeBindingPropertiesMSFT has size % instead of 64", size_of(XrSpatialGraphNodeBindingPropertiesMSFT));
}

PFN_xrCreateSpatialGraphNodeSpaceMSFT :: #type (a0: XrSession, a1: *XrSpatialGraphNodeSpaceCreateInfoMSFT, a2: *XrSpace) -> XrResult #c_call;
PFN_xrTryCreateSpatialGraphStaticNodeBindingMSFT :: #type (a0: XrSession, a1: *XrSpatialGraphStaticNodeBindingCreateInfoMSFT, a2: *XrSpatialGraphNodeBindingMSFT) -> XrResult #c_call;
PFN_xrDestroySpatialGraphNodeBindingMSFT :: #type (a0: XrSpatialGraphNodeBindingMSFT) -> XrResult #c_call;
PFN_xrGetSpatialGraphNodeBindingPropertiesMSFT :: #type (a0: XrSpatialGraphNodeBindingMSFT, a1: *XrSpatialGraphNodeBindingPropertiesGetInfoMSFT, a2: *XrSpatialGraphNodeBindingPropertiesMSFT) -> XrResult #c_call;

XrHandTrackerEXT_T :: struct {}
XrHandTrackerEXT :: *XrHandTrackerEXT_T;

XrHandEXT :: enum s32 {
    LEFT_EXT     :: 1;
    RIGHT_EXT    :: 2;
    MAX_ENUM_EXT :: 2147483647;

    XR_HAND_LEFT_EXT     :: LEFT_EXT;
    XR_HAND_RIGHT_EXT    :: RIGHT_EXT;
    XR_HAND_MAX_ENUM_EXT :: MAX_ENUM_EXT;
}

XrHandJointEXT :: enum s32 {
    PALM_EXT                :: 0;
    WRIST_EXT               :: 1;
    THUMB_METACARPAL_EXT    :: 2;
    THUMB_PROXIMAL_EXT      :: 3;
    THUMB_DISTAL_EXT        :: 4;
    THUMB_TIP_EXT           :: 5;
    INDEX_METACARPAL_EXT    :: 6;
    INDEX_PROXIMAL_EXT      :: 7;
    INDEX_INTERMEDIATE_EXT  :: 8;
    INDEX_DISTAL_EXT        :: 9;
    INDEX_TIP_EXT           :: 10;
    MIDDLE_METACARPAL_EXT   :: 11;
    MIDDLE_PROXIMAL_EXT     :: 12;
    MIDDLE_INTERMEDIATE_EXT :: 13;
    MIDDLE_DISTAL_EXT       :: 14;
    MIDDLE_TIP_EXT          :: 15;
    RING_METACARPAL_EXT     :: 16;
    RING_PROXIMAL_EXT       :: 17;
    RING_INTERMEDIATE_EXT   :: 18;
    RING_DISTAL_EXT         :: 19;
    RING_TIP_EXT            :: 20;
    LITTLE_METACARPAL_EXT   :: 21;
    LITTLE_PROXIMAL_EXT     :: 22;
    LITTLE_INTERMEDIATE_EXT :: 23;
    LITTLE_DISTAL_EXT       :: 24;
    LITTLE_TIP_EXT          :: 25;
    MAX_ENUM_EXT            :: 2147483647;

    XR_HAND_JOINT_PALM_EXT                :: PALM_EXT;
    XR_HAND_JOINT_WRIST_EXT               :: WRIST_EXT;
    XR_HAND_JOINT_THUMB_METACARPAL_EXT    :: THUMB_METACARPAL_EXT;
    XR_HAND_JOINT_THUMB_PROXIMAL_EXT      :: THUMB_PROXIMAL_EXT;
    XR_HAND_JOINT_THUMB_DISTAL_EXT        :: THUMB_DISTAL_EXT;
    XR_HAND_JOINT_THUMB_TIP_EXT           :: THUMB_TIP_EXT;
    XR_HAND_JOINT_INDEX_METACARPAL_EXT    :: INDEX_METACARPAL_EXT;
    XR_HAND_JOINT_INDEX_PROXIMAL_EXT      :: INDEX_PROXIMAL_EXT;
    XR_HAND_JOINT_INDEX_INTERMEDIATE_EXT  :: INDEX_INTERMEDIATE_EXT;
    XR_HAND_JOINT_INDEX_DISTAL_EXT        :: INDEX_DISTAL_EXT;
    XR_HAND_JOINT_INDEX_TIP_EXT           :: INDEX_TIP_EXT;
    XR_HAND_JOINT_MIDDLE_METACARPAL_EXT   :: MIDDLE_METACARPAL_EXT;
    XR_HAND_JOINT_MIDDLE_PROXIMAL_EXT     :: MIDDLE_PROXIMAL_EXT;
    XR_HAND_JOINT_MIDDLE_INTERMEDIATE_EXT :: MIDDLE_INTERMEDIATE_EXT;
    XR_HAND_JOINT_MIDDLE_DISTAL_EXT       :: MIDDLE_DISTAL_EXT;
    XR_HAND_JOINT_MIDDLE_TIP_EXT          :: MIDDLE_TIP_EXT;
    XR_HAND_JOINT_RING_METACARPAL_EXT     :: RING_METACARPAL_EXT;
    XR_HAND_JOINT_RING_PROXIMAL_EXT       :: RING_PROXIMAL_EXT;
    XR_HAND_JOINT_RING_INTERMEDIATE_EXT   :: RING_INTERMEDIATE_EXT;
    XR_HAND_JOINT_RING_DISTAL_EXT         :: RING_DISTAL_EXT;
    XR_HAND_JOINT_RING_TIP_EXT            :: RING_TIP_EXT;
    XR_HAND_JOINT_LITTLE_METACARPAL_EXT   :: LITTLE_METACARPAL_EXT;
    XR_HAND_JOINT_LITTLE_PROXIMAL_EXT     :: LITTLE_PROXIMAL_EXT;
    XR_HAND_JOINT_LITTLE_INTERMEDIATE_EXT :: LITTLE_INTERMEDIATE_EXT;
    XR_HAND_JOINT_LITTLE_DISTAL_EXT       :: LITTLE_DISTAL_EXT;
    XR_HAND_JOINT_LITTLE_TIP_EXT          :: LITTLE_TIP_EXT;
    XR_HAND_JOINT_MAX_ENUM_EXT            :: MAX_ENUM_EXT;
}

XrHandJointSetEXT :: enum s32 {
    DEFAULT_EXT                 :: 0;
    HAND_WITH_FOREARM_ULTRALEAP :: 1000149000;
    MAX_ENUM_EXT                :: 2147483647;

    XR_HAND_JOINT_SET_DEFAULT_EXT                 :: DEFAULT_EXT;
    XR_HAND_JOINT_SET_HAND_WITH_FOREARM_ULTRALEAP :: HAND_WITH_FOREARM_ULTRALEAP;
    XR_HAND_JOINT_SET_MAX_ENUM_EXT                :: MAX_ENUM_EXT;
}

// XrSystemHandTrackingPropertiesEXT extends XrSystemProperties
XrSystemHandTrackingPropertiesEXT :: struct {
    type:                 XrStructureType;
    next:                 *void;
    supportsHandTracking: XrBool32;
}
#run {
    instance: XrSystemHandTrackingPropertiesEXT;
    assert(((cast(*void)(*instance.type)) - cast(*void)(*instance)) == 0, "XrSystemHandTrackingPropertiesEXT.type has unexpected offset % instead of 0", ((cast(*void)(*instance.type)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrSystemHandTrackingPropertiesEXT.type)) == 4, "XrSystemHandTrackingPropertiesEXT.type has unexpected size % instead of 4", size_of(type_of(XrSystemHandTrackingPropertiesEXT.type)));
    assert(((cast(*void)(*instance.next)) - cast(*void)(*instance)) == 8, "XrSystemHandTrackingPropertiesEXT.next has unexpected offset % instead of 8", ((cast(*void)(*instance.next)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrSystemHandTrackingPropertiesEXT.next)) == 8, "XrSystemHandTrackingPropertiesEXT.next has unexpected size % instead of 8", size_of(type_of(XrSystemHandTrackingPropertiesEXT.next)));
    assert(((cast(*void)(*instance.supportsHandTracking)) - cast(*void)(*instance)) == 16, "XrSystemHandTrackingPropertiesEXT.supportsHandTracking has unexpected offset % instead of 16", ((cast(*void)(*instance.supportsHandTracking)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrSystemHandTrackingPropertiesEXT.supportsHandTracking)) == 4, "XrSystemHandTrackingPropertiesEXT.supportsHandTracking has unexpected size % instead of 4", size_of(type_of(XrSystemHandTrackingPropertiesEXT.supportsHandTracking)));
    assert(size_of(XrSystemHandTrackingPropertiesEXT) == 24, "XrSystemHandTrackingPropertiesEXT has size % instead of 24", size_of(XrSystemHandTrackingPropertiesEXT));
}

XrHandTrackerCreateInfoEXT :: struct {
    type:         XrStructureType;
    next:         *void;
    hand:         XrHandEXT;
    handJointSet: XrHandJointSetEXT;
}
#run {
    instance: XrHandTrackerCreateInfoEXT;
    assert(((cast(*void)(*instance.type)) - cast(*void)(*instance)) == 0, "XrHandTrackerCreateInfoEXT.type has unexpected offset % instead of 0", ((cast(*void)(*instance.type)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrHandTrackerCreateInfoEXT.type)) == 4, "XrHandTrackerCreateInfoEXT.type has unexpected size % instead of 4", size_of(type_of(XrHandTrackerCreateInfoEXT.type)));
    assert(((cast(*void)(*instance.next)) - cast(*void)(*instance)) == 8, "XrHandTrackerCreateInfoEXT.next has unexpected offset % instead of 8", ((cast(*void)(*instance.next)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrHandTrackerCreateInfoEXT.next)) == 8, "XrHandTrackerCreateInfoEXT.next has unexpected size % instead of 8", size_of(type_of(XrHandTrackerCreateInfoEXT.next)));
    assert(((cast(*void)(*instance.hand)) - cast(*void)(*instance)) == 16, "XrHandTrackerCreateInfoEXT.hand has unexpected offset % instead of 16", ((cast(*void)(*instance.hand)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrHandTrackerCreateInfoEXT.hand)) == 4, "XrHandTrackerCreateInfoEXT.hand has unexpected size % instead of 4", size_of(type_of(XrHandTrackerCreateInfoEXT.hand)));
    assert(((cast(*void)(*instance.handJointSet)) - cast(*void)(*instance)) == 20, "XrHandTrackerCreateInfoEXT.handJointSet has unexpected offset % instead of 20", ((cast(*void)(*instance.handJointSet)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrHandTrackerCreateInfoEXT.handJointSet)) == 4, "XrHandTrackerCreateInfoEXT.handJointSet has unexpected size % instead of 4", size_of(type_of(XrHandTrackerCreateInfoEXT.handJointSet)));
    assert(size_of(XrHandTrackerCreateInfoEXT) == 24, "XrHandTrackerCreateInfoEXT has size % instead of 24", size_of(XrHandTrackerCreateInfoEXT));
}

XrHandJointsLocateInfoEXT :: struct {
    type:      XrStructureType;
    next:      *void;
    baseSpace: XrSpace;
    time:      XrTime;
}
#run {
    instance: XrHandJointsLocateInfoEXT;
    assert(((cast(*void)(*instance.type)) - cast(*void)(*instance)) == 0, "XrHandJointsLocateInfoEXT.type has unexpected offset % instead of 0", ((cast(*void)(*instance.type)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrHandJointsLocateInfoEXT.type)) == 4, "XrHandJointsLocateInfoEXT.type has unexpected size % instead of 4", size_of(type_of(XrHandJointsLocateInfoEXT.type)));
    assert(((cast(*void)(*instance.next)) - cast(*void)(*instance)) == 8, "XrHandJointsLocateInfoEXT.next has unexpected offset % instead of 8", ((cast(*void)(*instance.next)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrHandJointsLocateInfoEXT.next)) == 8, "XrHandJointsLocateInfoEXT.next has unexpected size % instead of 8", size_of(type_of(XrHandJointsLocateInfoEXT.next)));
    assert(((cast(*void)(*instance.baseSpace)) - cast(*void)(*instance)) == 16, "XrHandJointsLocateInfoEXT.baseSpace has unexpected offset % instead of 16", ((cast(*void)(*instance.baseSpace)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrHandJointsLocateInfoEXT.baseSpace)) == 8, "XrHandJointsLocateInfoEXT.baseSpace has unexpected size % instead of 8", size_of(type_of(XrHandJointsLocateInfoEXT.baseSpace)));
    assert(((cast(*void)(*instance.time)) - cast(*void)(*instance)) == 24, "XrHandJointsLocateInfoEXT.time has unexpected offset % instead of 24", ((cast(*void)(*instance.time)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrHandJointsLocateInfoEXT.time)) == 8, "XrHandJointsLocateInfoEXT.time has unexpected size % instead of 8", size_of(type_of(XrHandJointsLocateInfoEXT.time)));
    assert(size_of(XrHandJointsLocateInfoEXT) == 32, "XrHandJointsLocateInfoEXT has size % instead of 32", size_of(XrHandJointsLocateInfoEXT));
}

XrHandJointLocationEXT :: struct {
    locationFlags: XrSpaceLocationFlags;
    pose:          XrPosef;
    radius:        float;
}
#run {
    instance: XrHandJointLocationEXT;
    assert(((cast(*void)(*instance.locationFlags)) - cast(*void)(*instance)) == 0, "XrHandJointLocationEXT.locationFlags has unexpected offset % instead of 0", ((cast(*void)(*instance.locationFlags)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrHandJointLocationEXT.locationFlags)) == 8, "XrHandJointLocationEXT.locationFlags has unexpected size % instead of 8", size_of(type_of(XrHandJointLocationEXT.locationFlags)));
    assert(((cast(*void)(*instance.pose)) - cast(*void)(*instance)) == 8, "XrHandJointLocationEXT.pose has unexpected offset % instead of 8", ((cast(*void)(*instance.pose)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrHandJointLocationEXT.pose)) == 28, "XrHandJointLocationEXT.pose has unexpected size % instead of 28", size_of(type_of(XrHandJointLocationEXT.pose)));
    assert(((cast(*void)(*instance.radius)) - cast(*void)(*instance)) == 36, "XrHandJointLocationEXT.radius has unexpected offset % instead of 36", ((cast(*void)(*instance.radius)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrHandJointLocationEXT.radius)) == 4, "XrHandJointLocationEXT.radius has unexpected size % instead of 4", size_of(type_of(XrHandJointLocationEXT.radius)));
    assert(size_of(XrHandJointLocationEXT) == 40, "XrHandJointLocationEXT has size % instead of 40", size_of(XrHandJointLocationEXT));
}

XrHandJointVelocityEXT :: struct {
    velocityFlags:   XrSpaceVelocityFlags;
    linearVelocity:  XrVector3f;
    angularVelocity: XrVector3f;
}
#run {
    instance: XrHandJointVelocityEXT;
    assert(((cast(*void)(*instance.velocityFlags)) - cast(*void)(*instance)) == 0, "XrHandJointVelocityEXT.velocityFlags has unexpected offset % instead of 0", ((cast(*void)(*instance.velocityFlags)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrHandJointVelocityEXT.velocityFlags)) == 8, "XrHandJointVelocityEXT.velocityFlags has unexpected size % instead of 8", size_of(type_of(XrHandJointVelocityEXT.velocityFlags)));
    assert(((cast(*void)(*instance.linearVelocity)) - cast(*void)(*instance)) == 8, "XrHandJointVelocityEXT.linearVelocity has unexpected offset % instead of 8", ((cast(*void)(*instance.linearVelocity)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrHandJointVelocityEXT.linearVelocity)) == 12, "XrHandJointVelocityEXT.linearVelocity has unexpected size % instead of 12", size_of(type_of(XrHandJointVelocityEXT.linearVelocity)));
    assert(((cast(*void)(*instance.angularVelocity)) - cast(*void)(*instance)) == 20, "XrHandJointVelocityEXT.angularVelocity has unexpected offset % instead of 20", ((cast(*void)(*instance.angularVelocity)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrHandJointVelocityEXT.angularVelocity)) == 12, "XrHandJointVelocityEXT.angularVelocity has unexpected size % instead of 12", size_of(type_of(XrHandJointVelocityEXT.angularVelocity)));
    assert(size_of(XrHandJointVelocityEXT) == 32, "XrHandJointVelocityEXT has size % instead of 32", size_of(XrHandJointVelocityEXT));
}

XrHandJointLocationsEXT :: struct {
    type:           XrStructureType;
    next:           *void;
    isActive:       XrBool32;
    jointCount:     u32;
    jointLocations: *XrHandJointLocationEXT;
}
#run {
    instance: XrHandJointLocationsEXT;
    assert(((cast(*void)(*instance.type)) - cast(*void)(*instance)) == 0, "XrHandJointLocationsEXT.type has unexpected offset % instead of 0", ((cast(*void)(*instance.type)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrHandJointLocationsEXT.type)) == 4, "XrHandJointLocationsEXT.type has unexpected size % instead of 4", size_of(type_of(XrHandJointLocationsEXT.type)));
    assert(((cast(*void)(*instance.next)) - cast(*void)(*instance)) == 8, "XrHandJointLocationsEXT.next has unexpected offset % instead of 8", ((cast(*void)(*instance.next)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrHandJointLocationsEXT.next)) == 8, "XrHandJointLocationsEXT.next has unexpected size % instead of 8", size_of(type_of(XrHandJointLocationsEXT.next)));
    assert(((cast(*void)(*instance.isActive)) - cast(*void)(*instance)) == 16, "XrHandJointLocationsEXT.isActive has unexpected offset % instead of 16", ((cast(*void)(*instance.isActive)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrHandJointLocationsEXT.isActive)) == 4, "XrHandJointLocationsEXT.isActive has unexpected size % instead of 4", size_of(type_of(XrHandJointLocationsEXT.isActive)));
    assert(((cast(*void)(*instance.jointCount)) - cast(*void)(*instance)) == 20, "XrHandJointLocationsEXT.jointCount has unexpected offset % instead of 20", ((cast(*void)(*instance.jointCount)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrHandJointLocationsEXT.jointCount)) == 4, "XrHandJointLocationsEXT.jointCount has unexpected size % instead of 4", size_of(type_of(XrHandJointLocationsEXT.jointCount)));
    assert(((cast(*void)(*instance.jointLocations)) - cast(*void)(*instance)) == 24, "XrHandJointLocationsEXT.jointLocations has unexpected offset % instead of 24", ((cast(*void)(*instance.jointLocations)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrHandJointLocationsEXT.jointLocations)) == 8, "XrHandJointLocationsEXT.jointLocations has unexpected size % instead of 8", size_of(type_of(XrHandJointLocationsEXT.jointLocations)));
    assert(size_of(XrHandJointLocationsEXT) == 32, "XrHandJointLocationsEXT has size % instead of 32", size_of(XrHandJointLocationsEXT));
}

// XrHandJointVelocitiesEXT extends XrHandJointLocationsEXT
XrHandJointVelocitiesEXT :: struct {
    type:            XrStructureType;
    next:            *void;
    jointCount:      u32;
    jointVelocities: *XrHandJointVelocityEXT;
}
#run {
    instance: XrHandJointVelocitiesEXT;
    assert(((cast(*void)(*instance.type)) - cast(*void)(*instance)) == 0, "XrHandJointVelocitiesEXT.type has unexpected offset % instead of 0", ((cast(*void)(*instance.type)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrHandJointVelocitiesEXT.type)) == 4, "XrHandJointVelocitiesEXT.type has unexpected size % instead of 4", size_of(type_of(XrHandJointVelocitiesEXT.type)));
    assert(((cast(*void)(*instance.next)) - cast(*void)(*instance)) == 8, "XrHandJointVelocitiesEXT.next has unexpected offset % instead of 8", ((cast(*void)(*instance.next)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrHandJointVelocitiesEXT.next)) == 8, "XrHandJointVelocitiesEXT.next has unexpected size % instead of 8", size_of(type_of(XrHandJointVelocitiesEXT.next)));
    assert(((cast(*void)(*instance.jointCount)) - cast(*void)(*instance)) == 16, "XrHandJointVelocitiesEXT.jointCount has unexpected offset % instead of 16", ((cast(*void)(*instance.jointCount)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrHandJointVelocitiesEXT.jointCount)) == 4, "XrHandJointVelocitiesEXT.jointCount has unexpected size % instead of 4", size_of(type_of(XrHandJointVelocitiesEXT.jointCount)));
    assert(((cast(*void)(*instance.jointVelocities)) - cast(*void)(*instance)) == 24, "XrHandJointVelocitiesEXT.jointVelocities has unexpected offset % instead of 24", ((cast(*void)(*instance.jointVelocities)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrHandJointVelocitiesEXT.jointVelocities)) == 8, "XrHandJointVelocitiesEXT.jointVelocities has unexpected size % instead of 8", size_of(type_of(XrHandJointVelocitiesEXT.jointVelocities)));
    assert(size_of(XrHandJointVelocitiesEXT) == 32, "XrHandJointVelocitiesEXT has size % instead of 32", size_of(XrHandJointVelocitiesEXT));
}

PFN_xrCreateHandTrackerEXT :: #type (a0: XrSession, a1: *XrHandTrackerCreateInfoEXT, a2: *XrHandTrackerEXT) -> XrResult #c_call;
PFN_xrDestroyHandTrackerEXT :: #type (a0: XrHandTrackerEXT) -> XrResult #c_call;
PFN_xrLocateHandJointsEXT :: #type (a0: XrHandTrackerEXT, a1: *XrHandJointsLocateInfoEXT, a2: *XrHandJointLocationsEXT) -> XrResult #c_call;

XrHandPoseTypeMSFT :: enum s32 {
    TRACKED_MSFT             :: 0;
    REFERENCE_OPEN_PALM_MSFT :: 1;
    MAX_ENUM_MSFT            :: 2147483647;

    XR_HAND_POSE_TYPE_TRACKED_MSFT             :: TRACKED_MSFT;
    XR_HAND_POSE_TYPE_REFERENCE_OPEN_PALM_MSFT :: REFERENCE_OPEN_PALM_MSFT;
    XR_HAND_POSE_TYPE_MAX_ENUM_MSFT            :: MAX_ENUM_MSFT;
}

// XrSystemHandTrackingMeshPropertiesMSFT extends XrSystemProperties
XrSystemHandTrackingMeshPropertiesMSFT :: struct {
    type:                     XrStructureType;
    next:                     *void;
    supportsHandTrackingMesh: XrBool32;
    maxHandMeshIndexCount:    u32;
    maxHandMeshVertexCount:   u32;
}
#run {
    instance: XrSystemHandTrackingMeshPropertiesMSFT;
    assert(((cast(*void)(*instance.type)) - cast(*void)(*instance)) == 0, "XrSystemHandTrackingMeshPropertiesMSFT.type has unexpected offset % instead of 0", ((cast(*void)(*instance.type)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrSystemHandTrackingMeshPropertiesMSFT.type)) == 4, "XrSystemHandTrackingMeshPropertiesMSFT.type has unexpected size % instead of 4", size_of(type_of(XrSystemHandTrackingMeshPropertiesMSFT.type)));
    assert(((cast(*void)(*instance.next)) - cast(*void)(*instance)) == 8, "XrSystemHandTrackingMeshPropertiesMSFT.next has unexpected offset % instead of 8", ((cast(*void)(*instance.next)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrSystemHandTrackingMeshPropertiesMSFT.next)) == 8, "XrSystemHandTrackingMeshPropertiesMSFT.next has unexpected size % instead of 8", size_of(type_of(XrSystemHandTrackingMeshPropertiesMSFT.next)));
    assert(((cast(*void)(*instance.supportsHandTrackingMesh)) - cast(*void)(*instance)) == 16, "XrSystemHandTrackingMeshPropertiesMSFT.supportsHandTrackingMesh has unexpected offset % instead of 16", ((cast(*void)(*instance.supportsHandTrackingMesh)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrSystemHandTrackingMeshPropertiesMSFT.supportsHandTrackingMesh)) == 4, "XrSystemHandTrackingMeshPropertiesMSFT.supportsHandTrackingMesh has unexpected size % instead of 4", size_of(type_of(XrSystemHandTrackingMeshPropertiesMSFT.supportsHandTrackingMesh)));
    assert(((cast(*void)(*instance.maxHandMeshIndexCount)) - cast(*void)(*instance)) == 20, "XrSystemHandTrackingMeshPropertiesMSFT.maxHandMeshIndexCount has unexpected offset % instead of 20", ((cast(*void)(*instance.maxHandMeshIndexCount)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrSystemHandTrackingMeshPropertiesMSFT.maxHandMeshIndexCount)) == 4, "XrSystemHandTrackingMeshPropertiesMSFT.maxHandMeshIndexCount has unexpected size % instead of 4", size_of(type_of(XrSystemHandTrackingMeshPropertiesMSFT.maxHandMeshIndexCount)));
    assert(((cast(*void)(*instance.maxHandMeshVertexCount)) - cast(*void)(*instance)) == 24, "XrSystemHandTrackingMeshPropertiesMSFT.maxHandMeshVertexCount has unexpected offset % instead of 24", ((cast(*void)(*instance.maxHandMeshVertexCount)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrSystemHandTrackingMeshPropertiesMSFT.maxHandMeshVertexCount)) == 4, "XrSystemHandTrackingMeshPropertiesMSFT.maxHandMeshVertexCount has unexpected size % instead of 4", size_of(type_of(XrSystemHandTrackingMeshPropertiesMSFT.maxHandMeshVertexCount)));
    assert(size_of(XrSystemHandTrackingMeshPropertiesMSFT) == 32, "XrSystemHandTrackingMeshPropertiesMSFT has size % instead of 32", size_of(XrSystemHandTrackingMeshPropertiesMSFT));
}

XrHandMeshSpaceCreateInfoMSFT :: struct {
    type:                XrStructureType;
    next:                *void;
    handPoseType:        XrHandPoseTypeMSFT;
    poseInHandMeshSpace: XrPosef;
}
#run {
    instance: XrHandMeshSpaceCreateInfoMSFT;
    assert(((cast(*void)(*instance.type)) - cast(*void)(*instance)) == 0, "XrHandMeshSpaceCreateInfoMSFT.type has unexpected offset % instead of 0", ((cast(*void)(*instance.type)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrHandMeshSpaceCreateInfoMSFT.type)) == 4, "XrHandMeshSpaceCreateInfoMSFT.type has unexpected size % instead of 4", size_of(type_of(XrHandMeshSpaceCreateInfoMSFT.type)));
    assert(((cast(*void)(*instance.next)) - cast(*void)(*instance)) == 8, "XrHandMeshSpaceCreateInfoMSFT.next has unexpected offset % instead of 8", ((cast(*void)(*instance.next)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrHandMeshSpaceCreateInfoMSFT.next)) == 8, "XrHandMeshSpaceCreateInfoMSFT.next has unexpected size % instead of 8", size_of(type_of(XrHandMeshSpaceCreateInfoMSFT.next)));
    assert(((cast(*void)(*instance.handPoseType)) - cast(*void)(*instance)) == 16, "XrHandMeshSpaceCreateInfoMSFT.handPoseType has unexpected offset % instead of 16", ((cast(*void)(*instance.handPoseType)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrHandMeshSpaceCreateInfoMSFT.handPoseType)) == 4, "XrHandMeshSpaceCreateInfoMSFT.handPoseType has unexpected size % instead of 4", size_of(type_of(XrHandMeshSpaceCreateInfoMSFT.handPoseType)));
    assert(((cast(*void)(*instance.poseInHandMeshSpace)) - cast(*void)(*instance)) == 20, "XrHandMeshSpaceCreateInfoMSFT.poseInHandMeshSpace has unexpected offset % instead of 20", ((cast(*void)(*instance.poseInHandMeshSpace)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrHandMeshSpaceCreateInfoMSFT.poseInHandMeshSpace)) == 28, "XrHandMeshSpaceCreateInfoMSFT.poseInHandMeshSpace has unexpected size % instead of 28", size_of(type_of(XrHandMeshSpaceCreateInfoMSFT.poseInHandMeshSpace)));
    assert(size_of(XrHandMeshSpaceCreateInfoMSFT) == 48, "XrHandMeshSpaceCreateInfoMSFT has size % instead of 48", size_of(XrHandMeshSpaceCreateInfoMSFT));
}

XrHandMeshUpdateInfoMSFT :: struct {
    type:         XrStructureType;
    next:         *void;
    time:         XrTime;
    handPoseType: XrHandPoseTypeMSFT;
}
#run {
    instance: XrHandMeshUpdateInfoMSFT;
    assert(((cast(*void)(*instance.type)) - cast(*void)(*instance)) == 0, "XrHandMeshUpdateInfoMSFT.type has unexpected offset % instead of 0", ((cast(*void)(*instance.type)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrHandMeshUpdateInfoMSFT.type)) == 4, "XrHandMeshUpdateInfoMSFT.type has unexpected size % instead of 4", size_of(type_of(XrHandMeshUpdateInfoMSFT.type)));
    assert(((cast(*void)(*instance.next)) - cast(*void)(*instance)) == 8, "XrHandMeshUpdateInfoMSFT.next has unexpected offset % instead of 8", ((cast(*void)(*instance.next)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrHandMeshUpdateInfoMSFT.next)) == 8, "XrHandMeshUpdateInfoMSFT.next has unexpected size % instead of 8", size_of(type_of(XrHandMeshUpdateInfoMSFT.next)));
    assert(((cast(*void)(*instance.time)) - cast(*void)(*instance)) == 16, "XrHandMeshUpdateInfoMSFT.time has unexpected offset % instead of 16", ((cast(*void)(*instance.time)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrHandMeshUpdateInfoMSFT.time)) == 8, "XrHandMeshUpdateInfoMSFT.time has unexpected size % instead of 8", size_of(type_of(XrHandMeshUpdateInfoMSFT.time)));
    assert(((cast(*void)(*instance.handPoseType)) - cast(*void)(*instance)) == 24, "XrHandMeshUpdateInfoMSFT.handPoseType has unexpected offset % instead of 24", ((cast(*void)(*instance.handPoseType)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrHandMeshUpdateInfoMSFT.handPoseType)) == 4, "XrHandMeshUpdateInfoMSFT.handPoseType has unexpected size % instead of 4", size_of(type_of(XrHandMeshUpdateInfoMSFT.handPoseType)));
    assert(size_of(XrHandMeshUpdateInfoMSFT) == 32, "XrHandMeshUpdateInfoMSFT has size % instead of 32", size_of(XrHandMeshUpdateInfoMSFT));
}

XrHandMeshIndexBufferMSFT :: struct {
    indexBufferKey:     u32;
    indexCapacityInput: u32;
    indexCountOutput:   u32;
    indices:            *u32;
}
#run {
    instance: XrHandMeshIndexBufferMSFT;
    assert(((cast(*void)(*instance.indexBufferKey)) - cast(*void)(*instance)) == 0, "XrHandMeshIndexBufferMSFT.indexBufferKey has unexpected offset % instead of 0", ((cast(*void)(*instance.indexBufferKey)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrHandMeshIndexBufferMSFT.indexBufferKey)) == 4, "XrHandMeshIndexBufferMSFT.indexBufferKey has unexpected size % instead of 4", size_of(type_of(XrHandMeshIndexBufferMSFT.indexBufferKey)));
    assert(((cast(*void)(*instance.indexCapacityInput)) - cast(*void)(*instance)) == 4, "XrHandMeshIndexBufferMSFT.indexCapacityInput has unexpected offset % instead of 4", ((cast(*void)(*instance.indexCapacityInput)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrHandMeshIndexBufferMSFT.indexCapacityInput)) == 4, "XrHandMeshIndexBufferMSFT.indexCapacityInput has unexpected size % instead of 4", size_of(type_of(XrHandMeshIndexBufferMSFT.indexCapacityInput)));
    assert(((cast(*void)(*instance.indexCountOutput)) - cast(*void)(*instance)) == 8, "XrHandMeshIndexBufferMSFT.indexCountOutput has unexpected offset % instead of 8", ((cast(*void)(*instance.indexCountOutput)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrHandMeshIndexBufferMSFT.indexCountOutput)) == 4, "XrHandMeshIndexBufferMSFT.indexCountOutput has unexpected size % instead of 4", size_of(type_of(XrHandMeshIndexBufferMSFT.indexCountOutput)));
    assert(((cast(*void)(*instance.indices)) - cast(*void)(*instance)) == 16, "XrHandMeshIndexBufferMSFT.indices has unexpected offset % instead of 16", ((cast(*void)(*instance.indices)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrHandMeshIndexBufferMSFT.indices)) == 8, "XrHandMeshIndexBufferMSFT.indices has unexpected size % instead of 8", size_of(type_of(XrHandMeshIndexBufferMSFT.indices)));
    assert(size_of(XrHandMeshIndexBufferMSFT) == 24, "XrHandMeshIndexBufferMSFT has size % instead of 24", size_of(XrHandMeshIndexBufferMSFT));
}

XrHandMeshVertexMSFT :: struct {
    position: XrVector3f;
    normal:   XrVector3f;
}
#run {
    instance: XrHandMeshVertexMSFT;
    assert(((cast(*void)(*instance.position)) - cast(*void)(*instance)) == 0, "XrHandMeshVertexMSFT.position has unexpected offset % instead of 0", ((cast(*void)(*instance.position)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrHandMeshVertexMSFT.position)) == 12, "XrHandMeshVertexMSFT.position has unexpected size % instead of 12", size_of(type_of(XrHandMeshVertexMSFT.position)));
    assert(((cast(*void)(*instance.normal)) - cast(*void)(*instance)) == 12, "XrHandMeshVertexMSFT.normal has unexpected offset % instead of 12", ((cast(*void)(*instance.normal)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrHandMeshVertexMSFT.normal)) == 12, "XrHandMeshVertexMSFT.normal has unexpected size % instead of 12", size_of(type_of(XrHandMeshVertexMSFT.normal)));
    assert(size_of(XrHandMeshVertexMSFT) == 24, "XrHandMeshVertexMSFT has size % instead of 24", size_of(XrHandMeshVertexMSFT));
}

XrHandMeshVertexBufferMSFT :: struct {
    vertexUpdateTime:    XrTime;
    vertexCapacityInput: u32;
    vertexCountOutput:   u32;
    vertices:            *XrHandMeshVertexMSFT;
}
#run {
    instance: XrHandMeshVertexBufferMSFT;
    assert(((cast(*void)(*instance.vertexUpdateTime)) - cast(*void)(*instance)) == 0, "XrHandMeshVertexBufferMSFT.vertexUpdateTime has unexpected offset % instead of 0", ((cast(*void)(*instance.vertexUpdateTime)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrHandMeshVertexBufferMSFT.vertexUpdateTime)) == 8, "XrHandMeshVertexBufferMSFT.vertexUpdateTime has unexpected size % instead of 8", size_of(type_of(XrHandMeshVertexBufferMSFT.vertexUpdateTime)));
    assert(((cast(*void)(*instance.vertexCapacityInput)) - cast(*void)(*instance)) == 8, "XrHandMeshVertexBufferMSFT.vertexCapacityInput has unexpected offset % instead of 8", ((cast(*void)(*instance.vertexCapacityInput)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrHandMeshVertexBufferMSFT.vertexCapacityInput)) == 4, "XrHandMeshVertexBufferMSFT.vertexCapacityInput has unexpected size % instead of 4", size_of(type_of(XrHandMeshVertexBufferMSFT.vertexCapacityInput)));
    assert(((cast(*void)(*instance.vertexCountOutput)) - cast(*void)(*instance)) == 12, "XrHandMeshVertexBufferMSFT.vertexCountOutput has unexpected offset % instead of 12", ((cast(*void)(*instance.vertexCountOutput)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrHandMeshVertexBufferMSFT.vertexCountOutput)) == 4, "XrHandMeshVertexBufferMSFT.vertexCountOutput has unexpected size % instead of 4", size_of(type_of(XrHandMeshVertexBufferMSFT.vertexCountOutput)));
    assert(((cast(*void)(*instance.vertices)) - cast(*void)(*instance)) == 16, "XrHandMeshVertexBufferMSFT.vertices has unexpected offset % instead of 16", ((cast(*void)(*instance.vertices)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrHandMeshVertexBufferMSFT.vertices)) == 8, "XrHandMeshVertexBufferMSFT.vertices has unexpected size % instead of 8", size_of(type_of(XrHandMeshVertexBufferMSFT.vertices)));
    assert(size_of(XrHandMeshVertexBufferMSFT) == 24, "XrHandMeshVertexBufferMSFT has size % instead of 24", size_of(XrHandMeshVertexBufferMSFT));
}

XrHandMeshMSFT :: struct {
    type:                XrStructureType;
    next:                *void;
    isActive:            XrBool32;
    indexBufferChanged:  XrBool32;
    vertexBufferChanged: XrBool32;
    indexBuffer:         XrHandMeshIndexBufferMSFT;
    vertexBuffer:        XrHandMeshVertexBufferMSFT;
}
#run {
    instance: XrHandMeshMSFT;
    assert(((cast(*void)(*instance.type)) - cast(*void)(*instance)) == 0, "XrHandMeshMSFT.type has unexpected offset % instead of 0", ((cast(*void)(*instance.type)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrHandMeshMSFT.type)) == 4, "XrHandMeshMSFT.type has unexpected size % instead of 4", size_of(type_of(XrHandMeshMSFT.type)));
    assert(((cast(*void)(*instance.next)) - cast(*void)(*instance)) == 8, "XrHandMeshMSFT.next has unexpected offset % instead of 8", ((cast(*void)(*instance.next)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrHandMeshMSFT.next)) == 8, "XrHandMeshMSFT.next has unexpected size % instead of 8", size_of(type_of(XrHandMeshMSFT.next)));
    assert(((cast(*void)(*instance.isActive)) - cast(*void)(*instance)) == 16, "XrHandMeshMSFT.isActive has unexpected offset % instead of 16", ((cast(*void)(*instance.isActive)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrHandMeshMSFT.isActive)) == 4, "XrHandMeshMSFT.isActive has unexpected size % instead of 4", size_of(type_of(XrHandMeshMSFT.isActive)));
    assert(((cast(*void)(*instance.indexBufferChanged)) - cast(*void)(*instance)) == 20, "XrHandMeshMSFT.indexBufferChanged has unexpected offset % instead of 20", ((cast(*void)(*instance.indexBufferChanged)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrHandMeshMSFT.indexBufferChanged)) == 4, "XrHandMeshMSFT.indexBufferChanged has unexpected size % instead of 4", size_of(type_of(XrHandMeshMSFT.indexBufferChanged)));
    assert(((cast(*void)(*instance.vertexBufferChanged)) - cast(*void)(*instance)) == 24, "XrHandMeshMSFT.vertexBufferChanged has unexpected offset % instead of 24", ((cast(*void)(*instance.vertexBufferChanged)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrHandMeshMSFT.vertexBufferChanged)) == 4, "XrHandMeshMSFT.vertexBufferChanged has unexpected size % instead of 4", size_of(type_of(XrHandMeshMSFT.vertexBufferChanged)));
    assert(((cast(*void)(*instance.indexBuffer)) - cast(*void)(*instance)) == 32, "XrHandMeshMSFT.indexBuffer has unexpected offset % instead of 32", ((cast(*void)(*instance.indexBuffer)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrHandMeshMSFT.indexBuffer)) == 24, "XrHandMeshMSFT.indexBuffer has unexpected size % instead of 24", size_of(type_of(XrHandMeshMSFT.indexBuffer)));
    assert(((cast(*void)(*instance.vertexBuffer)) - cast(*void)(*instance)) == 56, "XrHandMeshMSFT.vertexBuffer has unexpected offset % instead of 56", ((cast(*void)(*instance.vertexBuffer)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrHandMeshMSFT.vertexBuffer)) == 24, "XrHandMeshMSFT.vertexBuffer has unexpected size % instead of 24", size_of(type_of(XrHandMeshMSFT.vertexBuffer)));
    assert(size_of(XrHandMeshMSFT) == 80, "XrHandMeshMSFT has size % instead of 80", size_of(XrHandMeshMSFT));
}

// XrHandPoseTypeInfoMSFT extends XrHandTrackerCreateInfoEXT
XrHandPoseTypeInfoMSFT :: struct {
    type:         XrStructureType;
    next:         *void;
    handPoseType: XrHandPoseTypeMSFT;
}
#run {
    instance: XrHandPoseTypeInfoMSFT;
    assert(((cast(*void)(*instance.type)) - cast(*void)(*instance)) == 0, "XrHandPoseTypeInfoMSFT.type has unexpected offset % instead of 0", ((cast(*void)(*instance.type)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrHandPoseTypeInfoMSFT.type)) == 4, "XrHandPoseTypeInfoMSFT.type has unexpected size % instead of 4", size_of(type_of(XrHandPoseTypeInfoMSFT.type)));
    assert(((cast(*void)(*instance.next)) - cast(*void)(*instance)) == 8, "XrHandPoseTypeInfoMSFT.next has unexpected offset % instead of 8", ((cast(*void)(*instance.next)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrHandPoseTypeInfoMSFT.next)) == 8, "XrHandPoseTypeInfoMSFT.next has unexpected size % instead of 8", size_of(type_of(XrHandPoseTypeInfoMSFT.next)));
    assert(((cast(*void)(*instance.handPoseType)) - cast(*void)(*instance)) == 16, "XrHandPoseTypeInfoMSFT.handPoseType has unexpected offset % instead of 16", ((cast(*void)(*instance.handPoseType)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrHandPoseTypeInfoMSFT.handPoseType)) == 4, "XrHandPoseTypeInfoMSFT.handPoseType has unexpected size % instead of 4", size_of(type_of(XrHandPoseTypeInfoMSFT.handPoseType)));
    assert(size_of(XrHandPoseTypeInfoMSFT) == 24, "XrHandPoseTypeInfoMSFT has size % instead of 24", size_of(XrHandPoseTypeInfoMSFT));
}

PFN_xrCreateHandMeshSpaceMSFT :: #type (a0: XrHandTrackerEXT, a1: *XrHandMeshSpaceCreateInfoMSFT, a2: *XrSpace) -> XrResult #c_call;
PFN_xrUpdateHandMeshMSFT :: #type (a0: XrHandTrackerEXT, a1: *XrHandMeshUpdateInfoMSFT, a2: *XrHandMeshMSFT) -> XrResult #c_call;

// XrSecondaryViewConfigurationSessionBeginInfoMSFT extends XrSessionBeginInfo
XrSecondaryViewConfigurationSessionBeginInfoMSFT :: struct {
    type:                          XrStructureType;
    next:                          *void;
    viewConfigurationCount:        u32;
    enabledViewConfigurationTypes: *XrViewConfigurationType;
}
#run {
    instance: XrSecondaryViewConfigurationSessionBeginInfoMSFT;
    assert(((cast(*void)(*instance.type)) - cast(*void)(*instance)) == 0, "XrSecondaryViewConfigurationSessionBeginInfoMSFT.type has unexpected offset % instead of 0", ((cast(*void)(*instance.type)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrSecondaryViewConfigurationSessionBeginInfoMSFT.type)) == 4, "XrSecondaryViewConfigurationSessionBeginInfoMSFT.type has unexpected size % instead of 4", size_of(type_of(XrSecondaryViewConfigurationSessionBeginInfoMSFT.type)));
    assert(((cast(*void)(*instance.next)) - cast(*void)(*instance)) == 8, "XrSecondaryViewConfigurationSessionBeginInfoMSFT.next has unexpected offset % instead of 8", ((cast(*void)(*instance.next)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrSecondaryViewConfigurationSessionBeginInfoMSFT.next)) == 8, "XrSecondaryViewConfigurationSessionBeginInfoMSFT.next has unexpected size % instead of 8", size_of(type_of(XrSecondaryViewConfigurationSessionBeginInfoMSFT.next)));
    assert(((cast(*void)(*instance.viewConfigurationCount)) - cast(*void)(*instance)) == 16, "XrSecondaryViewConfigurationSessionBeginInfoMSFT.viewConfigurationCount has unexpected offset % instead of 16", ((cast(*void)(*instance.viewConfigurationCount)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrSecondaryViewConfigurationSessionBeginInfoMSFT.viewConfigurationCount)) == 4, "XrSecondaryViewConfigurationSessionBeginInfoMSFT.viewConfigurationCount has unexpected size % instead of 4", size_of(type_of(XrSecondaryViewConfigurationSessionBeginInfoMSFT.viewConfigurationCount)));
    assert(((cast(*void)(*instance.enabledViewConfigurationTypes)) - cast(*void)(*instance)) == 24, "XrSecondaryViewConfigurationSessionBeginInfoMSFT.enabledViewConfigurationTypes has unexpected offset % instead of 24", ((cast(*void)(*instance.enabledViewConfigurationTypes)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrSecondaryViewConfigurationSessionBeginInfoMSFT.enabledViewConfigurationTypes)) == 8, "XrSecondaryViewConfigurationSessionBeginInfoMSFT.enabledViewConfigurationTypes has unexpected size % instead of 8", size_of(type_of(XrSecondaryViewConfigurationSessionBeginInfoMSFT.enabledViewConfigurationTypes)));
    assert(size_of(XrSecondaryViewConfigurationSessionBeginInfoMSFT) == 32, "XrSecondaryViewConfigurationSessionBeginInfoMSFT has size % instead of 32", size_of(XrSecondaryViewConfigurationSessionBeginInfoMSFT));
}

XrSecondaryViewConfigurationStateMSFT :: struct {
    type:                  XrStructureType;
    next:                  *void;
    viewConfigurationType: XrViewConfigurationType;
    active:                XrBool32;
}
#run {
    instance: XrSecondaryViewConfigurationStateMSFT;
    assert(((cast(*void)(*instance.type)) - cast(*void)(*instance)) == 0, "XrSecondaryViewConfigurationStateMSFT.type has unexpected offset % instead of 0", ((cast(*void)(*instance.type)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrSecondaryViewConfigurationStateMSFT.type)) == 4, "XrSecondaryViewConfigurationStateMSFT.type has unexpected size % instead of 4", size_of(type_of(XrSecondaryViewConfigurationStateMSFT.type)));
    assert(((cast(*void)(*instance.next)) - cast(*void)(*instance)) == 8, "XrSecondaryViewConfigurationStateMSFT.next has unexpected offset % instead of 8", ((cast(*void)(*instance.next)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrSecondaryViewConfigurationStateMSFT.next)) == 8, "XrSecondaryViewConfigurationStateMSFT.next has unexpected size % instead of 8", size_of(type_of(XrSecondaryViewConfigurationStateMSFT.next)));
    assert(((cast(*void)(*instance.viewConfigurationType)) - cast(*void)(*instance)) == 16, "XrSecondaryViewConfigurationStateMSFT.viewConfigurationType has unexpected offset % instead of 16", ((cast(*void)(*instance.viewConfigurationType)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrSecondaryViewConfigurationStateMSFT.viewConfigurationType)) == 4, "XrSecondaryViewConfigurationStateMSFT.viewConfigurationType has unexpected size % instead of 4", size_of(type_of(XrSecondaryViewConfigurationStateMSFT.viewConfigurationType)));
    assert(((cast(*void)(*instance.active)) - cast(*void)(*instance)) == 20, "XrSecondaryViewConfigurationStateMSFT.active has unexpected offset % instead of 20", ((cast(*void)(*instance.active)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrSecondaryViewConfigurationStateMSFT.active)) == 4, "XrSecondaryViewConfigurationStateMSFT.active has unexpected size % instead of 4", size_of(type_of(XrSecondaryViewConfigurationStateMSFT.active)));
    assert(size_of(XrSecondaryViewConfigurationStateMSFT) == 24, "XrSecondaryViewConfigurationStateMSFT has size % instead of 24", size_of(XrSecondaryViewConfigurationStateMSFT));
}

// XrSecondaryViewConfigurationFrameStateMSFT extends XrFrameState
XrSecondaryViewConfigurationFrameStateMSFT :: struct {
    type:                    XrStructureType;
    next:                    *void;
    viewConfigurationCount:  u32;
    viewConfigurationStates: *XrSecondaryViewConfigurationStateMSFT;
}
#run {
    instance: XrSecondaryViewConfigurationFrameStateMSFT;
    assert(((cast(*void)(*instance.type)) - cast(*void)(*instance)) == 0, "XrSecondaryViewConfigurationFrameStateMSFT.type has unexpected offset % instead of 0", ((cast(*void)(*instance.type)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrSecondaryViewConfigurationFrameStateMSFT.type)) == 4, "XrSecondaryViewConfigurationFrameStateMSFT.type has unexpected size % instead of 4", size_of(type_of(XrSecondaryViewConfigurationFrameStateMSFT.type)));
    assert(((cast(*void)(*instance.next)) - cast(*void)(*instance)) == 8, "XrSecondaryViewConfigurationFrameStateMSFT.next has unexpected offset % instead of 8", ((cast(*void)(*instance.next)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrSecondaryViewConfigurationFrameStateMSFT.next)) == 8, "XrSecondaryViewConfigurationFrameStateMSFT.next has unexpected size % instead of 8", size_of(type_of(XrSecondaryViewConfigurationFrameStateMSFT.next)));
    assert(((cast(*void)(*instance.viewConfigurationCount)) - cast(*void)(*instance)) == 16, "XrSecondaryViewConfigurationFrameStateMSFT.viewConfigurationCount has unexpected offset % instead of 16", ((cast(*void)(*instance.viewConfigurationCount)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrSecondaryViewConfigurationFrameStateMSFT.viewConfigurationCount)) == 4, "XrSecondaryViewConfigurationFrameStateMSFT.viewConfigurationCount has unexpected size % instead of 4", size_of(type_of(XrSecondaryViewConfigurationFrameStateMSFT.viewConfigurationCount)));
    assert(((cast(*void)(*instance.viewConfigurationStates)) - cast(*void)(*instance)) == 24, "XrSecondaryViewConfigurationFrameStateMSFT.viewConfigurationStates has unexpected offset % instead of 24", ((cast(*void)(*instance.viewConfigurationStates)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrSecondaryViewConfigurationFrameStateMSFT.viewConfigurationStates)) == 8, "XrSecondaryViewConfigurationFrameStateMSFT.viewConfigurationStates has unexpected size % instead of 8", size_of(type_of(XrSecondaryViewConfigurationFrameStateMSFT.viewConfigurationStates)));
    assert(size_of(XrSecondaryViewConfigurationFrameStateMSFT) == 32, "XrSecondaryViewConfigurationFrameStateMSFT has size % instead of 32", size_of(XrSecondaryViewConfigurationFrameStateMSFT));
}

XrSecondaryViewConfigurationLayerInfoMSFT :: struct {
    type:                  XrStructureType;
    next:                  *void;
    viewConfigurationType: XrViewConfigurationType;
    environmentBlendMode:  XrEnvironmentBlendMode;
    layerCount:            u32;
    layers:                **XrCompositionLayerBaseHeader;
}
#run {
    instance: XrSecondaryViewConfigurationLayerInfoMSFT;
    assert(((cast(*void)(*instance.type)) - cast(*void)(*instance)) == 0, "XrSecondaryViewConfigurationLayerInfoMSFT.type has unexpected offset % instead of 0", ((cast(*void)(*instance.type)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrSecondaryViewConfigurationLayerInfoMSFT.type)) == 4, "XrSecondaryViewConfigurationLayerInfoMSFT.type has unexpected size % instead of 4", size_of(type_of(XrSecondaryViewConfigurationLayerInfoMSFT.type)));
    assert(((cast(*void)(*instance.next)) - cast(*void)(*instance)) == 8, "XrSecondaryViewConfigurationLayerInfoMSFT.next has unexpected offset % instead of 8", ((cast(*void)(*instance.next)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrSecondaryViewConfigurationLayerInfoMSFT.next)) == 8, "XrSecondaryViewConfigurationLayerInfoMSFT.next has unexpected size % instead of 8", size_of(type_of(XrSecondaryViewConfigurationLayerInfoMSFT.next)));
    assert(((cast(*void)(*instance.viewConfigurationType)) - cast(*void)(*instance)) == 16, "XrSecondaryViewConfigurationLayerInfoMSFT.viewConfigurationType has unexpected offset % instead of 16", ((cast(*void)(*instance.viewConfigurationType)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrSecondaryViewConfigurationLayerInfoMSFT.viewConfigurationType)) == 4, "XrSecondaryViewConfigurationLayerInfoMSFT.viewConfigurationType has unexpected size % instead of 4", size_of(type_of(XrSecondaryViewConfigurationLayerInfoMSFT.viewConfigurationType)));
    assert(((cast(*void)(*instance.environmentBlendMode)) - cast(*void)(*instance)) == 20, "XrSecondaryViewConfigurationLayerInfoMSFT.environmentBlendMode has unexpected offset % instead of 20", ((cast(*void)(*instance.environmentBlendMode)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrSecondaryViewConfigurationLayerInfoMSFT.environmentBlendMode)) == 4, "XrSecondaryViewConfigurationLayerInfoMSFT.environmentBlendMode has unexpected size % instead of 4", size_of(type_of(XrSecondaryViewConfigurationLayerInfoMSFT.environmentBlendMode)));
    assert(((cast(*void)(*instance.layerCount)) - cast(*void)(*instance)) == 24, "XrSecondaryViewConfigurationLayerInfoMSFT.layerCount has unexpected offset % instead of 24", ((cast(*void)(*instance.layerCount)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrSecondaryViewConfigurationLayerInfoMSFT.layerCount)) == 4, "XrSecondaryViewConfigurationLayerInfoMSFT.layerCount has unexpected size % instead of 4", size_of(type_of(XrSecondaryViewConfigurationLayerInfoMSFT.layerCount)));
    assert(((cast(*void)(*instance.layers)) - cast(*void)(*instance)) == 32, "XrSecondaryViewConfigurationLayerInfoMSFT.layers has unexpected offset % instead of 32", ((cast(*void)(*instance.layers)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrSecondaryViewConfigurationLayerInfoMSFT.layers)) == 8, "XrSecondaryViewConfigurationLayerInfoMSFT.layers has unexpected size % instead of 8", size_of(type_of(XrSecondaryViewConfigurationLayerInfoMSFT.layers)));
    assert(size_of(XrSecondaryViewConfigurationLayerInfoMSFT) == 40, "XrSecondaryViewConfigurationLayerInfoMSFT has size % instead of 40", size_of(XrSecondaryViewConfigurationLayerInfoMSFT));
}

// XrSecondaryViewConfigurationFrameEndInfoMSFT extends XrFrameEndInfo
XrSecondaryViewConfigurationFrameEndInfoMSFT :: struct {
    type:                        XrStructureType;
    next:                        *void;
    viewConfigurationCount:      u32;
    viewConfigurationLayersInfo: *XrSecondaryViewConfigurationLayerInfoMSFT;
}
#run {
    instance: XrSecondaryViewConfigurationFrameEndInfoMSFT;
    assert(((cast(*void)(*instance.type)) - cast(*void)(*instance)) == 0, "XrSecondaryViewConfigurationFrameEndInfoMSFT.type has unexpected offset % instead of 0", ((cast(*void)(*instance.type)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrSecondaryViewConfigurationFrameEndInfoMSFT.type)) == 4, "XrSecondaryViewConfigurationFrameEndInfoMSFT.type has unexpected size % instead of 4", size_of(type_of(XrSecondaryViewConfigurationFrameEndInfoMSFT.type)));
    assert(((cast(*void)(*instance.next)) - cast(*void)(*instance)) == 8, "XrSecondaryViewConfigurationFrameEndInfoMSFT.next has unexpected offset % instead of 8", ((cast(*void)(*instance.next)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrSecondaryViewConfigurationFrameEndInfoMSFT.next)) == 8, "XrSecondaryViewConfigurationFrameEndInfoMSFT.next has unexpected size % instead of 8", size_of(type_of(XrSecondaryViewConfigurationFrameEndInfoMSFT.next)));
    assert(((cast(*void)(*instance.viewConfigurationCount)) - cast(*void)(*instance)) == 16, "XrSecondaryViewConfigurationFrameEndInfoMSFT.viewConfigurationCount has unexpected offset % instead of 16", ((cast(*void)(*instance.viewConfigurationCount)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrSecondaryViewConfigurationFrameEndInfoMSFT.viewConfigurationCount)) == 4, "XrSecondaryViewConfigurationFrameEndInfoMSFT.viewConfigurationCount has unexpected size % instead of 4", size_of(type_of(XrSecondaryViewConfigurationFrameEndInfoMSFT.viewConfigurationCount)));
    assert(((cast(*void)(*instance.viewConfigurationLayersInfo)) - cast(*void)(*instance)) == 24, "XrSecondaryViewConfigurationFrameEndInfoMSFT.viewConfigurationLayersInfo has unexpected offset % instead of 24", ((cast(*void)(*instance.viewConfigurationLayersInfo)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrSecondaryViewConfigurationFrameEndInfoMSFT.viewConfigurationLayersInfo)) == 8, "XrSecondaryViewConfigurationFrameEndInfoMSFT.viewConfigurationLayersInfo has unexpected size % instead of 8", size_of(type_of(XrSecondaryViewConfigurationFrameEndInfoMSFT.viewConfigurationLayersInfo)));
    assert(size_of(XrSecondaryViewConfigurationFrameEndInfoMSFT) == 32, "XrSecondaryViewConfigurationFrameEndInfoMSFT has size % instead of 32", size_of(XrSecondaryViewConfigurationFrameEndInfoMSFT));
}

// XrSecondaryViewConfigurationSwapchainCreateInfoMSFT extends XrSwapchainCreateInfo
XrSecondaryViewConfigurationSwapchainCreateInfoMSFT :: struct {
    type:                  XrStructureType;
    next:                  *void;
    viewConfigurationType: XrViewConfigurationType;
}
#run {
    instance: XrSecondaryViewConfigurationSwapchainCreateInfoMSFT;
    assert(((cast(*void)(*instance.type)) - cast(*void)(*instance)) == 0, "XrSecondaryViewConfigurationSwapchainCreateInfoMSFT.type has unexpected offset % instead of 0", ((cast(*void)(*instance.type)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrSecondaryViewConfigurationSwapchainCreateInfoMSFT.type)) == 4, "XrSecondaryViewConfigurationSwapchainCreateInfoMSFT.type has unexpected size % instead of 4", size_of(type_of(XrSecondaryViewConfigurationSwapchainCreateInfoMSFT.type)));
    assert(((cast(*void)(*instance.next)) - cast(*void)(*instance)) == 8, "XrSecondaryViewConfigurationSwapchainCreateInfoMSFT.next has unexpected offset % instead of 8", ((cast(*void)(*instance.next)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrSecondaryViewConfigurationSwapchainCreateInfoMSFT.next)) == 8, "XrSecondaryViewConfigurationSwapchainCreateInfoMSFT.next has unexpected size % instead of 8", size_of(type_of(XrSecondaryViewConfigurationSwapchainCreateInfoMSFT.next)));
    assert(((cast(*void)(*instance.viewConfigurationType)) - cast(*void)(*instance)) == 16, "XrSecondaryViewConfigurationSwapchainCreateInfoMSFT.viewConfigurationType has unexpected offset % instead of 16", ((cast(*void)(*instance.viewConfigurationType)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrSecondaryViewConfigurationSwapchainCreateInfoMSFT.viewConfigurationType)) == 4, "XrSecondaryViewConfigurationSwapchainCreateInfoMSFT.viewConfigurationType has unexpected size % instead of 4", size_of(type_of(XrSecondaryViewConfigurationSwapchainCreateInfoMSFT.viewConfigurationType)));
    assert(size_of(XrSecondaryViewConfigurationSwapchainCreateInfoMSFT) == 24, "XrSecondaryViewConfigurationSwapchainCreateInfoMSFT has size % instead of 24", size_of(XrSecondaryViewConfigurationSwapchainCreateInfoMSFT));
}

XrControllerModelKeyMSFT :: u64;

XrControllerModelKeyStateMSFT :: struct {
    type:     XrStructureType;
    next:     *void;
    modelKey: XrControllerModelKeyMSFT;
}
#run {
    instance: XrControllerModelKeyStateMSFT;
    assert(((cast(*void)(*instance.type)) - cast(*void)(*instance)) == 0, "XrControllerModelKeyStateMSFT.type has unexpected offset % instead of 0", ((cast(*void)(*instance.type)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrControllerModelKeyStateMSFT.type)) == 4, "XrControllerModelKeyStateMSFT.type has unexpected size % instead of 4", size_of(type_of(XrControllerModelKeyStateMSFT.type)));
    assert(((cast(*void)(*instance.next)) - cast(*void)(*instance)) == 8, "XrControllerModelKeyStateMSFT.next has unexpected offset % instead of 8", ((cast(*void)(*instance.next)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrControllerModelKeyStateMSFT.next)) == 8, "XrControllerModelKeyStateMSFT.next has unexpected size % instead of 8", size_of(type_of(XrControllerModelKeyStateMSFT.next)));
    assert(((cast(*void)(*instance.modelKey)) - cast(*void)(*instance)) == 16, "XrControllerModelKeyStateMSFT.modelKey has unexpected offset % instead of 16", ((cast(*void)(*instance.modelKey)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrControllerModelKeyStateMSFT.modelKey)) == 8, "XrControllerModelKeyStateMSFT.modelKey has unexpected size % instead of 8", size_of(type_of(XrControllerModelKeyStateMSFT.modelKey)));
    assert(size_of(XrControllerModelKeyStateMSFT) == 24, "XrControllerModelKeyStateMSFT has size % instead of 24", size_of(XrControllerModelKeyStateMSFT));
}

XrControllerModelNodePropertiesMSFT :: struct {
    type:           XrStructureType;
    next:           *void;
    parentNodeName: [64] u8;
    nodeName:       [64] u8;
}
#run {
    instance: XrControllerModelNodePropertiesMSFT;
    assert(((cast(*void)(*instance.type)) - cast(*void)(*instance)) == 0, "XrControllerModelNodePropertiesMSFT.type has unexpected offset % instead of 0", ((cast(*void)(*instance.type)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrControllerModelNodePropertiesMSFT.type)) == 4, "XrControllerModelNodePropertiesMSFT.type has unexpected size % instead of 4", size_of(type_of(XrControllerModelNodePropertiesMSFT.type)));
    assert(((cast(*void)(*instance.next)) - cast(*void)(*instance)) == 8, "XrControllerModelNodePropertiesMSFT.next has unexpected offset % instead of 8", ((cast(*void)(*instance.next)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrControllerModelNodePropertiesMSFT.next)) == 8, "XrControllerModelNodePropertiesMSFT.next has unexpected size % instead of 8", size_of(type_of(XrControllerModelNodePropertiesMSFT.next)));
    assert(((cast(*void)(*instance.parentNodeName)) - cast(*void)(*instance)) == 16, "XrControllerModelNodePropertiesMSFT.parentNodeName has unexpected offset % instead of 16", ((cast(*void)(*instance.parentNodeName)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrControllerModelNodePropertiesMSFT.parentNodeName)) == 64, "XrControllerModelNodePropertiesMSFT.parentNodeName has unexpected size % instead of 64", size_of(type_of(XrControllerModelNodePropertiesMSFT.parentNodeName)));
    assert(((cast(*void)(*instance.nodeName)) - cast(*void)(*instance)) == 80, "XrControllerModelNodePropertiesMSFT.nodeName has unexpected offset % instead of 80", ((cast(*void)(*instance.nodeName)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrControllerModelNodePropertiesMSFT.nodeName)) == 64, "XrControllerModelNodePropertiesMSFT.nodeName has unexpected size % instead of 64", size_of(type_of(XrControllerModelNodePropertiesMSFT.nodeName)));
    assert(size_of(XrControllerModelNodePropertiesMSFT) == 144, "XrControllerModelNodePropertiesMSFT has size % instead of 144", size_of(XrControllerModelNodePropertiesMSFT));
}

XrControllerModelPropertiesMSFT :: struct {
    type:              XrStructureType;
    next:              *void;
    nodeCapacityInput: u32;
    nodeCountOutput:   u32;
    nodeProperties:    *XrControllerModelNodePropertiesMSFT;
}
#run {
    instance: XrControllerModelPropertiesMSFT;
    assert(((cast(*void)(*instance.type)) - cast(*void)(*instance)) == 0, "XrControllerModelPropertiesMSFT.type has unexpected offset % instead of 0", ((cast(*void)(*instance.type)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrControllerModelPropertiesMSFT.type)) == 4, "XrControllerModelPropertiesMSFT.type has unexpected size % instead of 4", size_of(type_of(XrControllerModelPropertiesMSFT.type)));
    assert(((cast(*void)(*instance.next)) - cast(*void)(*instance)) == 8, "XrControllerModelPropertiesMSFT.next has unexpected offset % instead of 8", ((cast(*void)(*instance.next)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrControllerModelPropertiesMSFT.next)) == 8, "XrControllerModelPropertiesMSFT.next has unexpected size % instead of 8", size_of(type_of(XrControllerModelPropertiesMSFT.next)));
    assert(((cast(*void)(*instance.nodeCapacityInput)) - cast(*void)(*instance)) == 16, "XrControllerModelPropertiesMSFT.nodeCapacityInput has unexpected offset % instead of 16", ((cast(*void)(*instance.nodeCapacityInput)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrControllerModelPropertiesMSFT.nodeCapacityInput)) == 4, "XrControllerModelPropertiesMSFT.nodeCapacityInput has unexpected size % instead of 4", size_of(type_of(XrControllerModelPropertiesMSFT.nodeCapacityInput)));
    assert(((cast(*void)(*instance.nodeCountOutput)) - cast(*void)(*instance)) == 20, "XrControllerModelPropertiesMSFT.nodeCountOutput has unexpected offset % instead of 20", ((cast(*void)(*instance.nodeCountOutput)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrControllerModelPropertiesMSFT.nodeCountOutput)) == 4, "XrControllerModelPropertiesMSFT.nodeCountOutput has unexpected size % instead of 4", size_of(type_of(XrControllerModelPropertiesMSFT.nodeCountOutput)));
    assert(((cast(*void)(*instance.nodeProperties)) - cast(*void)(*instance)) == 24, "XrControllerModelPropertiesMSFT.nodeProperties has unexpected offset % instead of 24", ((cast(*void)(*instance.nodeProperties)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrControllerModelPropertiesMSFT.nodeProperties)) == 8, "XrControllerModelPropertiesMSFT.nodeProperties has unexpected size % instead of 8", size_of(type_of(XrControllerModelPropertiesMSFT.nodeProperties)));
    assert(size_of(XrControllerModelPropertiesMSFT) == 32, "XrControllerModelPropertiesMSFT has size % instead of 32", size_of(XrControllerModelPropertiesMSFT));
}

XrControllerModelNodeStateMSFT :: struct {
    type:     XrStructureType;
    next:     *void;
    nodePose: XrPosef;
}
#run {
    instance: XrControllerModelNodeStateMSFT;
    assert(((cast(*void)(*instance.type)) - cast(*void)(*instance)) == 0, "XrControllerModelNodeStateMSFT.type has unexpected offset % instead of 0", ((cast(*void)(*instance.type)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrControllerModelNodeStateMSFT.type)) == 4, "XrControllerModelNodeStateMSFT.type has unexpected size % instead of 4", size_of(type_of(XrControllerModelNodeStateMSFT.type)));
    assert(((cast(*void)(*instance.next)) - cast(*void)(*instance)) == 8, "XrControllerModelNodeStateMSFT.next has unexpected offset % instead of 8", ((cast(*void)(*instance.next)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrControllerModelNodeStateMSFT.next)) == 8, "XrControllerModelNodeStateMSFT.next has unexpected size % instead of 8", size_of(type_of(XrControllerModelNodeStateMSFT.next)));
    assert(((cast(*void)(*instance.nodePose)) - cast(*void)(*instance)) == 16, "XrControllerModelNodeStateMSFT.nodePose has unexpected offset % instead of 16", ((cast(*void)(*instance.nodePose)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrControllerModelNodeStateMSFT.nodePose)) == 28, "XrControllerModelNodeStateMSFT.nodePose has unexpected size % instead of 28", size_of(type_of(XrControllerModelNodeStateMSFT.nodePose)));
    assert(size_of(XrControllerModelNodeStateMSFT) == 48, "XrControllerModelNodeStateMSFT has size % instead of 48", size_of(XrControllerModelNodeStateMSFT));
}

XrControllerModelStateMSFT :: struct {
    type:              XrStructureType;
    next:              *void;
    nodeCapacityInput: u32;
    nodeCountOutput:   u32;
    nodeStates:        *XrControllerModelNodeStateMSFT;
}
#run {
    instance: XrControllerModelStateMSFT;
    assert(((cast(*void)(*instance.type)) - cast(*void)(*instance)) == 0, "XrControllerModelStateMSFT.type has unexpected offset % instead of 0", ((cast(*void)(*instance.type)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrControllerModelStateMSFT.type)) == 4, "XrControllerModelStateMSFT.type has unexpected size % instead of 4", size_of(type_of(XrControllerModelStateMSFT.type)));
    assert(((cast(*void)(*instance.next)) - cast(*void)(*instance)) == 8, "XrControllerModelStateMSFT.next has unexpected offset % instead of 8", ((cast(*void)(*instance.next)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrControllerModelStateMSFT.next)) == 8, "XrControllerModelStateMSFT.next has unexpected size % instead of 8", size_of(type_of(XrControllerModelStateMSFT.next)));
    assert(((cast(*void)(*instance.nodeCapacityInput)) - cast(*void)(*instance)) == 16, "XrControllerModelStateMSFT.nodeCapacityInput has unexpected offset % instead of 16", ((cast(*void)(*instance.nodeCapacityInput)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrControllerModelStateMSFT.nodeCapacityInput)) == 4, "XrControllerModelStateMSFT.nodeCapacityInput has unexpected size % instead of 4", size_of(type_of(XrControllerModelStateMSFT.nodeCapacityInput)));
    assert(((cast(*void)(*instance.nodeCountOutput)) - cast(*void)(*instance)) == 20, "XrControllerModelStateMSFT.nodeCountOutput has unexpected offset % instead of 20", ((cast(*void)(*instance.nodeCountOutput)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrControllerModelStateMSFT.nodeCountOutput)) == 4, "XrControllerModelStateMSFT.nodeCountOutput has unexpected size % instead of 4", size_of(type_of(XrControllerModelStateMSFT.nodeCountOutput)));
    assert(((cast(*void)(*instance.nodeStates)) - cast(*void)(*instance)) == 24, "XrControllerModelStateMSFT.nodeStates has unexpected offset % instead of 24", ((cast(*void)(*instance.nodeStates)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrControllerModelStateMSFT.nodeStates)) == 8, "XrControllerModelStateMSFT.nodeStates has unexpected size % instead of 8", size_of(type_of(XrControllerModelStateMSFT.nodeStates)));
    assert(size_of(XrControllerModelStateMSFT) == 32, "XrControllerModelStateMSFT has size % instead of 32", size_of(XrControllerModelStateMSFT));
}

PFN_xrGetControllerModelKeyMSFT :: #type (a0: XrSession, a1: XrPath, a2: *XrControllerModelKeyStateMSFT) -> XrResult #c_call;
PFN_xrLoadControllerModelMSFT :: #type (a0: XrSession, a1: XrControllerModelKeyMSFT, a2: u32, a3: *u32, a4: *u8) -> XrResult #c_call;
PFN_xrGetControllerModelPropertiesMSFT :: #type (a0: XrSession, a1: XrControllerModelKeyMSFT, a2: *XrControllerModelPropertiesMSFT) -> XrResult #c_call;
PFN_xrGetControllerModelStateMSFT :: #type (a0: XrSession, a1: XrControllerModelKeyMSFT, a2: *XrControllerModelStateMSFT) -> XrResult #c_call;

// XrViewConfigurationViewFovEPIC extends XrViewConfigurationView
XrViewConfigurationViewFovEPIC :: struct {
    type:           XrStructureType;
    next:           *void;
    recommendedFov: XrFovf;
    maxMutableFov:  XrFovf;
}
#run {
    instance: XrViewConfigurationViewFovEPIC;
    assert(((cast(*void)(*instance.type)) - cast(*void)(*instance)) == 0, "XrViewConfigurationViewFovEPIC.type has unexpected offset % instead of 0", ((cast(*void)(*instance.type)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrViewConfigurationViewFovEPIC.type)) == 4, "XrViewConfigurationViewFovEPIC.type has unexpected size % instead of 4", size_of(type_of(XrViewConfigurationViewFovEPIC.type)));
    assert(((cast(*void)(*instance.next)) - cast(*void)(*instance)) == 8, "XrViewConfigurationViewFovEPIC.next has unexpected offset % instead of 8", ((cast(*void)(*instance.next)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrViewConfigurationViewFovEPIC.next)) == 8, "XrViewConfigurationViewFovEPIC.next has unexpected size % instead of 8", size_of(type_of(XrViewConfigurationViewFovEPIC.next)));
    assert(((cast(*void)(*instance.recommendedFov)) - cast(*void)(*instance)) == 16, "XrViewConfigurationViewFovEPIC.recommendedFov has unexpected offset % instead of 16", ((cast(*void)(*instance.recommendedFov)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrViewConfigurationViewFovEPIC.recommendedFov)) == 16, "XrViewConfigurationViewFovEPIC.recommendedFov has unexpected size % instead of 16", size_of(type_of(XrViewConfigurationViewFovEPIC.recommendedFov)));
    assert(((cast(*void)(*instance.maxMutableFov)) - cast(*void)(*instance)) == 32, "XrViewConfigurationViewFovEPIC.maxMutableFov has unexpected offset % instead of 32", ((cast(*void)(*instance.maxMutableFov)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrViewConfigurationViewFovEPIC.maxMutableFov)) == 16, "XrViewConfigurationViewFovEPIC.maxMutableFov has unexpected size % instead of 16", size_of(type_of(XrViewConfigurationViewFovEPIC.maxMutableFov)));
    assert(size_of(XrViewConfigurationViewFovEPIC) == 48, "XrViewConfigurationViewFovEPIC has size % instead of 48", size_of(XrViewConfigurationViewFovEPIC));
}

XrReprojectionModeMSFT :: enum s32 {
    DEPTH_MSFT             :: 1;
    PLANAR_FROM_DEPTH_MSFT :: 2;
    PLANAR_MANUAL_MSFT     :: 3;
    ORIENTATION_ONLY_MSFT  :: 4;
    MAX_ENUM_MSFT          :: 2147483647;

    XR_REPROJECTION_MODE_DEPTH_MSFT             :: DEPTH_MSFT;
    XR_REPROJECTION_MODE_PLANAR_FROM_DEPTH_MSFT :: PLANAR_FROM_DEPTH_MSFT;
    XR_REPROJECTION_MODE_PLANAR_MANUAL_MSFT     :: PLANAR_MANUAL_MSFT;
    XR_REPROJECTION_MODE_ORIENTATION_ONLY_MSFT  :: ORIENTATION_ONLY_MSFT;
    XR_REPROJECTION_MODE_MAX_ENUM_MSFT          :: MAX_ENUM_MSFT;
}

// XrCompositionLayerReprojectionInfoMSFT extends XrCompositionLayerProjection
XrCompositionLayerReprojectionInfoMSFT :: struct {
    type:             XrStructureType;
    next:             *void;
    reprojectionMode: XrReprojectionModeMSFT;
}
#run {
    instance: XrCompositionLayerReprojectionInfoMSFT;
    assert(((cast(*void)(*instance.type)) - cast(*void)(*instance)) == 0, "XrCompositionLayerReprojectionInfoMSFT.type has unexpected offset % instead of 0", ((cast(*void)(*instance.type)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrCompositionLayerReprojectionInfoMSFT.type)) == 4, "XrCompositionLayerReprojectionInfoMSFT.type has unexpected size % instead of 4", size_of(type_of(XrCompositionLayerReprojectionInfoMSFT.type)));
    assert(((cast(*void)(*instance.next)) - cast(*void)(*instance)) == 8, "XrCompositionLayerReprojectionInfoMSFT.next has unexpected offset % instead of 8", ((cast(*void)(*instance.next)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrCompositionLayerReprojectionInfoMSFT.next)) == 8, "XrCompositionLayerReprojectionInfoMSFT.next has unexpected size % instead of 8", size_of(type_of(XrCompositionLayerReprojectionInfoMSFT.next)));
    assert(((cast(*void)(*instance.reprojectionMode)) - cast(*void)(*instance)) == 16, "XrCompositionLayerReprojectionInfoMSFT.reprojectionMode has unexpected offset % instead of 16", ((cast(*void)(*instance.reprojectionMode)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrCompositionLayerReprojectionInfoMSFT.reprojectionMode)) == 4, "XrCompositionLayerReprojectionInfoMSFT.reprojectionMode has unexpected size % instead of 4", size_of(type_of(XrCompositionLayerReprojectionInfoMSFT.reprojectionMode)));
    assert(size_of(XrCompositionLayerReprojectionInfoMSFT) == 24, "XrCompositionLayerReprojectionInfoMSFT has size % instead of 24", size_of(XrCompositionLayerReprojectionInfoMSFT));
}

// XrCompositionLayerReprojectionPlaneOverrideMSFT extends XrCompositionLayerProjection
XrCompositionLayerReprojectionPlaneOverrideMSFT :: struct {
    type:     XrStructureType;
    next:     *void;
    position: XrVector3f;
    normal:   XrVector3f;
    velocity: XrVector3f;
}
#run {
    instance: XrCompositionLayerReprojectionPlaneOverrideMSFT;
    assert(((cast(*void)(*instance.type)) - cast(*void)(*instance)) == 0, "XrCompositionLayerReprojectionPlaneOverrideMSFT.type has unexpected offset % instead of 0", ((cast(*void)(*instance.type)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrCompositionLayerReprojectionPlaneOverrideMSFT.type)) == 4, "XrCompositionLayerReprojectionPlaneOverrideMSFT.type has unexpected size % instead of 4", size_of(type_of(XrCompositionLayerReprojectionPlaneOverrideMSFT.type)));
    assert(((cast(*void)(*instance.next)) - cast(*void)(*instance)) == 8, "XrCompositionLayerReprojectionPlaneOverrideMSFT.next has unexpected offset % instead of 8", ((cast(*void)(*instance.next)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrCompositionLayerReprojectionPlaneOverrideMSFT.next)) == 8, "XrCompositionLayerReprojectionPlaneOverrideMSFT.next has unexpected size % instead of 8", size_of(type_of(XrCompositionLayerReprojectionPlaneOverrideMSFT.next)));
    assert(((cast(*void)(*instance.position)) - cast(*void)(*instance)) == 16, "XrCompositionLayerReprojectionPlaneOverrideMSFT.position has unexpected offset % instead of 16", ((cast(*void)(*instance.position)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrCompositionLayerReprojectionPlaneOverrideMSFT.position)) == 12, "XrCompositionLayerReprojectionPlaneOverrideMSFT.position has unexpected size % instead of 12", size_of(type_of(XrCompositionLayerReprojectionPlaneOverrideMSFT.position)));
    assert(((cast(*void)(*instance.normal)) - cast(*void)(*instance)) == 28, "XrCompositionLayerReprojectionPlaneOverrideMSFT.normal has unexpected offset % instead of 28", ((cast(*void)(*instance.normal)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrCompositionLayerReprojectionPlaneOverrideMSFT.normal)) == 12, "XrCompositionLayerReprojectionPlaneOverrideMSFT.normal has unexpected size % instead of 12", size_of(type_of(XrCompositionLayerReprojectionPlaneOverrideMSFT.normal)));
    assert(((cast(*void)(*instance.velocity)) - cast(*void)(*instance)) == 40, "XrCompositionLayerReprojectionPlaneOverrideMSFT.velocity has unexpected offset % instead of 40", ((cast(*void)(*instance.velocity)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrCompositionLayerReprojectionPlaneOverrideMSFT.velocity)) == 12, "XrCompositionLayerReprojectionPlaneOverrideMSFT.velocity has unexpected size % instead of 12", size_of(type_of(XrCompositionLayerReprojectionPlaneOverrideMSFT.velocity)));
    assert(size_of(XrCompositionLayerReprojectionPlaneOverrideMSFT) == 56, "XrCompositionLayerReprojectionPlaneOverrideMSFT has size % instead of 56", size_of(XrCompositionLayerReprojectionPlaneOverrideMSFT));
}

PFN_xrEnumerateReprojectionModesMSFT :: #type (a0: XrInstance, a1: XrSystemId, a2: XrViewConfigurationType, a3: u32, a4: *u32, a5: *XrReprojectionModeMSFT) -> XrResult #c_call;

XrSwapchainStateBaseHeaderFB :: struct {
    type: XrStructureType;
    next: *void;
}
#run {
    instance: XrSwapchainStateBaseHeaderFB;
    assert(((cast(*void)(*instance.type)) - cast(*void)(*instance)) == 0, "XrSwapchainStateBaseHeaderFB.type has unexpected offset % instead of 0", ((cast(*void)(*instance.type)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrSwapchainStateBaseHeaderFB.type)) == 4, "XrSwapchainStateBaseHeaderFB.type has unexpected size % instead of 4", size_of(type_of(XrSwapchainStateBaseHeaderFB.type)));
    assert(((cast(*void)(*instance.next)) - cast(*void)(*instance)) == 8, "XrSwapchainStateBaseHeaderFB.next has unexpected offset % instead of 8", ((cast(*void)(*instance.next)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrSwapchainStateBaseHeaderFB.next)) == 8, "XrSwapchainStateBaseHeaderFB.next has unexpected size % instead of 8", size_of(type_of(XrSwapchainStateBaseHeaderFB.next)));
    assert(size_of(XrSwapchainStateBaseHeaderFB) == 16, "XrSwapchainStateBaseHeaderFB has size % instead of 16", size_of(XrSwapchainStateBaseHeaderFB));
}

PFN_xrUpdateSwapchainFB :: #type (a0: XrSwapchain, a1: *XrSwapchainStateBaseHeaderFB) -> XrResult #c_call;
PFN_xrGetSwapchainStateFB :: #type (a0: XrSwapchain, a1: *XrSwapchainStateBaseHeaderFB) -> XrResult #c_call;

XrCompositionLayerSecureContentFlagsFB :: XrFlags64;

// Flag bits for XrCompositionLayerSecureContentFlagsFB
XR_COMPOSITION_LAYER_SECURE_CONTENT_EXCLUDE_LAYER_BIT_FB: XrCompositionLayerSecureContentFlagsFB : 1;
XR_COMPOSITION_LAYER_SECURE_CONTENT_REPLACE_LAYER_BIT_FB: XrCompositionLayerSecureContentFlagsFB : 2;

// XrCompositionLayerSecureContentFB extends XrCompositionLayerBaseHeader
XrCompositionLayerSecureContentFB :: struct {
    type:  XrStructureType;
    next:  *void;
    flags: XrCompositionLayerSecureContentFlagsFB;
}
#run {
    instance: XrCompositionLayerSecureContentFB;
    assert(((cast(*void)(*instance.type)) - cast(*void)(*instance)) == 0, "XrCompositionLayerSecureContentFB.type has unexpected offset % instead of 0", ((cast(*void)(*instance.type)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrCompositionLayerSecureContentFB.type)) == 4, "XrCompositionLayerSecureContentFB.type has unexpected size % instead of 4", size_of(type_of(XrCompositionLayerSecureContentFB.type)));
    assert(((cast(*void)(*instance.next)) - cast(*void)(*instance)) == 8, "XrCompositionLayerSecureContentFB.next has unexpected offset % instead of 8", ((cast(*void)(*instance.next)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrCompositionLayerSecureContentFB.next)) == 8, "XrCompositionLayerSecureContentFB.next has unexpected size % instead of 8", size_of(type_of(XrCompositionLayerSecureContentFB.next)));
    assert(((cast(*void)(*instance.flags)) - cast(*void)(*instance)) == 16, "XrCompositionLayerSecureContentFB.flags has unexpected offset % instead of 16", ((cast(*void)(*instance.flags)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrCompositionLayerSecureContentFB.flags)) == 8, "XrCompositionLayerSecureContentFB.flags has unexpected size % instead of 8", size_of(type_of(XrCompositionLayerSecureContentFB.flags)));
    assert(size_of(XrCompositionLayerSecureContentFB) == 24, "XrCompositionLayerSecureContentFB has size % instead of 24", size_of(XrCompositionLayerSecureContentFB));
}

XrInteractionProfileDpadBindingEXT :: struct {
    type:                   XrStructureType;
    next:                   *void;
    binding:                XrPath;
    actionSet:              XrActionSet;
    forceThreshold:         float;
    forceThresholdReleased: float;
    centerRegion:           float;
    wedgeAngle:             float;
    isSticky:               XrBool32;
    onHaptic:               *XrHapticBaseHeader;
    offHaptic:              *XrHapticBaseHeader;
}
#run {
    instance: XrInteractionProfileDpadBindingEXT;
    assert(((cast(*void)(*instance.type)) - cast(*void)(*instance)) == 0, "XrInteractionProfileDpadBindingEXT.type has unexpected offset % instead of 0", ((cast(*void)(*instance.type)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrInteractionProfileDpadBindingEXT.type)) == 4, "XrInteractionProfileDpadBindingEXT.type has unexpected size % instead of 4", size_of(type_of(XrInteractionProfileDpadBindingEXT.type)));
    assert(((cast(*void)(*instance.next)) - cast(*void)(*instance)) == 8, "XrInteractionProfileDpadBindingEXT.next has unexpected offset % instead of 8", ((cast(*void)(*instance.next)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrInteractionProfileDpadBindingEXT.next)) == 8, "XrInteractionProfileDpadBindingEXT.next has unexpected size % instead of 8", size_of(type_of(XrInteractionProfileDpadBindingEXT.next)));
    assert(((cast(*void)(*instance.binding)) - cast(*void)(*instance)) == 16, "XrInteractionProfileDpadBindingEXT.binding has unexpected offset % instead of 16", ((cast(*void)(*instance.binding)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrInteractionProfileDpadBindingEXT.binding)) == 8, "XrInteractionProfileDpadBindingEXT.binding has unexpected size % instead of 8", size_of(type_of(XrInteractionProfileDpadBindingEXT.binding)));
    assert(((cast(*void)(*instance.actionSet)) - cast(*void)(*instance)) == 24, "XrInteractionProfileDpadBindingEXT.actionSet has unexpected offset % instead of 24", ((cast(*void)(*instance.actionSet)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrInteractionProfileDpadBindingEXT.actionSet)) == 8, "XrInteractionProfileDpadBindingEXT.actionSet has unexpected size % instead of 8", size_of(type_of(XrInteractionProfileDpadBindingEXT.actionSet)));
    assert(((cast(*void)(*instance.forceThreshold)) - cast(*void)(*instance)) == 32, "XrInteractionProfileDpadBindingEXT.forceThreshold has unexpected offset % instead of 32", ((cast(*void)(*instance.forceThreshold)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrInteractionProfileDpadBindingEXT.forceThreshold)) == 4, "XrInteractionProfileDpadBindingEXT.forceThreshold has unexpected size % instead of 4", size_of(type_of(XrInteractionProfileDpadBindingEXT.forceThreshold)));
    assert(((cast(*void)(*instance.forceThresholdReleased)) - cast(*void)(*instance)) == 36, "XrInteractionProfileDpadBindingEXT.forceThresholdReleased has unexpected offset % instead of 36", ((cast(*void)(*instance.forceThresholdReleased)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrInteractionProfileDpadBindingEXT.forceThresholdReleased)) == 4, "XrInteractionProfileDpadBindingEXT.forceThresholdReleased has unexpected size % instead of 4", size_of(type_of(XrInteractionProfileDpadBindingEXT.forceThresholdReleased)));
    assert(((cast(*void)(*instance.centerRegion)) - cast(*void)(*instance)) == 40, "XrInteractionProfileDpadBindingEXT.centerRegion has unexpected offset % instead of 40", ((cast(*void)(*instance.centerRegion)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrInteractionProfileDpadBindingEXT.centerRegion)) == 4, "XrInteractionProfileDpadBindingEXT.centerRegion has unexpected size % instead of 4", size_of(type_of(XrInteractionProfileDpadBindingEXT.centerRegion)));
    assert(((cast(*void)(*instance.wedgeAngle)) - cast(*void)(*instance)) == 44, "XrInteractionProfileDpadBindingEXT.wedgeAngle has unexpected offset % instead of 44", ((cast(*void)(*instance.wedgeAngle)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrInteractionProfileDpadBindingEXT.wedgeAngle)) == 4, "XrInteractionProfileDpadBindingEXT.wedgeAngle has unexpected size % instead of 4", size_of(type_of(XrInteractionProfileDpadBindingEXT.wedgeAngle)));
    assert(((cast(*void)(*instance.isSticky)) - cast(*void)(*instance)) == 48, "XrInteractionProfileDpadBindingEXT.isSticky has unexpected offset % instead of 48", ((cast(*void)(*instance.isSticky)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrInteractionProfileDpadBindingEXT.isSticky)) == 4, "XrInteractionProfileDpadBindingEXT.isSticky has unexpected size % instead of 4", size_of(type_of(XrInteractionProfileDpadBindingEXT.isSticky)));
    assert(((cast(*void)(*instance.onHaptic)) - cast(*void)(*instance)) == 56, "XrInteractionProfileDpadBindingEXT.onHaptic has unexpected offset % instead of 56", ((cast(*void)(*instance.onHaptic)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrInteractionProfileDpadBindingEXT.onHaptic)) == 8, "XrInteractionProfileDpadBindingEXT.onHaptic has unexpected size % instead of 8", size_of(type_of(XrInteractionProfileDpadBindingEXT.onHaptic)));
    assert(((cast(*void)(*instance.offHaptic)) - cast(*void)(*instance)) == 64, "XrInteractionProfileDpadBindingEXT.offHaptic has unexpected offset % instead of 64", ((cast(*void)(*instance.offHaptic)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrInteractionProfileDpadBindingEXT.offHaptic)) == 8, "XrInteractionProfileDpadBindingEXT.offHaptic has unexpected size % instead of 8", size_of(type_of(XrInteractionProfileDpadBindingEXT.offHaptic)));
    assert(size_of(XrInteractionProfileDpadBindingEXT) == 72, "XrInteractionProfileDpadBindingEXT has size % instead of 72", size_of(XrInteractionProfileDpadBindingEXT));
}

XrInteractionProfileAnalogThresholdVALVE :: struct {
    type:         XrStructureType;
    next:         *void;
    action:       XrAction;
    binding:      XrPath;
    onThreshold:  float;
    offThreshold: float;
    onHaptic:     *XrHapticBaseHeader;
    offHaptic:    *XrHapticBaseHeader;
}
#run {
    instance: XrInteractionProfileAnalogThresholdVALVE;
    assert(((cast(*void)(*instance.type)) - cast(*void)(*instance)) == 0, "XrInteractionProfileAnalogThresholdVALVE.type has unexpected offset % instead of 0", ((cast(*void)(*instance.type)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrInteractionProfileAnalogThresholdVALVE.type)) == 4, "XrInteractionProfileAnalogThresholdVALVE.type has unexpected size % instead of 4", size_of(type_of(XrInteractionProfileAnalogThresholdVALVE.type)));
    assert(((cast(*void)(*instance.next)) - cast(*void)(*instance)) == 8, "XrInteractionProfileAnalogThresholdVALVE.next has unexpected offset % instead of 8", ((cast(*void)(*instance.next)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrInteractionProfileAnalogThresholdVALVE.next)) == 8, "XrInteractionProfileAnalogThresholdVALVE.next has unexpected size % instead of 8", size_of(type_of(XrInteractionProfileAnalogThresholdVALVE.next)));
    assert(((cast(*void)(*instance.action)) - cast(*void)(*instance)) == 16, "XrInteractionProfileAnalogThresholdVALVE.action has unexpected offset % instead of 16", ((cast(*void)(*instance.action)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrInteractionProfileAnalogThresholdVALVE.action)) == 8, "XrInteractionProfileAnalogThresholdVALVE.action has unexpected size % instead of 8", size_of(type_of(XrInteractionProfileAnalogThresholdVALVE.action)));
    assert(((cast(*void)(*instance.binding)) - cast(*void)(*instance)) == 24, "XrInteractionProfileAnalogThresholdVALVE.binding has unexpected offset % instead of 24", ((cast(*void)(*instance.binding)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrInteractionProfileAnalogThresholdVALVE.binding)) == 8, "XrInteractionProfileAnalogThresholdVALVE.binding has unexpected size % instead of 8", size_of(type_of(XrInteractionProfileAnalogThresholdVALVE.binding)));
    assert(((cast(*void)(*instance.onThreshold)) - cast(*void)(*instance)) == 32, "XrInteractionProfileAnalogThresholdVALVE.onThreshold has unexpected offset % instead of 32", ((cast(*void)(*instance.onThreshold)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrInteractionProfileAnalogThresholdVALVE.onThreshold)) == 4, "XrInteractionProfileAnalogThresholdVALVE.onThreshold has unexpected size % instead of 4", size_of(type_of(XrInteractionProfileAnalogThresholdVALVE.onThreshold)));
    assert(((cast(*void)(*instance.offThreshold)) - cast(*void)(*instance)) == 36, "XrInteractionProfileAnalogThresholdVALVE.offThreshold has unexpected offset % instead of 36", ((cast(*void)(*instance.offThreshold)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrInteractionProfileAnalogThresholdVALVE.offThreshold)) == 4, "XrInteractionProfileAnalogThresholdVALVE.offThreshold has unexpected size % instead of 4", size_of(type_of(XrInteractionProfileAnalogThresholdVALVE.offThreshold)));
    assert(((cast(*void)(*instance.onHaptic)) - cast(*void)(*instance)) == 40, "XrInteractionProfileAnalogThresholdVALVE.onHaptic has unexpected offset % instead of 40", ((cast(*void)(*instance.onHaptic)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrInteractionProfileAnalogThresholdVALVE.onHaptic)) == 8, "XrInteractionProfileAnalogThresholdVALVE.onHaptic has unexpected size % instead of 8", size_of(type_of(XrInteractionProfileAnalogThresholdVALVE.onHaptic)));
    assert(((cast(*void)(*instance.offHaptic)) - cast(*void)(*instance)) == 48, "XrInteractionProfileAnalogThresholdVALVE.offHaptic has unexpected offset % instead of 48", ((cast(*void)(*instance.offHaptic)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrInteractionProfileAnalogThresholdVALVE.offHaptic)) == 8, "XrInteractionProfileAnalogThresholdVALVE.offHaptic has unexpected size % instead of 8", size_of(type_of(XrInteractionProfileAnalogThresholdVALVE.offHaptic)));
    assert(size_of(XrInteractionProfileAnalogThresholdVALVE) == 56, "XrInteractionProfileAnalogThresholdVALVE has size % instead of 56", size_of(XrInteractionProfileAnalogThresholdVALVE));
}

XrHandJointsMotionRangeEXT :: enum s32 {
    UNOBSTRUCTED_EXT             :: 1;
    CONFORMING_TO_CONTROLLER_EXT :: 2;
    MAX_ENUM_EXT                 :: 2147483647;

    XR_HAND_JOINTS_MOTION_RANGE_UNOBSTRUCTED_EXT             :: UNOBSTRUCTED_EXT;
    XR_HAND_JOINTS_MOTION_RANGE_CONFORMING_TO_CONTROLLER_EXT :: CONFORMING_TO_CONTROLLER_EXT;
    XR_HAND_JOINTS_MOTION_RANGE_MAX_ENUM_EXT                 :: MAX_ENUM_EXT;
}

// XrHandJointsMotionRangeInfoEXT extends XrHandJointsLocateInfoEXT
XrHandJointsMotionRangeInfoEXT :: struct {
    type:                  XrStructureType;
    next:                  *void;
    handJointsMotionRange: XrHandJointsMotionRangeEXT;
}
#run {
    instance: XrHandJointsMotionRangeInfoEXT;
    assert(((cast(*void)(*instance.type)) - cast(*void)(*instance)) == 0, "XrHandJointsMotionRangeInfoEXT.type has unexpected offset % instead of 0", ((cast(*void)(*instance.type)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrHandJointsMotionRangeInfoEXT.type)) == 4, "XrHandJointsMotionRangeInfoEXT.type has unexpected size % instead of 4", size_of(type_of(XrHandJointsMotionRangeInfoEXT.type)));
    assert(((cast(*void)(*instance.next)) - cast(*void)(*instance)) == 8, "XrHandJointsMotionRangeInfoEXT.next has unexpected offset % instead of 8", ((cast(*void)(*instance.next)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrHandJointsMotionRangeInfoEXT.next)) == 8, "XrHandJointsMotionRangeInfoEXT.next has unexpected size % instead of 8", size_of(type_of(XrHandJointsMotionRangeInfoEXT.next)));
    assert(((cast(*void)(*instance.handJointsMotionRange)) - cast(*void)(*instance)) == 16, "XrHandJointsMotionRangeInfoEXT.handJointsMotionRange has unexpected offset % instead of 16", ((cast(*void)(*instance.handJointsMotionRange)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrHandJointsMotionRangeInfoEXT.handJointsMotionRange)) == 4, "XrHandJointsMotionRangeInfoEXT.handJointsMotionRange has unexpected size % instead of 4", size_of(type_of(XrHandJointsMotionRangeInfoEXT.handJointsMotionRange)));
    assert(size_of(XrHandJointsMotionRangeInfoEXT) == 24, "XrHandJointsMotionRangeInfoEXT has size % instead of 24", size_of(XrHandJointsMotionRangeInfoEXT));
}

XrSceneObserverMSFT_T :: struct {}
XrSceneObserverMSFT :: *XrSceneObserverMSFT_T;

XrSceneMSFT_T :: struct {}
XrSceneMSFT :: *XrSceneMSFT_T;

XrSceneComputeFeatureMSFT :: enum s32 {
    PLANE_MSFT           :: 1;
    PLANE_MESH_MSFT      :: 2;
    VISUAL_MESH_MSFT     :: 3;
    COLLIDER_MESH_MSFT   :: 4;
    SERIALIZE_SCENE_MSFT :: 1000098000;
    MAX_ENUM_MSFT        :: 2147483647;

    XR_SCENE_COMPUTE_FEATURE_PLANE_MSFT           :: PLANE_MSFT;
    XR_SCENE_COMPUTE_FEATURE_PLANE_MESH_MSFT      :: PLANE_MESH_MSFT;
    XR_SCENE_COMPUTE_FEATURE_VISUAL_MESH_MSFT     :: VISUAL_MESH_MSFT;
    XR_SCENE_COMPUTE_FEATURE_COLLIDER_MESH_MSFT   :: COLLIDER_MESH_MSFT;
    XR_SCENE_COMPUTE_FEATURE_SERIALIZE_SCENE_MSFT :: SERIALIZE_SCENE_MSFT;
    XR_SCENE_COMPUTE_FEATURE_MAX_ENUM_MSFT        :: MAX_ENUM_MSFT;
}

XrSceneComputeConsistencyMSFT :: enum s32 {
    SNAPSHOT_COMPLETE_MSFT        :: 1;
    SNAPSHOT_INCOMPLETE_FAST_MSFT :: 2;
    OCCLUSION_OPTIMIZED_MSFT      :: 3;
    MAX_ENUM_MSFT                 :: 2147483647;

    XR_SCENE_COMPUTE_CONSISTENCY_SNAPSHOT_COMPLETE_MSFT        :: SNAPSHOT_COMPLETE_MSFT;
    XR_SCENE_COMPUTE_CONSISTENCY_SNAPSHOT_INCOMPLETE_FAST_MSFT :: SNAPSHOT_INCOMPLETE_FAST_MSFT;
    XR_SCENE_COMPUTE_CONSISTENCY_OCCLUSION_OPTIMIZED_MSFT      :: OCCLUSION_OPTIMIZED_MSFT;
    XR_SCENE_COMPUTE_CONSISTENCY_MAX_ENUM_MSFT                 :: MAX_ENUM_MSFT;
}

XrMeshComputeLodMSFT :: enum s32 {
    COARSE_MSFT    :: 1;
    MEDIUM_MSFT    :: 2;
    FINE_MSFT      :: 3;
    UNLIMITED_MSFT :: 4;
    MAX_ENUM_MSFT  :: 2147483647;

    XR_MESH_COMPUTE_LOD_COARSE_MSFT    :: COARSE_MSFT;
    XR_MESH_COMPUTE_LOD_MEDIUM_MSFT    :: MEDIUM_MSFT;
    XR_MESH_COMPUTE_LOD_FINE_MSFT      :: FINE_MSFT;
    XR_MESH_COMPUTE_LOD_UNLIMITED_MSFT :: UNLIMITED_MSFT;
    XR_MESH_COMPUTE_LOD_MAX_ENUM_MSFT  :: MAX_ENUM_MSFT;
}

XrSceneComponentTypeMSFT :: enum s32 {
    INVALID_MSFT                   :: -1;
    OBJECT_MSFT                    :: 1;
    PLANE_MSFT                     :: 2;
    VISUAL_MESH_MSFT               :: 3;
    COLLIDER_MESH_MSFT             :: 4;
    SERIALIZED_SCENE_FRAGMENT_MSFT :: 1000098000;
    MAX_ENUM_MSFT                  :: 2147483647;

    XR_SCENE_COMPONENT_TYPE_INVALID_MSFT                   :: INVALID_MSFT;
    XR_SCENE_COMPONENT_TYPE_OBJECT_MSFT                    :: OBJECT_MSFT;
    XR_SCENE_COMPONENT_TYPE_PLANE_MSFT                     :: PLANE_MSFT;
    XR_SCENE_COMPONENT_TYPE_VISUAL_MESH_MSFT               :: VISUAL_MESH_MSFT;
    XR_SCENE_COMPONENT_TYPE_COLLIDER_MESH_MSFT             :: COLLIDER_MESH_MSFT;
    XR_SCENE_COMPONENT_TYPE_SERIALIZED_SCENE_FRAGMENT_MSFT :: SERIALIZED_SCENE_FRAGMENT_MSFT;
    XR_SCENE_COMPONENT_TYPE_MAX_ENUM_MSFT                  :: MAX_ENUM_MSFT;
}

XrSceneObjectTypeMSFT :: enum s32 {
    UNCATEGORIZED_MSFT :: -1;
    BACKGROUND_MSFT    :: 1;
    WALL_MSFT          :: 2;
    FLOOR_MSFT         :: 3;
    CEILING_MSFT       :: 4;
    PLATFORM_MSFT      :: 5;
    INFERRED_MSFT      :: 6;
    MAX_ENUM_MSFT      :: 2147483647;

    XR_SCENE_OBJECT_TYPE_UNCATEGORIZED_MSFT :: UNCATEGORIZED_MSFT;
    XR_SCENE_OBJECT_TYPE_BACKGROUND_MSFT    :: BACKGROUND_MSFT;
    XR_SCENE_OBJECT_TYPE_WALL_MSFT          :: WALL_MSFT;
    XR_SCENE_OBJECT_TYPE_FLOOR_MSFT         :: FLOOR_MSFT;
    XR_SCENE_OBJECT_TYPE_CEILING_MSFT       :: CEILING_MSFT;
    XR_SCENE_OBJECT_TYPE_PLATFORM_MSFT      :: PLATFORM_MSFT;
    XR_SCENE_OBJECT_TYPE_INFERRED_MSFT      :: INFERRED_MSFT;
    XR_SCENE_OBJECT_TYPE_MAX_ENUM_MSFT      :: MAX_ENUM_MSFT;
}

XrScenePlaneAlignmentTypeMSFT :: enum s32 {
    NON_ORTHOGONAL_MSFT :: 0;
    HORIZONTAL_MSFT     :: 1;
    VERTICAL_MSFT       :: 2;
    MAX_ENUM_MSFT       :: 2147483647;

    XR_SCENE_PLANE_ALIGNMENT_TYPE_NON_ORTHOGONAL_MSFT :: NON_ORTHOGONAL_MSFT;
    XR_SCENE_PLANE_ALIGNMENT_TYPE_HORIZONTAL_MSFT     :: HORIZONTAL_MSFT;
    XR_SCENE_PLANE_ALIGNMENT_TYPE_VERTICAL_MSFT       :: VERTICAL_MSFT;
    XR_SCENE_PLANE_ALIGNMENT_TYPE_MAX_ENUM_MSFT       :: MAX_ENUM_MSFT;
}

XrSceneComputeStateMSFT :: enum s32 {
    NONE_MSFT                 :: 0;
    UPDATING_MSFT             :: 1;
    COMPLETED_MSFT            :: 2;
    COMPLETED_WITH_ERROR_MSFT :: 3;
    MAX_ENUM_MSFT             :: 2147483647;

    XR_SCENE_COMPUTE_STATE_NONE_MSFT                 :: NONE_MSFT;
    XR_SCENE_COMPUTE_STATE_UPDATING_MSFT             :: UPDATING_MSFT;
    XR_SCENE_COMPUTE_STATE_COMPLETED_MSFT            :: COMPLETED_MSFT;
    XR_SCENE_COMPUTE_STATE_COMPLETED_WITH_ERROR_MSFT :: COMPLETED_WITH_ERROR_MSFT;
    XR_SCENE_COMPUTE_STATE_MAX_ENUM_MSFT             :: MAX_ENUM_MSFT;
}

XrUuidMSFT :: struct {
    bytes: [16] u8;
}
#run {
    instance: XrUuidMSFT;
    assert(((cast(*void)(*instance.bytes)) - cast(*void)(*instance)) == 0, "XrUuidMSFT.bytes has unexpected offset % instead of 0", ((cast(*void)(*instance.bytes)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrUuidMSFT.bytes)) == 16, "XrUuidMSFT.bytes has unexpected size % instead of 16", size_of(type_of(XrUuidMSFT.bytes)));
    assert(size_of(XrUuidMSFT) == 16, "XrUuidMSFT has size % instead of 16", size_of(XrUuidMSFT));
}

XrSceneObserverCreateInfoMSFT :: struct {
    type: XrStructureType;
    next: *void;
}
#run {
    instance: XrSceneObserverCreateInfoMSFT;
    assert(((cast(*void)(*instance.type)) - cast(*void)(*instance)) == 0, "XrSceneObserverCreateInfoMSFT.type has unexpected offset % instead of 0", ((cast(*void)(*instance.type)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrSceneObserverCreateInfoMSFT.type)) == 4, "XrSceneObserverCreateInfoMSFT.type has unexpected size % instead of 4", size_of(type_of(XrSceneObserverCreateInfoMSFT.type)));
    assert(((cast(*void)(*instance.next)) - cast(*void)(*instance)) == 8, "XrSceneObserverCreateInfoMSFT.next has unexpected offset % instead of 8", ((cast(*void)(*instance.next)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrSceneObserverCreateInfoMSFT.next)) == 8, "XrSceneObserverCreateInfoMSFT.next has unexpected size % instead of 8", size_of(type_of(XrSceneObserverCreateInfoMSFT.next)));
    assert(size_of(XrSceneObserverCreateInfoMSFT) == 16, "XrSceneObserverCreateInfoMSFT has size % instead of 16", size_of(XrSceneObserverCreateInfoMSFT));
}

XrSceneCreateInfoMSFT :: struct {
    type: XrStructureType;
    next: *void;
}
#run {
    instance: XrSceneCreateInfoMSFT;
    assert(((cast(*void)(*instance.type)) - cast(*void)(*instance)) == 0, "XrSceneCreateInfoMSFT.type has unexpected offset % instead of 0", ((cast(*void)(*instance.type)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrSceneCreateInfoMSFT.type)) == 4, "XrSceneCreateInfoMSFT.type has unexpected size % instead of 4", size_of(type_of(XrSceneCreateInfoMSFT.type)));
    assert(((cast(*void)(*instance.next)) - cast(*void)(*instance)) == 8, "XrSceneCreateInfoMSFT.next has unexpected offset % instead of 8", ((cast(*void)(*instance.next)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrSceneCreateInfoMSFT.next)) == 8, "XrSceneCreateInfoMSFT.next has unexpected size % instead of 8", size_of(type_of(XrSceneCreateInfoMSFT.next)));
    assert(size_of(XrSceneCreateInfoMSFT) == 16, "XrSceneCreateInfoMSFT has size % instead of 16", size_of(XrSceneCreateInfoMSFT));
}

XrSceneSphereBoundMSFT :: struct {
    center: XrVector3f;
    radius: float;
}
#run {
    instance: XrSceneSphereBoundMSFT;
    assert(((cast(*void)(*instance.center)) - cast(*void)(*instance)) == 0, "XrSceneSphereBoundMSFT.center has unexpected offset % instead of 0", ((cast(*void)(*instance.center)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrSceneSphereBoundMSFT.center)) == 12, "XrSceneSphereBoundMSFT.center has unexpected size % instead of 12", size_of(type_of(XrSceneSphereBoundMSFT.center)));
    assert(((cast(*void)(*instance.radius)) - cast(*void)(*instance)) == 12, "XrSceneSphereBoundMSFT.radius has unexpected offset % instead of 12", ((cast(*void)(*instance.radius)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrSceneSphereBoundMSFT.radius)) == 4, "XrSceneSphereBoundMSFT.radius has unexpected size % instead of 4", size_of(type_of(XrSceneSphereBoundMSFT.radius)));
    assert(size_of(XrSceneSphereBoundMSFT) == 16, "XrSceneSphereBoundMSFT has size % instead of 16", size_of(XrSceneSphereBoundMSFT));
}

XrSceneOrientedBoxBoundMSFT :: struct {
    pose:    XrPosef;
    extents: XrVector3f;
}
#run {
    instance: XrSceneOrientedBoxBoundMSFT;
    assert(((cast(*void)(*instance.pose)) - cast(*void)(*instance)) == 0, "XrSceneOrientedBoxBoundMSFT.pose has unexpected offset % instead of 0", ((cast(*void)(*instance.pose)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrSceneOrientedBoxBoundMSFT.pose)) == 28, "XrSceneOrientedBoxBoundMSFT.pose has unexpected size % instead of 28", size_of(type_of(XrSceneOrientedBoxBoundMSFT.pose)));
    assert(((cast(*void)(*instance.extents)) - cast(*void)(*instance)) == 28, "XrSceneOrientedBoxBoundMSFT.extents has unexpected offset % instead of 28", ((cast(*void)(*instance.extents)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrSceneOrientedBoxBoundMSFT.extents)) == 12, "XrSceneOrientedBoxBoundMSFT.extents has unexpected size % instead of 12", size_of(type_of(XrSceneOrientedBoxBoundMSFT.extents)));
    assert(size_of(XrSceneOrientedBoxBoundMSFT) == 40, "XrSceneOrientedBoxBoundMSFT has size % instead of 40", size_of(XrSceneOrientedBoxBoundMSFT));
}

XrSceneFrustumBoundMSFT :: struct {
    pose:        XrPosef;
    fov:         XrFovf;
    farDistance: float;
}
#run {
    instance: XrSceneFrustumBoundMSFT;
    assert(((cast(*void)(*instance.pose)) - cast(*void)(*instance)) == 0, "XrSceneFrustumBoundMSFT.pose has unexpected offset % instead of 0", ((cast(*void)(*instance.pose)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrSceneFrustumBoundMSFT.pose)) == 28, "XrSceneFrustumBoundMSFT.pose has unexpected size % instead of 28", size_of(type_of(XrSceneFrustumBoundMSFT.pose)));
    assert(((cast(*void)(*instance.fov)) - cast(*void)(*instance)) == 28, "XrSceneFrustumBoundMSFT.fov has unexpected offset % instead of 28", ((cast(*void)(*instance.fov)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrSceneFrustumBoundMSFT.fov)) == 16, "XrSceneFrustumBoundMSFT.fov has unexpected size % instead of 16", size_of(type_of(XrSceneFrustumBoundMSFT.fov)));
    assert(((cast(*void)(*instance.farDistance)) - cast(*void)(*instance)) == 44, "XrSceneFrustumBoundMSFT.farDistance has unexpected offset % instead of 44", ((cast(*void)(*instance.farDistance)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrSceneFrustumBoundMSFT.farDistance)) == 4, "XrSceneFrustumBoundMSFT.farDistance has unexpected size % instead of 4", size_of(type_of(XrSceneFrustumBoundMSFT.farDistance)));
    assert(size_of(XrSceneFrustumBoundMSFT) == 48, "XrSceneFrustumBoundMSFT has size % instead of 48", size_of(XrSceneFrustumBoundMSFT));
}

XrSceneBoundsMSFT :: struct {
    space:        XrSpace;
    time:         XrTime;
    sphereCount:  u32;
    spheres:      *XrSceneSphereBoundMSFT;
    boxCount:     u32;
    boxes:        *XrSceneOrientedBoxBoundMSFT;
    frustumCount: u32;
    frustums:     *XrSceneFrustumBoundMSFT;
}
#run {
    instance: XrSceneBoundsMSFT;
    assert(((cast(*void)(*instance.space)) - cast(*void)(*instance)) == 0, "XrSceneBoundsMSFT.space has unexpected offset % instead of 0", ((cast(*void)(*instance.space)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrSceneBoundsMSFT.space)) == 8, "XrSceneBoundsMSFT.space has unexpected size % instead of 8", size_of(type_of(XrSceneBoundsMSFT.space)));
    assert(((cast(*void)(*instance.time)) - cast(*void)(*instance)) == 8, "XrSceneBoundsMSFT.time has unexpected offset % instead of 8", ((cast(*void)(*instance.time)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrSceneBoundsMSFT.time)) == 8, "XrSceneBoundsMSFT.time has unexpected size % instead of 8", size_of(type_of(XrSceneBoundsMSFT.time)));
    assert(((cast(*void)(*instance.sphereCount)) - cast(*void)(*instance)) == 16, "XrSceneBoundsMSFT.sphereCount has unexpected offset % instead of 16", ((cast(*void)(*instance.sphereCount)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrSceneBoundsMSFT.sphereCount)) == 4, "XrSceneBoundsMSFT.sphereCount has unexpected size % instead of 4", size_of(type_of(XrSceneBoundsMSFT.sphereCount)));
    assert(((cast(*void)(*instance.spheres)) - cast(*void)(*instance)) == 24, "XrSceneBoundsMSFT.spheres has unexpected offset % instead of 24", ((cast(*void)(*instance.spheres)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrSceneBoundsMSFT.spheres)) == 8, "XrSceneBoundsMSFT.spheres has unexpected size % instead of 8", size_of(type_of(XrSceneBoundsMSFT.spheres)));
    assert(((cast(*void)(*instance.boxCount)) - cast(*void)(*instance)) == 32, "XrSceneBoundsMSFT.boxCount has unexpected offset % instead of 32", ((cast(*void)(*instance.boxCount)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrSceneBoundsMSFT.boxCount)) == 4, "XrSceneBoundsMSFT.boxCount has unexpected size % instead of 4", size_of(type_of(XrSceneBoundsMSFT.boxCount)));
    assert(((cast(*void)(*instance.boxes)) - cast(*void)(*instance)) == 40, "XrSceneBoundsMSFT.boxes has unexpected offset % instead of 40", ((cast(*void)(*instance.boxes)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrSceneBoundsMSFT.boxes)) == 8, "XrSceneBoundsMSFT.boxes has unexpected size % instead of 8", size_of(type_of(XrSceneBoundsMSFT.boxes)));
    assert(((cast(*void)(*instance.frustumCount)) - cast(*void)(*instance)) == 48, "XrSceneBoundsMSFT.frustumCount has unexpected offset % instead of 48", ((cast(*void)(*instance.frustumCount)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrSceneBoundsMSFT.frustumCount)) == 4, "XrSceneBoundsMSFT.frustumCount has unexpected size % instead of 4", size_of(type_of(XrSceneBoundsMSFT.frustumCount)));
    assert(((cast(*void)(*instance.frustums)) - cast(*void)(*instance)) == 56, "XrSceneBoundsMSFT.frustums has unexpected offset % instead of 56", ((cast(*void)(*instance.frustums)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrSceneBoundsMSFT.frustums)) == 8, "XrSceneBoundsMSFT.frustums has unexpected size % instead of 8", size_of(type_of(XrSceneBoundsMSFT.frustums)));
    assert(size_of(XrSceneBoundsMSFT) == 64, "XrSceneBoundsMSFT has size % instead of 64", size_of(XrSceneBoundsMSFT));
}

XrNewSceneComputeInfoMSFT :: struct {
    type:                  XrStructureType;
    next:                  *void;
    requestedFeatureCount: u32;
    requestedFeatures:     *XrSceneComputeFeatureMSFT;
    consistency:           XrSceneComputeConsistencyMSFT;
    bounds:                XrSceneBoundsMSFT;
}
#run {
    instance: XrNewSceneComputeInfoMSFT;
    assert(((cast(*void)(*instance.type)) - cast(*void)(*instance)) == 0, "XrNewSceneComputeInfoMSFT.type has unexpected offset % instead of 0", ((cast(*void)(*instance.type)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrNewSceneComputeInfoMSFT.type)) == 4, "XrNewSceneComputeInfoMSFT.type has unexpected size % instead of 4", size_of(type_of(XrNewSceneComputeInfoMSFT.type)));
    assert(((cast(*void)(*instance.next)) - cast(*void)(*instance)) == 8, "XrNewSceneComputeInfoMSFT.next has unexpected offset % instead of 8", ((cast(*void)(*instance.next)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrNewSceneComputeInfoMSFT.next)) == 8, "XrNewSceneComputeInfoMSFT.next has unexpected size % instead of 8", size_of(type_of(XrNewSceneComputeInfoMSFT.next)));
    assert(((cast(*void)(*instance.requestedFeatureCount)) - cast(*void)(*instance)) == 16, "XrNewSceneComputeInfoMSFT.requestedFeatureCount has unexpected offset % instead of 16", ((cast(*void)(*instance.requestedFeatureCount)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrNewSceneComputeInfoMSFT.requestedFeatureCount)) == 4, "XrNewSceneComputeInfoMSFT.requestedFeatureCount has unexpected size % instead of 4", size_of(type_of(XrNewSceneComputeInfoMSFT.requestedFeatureCount)));
    assert(((cast(*void)(*instance.requestedFeatures)) - cast(*void)(*instance)) == 24, "XrNewSceneComputeInfoMSFT.requestedFeatures has unexpected offset % instead of 24", ((cast(*void)(*instance.requestedFeatures)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrNewSceneComputeInfoMSFT.requestedFeatures)) == 8, "XrNewSceneComputeInfoMSFT.requestedFeatures has unexpected size % instead of 8", size_of(type_of(XrNewSceneComputeInfoMSFT.requestedFeatures)));
    assert(((cast(*void)(*instance.consistency)) - cast(*void)(*instance)) == 32, "XrNewSceneComputeInfoMSFT.consistency has unexpected offset % instead of 32", ((cast(*void)(*instance.consistency)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrNewSceneComputeInfoMSFT.consistency)) == 4, "XrNewSceneComputeInfoMSFT.consistency has unexpected size % instead of 4", size_of(type_of(XrNewSceneComputeInfoMSFT.consistency)));
    assert(((cast(*void)(*instance.bounds)) - cast(*void)(*instance)) == 40, "XrNewSceneComputeInfoMSFT.bounds has unexpected offset % instead of 40", ((cast(*void)(*instance.bounds)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrNewSceneComputeInfoMSFT.bounds)) == 64, "XrNewSceneComputeInfoMSFT.bounds has unexpected size % instead of 64", size_of(type_of(XrNewSceneComputeInfoMSFT.bounds)));
    assert(size_of(XrNewSceneComputeInfoMSFT) == 104, "XrNewSceneComputeInfoMSFT has size % instead of 104", size_of(XrNewSceneComputeInfoMSFT));
}

// XrVisualMeshComputeLodInfoMSFT extends XrNewSceneComputeInfoMSFT
XrVisualMeshComputeLodInfoMSFT :: struct {
    type: XrStructureType;
    next: *void;
    lod:  XrMeshComputeLodMSFT;
}
#run {
    instance: XrVisualMeshComputeLodInfoMSFT;
    assert(((cast(*void)(*instance.type)) - cast(*void)(*instance)) == 0, "XrVisualMeshComputeLodInfoMSFT.type has unexpected offset % instead of 0", ((cast(*void)(*instance.type)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrVisualMeshComputeLodInfoMSFT.type)) == 4, "XrVisualMeshComputeLodInfoMSFT.type has unexpected size % instead of 4", size_of(type_of(XrVisualMeshComputeLodInfoMSFT.type)));
    assert(((cast(*void)(*instance.next)) - cast(*void)(*instance)) == 8, "XrVisualMeshComputeLodInfoMSFT.next has unexpected offset % instead of 8", ((cast(*void)(*instance.next)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrVisualMeshComputeLodInfoMSFT.next)) == 8, "XrVisualMeshComputeLodInfoMSFT.next has unexpected size % instead of 8", size_of(type_of(XrVisualMeshComputeLodInfoMSFT.next)));
    assert(((cast(*void)(*instance.lod)) - cast(*void)(*instance)) == 16, "XrVisualMeshComputeLodInfoMSFT.lod has unexpected offset % instead of 16", ((cast(*void)(*instance.lod)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrVisualMeshComputeLodInfoMSFT.lod)) == 4, "XrVisualMeshComputeLodInfoMSFT.lod has unexpected size % instead of 4", size_of(type_of(XrVisualMeshComputeLodInfoMSFT.lod)));
    assert(size_of(XrVisualMeshComputeLodInfoMSFT) == 24, "XrVisualMeshComputeLodInfoMSFT has size % instead of 24", size_of(XrVisualMeshComputeLodInfoMSFT));
}

XrSceneComponentMSFT :: struct {
    componentType: XrSceneComponentTypeMSFT;
    id:            XrUuidMSFT;
    parentId:      XrUuidMSFT;
    updateTime:    XrTime;
}
#run {
    instance: XrSceneComponentMSFT;
    assert(((cast(*void)(*instance.componentType)) - cast(*void)(*instance)) == 0, "XrSceneComponentMSFT.componentType has unexpected offset % instead of 0", ((cast(*void)(*instance.componentType)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrSceneComponentMSFT.componentType)) == 4, "XrSceneComponentMSFT.componentType has unexpected size % instead of 4", size_of(type_of(XrSceneComponentMSFT.componentType)));
    assert(((cast(*void)(*instance.id)) - cast(*void)(*instance)) == 4, "XrSceneComponentMSFT.id has unexpected offset % instead of 4", ((cast(*void)(*instance.id)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrSceneComponentMSFT.id)) == 16, "XrSceneComponentMSFT.id has unexpected size % instead of 16", size_of(type_of(XrSceneComponentMSFT.id)));
    assert(((cast(*void)(*instance.parentId)) - cast(*void)(*instance)) == 20, "XrSceneComponentMSFT.parentId has unexpected offset % instead of 20", ((cast(*void)(*instance.parentId)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrSceneComponentMSFT.parentId)) == 16, "XrSceneComponentMSFT.parentId has unexpected size % instead of 16", size_of(type_of(XrSceneComponentMSFT.parentId)));
    assert(((cast(*void)(*instance.updateTime)) - cast(*void)(*instance)) == 40, "XrSceneComponentMSFT.updateTime has unexpected offset % instead of 40", ((cast(*void)(*instance.updateTime)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrSceneComponentMSFT.updateTime)) == 8, "XrSceneComponentMSFT.updateTime has unexpected size % instead of 8", size_of(type_of(XrSceneComponentMSFT.updateTime)));
    assert(size_of(XrSceneComponentMSFT) == 48, "XrSceneComponentMSFT has size % instead of 48", size_of(XrSceneComponentMSFT));
}

XrSceneComponentsMSFT :: struct {
    type:                   XrStructureType;
    next:                   *void;
    componentCapacityInput: u32;
    componentCountOutput:   u32;
    components:             *XrSceneComponentMSFT;
}
#run {
    instance: XrSceneComponentsMSFT;
    assert(((cast(*void)(*instance.type)) - cast(*void)(*instance)) == 0, "XrSceneComponentsMSFT.type has unexpected offset % instead of 0", ((cast(*void)(*instance.type)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrSceneComponentsMSFT.type)) == 4, "XrSceneComponentsMSFT.type has unexpected size % instead of 4", size_of(type_of(XrSceneComponentsMSFT.type)));
    assert(((cast(*void)(*instance.next)) - cast(*void)(*instance)) == 8, "XrSceneComponentsMSFT.next has unexpected offset % instead of 8", ((cast(*void)(*instance.next)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrSceneComponentsMSFT.next)) == 8, "XrSceneComponentsMSFT.next has unexpected size % instead of 8", size_of(type_of(XrSceneComponentsMSFT.next)));
    assert(((cast(*void)(*instance.componentCapacityInput)) - cast(*void)(*instance)) == 16, "XrSceneComponentsMSFT.componentCapacityInput has unexpected offset % instead of 16", ((cast(*void)(*instance.componentCapacityInput)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrSceneComponentsMSFT.componentCapacityInput)) == 4, "XrSceneComponentsMSFT.componentCapacityInput has unexpected size % instead of 4", size_of(type_of(XrSceneComponentsMSFT.componentCapacityInput)));
    assert(((cast(*void)(*instance.componentCountOutput)) - cast(*void)(*instance)) == 20, "XrSceneComponentsMSFT.componentCountOutput has unexpected offset % instead of 20", ((cast(*void)(*instance.componentCountOutput)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrSceneComponentsMSFT.componentCountOutput)) == 4, "XrSceneComponentsMSFT.componentCountOutput has unexpected size % instead of 4", size_of(type_of(XrSceneComponentsMSFT.componentCountOutput)));
    assert(((cast(*void)(*instance.components)) - cast(*void)(*instance)) == 24, "XrSceneComponentsMSFT.components has unexpected offset % instead of 24", ((cast(*void)(*instance.components)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrSceneComponentsMSFT.components)) == 8, "XrSceneComponentsMSFT.components has unexpected size % instead of 8", size_of(type_of(XrSceneComponentsMSFT.components)));
    assert(size_of(XrSceneComponentsMSFT) == 32, "XrSceneComponentsMSFT has size % instead of 32", size_of(XrSceneComponentsMSFT));
}

XrSceneComponentsGetInfoMSFT :: struct {
    type:          XrStructureType;
    next:          *void;
    componentType: XrSceneComponentTypeMSFT;
}
#run {
    instance: XrSceneComponentsGetInfoMSFT;
    assert(((cast(*void)(*instance.type)) - cast(*void)(*instance)) == 0, "XrSceneComponentsGetInfoMSFT.type has unexpected offset % instead of 0", ((cast(*void)(*instance.type)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrSceneComponentsGetInfoMSFT.type)) == 4, "XrSceneComponentsGetInfoMSFT.type has unexpected size % instead of 4", size_of(type_of(XrSceneComponentsGetInfoMSFT.type)));
    assert(((cast(*void)(*instance.next)) - cast(*void)(*instance)) == 8, "XrSceneComponentsGetInfoMSFT.next has unexpected offset % instead of 8", ((cast(*void)(*instance.next)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrSceneComponentsGetInfoMSFT.next)) == 8, "XrSceneComponentsGetInfoMSFT.next has unexpected size % instead of 8", size_of(type_of(XrSceneComponentsGetInfoMSFT.next)));
    assert(((cast(*void)(*instance.componentType)) - cast(*void)(*instance)) == 16, "XrSceneComponentsGetInfoMSFT.componentType has unexpected offset % instead of 16", ((cast(*void)(*instance.componentType)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrSceneComponentsGetInfoMSFT.componentType)) == 4, "XrSceneComponentsGetInfoMSFT.componentType has unexpected size % instead of 4", size_of(type_of(XrSceneComponentsGetInfoMSFT.componentType)));
    assert(size_of(XrSceneComponentsGetInfoMSFT) == 24, "XrSceneComponentsGetInfoMSFT has size % instead of 24", size_of(XrSceneComponentsGetInfoMSFT));
}

XrSceneComponentLocationMSFT :: struct {
    flags: XrSpaceLocationFlags;
    pose:  XrPosef;
}
#run {
    instance: XrSceneComponentLocationMSFT;
    assert(((cast(*void)(*instance.flags)) - cast(*void)(*instance)) == 0, "XrSceneComponentLocationMSFT.flags has unexpected offset % instead of 0", ((cast(*void)(*instance.flags)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrSceneComponentLocationMSFT.flags)) == 8, "XrSceneComponentLocationMSFT.flags has unexpected size % instead of 8", size_of(type_of(XrSceneComponentLocationMSFT.flags)));
    assert(((cast(*void)(*instance.pose)) - cast(*void)(*instance)) == 8, "XrSceneComponentLocationMSFT.pose has unexpected offset % instead of 8", ((cast(*void)(*instance.pose)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrSceneComponentLocationMSFT.pose)) == 28, "XrSceneComponentLocationMSFT.pose has unexpected size % instead of 28", size_of(type_of(XrSceneComponentLocationMSFT.pose)));
    assert(size_of(XrSceneComponentLocationMSFT) == 40, "XrSceneComponentLocationMSFT has size % instead of 40", size_of(XrSceneComponentLocationMSFT));
}

XrSceneComponentLocationsMSFT :: struct {
    type:          XrStructureType;
    next:          *void;
    locationCount: u32;
    locations:     *XrSceneComponentLocationMSFT;
}
#run {
    instance: XrSceneComponentLocationsMSFT;
    assert(((cast(*void)(*instance.type)) - cast(*void)(*instance)) == 0, "XrSceneComponentLocationsMSFT.type has unexpected offset % instead of 0", ((cast(*void)(*instance.type)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrSceneComponentLocationsMSFT.type)) == 4, "XrSceneComponentLocationsMSFT.type has unexpected size % instead of 4", size_of(type_of(XrSceneComponentLocationsMSFT.type)));
    assert(((cast(*void)(*instance.next)) - cast(*void)(*instance)) == 8, "XrSceneComponentLocationsMSFT.next has unexpected offset % instead of 8", ((cast(*void)(*instance.next)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrSceneComponentLocationsMSFT.next)) == 8, "XrSceneComponentLocationsMSFT.next has unexpected size % instead of 8", size_of(type_of(XrSceneComponentLocationsMSFT.next)));
    assert(((cast(*void)(*instance.locationCount)) - cast(*void)(*instance)) == 16, "XrSceneComponentLocationsMSFT.locationCount has unexpected offset % instead of 16", ((cast(*void)(*instance.locationCount)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrSceneComponentLocationsMSFT.locationCount)) == 4, "XrSceneComponentLocationsMSFT.locationCount has unexpected size % instead of 4", size_of(type_of(XrSceneComponentLocationsMSFT.locationCount)));
    assert(((cast(*void)(*instance.locations)) - cast(*void)(*instance)) == 24, "XrSceneComponentLocationsMSFT.locations has unexpected offset % instead of 24", ((cast(*void)(*instance.locations)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrSceneComponentLocationsMSFT.locations)) == 8, "XrSceneComponentLocationsMSFT.locations has unexpected size % instead of 8", size_of(type_of(XrSceneComponentLocationsMSFT.locations)));
    assert(size_of(XrSceneComponentLocationsMSFT) == 32, "XrSceneComponentLocationsMSFT has size % instead of 32", size_of(XrSceneComponentLocationsMSFT));
}

XrSceneComponentsLocateInfoMSFT :: struct {
    type:             XrStructureType;
    next:             *void;
    baseSpace:        XrSpace;
    time:             XrTime;
    componentIdCount: u32;
    componentIds:     *XrUuidMSFT;
}
#run {
    instance: XrSceneComponentsLocateInfoMSFT;
    assert(((cast(*void)(*instance.type)) - cast(*void)(*instance)) == 0, "XrSceneComponentsLocateInfoMSFT.type has unexpected offset % instead of 0", ((cast(*void)(*instance.type)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrSceneComponentsLocateInfoMSFT.type)) == 4, "XrSceneComponentsLocateInfoMSFT.type has unexpected size % instead of 4", size_of(type_of(XrSceneComponentsLocateInfoMSFT.type)));
    assert(((cast(*void)(*instance.next)) - cast(*void)(*instance)) == 8, "XrSceneComponentsLocateInfoMSFT.next has unexpected offset % instead of 8", ((cast(*void)(*instance.next)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrSceneComponentsLocateInfoMSFT.next)) == 8, "XrSceneComponentsLocateInfoMSFT.next has unexpected size % instead of 8", size_of(type_of(XrSceneComponentsLocateInfoMSFT.next)));
    assert(((cast(*void)(*instance.baseSpace)) - cast(*void)(*instance)) == 16, "XrSceneComponentsLocateInfoMSFT.baseSpace has unexpected offset % instead of 16", ((cast(*void)(*instance.baseSpace)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrSceneComponentsLocateInfoMSFT.baseSpace)) == 8, "XrSceneComponentsLocateInfoMSFT.baseSpace has unexpected size % instead of 8", size_of(type_of(XrSceneComponentsLocateInfoMSFT.baseSpace)));
    assert(((cast(*void)(*instance.time)) - cast(*void)(*instance)) == 24, "XrSceneComponentsLocateInfoMSFT.time has unexpected offset % instead of 24", ((cast(*void)(*instance.time)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrSceneComponentsLocateInfoMSFT.time)) == 8, "XrSceneComponentsLocateInfoMSFT.time has unexpected size % instead of 8", size_of(type_of(XrSceneComponentsLocateInfoMSFT.time)));
    assert(((cast(*void)(*instance.componentIdCount)) - cast(*void)(*instance)) == 32, "XrSceneComponentsLocateInfoMSFT.componentIdCount has unexpected offset % instead of 32", ((cast(*void)(*instance.componentIdCount)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrSceneComponentsLocateInfoMSFT.componentIdCount)) == 4, "XrSceneComponentsLocateInfoMSFT.componentIdCount has unexpected size % instead of 4", size_of(type_of(XrSceneComponentsLocateInfoMSFT.componentIdCount)));
    assert(((cast(*void)(*instance.componentIds)) - cast(*void)(*instance)) == 40, "XrSceneComponentsLocateInfoMSFT.componentIds has unexpected offset % instead of 40", ((cast(*void)(*instance.componentIds)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrSceneComponentsLocateInfoMSFT.componentIds)) == 8, "XrSceneComponentsLocateInfoMSFT.componentIds has unexpected size % instead of 8", size_of(type_of(XrSceneComponentsLocateInfoMSFT.componentIds)));
    assert(size_of(XrSceneComponentsLocateInfoMSFT) == 48, "XrSceneComponentsLocateInfoMSFT has size % instead of 48", size_of(XrSceneComponentsLocateInfoMSFT));
}

XrSceneObjectMSFT :: struct {
    objectType: XrSceneObjectTypeMSFT;
}
#run {
    instance: XrSceneObjectMSFT;
    assert(((cast(*void)(*instance.objectType)) - cast(*void)(*instance)) == 0, "XrSceneObjectMSFT.objectType has unexpected offset % instead of 0", ((cast(*void)(*instance.objectType)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrSceneObjectMSFT.objectType)) == 4, "XrSceneObjectMSFT.objectType has unexpected size % instead of 4", size_of(type_of(XrSceneObjectMSFT.objectType)));
    assert(size_of(XrSceneObjectMSFT) == 4, "XrSceneObjectMSFT has size % instead of 4", size_of(XrSceneObjectMSFT));
}

// XrSceneObjectsMSFT extends XrSceneComponentsMSFT
XrSceneObjectsMSFT :: struct {
    type:             XrStructureType;
    next:             *void;
    sceneObjectCount: u32;
    sceneObjects:     *XrSceneObjectMSFT;
}
#run {
    instance: XrSceneObjectsMSFT;
    assert(((cast(*void)(*instance.type)) - cast(*void)(*instance)) == 0, "XrSceneObjectsMSFT.type has unexpected offset % instead of 0", ((cast(*void)(*instance.type)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrSceneObjectsMSFT.type)) == 4, "XrSceneObjectsMSFT.type has unexpected size % instead of 4", size_of(type_of(XrSceneObjectsMSFT.type)));
    assert(((cast(*void)(*instance.next)) - cast(*void)(*instance)) == 8, "XrSceneObjectsMSFT.next has unexpected offset % instead of 8", ((cast(*void)(*instance.next)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrSceneObjectsMSFT.next)) == 8, "XrSceneObjectsMSFT.next has unexpected size % instead of 8", size_of(type_of(XrSceneObjectsMSFT.next)));
    assert(((cast(*void)(*instance.sceneObjectCount)) - cast(*void)(*instance)) == 16, "XrSceneObjectsMSFT.sceneObjectCount has unexpected offset % instead of 16", ((cast(*void)(*instance.sceneObjectCount)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrSceneObjectsMSFT.sceneObjectCount)) == 4, "XrSceneObjectsMSFT.sceneObjectCount has unexpected size % instead of 4", size_of(type_of(XrSceneObjectsMSFT.sceneObjectCount)));
    assert(((cast(*void)(*instance.sceneObjects)) - cast(*void)(*instance)) == 24, "XrSceneObjectsMSFT.sceneObjects has unexpected offset % instead of 24", ((cast(*void)(*instance.sceneObjects)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrSceneObjectsMSFT.sceneObjects)) == 8, "XrSceneObjectsMSFT.sceneObjects has unexpected size % instead of 8", size_of(type_of(XrSceneObjectsMSFT.sceneObjects)));
    assert(size_of(XrSceneObjectsMSFT) == 32, "XrSceneObjectsMSFT has size % instead of 32", size_of(XrSceneObjectsMSFT));
}

// XrSceneComponentParentFilterInfoMSFT extends XrSceneComponentsGetInfoMSFT
XrSceneComponentParentFilterInfoMSFT :: struct {
    type:     XrStructureType;
    next:     *void;
    parentId: XrUuidMSFT;
}
#run {
    instance: XrSceneComponentParentFilterInfoMSFT;
    assert(((cast(*void)(*instance.type)) - cast(*void)(*instance)) == 0, "XrSceneComponentParentFilterInfoMSFT.type has unexpected offset % instead of 0", ((cast(*void)(*instance.type)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrSceneComponentParentFilterInfoMSFT.type)) == 4, "XrSceneComponentParentFilterInfoMSFT.type has unexpected size % instead of 4", size_of(type_of(XrSceneComponentParentFilterInfoMSFT.type)));
    assert(((cast(*void)(*instance.next)) - cast(*void)(*instance)) == 8, "XrSceneComponentParentFilterInfoMSFT.next has unexpected offset % instead of 8", ((cast(*void)(*instance.next)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrSceneComponentParentFilterInfoMSFT.next)) == 8, "XrSceneComponentParentFilterInfoMSFT.next has unexpected size % instead of 8", size_of(type_of(XrSceneComponentParentFilterInfoMSFT.next)));
    assert(((cast(*void)(*instance.parentId)) - cast(*void)(*instance)) == 16, "XrSceneComponentParentFilterInfoMSFT.parentId has unexpected offset % instead of 16", ((cast(*void)(*instance.parentId)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrSceneComponentParentFilterInfoMSFT.parentId)) == 16, "XrSceneComponentParentFilterInfoMSFT.parentId has unexpected size % instead of 16", size_of(type_of(XrSceneComponentParentFilterInfoMSFT.parentId)));
    assert(size_of(XrSceneComponentParentFilterInfoMSFT) == 32, "XrSceneComponentParentFilterInfoMSFT has size % instead of 32", size_of(XrSceneComponentParentFilterInfoMSFT));
}

// XrSceneObjectTypesFilterInfoMSFT extends XrSceneComponentsGetInfoMSFT
XrSceneObjectTypesFilterInfoMSFT :: struct {
    type:            XrStructureType;
    next:            *void;
    objectTypeCount: u32;
    objectTypes:     *XrSceneObjectTypeMSFT;
}
#run {
    instance: XrSceneObjectTypesFilterInfoMSFT;
    assert(((cast(*void)(*instance.type)) - cast(*void)(*instance)) == 0, "XrSceneObjectTypesFilterInfoMSFT.type has unexpected offset % instead of 0", ((cast(*void)(*instance.type)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrSceneObjectTypesFilterInfoMSFT.type)) == 4, "XrSceneObjectTypesFilterInfoMSFT.type has unexpected size % instead of 4", size_of(type_of(XrSceneObjectTypesFilterInfoMSFT.type)));
    assert(((cast(*void)(*instance.next)) - cast(*void)(*instance)) == 8, "XrSceneObjectTypesFilterInfoMSFT.next has unexpected offset % instead of 8", ((cast(*void)(*instance.next)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrSceneObjectTypesFilterInfoMSFT.next)) == 8, "XrSceneObjectTypesFilterInfoMSFT.next has unexpected size % instead of 8", size_of(type_of(XrSceneObjectTypesFilterInfoMSFT.next)));
    assert(((cast(*void)(*instance.objectTypeCount)) - cast(*void)(*instance)) == 16, "XrSceneObjectTypesFilterInfoMSFT.objectTypeCount has unexpected offset % instead of 16", ((cast(*void)(*instance.objectTypeCount)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrSceneObjectTypesFilterInfoMSFT.objectTypeCount)) == 4, "XrSceneObjectTypesFilterInfoMSFT.objectTypeCount has unexpected size % instead of 4", size_of(type_of(XrSceneObjectTypesFilterInfoMSFT.objectTypeCount)));
    assert(((cast(*void)(*instance.objectTypes)) - cast(*void)(*instance)) == 24, "XrSceneObjectTypesFilterInfoMSFT.objectTypes has unexpected offset % instead of 24", ((cast(*void)(*instance.objectTypes)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrSceneObjectTypesFilterInfoMSFT.objectTypes)) == 8, "XrSceneObjectTypesFilterInfoMSFT.objectTypes has unexpected size % instead of 8", size_of(type_of(XrSceneObjectTypesFilterInfoMSFT.objectTypes)));
    assert(size_of(XrSceneObjectTypesFilterInfoMSFT) == 32, "XrSceneObjectTypesFilterInfoMSFT has size % instead of 32", size_of(XrSceneObjectTypesFilterInfoMSFT));
}

XrScenePlaneMSFT :: struct {
    alignment:             XrScenePlaneAlignmentTypeMSFT;
    size:                  XrExtent2Df;
    meshBufferId:          u64;
    supportsIndicesUint16: XrBool32;
}
#run {
    instance: XrScenePlaneMSFT;
    assert(((cast(*void)(*instance.alignment)) - cast(*void)(*instance)) == 0, "XrScenePlaneMSFT.alignment has unexpected offset % instead of 0", ((cast(*void)(*instance.alignment)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrScenePlaneMSFT.alignment)) == 4, "XrScenePlaneMSFT.alignment has unexpected size % instead of 4", size_of(type_of(XrScenePlaneMSFT.alignment)));
    assert(((cast(*void)(*instance.size)) - cast(*void)(*instance)) == 4, "XrScenePlaneMSFT.size has unexpected offset % instead of 4", ((cast(*void)(*instance.size)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrScenePlaneMSFT.size)) == 8, "XrScenePlaneMSFT.size has unexpected size % instead of 8", size_of(type_of(XrScenePlaneMSFT.size)));
    assert(((cast(*void)(*instance.meshBufferId)) - cast(*void)(*instance)) == 16, "XrScenePlaneMSFT.meshBufferId has unexpected offset % instead of 16", ((cast(*void)(*instance.meshBufferId)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrScenePlaneMSFT.meshBufferId)) == 8, "XrScenePlaneMSFT.meshBufferId has unexpected size % instead of 8", size_of(type_of(XrScenePlaneMSFT.meshBufferId)));
    assert(((cast(*void)(*instance.supportsIndicesUint16)) - cast(*void)(*instance)) == 24, "XrScenePlaneMSFT.supportsIndicesUint16 has unexpected offset % instead of 24", ((cast(*void)(*instance.supportsIndicesUint16)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrScenePlaneMSFT.supportsIndicesUint16)) == 4, "XrScenePlaneMSFT.supportsIndicesUint16 has unexpected size % instead of 4", size_of(type_of(XrScenePlaneMSFT.supportsIndicesUint16)));
    assert(size_of(XrScenePlaneMSFT) == 32, "XrScenePlaneMSFT has size % instead of 32", size_of(XrScenePlaneMSFT));
}

// XrScenePlanesMSFT extends XrSceneComponentsMSFT
XrScenePlanesMSFT :: struct {
    type:            XrStructureType;
    next:            *void;
    scenePlaneCount: u32;
    scenePlanes:     *XrScenePlaneMSFT;
}
#run {
    instance: XrScenePlanesMSFT;
    assert(((cast(*void)(*instance.type)) - cast(*void)(*instance)) == 0, "XrScenePlanesMSFT.type has unexpected offset % instead of 0", ((cast(*void)(*instance.type)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrScenePlanesMSFT.type)) == 4, "XrScenePlanesMSFT.type has unexpected size % instead of 4", size_of(type_of(XrScenePlanesMSFT.type)));
    assert(((cast(*void)(*instance.next)) - cast(*void)(*instance)) == 8, "XrScenePlanesMSFT.next has unexpected offset % instead of 8", ((cast(*void)(*instance.next)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrScenePlanesMSFT.next)) == 8, "XrScenePlanesMSFT.next has unexpected size % instead of 8", size_of(type_of(XrScenePlanesMSFT.next)));
    assert(((cast(*void)(*instance.scenePlaneCount)) - cast(*void)(*instance)) == 16, "XrScenePlanesMSFT.scenePlaneCount has unexpected offset % instead of 16", ((cast(*void)(*instance.scenePlaneCount)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrScenePlanesMSFT.scenePlaneCount)) == 4, "XrScenePlanesMSFT.scenePlaneCount has unexpected size % instead of 4", size_of(type_of(XrScenePlanesMSFT.scenePlaneCount)));
    assert(((cast(*void)(*instance.scenePlanes)) - cast(*void)(*instance)) == 24, "XrScenePlanesMSFT.scenePlanes has unexpected offset % instead of 24", ((cast(*void)(*instance.scenePlanes)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrScenePlanesMSFT.scenePlanes)) == 8, "XrScenePlanesMSFT.scenePlanes has unexpected size % instead of 8", size_of(type_of(XrScenePlanesMSFT.scenePlanes)));
    assert(size_of(XrScenePlanesMSFT) == 32, "XrScenePlanesMSFT has size % instead of 32", size_of(XrScenePlanesMSFT));
}

// XrScenePlaneAlignmentFilterInfoMSFT extends XrSceneComponentsGetInfoMSFT
XrScenePlaneAlignmentFilterInfoMSFT :: struct {
    type:           XrStructureType;
    next:           *void;
    alignmentCount: u32;
    alignments:     *XrScenePlaneAlignmentTypeMSFT;
}
#run {
    instance: XrScenePlaneAlignmentFilterInfoMSFT;
    assert(((cast(*void)(*instance.type)) - cast(*void)(*instance)) == 0, "XrScenePlaneAlignmentFilterInfoMSFT.type has unexpected offset % instead of 0", ((cast(*void)(*instance.type)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrScenePlaneAlignmentFilterInfoMSFT.type)) == 4, "XrScenePlaneAlignmentFilterInfoMSFT.type has unexpected size % instead of 4", size_of(type_of(XrScenePlaneAlignmentFilterInfoMSFT.type)));
    assert(((cast(*void)(*instance.next)) - cast(*void)(*instance)) == 8, "XrScenePlaneAlignmentFilterInfoMSFT.next has unexpected offset % instead of 8", ((cast(*void)(*instance.next)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrScenePlaneAlignmentFilterInfoMSFT.next)) == 8, "XrScenePlaneAlignmentFilterInfoMSFT.next has unexpected size % instead of 8", size_of(type_of(XrScenePlaneAlignmentFilterInfoMSFT.next)));
    assert(((cast(*void)(*instance.alignmentCount)) - cast(*void)(*instance)) == 16, "XrScenePlaneAlignmentFilterInfoMSFT.alignmentCount has unexpected offset % instead of 16", ((cast(*void)(*instance.alignmentCount)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrScenePlaneAlignmentFilterInfoMSFT.alignmentCount)) == 4, "XrScenePlaneAlignmentFilterInfoMSFT.alignmentCount has unexpected size % instead of 4", size_of(type_of(XrScenePlaneAlignmentFilterInfoMSFT.alignmentCount)));
    assert(((cast(*void)(*instance.alignments)) - cast(*void)(*instance)) == 24, "XrScenePlaneAlignmentFilterInfoMSFT.alignments has unexpected offset % instead of 24", ((cast(*void)(*instance.alignments)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrScenePlaneAlignmentFilterInfoMSFT.alignments)) == 8, "XrScenePlaneAlignmentFilterInfoMSFT.alignments has unexpected size % instead of 8", size_of(type_of(XrScenePlaneAlignmentFilterInfoMSFT.alignments)));
    assert(size_of(XrScenePlaneAlignmentFilterInfoMSFT) == 32, "XrScenePlaneAlignmentFilterInfoMSFT has size % instead of 32", size_of(XrScenePlaneAlignmentFilterInfoMSFT));
}

XrSceneMeshMSFT :: struct {
    meshBufferId:          u64;
    supportsIndicesUint16: XrBool32;
}
#run {
    instance: XrSceneMeshMSFT;
    assert(((cast(*void)(*instance.meshBufferId)) - cast(*void)(*instance)) == 0, "XrSceneMeshMSFT.meshBufferId has unexpected offset % instead of 0", ((cast(*void)(*instance.meshBufferId)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrSceneMeshMSFT.meshBufferId)) == 8, "XrSceneMeshMSFT.meshBufferId has unexpected size % instead of 8", size_of(type_of(XrSceneMeshMSFT.meshBufferId)));
    assert(((cast(*void)(*instance.supportsIndicesUint16)) - cast(*void)(*instance)) == 8, "XrSceneMeshMSFT.supportsIndicesUint16 has unexpected offset % instead of 8", ((cast(*void)(*instance.supportsIndicesUint16)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrSceneMeshMSFT.supportsIndicesUint16)) == 4, "XrSceneMeshMSFT.supportsIndicesUint16 has unexpected size % instead of 4", size_of(type_of(XrSceneMeshMSFT.supportsIndicesUint16)));
    assert(size_of(XrSceneMeshMSFT) == 16, "XrSceneMeshMSFT has size % instead of 16", size_of(XrSceneMeshMSFT));
}

// XrSceneMeshesMSFT extends XrSceneComponentsMSFT
XrSceneMeshesMSFT :: struct {
    type:           XrStructureType;
    next:           *void;
    sceneMeshCount: u32;
    sceneMeshes:    *XrSceneMeshMSFT;
}
#run {
    instance: XrSceneMeshesMSFT;
    assert(((cast(*void)(*instance.type)) - cast(*void)(*instance)) == 0, "XrSceneMeshesMSFT.type has unexpected offset % instead of 0", ((cast(*void)(*instance.type)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrSceneMeshesMSFT.type)) == 4, "XrSceneMeshesMSFT.type has unexpected size % instead of 4", size_of(type_of(XrSceneMeshesMSFT.type)));
    assert(((cast(*void)(*instance.next)) - cast(*void)(*instance)) == 8, "XrSceneMeshesMSFT.next has unexpected offset % instead of 8", ((cast(*void)(*instance.next)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrSceneMeshesMSFT.next)) == 8, "XrSceneMeshesMSFT.next has unexpected size % instead of 8", size_of(type_of(XrSceneMeshesMSFT.next)));
    assert(((cast(*void)(*instance.sceneMeshCount)) - cast(*void)(*instance)) == 16, "XrSceneMeshesMSFT.sceneMeshCount has unexpected offset % instead of 16", ((cast(*void)(*instance.sceneMeshCount)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrSceneMeshesMSFT.sceneMeshCount)) == 4, "XrSceneMeshesMSFT.sceneMeshCount has unexpected size % instead of 4", size_of(type_of(XrSceneMeshesMSFT.sceneMeshCount)));
    assert(((cast(*void)(*instance.sceneMeshes)) - cast(*void)(*instance)) == 24, "XrSceneMeshesMSFT.sceneMeshes has unexpected offset % instead of 24", ((cast(*void)(*instance.sceneMeshes)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrSceneMeshesMSFT.sceneMeshes)) == 8, "XrSceneMeshesMSFT.sceneMeshes has unexpected size % instead of 8", size_of(type_of(XrSceneMeshesMSFT.sceneMeshes)));
    assert(size_of(XrSceneMeshesMSFT) == 32, "XrSceneMeshesMSFT has size % instead of 32", size_of(XrSceneMeshesMSFT));
}

XrSceneMeshBuffersGetInfoMSFT :: struct {
    type:         XrStructureType;
    next:         *void;
    meshBufferId: u64;
}
#run {
    instance: XrSceneMeshBuffersGetInfoMSFT;
    assert(((cast(*void)(*instance.type)) - cast(*void)(*instance)) == 0, "XrSceneMeshBuffersGetInfoMSFT.type has unexpected offset % instead of 0", ((cast(*void)(*instance.type)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrSceneMeshBuffersGetInfoMSFT.type)) == 4, "XrSceneMeshBuffersGetInfoMSFT.type has unexpected size % instead of 4", size_of(type_of(XrSceneMeshBuffersGetInfoMSFT.type)));
    assert(((cast(*void)(*instance.next)) - cast(*void)(*instance)) == 8, "XrSceneMeshBuffersGetInfoMSFT.next has unexpected offset % instead of 8", ((cast(*void)(*instance.next)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrSceneMeshBuffersGetInfoMSFT.next)) == 8, "XrSceneMeshBuffersGetInfoMSFT.next has unexpected size % instead of 8", size_of(type_of(XrSceneMeshBuffersGetInfoMSFT.next)));
    assert(((cast(*void)(*instance.meshBufferId)) - cast(*void)(*instance)) == 16, "XrSceneMeshBuffersGetInfoMSFT.meshBufferId has unexpected offset % instead of 16", ((cast(*void)(*instance.meshBufferId)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrSceneMeshBuffersGetInfoMSFT.meshBufferId)) == 8, "XrSceneMeshBuffersGetInfoMSFT.meshBufferId has unexpected size % instead of 8", size_of(type_of(XrSceneMeshBuffersGetInfoMSFT.meshBufferId)));
    assert(size_of(XrSceneMeshBuffersGetInfoMSFT) == 24, "XrSceneMeshBuffersGetInfoMSFT has size % instead of 24", size_of(XrSceneMeshBuffersGetInfoMSFT));
}

XrSceneMeshBuffersMSFT :: struct {
    type: XrStructureType;
    next: *void;
}
#run {
    instance: XrSceneMeshBuffersMSFT;
    assert(((cast(*void)(*instance.type)) - cast(*void)(*instance)) == 0, "XrSceneMeshBuffersMSFT.type has unexpected offset % instead of 0", ((cast(*void)(*instance.type)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrSceneMeshBuffersMSFT.type)) == 4, "XrSceneMeshBuffersMSFT.type has unexpected size % instead of 4", size_of(type_of(XrSceneMeshBuffersMSFT.type)));
    assert(((cast(*void)(*instance.next)) - cast(*void)(*instance)) == 8, "XrSceneMeshBuffersMSFT.next has unexpected offset % instead of 8", ((cast(*void)(*instance.next)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrSceneMeshBuffersMSFT.next)) == 8, "XrSceneMeshBuffersMSFT.next has unexpected size % instead of 8", size_of(type_of(XrSceneMeshBuffersMSFT.next)));
    assert(size_of(XrSceneMeshBuffersMSFT) == 16, "XrSceneMeshBuffersMSFT has size % instead of 16", size_of(XrSceneMeshBuffersMSFT));
}

XrSceneMeshVertexBufferMSFT :: struct {
    type:                XrStructureType;
    next:                *void;
    vertexCapacityInput: u32;
    vertexCountOutput:   u32;
    vertices:            *XrVector3f;
}
#run {
    instance: XrSceneMeshVertexBufferMSFT;
    assert(((cast(*void)(*instance.type)) - cast(*void)(*instance)) == 0, "XrSceneMeshVertexBufferMSFT.type has unexpected offset % instead of 0", ((cast(*void)(*instance.type)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrSceneMeshVertexBufferMSFT.type)) == 4, "XrSceneMeshVertexBufferMSFT.type has unexpected size % instead of 4", size_of(type_of(XrSceneMeshVertexBufferMSFT.type)));
    assert(((cast(*void)(*instance.next)) - cast(*void)(*instance)) == 8, "XrSceneMeshVertexBufferMSFT.next has unexpected offset % instead of 8", ((cast(*void)(*instance.next)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrSceneMeshVertexBufferMSFT.next)) == 8, "XrSceneMeshVertexBufferMSFT.next has unexpected size % instead of 8", size_of(type_of(XrSceneMeshVertexBufferMSFT.next)));
    assert(((cast(*void)(*instance.vertexCapacityInput)) - cast(*void)(*instance)) == 16, "XrSceneMeshVertexBufferMSFT.vertexCapacityInput has unexpected offset % instead of 16", ((cast(*void)(*instance.vertexCapacityInput)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrSceneMeshVertexBufferMSFT.vertexCapacityInput)) == 4, "XrSceneMeshVertexBufferMSFT.vertexCapacityInput has unexpected size % instead of 4", size_of(type_of(XrSceneMeshVertexBufferMSFT.vertexCapacityInput)));
    assert(((cast(*void)(*instance.vertexCountOutput)) - cast(*void)(*instance)) == 20, "XrSceneMeshVertexBufferMSFT.vertexCountOutput has unexpected offset % instead of 20", ((cast(*void)(*instance.vertexCountOutput)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrSceneMeshVertexBufferMSFT.vertexCountOutput)) == 4, "XrSceneMeshVertexBufferMSFT.vertexCountOutput has unexpected size % instead of 4", size_of(type_of(XrSceneMeshVertexBufferMSFT.vertexCountOutput)));
    assert(((cast(*void)(*instance.vertices)) - cast(*void)(*instance)) == 24, "XrSceneMeshVertexBufferMSFT.vertices has unexpected offset % instead of 24", ((cast(*void)(*instance.vertices)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrSceneMeshVertexBufferMSFT.vertices)) == 8, "XrSceneMeshVertexBufferMSFT.vertices has unexpected size % instead of 8", size_of(type_of(XrSceneMeshVertexBufferMSFT.vertices)));
    assert(size_of(XrSceneMeshVertexBufferMSFT) == 32, "XrSceneMeshVertexBufferMSFT has size % instead of 32", size_of(XrSceneMeshVertexBufferMSFT));
}

XrSceneMeshIndicesUint32MSFT :: struct {
    type:               XrStructureType;
    next:               *void;
    indexCapacityInput: u32;
    indexCountOutput:   u32;
    indices:            *u32;
}
#run {
    instance: XrSceneMeshIndicesUint32MSFT;
    assert(((cast(*void)(*instance.type)) - cast(*void)(*instance)) == 0, "XrSceneMeshIndicesUint32MSFT.type has unexpected offset % instead of 0", ((cast(*void)(*instance.type)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrSceneMeshIndicesUint32MSFT.type)) == 4, "XrSceneMeshIndicesUint32MSFT.type has unexpected size % instead of 4", size_of(type_of(XrSceneMeshIndicesUint32MSFT.type)));
    assert(((cast(*void)(*instance.next)) - cast(*void)(*instance)) == 8, "XrSceneMeshIndicesUint32MSFT.next has unexpected offset % instead of 8", ((cast(*void)(*instance.next)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrSceneMeshIndicesUint32MSFT.next)) == 8, "XrSceneMeshIndicesUint32MSFT.next has unexpected size % instead of 8", size_of(type_of(XrSceneMeshIndicesUint32MSFT.next)));
    assert(((cast(*void)(*instance.indexCapacityInput)) - cast(*void)(*instance)) == 16, "XrSceneMeshIndicesUint32MSFT.indexCapacityInput has unexpected offset % instead of 16", ((cast(*void)(*instance.indexCapacityInput)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrSceneMeshIndicesUint32MSFT.indexCapacityInput)) == 4, "XrSceneMeshIndicesUint32MSFT.indexCapacityInput has unexpected size % instead of 4", size_of(type_of(XrSceneMeshIndicesUint32MSFT.indexCapacityInput)));
    assert(((cast(*void)(*instance.indexCountOutput)) - cast(*void)(*instance)) == 20, "XrSceneMeshIndicesUint32MSFT.indexCountOutput has unexpected offset % instead of 20", ((cast(*void)(*instance.indexCountOutput)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrSceneMeshIndicesUint32MSFT.indexCountOutput)) == 4, "XrSceneMeshIndicesUint32MSFT.indexCountOutput has unexpected size % instead of 4", size_of(type_of(XrSceneMeshIndicesUint32MSFT.indexCountOutput)));
    assert(((cast(*void)(*instance.indices)) - cast(*void)(*instance)) == 24, "XrSceneMeshIndicesUint32MSFT.indices has unexpected offset % instead of 24", ((cast(*void)(*instance.indices)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrSceneMeshIndicesUint32MSFT.indices)) == 8, "XrSceneMeshIndicesUint32MSFT.indices has unexpected size % instead of 8", size_of(type_of(XrSceneMeshIndicesUint32MSFT.indices)));
    assert(size_of(XrSceneMeshIndicesUint32MSFT) == 32, "XrSceneMeshIndicesUint32MSFT has size % instead of 32", size_of(XrSceneMeshIndicesUint32MSFT));
}

XrSceneMeshIndicesUint16MSFT :: struct {
    type:               XrStructureType;
    next:               *void;
    indexCapacityInput: u32;
    indexCountOutput:   u32;
    indices:            *u16;
}
#run {
    instance: XrSceneMeshIndicesUint16MSFT;
    assert(((cast(*void)(*instance.type)) - cast(*void)(*instance)) == 0, "XrSceneMeshIndicesUint16MSFT.type has unexpected offset % instead of 0", ((cast(*void)(*instance.type)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrSceneMeshIndicesUint16MSFT.type)) == 4, "XrSceneMeshIndicesUint16MSFT.type has unexpected size % instead of 4", size_of(type_of(XrSceneMeshIndicesUint16MSFT.type)));
    assert(((cast(*void)(*instance.next)) - cast(*void)(*instance)) == 8, "XrSceneMeshIndicesUint16MSFT.next has unexpected offset % instead of 8", ((cast(*void)(*instance.next)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrSceneMeshIndicesUint16MSFT.next)) == 8, "XrSceneMeshIndicesUint16MSFT.next has unexpected size % instead of 8", size_of(type_of(XrSceneMeshIndicesUint16MSFT.next)));
    assert(((cast(*void)(*instance.indexCapacityInput)) - cast(*void)(*instance)) == 16, "XrSceneMeshIndicesUint16MSFT.indexCapacityInput has unexpected offset % instead of 16", ((cast(*void)(*instance.indexCapacityInput)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrSceneMeshIndicesUint16MSFT.indexCapacityInput)) == 4, "XrSceneMeshIndicesUint16MSFT.indexCapacityInput has unexpected size % instead of 4", size_of(type_of(XrSceneMeshIndicesUint16MSFT.indexCapacityInput)));
    assert(((cast(*void)(*instance.indexCountOutput)) - cast(*void)(*instance)) == 20, "XrSceneMeshIndicesUint16MSFT.indexCountOutput has unexpected offset % instead of 20", ((cast(*void)(*instance.indexCountOutput)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrSceneMeshIndicesUint16MSFT.indexCountOutput)) == 4, "XrSceneMeshIndicesUint16MSFT.indexCountOutput has unexpected size % instead of 4", size_of(type_of(XrSceneMeshIndicesUint16MSFT.indexCountOutput)));
    assert(((cast(*void)(*instance.indices)) - cast(*void)(*instance)) == 24, "XrSceneMeshIndicesUint16MSFT.indices has unexpected offset % instead of 24", ((cast(*void)(*instance.indices)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrSceneMeshIndicesUint16MSFT.indices)) == 8, "XrSceneMeshIndicesUint16MSFT.indices has unexpected size % instead of 8", size_of(type_of(XrSceneMeshIndicesUint16MSFT.indices)));
    assert(size_of(XrSceneMeshIndicesUint16MSFT) == 32, "XrSceneMeshIndicesUint16MSFT has size % instead of 32", size_of(XrSceneMeshIndicesUint16MSFT));
}

PFN_xrEnumerateSceneComputeFeaturesMSFT :: #type (a0: XrInstance, a1: XrSystemId, a2: u32, a3: *u32, a4: *XrSceneComputeFeatureMSFT) -> XrResult #c_call;
PFN_xrCreateSceneObserverMSFT :: #type (a0: XrSession, a1: *XrSceneObserverCreateInfoMSFT, a2: *XrSceneObserverMSFT) -> XrResult #c_call;
PFN_xrDestroySceneObserverMSFT :: #type (a0: XrSceneObserverMSFT) -> XrResult #c_call;
PFN_xrCreateSceneMSFT :: #type (a0: XrSceneObserverMSFT, a1: *XrSceneCreateInfoMSFT, a2: *XrSceneMSFT) -> XrResult #c_call;
PFN_xrDestroySceneMSFT :: #type (a0: XrSceneMSFT) -> XrResult #c_call;
PFN_xrComputeNewSceneMSFT :: #type (a0: XrSceneObserverMSFT, a1: *XrNewSceneComputeInfoMSFT) -> XrResult #c_call;
PFN_xrGetSceneComputeStateMSFT :: #type (a0: XrSceneObserverMSFT, a1: *XrSceneComputeStateMSFT) -> XrResult #c_call;
PFN_xrGetSceneComponentsMSFT :: #type (a0: XrSceneMSFT, a1: *XrSceneComponentsGetInfoMSFT, a2: *XrSceneComponentsMSFT) -> XrResult #c_call;
PFN_xrLocateSceneComponentsMSFT :: #type (a0: XrSceneMSFT, a1: *XrSceneComponentsLocateInfoMSFT, a2: *XrSceneComponentLocationsMSFT) -> XrResult #c_call;
PFN_xrGetSceneMeshBuffersMSFT :: #type (a0: XrSceneMSFT, a1: *XrSceneMeshBuffersGetInfoMSFT, a2: *XrSceneMeshBuffersMSFT) -> XrResult #c_call;

XrSerializedSceneFragmentDataGetInfoMSFT :: struct {
    type:            XrStructureType;
    next:            *void;
    sceneFragmentId: XrUuidMSFT;
}
#run {
    instance: XrSerializedSceneFragmentDataGetInfoMSFT;
    assert(((cast(*void)(*instance.type)) - cast(*void)(*instance)) == 0, "XrSerializedSceneFragmentDataGetInfoMSFT.type has unexpected offset % instead of 0", ((cast(*void)(*instance.type)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrSerializedSceneFragmentDataGetInfoMSFT.type)) == 4, "XrSerializedSceneFragmentDataGetInfoMSFT.type has unexpected size % instead of 4", size_of(type_of(XrSerializedSceneFragmentDataGetInfoMSFT.type)));
    assert(((cast(*void)(*instance.next)) - cast(*void)(*instance)) == 8, "XrSerializedSceneFragmentDataGetInfoMSFT.next has unexpected offset % instead of 8", ((cast(*void)(*instance.next)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrSerializedSceneFragmentDataGetInfoMSFT.next)) == 8, "XrSerializedSceneFragmentDataGetInfoMSFT.next has unexpected size % instead of 8", size_of(type_of(XrSerializedSceneFragmentDataGetInfoMSFT.next)));
    assert(((cast(*void)(*instance.sceneFragmentId)) - cast(*void)(*instance)) == 16, "XrSerializedSceneFragmentDataGetInfoMSFT.sceneFragmentId has unexpected offset % instead of 16", ((cast(*void)(*instance.sceneFragmentId)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrSerializedSceneFragmentDataGetInfoMSFT.sceneFragmentId)) == 16, "XrSerializedSceneFragmentDataGetInfoMSFT.sceneFragmentId has unexpected size % instead of 16", size_of(type_of(XrSerializedSceneFragmentDataGetInfoMSFT.sceneFragmentId)));
    assert(size_of(XrSerializedSceneFragmentDataGetInfoMSFT) == 32, "XrSerializedSceneFragmentDataGetInfoMSFT has size % instead of 32", size_of(XrSerializedSceneFragmentDataGetInfoMSFT));
}

XrDeserializeSceneFragmentMSFT :: struct {
    bufferSize: u32;
    buffer:     *u8;
}
#run {
    instance: XrDeserializeSceneFragmentMSFT;
    assert(((cast(*void)(*instance.bufferSize)) - cast(*void)(*instance)) == 0, "XrDeserializeSceneFragmentMSFT.bufferSize has unexpected offset % instead of 0", ((cast(*void)(*instance.bufferSize)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrDeserializeSceneFragmentMSFT.bufferSize)) == 4, "XrDeserializeSceneFragmentMSFT.bufferSize has unexpected size % instead of 4", size_of(type_of(XrDeserializeSceneFragmentMSFT.bufferSize)));
    assert(((cast(*void)(*instance.buffer)) - cast(*void)(*instance)) == 8, "XrDeserializeSceneFragmentMSFT.buffer has unexpected offset % instead of 8", ((cast(*void)(*instance.buffer)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrDeserializeSceneFragmentMSFT.buffer)) == 8, "XrDeserializeSceneFragmentMSFT.buffer has unexpected size % instead of 8", size_of(type_of(XrDeserializeSceneFragmentMSFT.buffer)));
    assert(size_of(XrDeserializeSceneFragmentMSFT) == 16, "XrDeserializeSceneFragmentMSFT has size % instead of 16", size_of(XrDeserializeSceneFragmentMSFT));
}

XrSceneDeserializeInfoMSFT :: struct {
    type:          XrStructureType;
    next:          *void;
    fragmentCount: u32;
    fragments:     *XrDeserializeSceneFragmentMSFT;
}
#run {
    instance: XrSceneDeserializeInfoMSFT;
    assert(((cast(*void)(*instance.type)) - cast(*void)(*instance)) == 0, "XrSceneDeserializeInfoMSFT.type has unexpected offset % instead of 0", ((cast(*void)(*instance.type)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrSceneDeserializeInfoMSFT.type)) == 4, "XrSceneDeserializeInfoMSFT.type has unexpected size % instead of 4", size_of(type_of(XrSceneDeserializeInfoMSFT.type)));
    assert(((cast(*void)(*instance.next)) - cast(*void)(*instance)) == 8, "XrSceneDeserializeInfoMSFT.next has unexpected offset % instead of 8", ((cast(*void)(*instance.next)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrSceneDeserializeInfoMSFT.next)) == 8, "XrSceneDeserializeInfoMSFT.next has unexpected size % instead of 8", size_of(type_of(XrSceneDeserializeInfoMSFT.next)));
    assert(((cast(*void)(*instance.fragmentCount)) - cast(*void)(*instance)) == 16, "XrSceneDeserializeInfoMSFT.fragmentCount has unexpected offset % instead of 16", ((cast(*void)(*instance.fragmentCount)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrSceneDeserializeInfoMSFT.fragmentCount)) == 4, "XrSceneDeserializeInfoMSFT.fragmentCount has unexpected size % instead of 4", size_of(type_of(XrSceneDeserializeInfoMSFT.fragmentCount)));
    assert(((cast(*void)(*instance.fragments)) - cast(*void)(*instance)) == 24, "XrSceneDeserializeInfoMSFT.fragments has unexpected offset % instead of 24", ((cast(*void)(*instance.fragments)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrSceneDeserializeInfoMSFT.fragments)) == 8, "XrSceneDeserializeInfoMSFT.fragments has unexpected size % instead of 8", size_of(type_of(XrSceneDeserializeInfoMSFT.fragments)));
    assert(size_of(XrSceneDeserializeInfoMSFT) == 32, "XrSceneDeserializeInfoMSFT has size % instead of 32", size_of(XrSceneDeserializeInfoMSFT));
}

PFN_xrDeserializeSceneMSFT :: #type (a0: XrSceneObserverMSFT, a1: *XrSceneDeserializeInfoMSFT) -> XrResult #c_call;
PFN_xrGetSerializedSceneFragmentDataMSFT :: #type (a0: XrSceneMSFT, a1: *XrSerializedSceneFragmentDataGetInfoMSFT, a2: u32, a3: *u32, a4: *u8) -> XrResult #c_call;

XrEventDataDisplayRefreshRateChangedFB :: struct {
    type:                   XrStructureType;
    next:                   *void;
    fromDisplayRefreshRate: float;
    toDisplayRefreshRate:   float;
}
#run {
    instance: XrEventDataDisplayRefreshRateChangedFB;
    assert(((cast(*void)(*instance.type)) - cast(*void)(*instance)) == 0, "XrEventDataDisplayRefreshRateChangedFB.type has unexpected offset % instead of 0", ((cast(*void)(*instance.type)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrEventDataDisplayRefreshRateChangedFB.type)) == 4, "XrEventDataDisplayRefreshRateChangedFB.type has unexpected size % instead of 4", size_of(type_of(XrEventDataDisplayRefreshRateChangedFB.type)));
    assert(((cast(*void)(*instance.next)) - cast(*void)(*instance)) == 8, "XrEventDataDisplayRefreshRateChangedFB.next has unexpected offset % instead of 8", ((cast(*void)(*instance.next)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrEventDataDisplayRefreshRateChangedFB.next)) == 8, "XrEventDataDisplayRefreshRateChangedFB.next has unexpected size % instead of 8", size_of(type_of(XrEventDataDisplayRefreshRateChangedFB.next)));
    assert(((cast(*void)(*instance.fromDisplayRefreshRate)) - cast(*void)(*instance)) == 16, "XrEventDataDisplayRefreshRateChangedFB.fromDisplayRefreshRate has unexpected offset % instead of 16", ((cast(*void)(*instance.fromDisplayRefreshRate)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrEventDataDisplayRefreshRateChangedFB.fromDisplayRefreshRate)) == 4, "XrEventDataDisplayRefreshRateChangedFB.fromDisplayRefreshRate has unexpected size % instead of 4", size_of(type_of(XrEventDataDisplayRefreshRateChangedFB.fromDisplayRefreshRate)));
    assert(((cast(*void)(*instance.toDisplayRefreshRate)) - cast(*void)(*instance)) == 20, "XrEventDataDisplayRefreshRateChangedFB.toDisplayRefreshRate has unexpected offset % instead of 20", ((cast(*void)(*instance.toDisplayRefreshRate)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrEventDataDisplayRefreshRateChangedFB.toDisplayRefreshRate)) == 4, "XrEventDataDisplayRefreshRateChangedFB.toDisplayRefreshRate has unexpected size % instead of 4", size_of(type_of(XrEventDataDisplayRefreshRateChangedFB.toDisplayRefreshRate)));
    assert(size_of(XrEventDataDisplayRefreshRateChangedFB) == 24, "XrEventDataDisplayRefreshRateChangedFB has size % instead of 24", size_of(XrEventDataDisplayRefreshRateChangedFB));
}

PFN_xrEnumerateDisplayRefreshRatesFB :: #type (a0: XrSession, a1: u32, a2: *u32, a3: *float) -> XrResult #c_call;
PFN_xrGetDisplayRefreshRateFB :: #type (a0: XrSession, a1: *float) -> XrResult #c_call;
PFN_xrRequestDisplayRefreshRateFB :: #type (a0: XrSession, a1: float) -> XrResult #c_call;

XrViveTrackerPathsHTCX :: struct {
    type:           XrStructureType;
    next:           *void;
    persistentPath: XrPath;
    rolePath:       XrPath;
}
#run {
    instance: XrViveTrackerPathsHTCX;
    assert(((cast(*void)(*instance.type)) - cast(*void)(*instance)) == 0, "XrViveTrackerPathsHTCX.type has unexpected offset % instead of 0", ((cast(*void)(*instance.type)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrViveTrackerPathsHTCX.type)) == 4, "XrViveTrackerPathsHTCX.type has unexpected size % instead of 4", size_of(type_of(XrViveTrackerPathsHTCX.type)));
    assert(((cast(*void)(*instance.next)) - cast(*void)(*instance)) == 8, "XrViveTrackerPathsHTCX.next has unexpected offset % instead of 8", ((cast(*void)(*instance.next)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrViveTrackerPathsHTCX.next)) == 8, "XrViveTrackerPathsHTCX.next has unexpected size % instead of 8", size_of(type_of(XrViveTrackerPathsHTCX.next)));
    assert(((cast(*void)(*instance.persistentPath)) - cast(*void)(*instance)) == 16, "XrViveTrackerPathsHTCX.persistentPath has unexpected offset % instead of 16", ((cast(*void)(*instance.persistentPath)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrViveTrackerPathsHTCX.persistentPath)) == 8, "XrViveTrackerPathsHTCX.persistentPath has unexpected size % instead of 8", size_of(type_of(XrViveTrackerPathsHTCX.persistentPath)));
    assert(((cast(*void)(*instance.rolePath)) - cast(*void)(*instance)) == 24, "XrViveTrackerPathsHTCX.rolePath has unexpected offset % instead of 24", ((cast(*void)(*instance.rolePath)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrViveTrackerPathsHTCX.rolePath)) == 8, "XrViveTrackerPathsHTCX.rolePath has unexpected size % instead of 8", size_of(type_of(XrViveTrackerPathsHTCX.rolePath)));
    assert(size_of(XrViveTrackerPathsHTCX) == 32, "XrViveTrackerPathsHTCX has size % instead of 32", size_of(XrViveTrackerPathsHTCX));
}

XrEventDataViveTrackerConnectedHTCX :: struct {
    type:  XrStructureType;
    next:  *void;
    paths: *XrViveTrackerPathsHTCX;
}
#run {
    instance: XrEventDataViveTrackerConnectedHTCX;
    assert(((cast(*void)(*instance.type)) - cast(*void)(*instance)) == 0, "XrEventDataViveTrackerConnectedHTCX.type has unexpected offset % instead of 0", ((cast(*void)(*instance.type)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrEventDataViveTrackerConnectedHTCX.type)) == 4, "XrEventDataViveTrackerConnectedHTCX.type has unexpected size % instead of 4", size_of(type_of(XrEventDataViveTrackerConnectedHTCX.type)));
    assert(((cast(*void)(*instance.next)) - cast(*void)(*instance)) == 8, "XrEventDataViveTrackerConnectedHTCX.next has unexpected offset % instead of 8", ((cast(*void)(*instance.next)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrEventDataViveTrackerConnectedHTCX.next)) == 8, "XrEventDataViveTrackerConnectedHTCX.next has unexpected size % instead of 8", size_of(type_of(XrEventDataViveTrackerConnectedHTCX.next)));
    assert(((cast(*void)(*instance.paths)) - cast(*void)(*instance)) == 16, "XrEventDataViveTrackerConnectedHTCX.paths has unexpected offset % instead of 16", ((cast(*void)(*instance.paths)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrEventDataViveTrackerConnectedHTCX.paths)) == 8, "XrEventDataViveTrackerConnectedHTCX.paths has unexpected size % instead of 8", size_of(type_of(XrEventDataViveTrackerConnectedHTCX.paths)));
    assert(size_of(XrEventDataViveTrackerConnectedHTCX) == 24, "XrEventDataViveTrackerConnectedHTCX has size % instead of 24", size_of(XrEventDataViveTrackerConnectedHTCX));
}

PFN_xrEnumerateViveTrackerPathsHTCX :: #type (a0: XrInstance, a1: u32, a2: *u32, a3: *XrViveTrackerPathsHTCX) -> XrResult #c_call;

XrFacialTrackerHTC_T :: struct {}
XrFacialTrackerHTC :: *XrFacialTrackerHTC_T;

XrEyeExpressionHTC :: enum s32 {
    LEFT_BLINK_HTC    :: 0;
    LEFT_WIDE_HTC     :: 1;
    RIGHT_BLINK_HTC   :: 2;
    RIGHT_WIDE_HTC    :: 3;
    LEFT_SQUEEZE_HTC  :: 4;
    RIGHT_SQUEEZE_HTC :: 5;
    LEFT_DOWN_HTC     :: 6;
    RIGHT_DOWN_HTC    :: 7;
    LEFT_OUT_HTC      :: 8;
    RIGHT_IN_HTC      :: 9;
    LEFT_IN_HTC       :: 10;
    RIGHT_OUT_HTC     :: 11;
    LEFT_UP_HTC       :: 12;
    RIGHT_UP_HTC      :: 13;
    MAX_ENUM_HTC      :: 2147483647;

    XR_EYE_EXPRESSION_LEFT_BLINK_HTC    :: LEFT_BLINK_HTC;
    XR_EYE_EXPRESSION_LEFT_WIDE_HTC     :: LEFT_WIDE_HTC;
    XR_EYE_EXPRESSION_RIGHT_BLINK_HTC   :: RIGHT_BLINK_HTC;
    XR_EYE_EXPRESSION_RIGHT_WIDE_HTC    :: RIGHT_WIDE_HTC;
    XR_EYE_EXPRESSION_LEFT_SQUEEZE_HTC  :: LEFT_SQUEEZE_HTC;
    XR_EYE_EXPRESSION_RIGHT_SQUEEZE_HTC :: RIGHT_SQUEEZE_HTC;
    XR_EYE_EXPRESSION_LEFT_DOWN_HTC     :: LEFT_DOWN_HTC;
    XR_EYE_EXPRESSION_RIGHT_DOWN_HTC    :: RIGHT_DOWN_HTC;
    XR_EYE_EXPRESSION_LEFT_OUT_HTC      :: LEFT_OUT_HTC;
    XR_EYE_EXPRESSION_RIGHT_IN_HTC      :: RIGHT_IN_HTC;
    XR_EYE_EXPRESSION_LEFT_IN_HTC       :: LEFT_IN_HTC;
    XR_EYE_EXPRESSION_RIGHT_OUT_HTC     :: RIGHT_OUT_HTC;
    XR_EYE_EXPRESSION_LEFT_UP_HTC       :: LEFT_UP_HTC;
    XR_EYE_EXPRESSION_RIGHT_UP_HTC      :: RIGHT_UP_HTC;
    XR_EYE_EXPRESSION_MAX_ENUM_HTC      :: MAX_ENUM_HTC;
}

XrLipExpressionHTC :: enum s32 {
    JAW_RIGHT_HTC              :: 0;
    JAW_LEFT_HTC               :: 1;
    JAW_FORWARD_HTC            :: 2;
    JAW_OPEN_HTC               :: 3;
    MOUTH_APE_SHAPE_HTC        :: 4;
    MOUTH_UPPER_RIGHT_HTC      :: 5;
    MOUTH_UPPER_LEFT_HTC       :: 6;
    MOUTH_LOWER_RIGHT_HTC      :: 7;
    MOUTH_LOWER_LEFT_HTC       :: 8;
    MOUTH_UPPER_OVERTURN_HTC   :: 9;
    MOUTH_LOWER_OVERTURN_HTC   :: 10;
    MOUTH_POUT_HTC             :: 11;
    MOUTH_SMILE_RIGHT_HTC      :: 12;
    MOUTH_SMILE_LEFT_HTC       :: 13;
    MOUTH_SAD_RIGHT_HTC        :: 14;
    MOUTH_SAD_LEFT_HTC         :: 15;
    CHEEK_PUFF_RIGHT_HTC       :: 16;
    CHEEK_PUFF_LEFT_HTC        :: 17;
    CHEEK_SUCK_HTC             :: 18;
    MOUTH_UPPER_UPRIGHT_HTC    :: 19;
    MOUTH_UPPER_UPLEFT_HTC     :: 20;
    MOUTH_LOWER_DOWNRIGHT_HTC  :: 21;
    MOUTH_LOWER_DOWNLEFT_HTC   :: 22;
    MOUTH_UPPER_INSIDE_HTC     :: 23;
    MOUTH_LOWER_INSIDE_HTC     :: 24;
    MOUTH_LOWER_OVERLAY_HTC    :: 25;
    TONGUE_LONGSTEP1_HTC       :: 26;
    TONGUE_LEFT_HTC            :: 27;
    TONGUE_RIGHT_HTC           :: 28;
    TONGUE_UP_HTC              :: 29;
    TONGUE_DOWN_HTC            :: 30;
    TONGUE_ROLL_HTC            :: 31;
    TONGUE_LONGSTEP2_HTC       :: 32;
    TONGUE_UPRIGHT_MORPH_HTC   :: 33;
    TONGUE_UPLEFT_MORPH_HTC    :: 34;
    TONGUE_DOWNRIGHT_MORPH_HTC :: 35;
    TONGUE_DOWNLEFT_MORPH_HTC  :: 36;
    MAX_ENUM_HTC               :: 2147483647;

    XR_LIP_EXPRESSION_JAW_RIGHT_HTC              :: JAW_RIGHT_HTC;
    XR_LIP_EXPRESSION_JAW_LEFT_HTC               :: JAW_LEFT_HTC;
    XR_LIP_EXPRESSION_JAW_FORWARD_HTC            :: JAW_FORWARD_HTC;
    XR_LIP_EXPRESSION_JAW_OPEN_HTC               :: JAW_OPEN_HTC;
    XR_LIP_EXPRESSION_MOUTH_APE_SHAPE_HTC        :: MOUTH_APE_SHAPE_HTC;
    XR_LIP_EXPRESSION_MOUTH_UPPER_RIGHT_HTC      :: MOUTH_UPPER_RIGHT_HTC;
    XR_LIP_EXPRESSION_MOUTH_UPPER_LEFT_HTC       :: MOUTH_UPPER_LEFT_HTC;
    XR_LIP_EXPRESSION_MOUTH_LOWER_RIGHT_HTC      :: MOUTH_LOWER_RIGHT_HTC;
    XR_LIP_EXPRESSION_MOUTH_LOWER_LEFT_HTC       :: MOUTH_LOWER_LEFT_HTC;
    XR_LIP_EXPRESSION_MOUTH_UPPER_OVERTURN_HTC   :: MOUTH_UPPER_OVERTURN_HTC;
    XR_LIP_EXPRESSION_MOUTH_LOWER_OVERTURN_HTC   :: MOUTH_LOWER_OVERTURN_HTC;
    XR_LIP_EXPRESSION_MOUTH_POUT_HTC             :: MOUTH_POUT_HTC;
    XR_LIP_EXPRESSION_MOUTH_SMILE_RIGHT_HTC      :: MOUTH_SMILE_RIGHT_HTC;
    XR_LIP_EXPRESSION_MOUTH_SMILE_LEFT_HTC       :: MOUTH_SMILE_LEFT_HTC;
    XR_LIP_EXPRESSION_MOUTH_SAD_RIGHT_HTC        :: MOUTH_SAD_RIGHT_HTC;
    XR_LIP_EXPRESSION_MOUTH_SAD_LEFT_HTC         :: MOUTH_SAD_LEFT_HTC;
    XR_LIP_EXPRESSION_CHEEK_PUFF_RIGHT_HTC       :: CHEEK_PUFF_RIGHT_HTC;
    XR_LIP_EXPRESSION_CHEEK_PUFF_LEFT_HTC        :: CHEEK_PUFF_LEFT_HTC;
    XR_LIP_EXPRESSION_CHEEK_SUCK_HTC             :: CHEEK_SUCK_HTC;
    XR_LIP_EXPRESSION_MOUTH_UPPER_UPRIGHT_HTC    :: MOUTH_UPPER_UPRIGHT_HTC;
    XR_LIP_EXPRESSION_MOUTH_UPPER_UPLEFT_HTC     :: MOUTH_UPPER_UPLEFT_HTC;
    XR_LIP_EXPRESSION_MOUTH_LOWER_DOWNRIGHT_HTC  :: MOUTH_LOWER_DOWNRIGHT_HTC;
    XR_LIP_EXPRESSION_MOUTH_LOWER_DOWNLEFT_HTC   :: MOUTH_LOWER_DOWNLEFT_HTC;
    XR_LIP_EXPRESSION_MOUTH_UPPER_INSIDE_HTC     :: MOUTH_UPPER_INSIDE_HTC;
    XR_LIP_EXPRESSION_MOUTH_LOWER_INSIDE_HTC     :: MOUTH_LOWER_INSIDE_HTC;
    XR_LIP_EXPRESSION_MOUTH_LOWER_OVERLAY_HTC    :: MOUTH_LOWER_OVERLAY_HTC;
    XR_LIP_EXPRESSION_TONGUE_LONGSTEP1_HTC       :: TONGUE_LONGSTEP1_HTC;
    XR_LIP_EXPRESSION_TONGUE_LEFT_HTC            :: TONGUE_LEFT_HTC;
    XR_LIP_EXPRESSION_TONGUE_RIGHT_HTC           :: TONGUE_RIGHT_HTC;
    XR_LIP_EXPRESSION_TONGUE_UP_HTC              :: TONGUE_UP_HTC;
    XR_LIP_EXPRESSION_TONGUE_DOWN_HTC            :: TONGUE_DOWN_HTC;
    XR_LIP_EXPRESSION_TONGUE_ROLL_HTC            :: TONGUE_ROLL_HTC;
    XR_LIP_EXPRESSION_TONGUE_LONGSTEP2_HTC       :: TONGUE_LONGSTEP2_HTC;
    XR_LIP_EXPRESSION_TONGUE_UPRIGHT_MORPH_HTC   :: TONGUE_UPRIGHT_MORPH_HTC;
    XR_LIP_EXPRESSION_TONGUE_UPLEFT_MORPH_HTC    :: TONGUE_UPLEFT_MORPH_HTC;
    XR_LIP_EXPRESSION_TONGUE_DOWNRIGHT_MORPH_HTC :: TONGUE_DOWNRIGHT_MORPH_HTC;
    XR_LIP_EXPRESSION_TONGUE_DOWNLEFT_MORPH_HTC  :: TONGUE_DOWNLEFT_MORPH_HTC;
    XR_LIP_EXPRESSION_MAX_ENUM_HTC               :: MAX_ENUM_HTC;
}

XrFacialTrackingTypeHTC :: enum s32 {
    EYE_DEFAULT_HTC :: 1;
    LIP_DEFAULT_HTC :: 2;
    MAX_ENUM_HTC    :: 2147483647;

    XR_FACIAL_TRACKING_TYPE_EYE_DEFAULT_HTC :: EYE_DEFAULT_HTC;
    XR_FACIAL_TRACKING_TYPE_LIP_DEFAULT_HTC :: LIP_DEFAULT_HTC;
    XR_FACIAL_TRACKING_TYPE_MAX_ENUM_HTC    :: MAX_ENUM_HTC;
}

// XrSystemFacialTrackingPropertiesHTC extends XrSystemProperties
XrSystemFacialTrackingPropertiesHTC :: struct {
    type:                     XrStructureType;
    next:                     *void;
    supportEyeFacialTracking: XrBool32;
    supportLipFacialTracking: XrBool32;
}
#run {
    instance: XrSystemFacialTrackingPropertiesHTC;
    assert(((cast(*void)(*instance.type)) - cast(*void)(*instance)) == 0, "XrSystemFacialTrackingPropertiesHTC.type has unexpected offset % instead of 0", ((cast(*void)(*instance.type)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrSystemFacialTrackingPropertiesHTC.type)) == 4, "XrSystemFacialTrackingPropertiesHTC.type has unexpected size % instead of 4", size_of(type_of(XrSystemFacialTrackingPropertiesHTC.type)));
    assert(((cast(*void)(*instance.next)) - cast(*void)(*instance)) == 8, "XrSystemFacialTrackingPropertiesHTC.next has unexpected offset % instead of 8", ((cast(*void)(*instance.next)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrSystemFacialTrackingPropertiesHTC.next)) == 8, "XrSystemFacialTrackingPropertiesHTC.next has unexpected size % instead of 8", size_of(type_of(XrSystemFacialTrackingPropertiesHTC.next)));
    assert(((cast(*void)(*instance.supportEyeFacialTracking)) - cast(*void)(*instance)) == 16, "XrSystemFacialTrackingPropertiesHTC.supportEyeFacialTracking has unexpected offset % instead of 16", ((cast(*void)(*instance.supportEyeFacialTracking)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrSystemFacialTrackingPropertiesHTC.supportEyeFacialTracking)) == 4, "XrSystemFacialTrackingPropertiesHTC.supportEyeFacialTracking has unexpected size % instead of 4", size_of(type_of(XrSystemFacialTrackingPropertiesHTC.supportEyeFacialTracking)));
    assert(((cast(*void)(*instance.supportLipFacialTracking)) - cast(*void)(*instance)) == 20, "XrSystemFacialTrackingPropertiesHTC.supportLipFacialTracking has unexpected offset % instead of 20", ((cast(*void)(*instance.supportLipFacialTracking)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrSystemFacialTrackingPropertiesHTC.supportLipFacialTracking)) == 4, "XrSystemFacialTrackingPropertiesHTC.supportLipFacialTracking has unexpected size % instead of 4", size_of(type_of(XrSystemFacialTrackingPropertiesHTC.supportLipFacialTracking)));
    assert(size_of(XrSystemFacialTrackingPropertiesHTC) == 24, "XrSystemFacialTrackingPropertiesHTC has size % instead of 24", size_of(XrSystemFacialTrackingPropertiesHTC));
}

XrFacialExpressionsHTC :: struct {
    type:                 XrStructureType;
    next:                 *void;
    isActive:             XrBool32;
    sampleTime:           XrTime;
    expressionCount:      u32;
    expressionWeightings: *float;
}
#run {
    instance: XrFacialExpressionsHTC;
    assert(((cast(*void)(*instance.type)) - cast(*void)(*instance)) == 0, "XrFacialExpressionsHTC.type has unexpected offset % instead of 0", ((cast(*void)(*instance.type)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrFacialExpressionsHTC.type)) == 4, "XrFacialExpressionsHTC.type has unexpected size % instead of 4", size_of(type_of(XrFacialExpressionsHTC.type)));
    assert(((cast(*void)(*instance.next)) - cast(*void)(*instance)) == 8, "XrFacialExpressionsHTC.next has unexpected offset % instead of 8", ((cast(*void)(*instance.next)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrFacialExpressionsHTC.next)) == 8, "XrFacialExpressionsHTC.next has unexpected size % instead of 8", size_of(type_of(XrFacialExpressionsHTC.next)));
    assert(((cast(*void)(*instance.isActive)) - cast(*void)(*instance)) == 16, "XrFacialExpressionsHTC.isActive has unexpected offset % instead of 16", ((cast(*void)(*instance.isActive)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrFacialExpressionsHTC.isActive)) == 4, "XrFacialExpressionsHTC.isActive has unexpected size % instead of 4", size_of(type_of(XrFacialExpressionsHTC.isActive)));
    assert(((cast(*void)(*instance.sampleTime)) - cast(*void)(*instance)) == 24, "XrFacialExpressionsHTC.sampleTime has unexpected offset % instead of 24", ((cast(*void)(*instance.sampleTime)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrFacialExpressionsHTC.sampleTime)) == 8, "XrFacialExpressionsHTC.sampleTime has unexpected size % instead of 8", size_of(type_of(XrFacialExpressionsHTC.sampleTime)));
    assert(((cast(*void)(*instance.expressionCount)) - cast(*void)(*instance)) == 32, "XrFacialExpressionsHTC.expressionCount has unexpected offset % instead of 32", ((cast(*void)(*instance.expressionCount)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrFacialExpressionsHTC.expressionCount)) == 4, "XrFacialExpressionsHTC.expressionCount has unexpected size % instead of 4", size_of(type_of(XrFacialExpressionsHTC.expressionCount)));
    assert(((cast(*void)(*instance.expressionWeightings)) - cast(*void)(*instance)) == 40, "XrFacialExpressionsHTC.expressionWeightings has unexpected offset % instead of 40", ((cast(*void)(*instance.expressionWeightings)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrFacialExpressionsHTC.expressionWeightings)) == 8, "XrFacialExpressionsHTC.expressionWeightings has unexpected size % instead of 8", size_of(type_of(XrFacialExpressionsHTC.expressionWeightings)));
    assert(size_of(XrFacialExpressionsHTC) == 48, "XrFacialExpressionsHTC has size % instead of 48", size_of(XrFacialExpressionsHTC));
}

XrFacialTrackerCreateInfoHTC :: struct {
    type:               XrStructureType;
    next:               *void;
    facialTrackingType: XrFacialTrackingTypeHTC;
}
#run {
    instance: XrFacialTrackerCreateInfoHTC;
    assert(((cast(*void)(*instance.type)) - cast(*void)(*instance)) == 0, "XrFacialTrackerCreateInfoHTC.type has unexpected offset % instead of 0", ((cast(*void)(*instance.type)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrFacialTrackerCreateInfoHTC.type)) == 4, "XrFacialTrackerCreateInfoHTC.type has unexpected size % instead of 4", size_of(type_of(XrFacialTrackerCreateInfoHTC.type)));
    assert(((cast(*void)(*instance.next)) - cast(*void)(*instance)) == 8, "XrFacialTrackerCreateInfoHTC.next has unexpected offset % instead of 8", ((cast(*void)(*instance.next)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrFacialTrackerCreateInfoHTC.next)) == 8, "XrFacialTrackerCreateInfoHTC.next has unexpected size % instead of 8", size_of(type_of(XrFacialTrackerCreateInfoHTC.next)));
    assert(((cast(*void)(*instance.facialTrackingType)) - cast(*void)(*instance)) == 16, "XrFacialTrackerCreateInfoHTC.facialTrackingType has unexpected offset % instead of 16", ((cast(*void)(*instance.facialTrackingType)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrFacialTrackerCreateInfoHTC.facialTrackingType)) == 4, "XrFacialTrackerCreateInfoHTC.facialTrackingType has unexpected size % instead of 4", size_of(type_of(XrFacialTrackerCreateInfoHTC.facialTrackingType)));
    assert(size_of(XrFacialTrackerCreateInfoHTC) == 24, "XrFacialTrackerCreateInfoHTC has size % instead of 24", size_of(XrFacialTrackerCreateInfoHTC));
}

PFN_xrCreateFacialTrackerHTC :: #type (a0: XrSession, a1: *XrFacialTrackerCreateInfoHTC, a2: *XrFacialTrackerHTC) -> XrResult #c_call;
PFN_xrDestroyFacialTrackerHTC :: #type (a0: XrFacialTrackerHTC) -> XrResult #c_call;
PFN_xrGetFacialExpressionsHTC :: #type (a0: XrFacialTrackerHTC, a1: *XrFacialExpressionsHTC) -> XrResult #c_call;

XrColorSpaceFB :: enum s32 {
    UNMANAGED_FB :: 0;
    REC2020_FB   :: 1;
    REC709_FB    :: 2;
    RIFT_CV1_FB  :: 3;
    RIFT_S_FB    :: 4;
    QUEST_FB     :: 5;
    P3_FB        :: 6;
    ADOBE_RGB_FB :: 7;
    MAX_ENUM_FB  :: 2147483647;

    XR_COLOR_SPACE_UNMANAGED_FB :: UNMANAGED_FB;
    XR_COLOR_SPACE_REC2020_FB   :: REC2020_FB;
    XR_COLOR_SPACE_REC709_FB    :: REC709_FB;
    XR_COLOR_SPACE_RIFT_CV1_FB  :: RIFT_CV1_FB;
    XR_COLOR_SPACE_RIFT_S_FB    :: RIFT_S_FB;
    XR_COLOR_SPACE_QUEST_FB     :: QUEST_FB;
    XR_COLOR_SPACE_P3_FB        :: P3_FB;
    XR_COLOR_SPACE_ADOBE_RGB_FB :: ADOBE_RGB_FB;
    XR_COLOR_SPACE_MAX_ENUM_FB  :: MAX_ENUM_FB;
}

// XrSystemColorSpacePropertiesFB extends XrSystemProperties
XrSystemColorSpacePropertiesFB :: struct {
    type:       XrStructureType;
    next:       *void;
    colorSpace: XrColorSpaceFB;
}
#run {
    instance: XrSystemColorSpacePropertiesFB;
    assert(((cast(*void)(*instance.type)) - cast(*void)(*instance)) == 0, "XrSystemColorSpacePropertiesFB.type has unexpected offset % instead of 0", ((cast(*void)(*instance.type)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrSystemColorSpacePropertiesFB.type)) == 4, "XrSystemColorSpacePropertiesFB.type has unexpected size % instead of 4", size_of(type_of(XrSystemColorSpacePropertiesFB.type)));
    assert(((cast(*void)(*instance.next)) - cast(*void)(*instance)) == 8, "XrSystemColorSpacePropertiesFB.next has unexpected offset % instead of 8", ((cast(*void)(*instance.next)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrSystemColorSpacePropertiesFB.next)) == 8, "XrSystemColorSpacePropertiesFB.next has unexpected size % instead of 8", size_of(type_of(XrSystemColorSpacePropertiesFB.next)));
    assert(((cast(*void)(*instance.colorSpace)) - cast(*void)(*instance)) == 16, "XrSystemColorSpacePropertiesFB.colorSpace has unexpected offset % instead of 16", ((cast(*void)(*instance.colorSpace)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrSystemColorSpacePropertiesFB.colorSpace)) == 4, "XrSystemColorSpacePropertiesFB.colorSpace has unexpected size % instead of 4", size_of(type_of(XrSystemColorSpacePropertiesFB.colorSpace)));
    assert(size_of(XrSystemColorSpacePropertiesFB) == 24, "XrSystemColorSpacePropertiesFB has size % instead of 24", size_of(XrSystemColorSpacePropertiesFB));
}

PFN_xrEnumerateColorSpacesFB :: #type (a0: XrSession, a1: u32, a2: *u32, a3: *XrColorSpaceFB) -> XrResult #c_call;
PFN_xrSetColorSpaceFB :: #type (a0: XrSession, a1: XrColorSpaceFB) -> XrResult #c_call;

XrVector4sFB :: struct {
    x: s16;
    y: s16;
    z: s16;
    w: s16;
}
#run {
    instance: XrVector4sFB;
    assert(((cast(*void)(*instance.x)) - cast(*void)(*instance)) == 0, "XrVector4sFB.x has unexpected offset % instead of 0", ((cast(*void)(*instance.x)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrVector4sFB.x)) == 2, "XrVector4sFB.x has unexpected size % instead of 2", size_of(type_of(XrVector4sFB.x)));
    assert(((cast(*void)(*instance.y)) - cast(*void)(*instance)) == 2, "XrVector4sFB.y has unexpected offset % instead of 2", ((cast(*void)(*instance.y)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrVector4sFB.y)) == 2, "XrVector4sFB.y has unexpected size % instead of 2", size_of(type_of(XrVector4sFB.y)));
    assert(((cast(*void)(*instance.z)) - cast(*void)(*instance)) == 4, "XrVector4sFB.z has unexpected offset % instead of 4", ((cast(*void)(*instance.z)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrVector4sFB.z)) == 2, "XrVector4sFB.z has unexpected size % instead of 2", size_of(type_of(XrVector4sFB.z)));
    assert(((cast(*void)(*instance.w)) - cast(*void)(*instance)) == 6, "XrVector4sFB.w has unexpected offset % instead of 6", ((cast(*void)(*instance.w)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrVector4sFB.w)) == 2, "XrVector4sFB.w has unexpected size % instead of 2", size_of(type_of(XrVector4sFB.w)));
    assert(size_of(XrVector4sFB) == 8, "XrVector4sFB has size % instead of 8", size_of(XrVector4sFB));
}

XrHandTrackingMeshFB :: struct {
    type:                XrStructureType;
    next:                *void;
    jointCapacityInput:  u32;
    jointCountOutput:    u32;
    jointBindPoses:      *XrPosef;
    jointRadii:          *float;
    jointParents:        *XrHandJointEXT;
    vertexCapacityInput: u32;
    vertexCountOutput:   u32;
    vertexPositions:     *XrVector3f;
    vertexNormals:       *XrVector3f;
    vertexUVs:           *XrVector2f;
    vertexBlendIndices:  *XrVector4sFB;
    vertexBlendWeights:  *XrVector4f;
    indexCapacityInput:  u32;
    indexCountOutput:    u32;
    indices:             *s16;
}
#run {
    instance: XrHandTrackingMeshFB;
    assert(((cast(*void)(*instance.type)) - cast(*void)(*instance)) == 0, "XrHandTrackingMeshFB.type has unexpected offset % instead of 0", ((cast(*void)(*instance.type)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrHandTrackingMeshFB.type)) == 4, "XrHandTrackingMeshFB.type has unexpected size % instead of 4", size_of(type_of(XrHandTrackingMeshFB.type)));
    assert(((cast(*void)(*instance.next)) - cast(*void)(*instance)) == 8, "XrHandTrackingMeshFB.next has unexpected offset % instead of 8", ((cast(*void)(*instance.next)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrHandTrackingMeshFB.next)) == 8, "XrHandTrackingMeshFB.next has unexpected size % instead of 8", size_of(type_of(XrHandTrackingMeshFB.next)));
    assert(((cast(*void)(*instance.jointCapacityInput)) - cast(*void)(*instance)) == 16, "XrHandTrackingMeshFB.jointCapacityInput has unexpected offset % instead of 16", ((cast(*void)(*instance.jointCapacityInput)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrHandTrackingMeshFB.jointCapacityInput)) == 4, "XrHandTrackingMeshFB.jointCapacityInput has unexpected size % instead of 4", size_of(type_of(XrHandTrackingMeshFB.jointCapacityInput)));
    assert(((cast(*void)(*instance.jointCountOutput)) - cast(*void)(*instance)) == 20, "XrHandTrackingMeshFB.jointCountOutput has unexpected offset % instead of 20", ((cast(*void)(*instance.jointCountOutput)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrHandTrackingMeshFB.jointCountOutput)) == 4, "XrHandTrackingMeshFB.jointCountOutput has unexpected size % instead of 4", size_of(type_of(XrHandTrackingMeshFB.jointCountOutput)));
    assert(((cast(*void)(*instance.jointBindPoses)) - cast(*void)(*instance)) == 24, "XrHandTrackingMeshFB.jointBindPoses has unexpected offset % instead of 24", ((cast(*void)(*instance.jointBindPoses)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrHandTrackingMeshFB.jointBindPoses)) == 8, "XrHandTrackingMeshFB.jointBindPoses has unexpected size % instead of 8", size_of(type_of(XrHandTrackingMeshFB.jointBindPoses)));
    assert(((cast(*void)(*instance.jointRadii)) - cast(*void)(*instance)) == 32, "XrHandTrackingMeshFB.jointRadii has unexpected offset % instead of 32", ((cast(*void)(*instance.jointRadii)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrHandTrackingMeshFB.jointRadii)) == 8, "XrHandTrackingMeshFB.jointRadii has unexpected size % instead of 8", size_of(type_of(XrHandTrackingMeshFB.jointRadii)));
    assert(((cast(*void)(*instance.jointParents)) - cast(*void)(*instance)) == 40, "XrHandTrackingMeshFB.jointParents has unexpected offset % instead of 40", ((cast(*void)(*instance.jointParents)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrHandTrackingMeshFB.jointParents)) == 8, "XrHandTrackingMeshFB.jointParents has unexpected size % instead of 8", size_of(type_of(XrHandTrackingMeshFB.jointParents)));
    assert(((cast(*void)(*instance.vertexCapacityInput)) - cast(*void)(*instance)) == 48, "XrHandTrackingMeshFB.vertexCapacityInput has unexpected offset % instead of 48", ((cast(*void)(*instance.vertexCapacityInput)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrHandTrackingMeshFB.vertexCapacityInput)) == 4, "XrHandTrackingMeshFB.vertexCapacityInput has unexpected size % instead of 4", size_of(type_of(XrHandTrackingMeshFB.vertexCapacityInput)));
    assert(((cast(*void)(*instance.vertexCountOutput)) - cast(*void)(*instance)) == 52, "XrHandTrackingMeshFB.vertexCountOutput has unexpected offset % instead of 52", ((cast(*void)(*instance.vertexCountOutput)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrHandTrackingMeshFB.vertexCountOutput)) == 4, "XrHandTrackingMeshFB.vertexCountOutput has unexpected size % instead of 4", size_of(type_of(XrHandTrackingMeshFB.vertexCountOutput)));
    assert(((cast(*void)(*instance.vertexPositions)) - cast(*void)(*instance)) == 56, "XrHandTrackingMeshFB.vertexPositions has unexpected offset % instead of 56", ((cast(*void)(*instance.vertexPositions)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrHandTrackingMeshFB.vertexPositions)) == 8, "XrHandTrackingMeshFB.vertexPositions has unexpected size % instead of 8", size_of(type_of(XrHandTrackingMeshFB.vertexPositions)));
    assert(((cast(*void)(*instance.vertexNormals)) - cast(*void)(*instance)) == 64, "XrHandTrackingMeshFB.vertexNormals has unexpected offset % instead of 64", ((cast(*void)(*instance.vertexNormals)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrHandTrackingMeshFB.vertexNormals)) == 8, "XrHandTrackingMeshFB.vertexNormals has unexpected size % instead of 8", size_of(type_of(XrHandTrackingMeshFB.vertexNormals)));
    assert(((cast(*void)(*instance.vertexUVs)) - cast(*void)(*instance)) == 72, "XrHandTrackingMeshFB.vertexUVs has unexpected offset % instead of 72", ((cast(*void)(*instance.vertexUVs)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrHandTrackingMeshFB.vertexUVs)) == 8, "XrHandTrackingMeshFB.vertexUVs has unexpected size % instead of 8", size_of(type_of(XrHandTrackingMeshFB.vertexUVs)));
    assert(((cast(*void)(*instance.vertexBlendIndices)) - cast(*void)(*instance)) == 80, "XrHandTrackingMeshFB.vertexBlendIndices has unexpected offset % instead of 80", ((cast(*void)(*instance.vertexBlendIndices)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrHandTrackingMeshFB.vertexBlendIndices)) == 8, "XrHandTrackingMeshFB.vertexBlendIndices has unexpected size % instead of 8", size_of(type_of(XrHandTrackingMeshFB.vertexBlendIndices)));
    assert(((cast(*void)(*instance.vertexBlendWeights)) - cast(*void)(*instance)) == 88, "XrHandTrackingMeshFB.vertexBlendWeights has unexpected offset % instead of 88", ((cast(*void)(*instance.vertexBlendWeights)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrHandTrackingMeshFB.vertexBlendWeights)) == 8, "XrHandTrackingMeshFB.vertexBlendWeights has unexpected size % instead of 8", size_of(type_of(XrHandTrackingMeshFB.vertexBlendWeights)));
    assert(((cast(*void)(*instance.indexCapacityInput)) - cast(*void)(*instance)) == 96, "XrHandTrackingMeshFB.indexCapacityInput has unexpected offset % instead of 96", ((cast(*void)(*instance.indexCapacityInput)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrHandTrackingMeshFB.indexCapacityInput)) == 4, "XrHandTrackingMeshFB.indexCapacityInput has unexpected size % instead of 4", size_of(type_of(XrHandTrackingMeshFB.indexCapacityInput)));
    assert(((cast(*void)(*instance.indexCountOutput)) - cast(*void)(*instance)) == 100, "XrHandTrackingMeshFB.indexCountOutput has unexpected offset % instead of 100", ((cast(*void)(*instance.indexCountOutput)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrHandTrackingMeshFB.indexCountOutput)) == 4, "XrHandTrackingMeshFB.indexCountOutput has unexpected size % instead of 4", size_of(type_of(XrHandTrackingMeshFB.indexCountOutput)));
    assert(((cast(*void)(*instance.indices)) - cast(*void)(*instance)) == 104, "XrHandTrackingMeshFB.indices has unexpected offset % instead of 104", ((cast(*void)(*instance.indices)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrHandTrackingMeshFB.indices)) == 8, "XrHandTrackingMeshFB.indices has unexpected size % instead of 8", size_of(type_of(XrHandTrackingMeshFB.indices)));
    assert(size_of(XrHandTrackingMeshFB) == 112, "XrHandTrackingMeshFB has size % instead of 112", size_of(XrHandTrackingMeshFB));
}

// XrHandTrackingScaleFB extends XrHandJointLocationsEXT
XrHandTrackingScaleFB :: struct {
    type:               XrStructureType;
    next:               *void;
    sensorOutput:       float;
    currentOutput:      float;
    overrideHandScale:  XrBool32;
    overrideValueInput: float;
}
#run {
    instance: XrHandTrackingScaleFB;
    assert(((cast(*void)(*instance.type)) - cast(*void)(*instance)) == 0, "XrHandTrackingScaleFB.type has unexpected offset % instead of 0", ((cast(*void)(*instance.type)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrHandTrackingScaleFB.type)) == 4, "XrHandTrackingScaleFB.type has unexpected size % instead of 4", size_of(type_of(XrHandTrackingScaleFB.type)));
    assert(((cast(*void)(*instance.next)) - cast(*void)(*instance)) == 8, "XrHandTrackingScaleFB.next has unexpected offset % instead of 8", ((cast(*void)(*instance.next)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrHandTrackingScaleFB.next)) == 8, "XrHandTrackingScaleFB.next has unexpected size % instead of 8", size_of(type_of(XrHandTrackingScaleFB.next)));
    assert(((cast(*void)(*instance.sensorOutput)) - cast(*void)(*instance)) == 16, "XrHandTrackingScaleFB.sensorOutput has unexpected offset % instead of 16", ((cast(*void)(*instance.sensorOutput)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrHandTrackingScaleFB.sensorOutput)) == 4, "XrHandTrackingScaleFB.sensorOutput has unexpected size % instead of 4", size_of(type_of(XrHandTrackingScaleFB.sensorOutput)));
    assert(((cast(*void)(*instance.currentOutput)) - cast(*void)(*instance)) == 20, "XrHandTrackingScaleFB.currentOutput has unexpected offset % instead of 20", ((cast(*void)(*instance.currentOutput)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrHandTrackingScaleFB.currentOutput)) == 4, "XrHandTrackingScaleFB.currentOutput has unexpected size % instead of 4", size_of(type_of(XrHandTrackingScaleFB.currentOutput)));
    assert(((cast(*void)(*instance.overrideHandScale)) - cast(*void)(*instance)) == 24, "XrHandTrackingScaleFB.overrideHandScale has unexpected offset % instead of 24", ((cast(*void)(*instance.overrideHandScale)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrHandTrackingScaleFB.overrideHandScale)) == 4, "XrHandTrackingScaleFB.overrideHandScale has unexpected size % instead of 4", size_of(type_of(XrHandTrackingScaleFB.overrideHandScale)));
    assert(((cast(*void)(*instance.overrideValueInput)) - cast(*void)(*instance)) == 28, "XrHandTrackingScaleFB.overrideValueInput has unexpected offset % instead of 28", ((cast(*void)(*instance.overrideValueInput)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrHandTrackingScaleFB.overrideValueInput)) == 4, "XrHandTrackingScaleFB.overrideValueInput has unexpected size % instead of 4", size_of(type_of(XrHandTrackingScaleFB.overrideValueInput)));
    assert(size_of(XrHandTrackingScaleFB) == 32, "XrHandTrackingScaleFB has size % instead of 32", size_of(XrHandTrackingScaleFB));
}

PFN_xrGetHandMeshFB :: #type (a0: XrHandTrackerEXT, a1: *XrHandTrackingMeshFB) -> XrResult #c_call;

XrHandTrackingAimFlagsFB :: XrFlags64;

// Flag bits for XrHandTrackingAimFlagsFB
XR_HAND_TRACKING_AIM_COMPUTED_BIT_FB: XrHandTrackingAimFlagsFB : 1;
XR_HAND_TRACKING_AIM_VALID_BIT_FB: XrHandTrackingAimFlagsFB : 2;
XR_HAND_TRACKING_AIM_INDEX_PINCHING_BIT_FB: XrHandTrackingAimFlagsFB : 4;
XR_HAND_TRACKING_AIM_MIDDLE_PINCHING_BIT_FB: XrHandTrackingAimFlagsFB : 8;
XR_HAND_TRACKING_AIM_RING_PINCHING_BIT_FB: XrHandTrackingAimFlagsFB : 16;
XR_HAND_TRACKING_AIM_LITTLE_PINCHING_BIT_FB: XrHandTrackingAimFlagsFB : 32;
XR_HAND_TRACKING_AIM_SYSTEM_GESTURE_BIT_FB: XrHandTrackingAimFlagsFB : 64;
XR_HAND_TRACKING_AIM_DOMINANT_HAND_BIT_FB: XrHandTrackingAimFlagsFB : 128;
XR_HAND_TRACKING_AIM_MENU_PRESSED_BIT_FB: XrHandTrackingAimFlagsFB : 256;

// XrHandTrackingAimStateFB extends XrHandJointLocationsEXT
XrHandTrackingAimStateFB :: struct {
    type:                XrStructureType;
    next:                *void;
    status:              XrHandTrackingAimFlagsFB;
    aimPose:             XrPosef;
    pinchStrengthIndex:  float;
    pinchStrengthMiddle: float;
    pinchStrengthRing:   float;
    pinchStrengthLittle: float;
}
#run {
    instance: XrHandTrackingAimStateFB;
    assert(((cast(*void)(*instance.type)) - cast(*void)(*instance)) == 0, "XrHandTrackingAimStateFB.type has unexpected offset % instead of 0", ((cast(*void)(*instance.type)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrHandTrackingAimStateFB.type)) == 4, "XrHandTrackingAimStateFB.type has unexpected size % instead of 4", size_of(type_of(XrHandTrackingAimStateFB.type)));
    assert(((cast(*void)(*instance.next)) - cast(*void)(*instance)) == 8, "XrHandTrackingAimStateFB.next has unexpected offset % instead of 8", ((cast(*void)(*instance.next)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrHandTrackingAimStateFB.next)) == 8, "XrHandTrackingAimStateFB.next has unexpected size % instead of 8", size_of(type_of(XrHandTrackingAimStateFB.next)));
    assert(((cast(*void)(*instance.status)) - cast(*void)(*instance)) == 16, "XrHandTrackingAimStateFB.status has unexpected offset % instead of 16", ((cast(*void)(*instance.status)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrHandTrackingAimStateFB.status)) == 8, "XrHandTrackingAimStateFB.status has unexpected size % instead of 8", size_of(type_of(XrHandTrackingAimStateFB.status)));
    assert(((cast(*void)(*instance.aimPose)) - cast(*void)(*instance)) == 24, "XrHandTrackingAimStateFB.aimPose has unexpected offset % instead of 24", ((cast(*void)(*instance.aimPose)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrHandTrackingAimStateFB.aimPose)) == 28, "XrHandTrackingAimStateFB.aimPose has unexpected size % instead of 28", size_of(type_of(XrHandTrackingAimStateFB.aimPose)));
    assert(((cast(*void)(*instance.pinchStrengthIndex)) - cast(*void)(*instance)) == 52, "XrHandTrackingAimStateFB.pinchStrengthIndex has unexpected offset % instead of 52", ((cast(*void)(*instance.pinchStrengthIndex)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrHandTrackingAimStateFB.pinchStrengthIndex)) == 4, "XrHandTrackingAimStateFB.pinchStrengthIndex has unexpected size % instead of 4", size_of(type_of(XrHandTrackingAimStateFB.pinchStrengthIndex)));
    assert(((cast(*void)(*instance.pinchStrengthMiddle)) - cast(*void)(*instance)) == 56, "XrHandTrackingAimStateFB.pinchStrengthMiddle has unexpected offset % instead of 56", ((cast(*void)(*instance.pinchStrengthMiddle)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrHandTrackingAimStateFB.pinchStrengthMiddle)) == 4, "XrHandTrackingAimStateFB.pinchStrengthMiddle has unexpected size % instead of 4", size_of(type_of(XrHandTrackingAimStateFB.pinchStrengthMiddle)));
    assert(((cast(*void)(*instance.pinchStrengthRing)) - cast(*void)(*instance)) == 60, "XrHandTrackingAimStateFB.pinchStrengthRing has unexpected offset % instead of 60", ((cast(*void)(*instance.pinchStrengthRing)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrHandTrackingAimStateFB.pinchStrengthRing)) == 4, "XrHandTrackingAimStateFB.pinchStrengthRing has unexpected size % instead of 4", size_of(type_of(XrHandTrackingAimStateFB.pinchStrengthRing)));
    assert(((cast(*void)(*instance.pinchStrengthLittle)) - cast(*void)(*instance)) == 64, "XrHandTrackingAimStateFB.pinchStrengthLittle has unexpected offset % instead of 64", ((cast(*void)(*instance.pinchStrengthLittle)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrHandTrackingAimStateFB.pinchStrengthLittle)) == 4, "XrHandTrackingAimStateFB.pinchStrengthLittle has unexpected size % instead of 4", size_of(type_of(XrHandTrackingAimStateFB.pinchStrengthLittle)));
    assert(size_of(XrHandTrackingAimStateFB) == 72, "XrHandTrackingAimStateFB has size % instead of 72", size_of(XrHandTrackingAimStateFB));
}

XrHandCapsuleFB :: struct {
    points: [2] XrVector3f;
    radius: float;
    joint:  XrHandJointEXT;
}
#run {
    instance: XrHandCapsuleFB;
    assert(((cast(*void)(*instance.points)) - cast(*void)(*instance)) == 0, "XrHandCapsuleFB.points has unexpected offset % instead of 0", ((cast(*void)(*instance.points)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrHandCapsuleFB.points)) == 24, "XrHandCapsuleFB.points has unexpected size % instead of 24", size_of(type_of(XrHandCapsuleFB.points)));
    assert(((cast(*void)(*instance.radius)) - cast(*void)(*instance)) == 24, "XrHandCapsuleFB.radius has unexpected offset % instead of 24", ((cast(*void)(*instance.radius)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrHandCapsuleFB.radius)) == 4, "XrHandCapsuleFB.radius has unexpected size % instead of 4", size_of(type_of(XrHandCapsuleFB.radius)));
    assert(((cast(*void)(*instance.joint)) - cast(*void)(*instance)) == 28, "XrHandCapsuleFB.joint has unexpected offset % instead of 28", ((cast(*void)(*instance.joint)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrHandCapsuleFB.joint)) == 4, "XrHandCapsuleFB.joint has unexpected size % instead of 4", size_of(type_of(XrHandCapsuleFB.joint)));
    assert(size_of(XrHandCapsuleFB) == 32, "XrHandCapsuleFB has size % instead of 32", size_of(XrHandCapsuleFB));
}

// XrHandTrackingCapsulesStateFB extends XrHandJointLocationsEXT
XrHandTrackingCapsulesStateFB :: struct {
    type:     XrStructureType;
    next:     *void;
    capsules: [19] XrHandCapsuleFB;
}
#run {
    instance: XrHandTrackingCapsulesStateFB;
    assert(((cast(*void)(*instance.type)) - cast(*void)(*instance)) == 0, "XrHandTrackingCapsulesStateFB.type has unexpected offset % instead of 0", ((cast(*void)(*instance.type)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrHandTrackingCapsulesStateFB.type)) == 4, "XrHandTrackingCapsulesStateFB.type has unexpected size % instead of 4", size_of(type_of(XrHandTrackingCapsulesStateFB.type)));
    assert(((cast(*void)(*instance.next)) - cast(*void)(*instance)) == 8, "XrHandTrackingCapsulesStateFB.next has unexpected offset % instead of 8", ((cast(*void)(*instance.next)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrHandTrackingCapsulesStateFB.next)) == 8, "XrHandTrackingCapsulesStateFB.next has unexpected size % instead of 8", size_of(type_of(XrHandTrackingCapsulesStateFB.next)));
    assert(((cast(*void)(*instance.capsules)) - cast(*void)(*instance)) == 16, "XrHandTrackingCapsulesStateFB.capsules has unexpected offset % instead of 16", ((cast(*void)(*instance.capsules)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrHandTrackingCapsulesStateFB.capsules)) == 608, "XrHandTrackingCapsulesStateFB.capsules has unexpected size % instead of 608", size_of(type_of(XrHandTrackingCapsulesStateFB.capsules)));
    assert(size_of(XrHandTrackingCapsulesStateFB) == 624, "XrHandTrackingCapsulesStateFB has size % instead of 624", size_of(XrHandTrackingCapsulesStateFB));
}

XrAsyncRequestIdFB :: u64;

XrSpaceComponentTypeFB :: enum s32 {
    LOCATABLE_FB       :: 0;
    STORABLE_FB        :: 1;
    BOUNDED_2D_FB      :: 3;
    BOUNDED_3D_FB      :: 4;
    SEMANTIC_LABELS_FB :: 5;
    ROOM_LAYOUT_FB     :: 6;
    SPACE_CONTAINER_FB :: 7;
    MAX_ENUM_FB        :: 2147483647;

    XR_SPACE_COMPONENT_TYPE_LOCATABLE_FB       :: LOCATABLE_FB;
    XR_SPACE_COMPONENT_TYPE_STORABLE_FB        :: STORABLE_FB;
    XR_SPACE_COMPONENT_TYPE_BOUNDED_2D_FB      :: BOUNDED_2D_FB;
    XR_SPACE_COMPONENT_TYPE_BOUNDED_3D_FB      :: BOUNDED_3D_FB;
    XR_SPACE_COMPONENT_TYPE_SEMANTIC_LABELS_FB :: SEMANTIC_LABELS_FB;
    XR_SPACE_COMPONENT_TYPE_ROOM_LAYOUT_FB     :: ROOM_LAYOUT_FB;
    XR_SPACE_COMPONENT_TYPE_SPACE_CONTAINER_FB :: SPACE_CONTAINER_FB;
    XR_SPACE_COMPONENT_TYPE_MAX_ENUM_FB        :: MAX_ENUM_FB;
}

// XrSystemSpatialEntityPropertiesFB extends XrSystemProperties
XrSystemSpatialEntityPropertiesFB :: struct {
    type:                  XrStructureType;
    next:                  *void;
    supportsSpatialEntity: XrBool32;
}
#run {
    instance: XrSystemSpatialEntityPropertiesFB;
    assert(((cast(*void)(*instance.type)) - cast(*void)(*instance)) == 0, "XrSystemSpatialEntityPropertiesFB.type has unexpected offset % instead of 0", ((cast(*void)(*instance.type)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrSystemSpatialEntityPropertiesFB.type)) == 4, "XrSystemSpatialEntityPropertiesFB.type has unexpected size % instead of 4", size_of(type_of(XrSystemSpatialEntityPropertiesFB.type)));
    assert(((cast(*void)(*instance.next)) - cast(*void)(*instance)) == 8, "XrSystemSpatialEntityPropertiesFB.next has unexpected offset % instead of 8", ((cast(*void)(*instance.next)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrSystemSpatialEntityPropertiesFB.next)) == 8, "XrSystemSpatialEntityPropertiesFB.next has unexpected size % instead of 8", size_of(type_of(XrSystemSpatialEntityPropertiesFB.next)));
    assert(((cast(*void)(*instance.supportsSpatialEntity)) - cast(*void)(*instance)) == 16, "XrSystemSpatialEntityPropertiesFB.supportsSpatialEntity has unexpected offset % instead of 16", ((cast(*void)(*instance.supportsSpatialEntity)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrSystemSpatialEntityPropertiesFB.supportsSpatialEntity)) == 4, "XrSystemSpatialEntityPropertiesFB.supportsSpatialEntity has unexpected size % instead of 4", size_of(type_of(XrSystemSpatialEntityPropertiesFB.supportsSpatialEntity)));
    assert(size_of(XrSystemSpatialEntityPropertiesFB) == 24, "XrSystemSpatialEntityPropertiesFB has size % instead of 24", size_of(XrSystemSpatialEntityPropertiesFB));
}

XrSpatialAnchorCreateInfoFB :: struct {
    type:        XrStructureType;
    next:        *void;
    space:       XrSpace;
    poseInSpace: XrPosef;
    time:        XrTime;
}
#run {
    instance: XrSpatialAnchorCreateInfoFB;
    assert(((cast(*void)(*instance.type)) - cast(*void)(*instance)) == 0, "XrSpatialAnchorCreateInfoFB.type has unexpected offset % instead of 0", ((cast(*void)(*instance.type)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrSpatialAnchorCreateInfoFB.type)) == 4, "XrSpatialAnchorCreateInfoFB.type has unexpected size % instead of 4", size_of(type_of(XrSpatialAnchorCreateInfoFB.type)));
    assert(((cast(*void)(*instance.next)) - cast(*void)(*instance)) == 8, "XrSpatialAnchorCreateInfoFB.next has unexpected offset % instead of 8", ((cast(*void)(*instance.next)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrSpatialAnchorCreateInfoFB.next)) == 8, "XrSpatialAnchorCreateInfoFB.next has unexpected size % instead of 8", size_of(type_of(XrSpatialAnchorCreateInfoFB.next)));
    assert(((cast(*void)(*instance.space)) - cast(*void)(*instance)) == 16, "XrSpatialAnchorCreateInfoFB.space has unexpected offset % instead of 16", ((cast(*void)(*instance.space)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrSpatialAnchorCreateInfoFB.space)) == 8, "XrSpatialAnchorCreateInfoFB.space has unexpected size % instead of 8", size_of(type_of(XrSpatialAnchorCreateInfoFB.space)));
    assert(((cast(*void)(*instance.poseInSpace)) - cast(*void)(*instance)) == 24, "XrSpatialAnchorCreateInfoFB.poseInSpace has unexpected offset % instead of 24", ((cast(*void)(*instance.poseInSpace)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrSpatialAnchorCreateInfoFB.poseInSpace)) == 28, "XrSpatialAnchorCreateInfoFB.poseInSpace has unexpected size % instead of 28", size_of(type_of(XrSpatialAnchorCreateInfoFB.poseInSpace)));
    assert(((cast(*void)(*instance.time)) - cast(*void)(*instance)) == 56, "XrSpatialAnchorCreateInfoFB.time has unexpected offset % instead of 56", ((cast(*void)(*instance.time)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrSpatialAnchorCreateInfoFB.time)) == 8, "XrSpatialAnchorCreateInfoFB.time has unexpected size % instead of 8", size_of(type_of(XrSpatialAnchorCreateInfoFB.time)));
    assert(size_of(XrSpatialAnchorCreateInfoFB) == 64, "XrSpatialAnchorCreateInfoFB has size % instead of 64", size_of(XrSpatialAnchorCreateInfoFB));
}

XrSpaceComponentStatusSetInfoFB :: struct {
    type:          XrStructureType;
    next:          *void;
    componentType: XrSpaceComponentTypeFB;
    enabled:       XrBool32;
    timeout:       XrDuration;
}
#run {
    instance: XrSpaceComponentStatusSetInfoFB;
    assert(((cast(*void)(*instance.type)) - cast(*void)(*instance)) == 0, "XrSpaceComponentStatusSetInfoFB.type has unexpected offset % instead of 0", ((cast(*void)(*instance.type)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrSpaceComponentStatusSetInfoFB.type)) == 4, "XrSpaceComponentStatusSetInfoFB.type has unexpected size % instead of 4", size_of(type_of(XrSpaceComponentStatusSetInfoFB.type)));
    assert(((cast(*void)(*instance.next)) - cast(*void)(*instance)) == 8, "XrSpaceComponentStatusSetInfoFB.next has unexpected offset % instead of 8", ((cast(*void)(*instance.next)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrSpaceComponentStatusSetInfoFB.next)) == 8, "XrSpaceComponentStatusSetInfoFB.next has unexpected size % instead of 8", size_of(type_of(XrSpaceComponentStatusSetInfoFB.next)));
    assert(((cast(*void)(*instance.componentType)) - cast(*void)(*instance)) == 16, "XrSpaceComponentStatusSetInfoFB.componentType has unexpected offset % instead of 16", ((cast(*void)(*instance.componentType)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrSpaceComponentStatusSetInfoFB.componentType)) == 4, "XrSpaceComponentStatusSetInfoFB.componentType has unexpected size % instead of 4", size_of(type_of(XrSpaceComponentStatusSetInfoFB.componentType)));
    assert(((cast(*void)(*instance.enabled)) - cast(*void)(*instance)) == 20, "XrSpaceComponentStatusSetInfoFB.enabled has unexpected offset % instead of 20", ((cast(*void)(*instance.enabled)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrSpaceComponentStatusSetInfoFB.enabled)) == 4, "XrSpaceComponentStatusSetInfoFB.enabled has unexpected size % instead of 4", size_of(type_of(XrSpaceComponentStatusSetInfoFB.enabled)));
    assert(((cast(*void)(*instance.timeout)) - cast(*void)(*instance)) == 24, "XrSpaceComponentStatusSetInfoFB.timeout has unexpected offset % instead of 24", ((cast(*void)(*instance.timeout)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrSpaceComponentStatusSetInfoFB.timeout)) == 8, "XrSpaceComponentStatusSetInfoFB.timeout has unexpected size % instead of 8", size_of(type_of(XrSpaceComponentStatusSetInfoFB.timeout)));
    assert(size_of(XrSpaceComponentStatusSetInfoFB) == 32, "XrSpaceComponentStatusSetInfoFB has size % instead of 32", size_of(XrSpaceComponentStatusSetInfoFB));
}

XrSpaceComponentStatusFB :: struct {
    type:          XrStructureType;
    next:          *void;
    enabled:       XrBool32;
    changePending: XrBool32;
}
#run {
    instance: XrSpaceComponentStatusFB;
    assert(((cast(*void)(*instance.type)) - cast(*void)(*instance)) == 0, "XrSpaceComponentStatusFB.type has unexpected offset % instead of 0", ((cast(*void)(*instance.type)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrSpaceComponentStatusFB.type)) == 4, "XrSpaceComponentStatusFB.type has unexpected size % instead of 4", size_of(type_of(XrSpaceComponentStatusFB.type)));
    assert(((cast(*void)(*instance.next)) - cast(*void)(*instance)) == 8, "XrSpaceComponentStatusFB.next has unexpected offset % instead of 8", ((cast(*void)(*instance.next)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrSpaceComponentStatusFB.next)) == 8, "XrSpaceComponentStatusFB.next has unexpected size % instead of 8", size_of(type_of(XrSpaceComponentStatusFB.next)));
    assert(((cast(*void)(*instance.enabled)) - cast(*void)(*instance)) == 16, "XrSpaceComponentStatusFB.enabled has unexpected offset % instead of 16", ((cast(*void)(*instance.enabled)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrSpaceComponentStatusFB.enabled)) == 4, "XrSpaceComponentStatusFB.enabled has unexpected size % instead of 4", size_of(type_of(XrSpaceComponentStatusFB.enabled)));
    assert(((cast(*void)(*instance.changePending)) - cast(*void)(*instance)) == 20, "XrSpaceComponentStatusFB.changePending has unexpected offset % instead of 20", ((cast(*void)(*instance.changePending)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrSpaceComponentStatusFB.changePending)) == 4, "XrSpaceComponentStatusFB.changePending has unexpected size % instead of 4", size_of(type_of(XrSpaceComponentStatusFB.changePending)));
    assert(size_of(XrSpaceComponentStatusFB) == 24, "XrSpaceComponentStatusFB has size % instead of 24", size_of(XrSpaceComponentStatusFB));
}

XrUuidEXT :: struct {
    data: [16] u8;
}
#run {
    instance: XrUuidEXT;
    assert(((cast(*void)(*instance.data)) - cast(*void)(*instance)) == 0, "XrUuidEXT.data has unexpected offset % instead of 0", ((cast(*void)(*instance.data)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrUuidEXT.data)) == 16, "XrUuidEXT.data has unexpected size % instead of 16", size_of(type_of(XrUuidEXT.data)));
    assert(size_of(XrUuidEXT) == 16, "XrUuidEXT has size % instead of 16", size_of(XrUuidEXT));
}

XrEventDataSpatialAnchorCreateCompleteFB :: struct {
    type:      XrStructureType;
    next:      *void;
    requestId: XrAsyncRequestIdFB;
    result:    XrResult;
    space:     XrSpace;
    uuid:      XrUuidEXT;
}
#run {
    instance: XrEventDataSpatialAnchorCreateCompleteFB;
    assert(((cast(*void)(*instance.type)) - cast(*void)(*instance)) == 0, "XrEventDataSpatialAnchorCreateCompleteFB.type has unexpected offset % instead of 0", ((cast(*void)(*instance.type)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrEventDataSpatialAnchorCreateCompleteFB.type)) == 4, "XrEventDataSpatialAnchorCreateCompleteFB.type has unexpected size % instead of 4", size_of(type_of(XrEventDataSpatialAnchorCreateCompleteFB.type)));
    assert(((cast(*void)(*instance.next)) - cast(*void)(*instance)) == 8, "XrEventDataSpatialAnchorCreateCompleteFB.next has unexpected offset % instead of 8", ((cast(*void)(*instance.next)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrEventDataSpatialAnchorCreateCompleteFB.next)) == 8, "XrEventDataSpatialAnchorCreateCompleteFB.next has unexpected size % instead of 8", size_of(type_of(XrEventDataSpatialAnchorCreateCompleteFB.next)));
    assert(((cast(*void)(*instance.requestId)) - cast(*void)(*instance)) == 16, "XrEventDataSpatialAnchorCreateCompleteFB.requestId has unexpected offset % instead of 16", ((cast(*void)(*instance.requestId)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrEventDataSpatialAnchorCreateCompleteFB.requestId)) == 8, "XrEventDataSpatialAnchorCreateCompleteFB.requestId has unexpected size % instead of 8", size_of(type_of(XrEventDataSpatialAnchorCreateCompleteFB.requestId)));
    assert(((cast(*void)(*instance.result)) - cast(*void)(*instance)) == 24, "XrEventDataSpatialAnchorCreateCompleteFB.result has unexpected offset % instead of 24", ((cast(*void)(*instance.result)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrEventDataSpatialAnchorCreateCompleteFB.result)) == 4, "XrEventDataSpatialAnchorCreateCompleteFB.result has unexpected size % instead of 4", size_of(type_of(XrEventDataSpatialAnchorCreateCompleteFB.result)));
    assert(((cast(*void)(*instance.space)) - cast(*void)(*instance)) == 32, "XrEventDataSpatialAnchorCreateCompleteFB.space has unexpected offset % instead of 32", ((cast(*void)(*instance.space)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrEventDataSpatialAnchorCreateCompleteFB.space)) == 8, "XrEventDataSpatialAnchorCreateCompleteFB.space has unexpected size % instead of 8", size_of(type_of(XrEventDataSpatialAnchorCreateCompleteFB.space)));
    assert(((cast(*void)(*instance.uuid)) - cast(*void)(*instance)) == 40, "XrEventDataSpatialAnchorCreateCompleteFB.uuid has unexpected offset % instead of 40", ((cast(*void)(*instance.uuid)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrEventDataSpatialAnchorCreateCompleteFB.uuid)) == 16, "XrEventDataSpatialAnchorCreateCompleteFB.uuid has unexpected size % instead of 16", size_of(type_of(XrEventDataSpatialAnchorCreateCompleteFB.uuid)));
    assert(size_of(XrEventDataSpatialAnchorCreateCompleteFB) == 56, "XrEventDataSpatialAnchorCreateCompleteFB has size % instead of 56", size_of(XrEventDataSpatialAnchorCreateCompleteFB));
}

XrEventDataSpaceSetStatusCompleteFB :: struct {
    type:          XrStructureType;
    next:          *void;
    requestId:     XrAsyncRequestIdFB;
    result:        XrResult;
    space:         XrSpace;
    uuid:          XrUuidEXT;
    componentType: XrSpaceComponentTypeFB;
    enabled:       XrBool32;
}
#run {
    instance: XrEventDataSpaceSetStatusCompleteFB;
    assert(((cast(*void)(*instance.type)) - cast(*void)(*instance)) == 0, "XrEventDataSpaceSetStatusCompleteFB.type has unexpected offset % instead of 0", ((cast(*void)(*instance.type)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrEventDataSpaceSetStatusCompleteFB.type)) == 4, "XrEventDataSpaceSetStatusCompleteFB.type has unexpected size % instead of 4", size_of(type_of(XrEventDataSpaceSetStatusCompleteFB.type)));
    assert(((cast(*void)(*instance.next)) - cast(*void)(*instance)) == 8, "XrEventDataSpaceSetStatusCompleteFB.next has unexpected offset % instead of 8", ((cast(*void)(*instance.next)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrEventDataSpaceSetStatusCompleteFB.next)) == 8, "XrEventDataSpaceSetStatusCompleteFB.next has unexpected size % instead of 8", size_of(type_of(XrEventDataSpaceSetStatusCompleteFB.next)));
    assert(((cast(*void)(*instance.requestId)) - cast(*void)(*instance)) == 16, "XrEventDataSpaceSetStatusCompleteFB.requestId has unexpected offset % instead of 16", ((cast(*void)(*instance.requestId)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrEventDataSpaceSetStatusCompleteFB.requestId)) == 8, "XrEventDataSpaceSetStatusCompleteFB.requestId has unexpected size % instead of 8", size_of(type_of(XrEventDataSpaceSetStatusCompleteFB.requestId)));
    assert(((cast(*void)(*instance.result)) - cast(*void)(*instance)) == 24, "XrEventDataSpaceSetStatusCompleteFB.result has unexpected offset % instead of 24", ((cast(*void)(*instance.result)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrEventDataSpaceSetStatusCompleteFB.result)) == 4, "XrEventDataSpaceSetStatusCompleteFB.result has unexpected size % instead of 4", size_of(type_of(XrEventDataSpaceSetStatusCompleteFB.result)));
    assert(((cast(*void)(*instance.space)) - cast(*void)(*instance)) == 32, "XrEventDataSpaceSetStatusCompleteFB.space has unexpected offset % instead of 32", ((cast(*void)(*instance.space)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrEventDataSpaceSetStatusCompleteFB.space)) == 8, "XrEventDataSpaceSetStatusCompleteFB.space has unexpected size % instead of 8", size_of(type_of(XrEventDataSpaceSetStatusCompleteFB.space)));
    assert(((cast(*void)(*instance.uuid)) - cast(*void)(*instance)) == 40, "XrEventDataSpaceSetStatusCompleteFB.uuid has unexpected offset % instead of 40", ((cast(*void)(*instance.uuid)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrEventDataSpaceSetStatusCompleteFB.uuid)) == 16, "XrEventDataSpaceSetStatusCompleteFB.uuid has unexpected size % instead of 16", size_of(type_of(XrEventDataSpaceSetStatusCompleteFB.uuid)));
    assert(((cast(*void)(*instance.componentType)) - cast(*void)(*instance)) == 56, "XrEventDataSpaceSetStatusCompleteFB.componentType has unexpected offset % instead of 56", ((cast(*void)(*instance.componentType)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrEventDataSpaceSetStatusCompleteFB.componentType)) == 4, "XrEventDataSpaceSetStatusCompleteFB.componentType has unexpected size % instead of 4", size_of(type_of(XrEventDataSpaceSetStatusCompleteFB.componentType)));
    assert(((cast(*void)(*instance.enabled)) - cast(*void)(*instance)) == 60, "XrEventDataSpaceSetStatusCompleteFB.enabled has unexpected offset % instead of 60", ((cast(*void)(*instance.enabled)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrEventDataSpaceSetStatusCompleteFB.enabled)) == 4, "XrEventDataSpaceSetStatusCompleteFB.enabled has unexpected size % instead of 4", size_of(type_of(XrEventDataSpaceSetStatusCompleteFB.enabled)));
    assert(size_of(XrEventDataSpaceSetStatusCompleteFB) == 64, "XrEventDataSpaceSetStatusCompleteFB has size % instead of 64", size_of(XrEventDataSpaceSetStatusCompleteFB));
}

PFN_xrCreateSpatialAnchorFB :: #type (a0: XrSession, a1: *XrSpatialAnchorCreateInfoFB, a2: *XrAsyncRequestIdFB) -> XrResult #c_call;
PFN_xrGetSpaceUuidFB :: #type (a0: XrSpace, a1: *XrUuidEXT) -> XrResult #c_call;
PFN_xrEnumerateSpaceSupportedComponentsFB :: #type (a0: XrSpace, a1: u32, a2: *u32, a3: *XrSpaceComponentTypeFB) -> XrResult #c_call;
PFN_xrSetSpaceComponentStatusFB :: #type (a0: XrSpace, a1: *XrSpaceComponentStatusSetInfoFB, a2: *XrAsyncRequestIdFB) -> XrResult #c_call;
PFN_xrGetSpaceComponentStatusFB :: #type (a0: XrSpace, a1: XrSpaceComponentTypeFB, a2: *XrSpaceComponentStatusFB) -> XrResult #c_call;

XrFoveationProfileFB_T :: struct {}
XrFoveationProfileFB :: *XrFoveationProfileFB_T;

XrSwapchainCreateFoveationFlagsFB :: XrFlags64;

// Flag bits for XrSwapchainCreateFoveationFlagsFB
XR_SWAPCHAIN_CREATE_FOVEATION_SCALED_BIN_BIT_FB: XrSwapchainCreateFoveationFlagsFB : 1;
XR_SWAPCHAIN_CREATE_FOVEATION_FRAGMENT_DENSITY_MAP_BIT_FB: XrSwapchainCreateFoveationFlagsFB : 2;

XrSwapchainStateFoveationFlagsFB :: XrFlags64;

// Flag bits for XrSwapchainStateFoveationFlagsFB
XrFoveationProfileCreateInfoFB :: struct {
    type: XrStructureType;
    next: *void;
}
#run {
    instance: XrFoveationProfileCreateInfoFB;
    assert(((cast(*void)(*instance.type)) - cast(*void)(*instance)) == 0, "XrFoveationProfileCreateInfoFB.type has unexpected offset % instead of 0", ((cast(*void)(*instance.type)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrFoveationProfileCreateInfoFB.type)) == 4, "XrFoveationProfileCreateInfoFB.type has unexpected size % instead of 4", size_of(type_of(XrFoveationProfileCreateInfoFB.type)));
    assert(((cast(*void)(*instance.next)) - cast(*void)(*instance)) == 8, "XrFoveationProfileCreateInfoFB.next has unexpected offset % instead of 8", ((cast(*void)(*instance.next)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrFoveationProfileCreateInfoFB.next)) == 8, "XrFoveationProfileCreateInfoFB.next has unexpected size % instead of 8", size_of(type_of(XrFoveationProfileCreateInfoFB.next)));
    assert(size_of(XrFoveationProfileCreateInfoFB) == 16, "XrFoveationProfileCreateInfoFB has size % instead of 16", size_of(XrFoveationProfileCreateInfoFB));
}

// XrSwapchainCreateInfoFoveationFB extends XrSwapchainCreateInfo
XrSwapchainCreateInfoFoveationFB :: struct {
    type:  XrStructureType;
    next:  *void;
    flags: XrSwapchainCreateFoveationFlagsFB;
}
#run {
    instance: XrSwapchainCreateInfoFoveationFB;
    assert(((cast(*void)(*instance.type)) - cast(*void)(*instance)) == 0, "XrSwapchainCreateInfoFoveationFB.type has unexpected offset % instead of 0", ((cast(*void)(*instance.type)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrSwapchainCreateInfoFoveationFB.type)) == 4, "XrSwapchainCreateInfoFoveationFB.type has unexpected size % instead of 4", size_of(type_of(XrSwapchainCreateInfoFoveationFB.type)));
    assert(((cast(*void)(*instance.next)) - cast(*void)(*instance)) == 8, "XrSwapchainCreateInfoFoveationFB.next has unexpected offset % instead of 8", ((cast(*void)(*instance.next)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrSwapchainCreateInfoFoveationFB.next)) == 8, "XrSwapchainCreateInfoFoveationFB.next has unexpected size % instead of 8", size_of(type_of(XrSwapchainCreateInfoFoveationFB.next)));
    assert(((cast(*void)(*instance.flags)) - cast(*void)(*instance)) == 16, "XrSwapchainCreateInfoFoveationFB.flags has unexpected offset % instead of 16", ((cast(*void)(*instance.flags)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrSwapchainCreateInfoFoveationFB.flags)) == 8, "XrSwapchainCreateInfoFoveationFB.flags has unexpected size % instead of 8", size_of(type_of(XrSwapchainCreateInfoFoveationFB.flags)));
    assert(size_of(XrSwapchainCreateInfoFoveationFB) == 24, "XrSwapchainCreateInfoFoveationFB has size % instead of 24", size_of(XrSwapchainCreateInfoFoveationFB));
}

XrSwapchainStateFoveationFB :: struct {
    type:    XrStructureType;
    next:    *void;
    flags:   XrSwapchainStateFoveationFlagsFB;
    profile: XrFoveationProfileFB;
}
#run {
    instance: XrSwapchainStateFoveationFB;
    assert(((cast(*void)(*instance.type)) - cast(*void)(*instance)) == 0, "XrSwapchainStateFoveationFB.type has unexpected offset % instead of 0", ((cast(*void)(*instance.type)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrSwapchainStateFoveationFB.type)) == 4, "XrSwapchainStateFoveationFB.type has unexpected size % instead of 4", size_of(type_of(XrSwapchainStateFoveationFB.type)));
    assert(((cast(*void)(*instance.next)) - cast(*void)(*instance)) == 8, "XrSwapchainStateFoveationFB.next has unexpected offset % instead of 8", ((cast(*void)(*instance.next)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrSwapchainStateFoveationFB.next)) == 8, "XrSwapchainStateFoveationFB.next has unexpected size % instead of 8", size_of(type_of(XrSwapchainStateFoveationFB.next)));
    assert(((cast(*void)(*instance.flags)) - cast(*void)(*instance)) == 16, "XrSwapchainStateFoveationFB.flags has unexpected offset % instead of 16", ((cast(*void)(*instance.flags)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrSwapchainStateFoveationFB.flags)) == 8, "XrSwapchainStateFoveationFB.flags has unexpected size % instead of 8", size_of(type_of(XrSwapchainStateFoveationFB.flags)));
    assert(((cast(*void)(*instance.profile)) - cast(*void)(*instance)) == 24, "XrSwapchainStateFoveationFB.profile has unexpected offset % instead of 24", ((cast(*void)(*instance.profile)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrSwapchainStateFoveationFB.profile)) == 8, "XrSwapchainStateFoveationFB.profile has unexpected size % instead of 8", size_of(type_of(XrSwapchainStateFoveationFB.profile)));
    assert(size_of(XrSwapchainStateFoveationFB) == 32, "XrSwapchainStateFoveationFB has size % instead of 32", size_of(XrSwapchainStateFoveationFB));
}

PFN_xrCreateFoveationProfileFB :: #type (a0: XrSession, a1: *XrFoveationProfileCreateInfoFB, a2: *XrFoveationProfileFB) -> XrResult #c_call;
PFN_xrDestroyFoveationProfileFB :: #type (a0: XrFoveationProfileFB) -> XrResult #c_call;

XrFoveationLevelFB :: enum s32 {
    NONE_FB     :: 0;
    LOW_FB      :: 1;
    MEDIUM_FB   :: 2;
    HIGH_FB     :: 3;
    MAX_ENUM_FB :: 2147483647;

    XR_FOVEATION_LEVEL_NONE_FB     :: NONE_FB;
    XR_FOVEATION_LEVEL_LOW_FB      :: LOW_FB;
    XR_FOVEATION_LEVEL_MEDIUM_FB   :: MEDIUM_FB;
    XR_FOVEATION_LEVEL_HIGH_FB     :: HIGH_FB;
    XR_FOVEATION_LEVEL_MAX_ENUM_FB :: MAX_ENUM_FB;
}

XrFoveationDynamicFB :: enum s32 {
    DISABLED_FB      :: 0;
    LEVEL_ENABLED_FB :: 1;
    MAX_ENUM_FB      :: 2147483647;

    XR_FOVEATION_DYNAMIC_DISABLED_FB      :: DISABLED_FB;
    XR_FOVEATION_DYNAMIC_LEVEL_ENABLED_FB :: LEVEL_ENABLED_FB;
    XR_FOVEATION_DYNAMIC_MAX_ENUM_FB      :: MAX_ENUM_FB;
}

// XrFoveationLevelProfileCreateInfoFB extends XrFoveationProfileCreateInfoFB
XrFoveationLevelProfileCreateInfoFB :: struct {
    type:           XrStructureType;
    next:           *void;
    level:          XrFoveationLevelFB;
    verticalOffset: float;
    dynamic:        XrFoveationDynamicFB;
}
#run {
    instance: XrFoveationLevelProfileCreateInfoFB;
    assert(((cast(*void)(*instance.type)) - cast(*void)(*instance)) == 0, "XrFoveationLevelProfileCreateInfoFB.type has unexpected offset % instead of 0", ((cast(*void)(*instance.type)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrFoveationLevelProfileCreateInfoFB.type)) == 4, "XrFoveationLevelProfileCreateInfoFB.type has unexpected size % instead of 4", size_of(type_of(XrFoveationLevelProfileCreateInfoFB.type)));
    assert(((cast(*void)(*instance.next)) - cast(*void)(*instance)) == 8, "XrFoveationLevelProfileCreateInfoFB.next has unexpected offset % instead of 8", ((cast(*void)(*instance.next)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrFoveationLevelProfileCreateInfoFB.next)) == 8, "XrFoveationLevelProfileCreateInfoFB.next has unexpected size % instead of 8", size_of(type_of(XrFoveationLevelProfileCreateInfoFB.next)));
    assert(((cast(*void)(*instance.level)) - cast(*void)(*instance)) == 16, "XrFoveationLevelProfileCreateInfoFB.level has unexpected offset % instead of 16", ((cast(*void)(*instance.level)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrFoveationLevelProfileCreateInfoFB.level)) == 4, "XrFoveationLevelProfileCreateInfoFB.level has unexpected size % instead of 4", size_of(type_of(XrFoveationLevelProfileCreateInfoFB.level)));
    assert(((cast(*void)(*instance.verticalOffset)) - cast(*void)(*instance)) == 20, "XrFoveationLevelProfileCreateInfoFB.verticalOffset has unexpected offset % instead of 20", ((cast(*void)(*instance.verticalOffset)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrFoveationLevelProfileCreateInfoFB.verticalOffset)) == 4, "XrFoveationLevelProfileCreateInfoFB.verticalOffset has unexpected size % instead of 4", size_of(type_of(XrFoveationLevelProfileCreateInfoFB.verticalOffset)));
    assert(((cast(*void)(*instance.dynamic)) - cast(*void)(*instance)) == 24, "XrFoveationLevelProfileCreateInfoFB.dynamic has unexpected offset % instead of 24", ((cast(*void)(*instance.dynamic)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrFoveationLevelProfileCreateInfoFB.dynamic)) == 4, "XrFoveationLevelProfileCreateInfoFB.dynamic has unexpected size % instead of 4", size_of(type_of(XrFoveationLevelProfileCreateInfoFB.dynamic)));
    assert(size_of(XrFoveationLevelProfileCreateInfoFB) == 32, "XrFoveationLevelProfileCreateInfoFB has size % instead of 32", size_of(XrFoveationLevelProfileCreateInfoFB));
}

XrKeyboardTrackingFlagsFB :: XrFlags64;

// Flag bits for XrKeyboardTrackingFlagsFB
XR_KEYBOARD_TRACKING_EXISTS_BIT_FB: XrKeyboardTrackingFlagsFB : 1;
XR_KEYBOARD_TRACKING_LOCAL_BIT_FB: XrKeyboardTrackingFlagsFB : 2;
XR_KEYBOARD_TRACKING_REMOTE_BIT_FB: XrKeyboardTrackingFlagsFB : 4;
XR_KEYBOARD_TRACKING_CONNECTED_BIT_FB: XrKeyboardTrackingFlagsFB : 8;

XrKeyboardTrackingQueryFlagsFB :: XrFlags64;

// Flag bits for XrKeyboardTrackingQueryFlagsFB
XR_KEYBOARD_TRACKING_QUERY_LOCAL_BIT_FB: XrKeyboardTrackingQueryFlagsFB : 2;
XR_KEYBOARD_TRACKING_QUERY_REMOTE_BIT_FB: XrKeyboardTrackingQueryFlagsFB : 4;

// XrSystemKeyboardTrackingPropertiesFB extends XrSystemProperties
XrSystemKeyboardTrackingPropertiesFB :: struct {
    type:                     XrStructureType;
    next:                     *void;
    supportsKeyboardTracking: XrBool32;
}
#run {
    instance: XrSystemKeyboardTrackingPropertiesFB;
    assert(((cast(*void)(*instance.type)) - cast(*void)(*instance)) == 0, "XrSystemKeyboardTrackingPropertiesFB.type has unexpected offset % instead of 0", ((cast(*void)(*instance.type)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrSystemKeyboardTrackingPropertiesFB.type)) == 4, "XrSystemKeyboardTrackingPropertiesFB.type has unexpected size % instead of 4", size_of(type_of(XrSystemKeyboardTrackingPropertiesFB.type)));
    assert(((cast(*void)(*instance.next)) - cast(*void)(*instance)) == 8, "XrSystemKeyboardTrackingPropertiesFB.next has unexpected offset % instead of 8", ((cast(*void)(*instance.next)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrSystemKeyboardTrackingPropertiesFB.next)) == 8, "XrSystemKeyboardTrackingPropertiesFB.next has unexpected size % instead of 8", size_of(type_of(XrSystemKeyboardTrackingPropertiesFB.next)));
    assert(((cast(*void)(*instance.supportsKeyboardTracking)) - cast(*void)(*instance)) == 16, "XrSystemKeyboardTrackingPropertiesFB.supportsKeyboardTracking has unexpected offset % instead of 16", ((cast(*void)(*instance.supportsKeyboardTracking)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrSystemKeyboardTrackingPropertiesFB.supportsKeyboardTracking)) == 4, "XrSystemKeyboardTrackingPropertiesFB.supportsKeyboardTracking has unexpected size % instead of 4", size_of(type_of(XrSystemKeyboardTrackingPropertiesFB.supportsKeyboardTracking)));
    assert(size_of(XrSystemKeyboardTrackingPropertiesFB) == 24, "XrSystemKeyboardTrackingPropertiesFB has size % instead of 24", size_of(XrSystemKeyboardTrackingPropertiesFB));
}

XrKeyboardTrackingDescriptionFB :: struct {
    trackedKeyboardId: u64;
    size:              XrVector3f;
    flags:             XrKeyboardTrackingFlagsFB;
    name:              [128] u8;
}
#run {
    instance: XrKeyboardTrackingDescriptionFB;
    assert(((cast(*void)(*instance.trackedKeyboardId)) - cast(*void)(*instance)) == 0, "XrKeyboardTrackingDescriptionFB.trackedKeyboardId has unexpected offset % instead of 0", ((cast(*void)(*instance.trackedKeyboardId)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrKeyboardTrackingDescriptionFB.trackedKeyboardId)) == 8, "XrKeyboardTrackingDescriptionFB.trackedKeyboardId has unexpected size % instead of 8", size_of(type_of(XrKeyboardTrackingDescriptionFB.trackedKeyboardId)));
    assert(((cast(*void)(*instance.size)) - cast(*void)(*instance)) == 8, "XrKeyboardTrackingDescriptionFB.size has unexpected offset % instead of 8", ((cast(*void)(*instance.size)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrKeyboardTrackingDescriptionFB.size)) == 12, "XrKeyboardTrackingDescriptionFB.size has unexpected size % instead of 12", size_of(type_of(XrKeyboardTrackingDescriptionFB.size)));
    assert(((cast(*void)(*instance.flags)) - cast(*void)(*instance)) == 24, "XrKeyboardTrackingDescriptionFB.flags has unexpected offset % instead of 24", ((cast(*void)(*instance.flags)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrKeyboardTrackingDescriptionFB.flags)) == 8, "XrKeyboardTrackingDescriptionFB.flags has unexpected size % instead of 8", size_of(type_of(XrKeyboardTrackingDescriptionFB.flags)));
    assert(((cast(*void)(*instance.name)) - cast(*void)(*instance)) == 32, "XrKeyboardTrackingDescriptionFB.name has unexpected offset % instead of 32", ((cast(*void)(*instance.name)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrKeyboardTrackingDescriptionFB.name)) == 128, "XrKeyboardTrackingDescriptionFB.name has unexpected size % instead of 128", size_of(type_of(XrKeyboardTrackingDescriptionFB.name)));
    assert(size_of(XrKeyboardTrackingDescriptionFB) == 160, "XrKeyboardTrackingDescriptionFB has size % instead of 160", size_of(XrKeyboardTrackingDescriptionFB));
}

XrKeyboardSpaceCreateInfoFB :: struct {
    type:              XrStructureType;
    next:              *void;
    trackedKeyboardId: u64;
}
#run {
    instance: XrKeyboardSpaceCreateInfoFB;
    assert(((cast(*void)(*instance.type)) - cast(*void)(*instance)) == 0, "XrKeyboardSpaceCreateInfoFB.type has unexpected offset % instead of 0", ((cast(*void)(*instance.type)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrKeyboardSpaceCreateInfoFB.type)) == 4, "XrKeyboardSpaceCreateInfoFB.type has unexpected size % instead of 4", size_of(type_of(XrKeyboardSpaceCreateInfoFB.type)));
    assert(((cast(*void)(*instance.next)) - cast(*void)(*instance)) == 8, "XrKeyboardSpaceCreateInfoFB.next has unexpected offset % instead of 8", ((cast(*void)(*instance.next)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrKeyboardSpaceCreateInfoFB.next)) == 8, "XrKeyboardSpaceCreateInfoFB.next has unexpected size % instead of 8", size_of(type_of(XrKeyboardSpaceCreateInfoFB.next)));
    assert(((cast(*void)(*instance.trackedKeyboardId)) - cast(*void)(*instance)) == 16, "XrKeyboardSpaceCreateInfoFB.trackedKeyboardId has unexpected offset % instead of 16", ((cast(*void)(*instance.trackedKeyboardId)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrKeyboardSpaceCreateInfoFB.trackedKeyboardId)) == 8, "XrKeyboardSpaceCreateInfoFB.trackedKeyboardId has unexpected size % instead of 8", size_of(type_of(XrKeyboardSpaceCreateInfoFB.trackedKeyboardId)));
    assert(size_of(XrKeyboardSpaceCreateInfoFB) == 24, "XrKeyboardSpaceCreateInfoFB has size % instead of 24", size_of(XrKeyboardSpaceCreateInfoFB));
}

XrKeyboardTrackingQueryFB :: struct {
    type:  XrStructureType;
    next:  *void;
    flags: XrKeyboardTrackingQueryFlagsFB;
}
#run {
    instance: XrKeyboardTrackingQueryFB;
    assert(((cast(*void)(*instance.type)) - cast(*void)(*instance)) == 0, "XrKeyboardTrackingQueryFB.type has unexpected offset % instead of 0", ((cast(*void)(*instance.type)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrKeyboardTrackingQueryFB.type)) == 4, "XrKeyboardTrackingQueryFB.type has unexpected size % instead of 4", size_of(type_of(XrKeyboardTrackingQueryFB.type)));
    assert(((cast(*void)(*instance.next)) - cast(*void)(*instance)) == 8, "XrKeyboardTrackingQueryFB.next has unexpected offset % instead of 8", ((cast(*void)(*instance.next)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrKeyboardTrackingQueryFB.next)) == 8, "XrKeyboardTrackingQueryFB.next has unexpected size % instead of 8", size_of(type_of(XrKeyboardTrackingQueryFB.next)));
    assert(((cast(*void)(*instance.flags)) - cast(*void)(*instance)) == 16, "XrKeyboardTrackingQueryFB.flags has unexpected offset % instead of 16", ((cast(*void)(*instance.flags)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrKeyboardTrackingQueryFB.flags)) == 8, "XrKeyboardTrackingQueryFB.flags has unexpected size % instead of 8", size_of(type_of(XrKeyboardTrackingQueryFB.flags)));
    assert(size_of(XrKeyboardTrackingQueryFB) == 24, "XrKeyboardTrackingQueryFB has size % instead of 24", size_of(XrKeyboardTrackingQueryFB));
}

PFN_xrQuerySystemTrackedKeyboardFB :: #type (a0: XrSession, a1: *XrKeyboardTrackingQueryFB, a2: *XrKeyboardTrackingDescriptionFB) -> XrResult #c_call;
PFN_xrCreateKeyboardSpaceFB :: #type (a0: XrSession, a1: *XrKeyboardSpaceCreateInfoFB, a2: *XrSpace) -> XrResult #c_call;

XrTriangleMeshFB_T :: struct {}
XrTriangleMeshFB :: *XrTriangleMeshFB_T;

XrWindingOrderFB :: enum s32 {
    UNKNOWN_FB  :: 0;
    CW_FB       :: 1;
    CCW_FB      :: 2;
    MAX_ENUM_FB :: 2147483647;

    XR_WINDING_ORDER_UNKNOWN_FB  :: UNKNOWN_FB;
    XR_WINDING_ORDER_CW_FB       :: CW_FB;
    XR_WINDING_ORDER_CCW_FB      :: CCW_FB;
    XR_WINDING_ORDER_MAX_ENUM_FB :: MAX_ENUM_FB;
}

XrTriangleMeshFlagsFB :: XrFlags64;

// Flag bits for XrTriangleMeshFlagsFB
XR_TRIANGLE_MESH_MUTABLE_BIT_FB: XrTriangleMeshFlagsFB : 1;

XrTriangleMeshCreateInfoFB :: struct {
    type:          XrStructureType;
    next:          *void;
    flags:         XrTriangleMeshFlagsFB;
    windingOrder:  XrWindingOrderFB;
    vertexCount:   u32;
    vertexBuffer:  *XrVector3f;
    triangleCount: u32;
    indexBuffer:   *u32;
}
#run {
    instance: XrTriangleMeshCreateInfoFB;
    assert(((cast(*void)(*instance.type)) - cast(*void)(*instance)) == 0, "XrTriangleMeshCreateInfoFB.type has unexpected offset % instead of 0", ((cast(*void)(*instance.type)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrTriangleMeshCreateInfoFB.type)) == 4, "XrTriangleMeshCreateInfoFB.type has unexpected size % instead of 4", size_of(type_of(XrTriangleMeshCreateInfoFB.type)));
    assert(((cast(*void)(*instance.next)) - cast(*void)(*instance)) == 8, "XrTriangleMeshCreateInfoFB.next has unexpected offset % instead of 8", ((cast(*void)(*instance.next)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrTriangleMeshCreateInfoFB.next)) == 8, "XrTriangleMeshCreateInfoFB.next has unexpected size % instead of 8", size_of(type_of(XrTriangleMeshCreateInfoFB.next)));
    assert(((cast(*void)(*instance.flags)) - cast(*void)(*instance)) == 16, "XrTriangleMeshCreateInfoFB.flags has unexpected offset % instead of 16", ((cast(*void)(*instance.flags)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrTriangleMeshCreateInfoFB.flags)) == 8, "XrTriangleMeshCreateInfoFB.flags has unexpected size % instead of 8", size_of(type_of(XrTriangleMeshCreateInfoFB.flags)));
    assert(((cast(*void)(*instance.windingOrder)) - cast(*void)(*instance)) == 24, "XrTriangleMeshCreateInfoFB.windingOrder has unexpected offset % instead of 24", ((cast(*void)(*instance.windingOrder)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrTriangleMeshCreateInfoFB.windingOrder)) == 4, "XrTriangleMeshCreateInfoFB.windingOrder has unexpected size % instead of 4", size_of(type_of(XrTriangleMeshCreateInfoFB.windingOrder)));
    assert(((cast(*void)(*instance.vertexCount)) - cast(*void)(*instance)) == 28, "XrTriangleMeshCreateInfoFB.vertexCount has unexpected offset % instead of 28", ((cast(*void)(*instance.vertexCount)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrTriangleMeshCreateInfoFB.vertexCount)) == 4, "XrTriangleMeshCreateInfoFB.vertexCount has unexpected size % instead of 4", size_of(type_of(XrTriangleMeshCreateInfoFB.vertexCount)));
    assert(((cast(*void)(*instance.vertexBuffer)) - cast(*void)(*instance)) == 32, "XrTriangleMeshCreateInfoFB.vertexBuffer has unexpected offset % instead of 32", ((cast(*void)(*instance.vertexBuffer)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrTriangleMeshCreateInfoFB.vertexBuffer)) == 8, "XrTriangleMeshCreateInfoFB.vertexBuffer has unexpected size % instead of 8", size_of(type_of(XrTriangleMeshCreateInfoFB.vertexBuffer)));
    assert(((cast(*void)(*instance.triangleCount)) - cast(*void)(*instance)) == 40, "XrTriangleMeshCreateInfoFB.triangleCount has unexpected offset % instead of 40", ((cast(*void)(*instance.triangleCount)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrTriangleMeshCreateInfoFB.triangleCount)) == 4, "XrTriangleMeshCreateInfoFB.triangleCount has unexpected size % instead of 4", size_of(type_of(XrTriangleMeshCreateInfoFB.triangleCount)));
    assert(((cast(*void)(*instance.indexBuffer)) - cast(*void)(*instance)) == 48, "XrTriangleMeshCreateInfoFB.indexBuffer has unexpected offset % instead of 48", ((cast(*void)(*instance.indexBuffer)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrTriangleMeshCreateInfoFB.indexBuffer)) == 8, "XrTriangleMeshCreateInfoFB.indexBuffer has unexpected size % instead of 8", size_of(type_of(XrTriangleMeshCreateInfoFB.indexBuffer)));
    assert(size_of(XrTriangleMeshCreateInfoFB) == 56, "XrTriangleMeshCreateInfoFB has size % instead of 56", size_of(XrTriangleMeshCreateInfoFB));
}

PFN_xrCreateTriangleMeshFB :: #type (a0: XrSession, a1: *XrTriangleMeshCreateInfoFB, a2: *XrTriangleMeshFB) -> XrResult #c_call;
PFN_xrDestroyTriangleMeshFB :: #type (a0: XrTriangleMeshFB) -> XrResult #c_call;
PFN_xrTriangleMeshGetVertexBufferFB :: #type (a0: XrTriangleMeshFB, a1: **XrVector3f) -> XrResult #c_call;
PFN_xrTriangleMeshGetIndexBufferFB :: #type (a0: XrTriangleMeshFB, a1: **u32) -> XrResult #c_call;
PFN_xrTriangleMeshBeginUpdateFB :: #type (a0: XrTriangleMeshFB) -> XrResult #c_call;
PFN_xrTriangleMeshEndUpdateFB :: #type (a0: XrTriangleMeshFB, a1: u32, a2: u32) -> XrResult #c_call;
PFN_xrTriangleMeshBeginVertexBufferUpdateFB :: #type (a0: XrTriangleMeshFB, a1: *u32) -> XrResult #c_call;
PFN_xrTriangleMeshEndVertexBufferUpdateFB :: #type (a0: XrTriangleMeshFB) -> XrResult #c_call;

XrPassthroughFB_T :: struct {}
XrPassthroughFB :: *XrPassthroughFB_T;
XrPassthroughLayerFB_T :: struct {}
XrPassthroughLayerFB :: *XrPassthroughLayerFB_T;
XrGeometryInstanceFB_T :: struct {}
XrGeometryInstanceFB :: *XrGeometryInstanceFB_T;

XrPassthroughLayerPurposeFB :: enum s32 {
    RECONSTRUCTION_FB                :: 0;
    PROJECTED_FB                     :: 1;
    TRACKED_KEYBOARD_HANDS_FB        :: 1000203001;
    TRACKED_KEYBOARD_MASKED_HANDS_FB :: 1000203002;
    MAX_ENUM_FB                      :: 2147483647;

    XR_PASSTHROUGH_LAYER_PURPOSE_RECONSTRUCTION_FB                :: RECONSTRUCTION_FB;
    XR_PASSTHROUGH_LAYER_PURPOSE_PROJECTED_FB                     :: PROJECTED_FB;
    XR_PASSTHROUGH_LAYER_PURPOSE_TRACKED_KEYBOARD_HANDS_FB        :: TRACKED_KEYBOARD_HANDS_FB;
    XR_PASSTHROUGH_LAYER_PURPOSE_TRACKED_KEYBOARD_MASKED_HANDS_FB :: TRACKED_KEYBOARD_MASKED_HANDS_FB;
    XR_PASSTHROUGH_LAYER_PURPOSE_MAX_ENUM_FB                      :: MAX_ENUM_FB;
}

XrPassthroughFlagsFB :: XrFlags64;

// Flag bits for XrPassthroughFlagsFB
XR_PASSTHROUGH_IS_RUNNING_AT_CREATION_BIT_FB: XrPassthroughFlagsFB : 1;

XrPassthroughStateChangedFlagsFB :: XrFlags64;

// Flag bits for XrPassthroughStateChangedFlagsFB
XR_PASSTHROUGH_STATE_CHANGED_REINIT_REQUIRED_BIT_FB: XrPassthroughStateChangedFlagsFB : 1;
XR_PASSTHROUGH_STATE_CHANGED_NON_RECOVERABLE_ERROR_BIT_FB: XrPassthroughStateChangedFlagsFB : 2;
XR_PASSTHROUGH_STATE_CHANGED_RECOVERABLE_ERROR_BIT_FB: XrPassthroughStateChangedFlagsFB : 4;
XR_PASSTHROUGH_STATE_CHANGED_RESTORED_ERROR_BIT_FB: XrPassthroughStateChangedFlagsFB : 8;

// XrSystemPassthroughPropertiesFB extends XrSystemProperties
XrSystemPassthroughPropertiesFB :: struct {
    type:                XrStructureType;
    next:                *void;
    supportsPassthrough: XrBool32;
}
#run {
    instance: XrSystemPassthroughPropertiesFB;
    assert(((cast(*void)(*instance.type)) - cast(*void)(*instance)) == 0, "XrSystemPassthroughPropertiesFB.type has unexpected offset % instead of 0", ((cast(*void)(*instance.type)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrSystemPassthroughPropertiesFB.type)) == 4, "XrSystemPassthroughPropertiesFB.type has unexpected size % instead of 4", size_of(type_of(XrSystemPassthroughPropertiesFB.type)));
    assert(((cast(*void)(*instance.next)) - cast(*void)(*instance)) == 8, "XrSystemPassthroughPropertiesFB.next has unexpected offset % instead of 8", ((cast(*void)(*instance.next)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrSystemPassthroughPropertiesFB.next)) == 8, "XrSystemPassthroughPropertiesFB.next has unexpected size % instead of 8", size_of(type_of(XrSystemPassthroughPropertiesFB.next)));
    assert(((cast(*void)(*instance.supportsPassthrough)) - cast(*void)(*instance)) == 16, "XrSystemPassthroughPropertiesFB.supportsPassthrough has unexpected offset % instead of 16", ((cast(*void)(*instance.supportsPassthrough)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrSystemPassthroughPropertiesFB.supportsPassthrough)) == 4, "XrSystemPassthroughPropertiesFB.supportsPassthrough has unexpected size % instead of 4", size_of(type_of(XrSystemPassthroughPropertiesFB.supportsPassthrough)));
    assert(size_of(XrSystemPassthroughPropertiesFB) == 24, "XrSystemPassthroughPropertiesFB has size % instead of 24", size_of(XrSystemPassthroughPropertiesFB));
}

XrPassthroughCreateInfoFB :: struct {
    type:  XrStructureType;
    next:  *void;
    flags: XrPassthroughFlagsFB;
}
#run {
    instance: XrPassthroughCreateInfoFB;
    assert(((cast(*void)(*instance.type)) - cast(*void)(*instance)) == 0, "XrPassthroughCreateInfoFB.type has unexpected offset % instead of 0", ((cast(*void)(*instance.type)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrPassthroughCreateInfoFB.type)) == 4, "XrPassthroughCreateInfoFB.type has unexpected size % instead of 4", size_of(type_of(XrPassthroughCreateInfoFB.type)));
    assert(((cast(*void)(*instance.next)) - cast(*void)(*instance)) == 8, "XrPassthroughCreateInfoFB.next has unexpected offset % instead of 8", ((cast(*void)(*instance.next)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrPassthroughCreateInfoFB.next)) == 8, "XrPassthroughCreateInfoFB.next has unexpected size % instead of 8", size_of(type_of(XrPassthroughCreateInfoFB.next)));
    assert(((cast(*void)(*instance.flags)) - cast(*void)(*instance)) == 16, "XrPassthroughCreateInfoFB.flags has unexpected offset % instead of 16", ((cast(*void)(*instance.flags)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrPassthroughCreateInfoFB.flags)) == 8, "XrPassthroughCreateInfoFB.flags has unexpected size % instead of 8", size_of(type_of(XrPassthroughCreateInfoFB.flags)));
    assert(size_of(XrPassthroughCreateInfoFB) == 24, "XrPassthroughCreateInfoFB has size % instead of 24", size_of(XrPassthroughCreateInfoFB));
}

XrPassthroughLayerCreateInfoFB :: struct {
    type:        XrStructureType;
    next:        *void;
    passthrough: XrPassthroughFB;
    flags:       XrPassthroughFlagsFB;
    purpose:     XrPassthroughLayerPurposeFB;
}
#run {
    instance: XrPassthroughLayerCreateInfoFB;
    assert(((cast(*void)(*instance.type)) - cast(*void)(*instance)) == 0, "XrPassthroughLayerCreateInfoFB.type has unexpected offset % instead of 0", ((cast(*void)(*instance.type)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrPassthroughLayerCreateInfoFB.type)) == 4, "XrPassthroughLayerCreateInfoFB.type has unexpected size % instead of 4", size_of(type_of(XrPassthroughLayerCreateInfoFB.type)));
    assert(((cast(*void)(*instance.next)) - cast(*void)(*instance)) == 8, "XrPassthroughLayerCreateInfoFB.next has unexpected offset % instead of 8", ((cast(*void)(*instance.next)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrPassthroughLayerCreateInfoFB.next)) == 8, "XrPassthroughLayerCreateInfoFB.next has unexpected size % instead of 8", size_of(type_of(XrPassthroughLayerCreateInfoFB.next)));
    assert(((cast(*void)(*instance.passthrough)) - cast(*void)(*instance)) == 16, "XrPassthroughLayerCreateInfoFB.passthrough has unexpected offset % instead of 16", ((cast(*void)(*instance.passthrough)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrPassthroughLayerCreateInfoFB.passthrough)) == 8, "XrPassthroughLayerCreateInfoFB.passthrough has unexpected size % instead of 8", size_of(type_of(XrPassthroughLayerCreateInfoFB.passthrough)));
    assert(((cast(*void)(*instance.flags)) - cast(*void)(*instance)) == 24, "XrPassthroughLayerCreateInfoFB.flags has unexpected offset % instead of 24", ((cast(*void)(*instance.flags)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrPassthroughLayerCreateInfoFB.flags)) == 8, "XrPassthroughLayerCreateInfoFB.flags has unexpected size % instead of 8", size_of(type_of(XrPassthroughLayerCreateInfoFB.flags)));
    assert(((cast(*void)(*instance.purpose)) - cast(*void)(*instance)) == 32, "XrPassthroughLayerCreateInfoFB.purpose has unexpected offset % instead of 32", ((cast(*void)(*instance.purpose)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrPassthroughLayerCreateInfoFB.purpose)) == 4, "XrPassthroughLayerCreateInfoFB.purpose has unexpected size % instead of 4", size_of(type_of(XrPassthroughLayerCreateInfoFB.purpose)));
    assert(size_of(XrPassthroughLayerCreateInfoFB) == 40, "XrPassthroughLayerCreateInfoFB has size % instead of 40", size_of(XrPassthroughLayerCreateInfoFB));
}

// XrCompositionLayerPassthroughFB extends XrCompositionLayerBaseHeader
XrCompositionLayerPassthroughFB :: struct {
    type:        XrStructureType;
    next:        *void;
    flags:       XrCompositionLayerFlags;
    space:       XrSpace;
    layerHandle: XrPassthroughLayerFB;
}
#run {
    instance: XrCompositionLayerPassthroughFB;
    assert(((cast(*void)(*instance.type)) - cast(*void)(*instance)) == 0, "XrCompositionLayerPassthroughFB.type has unexpected offset % instead of 0", ((cast(*void)(*instance.type)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrCompositionLayerPassthroughFB.type)) == 4, "XrCompositionLayerPassthroughFB.type has unexpected size % instead of 4", size_of(type_of(XrCompositionLayerPassthroughFB.type)));
    assert(((cast(*void)(*instance.next)) - cast(*void)(*instance)) == 8, "XrCompositionLayerPassthroughFB.next has unexpected offset % instead of 8", ((cast(*void)(*instance.next)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrCompositionLayerPassthroughFB.next)) == 8, "XrCompositionLayerPassthroughFB.next has unexpected size % instead of 8", size_of(type_of(XrCompositionLayerPassthroughFB.next)));
    assert(((cast(*void)(*instance.flags)) - cast(*void)(*instance)) == 16, "XrCompositionLayerPassthroughFB.flags has unexpected offset % instead of 16", ((cast(*void)(*instance.flags)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrCompositionLayerPassthroughFB.flags)) == 8, "XrCompositionLayerPassthroughFB.flags has unexpected size % instead of 8", size_of(type_of(XrCompositionLayerPassthroughFB.flags)));
    assert(((cast(*void)(*instance.space)) - cast(*void)(*instance)) == 24, "XrCompositionLayerPassthroughFB.space has unexpected offset % instead of 24", ((cast(*void)(*instance.space)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrCompositionLayerPassthroughFB.space)) == 8, "XrCompositionLayerPassthroughFB.space has unexpected size % instead of 8", size_of(type_of(XrCompositionLayerPassthroughFB.space)));
    assert(((cast(*void)(*instance.layerHandle)) - cast(*void)(*instance)) == 32, "XrCompositionLayerPassthroughFB.layerHandle has unexpected offset % instead of 32", ((cast(*void)(*instance.layerHandle)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrCompositionLayerPassthroughFB.layerHandle)) == 8, "XrCompositionLayerPassthroughFB.layerHandle has unexpected size % instead of 8", size_of(type_of(XrCompositionLayerPassthroughFB.layerHandle)));
    assert(size_of(XrCompositionLayerPassthroughFB) == 40, "XrCompositionLayerPassthroughFB has size % instead of 40", size_of(XrCompositionLayerPassthroughFB));
}

XrGeometryInstanceCreateInfoFB :: struct {
    type:      XrStructureType;
    next:      *void;
    layer:     XrPassthroughLayerFB;
    mesh:      XrTriangleMeshFB;
    baseSpace: XrSpace;
    pose:      XrPosef;
    scale:     XrVector3f;
}
#run {
    instance: XrGeometryInstanceCreateInfoFB;
    assert(((cast(*void)(*instance.type)) - cast(*void)(*instance)) == 0, "XrGeometryInstanceCreateInfoFB.type has unexpected offset % instead of 0", ((cast(*void)(*instance.type)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrGeometryInstanceCreateInfoFB.type)) == 4, "XrGeometryInstanceCreateInfoFB.type has unexpected size % instead of 4", size_of(type_of(XrGeometryInstanceCreateInfoFB.type)));
    assert(((cast(*void)(*instance.next)) - cast(*void)(*instance)) == 8, "XrGeometryInstanceCreateInfoFB.next has unexpected offset % instead of 8", ((cast(*void)(*instance.next)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrGeometryInstanceCreateInfoFB.next)) == 8, "XrGeometryInstanceCreateInfoFB.next has unexpected size % instead of 8", size_of(type_of(XrGeometryInstanceCreateInfoFB.next)));
    assert(((cast(*void)(*instance.layer)) - cast(*void)(*instance)) == 16, "XrGeometryInstanceCreateInfoFB.layer has unexpected offset % instead of 16", ((cast(*void)(*instance.layer)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrGeometryInstanceCreateInfoFB.layer)) == 8, "XrGeometryInstanceCreateInfoFB.layer has unexpected size % instead of 8", size_of(type_of(XrGeometryInstanceCreateInfoFB.layer)));
    assert(((cast(*void)(*instance.mesh)) - cast(*void)(*instance)) == 24, "XrGeometryInstanceCreateInfoFB.mesh has unexpected offset % instead of 24", ((cast(*void)(*instance.mesh)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrGeometryInstanceCreateInfoFB.mesh)) == 8, "XrGeometryInstanceCreateInfoFB.mesh has unexpected size % instead of 8", size_of(type_of(XrGeometryInstanceCreateInfoFB.mesh)));
    assert(((cast(*void)(*instance.baseSpace)) - cast(*void)(*instance)) == 32, "XrGeometryInstanceCreateInfoFB.baseSpace has unexpected offset % instead of 32", ((cast(*void)(*instance.baseSpace)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrGeometryInstanceCreateInfoFB.baseSpace)) == 8, "XrGeometryInstanceCreateInfoFB.baseSpace has unexpected size % instead of 8", size_of(type_of(XrGeometryInstanceCreateInfoFB.baseSpace)));
    assert(((cast(*void)(*instance.pose)) - cast(*void)(*instance)) == 40, "XrGeometryInstanceCreateInfoFB.pose has unexpected offset % instead of 40", ((cast(*void)(*instance.pose)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrGeometryInstanceCreateInfoFB.pose)) == 28, "XrGeometryInstanceCreateInfoFB.pose has unexpected size % instead of 28", size_of(type_of(XrGeometryInstanceCreateInfoFB.pose)));
    assert(((cast(*void)(*instance.scale)) - cast(*void)(*instance)) == 68, "XrGeometryInstanceCreateInfoFB.scale has unexpected offset % instead of 68", ((cast(*void)(*instance.scale)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrGeometryInstanceCreateInfoFB.scale)) == 12, "XrGeometryInstanceCreateInfoFB.scale has unexpected size % instead of 12", size_of(type_of(XrGeometryInstanceCreateInfoFB.scale)));
    assert(size_of(XrGeometryInstanceCreateInfoFB) == 80, "XrGeometryInstanceCreateInfoFB has size % instead of 80", size_of(XrGeometryInstanceCreateInfoFB));
}

XrGeometryInstanceTransformFB :: struct {
    type:      XrStructureType;
    next:      *void;
    baseSpace: XrSpace;
    time:      XrTime;
    pose:      XrPosef;
    scale:     XrVector3f;
}
#run {
    instance: XrGeometryInstanceTransformFB;
    assert(((cast(*void)(*instance.type)) - cast(*void)(*instance)) == 0, "XrGeometryInstanceTransformFB.type has unexpected offset % instead of 0", ((cast(*void)(*instance.type)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrGeometryInstanceTransformFB.type)) == 4, "XrGeometryInstanceTransformFB.type has unexpected size % instead of 4", size_of(type_of(XrGeometryInstanceTransformFB.type)));
    assert(((cast(*void)(*instance.next)) - cast(*void)(*instance)) == 8, "XrGeometryInstanceTransformFB.next has unexpected offset % instead of 8", ((cast(*void)(*instance.next)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrGeometryInstanceTransformFB.next)) == 8, "XrGeometryInstanceTransformFB.next has unexpected size % instead of 8", size_of(type_of(XrGeometryInstanceTransformFB.next)));
    assert(((cast(*void)(*instance.baseSpace)) - cast(*void)(*instance)) == 16, "XrGeometryInstanceTransformFB.baseSpace has unexpected offset % instead of 16", ((cast(*void)(*instance.baseSpace)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrGeometryInstanceTransformFB.baseSpace)) == 8, "XrGeometryInstanceTransformFB.baseSpace has unexpected size % instead of 8", size_of(type_of(XrGeometryInstanceTransformFB.baseSpace)));
    assert(((cast(*void)(*instance.time)) - cast(*void)(*instance)) == 24, "XrGeometryInstanceTransformFB.time has unexpected offset % instead of 24", ((cast(*void)(*instance.time)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrGeometryInstanceTransformFB.time)) == 8, "XrGeometryInstanceTransformFB.time has unexpected size % instead of 8", size_of(type_of(XrGeometryInstanceTransformFB.time)));
    assert(((cast(*void)(*instance.pose)) - cast(*void)(*instance)) == 32, "XrGeometryInstanceTransformFB.pose has unexpected offset % instead of 32", ((cast(*void)(*instance.pose)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrGeometryInstanceTransformFB.pose)) == 28, "XrGeometryInstanceTransformFB.pose has unexpected size % instead of 28", size_of(type_of(XrGeometryInstanceTransformFB.pose)));
    assert(((cast(*void)(*instance.scale)) - cast(*void)(*instance)) == 60, "XrGeometryInstanceTransformFB.scale has unexpected offset % instead of 60", ((cast(*void)(*instance.scale)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrGeometryInstanceTransformFB.scale)) == 12, "XrGeometryInstanceTransformFB.scale has unexpected size % instead of 12", size_of(type_of(XrGeometryInstanceTransformFB.scale)));
    assert(size_of(XrGeometryInstanceTransformFB) == 72, "XrGeometryInstanceTransformFB has size % instead of 72", size_of(XrGeometryInstanceTransformFB));
}

XrPassthroughStyleFB :: struct {
    type:                 XrStructureType;
    next:                 *void;
    textureOpacityFactor: float;
    edgeColor:            XrColor4f;
}
#run {
    instance: XrPassthroughStyleFB;
    assert(((cast(*void)(*instance.type)) - cast(*void)(*instance)) == 0, "XrPassthroughStyleFB.type has unexpected offset % instead of 0", ((cast(*void)(*instance.type)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrPassthroughStyleFB.type)) == 4, "XrPassthroughStyleFB.type has unexpected size % instead of 4", size_of(type_of(XrPassthroughStyleFB.type)));
    assert(((cast(*void)(*instance.next)) - cast(*void)(*instance)) == 8, "XrPassthroughStyleFB.next has unexpected offset % instead of 8", ((cast(*void)(*instance.next)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrPassthroughStyleFB.next)) == 8, "XrPassthroughStyleFB.next has unexpected size % instead of 8", size_of(type_of(XrPassthroughStyleFB.next)));
    assert(((cast(*void)(*instance.textureOpacityFactor)) - cast(*void)(*instance)) == 16, "XrPassthroughStyleFB.textureOpacityFactor has unexpected offset % instead of 16", ((cast(*void)(*instance.textureOpacityFactor)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrPassthroughStyleFB.textureOpacityFactor)) == 4, "XrPassthroughStyleFB.textureOpacityFactor has unexpected size % instead of 4", size_of(type_of(XrPassthroughStyleFB.textureOpacityFactor)));
    assert(((cast(*void)(*instance.edgeColor)) - cast(*void)(*instance)) == 20, "XrPassthroughStyleFB.edgeColor has unexpected offset % instead of 20", ((cast(*void)(*instance.edgeColor)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrPassthroughStyleFB.edgeColor)) == 16, "XrPassthroughStyleFB.edgeColor has unexpected size % instead of 16", size_of(type_of(XrPassthroughStyleFB.edgeColor)));
    assert(size_of(XrPassthroughStyleFB) == 40, "XrPassthroughStyleFB has size % instead of 40", size_of(XrPassthroughStyleFB));
}

// XrPassthroughColorMapMonoToRgbaFB extends XrPassthroughStyleFB
XrPassthroughColorMapMonoToRgbaFB :: struct {
    type:            XrStructureType;
    next:            *void;
    textureColorMap: [256] XrColor4f;
}
#run {
    instance: XrPassthroughColorMapMonoToRgbaFB;
    assert(((cast(*void)(*instance.type)) - cast(*void)(*instance)) == 0, "XrPassthroughColorMapMonoToRgbaFB.type has unexpected offset % instead of 0", ((cast(*void)(*instance.type)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrPassthroughColorMapMonoToRgbaFB.type)) == 4, "XrPassthroughColorMapMonoToRgbaFB.type has unexpected size % instead of 4", size_of(type_of(XrPassthroughColorMapMonoToRgbaFB.type)));
    assert(((cast(*void)(*instance.next)) - cast(*void)(*instance)) == 8, "XrPassthroughColorMapMonoToRgbaFB.next has unexpected offset % instead of 8", ((cast(*void)(*instance.next)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrPassthroughColorMapMonoToRgbaFB.next)) == 8, "XrPassthroughColorMapMonoToRgbaFB.next has unexpected size % instead of 8", size_of(type_of(XrPassthroughColorMapMonoToRgbaFB.next)));
    assert(((cast(*void)(*instance.textureColorMap)) - cast(*void)(*instance)) == 16, "XrPassthroughColorMapMonoToRgbaFB.textureColorMap has unexpected offset % instead of 16", ((cast(*void)(*instance.textureColorMap)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrPassthroughColorMapMonoToRgbaFB.textureColorMap)) == 4096, "XrPassthroughColorMapMonoToRgbaFB.textureColorMap has unexpected size % instead of 4096", size_of(type_of(XrPassthroughColorMapMonoToRgbaFB.textureColorMap)));
    assert(size_of(XrPassthroughColorMapMonoToRgbaFB) == 4112, "XrPassthroughColorMapMonoToRgbaFB has size % instead of 4112", size_of(XrPassthroughColorMapMonoToRgbaFB));
}

// XrPassthroughColorMapMonoToMonoFB extends XrPassthroughStyleFB
XrPassthroughColorMapMonoToMonoFB :: struct {
    type:            XrStructureType;
    next:            *void;
    textureColorMap: [256] u8;
}
#run {
    instance: XrPassthroughColorMapMonoToMonoFB;
    assert(((cast(*void)(*instance.type)) - cast(*void)(*instance)) == 0, "XrPassthroughColorMapMonoToMonoFB.type has unexpected offset % instead of 0", ((cast(*void)(*instance.type)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrPassthroughColorMapMonoToMonoFB.type)) == 4, "XrPassthroughColorMapMonoToMonoFB.type has unexpected size % instead of 4", size_of(type_of(XrPassthroughColorMapMonoToMonoFB.type)));
    assert(((cast(*void)(*instance.next)) - cast(*void)(*instance)) == 8, "XrPassthroughColorMapMonoToMonoFB.next has unexpected offset % instead of 8", ((cast(*void)(*instance.next)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrPassthroughColorMapMonoToMonoFB.next)) == 8, "XrPassthroughColorMapMonoToMonoFB.next has unexpected size % instead of 8", size_of(type_of(XrPassthroughColorMapMonoToMonoFB.next)));
    assert(((cast(*void)(*instance.textureColorMap)) - cast(*void)(*instance)) == 16, "XrPassthroughColorMapMonoToMonoFB.textureColorMap has unexpected offset % instead of 16", ((cast(*void)(*instance.textureColorMap)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrPassthroughColorMapMonoToMonoFB.textureColorMap)) == 256, "XrPassthroughColorMapMonoToMonoFB.textureColorMap has unexpected size % instead of 256", size_of(type_of(XrPassthroughColorMapMonoToMonoFB.textureColorMap)));
    assert(size_of(XrPassthroughColorMapMonoToMonoFB) == 272, "XrPassthroughColorMapMonoToMonoFB has size % instead of 272", size_of(XrPassthroughColorMapMonoToMonoFB));
}

// XrPassthroughBrightnessContrastSaturationFB extends XrPassthroughStyleFB
XrPassthroughBrightnessContrastSaturationFB :: struct {
    type:       XrStructureType;
    next:       *void;
    brightness: float;
    contrast:   float;
    saturation: float;
}
#run {
    instance: XrPassthroughBrightnessContrastSaturationFB;
    assert(((cast(*void)(*instance.type)) - cast(*void)(*instance)) == 0, "XrPassthroughBrightnessContrastSaturationFB.type has unexpected offset % instead of 0", ((cast(*void)(*instance.type)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrPassthroughBrightnessContrastSaturationFB.type)) == 4, "XrPassthroughBrightnessContrastSaturationFB.type has unexpected size % instead of 4", size_of(type_of(XrPassthroughBrightnessContrastSaturationFB.type)));
    assert(((cast(*void)(*instance.next)) - cast(*void)(*instance)) == 8, "XrPassthroughBrightnessContrastSaturationFB.next has unexpected offset % instead of 8", ((cast(*void)(*instance.next)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrPassthroughBrightnessContrastSaturationFB.next)) == 8, "XrPassthroughBrightnessContrastSaturationFB.next has unexpected size % instead of 8", size_of(type_of(XrPassthroughBrightnessContrastSaturationFB.next)));
    assert(((cast(*void)(*instance.brightness)) - cast(*void)(*instance)) == 16, "XrPassthroughBrightnessContrastSaturationFB.brightness has unexpected offset % instead of 16", ((cast(*void)(*instance.brightness)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrPassthroughBrightnessContrastSaturationFB.brightness)) == 4, "XrPassthroughBrightnessContrastSaturationFB.brightness has unexpected size % instead of 4", size_of(type_of(XrPassthroughBrightnessContrastSaturationFB.brightness)));
    assert(((cast(*void)(*instance.contrast)) - cast(*void)(*instance)) == 20, "XrPassthroughBrightnessContrastSaturationFB.contrast has unexpected offset % instead of 20", ((cast(*void)(*instance.contrast)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrPassthroughBrightnessContrastSaturationFB.contrast)) == 4, "XrPassthroughBrightnessContrastSaturationFB.contrast has unexpected size % instead of 4", size_of(type_of(XrPassthroughBrightnessContrastSaturationFB.contrast)));
    assert(((cast(*void)(*instance.saturation)) - cast(*void)(*instance)) == 24, "XrPassthroughBrightnessContrastSaturationFB.saturation has unexpected offset % instead of 24", ((cast(*void)(*instance.saturation)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrPassthroughBrightnessContrastSaturationFB.saturation)) == 4, "XrPassthroughBrightnessContrastSaturationFB.saturation has unexpected size % instead of 4", size_of(type_of(XrPassthroughBrightnessContrastSaturationFB.saturation)));
    assert(size_of(XrPassthroughBrightnessContrastSaturationFB) == 32, "XrPassthroughBrightnessContrastSaturationFB has size % instead of 32", size_of(XrPassthroughBrightnessContrastSaturationFB));
}

XrEventDataPassthroughStateChangedFB :: struct {
    type:  XrStructureType;
    next:  *void;
    flags: XrPassthroughStateChangedFlagsFB;
}
#run {
    instance: XrEventDataPassthroughStateChangedFB;
    assert(((cast(*void)(*instance.type)) - cast(*void)(*instance)) == 0, "XrEventDataPassthroughStateChangedFB.type has unexpected offset % instead of 0", ((cast(*void)(*instance.type)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrEventDataPassthroughStateChangedFB.type)) == 4, "XrEventDataPassthroughStateChangedFB.type has unexpected size % instead of 4", size_of(type_of(XrEventDataPassthroughStateChangedFB.type)));
    assert(((cast(*void)(*instance.next)) - cast(*void)(*instance)) == 8, "XrEventDataPassthroughStateChangedFB.next has unexpected offset % instead of 8", ((cast(*void)(*instance.next)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrEventDataPassthroughStateChangedFB.next)) == 8, "XrEventDataPassthroughStateChangedFB.next has unexpected size % instead of 8", size_of(type_of(XrEventDataPassthroughStateChangedFB.next)));
    assert(((cast(*void)(*instance.flags)) - cast(*void)(*instance)) == 16, "XrEventDataPassthroughStateChangedFB.flags has unexpected offset % instead of 16", ((cast(*void)(*instance.flags)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrEventDataPassthroughStateChangedFB.flags)) == 8, "XrEventDataPassthroughStateChangedFB.flags has unexpected size % instead of 8", size_of(type_of(XrEventDataPassthroughStateChangedFB.flags)));
    assert(size_of(XrEventDataPassthroughStateChangedFB) == 24, "XrEventDataPassthroughStateChangedFB has size % instead of 24", size_of(XrEventDataPassthroughStateChangedFB));
}

PFN_xrCreatePassthroughFB :: #type (a0: XrSession, a1: *XrPassthroughCreateInfoFB, a2: *XrPassthroughFB) -> XrResult #c_call;
PFN_xrDestroyPassthroughFB :: #type (a0: XrPassthroughFB) -> XrResult #c_call;
PFN_xrPassthroughStartFB :: #type (a0: XrPassthroughFB) -> XrResult #c_call;
PFN_xrPassthroughPauseFB :: #type (a0: XrPassthroughFB) -> XrResult #c_call;
PFN_xrCreatePassthroughLayerFB :: #type (a0: XrSession, a1: *XrPassthroughLayerCreateInfoFB, a2: *XrPassthroughLayerFB) -> XrResult #c_call;
PFN_xrDestroyPassthroughLayerFB :: #type (a0: XrPassthroughLayerFB) -> XrResult #c_call;
PFN_xrPassthroughLayerPauseFB :: #type (a0: XrPassthroughLayerFB) -> XrResult #c_call;
PFN_xrPassthroughLayerResumeFB :: #type (a0: XrPassthroughLayerFB) -> XrResult #c_call;
PFN_xrPassthroughLayerSetStyleFB :: #type (a0: XrPassthroughLayerFB, a1: *XrPassthroughStyleFB) -> XrResult #c_call;
PFN_xrCreateGeometryInstanceFB :: #type (a0: XrSession, a1: *XrGeometryInstanceCreateInfoFB, a2: *XrGeometryInstanceFB) -> XrResult #c_call;
PFN_xrDestroyGeometryInstanceFB :: #type (a0: XrGeometryInstanceFB) -> XrResult #c_call;
PFN_xrGeometryInstanceSetTransformFB :: #type (a0: XrGeometryInstanceFB, a1: *XrGeometryInstanceTransformFB) -> XrResult #c_call;

XrRenderModelKeyFB :: u64;

XrRenderModelFlagsFB :: XrFlags64;

// Flag bits for XrRenderModelFlagsFB
XR_RENDER_MODEL_SUPPORTS_GLTF_2_0_SUBSET_1_BIT_FB: XrRenderModelFlagsFB : 1;
XR_RENDER_MODEL_SUPPORTS_GLTF_2_0_SUBSET_2_BIT_FB: XrRenderModelFlagsFB : 2;

XrRenderModelPathInfoFB :: struct {
    type: XrStructureType;
    next: *void;
    path: XrPath;
}
#run {
    instance: XrRenderModelPathInfoFB;
    assert(((cast(*void)(*instance.type)) - cast(*void)(*instance)) == 0, "XrRenderModelPathInfoFB.type has unexpected offset % instead of 0", ((cast(*void)(*instance.type)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrRenderModelPathInfoFB.type)) == 4, "XrRenderModelPathInfoFB.type has unexpected size % instead of 4", size_of(type_of(XrRenderModelPathInfoFB.type)));
    assert(((cast(*void)(*instance.next)) - cast(*void)(*instance)) == 8, "XrRenderModelPathInfoFB.next has unexpected offset % instead of 8", ((cast(*void)(*instance.next)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrRenderModelPathInfoFB.next)) == 8, "XrRenderModelPathInfoFB.next has unexpected size % instead of 8", size_of(type_of(XrRenderModelPathInfoFB.next)));
    assert(((cast(*void)(*instance.path)) - cast(*void)(*instance)) == 16, "XrRenderModelPathInfoFB.path has unexpected offset % instead of 16", ((cast(*void)(*instance.path)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrRenderModelPathInfoFB.path)) == 8, "XrRenderModelPathInfoFB.path has unexpected size % instead of 8", size_of(type_of(XrRenderModelPathInfoFB.path)));
    assert(size_of(XrRenderModelPathInfoFB) == 24, "XrRenderModelPathInfoFB has size % instead of 24", size_of(XrRenderModelPathInfoFB));
}

XrRenderModelPropertiesFB :: struct {
    type:         XrStructureType;
    next:         *void;
    vendorId:     u32;
    modelName:    [64] u8;
    modelKey:     XrRenderModelKeyFB;
    modelVersion: u32;
    flags:        XrRenderModelFlagsFB;
}
#run {
    instance: XrRenderModelPropertiesFB;
    assert(((cast(*void)(*instance.type)) - cast(*void)(*instance)) == 0, "XrRenderModelPropertiesFB.type has unexpected offset % instead of 0", ((cast(*void)(*instance.type)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrRenderModelPropertiesFB.type)) == 4, "XrRenderModelPropertiesFB.type has unexpected size % instead of 4", size_of(type_of(XrRenderModelPropertiesFB.type)));
    assert(((cast(*void)(*instance.next)) - cast(*void)(*instance)) == 8, "XrRenderModelPropertiesFB.next has unexpected offset % instead of 8", ((cast(*void)(*instance.next)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrRenderModelPropertiesFB.next)) == 8, "XrRenderModelPropertiesFB.next has unexpected size % instead of 8", size_of(type_of(XrRenderModelPropertiesFB.next)));
    assert(((cast(*void)(*instance.vendorId)) - cast(*void)(*instance)) == 16, "XrRenderModelPropertiesFB.vendorId has unexpected offset % instead of 16", ((cast(*void)(*instance.vendorId)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrRenderModelPropertiesFB.vendorId)) == 4, "XrRenderModelPropertiesFB.vendorId has unexpected size % instead of 4", size_of(type_of(XrRenderModelPropertiesFB.vendorId)));
    assert(((cast(*void)(*instance.modelName)) - cast(*void)(*instance)) == 20, "XrRenderModelPropertiesFB.modelName has unexpected offset % instead of 20", ((cast(*void)(*instance.modelName)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrRenderModelPropertiesFB.modelName)) == 64, "XrRenderModelPropertiesFB.modelName has unexpected size % instead of 64", size_of(type_of(XrRenderModelPropertiesFB.modelName)));
    assert(((cast(*void)(*instance.modelKey)) - cast(*void)(*instance)) == 88, "XrRenderModelPropertiesFB.modelKey has unexpected offset % instead of 88", ((cast(*void)(*instance.modelKey)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrRenderModelPropertiesFB.modelKey)) == 8, "XrRenderModelPropertiesFB.modelKey has unexpected size % instead of 8", size_of(type_of(XrRenderModelPropertiesFB.modelKey)));
    assert(((cast(*void)(*instance.modelVersion)) - cast(*void)(*instance)) == 96, "XrRenderModelPropertiesFB.modelVersion has unexpected offset % instead of 96", ((cast(*void)(*instance.modelVersion)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrRenderModelPropertiesFB.modelVersion)) == 4, "XrRenderModelPropertiesFB.modelVersion has unexpected size % instead of 4", size_of(type_of(XrRenderModelPropertiesFB.modelVersion)));
    assert(((cast(*void)(*instance.flags)) - cast(*void)(*instance)) == 104, "XrRenderModelPropertiesFB.flags has unexpected offset % instead of 104", ((cast(*void)(*instance.flags)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrRenderModelPropertiesFB.flags)) == 8, "XrRenderModelPropertiesFB.flags has unexpected size % instead of 8", size_of(type_of(XrRenderModelPropertiesFB.flags)));
    assert(size_of(XrRenderModelPropertiesFB) == 112, "XrRenderModelPropertiesFB has size % instead of 112", size_of(XrRenderModelPropertiesFB));
}

XrRenderModelBufferFB :: struct {
    type:                XrStructureType;
    next:                *void;
    bufferCapacityInput: u32;
    bufferCountOutput:   u32;
    buffer:              *u8;
}
#run {
    instance: XrRenderModelBufferFB;
    assert(((cast(*void)(*instance.type)) - cast(*void)(*instance)) == 0, "XrRenderModelBufferFB.type has unexpected offset % instead of 0", ((cast(*void)(*instance.type)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrRenderModelBufferFB.type)) == 4, "XrRenderModelBufferFB.type has unexpected size % instead of 4", size_of(type_of(XrRenderModelBufferFB.type)));
    assert(((cast(*void)(*instance.next)) - cast(*void)(*instance)) == 8, "XrRenderModelBufferFB.next has unexpected offset % instead of 8", ((cast(*void)(*instance.next)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrRenderModelBufferFB.next)) == 8, "XrRenderModelBufferFB.next has unexpected size % instead of 8", size_of(type_of(XrRenderModelBufferFB.next)));
    assert(((cast(*void)(*instance.bufferCapacityInput)) - cast(*void)(*instance)) == 16, "XrRenderModelBufferFB.bufferCapacityInput has unexpected offset % instead of 16", ((cast(*void)(*instance.bufferCapacityInput)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrRenderModelBufferFB.bufferCapacityInput)) == 4, "XrRenderModelBufferFB.bufferCapacityInput has unexpected size % instead of 4", size_of(type_of(XrRenderModelBufferFB.bufferCapacityInput)));
    assert(((cast(*void)(*instance.bufferCountOutput)) - cast(*void)(*instance)) == 20, "XrRenderModelBufferFB.bufferCountOutput has unexpected offset % instead of 20", ((cast(*void)(*instance.bufferCountOutput)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrRenderModelBufferFB.bufferCountOutput)) == 4, "XrRenderModelBufferFB.bufferCountOutput has unexpected size % instead of 4", size_of(type_of(XrRenderModelBufferFB.bufferCountOutput)));
    assert(((cast(*void)(*instance.buffer)) - cast(*void)(*instance)) == 24, "XrRenderModelBufferFB.buffer has unexpected offset % instead of 24", ((cast(*void)(*instance.buffer)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrRenderModelBufferFB.buffer)) == 8, "XrRenderModelBufferFB.buffer has unexpected size % instead of 8", size_of(type_of(XrRenderModelBufferFB.buffer)));
    assert(size_of(XrRenderModelBufferFB) == 32, "XrRenderModelBufferFB has size % instead of 32", size_of(XrRenderModelBufferFB));
}

XrRenderModelLoadInfoFB :: struct {
    type:     XrStructureType;
    next:     *void;
    modelKey: XrRenderModelKeyFB;
}
#run {
    instance: XrRenderModelLoadInfoFB;
    assert(((cast(*void)(*instance.type)) - cast(*void)(*instance)) == 0, "XrRenderModelLoadInfoFB.type has unexpected offset % instead of 0", ((cast(*void)(*instance.type)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrRenderModelLoadInfoFB.type)) == 4, "XrRenderModelLoadInfoFB.type has unexpected size % instead of 4", size_of(type_of(XrRenderModelLoadInfoFB.type)));
    assert(((cast(*void)(*instance.next)) - cast(*void)(*instance)) == 8, "XrRenderModelLoadInfoFB.next has unexpected offset % instead of 8", ((cast(*void)(*instance.next)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrRenderModelLoadInfoFB.next)) == 8, "XrRenderModelLoadInfoFB.next has unexpected size % instead of 8", size_of(type_of(XrRenderModelLoadInfoFB.next)));
    assert(((cast(*void)(*instance.modelKey)) - cast(*void)(*instance)) == 16, "XrRenderModelLoadInfoFB.modelKey has unexpected offset % instead of 16", ((cast(*void)(*instance.modelKey)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrRenderModelLoadInfoFB.modelKey)) == 8, "XrRenderModelLoadInfoFB.modelKey has unexpected size % instead of 8", size_of(type_of(XrRenderModelLoadInfoFB.modelKey)));
    assert(size_of(XrRenderModelLoadInfoFB) == 24, "XrRenderModelLoadInfoFB has size % instead of 24", size_of(XrRenderModelLoadInfoFB));
}

// XrSystemRenderModelPropertiesFB extends XrSystemProperties
XrSystemRenderModelPropertiesFB :: struct {
    type:                       XrStructureType;
    next:                       *void;
    supportsRenderModelLoading: XrBool32;
}
#run {
    instance: XrSystemRenderModelPropertiesFB;
    assert(((cast(*void)(*instance.type)) - cast(*void)(*instance)) == 0, "XrSystemRenderModelPropertiesFB.type has unexpected offset % instead of 0", ((cast(*void)(*instance.type)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrSystemRenderModelPropertiesFB.type)) == 4, "XrSystemRenderModelPropertiesFB.type has unexpected size % instead of 4", size_of(type_of(XrSystemRenderModelPropertiesFB.type)));
    assert(((cast(*void)(*instance.next)) - cast(*void)(*instance)) == 8, "XrSystemRenderModelPropertiesFB.next has unexpected offset % instead of 8", ((cast(*void)(*instance.next)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrSystemRenderModelPropertiesFB.next)) == 8, "XrSystemRenderModelPropertiesFB.next has unexpected size % instead of 8", size_of(type_of(XrSystemRenderModelPropertiesFB.next)));
    assert(((cast(*void)(*instance.supportsRenderModelLoading)) - cast(*void)(*instance)) == 16, "XrSystemRenderModelPropertiesFB.supportsRenderModelLoading has unexpected offset % instead of 16", ((cast(*void)(*instance.supportsRenderModelLoading)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrSystemRenderModelPropertiesFB.supportsRenderModelLoading)) == 4, "XrSystemRenderModelPropertiesFB.supportsRenderModelLoading has unexpected size % instead of 4", size_of(type_of(XrSystemRenderModelPropertiesFB.supportsRenderModelLoading)));
    assert(size_of(XrSystemRenderModelPropertiesFB) == 24, "XrSystemRenderModelPropertiesFB has size % instead of 24", size_of(XrSystemRenderModelPropertiesFB));
}

// XrRenderModelCapabilitiesRequestFB extends XrSystemProperties
XrRenderModelCapabilitiesRequestFB :: struct {
    type:  XrStructureType;
    next:  *void;
    flags: XrRenderModelFlagsFB;
}
#run {
    instance: XrRenderModelCapabilitiesRequestFB;
    assert(((cast(*void)(*instance.type)) - cast(*void)(*instance)) == 0, "XrRenderModelCapabilitiesRequestFB.type has unexpected offset % instead of 0", ((cast(*void)(*instance.type)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrRenderModelCapabilitiesRequestFB.type)) == 4, "XrRenderModelCapabilitiesRequestFB.type has unexpected size % instead of 4", size_of(type_of(XrRenderModelCapabilitiesRequestFB.type)));
    assert(((cast(*void)(*instance.next)) - cast(*void)(*instance)) == 8, "XrRenderModelCapabilitiesRequestFB.next has unexpected offset % instead of 8", ((cast(*void)(*instance.next)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrRenderModelCapabilitiesRequestFB.next)) == 8, "XrRenderModelCapabilitiesRequestFB.next has unexpected size % instead of 8", size_of(type_of(XrRenderModelCapabilitiesRequestFB.next)));
    assert(((cast(*void)(*instance.flags)) - cast(*void)(*instance)) == 16, "XrRenderModelCapabilitiesRequestFB.flags has unexpected offset % instead of 16", ((cast(*void)(*instance.flags)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrRenderModelCapabilitiesRequestFB.flags)) == 8, "XrRenderModelCapabilitiesRequestFB.flags has unexpected size % instead of 8", size_of(type_of(XrRenderModelCapabilitiesRequestFB.flags)));
    assert(size_of(XrRenderModelCapabilitiesRequestFB) == 24, "XrRenderModelCapabilitiesRequestFB has size % instead of 24", size_of(XrRenderModelCapabilitiesRequestFB));
}

PFN_xrEnumerateRenderModelPathsFB :: #type (a0: XrSession, a1: u32, a2: *u32, a3: *XrRenderModelPathInfoFB) -> XrResult #c_call;
PFN_xrGetRenderModelPropertiesFB :: #type (a0: XrSession, a1: XrPath, a2: *XrRenderModelPropertiesFB) -> XrResult #c_call;
PFN_xrLoadRenderModelFB :: #type (a0: XrSession, a1: *XrRenderModelLoadInfoFB, a2: *XrRenderModelBufferFB) -> XrResult #c_call;

// XrViewLocateFoveatedRenderingVARJO extends XrViewLocateInfo
XrViewLocateFoveatedRenderingVARJO :: struct {
    type:                    XrStructureType;
    next:                    *void;
    foveatedRenderingActive: XrBool32;
}
#run {
    instance: XrViewLocateFoveatedRenderingVARJO;
    assert(((cast(*void)(*instance.type)) - cast(*void)(*instance)) == 0, "XrViewLocateFoveatedRenderingVARJO.type has unexpected offset % instead of 0", ((cast(*void)(*instance.type)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrViewLocateFoveatedRenderingVARJO.type)) == 4, "XrViewLocateFoveatedRenderingVARJO.type has unexpected size % instead of 4", size_of(type_of(XrViewLocateFoveatedRenderingVARJO.type)));
    assert(((cast(*void)(*instance.next)) - cast(*void)(*instance)) == 8, "XrViewLocateFoveatedRenderingVARJO.next has unexpected offset % instead of 8", ((cast(*void)(*instance.next)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrViewLocateFoveatedRenderingVARJO.next)) == 8, "XrViewLocateFoveatedRenderingVARJO.next has unexpected size % instead of 8", size_of(type_of(XrViewLocateFoveatedRenderingVARJO.next)));
    assert(((cast(*void)(*instance.foveatedRenderingActive)) - cast(*void)(*instance)) == 16, "XrViewLocateFoveatedRenderingVARJO.foveatedRenderingActive has unexpected offset % instead of 16", ((cast(*void)(*instance.foveatedRenderingActive)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrViewLocateFoveatedRenderingVARJO.foveatedRenderingActive)) == 4, "XrViewLocateFoveatedRenderingVARJO.foveatedRenderingActive has unexpected size % instead of 4", size_of(type_of(XrViewLocateFoveatedRenderingVARJO.foveatedRenderingActive)));
    assert(size_of(XrViewLocateFoveatedRenderingVARJO) == 24, "XrViewLocateFoveatedRenderingVARJO has size % instead of 24", size_of(XrViewLocateFoveatedRenderingVARJO));
}

// XrFoveatedViewConfigurationViewVARJO extends XrViewConfigurationView
XrFoveatedViewConfigurationViewVARJO :: struct {
    type:                    XrStructureType;
    next:                    *void;
    foveatedRenderingActive: XrBool32;
}
#run {
    instance: XrFoveatedViewConfigurationViewVARJO;
    assert(((cast(*void)(*instance.type)) - cast(*void)(*instance)) == 0, "XrFoveatedViewConfigurationViewVARJO.type has unexpected offset % instead of 0", ((cast(*void)(*instance.type)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrFoveatedViewConfigurationViewVARJO.type)) == 4, "XrFoveatedViewConfigurationViewVARJO.type has unexpected size % instead of 4", size_of(type_of(XrFoveatedViewConfigurationViewVARJO.type)));
    assert(((cast(*void)(*instance.next)) - cast(*void)(*instance)) == 8, "XrFoveatedViewConfigurationViewVARJO.next has unexpected offset % instead of 8", ((cast(*void)(*instance.next)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrFoveatedViewConfigurationViewVARJO.next)) == 8, "XrFoveatedViewConfigurationViewVARJO.next has unexpected size % instead of 8", size_of(type_of(XrFoveatedViewConfigurationViewVARJO.next)));
    assert(((cast(*void)(*instance.foveatedRenderingActive)) - cast(*void)(*instance)) == 16, "XrFoveatedViewConfigurationViewVARJO.foveatedRenderingActive has unexpected offset % instead of 16", ((cast(*void)(*instance.foveatedRenderingActive)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrFoveatedViewConfigurationViewVARJO.foveatedRenderingActive)) == 4, "XrFoveatedViewConfigurationViewVARJO.foveatedRenderingActive has unexpected size % instead of 4", size_of(type_of(XrFoveatedViewConfigurationViewVARJO.foveatedRenderingActive)));
    assert(size_of(XrFoveatedViewConfigurationViewVARJO) == 24, "XrFoveatedViewConfigurationViewVARJO has size % instead of 24", size_of(XrFoveatedViewConfigurationViewVARJO));
}

// XrSystemFoveatedRenderingPropertiesVARJO extends XrSystemProperties
XrSystemFoveatedRenderingPropertiesVARJO :: struct {
    type:                      XrStructureType;
    next:                      *void;
    supportsFoveatedRendering: XrBool32;
}
#run {
    instance: XrSystemFoveatedRenderingPropertiesVARJO;
    assert(((cast(*void)(*instance.type)) - cast(*void)(*instance)) == 0, "XrSystemFoveatedRenderingPropertiesVARJO.type has unexpected offset % instead of 0", ((cast(*void)(*instance.type)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrSystemFoveatedRenderingPropertiesVARJO.type)) == 4, "XrSystemFoveatedRenderingPropertiesVARJO.type has unexpected size % instead of 4", size_of(type_of(XrSystemFoveatedRenderingPropertiesVARJO.type)));
    assert(((cast(*void)(*instance.next)) - cast(*void)(*instance)) == 8, "XrSystemFoveatedRenderingPropertiesVARJO.next has unexpected offset % instead of 8", ((cast(*void)(*instance.next)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrSystemFoveatedRenderingPropertiesVARJO.next)) == 8, "XrSystemFoveatedRenderingPropertiesVARJO.next has unexpected size % instead of 8", size_of(type_of(XrSystemFoveatedRenderingPropertiesVARJO.next)));
    assert(((cast(*void)(*instance.supportsFoveatedRendering)) - cast(*void)(*instance)) == 16, "XrSystemFoveatedRenderingPropertiesVARJO.supportsFoveatedRendering has unexpected offset % instead of 16", ((cast(*void)(*instance.supportsFoveatedRendering)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrSystemFoveatedRenderingPropertiesVARJO.supportsFoveatedRendering)) == 4, "XrSystemFoveatedRenderingPropertiesVARJO.supportsFoveatedRendering has unexpected size % instead of 4", size_of(type_of(XrSystemFoveatedRenderingPropertiesVARJO.supportsFoveatedRendering)));
    assert(size_of(XrSystemFoveatedRenderingPropertiesVARJO) == 24, "XrSystemFoveatedRenderingPropertiesVARJO has size % instead of 24", size_of(XrSystemFoveatedRenderingPropertiesVARJO));
}

// XrCompositionLayerDepthTestVARJO extends XrCompositionLayerProjection
XrCompositionLayerDepthTestVARJO :: struct {
    type:                XrStructureType;
    next:                *void;
    depthTestRangeNearZ: float;
    depthTestRangeFarZ:  float;
}
#run {
    instance: XrCompositionLayerDepthTestVARJO;
    assert(((cast(*void)(*instance.type)) - cast(*void)(*instance)) == 0, "XrCompositionLayerDepthTestVARJO.type has unexpected offset % instead of 0", ((cast(*void)(*instance.type)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrCompositionLayerDepthTestVARJO.type)) == 4, "XrCompositionLayerDepthTestVARJO.type has unexpected size % instead of 4", size_of(type_of(XrCompositionLayerDepthTestVARJO.type)));
    assert(((cast(*void)(*instance.next)) - cast(*void)(*instance)) == 8, "XrCompositionLayerDepthTestVARJO.next has unexpected offset % instead of 8", ((cast(*void)(*instance.next)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrCompositionLayerDepthTestVARJO.next)) == 8, "XrCompositionLayerDepthTestVARJO.next has unexpected size % instead of 8", size_of(type_of(XrCompositionLayerDepthTestVARJO.next)));
    assert(((cast(*void)(*instance.depthTestRangeNearZ)) - cast(*void)(*instance)) == 16, "XrCompositionLayerDepthTestVARJO.depthTestRangeNearZ has unexpected offset % instead of 16", ((cast(*void)(*instance.depthTestRangeNearZ)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrCompositionLayerDepthTestVARJO.depthTestRangeNearZ)) == 4, "XrCompositionLayerDepthTestVARJO.depthTestRangeNearZ has unexpected size % instead of 4", size_of(type_of(XrCompositionLayerDepthTestVARJO.depthTestRangeNearZ)));
    assert(((cast(*void)(*instance.depthTestRangeFarZ)) - cast(*void)(*instance)) == 20, "XrCompositionLayerDepthTestVARJO.depthTestRangeFarZ has unexpected offset % instead of 20", ((cast(*void)(*instance.depthTestRangeFarZ)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrCompositionLayerDepthTestVARJO.depthTestRangeFarZ)) == 4, "XrCompositionLayerDepthTestVARJO.depthTestRangeFarZ has unexpected size % instead of 4", size_of(type_of(XrCompositionLayerDepthTestVARJO.depthTestRangeFarZ)));
    assert(size_of(XrCompositionLayerDepthTestVARJO) == 24, "XrCompositionLayerDepthTestVARJO has size % instead of 24", size_of(XrCompositionLayerDepthTestVARJO));
}

PFN_xrSetEnvironmentDepthEstimationVARJO :: #type (a0: XrSession, a1: XrBool32) -> XrResult #c_call;

// XrSystemMarkerTrackingPropertiesVARJO extends XrSystemProperties
XrSystemMarkerTrackingPropertiesVARJO :: struct {
    type:                   XrStructureType;
    next:                   *void;
    supportsMarkerTracking: XrBool32;
}
#run {
    instance: XrSystemMarkerTrackingPropertiesVARJO;
    assert(((cast(*void)(*instance.type)) - cast(*void)(*instance)) == 0, "XrSystemMarkerTrackingPropertiesVARJO.type has unexpected offset % instead of 0", ((cast(*void)(*instance.type)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrSystemMarkerTrackingPropertiesVARJO.type)) == 4, "XrSystemMarkerTrackingPropertiesVARJO.type has unexpected size % instead of 4", size_of(type_of(XrSystemMarkerTrackingPropertiesVARJO.type)));
    assert(((cast(*void)(*instance.next)) - cast(*void)(*instance)) == 8, "XrSystemMarkerTrackingPropertiesVARJO.next has unexpected offset % instead of 8", ((cast(*void)(*instance.next)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrSystemMarkerTrackingPropertiesVARJO.next)) == 8, "XrSystemMarkerTrackingPropertiesVARJO.next has unexpected size % instead of 8", size_of(type_of(XrSystemMarkerTrackingPropertiesVARJO.next)));
    assert(((cast(*void)(*instance.supportsMarkerTracking)) - cast(*void)(*instance)) == 16, "XrSystemMarkerTrackingPropertiesVARJO.supportsMarkerTracking has unexpected offset % instead of 16", ((cast(*void)(*instance.supportsMarkerTracking)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrSystemMarkerTrackingPropertiesVARJO.supportsMarkerTracking)) == 4, "XrSystemMarkerTrackingPropertiesVARJO.supportsMarkerTracking has unexpected size % instead of 4", size_of(type_of(XrSystemMarkerTrackingPropertiesVARJO.supportsMarkerTracking)));
    assert(size_of(XrSystemMarkerTrackingPropertiesVARJO) == 24, "XrSystemMarkerTrackingPropertiesVARJO has size % instead of 24", size_of(XrSystemMarkerTrackingPropertiesVARJO));
}

XrEventDataMarkerTrackingUpdateVARJO :: struct {
    type:        XrStructureType;
    next:        *void;
    markerId:    u64;
    isActive:    XrBool32;
    isPredicted: XrBool32;
    time:        XrTime;
}
#run {
    instance: XrEventDataMarkerTrackingUpdateVARJO;
    assert(((cast(*void)(*instance.type)) - cast(*void)(*instance)) == 0, "XrEventDataMarkerTrackingUpdateVARJO.type has unexpected offset % instead of 0", ((cast(*void)(*instance.type)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrEventDataMarkerTrackingUpdateVARJO.type)) == 4, "XrEventDataMarkerTrackingUpdateVARJO.type has unexpected size % instead of 4", size_of(type_of(XrEventDataMarkerTrackingUpdateVARJO.type)));
    assert(((cast(*void)(*instance.next)) - cast(*void)(*instance)) == 8, "XrEventDataMarkerTrackingUpdateVARJO.next has unexpected offset % instead of 8", ((cast(*void)(*instance.next)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrEventDataMarkerTrackingUpdateVARJO.next)) == 8, "XrEventDataMarkerTrackingUpdateVARJO.next has unexpected size % instead of 8", size_of(type_of(XrEventDataMarkerTrackingUpdateVARJO.next)));
    assert(((cast(*void)(*instance.markerId)) - cast(*void)(*instance)) == 16, "XrEventDataMarkerTrackingUpdateVARJO.markerId has unexpected offset % instead of 16", ((cast(*void)(*instance.markerId)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrEventDataMarkerTrackingUpdateVARJO.markerId)) == 8, "XrEventDataMarkerTrackingUpdateVARJO.markerId has unexpected size % instead of 8", size_of(type_of(XrEventDataMarkerTrackingUpdateVARJO.markerId)));
    assert(((cast(*void)(*instance.isActive)) - cast(*void)(*instance)) == 24, "XrEventDataMarkerTrackingUpdateVARJO.isActive has unexpected offset % instead of 24", ((cast(*void)(*instance.isActive)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrEventDataMarkerTrackingUpdateVARJO.isActive)) == 4, "XrEventDataMarkerTrackingUpdateVARJO.isActive has unexpected size % instead of 4", size_of(type_of(XrEventDataMarkerTrackingUpdateVARJO.isActive)));
    assert(((cast(*void)(*instance.isPredicted)) - cast(*void)(*instance)) == 28, "XrEventDataMarkerTrackingUpdateVARJO.isPredicted has unexpected offset % instead of 28", ((cast(*void)(*instance.isPredicted)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrEventDataMarkerTrackingUpdateVARJO.isPredicted)) == 4, "XrEventDataMarkerTrackingUpdateVARJO.isPredicted has unexpected size % instead of 4", size_of(type_of(XrEventDataMarkerTrackingUpdateVARJO.isPredicted)));
    assert(((cast(*void)(*instance.time)) - cast(*void)(*instance)) == 32, "XrEventDataMarkerTrackingUpdateVARJO.time has unexpected offset % instead of 32", ((cast(*void)(*instance.time)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrEventDataMarkerTrackingUpdateVARJO.time)) == 8, "XrEventDataMarkerTrackingUpdateVARJO.time has unexpected size % instead of 8", size_of(type_of(XrEventDataMarkerTrackingUpdateVARJO.time)));
    assert(size_of(XrEventDataMarkerTrackingUpdateVARJO) == 40, "XrEventDataMarkerTrackingUpdateVARJO has size % instead of 40", size_of(XrEventDataMarkerTrackingUpdateVARJO));
}

XrMarkerSpaceCreateInfoVARJO :: struct {
    type:              XrStructureType;
    next:              *void;
    markerId:          u64;
    poseInMarkerSpace: XrPosef;
}
#run {
    instance: XrMarkerSpaceCreateInfoVARJO;
    assert(((cast(*void)(*instance.type)) - cast(*void)(*instance)) == 0, "XrMarkerSpaceCreateInfoVARJO.type has unexpected offset % instead of 0", ((cast(*void)(*instance.type)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrMarkerSpaceCreateInfoVARJO.type)) == 4, "XrMarkerSpaceCreateInfoVARJO.type has unexpected size % instead of 4", size_of(type_of(XrMarkerSpaceCreateInfoVARJO.type)));
    assert(((cast(*void)(*instance.next)) - cast(*void)(*instance)) == 8, "XrMarkerSpaceCreateInfoVARJO.next has unexpected offset % instead of 8", ((cast(*void)(*instance.next)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrMarkerSpaceCreateInfoVARJO.next)) == 8, "XrMarkerSpaceCreateInfoVARJO.next has unexpected size % instead of 8", size_of(type_of(XrMarkerSpaceCreateInfoVARJO.next)));
    assert(((cast(*void)(*instance.markerId)) - cast(*void)(*instance)) == 16, "XrMarkerSpaceCreateInfoVARJO.markerId has unexpected offset % instead of 16", ((cast(*void)(*instance.markerId)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrMarkerSpaceCreateInfoVARJO.markerId)) == 8, "XrMarkerSpaceCreateInfoVARJO.markerId has unexpected size % instead of 8", size_of(type_of(XrMarkerSpaceCreateInfoVARJO.markerId)));
    assert(((cast(*void)(*instance.poseInMarkerSpace)) - cast(*void)(*instance)) == 24, "XrMarkerSpaceCreateInfoVARJO.poseInMarkerSpace has unexpected offset % instead of 24", ((cast(*void)(*instance.poseInMarkerSpace)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrMarkerSpaceCreateInfoVARJO.poseInMarkerSpace)) == 28, "XrMarkerSpaceCreateInfoVARJO.poseInMarkerSpace has unexpected size % instead of 28", size_of(type_of(XrMarkerSpaceCreateInfoVARJO.poseInMarkerSpace)));
    assert(size_of(XrMarkerSpaceCreateInfoVARJO) == 56, "XrMarkerSpaceCreateInfoVARJO has size % instead of 56", size_of(XrMarkerSpaceCreateInfoVARJO));
}

PFN_xrSetMarkerTrackingVARJO :: #type (a0: XrSession, a1: XrBool32) -> XrResult #c_call;
PFN_xrSetMarkerTrackingTimeoutVARJO :: #type (a0: XrSession, a1: u64, a2: XrDuration) -> XrResult #c_call;
PFN_xrSetMarkerTrackingPredictionVARJO :: #type (a0: XrSession, a1: u64, a2: XrBool32) -> XrResult #c_call;
PFN_xrGetMarkerSizeVARJO :: #type (a0: XrSession, a1: u64, a2: *XrExtent2Df) -> XrResult #c_call;
PFN_xrCreateMarkerSpaceVARJO :: #type (a0: XrSession, a1: *XrMarkerSpaceCreateInfoVARJO, a2: *XrSpace) -> XrResult #c_call;

PFN_xrSetViewOffsetVARJO :: #type (a0: XrSession, a1: float) -> XrResult #c_call;

XrSpatialAnchorStoreConnectionMSFT_T :: struct {}
XrSpatialAnchorStoreConnectionMSFT :: *XrSpatialAnchorStoreConnectionMSFT_T;

XrSpatialAnchorPersistenceNameMSFT :: struct {
    name: [256] u8;
}
#run {
    instance: XrSpatialAnchorPersistenceNameMSFT;
    assert(((cast(*void)(*instance.name)) - cast(*void)(*instance)) == 0, "XrSpatialAnchorPersistenceNameMSFT.name has unexpected offset % instead of 0", ((cast(*void)(*instance.name)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrSpatialAnchorPersistenceNameMSFT.name)) == 256, "XrSpatialAnchorPersistenceNameMSFT.name has unexpected size % instead of 256", size_of(type_of(XrSpatialAnchorPersistenceNameMSFT.name)));
    assert(size_of(XrSpatialAnchorPersistenceNameMSFT) == 256, "XrSpatialAnchorPersistenceNameMSFT has size % instead of 256", size_of(XrSpatialAnchorPersistenceNameMSFT));
}

XrSpatialAnchorPersistenceInfoMSFT :: struct {
    type:                         XrStructureType;
    next:                         *void;
    spatialAnchorPersistenceName: XrSpatialAnchorPersistenceNameMSFT;
    spatialAnchor:                XrSpatialAnchorMSFT;
}
#run {
    instance: XrSpatialAnchorPersistenceInfoMSFT;
    assert(((cast(*void)(*instance.type)) - cast(*void)(*instance)) == 0, "XrSpatialAnchorPersistenceInfoMSFT.type has unexpected offset % instead of 0", ((cast(*void)(*instance.type)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrSpatialAnchorPersistenceInfoMSFT.type)) == 4, "XrSpatialAnchorPersistenceInfoMSFT.type has unexpected size % instead of 4", size_of(type_of(XrSpatialAnchorPersistenceInfoMSFT.type)));
    assert(((cast(*void)(*instance.next)) - cast(*void)(*instance)) == 8, "XrSpatialAnchorPersistenceInfoMSFT.next has unexpected offset % instead of 8", ((cast(*void)(*instance.next)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrSpatialAnchorPersistenceInfoMSFT.next)) == 8, "XrSpatialAnchorPersistenceInfoMSFT.next has unexpected size % instead of 8", size_of(type_of(XrSpatialAnchorPersistenceInfoMSFT.next)));
    assert(((cast(*void)(*instance.spatialAnchorPersistenceName)) - cast(*void)(*instance)) == 16, "XrSpatialAnchorPersistenceInfoMSFT.spatialAnchorPersistenceName has unexpected offset % instead of 16", ((cast(*void)(*instance.spatialAnchorPersistenceName)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrSpatialAnchorPersistenceInfoMSFT.spatialAnchorPersistenceName)) == 256, "XrSpatialAnchorPersistenceInfoMSFT.spatialAnchorPersistenceName has unexpected size % instead of 256", size_of(type_of(XrSpatialAnchorPersistenceInfoMSFT.spatialAnchorPersistenceName)));
    assert(((cast(*void)(*instance.spatialAnchor)) - cast(*void)(*instance)) == 272, "XrSpatialAnchorPersistenceInfoMSFT.spatialAnchor has unexpected offset % instead of 272", ((cast(*void)(*instance.spatialAnchor)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrSpatialAnchorPersistenceInfoMSFT.spatialAnchor)) == 8, "XrSpatialAnchorPersistenceInfoMSFT.spatialAnchor has unexpected size % instead of 8", size_of(type_of(XrSpatialAnchorPersistenceInfoMSFT.spatialAnchor)));
    assert(size_of(XrSpatialAnchorPersistenceInfoMSFT) == 280, "XrSpatialAnchorPersistenceInfoMSFT has size % instead of 280", size_of(XrSpatialAnchorPersistenceInfoMSFT));
}

XrSpatialAnchorFromPersistedAnchorCreateInfoMSFT :: struct {
    type:                         XrStructureType;
    next:                         *void;
    spatialAnchorStore:           XrSpatialAnchorStoreConnectionMSFT;
    spatialAnchorPersistenceName: XrSpatialAnchorPersistenceNameMSFT;
}
#run {
    instance: XrSpatialAnchorFromPersistedAnchorCreateInfoMSFT;
    assert(((cast(*void)(*instance.type)) - cast(*void)(*instance)) == 0, "XrSpatialAnchorFromPersistedAnchorCreateInfoMSFT.type has unexpected offset % instead of 0", ((cast(*void)(*instance.type)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrSpatialAnchorFromPersistedAnchorCreateInfoMSFT.type)) == 4, "XrSpatialAnchorFromPersistedAnchorCreateInfoMSFT.type has unexpected size % instead of 4", size_of(type_of(XrSpatialAnchorFromPersistedAnchorCreateInfoMSFT.type)));
    assert(((cast(*void)(*instance.next)) - cast(*void)(*instance)) == 8, "XrSpatialAnchorFromPersistedAnchorCreateInfoMSFT.next has unexpected offset % instead of 8", ((cast(*void)(*instance.next)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrSpatialAnchorFromPersistedAnchorCreateInfoMSFT.next)) == 8, "XrSpatialAnchorFromPersistedAnchorCreateInfoMSFT.next has unexpected size % instead of 8", size_of(type_of(XrSpatialAnchorFromPersistedAnchorCreateInfoMSFT.next)));
    assert(((cast(*void)(*instance.spatialAnchorStore)) - cast(*void)(*instance)) == 16, "XrSpatialAnchorFromPersistedAnchorCreateInfoMSFT.spatialAnchorStore has unexpected offset % instead of 16", ((cast(*void)(*instance.spatialAnchorStore)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrSpatialAnchorFromPersistedAnchorCreateInfoMSFT.spatialAnchorStore)) == 8, "XrSpatialAnchorFromPersistedAnchorCreateInfoMSFT.spatialAnchorStore has unexpected size % instead of 8", size_of(type_of(XrSpatialAnchorFromPersistedAnchorCreateInfoMSFT.spatialAnchorStore)));
    assert(((cast(*void)(*instance.spatialAnchorPersistenceName)) - cast(*void)(*instance)) == 24, "XrSpatialAnchorFromPersistedAnchorCreateInfoMSFT.spatialAnchorPersistenceName has unexpected offset % instead of 24", ((cast(*void)(*instance.spatialAnchorPersistenceName)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrSpatialAnchorFromPersistedAnchorCreateInfoMSFT.spatialAnchorPersistenceName)) == 256, "XrSpatialAnchorFromPersistedAnchorCreateInfoMSFT.spatialAnchorPersistenceName has unexpected size % instead of 256", size_of(type_of(XrSpatialAnchorFromPersistedAnchorCreateInfoMSFT.spatialAnchorPersistenceName)));
    assert(size_of(XrSpatialAnchorFromPersistedAnchorCreateInfoMSFT) == 280, "XrSpatialAnchorFromPersistedAnchorCreateInfoMSFT has size % instead of 280", size_of(XrSpatialAnchorFromPersistedAnchorCreateInfoMSFT));
}

PFN_xrCreateSpatialAnchorStoreConnectionMSFT :: #type (a0: XrSession, a1: *XrSpatialAnchorStoreConnectionMSFT) -> XrResult #c_call;
PFN_xrDestroySpatialAnchorStoreConnectionMSFT :: #type (a0: XrSpatialAnchorStoreConnectionMSFT) -> XrResult #c_call;
PFN_xrPersistSpatialAnchorMSFT :: #type (a0: XrSpatialAnchorStoreConnectionMSFT, a1: *XrSpatialAnchorPersistenceInfoMSFT) -> XrResult #c_call;
PFN_xrEnumeratePersistedSpatialAnchorNamesMSFT :: #type (a0: XrSpatialAnchorStoreConnectionMSFT, a1: u32, a2: *u32, a3: *XrSpatialAnchorPersistenceNameMSFT) -> XrResult #c_call;
PFN_xrCreateSpatialAnchorFromPersistedNameMSFT :: #type (a0: XrSession, a1: *XrSpatialAnchorFromPersistedAnchorCreateInfoMSFT, a2: *XrSpatialAnchorMSFT) -> XrResult #c_call;
PFN_xrUnpersistSpatialAnchorMSFT :: #type (a0: XrSpatialAnchorStoreConnectionMSFT, a1: *XrSpatialAnchorPersistenceNameMSFT) -> XrResult #c_call;
PFN_xrClearSpatialAnchorStoreMSFT :: #type (a0: XrSpatialAnchorStoreConnectionMSFT) -> XrResult #c_call;

XrHandForearmJointULTRALEAP :: enum s32 {
    PALM_ULTRALEAP                :: 0;
    WRIST_ULTRALEAP               :: 1;
    THUMB_METACARPAL_ULTRALEAP    :: 2;
    THUMB_PROXIMAL_ULTRALEAP      :: 3;
    THUMB_DISTAL_ULTRALEAP        :: 4;
    THUMB_TIP_ULTRALEAP           :: 5;
    INDEX_METACARPAL_ULTRALEAP    :: 6;
    INDEX_PROXIMAL_ULTRALEAP      :: 7;
    INDEX_INTERMEDIATE_ULTRALEAP  :: 8;
    INDEX_DISTAL_ULTRALEAP        :: 9;
    INDEX_TIP_ULTRALEAP           :: 10;
    MIDDLE_METACARPAL_ULTRALEAP   :: 11;
    MIDDLE_PROXIMAL_ULTRALEAP     :: 12;
    MIDDLE_INTERMEDIATE_ULTRALEAP :: 13;
    MIDDLE_DISTAL_ULTRALEAP       :: 14;
    MIDDLE_TIP_ULTRALEAP          :: 15;
    RING_METACARPAL_ULTRALEAP     :: 16;
    RING_PROXIMAL_ULTRALEAP       :: 17;
    RING_INTERMEDIATE_ULTRALEAP   :: 18;
    RING_DISTAL_ULTRALEAP         :: 19;
    RING_TIP_ULTRALEAP            :: 20;
    LITTLE_METACARPAL_ULTRALEAP   :: 21;
    LITTLE_PROXIMAL_ULTRALEAP     :: 22;
    LITTLE_INTERMEDIATE_ULTRALEAP :: 23;
    LITTLE_DISTAL_ULTRALEAP       :: 24;
    LITTLE_TIP_ULTRALEAP          :: 25;
    ELBOW_ULTRALEAP               :: 26;
    MAX_ENUM_ULTRALEAP            :: 2147483647;

    XR_HAND_FOREARM_JOINT_PALM_ULTRALEAP                :: PALM_ULTRALEAP;
    XR_HAND_FOREARM_JOINT_WRIST_ULTRALEAP               :: WRIST_ULTRALEAP;
    XR_HAND_FOREARM_JOINT_THUMB_METACARPAL_ULTRALEAP    :: THUMB_METACARPAL_ULTRALEAP;
    XR_HAND_FOREARM_JOINT_THUMB_PROXIMAL_ULTRALEAP      :: THUMB_PROXIMAL_ULTRALEAP;
    XR_HAND_FOREARM_JOINT_THUMB_DISTAL_ULTRALEAP        :: THUMB_DISTAL_ULTRALEAP;
    XR_HAND_FOREARM_JOINT_THUMB_TIP_ULTRALEAP           :: THUMB_TIP_ULTRALEAP;
    XR_HAND_FOREARM_JOINT_INDEX_METACARPAL_ULTRALEAP    :: INDEX_METACARPAL_ULTRALEAP;
    XR_HAND_FOREARM_JOINT_INDEX_PROXIMAL_ULTRALEAP      :: INDEX_PROXIMAL_ULTRALEAP;
    XR_HAND_FOREARM_JOINT_INDEX_INTERMEDIATE_ULTRALEAP  :: INDEX_INTERMEDIATE_ULTRALEAP;
    XR_HAND_FOREARM_JOINT_INDEX_DISTAL_ULTRALEAP        :: INDEX_DISTAL_ULTRALEAP;
    XR_HAND_FOREARM_JOINT_INDEX_TIP_ULTRALEAP           :: INDEX_TIP_ULTRALEAP;
    XR_HAND_FOREARM_JOINT_MIDDLE_METACARPAL_ULTRALEAP   :: MIDDLE_METACARPAL_ULTRALEAP;
    XR_HAND_FOREARM_JOINT_MIDDLE_PROXIMAL_ULTRALEAP     :: MIDDLE_PROXIMAL_ULTRALEAP;
    XR_HAND_FOREARM_JOINT_MIDDLE_INTERMEDIATE_ULTRALEAP :: MIDDLE_INTERMEDIATE_ULTRALEAP;
    XR_HAND_FOREARM_JOINT_MIDDLE_DISTAL_ULTRALEAP       :: MIDDLE_DISTAL_ULTRALEAP;
    XR_HAND_FOREARM_JOINT_MIDDLE_TIP_ULTRALEAP          :: MIDDLE_TIP_ULTRALEAP;
    XR_HAND_FOREARM_JOINT_RING_METACARPAL_ULTRALEAP     :: RING_METACARPAL_ULTRALEAP;
    XR_HAND_FOREARM_JOINT_RING_PROXIMAL_ULTRALEAP       :: RING_PROXIMAL_ULTRALEAP;
    XR_HAND_FOREARM_JOINT_RING_INTERMEDIATE_ULTRALEAP   :: RING_INTERMEDIATE_ULTRALEAP;
    XR_HAND_FOREARM_JOINT_RING_DISTAL_ULTRALEAP         :: RING_DISTAL_ULTRALEAP;
    XR_HAND_FOREARM_JOINT_RING_TIP_ULTRALEAP            :: RING_TIP_ULTRALEAP;
    XR_HAND_FOREARM_JOINT_LITTLE_METACARPAL_ULTRALEAP   :: LITTLE_METACARPAL_ULTRALEAP;
    XR_HAND_FOREARM_JOINT_LITTLE_PROXIMAL_ULTRALEAP     :: LITTLE_PROXIMAL_ULTRALEAP;
    XR_HAND_FOREARM_JOINT_LITTLE_INTERMEDIATE_ULTRALEAP :: LITTLE_INTERMEDIATE_ULTRALEAP;
    XR_HAND_FOREARM_JOINT_LITTLE_DISTAL_ULTRALEAP       :: LITTLE_DISTAL_ULTRALEAP;
    XR_HAND_FOREARM_JOINT_LITTLE_TIP_ULTRALEAP          :: LITTLE_TIP_ULTRALEAP;
    XR_HAND_FOREARM_JOINT_ELBOW_ULTRALEAP               :: ELBOW_ULTRALEAP;
    XR_HAND_FOREARM_JOINT_MAX_ENUM_ULTRALEAP            :: MAX_ENUM_ULTRALEAP;
}

XrSpaceQueryActionFB :: enum s32 {
    LOAD_FB     :: 0;
    MAX_ENUM_FB :: 2147483647;

    XR_SPACE_QUERY_ACTION_LOAD_FB     :: LOAD_FB;
    XR_SPACE_QUERY_ACTION_MAX_ENUM_FB :: MAX_ENUM_FB;
}

XrSpaceStorageLocationFB :: enum s32 {
    INVALID_FB  :: 0;
    LOCAL_FB    :: 1;
    MAX_ENUM_FB :: 2147483647;

    XR_SPACE_STORAGE_LOCATION_INVALID_FB  :: INVALID_FB;
    XR_SPACE_STORAGE_LOCATION_LOCAL_FB    :: LOCAL_FB;
    XR_SPACE_STORAGE_LOCATION_MAX_ENUM_FB :: MAX_ENUM_FB;
}

XrSpaceQueryInfoBaseHeaderFB :: struct {
    type: XrStructureType;
    next: *void;
}
#run {
    instance: XrSpaceQueryInfoBaseHeaderFB;
    assert(((cast(*void)(*instance.type)) - cast(*void)(*instance)) == 0, "XrSpaceQueryInfoBaseHeaderFB.type has unexpected offset % instead of 0", ((cast(*void)(*instance.type)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrSpaceQueryInfoBaseHeaderFB.type)) == 4, "XrSpaceQueryInfoBaseHeaderFB.type has unexpected size % instead of 4", size_of(type_of(XrSpaceQueryInfoBaseHeaderFB.type)));
    assert(((cast(*void)(*instance.next)) - cast(*void)(*instance)) == 8, "XrSpaceQueryInfoBaseHeaderFB.next has unexpected offset % instead of 8", ((cast(*void)(*instance.next)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrSpaceQueryInfoBaseHeaderFB.next)) == 8, "XrSpaceQueryInfoBaseHeaderFB.next has unexpected size % instead of 8", size_of(type_of(XrSpaceQueryInfoBaseHeaderFB.next)));
    assert(size_of(XrSpaceQueryInfoBaseHeaderFB) == 16, "XrSpaceQueryInfoBaseHeaderFB has size % instead of 16", size_of(XrSpaceQueryInfoBaseHeaderFB));
}

XrSpaceFilterInfoBaseHeaderFB :: struct {
    type: XrStructureType;
    next: *void;
}
#run {
    instance: XrSpaceFilterInfoBaseHeaderFB;
    assert(((cast(*void)(*instance.type)) - cast(*void)(*instance)) == 0, "XrSpaceFilterInfoBaseHeaderFB.type has unexpected offset % instead of 0", ((cast(*void)(*instance.type)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrSpaceFilterInfoBaseHeaderFB.type)) == 4, "XrSpaceFilterInfoBaseHeaderFB.type has unexpected size % instead of 4", size_of(type_of(XrSpaceFilterInfoBaseHeaderFB.type)));
    assert(((cast(*void)(*instance.next)) - cast(*void)(*instance)) == 8, "XrSpaceFilterInfoBaseHeaderFB.next has unexpected offset % instead of 8", ((cast(*void)(*instance.next)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrSpaceFilterInfoBaseHeaderFB.next)) == 8, "XrSpaceFilterInfoBaseHeaderFB.next has unexpected size % instead of 8", size_of(type_of(XrSpaceFilterInfoBaseHeaderFB.next)));
    assert(size_of(XrSpaceFilterInfoBaseHeaderFB) == 16, "XrSpaceFilterInfoBaseHeaderFB has size % instead of 16", size_of(XrSpaceFilterInfoBaseHeaderFB));
}

XrSpaceQueryInfoFB :: struct {
    type:           XrStructureType;
    next:           *void;
    queryAction:    XrSpaceQueryActionFB;
    maxResultCount: u32;
    timeout:        XrDuration;
    filter:         *XrSpaceFilterInfoBaseHeaderFB;
    excludeFilter:  *XrSpaceFilterInfoBaseHeaderFB;
}
#run {
    instance: XrSpaceQueryInfoFB;
    assert(((cast(*void)(*instance.type)) - cast(*void)(*instance)) == 0, "XrSpaceQueryInfoFB.type has unexpected offset % instead of 0", ((cast(*void)(*instance.type)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrSpaceQueryInfoFB.type)) == 4, "XrSpaceQueryInfoFB.type has unexpected size % instead of 4", size_of(type_of(XrSpaceQueryInfoFB.type)));
    assert(((cast(*void)(*instance.next)) - cast(*void)(*instance)) == 8, "XrSpaceQueryInfoFB.next has unexpected offset % instead of 8", ((cast(*void)(*instance.next)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrSpaceQueryInfoFB.next)) == 8, "XrSpaceQueryInfoFB.next has unexpected size % instead of 8", size_of(type_of(XrSpaceQueryInfoFB.next)));
    assert(((cast(*void)(*instance.queryAction)) - cast(*void)(*instance)) == 16, "XrSpaceQueryInfoFB.queryAction has unexpected offset % instead of 16", ((cast(*void)(*instance.queryAction)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrSpaceQueryInfoFB.queryAction)) == 4, "XrSpaceQueryInfoFB.queryAction has unexpected size % instead of 4", size_of(type_of(XrSpaceQueryInfoFB.queryAction)));
    assert(((cast(*void)(*instance.maxResultCount)) - cast(*void)(*instance)) == 20, "XrSpaceQueryInfoFB.maxResultCount has unexpected offset % instead of 20", ((cast(*void)(*instance.maxResultCount)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrSpaceQueryInfoFB.maxResultCount)) == 4, "XrSpaceQueryInfoFB.maxResultCount has unexpected size % instead of 4", size_of(type_of(XrSpaceQueryInfoFB.maxResultCount)));
    assert(((cast(*void)(*instance.timeout)) - cast(*void)(*instance)) == 24, "XrSpaceQueryInfoFB.timeout has unexpected offset % instead of 24", ((cast(*void)(*instance.timeout)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrSpaceQueryInfoFB.timeout)) == 8, "XrSpaceQueryInfoFB.timeout has unexpected size % instead of 8", size_of(type_of(XrSpaceQueryInfoFB.timeout)));
    assert(((cast(*void)(*instance.filter)) - cast(*void)(*instance)) == 32, "XrSpaceQueryInfoFB.filter has unexpected offset % instead of 32", ((cast(*void)(*instance.filter)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrSpaceQueryInfoFB.filter)) == 8, "XrSpaceQueryInfoFB.filter has unexpected size % instead of 8", size_of(type_of(XrSpaceQueryInfoFB.filter)));
    assert(((cast(*void)(*instance.excludeFilter)) - cast(*void)(*instance)) == 40, "XrSpaceQueryInfoFB.excludeFilter has unexpected offset % instead of 40", ((cast(*void)(*instance.excludeFilter)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrSpaceQueryInfoFB.excludeFilter)) == 8, "XrSpaceQueryInfoFB.excludeFilter has unexpected size % instead of 8", size_of(type_of(XrSpaceQueryInfoFB.excludeFilter)));
    assert(size_of(XrSpaceQueryInfoFB) == 48, "XrSpaceQueryInfoFB has size % instead of 48", size_of(XrSpaceQueryInfoFB));
}

// XrSpaceStorageLocationFilterInfoFB extends XrSpaceFilterInfoBaseHeaderFB
XrSpaceStorageLocationFilterInfoFB :: struct {
    type:     XrStructureType;
    next:     *void;
    location: XrSpaceStorageLocationFB;
}
#run {
    instance: XrSpaceStorageLocationFilterInfoFB;
    assert(((cast(*void)(*instance.type)) - cast(*void)(*instance)) == 0, "XrSpaceStorageLocationFilterInfoFB.type has unexpected offset % instead of 0", ((cast(*void)(*instance.type)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrSpaceStorageLocationFilterInfoFB.type)) == 4, "XrSpaceStorageLocationFilterInfoFB.type has unexpected size % instead of 4", size_of(type_of(XrSpaceStorageLocationFilterInfoFB.type)));
    assert(((cast(*void)(*instance.next)) - cast(*void)(*instance)) == 8, "XrSpaceStorageLocationFilterInfoFB.next has unexpected offset % instead of 8", ((cast(*void)(*instance.next)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrSpaceStorageLocationFilterInfoFB.next)) == 8, "XrSpaceStorageLocationFilterInfoFB.next has unexpected size % instead of 8", size_of(type_of(XrSpaceStorageLocationFilterInfoFB.next)));
    assert(((cast(*void)(*instance.location)) - cast(*void)(*instance)) == 16, "XrSpaceStorageLocationFilterInfoFB.location has unexpected offset % instead of 16", ((cast(*void)(*instance.location)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrSpaceStorageLocationFilterInfoFB.location)) == 4, "XrSpaceStorageLocationFilterInfoFB.location has unexpected size % instead of 4", size_of(type_of(XrSpaceStorageLocationFilterInfoFB.location)));
    assert(size_of(XrSpaceStorageLocationFilterInfoFB) == 24, "XrSpaceStorageLocationFilterInfoFB has size % instead of 24", size_of(XrSpaceStorageLocationFilterInfoFB));
}

XrSpaceUuidFilterInfoFB :: struct {
    type:      XrStructureType;
    next:      *void;
    uuidCount: u32;
    uuids:     *XrUuidEXT;
}
#run {
    instance: XrSpaceUuidFilterInfoFB;
    assert(((cast(*void)(*instance.type)) - cast(*void)(*instance)) == 0, "XrSpaceUuidFilterInfoFB.type has unexpected offset % instead of 0", ((cast(*void)(*instance.type)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrSpaceUuidFilterInfoFB.type)) == 4, "XrSpaceUuidFilterInfoFB.type has unexpected size % instead of 4", size_of(type_of(XrSpaceUuidFilterInfoFB.type)));
    assert(((cast(*void)(*instance.next)) - cast(*void)(*instance)) == 8, "XrSpaceUuidFilterInfoFB.next has unexpected offset % instead of 8", ((cast(*void)(*instance.next)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrSpaceUuidFilterInfoFB.next)) == 8, "XrSpaceUuidFilterInfoFB.next has unexpected size % instead of 8", size_of(type_of(XrSpaceUuidFilterInfoFB.next)));
    assert(((cast(*void)(*instance.uuidCount)) - cast(*void)(*instance)) == 16, "XrSpaceUuidFilterInfoFB.uuidCount has unexpected offset % instead of 16", ((cast(*void)(*instance.uuidCount)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrSpaceUuidFilterInfoFB.uuidCount)) == 4, "XrSpaceUuidFilterInfoFB.uuidCount has unexpected size % instead of 4", size_of(type_of(XrSpaceUuidFilterInfoFB.uuidCount)));
    assert(((cast(*void)(*instance.uuids)) - cast(*void)(*instance)) == 24, "XrSpaceUuidFilterInfoFB.uuids has unexpected offset % instead of 24", ((cast(*void)(*instance.uuids)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrSpaceUuidFilterInfoFB.uuids)) == 8, "XrSpaceUuidFilterInfoFB.uuids has unexpected size % instead of 8", size_of(type_of(XrSpaceUuidFilterInfoFB.uuids)));
    assert(size_of(XrSpaceUuidFilterInfoFB) == 32, "XrSpaceUuidFilterInfoFB has size % instead of 32", size_of(XrSpaceUuidFilterInfoFB));
}

XrSpaceComponentFilterInfoFB :: struct {
    type:          XrStructureType;
    next:          *void;
    componentType: XrSpaceComponentTypeFB;
}
#run {
    instance: XrSpaceComponentFilterInfoFB;
    assert(((cast(*void)(*instance.type)) - cast(*void)(*instance)) == 0, "XrSpaceComponentFilterInfoFB.type has unexpected offset % instead of 0", ((cast(*void)(*instance.type)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrSpaceComponentFilterInfoFB.type)) == 4, "XrSpaceComponentFilterInfoFB.type has unexpected size % instead of 4", size_of(type_of(XrSpaceComponentFilterInfoFB.type)));
    assert(((cast(*void)(*instance.next)) - cast(*void)(*instance)) == 8, "XrSpaceComponentFilterInfoFB.next has unexpected offset % instead of 8", ((cast(*void)(*instance.next)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrSpaceComponentFilterInfoFB.next)) == 8, "XrSpaceComponentFilterInfoFB.next has unexpected size % instead of 8", size_of(type_of(XrSpaceComponentFilterInfoFB.next)));
    assert(((cast(*void)(*instance.componentType)) - cast(*void)(*instance)) == 16, "XrSpaceComponentFilterInfoFB.componentType has unexpected offset % instead of 16", ((cast(*void)(*instance.componentType)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrSpaceComponentFilterInfoFB.componentType)) == 4, "XrSpaceComponentFilterInfoFB.componentType has unexpected size % instead of 4", size_of(type_of(XrSpaceComponentFilterInfoFB.componentType)));
    assert(size_of(XrSpaceComponentFilterInfoFB) == 24, "XrSpaceComponentFilterInfoFB has size % instead of 24", size_of(XrSpaceComponentFilterInfoFB));
}

XrSpaceQueryResultFB :: struct {
    space: XrSpace;
    uuid:  XrUuidEXT;
}
#run {
    instance: XrSpaceQueryResultFB;
    assert(((cast(*void)(*instance.space)) - cast(*void)(*instance)) == 0, "XrSpaceQueryResultFB.space has unexpected offset % instead of 0", ((cast(*void)(*instance.space)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrSpaceQueryResultFB.space)) == 8, "XrSpaceQueryResultFB.space has unexpected size % instead of 8", size_of(type_of(XrSpaceQueryResultFB.space)));
    assert(((cast(*void)(*instance.uuid)) - cast(*void)(*instance)) == 8, "XrSpaceQueryResultFB.uuid has unexpected offset % instead of 8", ((cast(*void)(*instance.uuid)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrSpaceQueryResultFB.uuid)) == 16, "XrSpaceQueryResultFB.uuid has unexpected size % instead of 16", size_of(type_of(XrSpaceQueryResultFB.uuid)));
    assert(size_of(XrSpaceQueryResultFB) == 24, "XrSpaceQueryResultFB has size % instead of 24", size_of(XrSpaceQueryResultFB));
}

XrSpaceQueryResultsFB :: struct {
    type:                XrStructureType;
    next:                *void;
    resultCapacityInput: u32;
    resultCountOutput:   u32;
    results:             *XrSpaceQueryResultFB;
}
#run {
    instance: XrSpaceQueryResultsFB;
    assert(((cast(*void)(*instance.type)) - cast(*void)(*instance)) == 0, "XrSpaceQueryResultsFB.type has unexpected offset % instead of 0", ((cast(*void)(*instance.type)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrSpaceQueryResultsFB.type)) == 4, "XrSpaceQueryResultsFB.type has unexpected size % instead of 4", size_of(type_of(XrSpaceQueryResultsFB.type)));
    assert(((cast(*void)(*instance.next)) - cast(*void)(*instance)) == 8, "XrSpaceQueryResultsFB.next has unexpected offset % instead of 8", ((cast(*void)(*instance.next)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrSpaceQueryResultsFB.next)) == 8, "XrSpaceQueryResultsFB.next has unexpected size % instead of 8", size_of(type_of(XrSpaceQueryResultsFB.next)));
    assert(((cast(*void)(*instance.resultCapacityInput)) - cast(*void)(*instance)) == 16, "XrSpaceQueryResultsFB.resultCapacityInput has unexpected offset % instead of 16", ((cast(*void)(*instance.resultCapacityInput)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrSpaceQueryResultsFB.resultCapacityInput)) == 4, "XrSpaceQueryResultsFB.resultCapacityInput has unexpected size % instead of 4", size_of(type_of(XrSpaceQueryResultsFB.resultCapacityInput)));
    assert(((cast(*void)(*instance.resultCountOutput)) - cast(*void)(*instance)) == 20, "XrSpaceQueryResultsFB.resultCountOutput has unexpected offset % instead of 20", ((cast(*void)(*instance.resultCountOutput)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrSpaceQueryResultsFB.resultCountOutput)) == 4, "XrSpaceQueryResultsFB.resultCountOutput has unexpected size % instead of 4", size_of(type_of(XrSpaceQueryResultsFB.resultCountOutput)));
    assert(((cast(*void)(*instance.results)) - cast(*void)(*instance)) == 24, "XrSpaceQueryResultsFB.results has unexpected offset % instead of 24", ((cast(*void)(*instance.results)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrSpaceQueryResultsFB.results)) == 8, "XrSpaceQueryResultsFB.results has unexpected size % instead of 8", size_of(type_of(XrSpaceQueryResultsFB.results)));
    assert(size_of(XrSpaceQueryResultsFB) == 32, "XrSpaceQueryResultsFB has size % instead of 32", size_of(XrSpaceQueryResultsFB));
}

XrEventDataSpaceQueryResultsAvailableFB :: struct {
    type:      XrStructureType;
    next:      *void;
    requestId: XrAsyncRequestIdFB;
}
#run {
    instance: XrEventDataSpaceQueryResultsAvailableFB;
    assert(((cast(*void)(*instance.type)) - cast(*void)(*instance)) == 0, "XrEventDataSpaceQueryResultsAvailableFB.type has unexpected offset % instead of 0", ((cast(*void)(*instance.type)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrEventDataSpaceQueryResultsAvailableFB.type)) == 4, "XrEventDataSpaceQueryResultsAvailableFB.type has unexpected size % instead of 4", size_of(type_of(XrEventDataSpaceQueryResultsAvailableFB.type)));
    assert(((cast(*void)(*instance.next)) - cast(*void)(*instance)) == 8, "XrEventDataSpaceQueryResultsAvailableFB.next has unexpected offset % instead of 8", ((cast(*void)(*instance.next)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrEventDataSpaceQueryResultsAvailableFB.next)) == 8, "XrEventDataSpaceQueryResultsAvailableFB.next has unexpected size % instead of 8", size_of(type_of(XrEventDataSpaceQueryResultsAvailableFB.next)));
    assert(((cast(*void)(*instance.requestId)) - cast(*void)(*instance)) == 16, "XrEventDataSpaceQueryResultsAvailableFB.requestId has unexpected offset % instead of 16", ((cast(*void)(*instance.requestId)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrEventDataSpaceQueryResultsAvailableFB.requestId)) == 8, "XrEventDataSpaceQueryResultsAvailableFB.requestId has unexpected size % instead of 8", size_of(type_of(XrEventDataSpaceQueryResultsAvailableFB.requestId)));
    assert(size_of(XrEventDataSpaceQueryResultsAvailableFB) == 24, "XrEventDataSpaceQueryResultsAvailableFB has size % instead of 24", size_of(XrEventDataSpaceQueryResultsAvailableFB));
}

XrEventDataSpaceQueryCompleteFB :: struct {
    type:      XrStructureType;
    next:      *void;
    requestId: XrAsyncRequestIdFB;
    result:    XrResult;
}
#run {
    instance: XrEventDataSpaceQueryCompleteFB;
    assert(((cast(*void)(*instance.type)) - cast(*void)(*instance)) == 0, "XrEventDataSpaceQueryCompleteFB.type has unexpected offset % instead of 0", ((cast(*void)(*instance.type)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrEventDataSpaceQueryCompleteFB.type)) == 4, "XrEventDataSpaceQueryCompleteFB.type has unexpected size % instead of 4", size_of(type_of(XrEventDataSpaceQueryCompleteFB.type)));
    assert(((cast(*void)(*instance.next)) - cast(*void)(*instance)) == 8, "XrEventDataSpaceQueryCompleteFB.next has unexpected offset % instead of 8", ((cast(*void)(*instance.next)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrEventDataSpaceQueryCompleteFB.next)) == 8, "XrEventDataSpaceQueryCompleteFB.next has unexpected size % instead of 8", size_of(type_of(XrEventDataSpaceQueryCompleteFB.next)));
    assert(((cast(*void)(*instance.requestId)) - cast(*void)(*instance)) == 16, "XrEventDataSpaceQueryCompleteFB.requestId has unexpected offset % instead of 16", ((cast(*void)(*instance.requestId)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrEventDataSpaceQueryCompleteFB.requestId)) == 8, "XrEventDataSpaceQueryCompleteFB.requestId has unexpected size % instead of 8", size_of(type_of(XrEventDataSpaceQueryCompleteFB.requestId)));
    assert(((cast(*void)(*instance.result)) - cast(*void)(*instance)) == 24, "XrEventDataSpaceQueryCompleteFB.result has unexpected offset % instead of 24", ((cast(*void)(*instance.result)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrEventDataSpaceQueryCompleteFB.result)) == 4, "XrEventDataSpaceQueryCompleteFB.result has unexpected size % instead of 4", size_of(type_of(XrEventDataSpaceQueryCompleteFB.result)));
    assert(size_of(XrEventDataSpaceQueryCompleteFB) == 32, "XrEventDataSpaceQueryCompleteFB has size % instead of 32", size_of(XrEventDataSpaceQueryCompleteFB));
}

PFN_xrQuerySpacesFB :: #type (a0: XrSession, a1: *XrSpaceQueryInfoBaseHeaderFB, a2: *XrAsyncRequestIdFB) -> XrResult #c_call;
PFN_xrRetrieveSpaceQueryResultsFB :: #type (a0: XrSession, a1: XrAsyncRequestIdFB, a2: *XrSpaceQueryResultsFB) -> XrResult #c_call;

XrSpacePersistenceModeFB :: enum s32 {
    INVALID_FB    :: 0;
    INDEFINITE_FB :: 1;
    MAX_ENUM_FB   :: 2147483647;

    XR_SPACE_PERSISTENCE_MODE_INVALID_FB    :: INVALID_FB;
    XR_SPACE_PERSISTENCE_MODE_INDEFINITE_FB :: INDEFINITE_FB;
    XR_SPACE_PERSISTENCE_MODE_MAX_ENUM_FB   :: MAX_ENUM_FB;
}

XrSpaceSaveInfoFB :: struct {
    type:            XrStructureType;
    next:            *void;
    space:           XrSpace;
    location:        XrSpaceStorageLocationFB;
    persistenceMode: XrSpacePersistenceModeFB;
}
#run {
    instance: XrSpaceSaveInfoFB;
    assert(((cast(*void)(*instance.type)) - cast(*void)(*instance)) == 0, "XrSpaceSaveInfoFB.type has unexpected offset % instead of 0", ((cast(*void)(*instance.type)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrSpaceSaveInfoFB.type)) == 4, "XrSpaceSaveInfoFB.type has unexpected size % instead of 4", size_of(type_of(XrSpaceSaveInfoFB.type)));
    assert(((cast(*void)(*instance.next)) - cast(*void)(*instance)) == 8, "XrSpaceSaveInfoFB.next has unexpected offset % instead of 8", ((cast(*void)(*instance.next)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrSpaceSaveInfoFB.next)) == 8, "XrSpaceSaveInfoFB.next has unexpected size % instead of 8", size_of(type_of(XrSpaceSaveInfoFB.next)));
    assert(((cast(*void)(*instance.space)) - cast(*void)(*instance)) == 16, "XrSpaceSaveInfoFB.space has unexpected offset % instead of 16", ((cast(*void)(*instance.space)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrSpaceSaveInfoFB.space)) == 8, "XrSpaceSaveInfoFB.space has unexpected size % instead of 8", size_of(type_of(XrSpaceSaveInfoFB.space)));
    assert(((cast(*void)(*instance.location)) - cast(*void)(*instance)) == 24, "XrSpaceSaveInfoFB.location has unexpected offset % instead of 24", ((cast(*void)(*instance.location)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrSpaceSaveInfoFB.location)) == 4, "XrSpaceSaveInfoFB.location has unexpected size % instead of 4", size_of(type_of(XrSpaceSaveInfoFB.location)));
    assert(((cast(*void)(*instance.persistenceMode)) - cast(*void)(*instance)) == 28, "XrSpaceSaveInfoFB.persistenceMode has unexpected offset % instead of 28", ((cast(*void)(*instance.persistenceMode)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrSpaceSaveInfoFB.persistenceMode)) == 4, "XrSpaceSaveInfoFB.persistenceMode has unexpected size % instead of 4", size_of(type_of(XrSpaceSaveInfoFB.persistenceMode)));
    assert(size_of(XrSpaceSaveInfoFB) == 32, "XrSpaceSaveInfoFB has size % instead of 32", size_of(XrSpaceSaveInfoFB));
}

XrSpaceEraseInfoFB :: struct {
    type:     XrStructureType;
    next:     *void;
    space:    XrSpace;
    location: XrSpaceStorageLocationFB;
}
#run {
    instance: XrSpaceEraseInfoFB;
    assert(((cast(*void)(*instance.type)) - cast(*void)(*instance)) == 0, "XrSpaceEraseInfoFB.type has unexpected offset % instead of 0", ((cast(*void)(*instance.type)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrSpaceEraseInfoFB.type)) == 4, "XrSpaceEraseInfoFB.type has unexpected size % instead of 4", size_of(type_of(XrSpaceEraseInfoFB.type)));
    assert(((cast(*void)(*instance.next)) - cast(*void)(*instance)) == 8, "XrSpaceEraseInfoFB.next has unexpected offset % instead of 8", ((cast(*void)(*instance.next)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrSpaceEraseInfoFB.next)) == 8, "XrSpaceEraseInfoFB.next has unexpected size % instead of 8", size_of(type_of(XrSpaceEraseInfoFB.next)));
    assert(((cast(*void)(*instance.space)) - cast(*void)(*instance)) == 16, "XrSpaceEraseInfoFB.space has unexpected offset % instead of 16", ((cast(*void)(*instance.space)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrSpaceEraseInfoFB.space)) == 8, "XrSpaceEraseInfoFB.space has unexpected size % instead of 8", size_of(type_of(XrSpaceEraseInfoFB.space)));
    assert(((cast(*void)(*instance.location)) - cast(*void)(*instance)) == 24, "XrSpaceEraseInfoFB.location has unexpected offset % instead of 24", ((cast(*void)(*instance.location)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrSpaceEraseInfoFB.location)) == 4, "XrSpaceEraseInfoFB.location has unexpected size % instead of 4", size_of(type_of(XrSpaceEraseInfoFB.location)));
    assert(size_of(XrSpaceEraseInfoFB) == 32, "XrSpaceEraseInfoFB has size % instead of 32", size_of(XrSpaceEraseInfoFB));
}

XrEventDataSpaceSaveCompleteFB :: struct {
    type:      XrStructureType;
    next:      *void;
    requestId: XrAsyncRequestIdFB;
    result:    XrResult;
    space:     XrSpace;
    uuid:      XrUuidEXT;
    location:  XrSpaceStorageLocationFB;
}
#run {
    instance: XrEventDataSpaceSaveCompleteFB;
    assert(((cast(*void)(*instance.type)) - cast(*void)(*instance)) == 0, "XrEventDataSpaceSaveCompleteFB.type has unexpected offset % instead of 0", ((cast(*void)(*instance.type)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrEventDataSpaceSaveCompleteFB.type)) == 4, "XrEventDataSpaceSaveCompleteFB.type has unexpected size % instead of 4", size_of(type_of(XrEventDataSpaceSaveCompleteFB.type)));
    assert(((cast(*void)(*instance.next)) - cast(*void)(*instance)) == 8, "XrEventDataSpaceSaveCompleteFB.next has unexpected offset % instead of 8", ((cast(*void)(*instance.next)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrEventDataSpaceSaveCompleteFB.next)) == 8, "XrEventDataSpaceSaveCompleteFB.next has unexpected size % instead of 8", size_of(type_of(XrEventDataSpaceSaveCompleteFB.next)));
    assert(((cast(*void)(*instance.requestId)) - cast(*void)(*instance)) == 16, "XrEventDataSpaceSaveCompleteFB.requestId has unexpected offset % instead of 16", ((cast(*void)(*instance.requestId)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrEventDataSpaceSaveCompleteFB.requestId)) == 8, "XrEventDataSpaceSaveCompleteFB.requestId has unexpected size % instead of 8", size_of(type_of(XrEventDataSpaceSaveCompleteFB.requestId)));
    assert(((cast(*void)(*instance.result)) - cast(*void)(*instance)) == 24, "XrEventDataSpaceSaveCompleteFB.result has unexpected offset % instead of 24", ((cast(*void)(*instance.result)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrEventDataSpaceSaveCompleteFB.result)) == 4, "XrEventDataSpaceSaveCompleteFB.result has unexpected size % instead of 4", size_of(type_of(XrEventDataSpaceSaveCompleteFB.result)));
    assert(((cast(*void)(*instance.space)) - cast(*void)(*instance)) == 32, "XrEventDataSpaceSaveCompleteFB.space has unexpected offset % instead of 32", ((cast(*void)(*instance.space)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrEventDataSpaceSaveCompleteFB.space)) == 8, "XrEventDataSpaceSaveCompleteFB.space has unexpected size % instead of 8", size_of(type_of(XrEventDataSpaceSaveCompleteFB.space)));
    assert(((cast(*void)(*instance.uuid)) - cast(*void)(*instance)) == 40, "XrEventDataSpaceSaveCompleteFB.uuid has unexpected offset % instead of 40", ((cast(*void)(*instance.uuid)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrEventDataSpaceSaveCompleteFB.uuid)) == 16, "XrEventDataSpaceSaveCompleteFB.uuid has unexpected size % instead of 16", size_of(type_of(XrEventDataSpaceSaveCompleteFB.uuid)));
    assert(((cast(*void)(*instance.location)) - cast(*void)(*instance)) == 56, "XrEventDataSpaceSaveCompleteFB.location has unexpected offset % instead of 56", ((cast(*void)(*instance.location)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrEventDataSpaceSaveCompleteFB.location)) == 4, "XrEventDataSpaceSaveCompleteFB.location has unexpected size % instead of 4", size_of(type_of(XrEventDataSpaceSaveCompleteFB.location)));
    assert(size_of(XrEventDataSpaceSaveCompleteFB) == 64, "XrEventDataSpaceSaveCompleteFB has size % instead of 64", size_of(XrEventDataSpaceSaveCompleteFB));
}

XrEventDataSpaceEraseCompleteFB :: struct {
    type:      XrStructureType;
    next:      *void;
    requestId: XrAsyncRequestIdFB;
    result:    XrResult;
    space:     XrSpace;
    uuid:      XrUuidEXT;
    location:  XrSpaceStorageLocationFB;
}
#run {
    instance: XrEventDataSpaceEraseCompleteFB;
    assert(((cast(*void)(*instance.type)) - cast(*void)(*instance)) == 0, "XrEventDataSpaceEraseCompleteFB.type has unexpected offset % instead of 0", ((cast(*void)(*instance.type)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrEventDataSpaceEraseCompleteFB.type)) == 4, "XrEventDataSpaceEraseCompleteFB.type has unexpected size % instead of 4", size_of(type_of(XrEventDataSpaceEraseCompleteFB.type)));
    assert(((cast(*void)(*instance.next)) - cast(*void)(*instance)) == 8, "XrEventDataSpaceEraseCompleteFB.next has unexpected offset % instead of 8", ((cast(*void)(*instance.next)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrEventDataSpaceEraseCompleteFB.next)) == 8, "XrEventDataSpaceEraseCompleteFB.next has unexpected size % instead of 8", size_of(type_of(XrEventDataSpaceEraseCompleteFB.next)));
    assert(((cast(*void)(*instance.requestId)) - cast(*void)(*instance)) == 16, "XrEventDataSpaceEraseCompleteFB.requestId has unexpected offset % instead of 16", ((cast(*void)(*instance.requestId)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrEventDataSpaceEraseCompleteFB.requestId)) == 8, "XrEventDataSpaceEraseCompleteFB.requestId has unexpected size % instead of 8", size_of(type_of(XrEventDataSpaceEraseCompleteFB.requestId)));
    assert(((cast(*void)(*instance.result)) - cast(*void)(*instance)) == 24, "XrEventDataSpaceEraseCompleteFB.result has unexpected offset % instead of 24", ((cast(*void)(*instance.result)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrEventDataSpaceEraseCompleteFB.result)) == 4, "XrEventDataSpaceEraseCompleteFB.result has unexpected size % instead of 4", size_of(type_of(XrEventDataSpaceEraseCompleteFB.result)));
    assert(((cast(*void)(*instance.space)) - cast(*void)(*instance)) == 32, "XrEventDataSpaceEraseCompleteFB.space has unexpected offset % instead of 32", ((cast(*void)(*instance.space)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrEventDataSpaceEraseCompleteFB.space)) == 8, "XrEventDataSpaceEraseCompleteFB.space has unexpected size % instead of 8", size_of(type_of(XrEventDataSpaceEraseCompleteFB.space)));
    assert(((cast(*void)(*instance.uuid)) - cast(*void)(*instance)) == 40, "XrEventDataSpaceEraseCompleteFB.uuid has unexpected offset % instead of 40", ((cast(*void)(*instance.uuid)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrEventDataSpaceEraseCompleteFB.uuid)) == 16, "XrEventDataSpaceEraseCompleteFB.uuid has unexpected size % instead of 16", size_of(type_of(XrEventDataSpaceEraseCompleteFB.uuid)));
    assert(((cast(*void)(*instance.location)) - cast(*void)(*instance)) == 56, "XrEventDataSpaceEraseCompleteFB.location has unexpected offset % instead of 56", ((cast(*void)(*instance.location)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrEventDataSpaceEraseCompleteFB.location)) == 4, "XrEventDataSpaceEraseCompleteFB.location has unexpected size % instead of 4", size_of(type_of(XrEventDataSpaceEraseCompleteFB.location)));
    assert(size_of(XrEventDataSpaceEraseCompleteFB) == 64, "XrEventDataSpaceEraseCompleteFB has size % instead of 64", size_of(XrEventDataSpaceEraseCompleteFB));
}

PFN_xrSaveSpaceFB :: #type (a0: XrSession, a1: *XrSpaceSaveInfoFB, a2: *XrAsyncRequestIdFB) -> XrResult #c_call;
PFN_xrEraseSpaceFB :: #type (a0: XrSession, a1: *XrSpaceEraseInfoFB, a2: *XrAsyncRequestIdFB) -> XrResult #c_call;

XrCompositionLayerSpaceWarpInfoFlagsFB :: XrFlags64;

// Flag bits for XrCompositionLayerSpaceWarpInfoFlagsFB
XR_COMPOSITION_LAYER_SPACE_WARP_INFO_FRAME_SKIP_BIT_FB: XrCompositionLayerSpaceWarpInfoFlagsFB : 1;

// XrCompositionLayerSpaceWarpInfoFB extends XrCompositionLayerProjectionView
XrCompositionLayerSpaceWarpInfoFB :: struct {
    type:                 XrStructureType;
    next:                 *void;
    layerFlags:           XrCompositionLayerSpaceWarpInfoFlagsFB;
    motionVectorSubImage: XrSwapchainSubImage;
    appSpaceDeltaPose:    XrPosef;
    depthSubImage:        XrSwapchainSubImage;
    minDepth:             float;
    maxDepth:             float;
    nearZ:                float;
    farZ:                 float;
}
#run {
    instance: XrCompositionLayerSpaceWarpInfoFB;
    assert(((cast(*void)(*instance.type)) - cast(*void)(*instance)) == 0, "XrCompositionLayerSpaceWarpInfoFB.type has unexpected offset % instead of 0", ((cast(*void)(*instance.type)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrCompositionLayerSpaceWarpInfoFB.type)) == 4, "XrCompositionLayerSpaceWarpInfoFB.type has unexpected size % instead of 4", size_of(type_of(XrCompositionLayerSpaceWarpInfoFB.type)));
    assert(((cast(*void)(*instance.next)) - cast(*void)(*instance)) == 8, "XrCompositionLayerSpaceWarpInfoFB.next has unexpected offset % instead of 8", ((cast(*void)(*instance.next)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrCompositionLayerSpaceWarpInfoFB.next)) == 8, "XrCompositionLayerSpaceWarpInfoFB.next has unexpected size % instead of 8", size_of(type_of(XrCompositionLayerSpaceWarpInfoFB.next)));
    assert(((cast(*void)(*instance.layerFlags)) - cast(*void)(*instance)) == 16, "XrCompositionLayerSpaceWarpInfoFB.layerFlags has unexpected offset % instead of 16", ((cast(*void)(*instance.layerFlags)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrCompositionLayerSpaceWarpInfoFB.layerFlags)) == 8, "XrCompositionLayerSpaceWarpInfoFB.layerFlags has unexpected size % instead of 8", size_of(type_of(XrCompositionLayerSpaceWarpInfoFB.layerFlags)));
    assert(((cast(*void)(*instance.motionVectorSubImage)) - cast(*void)(*instance)) == 24, "XrCompositionLayerSpaceWarpInfoFB.motionVectorSubImage has unexpected offset % instead of 24", ((cast(*void)(*instance.motionVectorSubImage)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrCompositionLayerSpaceWarpInfoFB.motionVectorSubImage)) == 32, "XrCompositionLayerSpaceWarpInfoFB.motionVectorSubImage has unexpected size % instead of 32", size_of(type_of(XrCompositionLayerSpaceWarpInfoFB.motionVectorSubImage)));
    assert(((cast(*void)(*instance.appSpaceDeltaPose)) - cast(*void)(*instance)) == 56, "XrCompositionLayerSpaceWarpInfoFB.appSpaceDeltaPose has unexpected offset % instead of 56", ((cast(*void)(*instance.appSpaceDeltaPose)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrCompositionLayerSpaceWarpInfoFB.appSpaceDeltaPose)) == 28, "XrCompositionLayerSpaceWarpInfoFB.appSpaceDeltaPose has unexpected size % instead of 28", size_of(type_of(XrCompositionLayerSpaceWarpInfoFB.appSpaceDeltaPose)));
    assert(((cast(*void)(*instance.depthSubImage)) - cast(*void)(*instance)) == 88, "XrCompositionLayerSpaceWarpInfoFB.depthSubImage has unexpected offset % instead of 88", ((cast(*void)(*instance.depthSubImage)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrCompositionLayerSpaceWarpInfoFB.depthSubImage)) == 32, "XrCompositionLayerSpaceWarpInfoFB.depthSubImage has unexpected size % instead of 32", size_of(type_of(XrCompositionLayerSpaceWarpInfoFB.depthSubImage)));
    assert(((cast(*void)(*instance.minDepth)) - cast(*void)(*instance)) == 120, "XrCompositionLayerSpaceWarpInfoFB.minDepth has unexpected offset % instead of 120", ((cast(*void)(*instance.minDepth)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrCompositionLayerSpaceWarpInfoFB.minDepth)) == 4, "XrCompositionLayerSpaceWarpInfoFB.minDepth has unexpected size % instead of 4", size_of(type_of(XrCompositionLayerSpaceWarpInfoFB.minDepth)));
    assert(((cast(*void)(*instance.maxDepth)) - cast(*void)(*instance)) == 124, "XrCompositionLayerSpaceWarpInfoFB.maxDepth has unexpected offset % instead of 124", ((cast(*void)(*instance.maxDepth)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrCompositionLayerSpaceWarpInfoFB.maxDepth)) == 4, "XrCompositionLayerSpaceWarpInfoFB.maxDepth has unexpected size % instead of 4", size_of(type_of(XrCompositionLayerSpaceWarpInfoFB.maxDepth)));
    assert(((cast(*void)(*instance.nearZ)) - cast(*void)(*instance)) == 128, "XrCompositionLayerSpaceWarpInfoFB.nearZ has unexpected offset % instead of 128", ((cast(*void)(*instance.nearZ)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrCompositionLayerSpaceWarpInfoFB.nearZ)) == 4, "XrCompositionLayerSpaceWarpInfoFB.nearZ has unexpected size % instead of 4", size_of(type_of(XrCompositionLayerSpaceWarpInfoFB.nearZ)));
    assert(((cast(*void)(*instance.farZ)) - cast(*void)(*instance)) == 132, "XrCompositionLayerSpaceWarpInfoFB.farZ has unexpected offset % instead of 132", ((cast(*void)(*instance.farZ)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrCompositionLayerSpaceWarpInfoFB.farZ)) == 4, "XrCompositionLayerSpaceWarpInfoFB.farZ has unexpected size % instead of 4", size_of(type_of(XrCompositionLayerSpaceWarpInfoFB.farZ)));
    assert(size_of(XrCompositionLayerSpaceWarpInfoFB) == 136, "XrCompositionLayerSpaceWarpInfoFB has size % instead of 136", size_of(XrCompositionLayerSpaceWarpInfoFB));
}

// XrSystemSpaceWarpPropertiesFB extends XrSystemProperties
XrSystemSpaceWarpPropertiesFB :: struct {
    type:                                   XrStructureType;
    next:                                   *void;
    recommendedMotionVectorImageRectWidth:  u32;
    recommendedMotionVectorImageRectHeight: u32;
}
#run {
    instance: XrSystemSpaceWarpPropertiesFB;
    assert(((cast(*void)(*instance.type)) - cast(*void)(*instance)) == 0, "XrSystemSpaceWarpPropertiesFB.type has unexpected offset % instead of 0", ((cast(*void)(*instance.type)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrSystemSpaceWarpPropertiesFB.type)) == 4, "XrSystemSpaceWarpPropertiesFB.type has unexpected size % instead of 4", size_of(type_of(XrSystemSpaceWarpPropertiesFB.type)));
    assert(((cast(*void)(*instance.next)) - cast(*void)(*instance)) == 8, "XrSystemSpaceWarpPropertiesFB.next has unexpected offset % instead of 8", ((cast(*void)(*instance.next)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrSystemSpaceWarpPropertiesFB.next)) == 8, "XrSystemSpaceWarpPropertiesFB.next has unexpected size % instead of 8", size_of(type_of(XrSystemSpaceWarpPropertiesFB.next)));
    assert(((cast(*void)(*instance.recommendedMotionVectorImageRectWidth)) - cast(*void)(*instance)) == 16, "XrSystemSpaceWarpPropertiesFB.recommendedMotionVectorImageRectWidth has unexpected offset % instead of 16", ((cast(*void)(*instance.recommendedMotionVectorImageRectWidth)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrSystemSpaceWarpPropertiesFB.recommendedMotionVectorImageRectWidth)) == 4, "XrSystemSpaceWarpPropertiesFB.recommendedMotionVectorImageRectWidth has unexpected size % instead of 4", size_of(type_of(XrSystemSpaceWarpPropertiesFB.recommendedMotionVectorImageRectWidth)));
    assert(((cast(*void)(*instance.recommendedMotionVectorImageRectHeight)) - cast(*void)(*instance)) == 20, "XrSystemSpaceWarpPropertiesFB.recommendedMotionVectorImageRectHeight has unexpected offset % instead of 20", ((cast(*void)(*instance.recommendedMotionVectorImageRectHeight)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrSystemSpaceWarpPropertiesFB.recommendedMotionVectorImageRectHeight)) == 4, "XrSystemSpaceWarpPropertiesFB.recommendedMotionVectorImageRectHeight has unexpected size % instead of 4", size_of(type_of(XrSystemSpaceWarpPropertiesFB.recommendedMotionVectorImageRectHeight)));
    assert(size_of(XrSystemSpaceWarpPropertiesFB) == 24, "XrSystemSpaceWarpPropertiesFB has size % instead of 24", size_of(XrSystemSpaceWarpPropertiesFB));
}

XrExtent3DfFB :: struct {
    width:  float;
    height: float;
    depth:  float;
}
#run {
    instance: XrExtent3DfFB;
    assert(((cast(*void)(*instance.width)) - cast(*void)(*instance)) == 0, "XrExtent3DfFB.width has unexpected offset % instead of 0", ((cast(*void)(*instance.width)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrExtent3DfFB.width)) == 4, "XrExtent3DfFB.width has unexpected size % instead of 4", size_of(type_of(XrExtent3DfFB.width)));
    assert(((cast(*void)(*instance.height)) - cast(*void)(*instance)) == 4, "XrExtent3DfFB.height has unexpected offset % instead of 4", ((cast(*void)(*instance.height)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrExtent3DfFB.height)) == 4, "XrExtent3DfFB.height has unexpected size % instead of 4", size_of(type_of(XrExtent3DfFB.height)));
    assert(((cast(*void)(*instance.depth)) - cast(*void)(*instance)) == 8, "XrExtent3DfFB.depth has unexpected offset % instead of 8", ((cast(*void)(*instance.depth)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrExtent3DfFB.depth)) == 4, "XrExtent3DfFB.depth has unexpected size % instead of 4", size_of(type_of(XrExtent3DfFB.depth)));
    assert(size_of(XrExtent3DfFB) == 12, "XrExtent3DfFB has size % instead of 12", size_of(XrExtent3DfFB));
}

XrOffset3DfFB :: struct {
    x: float;
    y: float;
    z: float;
}
#run {
    instance: XrOffset3DfFB;
    assert(((cast(*void)(*instance.x)) - cast(*void)(*instance)) == 0, "XrOffset3DfFB.x has unexpected offset % instead of 0", ((cast(*void)(*instance.x)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrOffset3DfFB.x)) == 4, "XrOffset3DfFB.x has unexpected size % instead of 4", size_of(type_of(XrOffset3DfFB.x)));
    assert(((cast(*void)(*instance.y)) - cast(*void)(*instance)) == 4, "XrOffset3DfFB.y has unexpected offset % instead of 4", ((cast(*void)(*instance.y)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrOffset3DfFB.y)) == 4, "XrOffset3DfFB.y has unexpected size % instead of 4", size_of(type_of(XrOffset3DfFB.y)));
    assert(((cast(*void)(*instance.z)) - cast(*void)(*instance)) == 8, "XrOffset3DfFB.z has unexpected offset % instead of 8", ((cast(*void)(*instance.z)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrOffset3DfFB.z)) == 4, "XrOffset3DfFB.z has unexpected size % instead of 4", size_of(type_of(XrOffset3DfFB.z)));
    assert(size_of(XrOffset3DfFB) == 12, "XrOffset3DfFB has size % instead of 12", size_of(XrOffset3DfFB));
}

XrRect3DfFB :: struct {
    offset: XrOffset3DfFB;
    extent: XrExtent3DfFB;
}
#run {
    instance: XrRect3DfFB;
    assert(((cast(*void)(*instance.offset)) - cast(*void)(*instance)) == 0, "XrRect3DfFB.offset has unexpected offset % instead of 0", ((cast(*void)(*instance.offset)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrRect3DfFB.offset)) == 12, "XrRect3DfFB.offset has unexpected size % instead of 12", size_of(type_of(XrRect3DfFB.offset)));
    assert(((cast(*void)(*instance.extent)) - cast(*void)(*instance)) == 12, "XrRect3DfFB.extent has unexpected offset % instead of 12", ((cast(*void)(*instance.extent)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrRect3DfFB.extent)) == 12, "XrRect3DfFB.extent has unexpected size % instead of 12", size_of(type_of(XrRect3DfFB.extent)));
    assert(size_of(XrRect3DfFB) == 24, "XrRect3DfFB has size % instead of 24", size_of(XrRect3DfFB));
}

XrSemanticLabelsFB :: struct {
    type:                XrStructureType;
    next:                *void;
    bufferCapacityInput: u32;
    bufferCountOutput:   u32;
    buffer:              *u8;
}
#run {
    instance: XrSemanticLabelsFB;
    assert(((cast(*void)(*instance.type)) - cast(*void)(*instance)) == 0, "XrSemanticLabelsFB.type has unexpected offset % instead of 0", ((cast(*void)(*instance.type)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrSemanticLabelsFB.type)) == 4, "XrSemanticLabelsFB.type has unexpected size % instead of 4", size_of(type_of(XrSemanticLabelsFB.type)));
    assert(((cast(*void)(*instance.next)) - cast(*void)(*instance)) == 8, "XrSemanticLabelsFB.next has unexpected offset % instead of 8", ((cast(*void)(*instance.next)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrSemanticLabelsFB.next)) == 8, "XrSemanticLabelsFB.next has unexpected size % instead of 8", size_of(type_of(XrSemanticLabelsFB.next)));
    assert(((cast(*void)(*instance.bufferCapacityInput)) - cast(*void)(*instance)) == 16, "XrSemanticLabelsFB.bufferCapacityInput has unexpected offset % instead of 16", ((cast(*void)(*instance.bufferCapacityInput)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrSemanticLabelsFB.bufferCapacityInput)) == 4, "XrSemanticLabelsFB.bufferCapacityInput has unexpected size % instead of 4", size_of(type_of(XrSemanticLabelsFB.bufferCapacityInput)));
    assert(((cast(*void)(*instance.bufferCountOutput)) - cast(*void)(*instance)) == 20, "XrSemanticLabelsFB.bufferCountOutput has unexpected offset % instead of 20", ((cast(*void)(*instance.bufferCountOutput)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrSemanticLabelsFB.bufferCountOutput)) == 4, "XrSemanticLabelsFB.bufferCountOutput has unexpected size % instead of 4", size_of(type_of(XrSemanticLabelsFB.bufferCountOutput)));
    assert(((cast(*void)(*instance.buffer)) - cast(*void)(*instance)) == 24, "XrSemanticLabelsFB.buffer has unexpected offset % instead of 24", ((cast(*void)(*instance.buffer)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrSemanticLabelsFB.buffer)) == 8, "XrSemanticLabelsFB.buffer has unexpected size % instead of 8", size_of(type_of(XrSemanticLabelsFB.buffer)));
    assert(size_of(XrSemanticLabelsFB) == 32, "XrSemanticLabelsFB has size % instead of 32", size_of(XrSemanticLabelsFB));
}

XrRoomLayoutFB :: struct {
    type:                  XrStructureType;
    next:                  *void;
    floorUuid:             XrUuidEXT;
    ceilingUuid:           XrUuidEXT;
    wallUuidCapacityInput: u32;
    wallUuidCountOutput:   u32;
    wallUuids:             *XrUuidEXT;
}
#run {
    instance: XrRoomLayoutFB;
    assert(((cast(*void)(*instance.type)) - cast(*void)(*instance)) == 0, "XrRoomLayoutFB.type has unexpected offset % instead of 0", ((cast(*void)(*instance.type)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrRoomLayoutFB.type)) == 4, "XrRoomLayoutFB.type has unexpected size % instead of 4", size_of(type_of(XrRoomLayoutFB.type)));
    assert(((cast(*void)(*instance.next)) - cast(*void)(*instance)) == 8, "XrRoomLayoutFB.next has unexpected offset % instead of 8", ((cast(*void)(*instance.next)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrRoomLayoutFB.next)) == 8, "XrRoomLayoutFB.next has unexpected size % instead of 8", size_of(type_of(XrRoomLayoutFB.next)));
    assert(((cast(*void)(*instance.floorUuid)) - cast(*void)(*instance)) == 16, "XrRoomLayoutFB.floorUuid has unexpected offset % instead of 16", ((cast(*void)(*instance.floorUuid)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrRoomLayoutFB.floorUuid)) == 16, "XrRoomLayoutFB.floorUuid has unexpected size % instead of 16", size_of(type_of(XrRoomLayoutFB.floorUuid)));
    assert(((cast(*void)(*instance.ceilingUuid)) - cast(*void)(*instance)) == 32, "XrRoomLayoutFB.ceilingUuid has unexpected offset % instead of 32", ((cast(*void)(*instance.ceilingUuid)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrRoomLayoutFB.ceilingUuid)) == 16, "XrRoomLayoutFB.ceilingUuid has unexpected size % instead of 16", size_of(type_of(XrRoomLayoutFB.ceilingUuid)));
    assert(((cast(*void)(*instance.wallUuidCapacityInput)) - cast(*void)(*instance)) == 48, "XrRoomLayoutFB.wallUuidCapacityInput has unexpected offset % instead of 48", ((cast(*void)(*instance.wallUuidCapacityInput)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrRoomLayoutFB.wallUuidCapacityInput)) == 4, "XrRoomLayoutFB.wallUuidCapacityInput has unexpected size % instead of 4", size_of(type_of(XrRoomLayoutFB.wallUuidCapacityInput)));
    assert(((cast(*void)(*instance.wallUuidCountOutput)) - cast(*void)(*instance)) == 52, "XrRoomLayoutFB.wallUuidCountOutput has unexpected offset % instead of 52", ((cast(*void)(*instance.wallUuidCountOutput)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrRoomLayoutFB.wallUuidCountOutput)) == 4, "XrRoomLayoutFB.wallUuidCountOutput has unexpected size % instead of 4", size_of(type_of(XrRoomLayoutFB.wallUuidCountOutput)));
    assert(((cast(*void)(*instance.wallUuids)) - cast(*void)(*instance)) == 56, "XrRoomLayoutFB.wallUuids has unexpected offset % instead of 56", ((cast(*void)(*instance.wallUuids)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrRoomLayoutFB.wallUuids)) == 8, "XrRoomLayoutFB.wallUuids has unexpected size % instead of 8", size_of(type_of(XrRoomLayoutFB.wallUuids)));
    assert(size_of(XrRoomLayoutFB) == 64, "XrRoomLayoutFB has size % instead of 64", size_of(XrRoomLayoutFB));
}

XrBoundary2DFB :: struct {
    type:                XrStructureType;
    next:                *void;
    vertexCapacityInput: u32;
    vertexCountOutput:   u32;
    vertices:            *XrVector2f;
}
#run {
    instance: XrBoundary2DFB;
    assert(((cast(*void)(*instance.type)) - cast(*void)(*instance)) == 0, "XrBoundary2DFB.type has unexpected offset % instead of 0", ((cast(*void)(*instance.type)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrBoundary2DFB.type)) == 4, "XrBoundary2DFB.type has unexpected size % instead of 4", size_of(type_of(XrBoundary2DFB.type)));
    assert(((cast(*void)(*instance.next)) - cast(*void)(*instance)) == 8, "XrBoundary2DFB.next has unexpected offset % instead of 8", ((cast(*void)(*instance.next)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrBoundary2DFB.next)) == 8, "XrBoundary2DFB.next has unexpected size % instead of 8", size_of(type_of(XrBoundary2DFB.next)));
    assert(((cast(*void)(*instance.vertexCapacityInput)) - cast(*void)(*instance)) == 16, "XrBoundary2DFB.vertexCapacityInput has unexpected offset % instead of 16", ((cast(*void)(*instance.vertexCapacityInput)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrBoundary2DFB.vertexCapacityInput)) == 4, "XrBoundary2DFB.vertexCapacityInput has unexpected size % instead of 4", size_of(type_of(XrBoundary2DFB.vertexCapacityInput)));
    assert(((cast(*void)(*instance.vertexCountOutput)) - cast(*void)(*instance)) == 20, "XrBoundary2DFB.vertexCountOutput has unexpected offset % instead of 20", ((cast(*void)(*instance.vertexCountOutput)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrBoundary2DFB.vertexCountOutput)) == 4, "XrBoundary2DFB.vertexCountOutput has unexpected size % instead of 4", size_of(type_of(XrBoundary2DFB.vertexCountOutput)));
    assert(((cast(*void)(*instance.vertices)) - cast(*void)(*instance)) == 24, "XrBoundary2DFB.vertices has unexpected offset % instead of 24", ((cast(*void)(*instance.vertices)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrBoundary2DFB.vertices)) == 8, "XrBoundary2DFB.vertices has unexpected size % instead of 8", size_of(type_of(XrBoundary2DFB.vertices)));
    assert(size_of(XrBoundary2DFB) == 32, "XrBoundary2DFB has size % instead of 32", size_of(XrBoundary2DFB));
}

PFN_xrGetSpaceBoundingBox2DFB :: #type (a0: XrSession, a1: XrSpace, a2: *XrRect2Df) -> XrResult #c_call;
PFN_xrGetSpaceBoundingBox3DFB :: #type (a0: XrSession, a1: XrSpace, a2: *XrRect3DfFB) -> XrResult #c_call;
PFN_xrGetSpaceSemanticLabelsFB :: #type (a0: XrSession, a1: XrSpace, a2: *XrSemanticLabelsFB) -> XrResult #c_call;
PFN_xrGetSpaceBoundary2DFB :: #type (a0: XrSession, a1: XrSpace, a2: *XrBoundary2DFB) -> XrResult #c_call;
PFN_xrGetSpaceRoomLayoutFB :: #type (a0: XrSession, a1: XrSpace, a2: *XrRoomLayoutFB) -> XrResult #c_call;

XrDigitalLensControlFlagsALMALENCE :: XrFlags64;

// Flag bits for XrDigitalLensControlFlagsALMALENCE
XR_DIGITAL_LENS_CONTROL_PROCESSING_DISABLE_BIT_ALMALENCE: XrDigitalLensControlFlagsALMALENCE : 1;

XrDigitalLensControlALMALENCE :: struct {
    type:  XrStructureType;
    next:  *void;
    flags: XrDigitalLensControlFlagsALMALENCE;
}
#run {
    instance: XrDigitalLensControlALMALENCE;
    assert(((cast(*void)(*instance.type)) - cast(*void)(*instance)) == 0, "XrDigitalLensControlALMALENCE.type has unexpected offset % instead of 0", ((cast(*void)(*instance.type)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrDigitalLensControlALMALENCE.type)) == 4, "XrDigitalLensControlALMALENCE.type has unexpected size % instead of 4", size_of(type_of(XrDigitalLensControlALMALENCE.type)));
    assert(((cast(*void)(*instance.next)) - cast(*void)(*instance)) == 8, "XrDigitalLensControlALMALENCE.next has unexpected offset % instead of 8", ((cast(*void)(*instance.next)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrDigitalLensControlALMALENCE.next)) == 8, "XrDigitalLensControlALMALENCE.next has unexpected size % instead of 8", size_of(type_of(XrDigitalLensControlALMALENCE.next)));
    assert(((cast(*void)(*instance.flags)) - cast(*void)(*instance)) == 16, "XrDigitalLensControlALMALENCE.flags has unexpected offset % instead of 16", ((cast(*void)(*instance.flags)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrDigitalLensControlALMALENCE.flags)) == 8, "XrDigitalLensControlALMALENCE.flags has unexpected size % instead of 8", size_of(type_of(XrDigitalLensControlALMALENCE.flags)));
    assert(size_of(XrDigitalLensControlALMALENCE) == 24, "XrDigitalLensControlALMALENCE has size % instead of 24", size_of(XrDigitalLensControlALMALENCE));
}

PFN_xrSetDigitalLensControlALMALENCE :: #type (a0: XrSession, a1: *XrDigitalLensControlALMALENCE) -> XrResult #c_call;

XrSpaceContainerFB :: struct {
    type:              XrStructureType;
    next:              *void;
    uuidCapacityInput: u32;
    uuidCountOutput:   u32;
    uuids:             *XrUuidEXT;
}
#run {
    instance: XrSpaceContainerFB;
    assert(((cast(*void)(*instance.type)) - cast(*void)(*instance)) == 0, "XrSpaceContainerFB.type has unexpected offset % instead of 0", ((cast(*void)(*instance.type)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrSpaceContainerFB.type)) == 4, "XrSpaceContainerFB.type has unexpected size % instead of 4", size_of(type_of(XrSpaceContainerFB.type)));
    assert(((cast(*void)(*instance.next)) - cast(*void)(*instance)) == 8, "XrSpaceContainerFB.next has unexpected offset % instead of 8", ((cast(*void)(*instance.next)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrSpaceContainerFB.next)) == 8, "XrSpaceContainerFB.next has unexpected size % instead of 8", size_of(type_of(XrSpaceContainerFB.next)));
    assert(((cast(*void)(*instance.uuidCapacityInput)) - cast(*void)(*instance)) == 16, "XrSpaceContainerFB.uuidCapacityInput has unexpected offset % instead of 16", ((cast(*void)(*instance.uuidCapacityInput)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrSpaceContainerFB.uuidCapacityInput)) == 4, "XrSpaceContainerFB.uuidCapacityInput has unexpected size % instead of 4", size_of(type_of(XrSpaceContainerFB.uuidCapacityInput)));
    assert(((cast(*void)(*instance.uuidCountOutput)) - cast(*void)(*instance)) == 20, "XrSpaceContainerFB.uuidCountOutput has unexpected offset % instead of 20", ((cast(*void)(*instance.uuidCountOutput)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrSpaceContainerFB.uuidCountOutput)) == 4, "XrSpaceContainerFB.uuidCountOutput has unexpected size % instead of 4", size_of(type_of(XrSpaceContainerFB.uuidCountOutput)));
    assert(((cast(*void)(*instance.uuids)) - cast(*void)(*instance)) == 24, "XrSpaceContainerFB.uuids has unexpected offset % instead of 24", ((cast(*void)(*instance.uuids)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrSpaceContainerFB.uuids)) == 8, "XrSpaceContainerFB.uuids has unexpected size % instead of 8", size_of(type_of(XrSpaceContainerFB.uuids)));
    assert(size_of(XrSpaceContainerFB) == 32, "XrSpaceContainerFB has size % instead of 32", size_of(XrSpaceContainerFB));
}

PFN_xrGetSpaceContainerFB :: #type (a0: XrSession, a1: XrSpace, a2: *XrSpaceContainerFB) -> XrResult #c_call;

XrPassthroughKeyboardHandsIntensityFB :: struct {
    type:               XrStructureType;
    next:               *void;
    leftHandIntensity:  float;
    rightHandIntensity: float;
}
#run {
    instance: XrPassthroughKeyboardHandsIntensityFB;
    assert(((cast(*void)(*instance.type)) - cast(*void)(*instance)) == 0, "XrPassthroughKeyboardHandsIntensityFB.type has unexpected offset % instead of 0", ((cast(*void)(*instance.type)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrPassthroughKeyboardHandsIntensityFB.type)) == 4, "XrPassthroughKeyboardHandsIntensityFB.type has unexpected size % instead of 4", size_of(type_of(XrPassthroughKeyboardHandsIntensityFB.type)));
    assert(((cast(*void)(*instance.next)) - cast(*void)(*instance)) == 8, "XrPassthroughKeyboardHandsIntensityFB.next has unexpected offset % instead of 8", ((cast(*void)(*instance.next)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrPassthroughKeyboardHandsIntensityFB.next)) == 8, "XrPassthroughKeyboardHandsIntensityFB.next has unexpected size % instead of 8", size_of(type_of(XrPassthroughKeyboardHandsIntensityFB.next)));
    assert(((cast(*void)(*instance.leftHandIntensity)) - cast(*void)(*instance)) == 16, "XrPassthroughKeyboardHandsIntensityFB.leftHandIntensity has unexpected offset % instead of 16", ((cast(*void)(*instance.leftHandIntensity)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrPassthroughKeyboardHandsIntensityFB.leftHandIntensity)) == 4, "XrPassthroughKeyboardHandsIntensityFB.leftHandIntensity has unexpected size % instead of 4", size_of(type_of(XrPassthroughKeyboardHandsIntensityFB.leftHandIntensity)));
    assert(((cast(*void)(*instance.rightHandIntensity)) - cast(*void)(*instance)) == 20, "XrPassthroughKeyboardHandsIntensityFB.rightHandIntensity has unexpected offset % instead of 20", ((cast(*void)(*instance.rightHandIntensity)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrPassthroughKeyboardHandsIntensityFB.rightHandIntensity)) == 4, "XrPassthroughKeyboardHandsIntensityFB.rightHandIntensity has unexpected size % instead of 4", size_of(type_of(XrPassthroughKeyboardHandsIntensityFB.rightHandIntensity)));
    assert(size_of(XrPassthroughKeyboardHandsIntensityFB) == 24, "XrPassthroughKeyboardHandsIntensityFB has size % instead of 24", size_of(XrPassthroughKeyboardHandsIntensityFB));
}

PFN_xrPassthroughLayerSetKeyboardHandsIntensityFB :: #type (a0: XrPassthroughLayerFB, a1: *XrPassthroughKeyboardHandsIntensityFB) -> XrResult #c_call;

XrCompositionLayerSettingsFlagsFB :: XrFlags64;

// Flag bits for XrCompositionLayerSettingsFlagsFB
XR_COMPOSITION_LAYER_SETTINGS_NORMAL_SUPER_SAMPLING_BIT_FB: XrCompositionLayerSettingsFlagsFB : 1;
XR_COMPOSITION_LAYER_SETTINGS_QUALITY_SUPER_SAMPLING_BIT_FB: XrCompositionLayerSettingsFlagsFB : 2;
XR_COMPOSITION_LAYER_SETTINGS_NORMAL_SHARPENING_BIT_FB: XrCompositionLayerSettingsFlagsFB : 4;
XR_COMPOSITION_LAYER_SETTINGS_QUALITY_SHARPENING_BIT_FB: XrCompositionLayerSettingsFlagsFB : 8;

// XrCompositionLayerSettingsFB extends XrCompositionLayerBaseHeader
XrCompositionLayerSettingsFB :: struct {
    type:       XrStructureType;
    next:       *void;
    layerFlags: XrCompositionLayerSettingsFlagsFB;
}
#run {
    instance: XrCompositionLayerSettingsFB;
    assert(((cast(*void)(*instance.type)) - cast(*void)(*instance)) == 0, "XrCompositionLayerSettingsFB.type has unexpected offset % instead of 0", ((cast(*void)(*instance.type)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrCompositionLayerSettingsFB.type)) == 4, "XrCompositionLayerSettingsFB.type has unexpected size % instead of 4", size_of(type_of(XrCompositionLayerSettingsFB.type)));
    assert(((cast(*void)(*instance.next)) - cast(*void)(*instance)) == 8, "XrCompositionLayerSettingsFB.next has unexpected offset % instead of 8", ((cast(*void)(*instance.next)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrCompositionLayerSettingsFB.next)) == 8, "XrCompositionLayerSettingsFB.next has unexpected size % instead of 8", size_of(type_of(XrCompositionLayerSettingsFB.next)));
    assert(((cast(*void)(*instance.layerFlags)) - cast(*void)(*instance)) == 16, "XrCompositionLayerSettingsFB.layerFlags has unexpected offset % instead of 16", ((cast(*void)(*instance.layerFlags)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrCompositionLayerSettingsFB.layerFlags)) == 8, "XrCompositionLayerSettingsFB.layerFlags has unexpected size % instead of 8", size_of(type_of(XrCompositionLayerSettingsFB.layerFlags)));
    assert(size_of(XrCompositionLayerSettingsFB) == 24, "XrCompositionLayerSettingsFB has size % instead of 24", size_of(XrCompositionLayerSettingsFB));
}

XrPerformanceMetricsCounterUnitMETA :: enum s32 {
    GENERIC_META      :: 0;
    PERCENTAGE_META   :: 1;
    MILLISECONDS_META :: 2;
    BYTES_META        :: 3;
    HERTZ_META        :: 4;
    MAX_ENUM_META     :: 2147483647;

    XR_PERFORMANCE_METRICS_COUNTER_UNIT_GENERIC_META      :: GENERIC_META;
    XR_PERFORMANCE_METRICS_COUNTER_UNIT_PERCENTAGE_META   :: PERCENTAGE_META;
    XR_PERFORMANCE_METRICS_COUNTER_UNIT_MILLISECONDS_META :: MILLISECONDS_META;
    XR_PERFORMANCE_METRICS_COUNTER_UNIT_BYTES_META        :: BYTES_META;
    XR_PERFORMANCE_METRICS_COUNTER_UNIT_HERTZ_META        :: HERTZ_META;
    XR_PERFORMANCE_METRICS_COUNTER_UNIT_MAX_ENUM_META     :: MAX_ENUM_META;
}

XrPerformanceMetricsCounterFlagsMETA :: XrFlags64;

// Flag bits for XrPerformanceMetricsCounterFlagsMETA
XR_PERFORMANCE_METRICS_COUNTER_ANY_VALUE_VALID_BIT_META: XrPerformanceMetricsCounterFlagsMETA : 1;
XR_PERFORMANCE_METRICS_COUNTER_UINT_VALUE_VALID_BIT_META: XrPerformanceMetricsCounterFlagsMETA : 2;
XR_PERFORMANCE_METRICS_COUNTER_FLOAT_VALUE_VALID_BIT_META: XrPerformanceMetricsCounterFlagsMETA : 4;

XrPerformanceMetricsStateMETA :: struct {
    type:    XrStructureType;
    next:    *void;
    enabled: XrBool32;
}
#run {
    instance: XrPerformanceMetricsStateMETA;
    assert(((cast(*void)(*instance.type)) - cast(*void)(*instance)) == 0, "XrPerformanceMetricsStateMETA.type has unexpected offset % instead of 0", ((cast(*void)(*instance.type)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrPerformanceMetricsStateMETA.type)) == 4, "XrPerformanceMetricsStateMETA.type has unexpected size % instead of 4", size_of(type_of(XrPerformanceMetricsStateMETA.type)));
    assert(((cast(*void)(*instance.next)) - cast(*void)(*instance)) == 8, "XrPerformanceMetricsStateMETA.next has unexpected offset % instead of 8", ((cast(*void)(*instance.next)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrPerformanceMetricsStateMETA.next)) == 8, "XrPerformanceMetricsStateMETA.next has unexpected size % instead of 8", size_of(type_of(XrPerformanceMetricsStateMETA.next)));
    assert(((cast(*void)(*instance.enabled)) - cast(*void)(*instance)) == 16, "XrPerformanceMetricsStateMETA.enabled has unexpected offset % instead of 16", ((cast(*void)(*instance.enabled)) - cast(*void)(*instance)));
    assert(size_of(type_of(XrPerformanceMetricsStateMETA.enabled)) == 4, "XrPerformanceMetricsStateMETA.enabled has unexpected size % instead of 4", size_of(type_of(XrPerformanceMetricsStateMETA.enabled)));
    assert(size_of(XrPerformanceMetricsStateMETA) == 24, "XrPerformanceMetricsStateMETA has size % instead of 24", size_of(XrPerformanceMetricsStateMETA));
}

#scope_file

#import "Basic"; // For assert
openxr_loader :: #foreign_library,no_dll "./openxr_loader";
d3d11 :: #foreign_system_library "d3d11";
