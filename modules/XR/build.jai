#import "Basic";
#import "String";
#import "Compiler";
#import "BuildCpp";
#import "Bindings_Generator";



#run {
    defer set_build_options_dc(.{do_output=false});
    
    log("Generating module.jai");
    using opts: Generate_Bindings_Options;
    //XR_USE_GRAPHICS_API_D3D11
    header = MANUALLY_ADDED_STUFF;
    
    strip_flags = 0;
    array_add(*extra_clang_arguments, "-x", "c++");
    array_add(*system_include_paths, GENERATOR_DEFAULT_SYSTEM_INCLUDE_PATH);
    array_add(*strip_enum_value_prefixes, .["XrStructureType", "XR_TYPE_"]);
    array_add(*strip_enum_value_prefixes, .["XrResult"       , "XR_ERROR_"]);
    
    array_add(*libpaths,       ".");
    array_add(*include_paths,  ".");
    array_add(*libnames,       "openxr_loader");
    array_add(*libnames,       "d3d11");
    
    array_add(*source_files,   "openxr.h");
    array_add(*source_files,   "openxr_platform.h");
    array_add(*source_files,   "openxr_platform_defines.h");
    array_add(*source_files,   "openxr_reflection.h");

    visitor = (using decl: *Declaration, parent_decl: *Declaration) -> Declaration_Visit_Result {
        if name == "XrDebugUtilsMessageSeverityFlagsEXT"
            || name == "XrDebugUtilsMessageTypeFlagsEXT"
        then decl_flags |= .OMIT_FROM_OUTPUT;
        
        return .RECURSE;
        
    };

    
    if !generate_bindings(opts, "module.jai", true) {
        log("Could not genereate module.jai");
        exit(1);
    }
};

MANUALLY_ADDED_STUFF :: #string DONE
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
DONE;
