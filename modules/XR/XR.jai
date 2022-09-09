//
// This file was auto-generated using the following command:
//
// jai main.jai
//

// TODO: detect xr calls in metaprogram and automatically wrap them in this
xr_check :: (result: Result, fmt: string, args: ..Any, loc := #caller_location) #expand {
    if cast(s32) result >= 0 return;

    result_c_str : [XR_MAX_RESULT_STRING_SIZE] u8;
    xrResultToString(`instance, result, *result_c_str);
    log_error("%: % [%] (%)\n", loc, tprint(fmt, ..args), to_string(result_c_str.data), result);
    
    exit(1);
}

OPENXR_H_ :: 1;

XR_VERSION_1_0 :: 1;

OPENXR_PLATFORM_DEFINES_H_ :: 1;

XR_PTR_SIZE :: 8;

XR_CPP11_ENABLED :: 1;

XR_CPP_NULLPTR_SUPPORTED :: 1;

XR_MIN_COMPOSITION_LAYERS_SUPPORTED :: 16;

XR_NULL_SYSTEM_ID :: 0;

XR_NULL_PATH :: 0;

XR_NO_DURATION :: 0;

XR_INFINITE_DURATION :: 0x7fffffffffffffff;

XR_MIN_HAPTIC_DURATION :: -1;

XR_FREQUENCY_UNSPECIFIED :: 0;

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

XR_KHR_OPENGL_ENABLE_EXTENSION_NAME :: "XR_KHR_opengl_enable";

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

Version :: u64;
Flags64 :: u64;
SystemId :: u64;
Bool32 :: u32;
Path :: u64;
Time :: s64;
Duration :: s64;
Instance_T :: struct {}
Instance :: *Instance_T;
Session_T :: struct {}
Session :: *Session_T;
Space_T :: struct {}
Space :: *Space_T;
Action_T :: struct {}
Action :: *Action_T;
Swapchain_T :: struct {}
Swapchain :: *Swapchain_T;
ActionSet_T :: struct {}
ActionSet :: *ActionSet_T;

Result :: enum s32 {
    SUCCESS                                            :: 0;
    TIMEOUT_EXPIRED                                    :: 1;
    SESSION_LOSS_PENDING                               :: 3;
    EVENT_UNAVAILABLE                                  :: 4;
    SPACE_BOUNDS_UNAVAILABLE                           :: 7;
    SESSION_NOT_FOCUSED                                :: 8;
    FRAME_DISCARDED                                    :: 9;
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
    RENDER_MODEL_UNAVAILABLE_FB                        :: 1000119020;
    MARKER_NOT_TRACKED_VARJO                           :: -1000124000;
    MARKER_ID_INVALID_VARJO                            :: -1000124001;
    SPATIAL_ANCHOR_NAME_NOT_FOUND_MSFT                 :: -1000142001;
    SPATIAL_ANCHOR_NAME_INVALID_MSFT                   :: -1000142002;
    RESULT_MAX_ENUM                                    :: 2147483647;

    XR_SUCCESS                                                  :: SUCCESS;
    XR_TIMEOUT_EXPIRED                                          :: TIMEOUT_EXPIRED;
    XR_SESSION_LOSS_PENDING                                     :: SESSION_LOSS_PENDING;
    XR_EVENT_UNAVAILABLE                                        :: EVENT_UNAVAILABLE;
    XR_SPACE_BOUNDS_UNAVAILABLE                                 :: SPACE_BOUNDS_UNAVAILABLE;
    XR_SESSION_NOT_FOCUSED                                      :: SESSION_NOT_FOCUSED;
    XR_FRAME_DISCARDED                                          :: FRAME_DISCARDED;
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
    XR_RENDER_MODEL_UNAVAILABLE_FB                              :: RENDER_MODEL_UNAVAILABLE_FB;
    XR_ERROR_MARKER_NOT_TRACKED_VARJO                           :: MARKER_NOT_TRACKED_VARJO;
    XR_ERROR_MARKER_ID_INVALID_VARJO                            :: MARKER_ID_INVALID_VARJO;
    XR_ERROR_SPATIAL_ANCHOR_NAME_NOT_FOUND_MSFT                 :: SPATIAL_ANCHOR_NAME_NOT_FOUND_MSFT;
    XR_ERROR_SPATIAL_ANCHOR_NAME_INVALID_MSFT                   :: SPATIAL_ANCHOR_NAME_INVALID_MSFT;
    XR_RESULT_MAX_ENUM                                          :: RESULT_MAX_ENUM;
}

StructureType :: enum s32 {
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
    STRUCTURE_TYPE_MAX_ENUM                                 :: 2147483647;

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
    XR_STRUCTURE_TYPE_MAX_ENUM                                      :: STRUCTURE_TYPE_MAX_ENUM;
}

FormFactor :: enum s32 {
    HEAD_MOUNTED_DISPLAY :: 1;
    HANDHELD_DISPLAY     :: 2;
    MAX_ENUM             :: 2147483647;

    XR_FORM_FACTOR_HEAD_MOUNTED_DISPLAY :: HEAD_MOUNTED_DISPLAY;
    XR_FORM_FACTOR_HANDHELD_DISPLAY     :: HANDHELD_DISPLAY;
    XR_FORM_FACTOR_MAX_ENUM             :: MAX_ENUM;
}

ViewConfigurationType :: enum s32 {
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

EnvironmentBlendMode :: enum s32 {
    OPAQUE      :: 1;
    ADDITIVE    :: 2;
    ALPHA_BLEND :: 3;
    MAX_ENUM    :: 2147483647;

    XR_ENVIRONMENT_BLEND_MODE_OPAQUE      :: OPAQUE;
    XR_ENVIRONMENT_BLEND_MODE_ADDITIVE    :: ADDITIVE;
    XR_ENVIRONMENT_BLEND_MODE_ALPHA_BLEND :: ALPHA_BLEND;
    XR_ENVIRONMENT_BLEND_MODE_MAX_ENUM    :: MAX_ENUM;
}

ReferenceSpaceType :: enum s32 {
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

ActionType :: enum s32 {
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

EyeVisibility :: enum s32 {
    BOTH     :: 0;
    LEFT     :: 1;
    RIGHT    :: 2;
    MAX_ENUM :: 2147483647;

    XR_EYE_VISIBILITY_BOTH     :: BOTH;
    XR_EYE_VISIBILITY_LEFT     :: LEFT;
    XR_EYE_VISIBILITY_RIGHT    :: RIGHT;
    XR_EYE_VISIBILITY_MAX_ENUM :: MAX_ENUM;
}

SessionState :: enum s32 {
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

ObjectType :: enum s32 {
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

InstanceCreateFlags :: Flags64;

// Flag bits for XrInstanceCreateFlags
SessionCreateFlags :: Flags64;

// Flag bits for XrSessionCreateFlags
SpaceVelocityFlags :: Flags64;

// Flag bits for XrSpaceVelocityFlags
XR_SPACE_VELOCITY_LINEAR_VALID_BIT: SpaceVelocityFlags : 1;
XR_SPACE_VELOCITY_ANGULAR_VALID_BIT: SpaceVelocityFlags : 2;

SpaceLocationFlags :: Flags64;

// Flag bits for XrSpaceLocationFlags
XR_SPACE_LOCATION_ORIENTATION_VALID_BIT: SpaceLocationFlags : 1;
XR_SPACE_LOCATION_POSITION_VALID_BIT: SpaceLocationFlags : 2;
XR_SPACE_LOCATION_ORIENTATION_TRACKED_BIT: SpaceLocationFlags : 4;
XR_SPACE_LOCATION_POSITION_TRACKED_BIT: SpaceLocationFlags : 8;

SwapchainCreateFlags :: Flags64;

// Flag bits for XrSwapchainCreateFlags
XR_SWAPCHAIN_CREATE_PROTECTED_CONTENT_BIT: SwapchainCreateFlags : 1;
XR_SWAPCHAIN_CREATE_STATIC_IMAGE_BIT: SwapchainCreateFlags : 2;

SwapchainUsageFlags :: Flags64;

// Flag bits for XrSwapchainUsageFlags
XR_SWAPCHAIN_USAGE_COLOR_ATTACHMENT_BIT: SwapchainUsageFlags : 1;
XR_SWAPCHAIN_USAGE_DEPTH_STENCIL_ATTACHMENT_BIT: SwapchainUsageFlags : 2;
XR_SWAPCHAIN_USAGE_UNORDERED_ACCESS_BIT: SwapchainUsageFlags : 4;
XR_SWAPCHAIN_USAGE_TRANSFER_SRC_BIT: SwapchainUsageFlags : 8;
XR_SWAPCHAIN_USAGE_TRANSFER_DST_BIT: SwapchainUsageFlags : 16;
XR_SWAPCHAIN_USAGE_SAMPLED_BIT: SwapchainUsageFlags : 32;
XR_SWAPCHAIN_USAGE_MUTABLE_FORMAT_BIT: SwapchainUsageFlags : 64;
XR_SWAPCHAIN_USAGE_INPUT_ATTACHMENT_BIT_MND: SwapchainUsageFlags : 128;
XR_SWAPCHAIN_USAGE_INPUT_ATTACHMENT_BIT_KHR: SwapchainUsageFlags : 128; // alias of XR_SWAPCHAIN_USAGE_INPUT_ATTACHMENT_BIT_MND

CompositionLayerFlags :: Flags64;

// Flag bits for XrCompositionLayerFlags
XR_COMPOSITION_LAYER_CORRECT_CHROMATIC_ABERRATION_BIT: CompositionLayerFlags : 1;
XR_COMPOSITION_LAYER_BLEND_TEXTURE_SOURCE_ALPHA_BIT: CompositionLayerFlags : 2;
XR_COMPOSITION_LAYER_UNPREMULTIPLIED_ALPHA_BIT: CompositionLayerFlags : 4;

ViewStateFlags :: Flags64;

// Flag bits for XrViewStateFlags
XR_VIEW_STATE_ORIENTATION_VALID_BIT: ViewStateFlags : 1;
XR_VIEW_STATE_POSITION_VALID_BIT: ViewStateFlags : 2;
XR_VIEW_STATE_ORIENTATION_TRACKED_BIT: ViewStateFlags : 4;
XR_VIEW_STATE_POSITION_TRACKED_BIT: ViewStateFlags : 8;

InputSourceLocalizedNameFlags :: Flags64;

// Flag bits for XrInputSourceLocalizedNameFlags
XR_INPUT_SOURCE_LOCALIZED_NAME_USER_PATH_BIT: InputSourceLocalizedNameFlags : 1;
XR_INPUT_SOURCE_LOCALIZED_NAME_INTERACTION_PROFILE_BIT: InputSourceLocalizedNameFlags : 2;
XR_INPUT_SOURCE_LOCALIZED_NAME_COMPONENT_BIT: InputSourceLocalizedNameFlags : 4;

PFN_xrVoidFunction :: #type () -> void #c_call;
ApiLayerProperties :: struct {
    type:         StructureType;
    next:         *void;
    layerName:    [256] u8;
    specVersion:  Version;
    layerVersion: u32;
    description:  [256] u8;
}
#run {
    instance: ApiLayerProperties;
    assert(((cast(*void)(*instance.type)) - cast(*void)(*instance)) == 0, "ApiLayerProperties.type has unexpected offset % instead of 0", ((cast(*void)(*instance.type)) - cast(*void)(*instance)));
    assert(size_of(type_of(ApiLayerProperties.type)) == 4, "ApiLayerProperties.type has unexpected size % instead of 4", size_of(type_of(ApiLayerProperties.type)));
    assert(((cast(*void)(*instance.next)) - cast(*void)(*instance)) == 8, "ApiLayerProperties.next has unexpected offset % instead of 8", ((cast(*void)(*instance.next)) - cast(*void)(*instance)));
    assert(size_of(type_of(ApiLayerProperties.next)) == 8, "ApiLayerProperties.next has unexpected size % instead of 8", size_of(type_of(ApiLayerProperties.next)));
    assert(((cast(*void)(*instance.layerName)) - cast(*void)(*instance)) == 16, "ApiLayerProperties.layerName has unexpected offset % instead of 16", ((cast(*void)(*instance.layerName)) - cast(*void)(*instance)));
    assert(size_of(type_of(ApiLayerProperties.layerName)) == 256, "ApiLayerProperties.layerName has unexpected size % instead of 256", size_of(type_of(ApiLayerProperties.layerName)));
    assert(((cast(*void)(*instance.specVersion)) - cast(*void)(*instance)) == 272, "ApiLayerProperties.specVersion has unexpected offset % instead of 272", ((cast(*void)(*instance.specVersion)) - cast(*void)(*instance)));
    assert(size_of(type_of(ApiLayerProperties.specVersion)) == 8, "ApiLayerProperties.specVersion has unexpected size % instead of 8", size_of(type_of(ApiLayerProperties.specVersion)));
    assert(((cast(*void)(*instance.layerVersion)) - cast(*void)(*instance)) == 280, "ApiLayerProperties.layerVersion has unexpected offset % instead of 280", ((cast(*void)(*instance.layerVersion)) - cast(*void)(*instance)));
    assert(size_of(type_of(ApiLayerProperties.layerVersion)) == 4, "ApiLayerProperties.layerVersion has unexpected size % instead of 4", size_of(type_of(ApiLayerProperties.layerVersion)));
    assert(((cast(*void)(*instance.description)) - cast(*void)(*instance)) == 284, "ApiLayerProperties.description has unexpected offset % instead of 284", ((cast(*void)(*instance.description)) - cast(*void)(*instance)));
    assert(size_of(type_of(ApiLayerProperties.description)) == 256, "ApiLayerProperties.description has unexpected size % instead of 256", size_of(type_of(ApiLayerProperties.description)));
    assert(size_of(ApiLayerProperties) == 544, "ApiLayerProperties has size % instead of 544", size_of(ApiLayerProperties));
}

ExtensionProperties :: struct {
    type:             StructureType;
    next:             *void;
    extensionName:    [128] u8;
    extensionVersion: u32;
}
#run {
    instance: ExtensionProperties;
    assert(((cast(*void)(*instance.type)) - cast(*void)(*instance)) == 0, "ExtensionProperties.type has unexpected offset % instead of 0", ((cast(*void)(*instance.type)) - cast(*void)(*instance)));
    assert(size_of(type_of(ExtensionProperties.type)) == 4, "ExtensionProperties.type has unexpected size % instead of 4", size_of(type_of(ExtensionProperties.type)));
    assert(((cast(*void)(*instance.next)) - cast(*void)(*instance)) == 8, "ExtensionProperties.next has unexpected offset % instead of 8", ((cast(*void)(*instance.next)) - cast(*void)(*instance)));
    assert(size_of(type_of(ExtensionProperties.next)) == 8, "ExtensionProperties.next has unexpected size % instead of 8", size_of(type_of(ExtensionProperties.next)));
    assert(((cast(*void)(*instance.extensionName)) - cast(*void)(*instance)) == 16, "ExtensionProperties.extensionName has unexpected offset % instead of 16", ((cast(*void)(*instance.extensionName)) - cast(*void)(*instance)));
    assert(size_of(type_of(ExtensionProperties.extensionName)) == 128, "ExtensionProperties.extensionName has unexpected size % instead of 128", size_of(type_of(ExtensionProperties.extensionName)));
    assert(((cast(*void)(*instance.extensionVersion)) - cast(*void)(*instance)) == 144, "ExtensionProperties.extensionVersion has unexpected offset % instead of 144", ((cast(*void)(*instance.extensionVersion)) - cast(*void)(*instance)));
    assert(size_of(type_of(ExtensionProperties.extensionVersion)) == 4, "ExtensionProperties.extensionVersion has unexpected size % instead of 4", size_of(type_of(ExtensionProperties.extensionVersion)));
    assert(size_of(ExtensionProperties) == 152, "ExtensionProperties has size % instead of 152", size_of(ExtensionProperties));
}

ApplicationInfo :: struct {
    applicationName:    [128] u8;
    applicationVersion: u32;
    engineName:         [128] u8;
    engineVersion:      u32;
    apiVersion:         Version;
}
#run {
    instance: ApplicationInfo;
    assert(((cast(*void)(*instance.applicationName)) - cast(*void)(*instance)) == 0, "ApplicationInfo.applicationName has unexpected offset % instead of 0", ((cast(*void)(*instance.applicationName)) - cast(*void)(*instance)));
    assert(size_of(type_of(ApplicationInfo.applicationName)) == 128, "ApplicationInfo.applicationName has unexpected size % instead of 128", size_of(type_of(ApplicationInfo.applicationName)));
    assert(((cast(*void)(*instance.applicationVersion)) - cast(*void)(*instance)) == 128, "ApplicationInfo.applicationVersion has unexpected offset % instead of 128", ((cast(*void)(*instance.applicationVersion)) - cast(*void)(*instance)));
    assert(size_of(type_of(ApplicationInfo.applicationVersion)) == 4, "ApplicationInfo.applicationVersion has unexpected size % instead of 4", size_of(type_of(ApplicationInfo.applicationVersion)));
    assert(((cast(*void)(*instance.engineName)) - cast(*void)(*instance)) == 132, "ApplicationInfo.engineName has unexpected offset % instead of 132", ((cast(*void)(*instance.engineName)) - cast(*void)(*instance)));
    assert(size_of(type_of(ApplicationInfo.engineName)) == 128, "ApplicationInfo.engineName has unexpected size % instead of 128", size_of(type_of(ApplicationInfo.engineName)));
    assert(((cast(*void)(*instance.engineVersion)) - cast(*void)(*instance)) == 260, "ApplicationInfo.engineVersion has unexpected offset % instead of 260", ((cast(*void)(*instance.engineVersion)) - cast(*void)(*instance)));
    assert(size_of(type_of(ApplicationInfo.engineVersion)) == 4, "ApplicationInfo.engineVersion has unexpected size % instead of 4", size_of(type_of(ApplicationInfo.engineVersion)));
    assert(((cast(*void)(*instance.apiVersion)) - cast(*void)(*instance)) == 264, "ApplicationInfo.apiVersion has unexpected offset % instead of 264", ((cast(*void)(*instance.apiVersion)) - cast(*void)(*instance)));
    assert(size_of(type_of(ApplicationInfo.apiVersion)) == 8, "ApplicationInfo.apiVersion has unexpected size % instead of 8", size_of(type_of(ApplicationInfo.apiVersion)));
    assert(size_of(ApplicationInfo) == 272, "ApplicationInfo has size % instead of 272", size_of(ApplicationInfo));
}

InstanceCreateInfo :: struct {
    type:                  StructureType;
    next:                  *void;
    createFlags:           InstanceCreateFlags;
    applicationInfo:       ApplicationInfo;
    enabledApiLayerCount:  u32;
    enabledApiLayerNames:  **u8;
    enabledExtensionCount: u32;
    enabledExtensionNames: **u8;
}
#run {
    instance: InstanceCreateInfo;
    assert(((cast(*void)(*instance.type)) - cast(*void)(*instance)) == 0, "InstanceCreateInfo.type has unexpected offset % instead of 0", ((cast(*void)(*instance.type)) - cast(*void)(*instance)));
    assert(size_of(type_of(InstanceCreateInfo.type)) == 4, "InstanceCreateInfo.type has unexpected size % instead of 4", size_of(type_of(InstanceCreateInfo.type)));
    assert(((cast(*void)(*instance.next)) - cast(*void)(*instance)) == 8, "InstanceCreateInfo.next has unexpected offset % instead of 8", ((cast(*void)(*instance.next)) - cast(*void)(*instance)));
    assert(size_of(type_of(InstanceCreateInfo.next)) == 8, "InstanceCreateInfo.next has unexpected size % instead of 8", size_of(type_of(InstanceCreateInfo.next)));
    assert(((cast(*void)(*instance.createFlags)) - cast(*void)(*instance)) == 16, "InstanceCreateInfo.createFlags has unexpected offset % instead of 16", ((cast(*void)(*instance.createFlags)) - cast(*void)(*instance)));
    assert(size_of(type_of(InstanceCreateInfo.createFlags)) == 8, "InstanceCreateInfo.createFlags has unexpected size % instead of 8", size_of(type_of(InstanceCreateInfo.createFlags)));
    assert(((cast(*void)(*instance.applicationInfo)) - cast(*void)(*instance)) == 24, "InstanceCreateInfo.applicationInfo has unexpected offset % instead of 24", ((cast(*void)(*instance.applicationInfo)) - cast(*void)(*instance)));
    assert(size_of(type_of(InstanceCreateInfo.applicationInfo)) == 272, "InstanceCreateInfo.applicationInfo has unexpected size % instead of 272", size_of(type_of(InstanceCreateInfo.applicationInfo)));
    assert(((cast(*void)(*instance.enabledApiLayerCount)) - cast(*void)(*instance)) == 296, "InstanceCreateInfo.enabledApiLayerCount has unexpected offset % instead of 296", ((cast(*void)(*instance.enabledApiLayerCount)) - cast(*void)(*instance)));
    assert(size_of(type_of(InstanceCreateInfo.enabledApiLayerCount)) == 4, "InstanceCreateInfo.enabledApiLayerCount has unexpected size % instead of 4", size_of(type_of(InstanceCreateInfo.enabledApiLayerCount)));
    assert(((cast(*void)(*instance.enabledApiLayerNames)) - cast(*void)(*instance)) == 304, "InstanceCreateInfo.enabledApiLayerNames has unexpected offset % instead of 304", ((cast(*void)(*instance.enabledApiLayerNames)) - cast(*void)(*instance)));
    assert(size_of(type_of(InstanceCreateInfo.enabledApiLayerNames)) == 8, "InstanceCreateInfo.enabledApiLayerNames has unexpected size % instead of 8", size_of(type_of(InstanceCreateInfo.enabledApiLayerNames)));
    assert(((cast(*void)(*instance.enabledExtensionCount)) - cast(*void)(*instance)) == 312, "InstanceCreateInfo.enabledExtensionCount has unexpected offset % instead of 312", ((cast(*void)(*instance.enabledExtensionCount)) - cast(*void)(*instance)));
    assert(size_of(type_of(InstanceCreateInfo.enabledExtensionCount)) == 4, "InstanceCreateInfo.enabledExtensionCount has unexpected size % instead of 4", size_of(type_of(InstanceCreateInfo.enabledExtensionCount)));
    assert(((cast(*void)(*instance.enabledExtensionNames)) - cast(*void)(*instance)) == 320, "InstanceCreateInfo.enabledExtensionNames has unexpected offset % instead of 320", ((cast(*void)(*instance.enabledExtensionNames)) - cast(*void)(*instance)));
    assert(size_of(type_of(InstanceCreateInfo.enabledExtensionNames)) == 8, "InstanceCreateInfo.enabledExtensionNames has unexpected size % instead of 8", size_of(type_of(InstanceCreateInfo.enabledExtensionNames)));
    assert(size_of(InstanceCreateInfo) == 328, "InstanceCreateInfo has size % instead of 328", size_of(InstanceCreateInfo));
}

InstanceProperties :: struct {
    type:           StructureType;
    next:           *void;
    runtimeVersion: Version;
    runtimeName:    [128] u8;
}
#run {
    instance: InstanceProperties;
    assert(((cast(*void)(*instance.type)) - cast(*void)(*instance)) == 0, "InstanceProperties.type has unexpected offset % instead of 0", ((cast(*void)(*instance.type)) - cast(*void)(*instance)));
    assert(size_of(type_of(InstanceProperties.type)) == 4, "InstanceProperties.type has unexpected size % instead of 4", size_of(type_of(InstanceProperties.type)));
    assert(((cast(*void)(*instance.next)) - cast(*void)(*instance)) == 8, "InstanceProperties.next has unexpected offset % instead of 8", ((cast(*void)(*instance.next)) - cast(*void)(*instance)));
    assert(size_of(type_of(InstanceProperties.next)) == 8, "InstanceProperties.next has unexpected size % instead of 8", size_of(type_of(InstanceProperties.next)));
    assert(((cast(*void)(*instance.runtimeVersion)) - cast(*void)(*instance)) == 16, "InstanceProperties.runtimeVersion has unexpected offset % instead of 16", ((cast(*void)(*instance.runtimeVersion)) - cast(*void)(*instance)));
    assert(size_of(type_of(InstanceProperties.runtimeVersion)) == 8, "InstanceProperties.runtimeVersion has unexpected size % instead of 8", size_of(type_of(InstanceProperties.runtimeVersion)));
    assert(((cast(*void)(*instance.runtimeName)) - cast(*void)(*instance)) == 24, "InstanceProperties.runtimeName has unexpected offset % instead of 24", ((cast(*void)(*instance.runtimeName)) - cast(*void)(*instance)));
    assert(size_of(type_of(InstanceProperties.runtimeName)) == 128, "InstanceProperties.runtimeName has unexpected size % instead of 128", size_of(type_of(InstanceProperties.runtimeName)));
    assert(size_of(InstanceProperties) == 152, "InstanceProperties has size % instead of 152", size_of(InstanceProperties));
}

EventDataBuffer :: struct {
    type:    StructureType;
    next:    *void;
    varying: [4000] u8;
}
#run {
    instance: EventDataBuffer;
    assert(((cast(*void)(*instance.type)) - cast(*void)(*instance)) == 0, "EventDataBuffer.type has unexpected offset % instead of 0", ((cast(*void)(*instance.type)) - cast(*void)(*instance)));
    assert(size_of(type_of(EventDataBuffer.type)) == 4, "EventDataBuffer.type has unexpected size % instead of 4", size_of(type_of(EventDataBuffer.type)));
    assert(((cast(*void)(*instance.next)) - cast(*void)(*instance)) == 8, "EventDataBuffer.next has unexpected offset % instead of 8", ((cast(*void)(*instance.next)) - cast(*void)(*instance)));
    assert(size_of(type_of(EventDataBuffer.next)) == 8, "EventDataBuffer.next has unexpected size % instead of 8", size_of(type_of(EventDataBuffer.next)));
    assert(((cast(*void)(*instance.varying)) - cast(*void)(*instance)) == 16, "EventDataBuffer.varying has unexpected offset % instead of 16", ((cast(*void)(*instance.varying)) - cast(*void)(*instance)));
    assert(size_of(type_of(EventDataBuffer.varying)) == 4000, "EventDataBuffer.varying has unexpected size % instead of 4000", size_of(type_of(EventDataBuffer.varying)));
    assert(size_of(EventDataBuffer) == 4016, "EventDataBuffer has size % instead of 4016", size_of(EventDataBuffer));
}

SystemGetInfo :: struct {
    type:       StructureType;
    next:       *void;
    formFactor: FormFactor;
}
#run {
    instance: SystemGetInfo;
    assert(((cast(*void)(*instance.type)) - cast(*void)(*instance)) == 0, "SystemGetInfo.type has unexpected offset % instead of 0", ((cast(*void)(*instance.type)) - cast(*void)(*instance)));
    assert(size_of(type_of(SystemGetInfo.type)) == 4, "SystemGetInfo.type has unexpected size % instead of 4", size_of(type_of(SystemGetInfo.type)));
    assert(((cast(*void)(*instance.next)) - cast(*void)(*instance)) == 8, "SystemGetInfo.next has unexpected offset % instead of 8", ((cast(*void)(*instance.next)) - cast(*void)(*instance)));
    assert(size_of(type_of(SystemGetInfo.next)) == 8, "SystemGetInfo.next has unexpected size % instead of 8", size_of(type_of(SystemGetInfo.next)));
    assert(((cast(*void)(*instance.formFactor)) - cast(*void)(*instance)) == 16, "SystemGetInfo.formFactor has unexpected offset % instead of 16", ((cast(*void)(*instance.formFactor)) - cast(*void)(*instance)));
    assert(size_of(type_of(SystemGetInfo.formFactor)) == 4, "SystemGetInfo.formFactor has unexpected size % instead of 4", size_of(type_of(SystemGetInfo.formFactor)));
    assert(size_of(SystemGetInfo) == 24, "SystemGetInfo has size % instead of 24", size_of(SystemGetInfo));
}

SystemGraphicsProperties :: struct {
    maxSwapchainImageHeight: u32;
    maxSwapchainImageWidth:  u32;
    maxLayerCount:           u32;
}
#run {
    instance: SystemGraphicsProperties;
    assert(((cast(*void)(*instance.maxSwapchainImageHeight)) - cast(*void)(*instance)) == 0, "SystemGraphicsProperties.maxSwapchainImageHeight has unexpected offset % instead of 0", ((cast(*void)(*instance.maxSwapchainImageHeight)) - cast(*void)(*instance)));
    assert(size_of(type_of(SystemGraphicsProperties.maxSwapchainImageHeight)) == 4, "SystemGraphicsProperties.maxSwapchainImageHeight has unexpected size % instead of 4", size_of(type_of(SystemGraphicsProperties.maxSwapchainImageHeight)));
    assert(((cast(*void)(*instance.maxSwapchainImageWidth)) - cast(*void)(*instance)) == 4, "SystemGraphicsProperties.maxSwapchainImageWidth has unexpected offset % instead of 4", ((cast(*void)(*instance.maxSwapchainImageWidth)) - cast(*void)(*instance)));
    assert(size_of(type_of(SystemGraphicsProperties.maxSwapchainImageWidth)) == 4, "SystemGraphicsProperties.maxSwapchainImageWidth has unexpected size % instead of 4", size_of(type_of(SystemGraphicsProperties.maxSwapchainImageWidth)));
    assert(((cast(*void)(*instance.maxLayerCount)) - cast(*void)(*instance)) == 8, "SystemGraphicsProperties.maxLayerCount has unexpected offset % instead of 8", ((cast(*void)(*instance.maxLayerCount)) - cast(*void)(*instance)));
    assert(size_of(type_of(SystemGraphicsProperties.maxLayerCount)) == 4, "SystemGraphicsProperties.maxLayerCount has unexpected size % instead of 4", size_of(type_of(SystemGraphicsProperties.maxLayerCount)));
    assert(size_of(SystemGraphicsProperties) == 12, "SystemGraphicsProperties has size % instead of 12", size_of(SystemGraphicsProperties));
}

SystemTrackingProperties :: struct {
    orientationTracking: Bool32;
    positionTracking:    Bool32;
}
#run {
    instance: SystemTrackingProperties;
    assert(((cast(*void)(*instance.orientationTracking)) - cast(*void)(*instance)) == 0, "SystemTrackingProperties.orientationTracking has unexpected offset % instead of 0", ((cast(*void)(*instance.orientationTracking)) - cast(*void)(*instance)));
    assert(size_of(type_of(SystemTrackingProperties.orientationTracking)) == 4, "SystemTrackingProperties.orientationTracking has unexpected size % instead of 4", size_of(type_of(SystemTrackingProperties.orientationTracking)));
    assert(((cast(*void)(*instance.positionTracking)) - cast(*void)(*instance)) == 4, "SystemTrackingProperties.positionTracking has unexpected offset % instead of 4", ((cast(*void)(*instance.positionTracking)) - cast(*void)(*instance)));
    assert(size_of(type_of(SystemTrackingProperties.positionTracking)) == 4, "SystemTrackingProperties.positionTracking has unexpected size % instead of 4", size_of(type_of(SystemTrackingProperties.positionTracking)));
    assert(size_of(SystemTrackingProperties) == 8, "SystemTrackingProperties has size % instead of 8", size_of(SystemTrackingProperties));
}

SystemProperties :: struct {
    type:               StructureType;
    next:               *void;
    systemId:           SystemId;
    vendorId:           u32;
    systemName:         [256] u8;
    graphicsProperties: SystemGraphicsProperties;
    trackingProperties: SystemTrackingProperties;
}
#run {
    instance: SystemProperties;
    assert(((cast(*void)(*instance.type)) - cast(*void)(*instance)) == 0, "SystemProperties.type has unexpected offset % instead of 0", ((cast(*void)(*instance.type)) - cast(*void)(*instance)));
    assert(size_of(type_of(SystemProperties.type)) == 4, "SystemProperties.type has unexpected size % instead of 4", size_of(type_of(SystemProperties.type)));
    assert(((cast(*void)(*instance.next)) - cast(*void)(*instance)) == 8, "SystemProperties.next has unexpected offset % instead of 8", ((cast(*void)(*instance.next)) - cast(*void)(*instance)));
    assert(size_of(type_of(SystemProperties.next)) == 8, "SystemProperties.next has unexpected size % instead of 8", size_of(type_of(SystemProperties.next)));
    assert(((cast(*void)(*instance.systemId)) - cast(*void)(*instance)) == 16, "SystemProperties.systemId has unexpected offset % instead of 16", ((cast(*void)(*instance.systemId)) - cast(*void)(*instance)));
    assert(size_of(type_of(SystemProperties.systemId)) == 8, "SystemProperties.systemId has unexpected size % instead of 8", size_of(type_of(SystemProperties.systemId)));
    assert(((cast(*void)(*instance.vendorId)) - cast(*void)(*instance)) == 24, "SystemProperties.vendorId has unexpected offset % instead of 24", ((cast(*void)(*instance.vendorId)) - cast(*void)(*instance)));
    assert(size_of(type_of(SystemProperties.vendorId)) == 4, "SystemProperties.vendorId has unexpected size % instead of 4", size_of(type_of(SystemProperties.vendorId)));
    assert(((cast(*void)(*instance.systemName)) - cast(*void)(*instance)) == 28, "SystemProperties.systemName has unexpected offset % instead of 28", ((cast(*void)(*instance.systemName)) - cast(*void)(*instance)));
    assert(size_of(type_of(SystemProperties.systemName)) == 256, "SystemProperties.systemName has unexpected size % instead of 256", size_of(type_of(SystemProperties.systemName)));
    assert(((cast(*void)(*instance.graphicsProperties)) - cast(*void)(*instance)) == 284, "SystemProperties.graphicsProperties has unexpected offset % instead of 284", ((cast(*void)(*instance.graphicsProperties)) - cast(*void)(*instance)));
    assert(size_of(type_of(SystemProperties.graphicsProperties)) == 12, "SystemProperties.graphicsProperties has unexpected size % instead of 12", size_of(type_of(SystemProperties.graphicsProperties)));
    assert(((cast(*void)(*instance.trackingProperties)) - cast(*void)(*instance)) == 296, "SystemProperties.trackingProperties has unexpected offset % instead of 296", ((cast(*void)(*instance.trackingProperties)) - cast(*void)(*instance)));
    assert(size_of(type_of(SystemProperties.trackingProperties)) == 8, "SystemProperties.trackingProperties has unexpected size % instead of 8", size_of(type_of(SystemProperties.trackingProperties)));
    assert(size_of(SystemProperties) == 304, "SystemProperties has size % instead of 304", size_of(SystemProperties));
}

SessionCreateInfo :: struct {
    type:        StructureType;
    next:        *void;
    createFlags: SessionCreateFlags;
    systemId:    SystemId;
}
#run {
    instance: SessionCreateInfo;
    assert(((cast(*void)(*instance.type)) - cast(*void)(*instance)) == 0, "SessionCreateInfo.type has unexpected offset % instead of 0", ((cast(*void)(*instance.type)) - cast(*void)(*instance)));
    assert(size_of(type_of(SessionCreateInfo.type)) == 4, "SessionCreateInfo.type has unexpected size % instead of 4", size_of(type_of(SessionCreateInfo.type)));
    assert(((cast(*void)(*instance.next)) - cast(*void)(*instance)) == 8, "SessionCreateInfo.next has unexpected offset % instead of 8", ((cast(*void)(*instance.next)) - cast(*void)(*instance)));
    assert(size_of(type_of(SessionCreateInfo.next)) == 8, "SessionCreateInfo.next has unexpected size % instead of 8", size_of(type_of(SessionCreateInfo.next)));
    assert(((cast(*void)(*instance.createFlags)) - cast(*void)(*instance)) == 16, "SessionCreateInfo.createFlags has unexpected offset % instead of 16", ((cast(*void)(*instance.createFlags)) - cast(*void)(*instance)));
    assert(size_of(type_of(SessionCreateInfo.createFlags)) == 8, "SessionCreateInfo.createFlags has unexpected size % instead of 8", size_of(type_of(SessionCreateInfo.createFlags)));
    assert(((cast(*void)(*instance.systemId)) - cast(*void)(*instance)) == 24, "SessionCreateInfo.systemId has unexpected offset % instead of 24", ((cast(*void)(*instance.systemId)) - cast(*void)(*instance)));
    assert(size_of(type_of(SessionCreateInfo.systemId)) == 8, "SessionCreateInfo.systemId has unexpected size % instead of 8", size_of(type_of(SessionCreateInfo.systemId)));
    assert(size_of(SessionCreateInfo) == 32, "SessionCreateInfo has size % instead of 32", size_of(SessionCreateInfo));
}

Vector3f :: struct {
    x: float;
    y: float;
    z: float;
}
#run {
    instance: Vector3f;
    assert(((cast(*void)(*instance.x)) - cast(*void)(*instance)) == 0, "Vector3f.x has unexpected offset % instead of 0", ((cast(*void)(*instance.x)) - cast(*void)(*instance)));
    assert(size_of(type_of(Vector3f.x)) == 4, "Vector3f.x has unexpected size % instead of 4", size_of(type_of(Vector3f.x)));
    assert(((cast(*void)(*instance.y)) - cast(*void)(*instance)) == 4, "Vector3f.y has unexpected offset % instead of 4", ((cast(*void)(*instance.y)) - cast(*void)(*instance)));
    assert(size_of(type_of(Vector3f.y)) == 4, "Vector3f.y has unexpected size % instead of 4", size_of(type_of(Vector3f.y)));
    assert(((cast(*void)(*instance.z)) - cast(*void)(*instance)) == 8, "Vector3f.z has unexpected offset % instead of 8", ((cast(*void)(*instance.z)) - cast(*void)(*instance)));
    assert(size_of(type_of(Vector3f.z)) == 4, "Vector3f.z has unexpected size % instead of 4", size_of(type_of(Vector3f.z)));
    assert(size_of(Vector3f) == 12, "Vector3f has size % instead of 12", size_of(Vector3f));
}

// XrSpaceVelocity extends XrSpaceLocation
SpaceVelocity :: struct {
    type:            StructureType;
    next:            *void;
    velocityFlags:   SpaceVelocityFlags;
    linearVelocity:  Vector3f;
    angularVelocity: Vector3f;
}
#run {
    instance: SpaceVelocity;
    assert(((cast(*void)(*instance.type)) - cast(*void)(*instance)) == 0, "SpaceVelocity.type has unexpected offset % instead of 0", ((cast(*void)(*instance.type)) - cast(*void)(*instance)));
    assert(size_of(type_of(SpaceVelocity.type)) == 4, "SpaceVelocity.type has unexpected size % instead of 4", size_of(type_of(SpaceVelocity.type)));
    assert(((cast(*void)(*instance.next)) - cast(*void)(*instance)) == 8, "SpaceVelocity.next has unexpected offset % instead of 8", ((cast(*void)(*instance.next)) - cast(*void)(*instance)));
    assert(size_of(type_of(SpaceVelocity.next)) == 8, "SpaceVelocity.next has unexpected size % instead of 8", size_of(type_of(SpaceVelocity.next)));
    assert(((cast(*void)(*instance.velocityFlags)) - cast(*void)(*instance)) == 16, "SpaceVelocity.velocityFlags has unexpected offset % instead of 16", ((cast(*void)(*instance.velocityFlags)) - cast(*void)(*instance)));
    assert(size_of(type_of(SpaceVelocity.velocityFlags)) == 8, "SpaceVelocity.velocityFlags has unexpected size % instead of 8", size_of(type_of(SpaceVelocity.velocityFlags)));
    assert(((cast(*void)(*instance.linearVelocity)) - cast(*void)(*instance)) == 24, "SpaceVelocity.linearVelocity has unexpected offset % instead of 24", ((cast(*void)(*instance.linearVelocity)) - cast(*void)(*instance)));
    assert(size_of(type_of(SpaceVelocity.linearVelocity)) == 12, "SpaceVelocity.linearVelocity has unexpected size % instead of 12", size_of(type_of(SpaceVelocity.linearVelocity)));
    assert(((cast(*void)(*instance.angularVelocity)) - cast(*void)(*instance)) == 36, "SpaceVelocity.angularVelocity has unexpected offset % instead of 36", ((cast(*void)(*instance.angularVelocity)) - cast(*void)(*instance)));
    assert(size_of(type_of(SpaceVelocity.angularVelocity)) == 12, "SpaceVelocity.angularVelocity has unexpected size % instead of 12", size_of(type_of(SpaceVelocity.angularVelocity)));
    assert(size_of(SpaceVelocity) == 48, "SpaceVelocity has size % instead of 48", size_of(SpaceVelocity));
}

Quaternionf :: struct {
    x: float;
    y: float;
    z: float;
    w: float;
}
#run {
    instance: Quaternionf;
    assert(((cast(*void)(*instance.x)) - cast(*void)(*instance)) == 0, "Quaternionf.x has unexpected offset % instead of 0", ((cast(*void)(*instance.x)) - cast(*void)(*instance)));
    assert(size_of(type_of(Quaternionf.x)) == 4, "Quaternionf.x has unexpected size % instead of 4", size_of(type_of(Quaternionf.x)));
    assert(((cast(*void)(*instance.y)) - cast(*void)(*instance)) == 4, "Quaternionf.y has unexpected offset % instead of 4", ((cast(*void)(*instance.y)) - cast(*void)(*instance)));
    assert(size_of(type_of(Quaternionf.y)) == 4, "Quaternionf.y has unexpected size % instead of 4", size_of(type_of(Quaternionf.y)));
    assert(((cast(*void)(*instance.z)) - cast(*void)(*instance)) == 8, "Quaternionf.z has unexpected offset % instead of 8", ((cast(*void)(*instance.z)) - cast(*void)(*instance)));
    assert(size_of(type_of(Quaternionf.z)) == 4, "Quaternionf.z has unexpected size % instead of 4", size_of(type_of(Quaternionf.z)));
    assert(((cast(*void)(*instance.w)) - cast(*void)(*instance)) == 12, "Quaternionf.w has unexpected offset % instead of 12", ((cast(*void)(*instance.w)) - cast(*void)(*instance)));
    assert(size_of(type_of(Quaternionf.w)) == 4, "Quaternionf.w has unexpected size % instead of 4", size_of(type_of(Quaternionf.w)));
    assert(size_of(Quaternionf) == 16, "Quaternionf has size % instead of 16", size_of(Quaternionf));
}

Posef :: struct {
    orientation: Quaternionf;
    position:    Vector3f;
}
#run {
    instance: Posef;
    assert(((cast(*void)(*instance.orientation)) - cast(*void)(*instance)) == 0, "Posef.orientation has unexpected offset % instead of 0", ((cast(*void)(*instance.orientation)) - cast(*void)(*instance)));
    assert(size_of(type_of(Posef.orientation)) == 16, "Posef.orientation has unexpected size % instead of 16", size_of(type_of(Posef.orientation)));
    assert(((cast(*void)(*instance.position)) - cast(*void)(*instance)) == 16, "Posef.position has unexpected offset % instead of 16", ((cast(*void)(*instance.position)) - cast(*void)(*instance)));
    assert(size_of(type_of(Posef.position)) == 12, "Posef.position has unexpected size % instead of 12", size_of(type_of(Posef.position)));
    assert(size_of(Posef) == 28, "Posef has size % instead of 28", size_of(Posef));
}

ReferenceSpaceCreateInfo :: struct {
    type:                 StructureType;
    next:                 *void;
    referenceSpaceType:   ReferenceSpaceType;
    poseInReferenceSpace: Posef;
}
#run {
    instance: ReferenceSpaceCreateInfo;
    assert(((cast(*void)(*instance.type)) - cast(*void)(*instance)) == 0, "ReferenceSpaceCreateInfo.type has unexpected offset % instead of 0", ((cast(*void)(*instance.type)) - cast(*void)(*instance)));
    assert(size_of(type_of(ReferenceSpaceCreateInfo.type)) == 4, "ReferenceSpaceCreateInfo.type has unexpected size % instead of 4", size_of(type_of(ReferenceSpaceCreateInfo.type)));
    assert(((cast(*void)(*instance.next)) - cast(*void)(*instance)) == 8, "ReferenceSpaceCreateInfo.next has unexpected offset % instead of 8", ((cast(*void)(*instance.next)) - cast(*void)(*instance)));
    assert(size_of(type_of(ReferenceSpaceCreateInfo.next)) == 8, "ReferenceSpaceCreateInfo.next has unexpected size % instead of 8", size_of(type_of(ReferenceSpaceCreateInfo.next)));
    assert(((cast(*void)(*instance.referenceSpaceType)) - cast(*void)(*instance)) == 16, "ReferenceSpaceCreateInfo.referenceSpaceType has unexpected offset % instead of 16", ((cast(*void)(*instance.referenceSpaceType)) - cast(*void)(*instance)));
    assert(size_of(type_of(ReferenceSpaceCreateInfo.referenceSpaceType)) == 4, "ReferenceSpaceCreateInfo.referenceSpaceType has unexpected size % instead of 4", size_of(type_of(ReferenceSpaceCreateInfo.referenceSpaceType)));
    assert(((cast(*void)(*instance.poseInReferenceSpace)) - cast(*void)(*instance)) == 20, "ReferenceSpaceCreateInfo.poseInReferenceSpace has unexpected offset % instead of 20", ((cast(*void)(*instance.poseInReferenceSpace)) - cast(*void)(*instance)));
    assert(size_of(type_of(ReferenceSpaceCreateInfo.poseInReferenceSpace)) == 28, "ReferenceSpaceCreateInfo.poseInReferenceSpace has unexpected size % instead of 28", size_of(type_of(ReferenceSpaceCreateInfo.poseInReferenceSpace)));
    assert(size_of(ReferenceSpaceCreateInfo) == 48, "ReferenceSpaceCreateInfo has size % instead of 48", size_of(ReferenceSpaceCreateInfo));
}

Extent2Df :: struct {
    width:  float;
    height: float;
}
#run {
    instance: Extent2Df;
    assert(((cast(*void)(*instance.width)) - cast(*void)(*instance)) == 0, "Extent2Df.width has unexpected offset % instead of 0", ((cast(*void)(*instance.width)) - cast(*void)(*instance)));
    assert(size_of(type_of(Extent2Df.width)) == 4, "Extent2Df.width has unexpected size % instead of 4", size_of(type_of(Extent2Df.width)));
    assert(((cast(*void)(*instance.height)) - cast(*void)(*instance)) == 4, "Extent2Df.height has unexpected offset % instead of 4", ((cast(*void)(*instance.height)) - cast(*void)(*instance)));
    assert(size_of(type_of(Extent2Df.height)) == 4, "Extent2Df.height has unexpected size % instead of 4", size_of(type_of(Extent2Df.height)));
    assert(size_of(Extent2Df) == 8, "Extent2Df has size % instead of 8", size_of(Extent2Df));
}

ActionSpaceCreateInfo :: struct {
    type:              StructureType;
    next:              *void;
    action:            Action;
    subactionPath:     Path;
    poseInActionSpace: Posef;
}
#run {
    instance: ActionSpaceCreateInfo;
    assert(((cast(*void)(*instance.type)) - cast(*void)(*instance)) == 0, "ActionSpaceCreateInfo.type has unexpected offset % instead of 0", ((cast(*void)(*instance.type)) - cast(*void)(*instance)));
    assert(size_of(type_of(ActionSpaceCreateInfo.type)) == 4, "ActionSpaceCreateInfo.type has unexpected size % instead of 4", size_of(type_of(ActionSpaceCreateInfo.type)));
    assert(((cast(*void)(*instance.next)) - cast(*void)(*instance)) == 8, "ActionSpaceCreateInfo.next has unexpected offset % instead of 8", ((cast(*void)(*instance.next)) - cast(*void)(*instance)));
    assert(size_of(type_of(ActionSpaceCreateInfo.next)) == 8, "ActionSpaceCreateInfo.next has unexpected size % instead of 8", size_of(type_of(ActionSpaceCreateInfo.next)));
    assert(((cast(*void)(*instance.action)) - cast(*void)(*instance)) == 16, "ActionSpaceCreateInfo.action has unexpected offset % instead of 16", ((cast(*void)(*instance.action)) - cast(*void)(*instance)));
    assert(size_of(type_of(ActionSpaceCreateInfo.action)) == 8, "ActionSpaceCreateInfo.action has unexpected size % instead of 8", size_of(type_of(ActionSpaceCreateInfo.action)));
    assert(((cast(*void)(*instance.subactionPath)) - cast(*void)(*instance)) == 24, "ActionSpaceCreateInfo.subactionPath has unexpected offset % instead of 24", ((cast(*void)(*instance.subactionPath)) - cast(*void)(*instance)));
    assert(size_of(type_of(ActionSpaceCreateInfo.subactionPath)) == 8, "ActionSpaceCreateInfo.subactionPath has unexpected size % instead of 8", size_of(type_of(ActionSpaceCreateInfo.subactionPath)));
    assert(((cast(*void)(*instance.poseInActionSpace)) - cast(*void)(*instance)) == 32, "ActionSpaceCreateInfo.poseInActionSpace has unexpected offset % instead of 32", ((cast(*void)(*instance.poseInActionSpace)) - cast(*void)(*instance)));
    assert(size_of(type_of(ActionSpaceCreateInfo.poseInActionSpace)) == 28, "ActionSpaceCreateInfo.poseInActionSpace has unexpected size % instead of 28", size_of(type_of(ActionSpaceCreateInfo.poseInActionSpace)));
    assert(size_of(ActionSpaceCreateInfo) == 64, "ActionSpaceCreateInfo has size % instead of 64", size_of(ActionSpaceCreateInfo));
}

SpaceLocation :: struct {
    type:          StructureType;
    next:          *void;
    locationFlags: SpaceLocationFlags;
    pose:          Posef;
}
#run {
    instance: SpaceLocation;
    assert(((cast(*void)(*instance.type)) - cast(*void)(*instance)) == 0, "SpaceLocation.type has unexpected offset % instead of 0", ((cast(*void)(*instance.type)) - cast(*void)(*instance)));
    assert(size_of(type_of(SpaceLocation.type)) == 4, "SpaceLocation.type has unexpected size % instead of 4", size_of(type_of(SpaceLocation.type)));
    assert(((cast(*void)(*instance.next)) - cast(*void)(*instance)) == 8, "SpaceLocation.next has unexpected offset % instead of 8", ((cast(*void)(*instance.next)) - cast(*void)(*instance)));
    assert(size_of(type_of(SpaceLocation.next)) == 8, "SpaceLocation.next has unexpected size % instead of 8", size_of(type_of(SpaceLocation.next)));
    assert(((cast(*void)(*instance.locationFlags)) - cast(*void)(*instance)) == 16, "SpaceLocation.locationFlags has unexpected offset % instead of 16", ((cast(*void)(*instance.locationFlags)) - cast(*void)(*instance)));
    assert(size_of(type_of(SpaceLocation.locationFlags)) == 8, "SpaceLocation.locationFlags has unexpected size % instead of 8", size_of(type_of(SpaceLocation.locationFlags)));
    assert(((cast(*void)(*instance.pose)) - cast(*void)(*instance)) == 24, "SpaceLocation.pose has unexpected offset % instead of 24", ((cast(*void)(*instance.pose)) - cast(*void)(*instance)));
    assert(size_of(type_of(SpaceLocation.pose)) == 28, "SpaceLocation.pose has unexpected size % instead of 28", size_of(type_of(SpaceLocation.pose)));
    assert(size_of(SpaceLocation) == 56, "SpaceLocation has size % instead of 56", size_of(SpaceLocation));
}

ViewConfigurationProperties :: struct {
    type:                  StructureType;
    next:                  *void;
    viewConfigurationType: ViewConfigurationType;
    fovMutable:            Bool32;
}
#run {
    instance: ViewConfigurationProperties;
    assert(((cast(*void)(*instance.type)) - cast(*void)(*instance)) == 0, "ViewConfigurationProperties.type has unexpected offset % instead of 0", ((cast(*void)(*instance.type)) - cast(*void)(*instance)));
    assert(size_of(type_of(ViewConfigurationProperties.type)) == 4, "ViewConfigurationProperties.type has unexpected size % instead of 4", size_of(type_of(ViewConfigurationProperties.type)));
    assert(((cast(*void)(*instance.next)) - cast(*void)(*instance)) == 8, "ViewConfigurationProperties.next has unexpected offset % instead of 8", ((cast(*void)(*instance.next)) - cast(*void)(*instance)));
    assert(size_of(type_of(ViewConfigurationProperties.next)) == 8, "ViewConfigurationProperties.next has unexpected size % instead of 8", size_of(type_of(ViewConfigurationProperties.next)));
    assert(((cast(*void)(*instance.viewConfigurationType)) - cast(*void)(*instance)) == 16, "ViewConfigurationProperties.viewConfigurationType has unexpected offset % instead of 16", ((cast(*void)(*instance.viewConfigurationType)) - cast(*void)(*instance)));
    assert(size_of(type_of(ViewConfigurationProperties.viewConfigurationType)) == 4, "ViewConfigurationProperties.viewConfigurationType has unexpected size % instead of 4", size_of(type_of(ViewConfigurationProperties.viewConfigurationType)));
    assert(((cast(*void)(*instance.fovMutable)) - cast(*void)(*instance)) == 20, "ViewConfigurationProperties.fovMutable has unexpected offset % instead of 20", ((cast(*void)(*instance.fovMutable)) - cast(*void)(*instance)));
    assert(size_of(type_of(ViewConfigurationProperties.fovMutable)) == 4, "ViewConfigurationProperties.fovMutable has unexpected size % instead of 4", size_of(type_of(ViewConfigurationProperties.fovMutable)));
    assert(size_of(ViewConfigurationProperties) == 24, "ViewConfigurationProperties has size % instead of 24", size_of(ViewConfigurationProperties));
}

ViewConfigurationView :: struct {
    type:                            StructureType;
    next:                            *void;
    recommendedImageRectWidth:       u32;
    maxImageRectWidth:               u32;
    recommendedImageRectHeight:      u32;
    maxImageRectHeight:              u32;
    recommendedSwapchainSampleCount: u32;
    maxSwapchainSampleCount:         u32;
}
#run {
    instance: ViewConfigurationView;
    assert(((cast(*void)(*instance.type)) - cast(*void)(*instance)) == 0, "ViewConfigurationView.type has unexpected offset % instead of 0", ((cast(*void)(*instance.type)) - cast(*void)(*instance)));
    assert(size_of(type_of(ViewConfigurationView.type)) == 4, "ViewConfigurationView.type has unexpected size % instead of 4", size_of(type_of(ViewConfigurationView.type)));
    assert(((cast(*void)(*instance.next)) - cast(*void)(*instance)) == 8, "ViewConfigurationView.next has unexpected offset % instead of 8", ((cast(*void)(*instance.next)) - cast(*void)(*instance)));
    assert(size_of(type_of(ViewConfigurationView.next)) == 8, "ViewConfigurationView.next has unexpected size % instead of 8", size_of(type_of(ViewConfigurationView.next)));
    assert(((cast(*void)(*instance.recommendedImageRectWidth)) - cast(*void)(*instance)) == 16, "ViewConfigurationView.recommendedImageRectWidth has unexpected offset % instead of 16", ((cast(*void)(*instance.recommendedImageRectWidth)) - cast(*void)(*instance)));
    assert(size_of(type_of(ViewConfigurationView.recommendedImageRectWidth)) == 4, "ViewConfigurationView.recommendedImageRectWidth has unexpected size % instead of 4", size_of(type_of(ViewConfigurationView.recommendedImageRectWidth)));
    assert(((cast(*void)(*instance.maxImageRectWidth)) - cast(*void)(*instance)) == 20, "ViewConfigurationView.maxImageRectWidth has unexpected offset % instead of 20", ((cast(*void)(*instance.maxImageRectWidth)) - cast(*void)(*instance)));
    assert(size_of(type_of(ViewConfigurationView.maxImageRectWidth)) == 4, "ViewConfigurationView.maxImageRectWidth has unexpected size % instead of 4", size_of(type_of(ViewConfigurationView.maxImageRectWidth)));
    assert(((cast(*void)(*instance.recommendedImageRectHeight)) - cast(*void)(*instance)) == 24, "ViewConfigurationView.recommendedImageRectHeight has unexpected offset % instead of 24", ((cast(*void)(*instance.recommendedImageRectHeight)) - cast(*void)(*instance)));
    assert(size_of(type_of(ViewConfigurationView.recommendedImageRectHeight)) == 4, "ViewConfigurationView.recommendedImageRectHeight has unexpected size % instead of 4", size_of(type_of(ViewConfigurationView.recommendedImageRectHeight)));
    assert(((cast(*void)(*instance.maxImageRectHeight)) - cast(*void)(*instance)) == 28, "ViewConfigurationView.maxImageRectHeight has unexpected offset % instead of 28", ((cast(*void)(*instance.maxImageRectHeight)) - cast(*void)(*instance)));
    assert(size_of(type_of(ViewConfigurationView.maxImageRectHeight)) == 4, "ViewConfigurationView.maxImageRectHeight has unexpected size % instead of 4", size_of(type_of(ViewConfigurationView.maxImageRectHeight)));
    assert(((cast(*void)(*instance.recommendedSwapchainSampleCount)) - cast(*void)(*instance)) == 32, "ViewConfigurationView.recommendedSwapchainSampleCount has unexpected offset % instead of 32", ((cast(*void)(*instance.recommendedSwapchainSampleCount)) - cast(*void)(*instance)));
    assert(size_of(type_of(ViewConfigurationView.recommendedSwapchainSampleCount)) == 4, "ViewConfigurationView.recommendedSwapchainSampleCount has unexpected size % instead of 4", size_of(type_of(ViewConfigurationView.recommendedSwapchainSampleCount)));
    assert(((cast(*void)(*instance.maxSwapchainSampleCount)) - cast(*void)(*instance)) == 36, "ViewConfigurationView.maxSwapchainSampleCount has unexpected offset % instead of 36", ((cast(*void)(*instance.maxSwapchainSampleCount)) - cast(*void)(*instance)));
    assert(size_of(type_of(ViewConfigurationView.maxSwapchainSampleCount)) == 4, "ViewConfigurationView.maxSwapchainSampleCount has unexpected size % instead of 4", size_of(type_of(ViewConfigurationView.maxSwapchainSampleCount)));
    assert(size_of(ViewConfigurationView) == 40, "ViewConfigurationView has size % instead of 40", size_of(ViewConfigurationView));
}

SwapchainCreateInfo :: struct {
    type:        StructureType;
    next:        *void;
    createFlags: SwapchainCreateFlags;
    usageFlags:  SwapchainUsageFlags;
    format:      s64;
    sampleCount: u32;
    width:       u32;
    height:      u32;
    faceCount:   u32;
    arraySize:   u32;
    mipCount:    u32;
}
#run {
    instance: SwapchainCreateInfo;
    assert(((cast(*void)(*instance.type)) - cast(*void)(*instance)) == 0, "SwapchainCreateInfo.type has unexpected offset % instead of 0", ((cast(*void)(*instance.type)) - cast(*void)(*instance)));
    assert(size_of(type_of(SwapchainCreateInfo.type)) == 4, "SwapchainCreateInfo.type has unexpected size % instead of 4", size_of(type_of(SwapchainCreateInfo.type)));
    assert(((cast(*void)(*instance.next)) - cast(*void)(*instance)) == 8, "SwapchainCreateInfo.next has unexpected offset % instead of 8", ((cast(*void)(*instance.next)) - cast(*void)(*instance)));
    assert(size_of(type_of(SwapchainCreateInfo.next)) == 8, "SwapchainCreateInfo.next has unexpected size % instead of 8", size_of(type_of(SwapchainCreateInfo.next)));
    assert(((cast(*void)(*instance.createFlags)) - cast(*void)(*instance)) == 16, "SwapchainCreateInfo.createFlags has unexpected offset % instead of 16", ((cast(*void)(*instance.createFlags)) - cast(*void)(*instance)));
    assert(size_of(type_of(SwapchainCreateInfo.createFlags)) == 8, "SwapchainCreateInfo.createFlags has unexpected size % instead of 8", size_of(type_of(SwapchainCreateInfo.createFlags)));
    assert(((cast(*void)(*instance.usageFlags)) - cast(*void)(*instance)) == 24, "SwapchainCreateInfo.usageFlags has unexpected offset % instead of 24", ((cast(*void)(*instance.usageFlags)) - cast(*void)(*instance)));
    assert(size_of(type_of(SwapchainCreateInfo.usageFlags)) == 8, "SwapchainCreateInfo.usageFlags has unexpected size % instead of 8", size_of(type_of(SwapchainCreateInfo.usageFlags)));
    assert(((cast(*void)(*instance.format)) - cast(*void)(*instance)) == 32, "SwapchainCreateInfo.format has unexpected offset % instead of 32", ((cast(*void)(*instance.format)) - cast(*void)(*instance)));
    assert(size_of(type_of(SwapchainCreateInfo.format)) == 8, "SwapchainCreateInfo.format has unexpected size % instead of 8", size_of(type_of(SwapchainCreateInfo.format)));
    assert(((cast(*void)(*instance.sampleCount)) - cast(*void)(*instance)) == 40, "SwapchainCreateInfo.sampleCount has unexpected offset % instead of 40", ((cast(*void)(*instance.sampleCount)) - cast(*void)(*instance)));
    assert(size_of(type_of(SwapchainCreateInfo.sampleCount)) == 4, "SwapchainCreateInfo.sampleCount has unexpected size % instead of 4", size_of(type_of(SwapchainCreateInfo.sampleCount)));
    assert(((cast(*void)(*instance.width)) - cast(*void)(*instance)) == 44, "SwapchainCreateInfo.width has unexpected offset % instead of 44", ((cast(*void)(*instance.width)) - cast(*void)(*instance)));
    assert(size_of(type_of(SwapchainCreateInfo.width)) == 4, "SwapchainCreateInfo.width has unexpected size % instead of 4", size_of(type_of(SwapchainCreateInfo.width)));
    assert(((cast(*void)(*instance.height)) - cast(*void)(*instance)) == 48, "SwapchainCreateInfo.height has unexpected offset % instead of 48", ((cast(*void)(*instance.height)) - cast(*void)(*instance)));
    assert(size_of(type_of(SwapchainCreateInfo.height)) == 4, "SwapchainCreateInfo.height has unexpected size % instead of 4", size_of(type_of(SwapchainCreateInfo.height)));
    assert(((cast(*void)(*instance.faceCount)) - cast(*void)(*instance)) == 52, "SwapchainCreateInfo.faceCount has unexpected offset % instead of 52", ((cast(*void)(*instance.faceCount)) - cast(*void)(*instance)));
    assert(size_of(type_of(SwapchainCreateInfo.faceCount)) == 4, "SwapchainCreateInfo.faceCount has unexpected size % instead of 4", size_of(type_of(SwapchainCreateInfo.faceCount)));
    assert(((cast(*void)(*instance.arraySize)) - cast(*void)(*instance)) == 56, "SwapchainCreateInfo.arraySize has unexpected offset % instead of 56", ((cast(*void)(*instance.arraySize)) - cast(*void)(*instance)));
    assert(size_of(type_of(SwapchainCreateInfo.arraySize)) == 4, "SwapchainCreateInfo.arraySize has unexpected size % instead of 4", size_of(type_of(SwapchainCreateInfo.arraySize)));
    assert(((cast(*void)(*instance.mipCount)) - cast(*void)(*instance)) == 60, "SwapchainCreateInfo.mipCount has unexpected offset % instead of 60", ((cast(*void)(*instance.mipCount)) - cast(*void)(*instance)));
    assert(size_of(type_of(SwapchainCreateInfo.mipCount)) == 4, "SwapchainCreateInfo.mipCount has unexpected size % instead of 4", size_of(type_of(SwapchainCreateInfo.mipCount)));
    assert(size_of(SwapchainCreateInfo) == 64, "SwapchainCreateInfo has size % instead of 64", size_of(SwapchainCreateInfo));
}

SwapchainImageBaseHeader :: struct {
    type: StructureType;
    next: *void;
}
#run {
    instance: SwapchainImageBaseHeader;
    assert(((cast(*void)(*instance.type)) - cast(*void)(*instance)) == 0, "SwapchainImageBaseHeader.type has unexpected offset % instead of 0", ((cast(*void)(*instance.type)) - cast(*void)(*instance)));
    assert(size_of(type_of(SwapchainImageBaseHeader.type)) == 4, "SwapchainImageBaseHeader.type has unexpected size % instead of 4", size_of(type_of(SwapchainImageBaseHeader.type)));
    assert(((cast(*void)(*instance.next)) - cast(*void)(*instance)) == 8, "SwapchainImageBaseHeader.next has unexpected offset % instead of 8", ((cast(*void)(*instance.next)) - cast(*void)(*instance)));
    assert(size_of(type_of(SwapchainImageBaseHeader.next)) == 8, "SwapchainImageBaseHeader.next has unexpected size % instead of 8", size_of(type_of(SwapchainImageBaseHeader.next)));
    assert(size_of(SwapchainImageBaseHeader) == 16, "SwapchainImageBaseHeader has size % instead of 16", size_of(SwapchainImageBaseHeader));
}

SwapchainImageAcquireInfo :: struct {
    type: StructureType;
    next: *void;
}
#run {
    instance: SwapchainImageAcquireInfo;
    assert(((cast(*void)(*instance.type)) - cast(*void)(*instance)) == 0, "SwapchainImageAcquireInfo.type has unexpected offset % instead of 0", ((cast(*void)(*instance.type)) - cast(*void)(*instance)));
    assert(size_of(type_of(SwapchainImageAcquireInfo.type)) == 4, "SwapchainImageAcquireInfo.type has unexpected size % instead of 4", size_of(type_of(SwapchainImageAcquireInfo.type)));
    assert(((cast(*void)(*instance.next)) - cast(*void)(*instance)) == 8, "SwapchainImageAcquireInfo.next has unexpected offset % instead of 8", ((cast(*void)(*instance.next)) - cast(*void)(*instance)));
    assert(size_of(type_of(SwapchainImageAcquireInfo.next)) == 8, "SwapchainImageAcquireInfo.next has unexpected size % instead of 8", size_of(type_of(SwapchainImageAcquireInfo.next)));
    assert(size_of(SwapchainImageAcquireInfo) == 16, "SwapchainImageAcquireInfo has size % instead of 16", size_of(SwapchainImageAcquireInfo));
}

SwapchainImageWaitInfo :: struct {
    type:    StructureType;
    next:    *void;
    timeout: Duration;
}
#run {
    instance: SwapchainImageWaitInfo;
    assert(((cast(*void)(*instance.type)) - cast(*void)(*instance)) == 0, "SwapchainImageWaitInfo.type has unexpected offset % instead of 0", ((cast(*void)(*instance.type)) - cast(*void)(*instance)));
    assert(size_of(type_of(SwapchainImageWaitInfo.type)) == 4, "SwapchainImageWaitInfo.type has unexpected size % instead of 4", size_of(type_of(SwapchainImageWaitInfo.type)));
    assert(((cast(*void)(*instance.next)) - cast(*void)(*instance)) == 8, "SwapchainImageWaitInfo.next has unexpected offset % instead of 8", ((cast(*void)(*instance.next)) - cast(*void)(*instance)));
    assert(size_of(type_of(SwapchainImageWaitInfo.next)) == 8, "SwapchainImageWaitInfo.next has unexpected size % instead of 8", size_of(type_of(SwapchainImageWaitInfo.next)));
    assert(((cast(*void)(*instance.timeout)) - cast(*void)(*instance)) == 16, "SwapchainImageWaitInfo.timeout has unexpected offset % instead of 16", ((cast(*void)(*instance.timeout)) - cast(*void)(*instance)));
    assert(size_of(type_of(SwapchainImageWaitInfo.timeout)) == 8, "SwapchainImageWaitInfo.timeout has unexpected size % instead of 8", size_of(type_of(SwapchainImageWaitInfo.timeout)));
    assert(size_of(SwapchainImageWaitInfo) == 24, "SwapchainImageWaitInfo has size % instead of 24", size_of(SwapchainImageWaitInfo));
}

SwapchainImageReleaseInfo :: struct {
    type: StructureType;
    next: *void;
}
#run {
    instance: SwapchainImageReleaseInfo;
    assert(((cast(*void)(*instance.type)) - cast(*void)(*instance)) == 0, "SwapchainImageReleaseInfo.type has unexpected offset % instead of 0", ((cast(*void)(*instance.type)) - cast(*void)(*instance)));
    assert(size_of(type_of(SwapchainImageReleaseInfo.type)) == 4, "SwapchainImageReleaseInfo.type has unexpected size % instead of 4", size_of(type_of(SwapchainImageReleaseInfo.type)));
    assert(((cast(*void)(*instance.next)) - cast(*void)(*instance)) == 8, "SwapchainImageReleaseInfo.next has unexpected offset % instead of 8", ((cast(*void)(*instance.next)) - cast(*void)(*instance)));
    assert(size_of(type_of(SwapchainImageReleaseInfo.next)) == 8, "SwapchainImageReleaseInfo.next has unexpected size % instead of 8", size_of(type_of(SwapchainImageReleaseInfo.next)));
    assert(size_of(SwapchainImageReleaseInfo) == 16, "SwapchainImageReleaseInfo has size % instead of 16", size_of(SwapchainImageReleaseInfo));
}

SessionBeginInfo :: struct {
    type:                         StructureType;
    next:                         *void;
    primaryViewConfigurationType: ViewConfigurationType;
}
#run {
    instance: SessionBeginInfo;
    assert(((cast(*void)(*instance.type)) - cast(*void)(*instance)) == 0, "SessionBeginInfo.type has unexpected offset % instead of 0", ((cast(*void)(*instance.type)) - cast(*void)(*instance)));
    assert(size_of(type_of(SessionBeginInfo.type)) == 4, "SessionBeginInfo.type has unexpected size % instead of 4", size_of(type_of(SessionBeginInfo.type)));
    assert(((cast(*void)(*instance.next)) - cast(*void)(*instance)) == 8, "SessionBeginInfo.next has unexpected offset % instead of 8", ((cast(*void)(*instance.next)) - cast(*void)(*instance)));
    assert(size_of(type_of(SessionBeginInfo.next)) == 8, "SessionBeginInfo.next has unexpected size % instead of 8", size_of(type_of(SessionBeginInfo.next)));
    assert(((cast(*void)(*instance.primaryViewConfigurationType)) - cast(*void)(*instance)) == 16, "SessionBeginInfo.primaryViewConfigurationType has unexpected offset % instead of 16", ((cast(*void)(*instance.primaryViewConfigurationType)) - cast(*void)(*instance)));
    assert(size_of(type_of(SessionBeginInfo.primaryViewConfigurationType)) == 4, "SessionBeginInfo.primaryViewConfigurationType has unexpected size % instead of 4", size_of(type_of(SessionBeginInfo.primaryViewConfigurationType)));
    assert(size_of(SessionBeginInfo) == 24, "SessionBeginInfo has size % instead of 24", size_of(SessionBeginInfo));
}

FrameWaitInfo :: struct {
    type: StructureType;
    next: *void;
}
#run {
    instance: FrameWaitInfo;
    assert(((cast(*void)(*instance.type)) - cast(*void)(*instance)) == 0, "FrameWaitInfo.type has unexpected offset % instead of 0", ((cast(*void)(*instance.type)) - cast(*void)(*instance)));
    assert(size_of(type_of(FrameWaitInfo.type)) == 4, "FrameWaitInfo.type has unexpected size % instead of 4", size_of(type_of(FrameWaitInfo.type)));
    assert(((cast(*void)(*instance.next)) - cast(*void)(*instance)) == 8, "FrameWaitInfo.next has unexpected offset % instead of 8", ((cast(*void)(*instance.next)) - cast(*void)(*instance)));
    assert(size_of(type_of(FrameWaitInfo.next)) == 8, "FrameWaitInfo.next has unexpected size % instead of 8", size_of(type_of(FrameWaitInfo.next)));
    assert(size_of(FrameWaitInfo) == 16, "FrameWaitInfo has size % instead of 16", size_of(FrameWaitInfo));
}

FrameState :: struct {
    type:                   StructureType;
    next:                   *void;
    predictedDisplayTime:   Time;
    predictedDisplayPeriod: Duration;
    shouldRender:           Bool32;
}
#run {
    instance: FrameState;
    assert(((cast(*void)(*instance.type)) - cast(*void)(*instance)) == 0, "FrameState.type has unexpected offset % instead of 0", ((cast(*void)(*instance.type)) - cast(*void)(*instance)));
    assert(size_of(type_of(FrameState.type)) == 4, "FrameState.type has unexpected size % instead of 4", size_of(type_of(FrameState.type)));
    assert(((cast(*void)(*instance.next)) - cast(*void)(*instance)) == 8, "FrameState.next has unexpected offset % instead of 8", ((cast(*void)(*instance.next)) - cast(*void)(*instance)));
    assert(size_of(type_of(FrameState.next)) == 8, "FrameState.next has unexpected size % instead of 8", size_of(type_of(FrameState.next)));
    assert(((cast(*void)(*instance.predictedDisplayTime)) - cast(*void)(*instance)) == 16, "FrameState.predictedDisplayTime has unexpected offset % instead of 16", ((cast(*void)(*instance.predictedDisplayTime)) - cast(*void)(*instance)));
    assert(size_of(type_of(FrameState.predictedDisplayTime)) == 8, "FrameState.predictedDisplayTime has unexpected size % instead of 8", size_of(type_of(FrameState.predictedDisplayTime)));
    assert(((cast(*void)(*instance.predictedDisplayPeriod)) - cast(*void)(*instance)) == 24, "FrameState.predictedDisplayPeriod has unexpected offset % instead of 24", ((cast(*void)(*instance.predictedDisplayPeriod)) - cast(*void)(*instance)));
    assert(size_of(type_of(FrameState.predictedDisplayPeriod)) == 8, "FrameState.predictedDisplayPeriod has unexpected size % instead of 8", size_of(type_of(FrameState.predictedDisplayPeriod)));
    assert(((cast(*void)(*instance.shouldRender)) - cast(*void)(*instance)) == 32, "FrameState.shouldRender has unexpected offset % instead of 32", ((cast(*void)(*instance.shouldRender)) - cast(*void)(*instance)));
    assert(size_of(type_of(FrameState.shouldRender)) == 4, "FrameState.shouldRender has unexpected size % instead of 4", size_of(type_of(FrameState.shouldRender)));
    assert(size_of(FrameState) == 40, "FrameState has size % instead of 40", size_of(FrameState));
}

FrameBeginInfo :: struct {
    type: StructureType;
    next: *void;
}
#run {
    instance: FrameBeginInfo;
    assert(((cast(*void)(*instance.type)) - cast(*void)(*instance)) == 0, "FrameBeginInfo.type has unexpected offset % instead of 0", ((cast(*void)(*instance.type)) - cast(*void)(*instance)));
    assert(size_of(type_of(FrameBeginInfo.type)) == 4, "FrameBeginInfo.type has unexpected size % instead of 4", size_of(type_of(FrameBeginInfo.type)));
    assert(((cast(*void)(*instance.next)) - cast(*void)(*instance)) == 8, "FrameBeginInfo.next has unexpected offset % instead of 8", ((cast(*void)(*instance.next)) - cast(*void)(*instance)));
    assert(size_of(type_of(FrameBeginInfo.next)) == 8, "FrameBeginInfo.next has unexpected size % instead of 8", size_of(type_of(FrameBeginInfo.next)));
    assert(size_of(FrameBeginInfo) == 16, "FrameBeginInfo has size % instead of 16", size_of(FrameBeginInfo));
}

CompositionLayerBaseHeader :: struct {
    type:       StructureType;
    next:       *void;
    layerFlags: CompositionLayerFlags;
    space:      Space;
}
#run {
    instance: CompositionLayerBaseHeader;
    assert(((cast(*void)(*instance.type)) - cast(*void)(*instance)) == 0, "CompositionLayerBaseHeader.type has unexpected offset % instead of 0", ((cast(*void)(*instance.type)) - cast(*void)(*instance)));
    assert(size_of(type_of(CompositionLayerBaseHeader.type)) == 4, "CompositionLayerBaseHeader.type has unexpected size % instead of 4", size_of(type_of(CompositionLayerBaseHeader.type)));
    assert(((cast(*void)(*instance.next)) - cast(*void)(*instance)) == 8, "CompositionLayerBaseHeader.next has unexpected offset % instead of 8", ((cast(*void)(*instance.next)) - cast(*void)(*instance)));
    assert(size_of(type_of(CompositionLayerBaseHeader.next)) == 8, "CompositionLayerBaseHeader.next has unexpected size % instead of 8", size_of(type_of(CompositionLayerBaseHeader.next)));
    assert(((cast(*void)(*instance.layerFlags)) - cast(*void)(*instance)) == 16, "CompositionLayerBaseHeader.layerFlags has unexpected offset % instead of 16", ((cast(*void)(*instance.layerFlags)) - cast(*void)(*instance)));
    assert(size_of(type_of(CompositionLayerBaseHeader.layerFlags)) == 8, "CompositionLayerBaseHeader.layerFlags has unexpected size % instead of 8", size_of(type_of(CompositionLayerBaseHeader.layerFlags)));
    assert(((cast(*void)(*instance.space)) - cast(*void)(*instance)) == 24, "CompositionLayerBaseHeader.space has unexpected offset % instead of 24", ((cast(*void)(*instance.space)) - cast(*void)(*instance)));
    assert(size_of(type_of(CompositionLayerBaseHeader.space)) == 8, "CompositionLayerBaseHeader.space has unexpected size % instead of 8", size_of(type_of(CompositionLayerBaseHeader.space)));
    assert(size_of(CompositionLayerBaseHeader) == 32, "CompositionLayerBaseHeader has size % instead of 32", size_of(CompositionLayerBaseHeader));
}

FrameEndInfo :: struct {
    type:                 StructureType;
    next:                 *void;
    displayTime:          Time;
    environmentBlendMode: EnvironmentBlendMode;
    layerCount:           u32;
    layers:               **CompositionLayerBaseHeader;
}
#run {
    instance: FrameEndInfo;
    assert(((cast(*void)(*instance.type)) - cast(*void)(*instance)) == 0, "FrameEndInfo.type has unexpected offset % instead of 0", ((cast(*void)(*instance.type)) - cast(*void)(*instance)));
    assert(size_of(type_of(FrameEndInfo.type)) == 4, "FrameEndInfo.type has unexpected size % instead of 4", size_of(type_of(FrameEndInfo.type)));
    assert(((cast(*void)(*instance.next)) - cast(*void)(*instance)) == 8, "FrameEndInfo.next has unexpected offset % instead of 8", ((cast(*void)(*instance.next)) - cast(*void)(*instance)));
    assert(size_of(type_of(FrameEndInfo.next)) == 8, "FrameEndInfo.next has unexpected size % instead of 8", size_of(type_of(FrameEndInfo.next)));
    assert(((cast(*void)(*instance.displayTime)) - cast(*void)(*instance)) == 16, "FrameEndInfo.displayTime has unexpected offset % instead of 16", ((cast(*void)(*instance.displayTime)) - cast(*void)(*instance)));
    assert(size_of(type_of(FrameEndInfo.displayTime)) == 8, "FrameEndInfo.displayTime has unexpected size % instead of 8", size_of(type_of(FrameEndInfo.displayTime)));
    assert(((cast(*void)(*instance.environmentBlendMode)) - cast(*void)(*instance)) == 24, "FrameEndInfo.environmentBlendMode has unexpected offset % instead of 24", ((cast(*void)(*instance.environmentBlendMode)) - cast(*void)(*instance)));
    assert(size_of(type_of(FrameEndInfo.environmentBlendMode)) == 4, "FrameEndInfo.environmentBlendMode has unexpected size % instead of 4", size_of(type_of(FrameEndInfo.environmentBlendMode)));
    assert(((cast(*void)(*instance.layerCount)) - cast(*void)(*instance)) == 28, "FrameEndInfo.layerCount has unexpected offset % instead of 28", ((cast(*void)(*instance.layerCount)) - cast(*void)(*instance)));
    assert(size_of(type_of(FrameEndInfo.layerCount)) == 4, "FrameEndInfo.layerCount has unexpected size % instead of 4", size_of(type_of(FrameEndInfo.layerCount)));
    assert(((cast(*void)(*instance.layers)) - cast(*void)(*instance)) == 32, "FrameEndInfo.layers has unexpected offset % instead of 32", ((cast(*void)(*instance.layers)) - cast(*void)(*instance)));
    assert(size_of(type_of(FrameEndInfo.layers)) == 8, "FrameEndInfo.layers has unexpected size % instead of 8", size_of(type_of(FrameEndInfo.layers)));
    assert(size_of(FrameEndInfo) == 40, "FrameEndInfo has size % instead of 40", size_of(FrameEndInfo));
}

ViewLocateInfo :: struct {
    type:                  StructureType;
    next:                  *void;
    viewConfigurationType: ViewConfigurationType;
    displayTime:           Time;
    space:                 Space;
}
#run {
    instance: ViewLocateInfo;
    assert(((cast(*void)(*instance.type)) - cast(*void)(*instance)) == 0, "ViewLocateInfo.type has unexpected offset % instead of 0", ((cast(*void)(*instance.type)) - cast(*void)(*instance)));
    assert(size_of(type_of(ViewLocateInfo.type)) == 4, "ViewLocateInfo.type has unexpected size % instead of 4", size_of(type_of(ViewLocateInfo.type)));
    assert(((cast(*void)(*instance.next)) - cast(*void)(*instance)) == 8, "ViewLocateInfo.next has unexpected offset % instead of 8", ((cast(*void)(*instance.next)) - cast(*void)(*instance)));
    assert(size_of(type_of(ViewLocateInfo.next)) == 8, "ViewLocateInfo.next has unexpected size % instead of 8", size_of(type_of(ViewLocateInfo.next)));
    assert(((cast(*void)(*instance.viewConfigurationType)) - cast(*void)(*instance)) == 16, "ViewLocateInfo.viewConfigurationType has unexpected offset % instead of 16", ((cast(*void)(*instance.viewConfigurationType)) - cast(*void)(*instance)));
    assert(size_of(type_of(ViewLocateInfo.viewConfigurationType)) == 4, "ViewLocateInfo.viewConfigurationType has unexpected size % instead of 4", size_of(type_of(ViewLocateInfo.viewConfigurationType)));
    assert(((cast(*void)(*instance.displayTime)) - cast(*void)(*instance)) == 24, "ViewLocateInfo.displayTime has unexpected offset % instead of 24", ((cast(*void)(*instance.displayTime)) - cast(*void)(*instance)));
    assert(size_of(type_of(ViewLocateInfo.displayTime)) == 8, "ViewLocateInfo.displayTime has unexpected size % instead of 8", size_of(type_of(ViewLocateInfo.displayTime)));
    assert(((cast(*void)(*instance.space)) - cast(*void)(*instance)) == 32, "ViewLocateInfo.space has unexpected offset % instead of 32", ((cast(*void)(*instance.space)) - cast(*void)(*instance)));
    assert(size_of(type_of(ViewLocateInfo.space)) == 8, "ViewLocateInfo.space has unexpected size % instead of 8", size_of(type_of(ViewLocateInfo.space)));
    assert(size_of(ViewLocateInfo) == 40, "ViewLocateInfo has size % instead of 40", size_of(ViewLocateInfo));
}

ViewState :: struct {
    type:           StructureType;
    next:           *void;
    viewStateFlags: ViewStateFlags;
}
#run {
    instance: ViewState;
    assert(((cast(*void)(*instance.type)) - cast(*void)(*instance)) == 0, "ViewState.type has unexpected offset % instead of 0", ((cast(*void)(*instance.type)) - cast(*void)(*instance)));
    assert(size_of(type_of(ViewState.type)) == 4, "ViewState.type has unexpected size % instead of 4", size_of(type_of(ViewState.type)));
    assert(((cast(*void)(*instance.next)) - cast(*void)(*instance)) == 8, "ViewState.next has unexpected offset % instead of 8", ((cast(*void)(*instance.next)) - cast(*void)(*instance)));
    assert(size_of(type_of(ViewState.next)) == 8, "ViewState.next has unexpected size % instead of 8", size_of(type_of(ViewState.next)));
    assert(((cast(*void)(*instance.viewStateFlags)) - cast(*void)(*instance)) == 16, "ViewState.viewStateFlags has unexpected offset % instead of 16", ((cast(*void)(*instance.viewStateFlags)) - cast(*void)(*instance)));
    assert(size_of(type_of(ViewState.viewStateFlags)) == 8, "ViewState.viewStateFlags has unexpected size % instead of 8", size_of(type_of(ViewState.viewStateFlags)));
    assert(size_of(ViewState) == 24, "ViewState has size % instead of 24", size_of(ViewState));
}

Fovf :: struct {
    angleLeft:  float;
    angleRight: float;
    angleUp:    float;
    angleDown:  float;
}
#run {
    instance: Fovf;
    assert(((cast(*void)(*instance.angleLeft)) - cast(*void)(*instance)) == 0, "Fovf.angleLeft has unexpected offset % instead of 0", ((cast(*void)(*instance.angleLeft)) - cast(*void)(*instance)));
    assert(size_of(type_of(Fovf.angleLeft)) == 4, "Fovf.angleLeft has unexpected size % instead of 4", size_of(type_of(Fovf.angleLeft)));
    assert(((cast(*void)(*instance.angleRight)) - cast(*void)(*instance)) == 4, "Fovf.angleRight has unexpected offset % instead of 4", ((cast(*void)(*instance.angleRight)) - cast(*void)(*instance)));
    assert(size_of(type_of(Fovf.angleRight)) == 4, "Fovf.angleRight has unexpected size % instead of 4", size_of(type_of(Fovf.angleRight)));
    assert(((cast(*void)(*instance.angleUp)) - cast(*void)(*instance)) == 8, "Fovf.angleUp has unexpected offset % instead of 8", ((cast(*void)(*instance.angleUp)) - cast(*void)(*instance)));
    assert(size_of(type_of(Fovf.angleUp)) == 4, "Fovf.angleUp has unexpected size % instead of 4", size_of(type_of(Fovf.angleUp)));
    assert(((cast(*void)(*instance.angleDown)) - cast(*void)(*instance)) == 12, "Fovf.angleDown has unexpected offset % instead of 12", ((cast(*void)(*instance.angleDown)) - cast(*void)(*instance)));
    assert(size_of(type_of(Fovf.angleDown)) == 4, "Fovf.angleDown has unexpected size % instead of 4", size_of(type_of(Fovf.angleDown)));
    assert(size_of(Fovf) == 16, "Fovf has size % instead of 16", size_of(Fovf));
}

View :: struct {
    type: StructureType;
    next: *void;
    pose: Posef;
    fov:  Fovf;
}
#run {
    instance: View;
    assert(((cast(*void)(*instance.type)) - cast(*void)(*instance)) == 0, "View.type has unexpected offset % instead of 0", ((cast(*void)(*instance.type)) - cast(*void)(*instance)));
    assert(size_of(type_of(View.type)) == 4, "View.type has unexpected size % instead of 4", size_of(type_of(View.type)));
    assert(((cast(*void)(*instance.next)) - cast(*void)(*instance)) == 8, "View.next has unexpected offset % instead of 8", ((cast(*void)(*instance.next)) - cast(*void)(*instance)));
    assert(size_of(type_of(View.next)) == 8, "View.next has unexpected size % instead of 8", size_of(type_of(View.next)));
    assert(((cast(*void)(*instance.pose)) - cast(*void)(*instance)) == 16, "View.pose has unexpected offset % instead of 16", ((cast(*void)(*instance.pose)) - cast(*void)(*instance)));
    assert(size_of(type_of(View.pose)) == 28, "View.pose has unexpected size % instead of 28", size_of(type_of(View.pose)));
    assert(((cast(*void)(*instance.fov)) - cast(*void)(*instance)) == 44, "View.fov has unexpected offset % instead of 44", ((cast(*void)(*instance.fov)) - cast(*void)(*instance)));
    assert(size_of(type_of(View.fov)) == 16, "View.fov has unexpected size % instead of 16", size_of(type_of(View.fov)));
    assert(size_of(View) == 64, "View has size % instead of 64", size_of(View));
}

ActionSetCreateInfo :: struct {
    type:                   StructureType;
    next:                   *void;
    actionSetName:          [64] u8;
    localizedActionSetName: [128] u8;
    priority:               u32;
}
#run {
    instance: ActionSetCreateInfo;
    assert(((cast(*void)(*instance.type)) - cast(*void)(*instance)) == 0, "ActionSetCreateInfo.type has unexpected offset % instead of 0", ((cast(*void)(*instance.type)) - cast(*void)(*instance)));
    assert(size_of(type_of(ActionSetCreateInfo.type)) == 4, "ActionSetCreateInfo.type has unexpected size % instead of 4", size_of(type_of(ActionSetCreateInfo.type)));
    assert(((cast(*void)(*instance.next)) - cast(*void)(*instance)) == 8, "ActionSetCreateInfo.next has unexpected offset % instead of 8", ((cast(*void)(*instance.next)) - cast(*void)(*instance)));
    assert(size_of(type_of(ActionSetCreateInfo.next)) == 8, "ActionSetCreateInfo.next has unexpected size % instead of 8", size_of(type_of(ActionSetCreateInfo.next)));
    assert(((cast(*void)(*instance.actionSetName)) - cast(*void)(*instance)) == 16, "ActionSetCreateInfo.actionSetName has unexpected offset % instead of 16", ((cast(*void)(*instance.actionSetName)) - cast(*void)(*instance)));
    assert(size_of(type_of(ActionSetCreateInfo.actionSetName)) == 64, "ActionSetCreateInfo.actionSetName has unexpected size % instead of 64", size_of(type_of(ActionSetCreateInfo.actionSetName)));
    assert(((cast(*void)(*instance.localizedActionSetName)) - cast(*void)(*instance)) == 80, "ActionSetCreateInfo.localizedActionSetName has unexpected offset % instead of 80", ((cast(*void)(*instance.localizedActionSetName)) - cast(*void)(*instance)));
    assert(size_of(type_of(ActionSetCreateInfo.localizedActionSetName)) == 128, "ActionSetCreateInfo.localizedActionSetName has unexpected size % instead of 128", size_of(type_of(ActionSetCreateInfo.localizedActionSetName)));
    assert(((cast(*void)(*instance.priority)) - cast(*void)(*instance)) == 208, "ActionSetCreateInfo.priority has unexpected offset % instead of 208", ((cast(*void)(*instance.priority)) - cast(*void)(*instance)));
    assert(size_of(type_of(ActionSetCreateInfo.priority)) == 4, "ActionSetCreateInfo.priority has unexpected size % instead of 4", size_of(type_of(ActionSetCreateInfo.priority)));
    assert(size_of(ActionSetCreateInfo) == 216, "ActionSetCreateInfo has size % instead of 216", size_of(ActionSetCreateInfo));
}

ActionCreateInfo :: struct {
    type:                StructureType;
    next:                *void;
    actionName:          [64] u8;
    actionType:          ActionType;
    countSubactionPaths: u32;
    subactionPaths:      *Path;
    localizedActionName: [128] u8;
}
#run {
    instance: ActionCreateInfo;
    assert(((cast(*void)(*instance.type)) - cast(*void)(*instance)) == 0, "ActionCreateInfo.type has unexpected offset % instead of 0", ((cast(*void)(*instance.type)) - cast(*void)(*instance)));
    assert(size_of(type_of(ActionCreateInfo.type)) == 4, "ActionCreateInfo.type has unexpected size % instead of 4", size_of(type_of(ActionCreateInfo.type)));
    assert(((cast(*void)(*instance.next)) - cast(*void)(*instance)) == 8, "ActionCreateInfo.next has unexpected offset % instead of 8", ((cast(*void)(*instance.next)) - cast(*void)(*instance)));
    assert(size_of(type_of(ActionCreateInfo.next)) == 8, "ActionCreateInfo.next has unexpected size % instead of 8", size_of(type_of(ActionCreateInfo.next)));
    assert(((cast(*void)(*instance.actionName)) - cast(*void)(*instance)) == 16, "ActionCreateInfo.actionName has unexpected offset % instead of 16", ((cast(*void)(*instance.actionName)) - cast(*void)(*instance)));
    assert(size_of(type_of(ActionCreateInfo.actionName)) == 64, "ActionCreateInfo.actionName has unexpected size % instead of 64", size_of(type_of(ActionCreateInfo.actionName)));
    assert(((cast(*void)(*instance.actionType)) - cast(*void)(*instance)) == 80, "ActionCreateInfo.actionType has unexpected offset % instead of 80", ((cast(*void)(*instance.actionType)) - cast(*void)(*instance)));
    assert(size_of(type_of(ActionCreateInfo.actionType)) == 4, "ActionCreateInfo.actionType has unexpected size % instead of 4", size_of(type_of(ActionCreateInfo.actionType)));
    assert(((cast(*void)(*instance.countSubactionPaths)) - cast(*void)(*instance)) == 84, "ActionCreateInfo.countSubactionPaths has unexpected offset % instead of 84", ((cast(*void)(*instance.countSubactionPaths)) - cast(*void)(*instance)));
    assert(size_of(type_of(ActionCreateInfo.countSubactionPaths)) == 4, "ActionCreateInfo.countSubactionPaths has unexpected size % instead of 4", size_of(type_of(ActionCreateInfo.countSubactionPaths)));
    assert(((cast(*void)(*instance.subactionPaths)) - cast(*void)(*instance)) == 88, "ActionCreateInfo.subactionPaths has unexpected offset % instead of 88", ((cast(*void)(*instance.subactionPaths)) - cast(*void)(*instance)));
    assert(size_of(type_of(ActionCreateInfo.subactionPaths)) == 8, "ActionCreateInfo.subactionPaths has unexpected size % instead of 8", size_of(type_of(ActionCreateInfo.subactionPaths)));
    assert(((cast(*void)(*instance.localizedActionName)) - cast(*void)(*instance)) == 96, "ActionCreateInfo.localizedActionName has unexpected offset % instead of 96", ((cast(*void)(*instance.localizedActionName)) - cast(*void)(*instance)));
    assert(size_of(type_of(ActionCreateInfo.localizedActionName)) == 128, "ActionCreateInfo.localizedActionName has unexpected size % instead of 128", size_of(type_of(ActionCreateInfo.localizedActionName)));
    assert(size_of(ActionCreateInfo) == 224, "ActionCreateInfo has size % instead of 224", size_of(ActionCreateInfo));
}

ActionSuggestedBinding :: struct {
    action:  Action;
    binding: Path;
}
#run {
    instance: ActionSuggestedBinding;
    assert(((cast(*void)(*instance.action)) - cast(*void)(*instance)) == 0, "ActionSuggestedBinding.action has unexpected offset % instead of 0", ((cast(*void)(*instance.action)) - cast(*void)(*instance)));
    assert(size_of(type_of(ActionSuggestedBinding.action)) == 8, "ActionSuggestedBinding.action has unexpected size % instead of 8", size_of(type_of(ActionSuggestedBinding.action)));
    assert(((cast(*void)(*instance.binding)) - cast(*void)(*instance)) == 8, "ActionSuggestedBinding.binding has unexpected offset % instead of 8", ((cast(*void)(*instance.binding)) - cast(*void)(*instance)));
    assert(size_of(type_of(ActionSuggestedBinding.binding)) == 8, "ActionSuggestedBinding.binding has unexpected size % instead of 8", size_of(type_of(ActionSuggestedBinding.binding)));
    assert(size_of(ActionSuggestedBinding) == 16, "ActionSuggestedBinding has size % instead of 16", size_of(ActionSuggestedBinding));
}

InteractionProfileSuggestedBinding :: struct {
    type:                   StructureType;
    next:                   *void;
    interactionProfile:     Path;
    countSuggestedBindings: u32;
    suggestedBindings:      *ActionSuggestedBinding;
}
#run {
    instance: InteractionProfileSuggestedBinding;
    assert(((cast(*void)(*instance.type)) - cast(*void)(*instance)) == 0, "InteractionProfileSuggestedBinding.type has unexpected offset % instead of 0", ((cast(*void)(*instance.type)) - cast(*void)(*instance)));
    assert(size_of(type_of(InteractionProfileSuggestedBinding.type)) == 4, "InteractionProfileSuggestedBinding.type has unexpected size % instead of 4", size_of(type_of(InteractionProfileSuggestedBinding.type)));
    assert(((cast(*void)(*instance.next)) - cast(*void)(*instance)) == 8, "InteractionProfileSuggestedBinding.next has unexpected offset % instead of 8", ((cast(*void)(*instance.next)) - cast(*void)(*instance)));
    assert(size_of(type_of(InteractionProfileSuggestedBinding.next)) == 8, "InteractionProfileSuggestedBinding.next has unexpected size % instead of 8", size_of(type_of(InteractionProfileSuggestedBinding.next)));
    assert(((cast(*void)(*instance.interactionProfile)) - cast(*void)(*instance)) == 16, "InteractionProfileSuggestedBinding.interactionProfile has unexpected offset % instead of 16", ((cast(*void)(*instance.interactionProfile)) - cast(*void)(*instance)));
    assert(size_of(type_of(InteractionProfileSuggestedBinding.interactionProfile)) == 8, "InteractionProfileSuggestedBinding.interactionProfile has unexpected size % instead of 8", size_of(type_of(InteractionProfileSuggestedBinding.interactionProfile)));
    assert(((cast(*void)(*instance.countSuggestedBindings)) - cast(*void)(*instance)) == 24, "InteractionProfileSuggestedBinding.countSuggestedBindings has unexpected offset % instead of 24", ((cast(*void)(*instance.countSuggestedBindings)) - cast(*void)(*instance)));
    assert(size_of(type_of(InteractionProfileSuggestedBinding.countSuggestedBindings)) == 4, "InteractionProfileSuggestedBinding.countSuggestedBindings has unexpected size % instead of 4", size_of(type_of(InteractionProfileSuggestedBinding.countSuggestedBindings)));
    assert(((cast(*void)(*instance.suggestedBindings)) - cast(*void)(*instance)) == 32, "InteractionProfileSuggestedBinding.suggestedBindings has unexpected offset % instead of 32", ((cast(*void)(*instance.suggestedBindings)) - cast(*void)(*instance)));
    assert(size_of(type_of(InteractionProfileSuggestedBinding.suggestedBindings)) == 8, "InteractionProfileSuggestedBinding.suggestedBindings has unexpected size % instead of 8", size_of(type_of(InteractionProfileSuggestedBinding.suggestedBindings)));
    assert(size_of(InteractionProfileSuggestedBinding) == 40, "InteractionProfileSuggestedBinding has size % instead of 40", size_of(InteractionProfileSuggestedBinding));
}

SessionActionSetsAttachInfo :: struct {
    type:            StructureType;
    next:            *void;
    countActionSets: u32;
    actionSets:      *ActionSet;
}
#run {
    instance: SessionActionSetsAttachInfo;
    assert(((cast(*void)(*instance.type)) - cast(*void)(*instance)) == 0, "SessionActionSetsAttachInfo.type has unexpected offset % instead of 0", ((cast(*void)(*instance.type)) - cast(*void)(*instance)));
    assert(size_of(type_of(SessionActionSetsAttachInfo.type)) == 4, "SessionActionSetsAttachInfo.type has unexpected size % instead of 4", size_of(type_of(SessionActionSetsAttachInfo.type)));
    assert(((cast(*void)(*instance.next)) - cast(*void)(*instance)) == 8, "SessionActionSetsAttachInfo.next has unexpected offset % instead of 8", ((cast(*void)(*instance.next)) - cast(*void)(*instance)));
    assert(size_of(type_of(SessionActionSetsAttachInfo.next)) == 8, "SessionActionSetsAttachInfo.next has unexpected size % instead of 8", size_of(type_of(SessionActionSetsAttachInfo.next)));
    assert(((cast(*void)(*instance.countActionSets)) - cast(*void)(*instance)) == 16, "SessionActionSetsAttachInfo.countActionSets has unexpected offset % instead of 16", ((cast(*void)(*instance.countActionSets)) - cast(*void)(*instance)));
    assert(size_of(type_of(SessionActionSetsAttachInfo.countActionSets)) == 4, "SessionActionSetsAttachInfo.countActionSets has unexpected size % instead of 4", size_of(type_of(SessionActionSetsAttachInfo.countActionSets)));
    assert(((cast(*void)(*instance.actionSets)) - cast(*void)(*instance)) == 24, "SessionActionSetsAttachInfo.actionSets has unexpected offset % instead of 24", ((cast(*void)(*instance.actionSets)) - cast(*void)(*instance)));
    assert(size_of(type_of(SessionActionSetsAttachInfo.actionSets)) == 8, "SessionActionSetsAttachInfo.actionSets has unexpected size % instead of 8", size_of(type_of(SessionActionSetsAttachInfo.actionSets)));
    assert(size_of(SessionActionSetsAttachInfo) == 32, "SessionActionSetsAttachInfo has size % instead of 32", size_of(SessionActionSetsAttachInfo));
}

InteractionProfileState :: struct {
    type:               StructureType;
    next:               *void;
    interactionProfile: Path;
}
#run {
    instance: InteractionProfileState;
    assert(((cast(*void)(*instance.type)) - cast(*void)(*instance)) == 0, "InteractionProfileState.type has unexpected offset % instead of 0", ((cast(*void)(*instance.type)) - cast(*void)(*instance)));
    assert(size_of(type_of(InteractionProfileState.type)) == 4, "InteractionProfileState.type has unexpected size % instead of 4", size_of(type_of(InteractionProfileState.type)));
    assert(((cast(*void)(*instance.next)) - cast(*void)(*instance)) == 8, "InteractionProfileState.next has unexpected offset % instead of 8", ((cast(*void)(*instance.next)) - cast(*void)(*instance)));
    assert(size_of(type_of(InteractionProfileState.next)) == 8, "InteractionProfileState.next has unexpected size % instead of 8", size_of(type_of(InteractionProfileState.next)));
    assert(((cast(*void)(*instance.interactionProfile)) - cast(*void)(*instance)) == 16, "InteractionProfileState.interactionProfile has unexpected offset % instead of 16", ((cast(*void)(*instance.interactionProfile)) - cast(*void)(*instance)));
    assert(size_of(type_of(InteractionProfileState.interactionProfile)) == 8, "InteractionProfileState.interactionProfile has unexpected size % instead of 8", size_of(type_of(InteractionProfileState.interactionProfile)));
    assert(size_of(InteractionProfileState) == 24, "InteractionProfileState has size % instead of 24", size_of(InteractionProfileState));
}

ActionStateGetInfo :: struct {
    type:          StructureType;
    next:          *void;
    action:        Action;
    subactionPath: Path;
}
#run {
    instance: ActionStateGetInfo;
    assert(((cast(*void)(*instance.type)) - cast(*void)(*instance)) == 0, "ActionStateGetInfo.type has unexpected offset % instead of 0", ((cast(*void)(*instance.type)) - cast(*void)(*instance)));
    assert(size_of(type_of(ActionStateGetInfo.type)) == 4, "ActionStateGetInfo.type has unexpected size % instead of 4", size_of(type_of(ActionStateGetInfo.type)));
    assert(((cast(*void)(*instance.next)) - cast(*void)(*instance)) == 8, "ActionStateGetInfo.next has unexpected offset % instead of 8", ((cast(*void)(*instance.next)) - cast(*void)(*instance)));
    assert(size_of(type_of(ActionStateGetInfo.next)) == 8, "ActionStateGetInfo.next has unexpected size % instead of 8", size_of(type_of(ActionStateGetInfo.next)));
    assert(((cast(*void)(*instance.action)) - cast(*void)(*instance)) == 16, "ActionStateGetInfo.action has unexpected offset % instead of 16", ((cast(*void)(*instance.action)) - cast(*void)(*instance)));
    assert(size_of(type_of(ActionStateGetInfo.action)) == 8, "ActionStateGetInfo.action has unexpected size % instead of 8", size_of(type_of(ActionStateGetInfo.action)));
    assert(((cast(*void)(*instance.subactionPath)) - cast(*void)(*instance)) == 24, "ActionStateGetInfo.subactionPath has unexpected offset % instead of 24", ((cast(*void)(*instance.subactionPath)) - cast(*void)(*instance)));
    assert(size_of(type_of(ActionStateGetInfo.subactionPath)) == 8, "ActionStateGetInfo.subactionPath has unexpected size % instead of 8", size_of(type_of(ActionStateGetInfo.subactionPath)));
    assert(size_of(ActionStateGetInfo) == 32, "ActionStateGetInfo has size % instead of 32", size_of(ActionStateGetInfo));
}

ActionStateBoolean :: struct {
    type:                 StructureType;
    next:                 *void;
    currentState:         Bool32;
    changedSinceLastSync: Bool32;
    lastChangeTime:       Time;
    isActive:             Bool32;
}
#run {
    instance: ActionStateBoolean;
    assert(((cast(*void)(*instance.type)) - cast(*void)(*instance)) == 0, "ActionStateBoolean.type has unexpected offset % instead of 0", ((cast(*void)(*instance.type)) - cast(*void)(*instance)));
    assert(size_of(type_of(ActionStateBoolean.type)) == 4, "ActionStateBoolean.type has unexpected size % instead of 4", size_of(type_of(ActionStateBoolean.type)));
    assert(((cast(*void)(*instance.next)) - cast(*void)(*instance)) == 8, "ActionStateBoolean.next has unexpected offset % instead of 8", ((cast(*void)(*instance.next)) - cast(*void)(*instance)));
    assert(size_of(type_of(ActionStateBoolean.next)) == 8, "ActionStateBoolean.next has unexpected size % instead of 8", size_of(type_of(ActionStateBoolean.next)));
    assert(((cast(*void)(*instance.currentState)) - cast(*void)(*instance)) == 16, "ActionStateBoolean.currentState has unexpected offset % instead of 16", ((cast(*void)(*instance.currentState)) - cast(*void)(*instance)));
    assert(size_of(type_of(ActionStateBoolean.currentState)) == 4, "ActionStateBoolean.currentState has unexpected size % instead of 4", size_of(type_of(ActionStateBoolean.currentState)));
    assert(((cast(*void)(*instance.changedSinceLastSync)) - cast(*void)(*instance)) == 20, "ActionStateBoolean.changedSinceLastSync has unexpected offset % instead of 20", ((cast(*void)(*instance.changedSinceLastSync)) - cast(*void)(*instance)));
    assert(size_of(type_of(ActionStateBoolean.changedSinceLastSync)) == 4, "ActionStateBoolean.changedSinceLastSync has unexpected size % instead of 4", size_of(type_of(ActionStateBoolean.changedSinceLastSync)));
    assert(((cast(*void)(*instance.lastChangeTime)) - cast(*void)(*instance)) == 24, "ActionStateBoolean.lastChangeTime has unexpected offset % instead of 24", ((cast(*void)(*instance.lastChangeTime)) - cast(*void)(*instance)));
    assert(size_of(type_of(ActionStateBoolean.lastChangeTime)) == 8, "ActionStateBoolean.lastChangeTime has unexpected size % instead of 8", size_of(type_of(ActionStateBoolean.lastChangeTime)));
    assert(((cast(*void)(*instance.isActive)) - cast(*void)(*instance)) == 32, "ActionStateBoolean.isActive has unexpected offset % instead of 32", ((cast(*void)(*instance.isActive)) - cast(*void)(*instance)));
    assert(size_of(type_of(ActionStateBoolean.isActive)) == 4, "ActionStateBoolean.isActive has unexpected size % instead of 4", size_of(type_of(ActionStateBoolean.isActive)));
    assert(size_of(ActionStateBoolean) == 40, "ActionStateBoolean has size % instead of 40", size_of(ActionStateBoolean));
}

ActionStateFloat :: struct {
    type:                 StructureType;
    next:                 *void;
    currentState:         float;
    changedSinceLastSync: Bool32;
    lastChangeTime:       Time;
    isActive:             Bool32;
}
#run {
    instance: ActionStateFloat;
    assert(((cast(*void)(*instance.type)) - cast(*void)(*instance)) == 0, "ActionStateFloat.type has unexpected offset % instead of 0", ((cast(*void)(*instance.type)) - cast(*void)(*instance)));
    assert(size_of(type_of(ActionStateFloat.type)) == 4, "ActionStateFloat.type has unexpected size % instead of 4", size_of(type_of(ActionStateFloat.type)));
    assert(((cast(*void)(*instance.next)) - cast(*void)(*instance)) == 8, "ActionStateFloat.next has unexpected offset % instead of 8", ((cast(*void)(*instance.next)) - cast(*void)(*instance)));
    assert(size_of(type_of(ActionStateFloat.next)) == 8, "ActionStateFloat.next has unexpected size % instead of 8", size_of(type_of(ActionStateFloat.next)));
    assert(((cast(*void)(*instance.currentState)) - cast(*void)(*instance)) == 16, "ActionStateFloat.currentState has unexpected offset % instead of 16", ((cast(*void)(*instance.currentState)) - cast(*void)(*instance)));
    assert(size_of(type_of(ActionStateFloat.currentState)) == 4, "ActionStateFloat.currentState has unexpected size % instead of 4", size_of(type_of(ActionStateFloat.currentState)));
    assert(((cast(*void)(*instance.changedSinceLastSync)) - cast(*void)(*instance)) == 20, "ActionStateFloat.changedSinceLastSync has unexpected offset % instead of 20", ((cast(*void)(*instance.changedSinceLastSync)) - cast(*void)(*instance)));
    assert(size_of(type_of(ActionStateFloat.changedSinceLastSync)) == 4, "ActionStateFloat.changedSinceLastSync has unexpected size % instead of 4", size_of(type_of(ActionStateFloat.changedSinceLastSync)));
    assert(((cast(*void)(*instance.lastChangeTime)) - cast(*void)(*instance)) == 24, "ActionStateFloat.lastChangeTime has unexpected offset % instead of 24", ((cast(*void)(*instance.lastChangeTime)) - cast(*void)(*instance)));
    assert(size_of(type_of(ActionStateFloat.lastChangeTime)) == 8, "ActionStateFloat.lastChangeTime has unexpected size % instead of 8", size_of(type_of(ActionStateFloat.lastChangeTime)));
    assert(((cast(*void)(*instance.isActive)) - cast(*void)(*instance)) == 32, "ActionStateFloat.isActive has unexpected offset % instead of 32", ((cast(*void)(*instance.isActive)) - cast(*void)(*instance)));
    assert(size_of(type_of(ActionStateFloat.isActive)) == 4, "ActionStateFloat.isActive has unexpected size % instead of 4", size_of(type_of(ActionStateFloat.isActive)));
    assert(size_of(ActionStateFloat) == 40, "ActionStateFloat has size % instead of 40", size_of(ActionStateFloat));
}

Vector2f :: struct {
    x: float;
    y: float;
}
#run {
    instance: Vector2f;
    assert(((cast(*void)(*instance.x)) - cast(*void)(*instance)) == 0, "Vector2f.x has unexpected offset % instead of 0", ((cast(*void)(*instance.x)) - cast(*void)(*instance)));
    assert(size_of(type_of(Vector2f.x)) == 4, "Vector2f.x has unexpected size % instead of 4", size_of(type_of(Vector2f.x)));
    assert(((cast(*void)(*instance.y)) - cast(*void)(*instance)) == 4, "Vector2f.y has unexpected offset % instead of 4", ((cast(*void)(*instance.y)) - cast(*void)(*instance)));
    assert(size_of(type_of(Vector2f.y)) == 4, "Vector2f.y has unexpected size % instead of 4", size_of(type_of(Vector2f.y)));
    assert(size_of(Vector2f) == 8, "Vector2f has size % instead of 8", size_of(Vector2f));
}

ActionStateVector2f :: struct {
    type:                 StructureType;
    next:                 *void;
    currentState:         Vector2f;
    changedSinceLastSync: Bool32;
    lastChangeTime:       Time;
    isActive:             Bool32;
}
#run {
    instance: ActionStateVector2f;
    assert(((cast(*void)(*instance.type)) - cast(*void)(*instance)) == 0, "ActionStateVector2f.type has unexpected offset % instead of 0", ((cast(*void)(*instance.type)) - cast(*void)(*instance)));
    assert(size_of(type_of(ActionStateVector2f.type)) == 4, "ActionStateVector2f.type has unexpected size % instead of 4", size_of(type_of(ActionStateVector2f.type)));
    assert(((cast(*void)(*instance.next)) - cast(*void)(*instance)) == 8, "ActionStateVector2f.next has unexpected offset % instead of 8", ((cast(*void)(*instance.next)) - cast(*void)(*instance)));
    assert(size_of(type_of(ActionStateVector2f.next)) == 8, "ActionStateVector2f.next has unexpected size % instead of 8", size_of(type_of(ActionStateVector2f.next)));
    assert(((cast(*void)(*instance.currentState)) - cast(*void)(*instance)) == 16, "ActionStateVector2f.currentState has unexpected offset % instead of 16", ((cast(*void)(*instance.currentState)) - cast(*void)(*instance)));
    assert(size_of(type_of(ActionStateVector2f.currentState)) == 8, "ActionStateVector2f.currentState has unexpected size % instead of 8", size_of(type_of(ActionStateVector2f.currentState)));
    assert(((cast(*void)(*instance.changedSinceLastSync)) - cast(*void)(*instance)) == 24, "ActionStateVector2f.changedSinceLastSync has unexpected offset % instead of 24", ((cast(*void)(*instance.changedSinceLastSync)) - cast(*void)(*instance)));
    assert(size_of(type_of(ActionStateVector2f.changedSinceLastSync)) == 4, "ActionStateVector2f.changedSinceLastSync has unexpected size % instead of 4", size_of(type_of(ActionStateVector2f.changedSinceLastSync)));
    assert(((cast(*void)(*instance.lastChangeTime)) - cast(*void)(*instance)) == 32, "ActionStateVector2f.lastChangeTime has unexpected offset % instead of 32", ((cast(*void)(*instance.lastChangeTime)) - cast(*void)(*instance)));
    assert(size_of(type_of(ActionStateVector2f.lastChangeTime)) == 8, "ActionStateVector2f.lastChangeTime has unexpected size % instead of 8", size_of(type_of(ActionStateVector2f.lastChangeTime)));
    assert(((cast(*void)(*instance.isActive)) - cast(*void)(*instance)) == 40, "ActionStateVector2f.isActive has unexpected offset % instead of 40", ((cast(*void)(*instance.isActive)) - cast(*void)(*instance)));
    assert(size_of(type_of(ActionStateVector2f.isActive)) == 4, "ActionStateVector2f.isActive has unexpected size % instead of 4", size_of(type_of(ActionStateVector2f.isActive)));
    assert(size_of(ActionStateVector2f) == 48, "ActionStateVector2f has size % instead of 48", size_of(ActionStateVector2f));
}

ActionStatePose :: struct {
    type:     StructureType;
    next:     *void;
    isActive: Bool32;
}
#run {
    instance: ActionStatePose;
    assert(((cast(*void)(*instance.type)) - cast(*void)(*instance)) == 0, "ActionStatePose.type has unexpected offset % instead of 0", ((cast(*void)(*instance.type)) - cast(*void)(*instance)));
    assert(size_of(type_of(ActionStatePose.type)) == 4, "ActionStatePose.type has unexpected size % instead of 4", size_of(type_of(ActionStatePose.type)));
    assert(((cast(*void)(*instance.next)) - cast(*void)(*instance)) == 8, "ActionStatePose.next has unexpected offset % instead of 8", ((cast(*void)(*instance.next)) - cast(*void)(*instance)));
    assert(size_of(type_of(ActionStatePose.next)) == 8, "ActionStatePose.next has unexpected size % instead of 8", size_of(type_of(ActionStatePose.next)));
    assert(((cast(*void)(*instance.isActive)) - cast(*void)(*instance)) == 16, "ActionStatePose.isActive has unexpected offset % instead of 16", ((cast(*void)(*instance.isActive)) - cast(*void)(*instance)));
    assert(size_of(type_of(ActionStatePose.isActive)) == 4, "ActionStatePose.isActive has unexpected size % instead of 4", size_of(type_of(ActionStatePose.isActive)));
    assert(size_of(ActionStatePose) == 24, "ActionStatePose has size % instead of 24", size_of(ActionStatePose));
}

ActiveActionSet :: struct {
    actionSet:     ActionSet;
    subactionPath: Path;
}
#run {
    instance: ActiveActionSet;
    assert(((cast(*void)(*instance.actionSet)) - cast(*void)(*instance)) == 0, "ActiveActionSet.actionSet has unexpected offset % instead of 0", ((cast(*void)(*instance.actionSet)) - cast(*void)(*instance)));
    assert(size_of(type_of(ActiveActionSet.actionSet)) == 8, "ActiveActionSet.actionSet has unexpected size % instead of 8", size_of(type_of(ActiveActionSet.actionSet)));
    assert(((cast(*void)(*instance.subactionPath)) - cast(*void)(*instance)) == 8, "ActiveActionSet.subactionPath has unexpected offset % instead of 8", ((cast(*void)(*instance.subactionPath)) - cast(*void)(*instance)));
    assert(size_of(type_of(ActiveActionSet.subactionPath)) == 8, "ActiveActionSet.subactionPath has unexpected size % instead of 8", size_of(type_of(ActiveActionSet.subactionPath)));
    assert(size_of(ActiveActionSet) == 16, "ActiveActionSet has size % instead of 16", size_of(ActiveActionSet));
}

ActionsSyncInfo :: struct {
    type:                  StructureType;
    next:                  *void;
    countActiveActionSets: u32;
    activeActionSets:      *ActiveActionSet;
}
#run {
    instance: ActionsSyncInfo;
    assert(((cast(*void)(*instance.type)) - cast(*void)(*instance)) == 0, "ActionsSyncInfo.type has unexpected offset % instead of 0", ((cast(*void)(*instance.type)) - cast(*void)(*instance)));
    assert(size_of(type_of(ActionsSyncInfo.type)) == 4, "ActionsSyncInfo.type has unexpected size % instead of 4", size_of(type_of(ActionsSyncInfo.type)));
    assert(((cast(*void)(*instance.next)) - cast(*void)(*instance)) == 8, "ActionsSyncInfo.next has unexpected offset % instead of 8", ((cast(*void)(*instance.next)) - cast(*void)(*instance)));
    assert(size_of(type_of(ActionsSyncInfo.next)) == 8, "ActionsSyncInfo.next has unexpected size % instead of 8", size_of(type_of(ActionsSyncInfo.next)));
    assert(((cast(*void)(*instance.countActiveActionSets)) - cast(*void)(*instance)) == 16, "ActionsSyncInfo.countActiveActionSets has unexpected offset % instead of 16", ((cast(*void)(*instance.countActiveActionSets)) - cast(*void)(*instance)));
    assert(size_of(type_of(ActionsSyncInfo.countActiveActionSets)) == 4, "ActionsSyncInfo.countActiveActionSets has unexpected size % instead of 4", size_of(type_of(ActionsSyncInfo.countActiveActionSets)));
    assert(((cast(*void)(*instance.activeActionSets)) - cast(*void)(*instance)) == 24, "ActionsSyncInfo.activeActionSets has unexpected offset % instead of 24", ((cast(*void)(*instance.activeActionSets)) - cast(*void)(*instance)));
    assert(size_of(type_of(ActionsSyncInfo.activeActionSets)) == 8, "ActionsSyncInfo.activeActionSets has unexpected size % instead of 8", size_of(type_of(ActionsSyncInfo.activeActionSets)));
    assert(size_of(ActionsSyncInfo) == 32, "ActionsSyncInfo has size % instead of 32", size_of(ActionsSyncInfo));
}

BoundSourcesForActionEnumerateInfo :: struct {
    type:   StructureType;
    next:   *void;
    action: Action;
}
#run {
    instance: BoundSourcesForActionEnumerateInfo;
    assert(((cast(*void)(*instance.type)) - cast(*void)(*instance)) == 0, "BoundSourcesForActionEnumerateInfo.type has unexpected offset % instead of 0", ((cast(*void)(*instance.type)) - cast(*void)(*instance)));
    assert(size_of(type_of(BoundSourcesForActionEnumerateInfo.type)) == 4, "BoundSourcesForActionEnumerateInfo.type has unexpected size % instead of 4", size_of(type_of(BoundSourcesForActionEnumerateInfo.type)));
    assert(((cast(*void)(*instance.next)) - cast(*void)(*instance)) == 8, "BoundSourcesForActionEnumerateInfo.next has unexpected offset % instead of 8", ((cast(*void)(*instance.next)) - cast(*void)(*instance)));
    assert(size_of(type_of(BoundSourcesForActionEnumerateInfo.next)) == 8, "BoundSourcesForActionEnumerateInfo.next has unexpected size % instead of 8", size_of(type_of(BoundSourcesForActionEnumerateInfo.next)));
    assert(((cast(*void)(*instance.action)) - cast(*void)(*instance)) == 16, "BoundSourcesForActionEnumerateInfo.action has unexpected offset % instead of 16", ((cast(*void)(*instance.action)) - cast(*void)(*instance)));
    assert(size_of(type_of(BoundSourcesForActionEnumerateInfo.action)) == 8, "BoundSourcesForActionEnumerateInfo.action has unexpected size % instead of 8", size_of(type_of(BoundSourcesForActionEnumerateInfo.action)));
    assert(size_of(BoundSourcesForActionEnumerateInfo) == 24, "BoundSourcesForActionEnumerateInfo has size % instead of 24", size_of(BoundSourcesForActionEnumerateInfo));
}

InputSourceLocalizedNameGetInfo :: struct {
    type:            StructureType;
    next:            *void;
    sourcePath:      Path;
    whichComponents: InputSourceLocalizedNameFlags;
}
#run {
    instance: InputSourceLocalizedNameGetInfo;
    assert(((cast(*void)(*instance.type)) - cast(*void)(*instance)) == 0, "InputSourceLocalizedNameGetInfo.type has unexpected offset % instead of 0", ((cast(*void)(*instance.type)) - cast(*void)(*instance)));
    assert(size_of(type_of(InputSourceLocalizedNameGetInfo.type)) == 4, "InputSourceLocalizedNameGetInfo.type has unexpected size % instead of 4", size_of(type_of(InputSourceLocalizedNameGetInfo.type)));
    assert(((cast(*void)(*instance.next)) - cast(*void)(*instance)) == 8, "InputSourceLocalizedNameGetInfo.next has unexpected offset % instead of 8", ((cast(*void)(*instance.next)) - cast(*void)(*instance)));
    assert(size_of(type_of(InputSourceLocalizedNameGetInfo.next)) == 8, "InputSourceLocalizedNameGetInfo.next has unexpected size % instead of 8", size_of(type_of(InputSourceLocalizedNameGetInfo.next)));
    assert(((cast(*void)(*instance.sourcePath)) - cast(*void)(*instance)) == 16, "InputSourceLocalizedNameGetInfo.sourcePath has unexpected offset % instead of 16", ((cast(*void)(*instance.sourcePath)) - cast(*void)(*instance)));
    assert(size_of(type_of(InputSourceLocalizedNameGetInfo.sourcePath)) == 8, "InputSourceLocalizedNameGetInfo.sourcePath has unexpected size % instead of 8", size_of(type_of(InputSourceLocalizedNameGetInfo.sourcePath)));
    assert(((cast(*void)(*instance.whichComponents)) - cast(*void)(*instance)) == 24, "InputSourceLocalizedNameGetInfo.whichComponents has unexpected offset % instead of 24", ((cast(*void)(*instance.whichComponents)) - cast(*void)(*instance)));
    assert(size_of(type_of(InputSourceLocalizedNameGetInfo.whichComponents)) == 8, "InputSourceLocalizedNameGetInfo.whichComponents has unexpected size % instead of 8", size_of(type_of(InputSourceLocalizedNameGetInfo.whichComponents)));
    assert(size_of(InputSourceLocalizedNameGetInfo) == 32, "InputSourceLocalizedNameGetInfo has size % instead of 32", size_of(InputSourceLocalizedNameGetInfo));
}

HapticActionInfo :: struct {
    type:          StructureType;
    next:          *void;
    action:        Action;
    subactionPath: Path;
}
#run {
    instance: HapticActionInfo;
    assert(((cast(*void)(*instance.type)) - cast(*void)(*instance)) == 0, "HapticActionInfo.type has unexpected offset % instead of 0", ((cast(*void)(*instance.type)) - cast(*void)(*instance)));
    assert(size_of(type_of(HapticActionInfo.type)) == 4, "HapticActionInfo.type has unexpected size % instead of 4", size_of(type_of(HapticActionInfo.type)));
    assert(((cast(*void)(*instance.next)) - cast(*void)(*instance)) == 8, "HapticActionInfo.next has unexpected offset % instead of 8", ((cast(*void)(*instance.next)) - cast(*void)(*instance)));
    assert(size_of(type_of(HapticActionInfo.next)) == 8, "HapticActionInfo.next has unexpected size % instead of 8", size_of(type_of(HapticActionInfo.next)));
    assert(((cast(*void)(*instance.action)) - cast(*void)(*instance)) == 16, "HapticActionInfo.action has unexpected offset % instead of 16", ((cast(*void)(*instance.action)) - cast(*void)(*instance)));
    assert(size_of(type_of(HapticActionInfo.action)) == 8, "HapticActionInfo.action has unexpected size % instead of 8", size_of(type_of(HapticActionInfo.action)));
    assert(((cast(*void)(*instance.subactionPath)) - cast(*void)(*instance)) == 24, "HapticActionInfo.subactionPath has unexpected offset % instead of 24", ((cast(*void)(*instance.subactionPath)) - cast(*void)(*instance)));
    assert(size_of(type_of(HapticActionInfo.subactionPath)) == 8, "HapticActionInfo.subactionPath has unexpected size % instead of 8", size_of(type_of(HapticActionInfo.subactionPath)));
    assert(size_of(HapticActionInfo) == 32, "HapticActionInfo has size % instead of 32", size_of(HapticActionInfo));
}

HapticBaseHeader :: struct {
    type: StructureType;
    next: *void;
}
#run {
    instance: HapticBaseHeader;
    assert(((cast(*void)(*instance.type)) - cast(*void)(*instance)) == 0, "HapticBaseHeader.type has unexpected offset % instead of 0", ((cast(*void)(*instance.type)) - cast(*void)(*instance)));
    assert(size_of(type_of(HapticBaseHeader.type)) == 4, "HapticBaseHeader.type has unexpected size % instead of 4", size_of(type_of(HapticBaseHeader.type)));
    assert(((cast(*void)(*instance.next)) - cast(*void)(*instance)) == 8, "HapticBaseHeader.next has unexpected offset % instead of 8", ((cast(*void)(*instance.next)) - cast(*void)(*instance)));
    assert(size_of(type_of(HapticBaseHeader.next)) == 8, "HapticBaseHeader.next has unexpected size % instead of 8", size_of(type_of(HapticBaseHeader.next)));
    assert(size_of(HapticBaseHeader) == 16, "HapticBaseHeader has size % instead of 16", size_of(HapticBaseHeader));
}

BaseInStructure :: struct {
    type: StructureType;
    next: *BaseInStructure;
}
#run {
    instance: BaseInStructure;
    assert(((cast(*void)(*instance.type)) - cast(*void)(*instance)) == 0, "BaseInStructure.type has unexpected offset % instead of 0", ((cast(*void)(*instance.type)) - cast(*void)(*instance)));
    assert(size_of(type_of(BaseInStructure.type)) == 4, "BaseInStructure.type has unexpected size % instead of 4", size_of(type_of(BaseInStructure.type)));
    assert(((cast(*void)(*instance.next)) - cast(*void)(*instance)) == 8, "BaseInStructure.next has unexpected offset % instead of 8", ((cast(*void)(*instance.next)) - cast(*void)(*instance)));
    assert(size_of(type_of(BaseInStructure.next)) == 8, "BaseInStructure.next has unexpected size % instead of 8", size_of(type_of(BaseInStructure.next)));
    assert(size_of(BaseInStructure) == 16, "BaseInStructure has size % instead of 16", size_of(BaseInStructure));
}

BaseOutStructure :: struct {
    type: StructureType;
    next: *BaseOutStructure;
}
#run {
    instance: BaseOutStructure;
    assert(((cast(*void)(*instance.type)) - cast(*void)(*instance)) == 0, "BaseOutStructure.type has unexpected offset % instead of 0", ((cast(*void)(*instance.type)) - cast(*void)(*instance)));
    assert(size_of(type_of(BaseOutStructure.type)) == 4, "BaseOutStructure.type has unexpected size % instead of 4", size_of(type_of(BaseOutStructure.type)));
    assert(((cast(*void)(*instance.next)) - cast(*void)(*instance)) == 8, "BaseOutStructure.next has unexpected offset % instead of 8", ((cast(*void)(*instance.next)) - cast(*void)(*instance)));
    assert(size_of(type_of(BaseOutStructure.next)) == 8, "BaseOutStructure.next has unexpected size % instead of 8", size_of(type_of(BaseOutStructure.next)));
    assert(size_of(BaseOutStructure) == 16, "BaseOutStructure has size % instead of 16", size_of(BaseOutStructure));
}

Offset2Di :: struct {
    x: s32;
    y: s32;
}
#run {
    instance: Offset2Di;
    assert(((cast(*void)(*instance.x)) - cast(*void)(*instance)) == 0, "Offset2Di.x has unexpected offset % instead of 0", ((cast(*void)(*instance.x)) - cast(*void)(*instance)));
    assert(size_of(type_of(Offset2Di.x)) == 4, "Offset2Di.x has unexpected size % instead of 4", size_of(type_of(Offset2Di.x)));
    assert(((cast(*void)(*instance.y)) - cast(*void)(*instance)) == 4, "Offset2Di.y has unexpected offset % instead of 4", ((cast(*void)(*instance.y)) - cast(*void)(*instance)));
    assert(size_of(type_of(Offset2Di.y)) == 4, "Offset2Di.y has unexpected size % instead of 4", size_of(type_of(Offset2Di.y)));
    assert(size_of(Offset2Di) == 8, "Offset2Di has size % instead of 8", size_of(Offset2Di));
}

Extent2Di :: struct {
    width:  s32;
    height: s32;
}
#run {
    instance: Extent2Di;
    assert(((cast(*void)(*instance.width)) - cast(*void)(*instance)) == 0, "Extent2Di.width has unexpected offset % instead of 0", ((cast(*void)(*instance.width)) - cast(*void)(*instance)));
    assert(size_of(type_of(Extent2Di.width)) == 4, "Extent2Di.width has unexpected size % instead of 4", size_of(type_of(Extent2Di.width)));
    assert(((cast(*void)(*instance.height)) - cast(*void)(*instance)) == 4, "Extent2Di.height has unexpected offset % instead of 4", ((cast(*void)(*instance.height)) - cast(*void)(*instance)));
    assert(size_of(type_of(Extent2Di.height)) == 4, "Extent2Di.height has unexpected size % instead of 4", size_of(type_of(Extent2Di.height)));
    assert(size_of(Extent2Di) == 8, "Extent2Di has size % instead of 8", size_of(Extent2Di));
}

Rect2Di :: struct {
    offset: Offset2Di;
    extent: Extent2Di;
}
#run {
    instance: Rect2Di;
    assert(((cast(*void)(*instance.offset)) - cast(*void)(*instance)) == 0, "Rect2Di.offset has unexpected offset % instead of 0", ((cast(*void)(*instance.offset)) - cast(*void)(*instance)));
    assert(size_of(type_of(Rect2Di.offset)) == 8, "Rect2Di.offset has unexpected size % instead of 8", size_of(type_of(Rect2Di.offset)));
    assert(((cast(*void)(*instance.extent)) - cast(*void)(*instance)) == 8, "Rect2Di.extent has unexpected offset % instead of 8", ((cast(*void)(*instance.extent)) - cast(*void)(*instance)));
    assert(size_of(type_of(Rect2Di.extent)) == 8, "Rect2Di.extent has unexpected size % instead of 8", size_of(type_of(Rect2Di.extent)));
    assert(size_of(Rect2Di) == 16, "Rect2Di has size % instead of 16", size_of(Rect2Di));
}

SwapchainSubImage :: struct {
    swapchain:       Swapchain;
    imageRect:       Rect2Di;
    imageArrayIndex: u32;
}
#run {
    instance: SwapchainSubImage;
    assert(((cast(*void)(*instance.swapchain)) - cast(*void)(*instance)) == 0, "SwapchainSubImage.swapchain has unexpected offset % instead of 0", ((cast(*void)(*instance.swapchain)) - cast(*void)(*instance)));
    assert(size_of(type_of(SwapchainSubImage.swapchain)) == 8, "SwapchainSubImage.swapchain has unexpected size % instead of 8", size_of(type_of(SwapchainSubImage.swapchain)));
    assert(((cast(*void)(*instance.imageRect)) - cast(*void)(*instance)) == 8, "SwapchainSubImage.imageRect has unexpected offset % instead of 8", ((cast(*void)(*instance.imageRect)) - cast(*void)(*instance)));
    assert(size_of(type_of(SwapchainSubImage.imageRect)) == 16, "SwapchainSubImage.imageRect has unexpected size % instead of 16", size_of(type_of(SwapchainSubImage.imageRect)));
    assert(((cast(*void)(*instance.imageArrayIndex)) - cast(*void)(*instance)) == 24, "SwapchainSubImage.imageArrayIndex has unexpected offset % instead of 24", ((cast(*void)(*instance.imageArrayIndex)) - cast(*void)(*instance)));
    assert(size_of(type_of(SwapchainSubImage.imageArrayIndex)) == 4, "SwapchainSubImage.imageArrayIndex has unexpected size % instead of 4", size_of(type_of(SwapchainSubImage.imageArrayIndex)));
    assert(size_of(SwapchainSubImage) == 32, "SwapchainSubImage has size % instead of 32", size_of(SwapchainSubImage));
}

CompositionLayerProjectionView :: struct {
    type:     StructureType;
    next:     *void;
    pose:     Posef;
    fov:      Fovf;
    subImage: SwapchainSubImage;
}
#run {
    instance: CompositionLayerProjectionView;
    assert(((cast(*void)(*instance.type)) - cast(*void)(*instance)) == 0, "CompositionLayerProjectionView.type has unexpected offset % instead of 0", ((cast(*void)(*instance.type)) - cast(*void)(*instance)));
    assert(size_of(type_of(CompositionLayerProjectionView.type)) == 4, "CompositionLayerProjectionView.type has unexpected size % instead of 4", size_of(type_of(CompositionLayerProjectionView.type)));
    assert(((cast(*void)(*instance.next)) - cast(*void)(*instance)) == 8, "CompositionLayerProjectionView.next has unexpected offset % instead of 8", ((cast(*void)(*instance.next)) - cast(*void)(*instance)));
    assert(size_of(type_of(CompositionLayerProjectionView.next)) == 8, "CompositionLayerProjectionView.next has unexpected size % instead of 8", size_of(type_of(CompositionLayerProjectionView.next)));
    assert(((cast(*void)(*instance.pose)) - cast(*void)(*instance)) == 16, "CompositionLayerProjectionView.pose has unexpected offset % instead of 16", ((cast(*void)(*instance.pose)) - cast(*void)(*instance)));
    assert(size_of(type_of(CompositionLayerProjectionView.pose)) == 28, "CompositionLayerProjectionView.pose has unexpected size % instead of 28", size_of(type_of(CompositionLayerProjectionView.pose)));
    assert(((cast(*void)(*instance.fov)) - cast(*void)(*instance)) == 44, "CompositionLayerProjectionView.fov has unexpected offset % instead of 44", ((cast(*void)(*instance.fov)) - cast(*void)(*instance)));
    assert(size_of(type_of(CompositionLayerProjectionView.fov)) == 16, "CompositionLayerProjectionView.fov has unexpected size % instead of 16", size_of(type_of(CompositionLayerProjectionView.fov)));
    assert(((cast(*void)(*instance.subImage)) - cast(*void)(*instance)) == 64, "CompositionLayerProjectionView.subImage has unexpected offset % instead of 64", ((cast(*void)(*instance.subImage)) - cast(*void)(*instance)));
    assert(size_of(type_of(CompositionLayerProjectionView.subImage)) == 32, "CompositionLayerProjectionView.subImage has unexpected size % instead of 32", size_of(type_of(CompositionLayerProjectionView.subImage)));
    assert(size_of(CompositionLayerProjectionView) == 96, "CompositionLayerProjectionView has size % instead of 96", size_of(CompositionLayerProjectionView));
}

CompositionLayerProjection :: struct {
    type:       StructureType;
    next:       *void;
    layerFlags: CompositionLayerFlags;
    space:      Space;
    viewCount:  u32;
    views:      *CompositionLayerProjectionView;
}
#run {
    instance: CompositionLayerProjection;
    assert(((cast(*void)(*instance.type)) - cast(*void)(*instance)) == 0, "CompositionLayerProjection.type has unexpected offset % instead of 0", ((cast(*void)(*instance.type)) - cast(*void)(*instance)));
    assert(size_of(type_of(CompositionLayerProjection.type)) == 4, "CompositionLayerProjection.type has unexpected size % instead of 4", size_of(type_of(CompositionLayerProjection.type)));
    assert(((cast(*void)(*instance.next)) - cast(*void)(*instance)) == 8, "CompositionLayerProjection.next has unexpected offset % instead of 8", ((cast(*void)(*instance.next)) - cast(*void)(*instance)));
    assert(size_of(type_of(CompositionLayerProjection.next)) == 8, "CompositionLayerProjection.next has unexpected size % instead of 8", size_of(type_of(CompositionLayerProjection.next)));
    assert(((cast(*void)(*instance.layerFlags)) - cast(*void)(*instance)) == 16, "CompositionLayerProjection.layerFlags has unexpected offset % instead of 16", ((cast(*void)(*instance.layerFlags)) - cast(*void)(*instance)));
    assert(size_of(type_of(CompositionLayerProjection.layerFlags)) == 8, "CompositionLayerProjection.layerFlags has unexpected size % instead of 8", size_of(type_of(CompositionLayerProjection.layerFlags)));
    assert(((cast(*void)(*instance.space)) - cast(*void)(*instance)) == 24, "CompositionLayerProjection.space has unexpected offset % instead of 24", ((cast(*void)(*instance.space)) - cast(*void)(*instance)));
    assert(size_of(type_of(CompositionLayerProjection.space)) == 8, "CompositionLayerProjection.space has unexpected size % instead of 8", size_of(type_of(CompositionLayerProjection.space)));
    assert(((cast(*void)(*instance.viewCount)) - cast(*void)(*instance)) == 32, "CompositionLayerProjection.viewCount has unexpected offset % instead of 32", ((cast(*void)(*instance.viewCount)) - cast(*void)(*instance)));
    assert(size_of(type_of(CompositionLayerProjection.viewCount)) == 4, "CompositionLayerProjection.viewCount has unexpected size % instead of 4", size_of(type_of(CompositionLayerProjection.viewCount)));
    assert(((cast(*void)(*instance.views)) - cast(*void)(*instance)) == 40, "CompositionLayerProjection.views has unexpected offset % instead of 40", ((cast(*void)(*instance.views)) - cast(*void)(*instance)));
    assert(size_of(type_of(CompositionLayerProjection.views)) == 8, "CompositionLayerProjection.views has unexpected size % instead of 8", size_of(type_of(CompositionLayerProjection.views)));
    assert(size_of(CompositionLayerProjection) == 48, "CompositionLayerProjection has size % instead of 48", size_of(CompositionLayerProjection));
}

CompositionLayerQuad :: struct {
    type:          StructureType;
    next:          *void;
    layerFlags:    CompositionLayerFlags;
    space:         Space;
    eyeVisibility: EyeVisibility;
    subImage:      SwapchainSubImage;
    pose:          Posef;
    size:          Extent2Df;
}
#run {
    instance: CompositionLayerQuad;
    assert(((cast(*void)(*instance.type)) - cast(*void)(*instance)) == 0, "CompositionLayerQuad.type has unexpected offset % instead of 0", ((cast(*void)(*instance.type)) - cast(*void)(*instance)));
    assert(size_of(type_of(CompositionLayerQuad.type)) == 4, "CompositionLayerQuad.type has unexpected size % instead of 4", size_of(type_of(CompositionLayerQuad.type)));
    assert(((cast(*void)(*instance.next)) - cast(*void)(*instance)) == 8, "CompositionLayerQuad.next has unexpected offset % instead of 8", ((cast(*void)(*instance.next)) - cast(*void)(*instance)));
    assert(size_of(type_of(CompositionLayerQuad.next)) == 8, "CompositionLayerQuad.next has unexpected size % instead of 8", size_of(type_of(CompositionLayerQuad.next)));
    assert(((cast(*void)(*instance.layerFlags)) - cast(*void)(*instance)) == 16, "CompositionLayerQuad.layerFlags has unexpected offset % instead of 16", ((cast(*void)(*instance.layerFlags)) - cast(*void)(*instance)));
    assert(size_of(type_of(CompositionLayerQuad.layerFlags)) == 8, "CompositionLayerQuad.layerFlags has unexpected size % instead of 8", size_of(type_of(CompositionLayerQuad.layerFlags)));
    assert(((cast(*void)(*instance.space)) - cast(*void)(*instance)) == 24, "CompositionLayerQuad.space has unexpected offset % instead of 24", ((cast(*void)(*instance.space)) - cast(*void)(*instance)));
    assert(size_of(type_of(CompositionLayerQuad.space)) == 8, "CompositionLayerQuad.space has unexpected size % instead of 8", size_of(type_of(CompositionLayerQuad.space)));
    assert(((cast(*void)(*instance.eyeVisibility)) - cast(*void)(*instance)) == 32, "CompositionLayerQuad.eyeVisibility has unexpected offset % instead of 32", ((cast(*void)(*instance.eyeVisibility)) - cast(*void)(*instance)));
    assert(size_of(type_of(CompositionLayerQuad.eyeVisibility)) == 4, "CompositionLayerQuad.eyeVisibility has unexpected size % instead of 4", size_of(type_of(CompositionLayerQuad.eyeVisibility)));
    assert(((cast(*void)(*instance.subImage)) - cast(*void)(*instance)) == 40, "CompositionLayerQuad.subImage has unexpected offset % instead of 40", ((cast(*void)(*instance.subImage)) - cast(*void)(*instance)));
    assert(size_of(type_of(CompositionLayerQuad.subImage)) == 32, "CompositionLayerQuad.subImage has unexpected size % instead of 32", size_of(type_of(CompositionLayerQuad.subImage)));
    assert(((cast(*void)(*instance.pose)) - cast(*void)(*instance)) == 72, "CompositionLayerQuad.pose has unexpected offset % instead of 72", ((cast(*void)(*instance.pose)) - cast(*void)(*instance)));
    assert(size_of(type_of(CompositionLayerQuad.pose)) == 28, "CompositionLayerQuad.pose has unexpected size % instead of 28", size_of(type_of(CompositionLayerQuad.pose)));
    assert(((cast(*void)(*instance.size)) - cast(*void)(*instance)) == 100, "CompositionLayerQuad.size has unexpected offset % instead of 100", ((cast(*void)(*instance.size)) - cast(*void)(*instance)));
    assert(size_of(type_of(CompositionLayerQuad.size)) == 8, "CompositionLayerQuad.size has unexpected size % instead of 8", size_of(type_of(CompositionLayerQuad.size)));
    assert(size_of(CompositionLayerQuad) == 112, "CompositionLayerQuad has size % instead of 112", size_of(CompositionLayerQuad));
}

EventDataBaseHeader :: struct {
    type: StructureType;
    next: *void;
}
#run {
    instance: EventDataBaseHeader;
    assert(((cast(*void)(*instance.type)) - cast(*void)(*instance)) == 0, "EventDataBaseHeader.type has unexpected offset % instead of 0", ((cast(*void)(*instance.type)) - cast(*void)(*instance)));
    assert(size_of(type_of(EventDataBaseHeader.type)) == 4, "EventDataBaseHeader.type has unexpected size % instead of 4", size_of(type_of(EventDataBaseHeader.type)));
    assert(((cast(*void)(*instance.next)) - cast(*void)(*instance)) == 8, "EventDataBaseHeader.next has unexpected offset % instead of 8", ((cast(*void)(*instance.next)) - cast(*void)(*instance)));
    assert(size_of(type_of(EventDataBaseHeader.next)) == 8, "EventDataBaseHeader.next has unexpected size % instead of 8", size_of(type_of(EventDataBaseHeader.next)));
    assert(size_of(EventDataBaseHeader) == 16, "EventDataBaseHeader has size % instead of 16", size_of(EventDataBaseHeader));
}

EventDataEventsLost :: struct {
    type:           StructureType;
    next:           *void;
    lostEventCount: u32;
}
#run {
    instance: EventDataEventsLost;
    assert(((cast(*void)(*instance.type)) - cast(*void)(*instance)) == 0, "EventDataEventsLost.type has unexpected offset % instead of 0", ((cast(*void)(*instance.type)) - cast(*void)(*instance)));
    assert(size_of(type_of(EventDataEventsLost.type)) == 4, "EventDataEventsLost.type has unexpected size % instead of 4", size_of(type_of(EventDataEventsLost.type)));
    assert(((cast(*void)(*instance.next)) - cast(*void)(*instance)) == 8, "EventDataEventsLost.next has unexpected offset % instead of 8", ((cast(*void)(*instance.next)) - cast(*void)(*instance)));
    assert(size_of(type_of(EventDataEventsLost.next)) == 8, "EventDataEventsLost.next has unexpected size % instead of 8", size_of(type_of(EventDataEventsLost.next)));
    assert(((cast(*void)(*instance.lostEventCount)) - cast(*void)(*instance)) == 16, "EventDataEventsLost.lostEventCount has unexpected offset % instead of 16", ((cast(*void)(*instance.lostEventCount)) - cast(*void)(*instance)));
    assert(size_of(type_of(EventDataEventsLost.lostEventCount)) == 4, "EventDataEventsLost.lostEventCount has unexpected size % instead of 4", size_of(type_of(EventDataEventsLost.lostEventCount)));
    assert(size_of(EventDataEventsLost) == 24, "EventDataEventsLost has size % instead of 24", size_of(EventDataEventsLost));
}

EventDataInstanceLossPending :: struct {
    type:     StructureType;
    next:     *void;
    lossTime: Time;
}
#run {
    instance: EventDataInstanceLossPending;
    assert(((cast(*void)(*instance.type)) - cast(*void)(*instance)) == 0, "EventDataInstanceLossPending.type has unexpected offset % instead of 0", ((cast(*void)(*instance.type)) - cast(*void)(*instance)));
    assert(size_of(type_of(EventDataInstanceLossPending.type)) == 4, "EventDataInstanceLossPending.type has unexpected size % instead of 4", size_of(type_of(EventDataInstanceLossPending.type)));
    assert(((cast(*void)(*instance.next)) - cast(*void)(*instance)) == 8, "EventDataInstanceLossPending.next has unexpected offset % instead of 8", ((cast(*void)(*instance.next)) - cast(*void)(*instance)));
    assert(size_of(type_of(EventDataInstanceLossPending.next)) == 8, "EventDataInstanceLossPending.next has unexpected size % instead of 8", size_of(type_of(EventDataInstanceLossPending.next)));
    assert(((cast(*void)(*instance.lossTime)) - cast(*void)(*instance)) == 16, "EventDataInstanceLossPending.lossTime has unexpected offset % instead of 16", ((cast(*void)(*instance.lossTime)) - cast(*void)(*instance)));
    assert(size_of(type_of(EventDataInstanceLossPending.lossTime)) == 8, "EventDataInstanceLossPending.lossTime has unexpected size % instead of 8", size_of(type_of(EventDataInstanceLossPending.lossTime)));
    assert(size_of(EventDataInstanceLossPending) == 24, "EventDataInstanceLossPending has size % instead of 24", size_of(EventDataInstanceLossPending));
}

EventDataSessionStateChanged :: struct {
    type:    StructureType;
    next:    *void;
    session: Session;
    state:   SessionState;
    time:    Time;
}
#run {
    instance: EventDataSessionStateChanged;
    assert(((cast(*void)(*instance.type)) - cast(*void)(*instance)) == 0, "EventDataSessionStateChanged.type has unexpected offset % instead of 0", ((cast(*void)(*instance.type)) - cast(*void)(*instance)));
    assert(size_of(type_of(EventDataSessionStateChanged.type)) == 4, "EventDataSessionStateChanged.type has unexpected size % instead of 4", size_of(type_of(EventDataSessionStateChanged.type)));
    assert(((cast(*void)(*instance.next)) - cast(*void)(*instance)) == 8, "EventDataSessionStateChanged.next has unexpected offset % instead of 8", ((cast(*void)(*instance.next)) - cast(*void)(*instance)));
    assert(size_of(type_of(EventDataSessionStateChanged.next)) == 8, "EventDataSessionStateChanged.next has unexpected size % instead of 8", size_of(type_of(EventDataSessionStateChanged.next)));
    assert(((cast(*void)(*instance.session)) - cast(*void)(*instance)) == 16, "EventDataSessionStateChanged.session has unexpected offset % instead of 16", ((cast(*void)(*instance.session)) - cast(*void)(*instance)));
    assert(size_of(type_of(EventDataSessionStateChanged.session)) == 8, "EventDataSessionStateChanged.session has unexpected size % instead of 8", size_of(type_of(EventDataSessionStateChanged.session)));
    assert(((cast(*void)(*instance.state)) - cast(*void)(*instance)) == 24, "EventDataSessionStateChanged.state has unexpected offset % instead of 24", ((cast(*void)(*instance.state)) - cast(*void)(*instance)));
    assert(size_of(type_of(EventDataSessionStateChanged.state)) == 4, "EventDataSessionStateChanged.state has unexpected size % instead of 4", size_of(type_of(EventDataSessionStateChanged.state)));
    assert(((cast(*void)(*instance.time)) - cast(*void)(*instance)) == 32, "EventDataSessionStateChanged.time has unexpected offset % instead of 32", ((cast(*void)(*instance.time)) - cast(*void)(*instance)));
    assert(size_of(type_of(EventDataSessionStateChanged.time)) == 8, "EventDataSessionStateChanged.time has unexpected size % instead of 8", size_of(type_of(EventDataSessionStateChanged.time)));
    assert(size_of(EventDataSessionStateChanged) == 40, "EventDataSessionStateChanged has size % instead of 40", size_of(EventDataSessionStateChanged));
}

EventDataReferenceSpaceChangePending :: struct {
    type:                StructureType;
    next:                *void;
    session:             Session;
    referenceSpaceType:  ReferenceSpaceType;
    changeTime:          Time;
    poseValid:           Bool32;
    poseInPreviousSpace: Posef;
}
#run {
    instance: EventDataReferenceSpaceChangePending;
    assert(((cast(*void)(*instance.type)) - cast(*void)(*instance)) == 0, "EventDataReferenceSpaceChangePending.type has unexpected offset % instead of 0", ((cast(*void)(*instance.type)) - cast(*void)(*instance)));
    assert(size_of(type_of(EventDataReferenceSpaceChangePending.type)) == 4, "EventDataReferenceSpaceChangePending.type has unexpected size % instead of 4", size_of(type_of(EventDataReferenceSpaceChangePending.type)));
    assert(((cast(*void)(*instance.next)) - cast(*void)(*instance)) == 8, "EventDataReferenceSpaceChangePending.next has unexpected offset % instead of 8", ((cast(*void)(*instance.next)) - cast(*void)(*instance)));
    assert(size_of(type_of(EventDataReferenceSpaceChangePending.next)) == 8, "EventDataReferenceSpaceChangePending.next has unexpected size % instead of 8", size_of(type_of(EventDataReferenceSpaceChangePending.next)));
    assert(((cast(*void)(*instance.session)) - cast(*void)(*instance)) == 16, "EventDataReferenceSpaceChangePending.session has unexpected offset % instead of 16", ((cast(*void)(*instance.session)) - cast(*void)(*instance)));
    assert(size_of(type_of(EventDataReferenceSpaceChangePending.session)) == 8, "EventDataReferenceSpaceChangePending.session has unexpected size % instead of 8", size_of(type_of(EventDataReferenceSpaceChangePending.session)));
    assert(((cast(*void)(*instance.referenceSpaceType)) - cast(*void)(*instance)) == 24, "EventDataReferenceSpaceChangePending.referenceSpaceType has unexpected offset % instead of 24", ((cast(*void)(*instance.referenceSpaceType)) - cast(*void)(*instance)));
    assert(size_of(type_of(EventDataReferenceSpaceChangePending.referenceSpaceType)) == 4, "EventDataReferenceSpaceChangePending.referenceSpaceType has unexpected size % instead of 4", size_of(type_of(EventDataReferenceSpaceChangePending.referenceSpaceType)));
    assert(((cast(*void)(*instance.changeTime)) - cast(*void)(*instance)) == 32, "EventDataReferenceSpaceChangePending.changeTime has unexpected offset % instead of 32", ((cast(*void)(*instance.changeTime)) - cast(*void)(*instance)));
    assert(size_of(type_of(EventDataReferenceSpaceChangePending.changeTime)) == 8, "EventDataReferenceSpaceChangePending.changeTime has unexpected size % instead of 8", size_of(type_of(EventDataReferenceSpaceChangePending.changeTime)));
    assert(((cast(*void)(*instance.poseValid)) - cast(*void)(*instance)) == 40, "EventDataReferenceSpaceChangePending.poseValid has unexpected offset % instead of 40", ((cast(*void)(*instance.poseValid)) - cast(*void)(*instance)));
    assert(size_of(type_of(EventDataReferenceSpaceChangePending.poseValid)) == 4, "EventDataReferenceSpaceChangePending.poseValid has unexpected size % instead of 4", size_of(type_of(EventDataReferenceSpaceChangePending.poseValid)));
    assert(((cast(*void)(*instance.poseInPreviousSpace)) - cast(*void)(*instance)) == 44, "EventDataReferenceSpaceChangePending.poseInPreviousSpace has unexpected offset % instead of 44", ((cast(*void)(*instance.poseInPreviousSpace)) - cast(*void)(*instance)));
    assert(size_of(type_of(EventDataReferenceSpaceChangePending.poseInPreviousSpace)) == 28, "EventDataReferenceSpaceChangePending.poseInPreviousSpace has unexpected size % instead of 28", size_of(type_of(EventDataReferenceSpaceChangePending.poseInPreviousSpace)));
    assert(size_of(EventDataReferenceSpaceChangePending) == 72, "EventDataReferenceSpaceChangePending has size % instead of 72", size_of(EventDataReferenceSpaceChangePending));
}

EventDataInteractionProfileChanged :: struct {
    type:    StructureType;
    next:    *void;
    session: Session;
}
#run {
    instance: EventDataInteractionProfileChanged;
    assert(((cast(*void)(*instance.type)) - cast(*void)(*instance)) == 0, "EventDataInteractionProfileChanged.type has unexpected offset % instead of 0", ((cast(*void)(*instance.type)) - cast(*void)(*instance)));
    assert(size_of(type_of(EventDataInteractionProfileChanged.type)) == 4, "EventDataInteractionProfileChanged.type has unexpected size % instead of 4", size_of(type_of(EventDataInteractionProfileChanged.type)));
    assert(((cast(*void)(*instance.next)) - cast(*void)(*instance)) == 8, "EventDataInteractionProfileChanged.next has unexpected offset % instead of 8", ((cast(*void)(*instance.next)) - cast(*void)(*instance)));
    assert(size_of(type_of(EventDataInteractionProfileChanged.next)) == 8, "EventDataInteractionProfileChanged.next has unexpected size % instead of 8", size_of(type_of(EventDataInteractionProfileChanged.next)));
    assert(((cast(*void)(*instance.session)) - cast(*void)(*instance)) == 16, "EventDataInteractionProfileChanged.session has unexpected offset % instead of 16", ((cast(*void)(*instance.session)) - cast(*void)(*instance)));
    assert(size_of(type_of(EventDataInteractionProfileChanged.session)) == 8, "EventDataInteractionProfileChanged.session has unexpected size % instead of 8", size_of(type_of(EventDataInteractionProfileChanged.session)));
    assert(size_of(EventDataInteractionProfileChanged) == 24, "EventDataInteractionProfileChanged has size % instead of 24", size_of(EventDataInteractionProfileChanged));
}

HapticVibration :: struct {
    type:      StructureType;
    next:      *void;
    duration:  Duration;
    frequency: float;
    amplitude: float;
}
#run {
    instance: HapticVibration;
    assert(((cast(*void)(*instance.type)) - cast(*void)(*instance)) == 0, "HapticVibration.type has unexpected offset % instead of 0", ((cast(*void)(*instance.type)) - cast(*void)(*instance)));
    assert(size_of(type_of(HapticVibration.type)) == 4, "HapticVibration.type has unexpected size % instead of 4", size_of(type_of(HapticVibration.type)));
    assert(((cast(*void)(*instance.next)) - cast(*void)(*instance)) == 8, "HapticVibration.next has unexpected offset % instead of 8", ((cast(*void)(*instance.next)) - cast(*void)(*instance)));
    assert(size_of(type_of(HapticVibration.next)) == 8, "HapticVibration.next has unexpected size % instead of 8", size_of(type_of(HapticVibration.next)));
    assert(((cast(*void)(*instance.duration)) - cast(*void)(*instance)) == 16, "HapticVibration.duration has unexpected offset % instead of 16", ((cast(*void)(*instance.duration)) - cast(*void)(*instance)));
    assert(size_of(type_of(HapticVibration.duration)) == 8, "HapticVibration.duration has unexpected size % instead of 8", size_of(type_of(HapticVibration.duration)));
    assert(((cast(*void)(*instance.frequency)) - cast(*void)(*instance)) == 24, "HapticVibration.frequency has unexpected offset % instead of 24", ((cast(*void)(*instance.frequency)) - cast(*void)(*instance)));
    assert(size_of(type_of(HapticVibration.frequency)) == 4, "HapticVibration.frequency has unexpected size % instead of 4", size_of(type_of(HapticVibration.frequency)));
    assert(((cast(*void)(*instance.amplitude)) - cast(*void)(*instance)) == 28, "HapticVibration.amplitude has unexpected offset % instead of 28", ((cast(*void)(*instance.amplitude)) - cast(*void)(*instance)));
    assert(size_of(type_of(HapticVibration.amplitude)) == 4, "HapticVibration.amplitude has unexpected size % instead of 4", size_of(type_of(HapticVibration.amplitude)));
    assert(size_of(HapticVibration) == 32, "HapticVibration has size % instead of 32", size_of(HapticVibration));
}

Offset2Df :: struct {
    x: float;
    y: float;
}
#run {
    instance: Offset2Df;
    assert(((cast(*void)(*instance.x)) - cast(*void)(*instance)) == 0, "Offset2Df.x has unexpected offset % instead of 0", ((cast(*void)(*instance.x)) - cast(*void)(*instance)));
    assert(size_of(type_of(Offset2Df.x)) == 4, "Offset2Df.x has unexpected size % instead of 4", size_of(type_of(Offset2Df.x)));
    assert(((cast(*void)(*instance.y)) - cast(*void)(*instance)) == 4, "Offset2Df.y has unexpected offset % instead of 4", ((cast(*void)(*instance.y)) - cast(*void)(*instance)));
    assert(size_of(type_of(Offset2Df.y)) == 4, "Offset2Df.y has unexpected size % instead of 4", size_of(type_of(Offset2Df.y)));
    assert(size_of(Offset2Df) == 8, "Offset2Df has size % instead of 8", size_of(Offset2Df));
}

Rect2Df :: struct {
    offset: Offset2Df;
    extent: Extent2Df;
}
#run {
    instance: Rect2Df;
    assert(((cast(*void)(*instance.offset)) - cast(*void)(*instance)) == 0, "Rect2Df.offset has unexpected offset % instead of 0", ((cast(*void)(*instance.offset)) - cast(*void)(*instance)));
    assert(size_of(type_of(Rect2Df.offset)) == 8, "Rect2Df.offset has unexpected size % instead of 8", size_of(type_of(Rect2Df.offset)));
    assert(((cast(*void)(*instance.extent)) - cast(*void)(*instance)) == 8, "Rect2Df.extent has unexpected offset % instead of 8", ((cast(*void)(*instance.extent)) - cast(*void)(*instance)));
    assert(size_of(type_of(Rect2Df.extent)) == 8, "Rect2Df.extent has unexpected size % instead of 8", size_of(type_of(Rect2Df.extent)));
    assert(size_of(Rect2Df) == 16, "Rect2Df has size % instead of 16", size_of(Rect2Df));
}

Vector4f :: struct {
    x: float;
    y: float;
    z: float;
    w: float;
}
#run {
    instance: Vector4f;
    assert(((cast(*void)(*instance.x)) - cast(*void)(*instance)) == 0, "Vector4f.x has unexpected offset % instead of 0", ((cast(*void)(*instance.x)) - cast(*void)(*instance)));
    assert(size_of(type_of(Vector4f.x)) == 4, "Vector4f.x has unexpected size % instead of 4", size_of(type_of(Vector4f.x)));
    assert(((cast(*void)(*instance.y)) - cast(*void)(*instance)) == 4, "Vector4f.y has unexpected offset % instead of 4", ((cast(*void)(*instance.y)) - cast(*void)(*instance)));
    assert(size_of(type_of(Vector4f.y)) == 4, "Vector4f.y has unexpected size % instead of 4", size_of(type_of(Vector4f.y)));
    assert(((cast(*void)(*instance.z)) - cast(*void)(*instance)) == 8, "Vector4f.z has unexpected offset % instead of 8", ((cast(*void)(*instance.z)) - cast(*void)(*instance)));
    assert(size_of(type_of(Vector4f.z)) == 4, "Vector4f.z has unexpected size % instead of 4", size_of(type_of(Vector4f.z)));
    assert(((cast(*void)(*instance.w)) - cast(*void)(*instance)) == 12, "Vector4f.w has unexpected offset % instead of 12", ((cast(*void)(*instance.w)) - cast(*void)(*instance)));
    assert(size_of(type_of(Vector4f.w)) == 4, "Vector4f.w has unexpected size % instead of 4", size_of(type_of(Vector4f.w)));
    assert(size_of(Vector4f) == 16, "Vector4f has size % instead of 16", size_of(Vector4f));
}

Color4f :: struct {
    r: float;
    g: float;
    b: float;
    a: float;
}
#run {
    instance: Color4f;
    assert(((cast(*void)(*instance.r)) - cast(*void)(*instance)) == 0, "Color4f.r has unexpected offset % instead of 0", ((cast(*void)(*instance.r)) - cast(*void)(*instance)));
    assert(size_of(type_of(Color4f.r)) == 4, "Color4f.r has unexpected size % instead of 4", size_of(type_of(Color4f.r)));
    assert(((cast(*void)(*instance.g)) - cast(*void)(*instance)) == 4, "Color4f.g has unexpected offset % instead of 4", ((cast(*void)(*instance.g)) - cast(*void)(*instance)));
    assert(size_of(type_of(Color4f.g)) == 4, "Color4f.g has unexpected size % instead of 4", size_of(type_of(Color4f.g)));
    assert(((cast(*void)(*instance.b)) - cast(*void)(*instance)) == 8, "Color4f.b has unexpected offset % instead of 8", ((cast(*void)(*instance.b)) - cast(*void)(*instance)));
    assert(size_of(type_of(Color4f.b)) == 4, "Color4f.b has unexpected size % instead of 4", size_of(type_of(Color4f.b)));
    assert(((cast(*void)(*instance.a)) - cast(*void)(*instance)) == 12, "Color4f.a has unexpected offset % instead of 12", ((cast(*void)(*instance.a)) - cast(*void)(*instance)));
    assert(size_of(type_of(Color4f.a)) == 4, "Color4f.a has unexpected size % instead of 4", size_of(type_of(Color4f.a)));
    assert(size_of(Color4f) == 16, "Color4f has size % instead of 16", size_of(Color4f));
}

PFN_xrGetInstanceProcAddr :: #type (a0: Instance, a1: *u8, a2: *PFN_xrVoidFunction) -> Result #c_call;
PFN_xrEnumerateApiLayerProperties :: #type (a0: u32, a1: *u32, a2: *ApiLayerProperties) -> Result #c_call;
PFN_xrEnumerateInstanceExtensionProperties :: #type (a0: *u8, a1: u32, a2: *u32, a3: *ExtensionProperties) -> Result #c_call;
PFN_xrCreateInstance :: #type (a0: *InstanceCreateInfo, a1: *Instance) -> Result #c_call;
PFN_xrDestroyInstance :: #type (a0: Instance) -> Result #c_call;
PFN_xrGetInstanceProperties :: #type (a0: Instance, a1: *InstanceProperties) -> Result #c_call;
PFN_xrPollEvent :: #type (a0: Instance, a1: *EventDataBuffer) -> Result #c_call;
PFN_xrResultToString :: #type (a0: Instance, a1: Result, a2: *[64] u8) -> Result #c_call;
PFN_xrStructureTypeToString :: #type (a0: Instance, a1: StructureType, a2: *[64] u8) -> Result #c_call;
PFN_xrGetSystem :: #type (a0: Instance, a1: *SystemGetInfo, a2: *SystemId) -> Result #c_call;
PFN_xrGetSystemProperties :: #type (a0: Instance, a1: SystemId, a2: *SystemProperties) -> Result #c_call;
PFN_xrEnumerateEnvironmentBlendModes :: #type (a0: Instance, a1: SystemId, a2: ViewConfigurationType, a3: u32, a4: *u32, a5: *EnvironmentBlendMode) -> Result #c_call;
PFN_xrCreateSession :: #type (a0: Instance, a1: *SessionCreateInfo, a2: *Session) -> Result #c_call;
PFN_xrDestroySession :: #type (a0: Session) -> Result #c_call;
PFN_xrEnumerateReferenceSpaces :: #type (a0: Session, a1: u32, a2: *u32, a3: *ReferenceSpaceType) -> Result #c_call;
PFN_xrCreateReferenceSpace :: #type (a0: Session, a1: *ReferenceSpaceCreateInfo, a2: *Space) -> Result #c_call;
PFN_xrGetReferenceSpaceBoundsRect :: #type (a0: Session, a1: ReferenceSpaceType, a2: *Extent2Df) -> Result #c_call;
PFN_xrCreateActionSpace :: #type (a0: Session, a1: *ActionSpaceCreateInfo, a2: *Space) -> Result #c_call;
PFN_xrLocateSpace :: #type (a0: Space, a1: Space, a2: Time, a3: *SpaceLocation) -> Result #c_call;
PFN_xrDestroySpace :: #type (a0: Space) -> Result #c_call;
PFN_xrEnumerateViewConfigurations :: #type (a0: Instance, a1: SystemId, a2: u32, a3: *u32, a4: *ViewConfigurationType) -> Result #c_call;
PFN_xrGetViewConfigurationProperties :: #type (a0: Instance, a1: SystemId, a2: ViewConfigurationType, a3: *ViewConfigurationProperties) -> Result #c_call;
PFN_xrEnumerateViewConfigurationViews :: #type (a0: Instance, a1: SystemId, a2: ViewConfigurationType, a3: u32, a4: *u32, a5: *ViewConfigurationView) -> Result #c_call;
PFN_xrEnumerateSwapchainFormats :: #type (a0: Session, a1: u32, a2: *u32, a3: *s64) -> Result #c_call;
PFN_xrCreateSwapchain :: #type (a0: Session, a1: *SwapchainCreateInfo, a2: *Swapchain) -> Result #c_call;
PFN_xrDestroySwapchain :: #type (a0: Swapchain) -> Result #c_call;
PFN_xrEnumerateSwapchainImages :: #type (a0: Swapchain, a1: u32, a2: *u32, a3: *SwapchainImageBaseHeader) -> Result #c_call;
PFN_xrAcquireSwapchainImage :: #type (a0: Swapchain, a1: *SwapchainImageAcquireInfo, a2: *u32) -> Result #c_call;
PFN_xrWaitSwapchainImage :: #type (a0: Swapchain, a1: *SwapchainImageWaitInfo) -> Result #c_call;
PFN_xrReleaseSwapchainImage :: #type (a0: Swapchain, a1: *SwapchainImageReleaseInfo) -> Result #c_call;
PFN_xrBeginSession :: #type (a0: Session, a1: *SessionBeginInfo) -> Result #c_call;
PFN_xrEndSession :: #type (a0: Session) -> Result #c_call;
PFN_xrRequestExitSession :: #type (a0: Session) -> Result #c_call;
PFN_xrWaitFrame :: #type (a0: Session, a1: *FrameWaitInfo, a2: *FrameState) -> Result #c_call;
PFN_xrBeginFrame :: #type (a0: Session, a1: *FrameBeginInfo) -> Result #c_call;
PFN_xrEndFrame :: #type (a0: Session, a1: *FrameEndInfo) -> Result #c_call;
PFN_xrLocateViews :: #type (a0: Session, a1: *ViewLocateInfo, a2: *ViewState, a3: u32, a4: *u32, a5: *View) -> Result #c_call;
PFN_xrStringToPath :: #type (a0: Instance, a1: *u8, a2: *Path) -> Result #c_call;
PFN_xrPathToString :: #type (a0: Instance, a1: Path, a2: u32, a3: *u32, a4: *u8) -> Result #c_call;
PFN_xrCreateActionSet :: #type (a0: Instance, a1: *ActionSetCreateInfo, a2: *ActionSet) -> Result #c_call;
PFN_xrDestroyActionSet :: #type (a0: ActionSet) -> Result #c_call;
PFN_xrCreateAction :: #type (a0: ActionSet, a1: *ActionCreateInfo, a2: *Action) -> Result #c_call;
PFN_xrDestroyAction :: #type (a0: Action) -> Result #c_call;
PFN_xrSuggestInteractionProfileBindings :: #type (a0: Instance, a1: *InteractionProfileSuggestedBinding) -> Result #c_call;
PFN_xrAttachSessionActionSets :: #type (a0: Session, a1: *SessionActionSetsAttachInfo) -> Result #c_call;
PFN_xrGetCurrentInteractionProfile :: #type (a0: Session, a1: Path, a2: *InteractionProfileState) -> Result #c_call;
PFN_xrGetActionStateBoolean :: #type (a0: Session, a1: *ActionStateGetInfo, a2: *ActionStateBoolean) -> Result #c_call;
PFN_xrGetActionStateFloat :: #type (a0: Session, a1: *ActionStateGetInfo, a2: *ActionStateFloat) -> Result #c_call;
PFN_xrGetActionStateVector2f :: #type (a0: Session, a1: *ActionStateGetInfo, a2: *ActionStateVector2f) -> Result #c_call;
PFN_xrGetActionStatePose :: #type (a0: Session, a1: *ActionStateGetInfo, a2: *ActionStatePose) -> Result #c_call;
PFN_xrSyncActions :: #type (a0: Session, a1: *ActionsSyncInfo) -> Result #c_call;
PFN_xrEnumerateBoundSourcesForAction :: #type (a0: Session, a1: *BoundSourcesForActionEnumerateInfo, a2: u32, a3: *u32, a4: *Path) -> Result #c_call;
PFN_xrGetInputSourceLocalizedName :: #type (a0: Session, a1: *InputSourceLocalizedNameGetInfo, a2: u32, a3: *u32, a4: *u8) -> Result #c_call;
PFN_xrApplyHapticFeedback :: #type (a0: Session, a1: *HapticActionInfo, a2: *HapticBaseHeader) -> Result #c_call;
PFN_xrStopHapticFeedback :: #type (a0: Session, a1: *HapticActionInfo) -> Result #c_call;

xrGetInstanceProcAddr :: (instance: Instance, name: *u8, function: *PFN_xrVoidFunction) -> Result #foreign openxr_loader;

xrEnumerateApiLayerProperties :: (propertyCapacityInput: u32, propertyCountOutput: *u32, properties: *ApiLayerProperties) -> Result #foreign openxr_loader;

xrEnumerateInstanceExtensionProperties :: (layerName: *u8, propertyCapacityInput: u32, propertyCountOutput: *u32, properties: *ExtensionProperties) -> Result #foreign openxr_loader;

xrCreateInstance :: (createInfo: *InstanceCreateInfo, instance: *Instance) -> Result #foreign openxr_loader;

xrDestroyInstance :: (instance: Instance) -> Result #foreign openxr_loader;

xrGetInstanceProperties :: (instance: Instance, instanceProperties: *InstanceProperties) -> Result #foreign openxr_loader;

xrPollEvent :: (instance: Instance, eventData: *EventDataBuffer) -> Result #foreign openxr_loader;

xrResultToString :: (instance: Instance, value: Result, buffer: *[64] u8) -> Result #foreign openxr_loader;

xrStructureTypeToString :: (instance: Instance, value: StructureType, buffer: *[64] u8) -> Result #foreign openxr_loader;

xrGetSystem :: (instance: Instance, getInfo: *SystemGetInfo, systemId: *SystemId) -> Result #foreign openxr_loader;

xrGetSystemProperties :: (instance: Instance, systemId: SystemId, properties: *SystemProperties) -> Result #foreign openxr_loader;

xrEnumerateEnvironmentBlendModes :: (instance: Instance, systemId: SystemId, viewConfigurationType: ViewConfigurationType, environmentBlendModeCapacityInput: u32, environmentBlendModeCountOutput: *u32, environmentBlendModes: *EnvironmentBlendMode) -> Result #foreign openxr_loader;

xrCreateSession :: (instance: Instance, createInfo: *SessionCreateInfo, session: *Session) -> Result #foreign openxr_loader;

xrDestroySession :: (session: Session) -> Result #foreign openxr_loader;

xrEnumerateReferenceSpaces :: (session: Session, spaceCapacityInput: u32, spaceCountOutput: *u32, spaces: *ReferenceSpaceType) -> Result #foreign openxr_loader;

xrCreateReferenceSpace :: (session: Session, createInfo: *ReferenceSpaceCreateInfo, space: *Space) -> Result #foreign openxr_loader;

xrGetReferenceSpaceBoundsRect :: (session: Session, referenceSpaceType: ReferenceSpaceType, bounds: *Extent2Df) -> Result #foreign openxr_loader;

xrCreateActionSpace :: (session: Session, createInfo: *ActionSpaceCreateInfo, space: *Space) -> Result #foreign openxr_loader;

xrLocateSpace :: (space: Space, baseSpace: Space, time: Time, location: *SpaceLocation) -> Result #foreign openxr_loader;

xrDestroySpace :: (space: Space) -> Result #foreign openxr_loader;

xrEnumerateViewConfigurations :: (instance: Instance, systemId: SystemId, viewConfigurationTypeCapacityInput: u32, viewConfigurationTypeCountOutput: *u32, viewConfigurationTypes: *ViewConfigurationType) -> Result #foreign openxr_loader;

xrGetViewConfigurationProperties :: (instance: Instance, systemId: SystemId, viewConfigurationType: ViewConfigurationType, configurationProperties: *ViewConfigurationProperties) -> Result #foreign openxr_loader;

xrEnumerateViewConfigurationViews :: (instance: Instance, systemId: SystemId, viewConfigurationType: ViewConfigurationType, viewCapacityInput: u32, viewCountOutput: *u32, views: *ViewConfigurationView) -> Result #foreign openxr_loader;

xrEnumerateSwapchainFormats :: (session: Session, formatCapacityInput: u32, formatCountOutput: *u32, formats: *s64) -> Result #foreign openxr_loader;

xrCreateSwapchain :: (session: Session, createInfo: *SwapchainCreateInfo, swapchain: *Swapchain) -> Result #foreign openxr_loader;

xrDestroySwapchain :: (swapchain: Swapchain) -> Result #foreign openxr_loader;

xrEnumerateSwapchainImages :: (swapchain: Swapchain, imageCapacityInput: u32, imageCountOutput: *u32, images: *SwapchainImageBaseHeader) -> Result #foreign openxr_loader;

xrAcquireSwapchainImage :: (swapchain: Swapchain, acquireInfo: *SwapchainImageAcquireInfo, index: *u32) -> Result #foreign openxr_loader;

xrWaitSwapchainImage :: (swapchain: Swapchain, waitInfo: *SwapchainImageWaitInfo) -> Result #foreign openxr_loader;

xrReleaseSwapchainImage :: (swapchain: Swapchain, releaseInfo: *SwapchainImageReleaseInfo) -> Result #foreign openxr_loader;

xrBeginSession :: (session: Session, beginInfo: *SessionBeginInfo) -> Result #foreign openxr_loader;

xrEndSession :: (session: Session) -> Result #foreign openxr_loader;

xrRequestExitSession :: (session: Session) -> Result #foreign openxr_loader;

xrWaitFrame :: (session: Session, frameWaitInfo: *FrameWaitInfo, frameState: *FrameState) -> Result #foreign openxr_loader;

xrBeginFrame :: (session: Session, frameBeginInfo: *FrameBeginInfo) -> Result #foreign openxr_loader;

xrEndFrame :: (session: Session, frameEndInfo: *FrameEndInfo) -> Result #foreign openxr_loader;

xrLocateViews :: (session: Session, viewLocateInfo: *ViewLocateInfo, viewState: *ViewState, viewCapacityInput: u32, viewCountOutput: *u32, views: *View) -> Result #foreign openxr_loader;

xrStringToPath :: (instance: Instance, pathString: *u8, path: *Path) -> Result #foreign openxr_loader;

xrPathToString :: (instance: Instance, path: Path, bufferCapacityInput: u32, bufferCountOutput: *u32, buffer: *u8) -> Result #foreign openxr_loader;

xrCreateActionSet :: (instance: Instance, createInfo: *ActionSetCreateInfo, actionSet: *ActionSet) -> Result #foreign openxr_loader;

xrDestroyActionSet :: (actionSet: ActionSet) -> Result #foreign openxr_loader;

xrCreateAction :: (actionSet: ActionSet, createInfo: *ActionCreateInfo, action: *Action) -> Result #foreign openxr_loader;

xrDestroyAction :: (action: Action) -> Result #foreign openxr_loader;

xrSuggestInteractionProfileBindings :: (instance: Instance, suggestedBindings: *InteractionProfileSuggestedBinding) -> Result #foreign openxr_loader;

xrAttachSessionActionSets :: (session: Session, attachInfo: *SessionActionSetsAttachInfo) -> Result #foreign openxr_loader;

xrGetCurrentInteractionProfile :: (session: Session, topLevelUserPath: Path, interactionProfile: *InteractionProfileState) -> Result #foreign openxr_loader;

xrGetActionStateBoolean :: (session: Session, getInfo: *ActionStateGetInfo, state: *ActionStateBoolean) -> Result #foreign openxr_loader;

xrGetActionStateFloat :: (session: Session, getInfo: *ActionStateGetInfo, state: *ActionStateFloat) -> Result #foreign openxr_loader;

xrGetActionStateVector2f :: (session: Session, getInfo: *ActionStateGetInfo, state: *ActionStateVector2f) -> Result #foreign openxr_loader;

xrGetActionStatePose :: (session: Session, getInfo: *ActionStateGetInfo, state: *ActionStatePose) -> Result #foreign openxr_loader;

xrSyncActions :: (session: Session, syncInfo: *ActionsSyncInfo) -> Result #foreign openxr_loader;

xrEnumerateBoundSourcesForAction :: (session: Session, enumerateInfo: *BoundSourcesForActionEnumerateInfo, sourceCapacityInput: u32, sourceCountOutput: *u32, sources: *Path) -> Result #foreign openxr_loader;

xrGetInputSourceLocalizedName :: (session: Session, getInfo: *InputSourceLocalizedNameGetInfo, bufferCapacityInput: u32, bufferCountOutput: *u32, buffer: *u8) -> Result #foreign openxr_loader;

xrApplyHapticFeedback :: (session: Session, hapticActionInfo: *HapticActionInfo, hapticFeedback: *HapticBaseHeader) -> Result #foreign openxr_loader;

xrStopHapticFeedback :: (session: Session, hapticActionInfo: *HapticActionInfo) -> Result #foreign openxr_loader;

CompositionLayerCubeKHR :: struct {
    type:            StructureType;
    next:            *void;
    layerFlags:      CompositionLayerFlags;
    space:           Space;
    eyeVisibility:   EyeVisibility;
    swapchain:       Swapchain;
    imageArrayIndex: u32;
    orientation:     Quaternionf;
}
#run {
    instance: CompositionLayerCubeKHR;
    assert(((cast(*void)(*instance.type)) - cast(*void)(*instance)) == 0, "CompositionLayerCubeKHR.type has unexpected offset % instead of 0", ((cast(*void)(*instance.type)) - cast(*void)(*instance)));
    assert(size_of(type_of(CompositionLayerCubeKHR.type)) == 4, "CompositionLayerCubeKHR.type has unexpected size % instead of 4", size_of(type_of(CompositionLayerCubeKHR.type)));
    assert(((cast(*void)(*instance.next)) - cast(*void)(*instance)) == 8, "CompositionLayerCubeKHR.next has unexpected offset % instead of 8", ((cast(*void)(*instance.next)) - cast(*void)(*instance)));
    assert(size_of(type_of(CompositionLayerCubeKHR.next)) == 8, "CompositionLayerCubeKHR.next has unexpected size % instead of 8", size_of(type_of(CompositionLayerCubeKHR.next)));
    assert(((cast(*void)(*instance.layerFlags)) - cast(*void)(*instance)) == 16, "CompositionLayerCubeKHR.layerFlags has unexpected offset % instead of 16", ((cast(*void)(*instance.layerFlags)) - cast(*void)(*instance)));
    assert(size_of(type_of(CompositionLayerCubeKHR.layerFlags)) == 8, "CompositionLayerCubeKHR.layerFlags has unexpected size % instead of 8", size_of(type_of(CompositionLayerCubeKHR.layerFlags)));
    assert(((cast(*void)(*instance.space)) - cast(*void)(*instance)) == 24, "CompositionLayerCubeKHR.space has unexpected offset % instead of 24", ((cast(*void)(*instance.space)) - cast(*void)(*instance)));
    assert(size_of(type_of(CompositionLayerCubeKHR.space)) == 8, "CompositionLayerCubeKHR.space has unexpected size % instead of 8", size_of(type_of(CompositionLayerCubeKHR.space)));
    assert(((cast(*void)(*instance.eyeVisibility)) - cast(*void)(*instance)) == 32, "CompositionLayerCubeKHR.eyeVisibility has unexpected offset % instead of 32", ((cast(*void)(*instance.eyeVisibility)) - cast(*void)(*instance)));
    assert(size_of(type_of(CompositionLayerCubeKHR.eyeVisibility)) == 4, "CompositionLayerCubeKHR.eyeVisibility has unexpected size % instead of 4", size_of(type_of(CompositionLayerCubeKHR.eyeVisibility)));
    assert(((cast(*void)(*instance.swapchain)) - cast(*void)(*instance)) == 40, "CompositionLayerCubeKHR.swapchain has unexpected offset % instead of 40", ((cast(*void)(*instance.swapchain)) - cast(*void)(*instance)));
    assert(size_of(type_of(CompositionLayerCubeKHR.swapchain)) == 8, "CompositionLayerCubeKHR.swapchain has unexpected size % instead of 8", size_of(type_of(CompositionLayerCubeKHR.swapchain)));
    assert(((cast(*void)(*instance.imageArrayIndex)) - cast(*void)(*instance)) == 48, "CompositionLayerCubeKHR.imageArrayIndex has unexpected offset % instead of 48", ((cast(*void)(*instance.imageArrayIndex)) - cast(*void)(*instance)));
    assert(size_of(type_of(CompositionLayerCubeKHR.imageArrayIndex)) == 4, "CompositionLayerCubeKHR.imageArrayIndex has unexpected size % instead of 4", size_of(type_of(CompositionLayerCubeKHR.imageArrayIndex)));
    assert(((cast(*void)(*instance.orientation)) - cast(*void)(*instance)) == 52, "CompositionLayerCubeKHR.orientation has unexpected offset % instead of 52", ((cast(*void)(*instance.orientation)) - cast(*void)(*instance)));
    assert(size_of(type_of(CompositionLayerCubeKHR.orientation)) == 16, "CompositionLayerCubeKHR.orientation has unexpected size % instead of 16", size_of(type_of(CompositionLayerCubeKHR.orientation)));
    assert(size_of(CompositionLayerCubeKHR) == 72, "CompositionLayerCubeKHR has size % instead of 72", size_of(CompositionLayerCubeKHR));
}

// XrCompositionLayerDepthInfoKHR extends XrCompositionLayerProjectionView
CompositionLayerDepthInfoKHR :: struct {
    type:     StructureType;
    next:     *void;
    subImage: SwapchainSubImage;
    minDepth: float;
    maxDepth: float;
    nearZ:    float;
    farZ:     float;
}
#run {
    instance: CompositionLayerDepthInfoKHR;
    assert(((cast(*void)(*instance.type)) - cast(*void)(*instance)) == 0, "CompositionLayerDepthInfoKHR.type has unexpected offset % instead of 0", ((cast(*void)(*instance.type)) - cast(*void)(*instance)));
    assert(size_of(type_of(CompositionLayerDepthInfoKHR.type)) == 4, "CompositionLayerDepthInfoKHR.type has unexpected size % instead of 4", size_of(type_of(CompositionLayerDepthInfoKHR.type)));
    assert(((cast(*void)(*instance.next)) - cast(*void)(*instance)) == 8, "CompositionLayerDepthInfoKHR.next has unexpected offset % instead of 8", ((cast(*void)(*instance.next)) - cast(*void)(*instance)));
    assert(size_of(type_of(CompositionLayerDepthInfoKHR.next)) == 8, "CompositionLayerDepthInfoKHR.next has unexpected size % instead of 8", size_of(type_of(CompositionLayerDepthInfoKHR.next)));
    assert(((cast(*void)(*instance.subImage)) - cast(*void)(*instance)) == 16, "CompositionLayerDepthInfoKHR.subImage has unexpected offset % instead of 16", ((cast(*void)(*instance.subImage)) - cast(*void)(*instance)));
    assert(size_of(type_of(CompositionLayerDepthInfoKHR.subImage)) == 32, "CompositionLayerDepthInfoKHR.subImage has unexpected size % instead of 32", size_of(type_of(CompositionLayerDepthInfoKHR.subImage)));
    assert(((cast(*void)(*instance.minDepth)) - cast(*void)(*instance)) == 48, "CompositionLayerDepthInfoKHR.minDepth has unexpected offset % instead of 48", ((cast(*void)(*instance.minDepth)) - cast(*void)(*instance)));
    assert(size_of(type_of(CompositionLayerDepthInfoKHR.minDepth)) == 4, "CompositionLayerDepthInfoKHR.minDepth has unexpected size % instead of 4", size_of(type_of(CompositionLayerDepthInfoKHR.minDepth)));
    assert(((cast(*void)(*instance.maxDepth)) - cast(*void)(*instance)) == 52, "CompositionLayerDepthInfoKHR.maxDepth has unexpected offset % instead of 52", ((cast(*void)(*instance.maxDepth)) - cast(*void)(*instance)));
    assert(size_of(type_of(CompositionLayerDepthInfoKHR.maxDepth)) == 4, "CompositionLayerDepthInfoKHR.maxDepth has unexpected size % instead of 4", size_of(type_of(CompositionLayerDepthInfoKHR.maxDepth)));
    assert(((cast(*void)(*instance.nearZ)) - cast(*void)(*instance)) == 56, "CompositionLayerDepthInfoKHR.nearZ has unexpected offset % instead of 56", ((cast(*void)(*instance.nearZ)) - cast(*void)(*instance)));
    assert(size_of(type_of(CompositionLayerDepthInfoKHR.nearZ)) == 4, "CompositionLayerDepthInfoKHR.nearZ has unexpected size % instead of 4", size_of(type_of(CompositionLayerDepthInfoKHR.nearZ)));
    assert(((cast(*void)(*instance.farZ)) - cast(*void)(*instance)) == 60, "CompositionLayerDepthInfoKHR.farZ has unexpected offset % instead of 60", ((cast(*void)(*instance.farZ)) - cast(*void)(*instance)));
    assert(size_of(type_of(CompositionLayerDepthInfoKHR.farZ)) == 4, "CompositionLayerDepthInfoKHR.farZ has unexpected size % instead of 4", size_of(type_of(CompositionLayerDepthInfoKHR.farZ)));
    assert(size_of(CompositionLayerDepthInfoKHR) == 64, "CompositionLayerDepthInfoKHR has size % instead of 64", size_of(CompositionLayerDepthInfoKHR));
}

CompositionLayerCylinderKHR :: struct {
    type:          StructureType;
    next:          *void;
    layerFlags:    CompositionLayerFlags;
    space:         Space;
    eyeVisibility: EyeVisibility;
    subImage:      SwapchainSubImage;
    pose:          Posef;
    radius:        float;
    centralAngle:  float;
    aspectRatio:   float;
}
#run {
    instance: CompositionLayerCylinderKHR;
    assert(((cast(*void)(*instance.type)) - cast(*void)(*instance)) == 0, "CompositionLayerCylinderKHR.type has unexpected offset % instead of 0", ((cast(*void)(*instance.type)) - cast(*void)(*instance)));
    assert(size_of(type_of(CompositionLayerCylinderKHR.type)) == 4, "CompositionLayerCylinderKHR.type has unexpected size % instead of 4", size_of(type_of(CompositionLayerCylinderKHR.type)));
    assert(((cast(*void)(*instance.next)) - cast(*void)(*instance)) == 8, "CompositionLayerCylinderKHR.next has unexpected offset % instead of 8", ((cast(*void)(*instance.next)) - cast(*void)(*instance)));
    assert(size_of(type_of(CompositionLayerCylinderKHR.next)) == 8, "CompositionLayerCylinderKHR.next has unexpected size % instead of 8", size_of(type_of(CompositionLayerCylinderKHR.next)));
    assert(((cast(*void)(*instance.layerFlags)) - cast(*void)(*instance)) == 16, "CompositionLayerCylinderKHR.layerFlags has unexpected offset % instead of 16", ((cast(*void)(*instance.layerFlags)) - cast(*void)(*instance)));
    assert(size_of(type_of(CompositionLayerCylinderKHR.layerFlags)) == 8, "CompositionLayerCylinderKHR.layerFlags has unexpected size % instead of 8", size_of(type_of(CompositionLayerCylinderKHR.layerFlags)));
    assert(((cast(*void)(*instance.space)) - cast(*void)(*instance)) == 24, "CompositionLayerCylinderKHR.space has unexpected offset % instead of 24", ((cast(*void)(*instance.space)) - cast(*void)(*instance)));
    assert(size_of(type_of(CompositionLayerCylinderKHR.space)) == 8, "CompositionLayerCylinderKHR.space has unexpected size % instead of 8", size_of(type_of(CompositionLayerCylinderKHR.space)));
    assert(((cast(*void)(*instance.eyeVisibility)) - cast(*void)(*instance)) == 32, "CompositionLayerCylinderKHR.eyeVisibility has unexpected offset % instead of 32", ((cast(*void)(*instance.eyeVisibility)) - cast(*void)(*instance)));
    assert(size_of(type_of(CompositionLayerCylinderKHR.eyeVisibility)) == 4, "CompositionLayerCylinderKHR.eyeVisibility has unexpected size % instead of 4", size_of(type_of(CompositionLayerCylinderKHR.eyeVisibility)));
    assert(((cast(*void)(*instance.subImage)) - cast(*void)(*instance)) == 40, "CompositionLayerCylinderKHR.subImage has unexpected offset % instead of 40", ((cast(*void)(*instance.subImage)) - cast(*void)(*instance)));
    assert(size_of(type_of(CompositionLayerCylinderKHR.subImage)) == 32, "CompositionLayerCylinderKHR.subImage has unexpected size % instead of 32", size_of(type_of(CompositionLayerCylinderKHR.subImage)));
    assert(((cast(*void)(*instance.pose)) - cast(*void)(*instance)) == 72, "CompositionLayerCylinderKHR.pose has unexpected offset % instead of 72", ((cast(*void)(*instance.pose)) - cast(*void)(*instance)));
    assert(size_of(type_of(CompositionLayerCylinderKHR.pose)) == 28, "CompositionLayerCylinderKHR.pose has unexpected size % instead of 28", size_of(type_of(CompositionLayerCylinderKHR.pose)));
    assert(((cast(*void)(*instance.radius)) - cast(*void)(*instance)) == 100, "CompositionLayerCylinderKHR.radius has unexpected offset % instead of 100", ((cast(*void)(*instance.radius)) - cast(*void)(*instance)));
    assert(size_of(type_of(CompositionLayerCylinderKHR.radius)) == 4, "CompositionLayerCylinderKHR.radius has unexpected size % instead of 4", size_of(type_of(CompositionLayerCylinderKHR.radius)));
    assert(((cast(*void)(*instance.centralAngle)) - cast(*void)(*instance)) == 104, "CompositionLayerCylinderKHR.centralAngle has unexpected offset % instead of 104", ((cast(*void)(*instance.centralAngle)) - cast(*void)(*instance)));
    assert(size_of(type_of(CompositionLayerCylinderKHR.centralAngle)) == 4, "CompositionLayerCylinderKHR.centralAngle has unexpected size % instead of 4", size_of(type_of(CompositionLayerCylinderKHR.centralAngle)));
    assert(((cast(*void)(*instance.aspectRatio)) - cast(*void)(*instance)) == 108, "CompositionLayerCylinderKHR.aspectRatio has unexpected offset % instead of 108", ((cast(*void)(*instance.aspectRatio)) - cast(*void)(*instance)));
    assert(size_of(type_of(CompositionLayerCylinderKHR.aspectRatio)) == 4, "CompositionLayerCylinderKHR.aspectRatio has unexpected size % instead of 4", size_of(type_of(CompositionLayerCylinderKHR.aspectRatio)));
    assert(size_of(CompositionLayerCylinderKHR) == 112, "CompositionLayerCylinderKHR has size % instead of 112", size_of(CompositionLayerCylinderKHR));
}

CompositionLayerEquirectKHR :: struct {
    type:          StructureType;
    next:          *void;
    layerFlags:    CompositionLayerFlags;
    space:         Space;
    eyeVisibility: EyeVisibility;
    subImage:      SwapchainSubImage;
    pose:          Posef;
    radius:        float;
    scale:         Vector2f;
    bias:          Vector2f;
}
#run {
    instance: CompositionLayerEquirectKHR;
    assert(((cast(*void)(*instance.type)) - cast(*void)(*instance)) == 0, "CompositionLayerEquirectKHR.type has unexpected offset % instead of 0", ((cast(*void)(*instance.type)) - cast(*void)(*instance)));
    assert(size_of(type_of(CompositionLayerEquirectKHR.type)) == 4, "CompositionLayerEquirectKHR.type has unexpected size % instead of 4", size_of(type_of(CompositionLayerEquirectKHR.type)));
    assert(((cast(*void)(*instance.next)) - cast(*void)(*instance)) == 8, "CompositionLayerEquirectKHR.next has unexpected offset % instead of 8", ((cast(*void)(*instance.next)) - cast(*void)(*instance)));
    assert(size_of(type_of(CompositionLayerEquirectKHR.next)) == 8, "CompositionLayerEquirectKHR.next has unexpected size % instead of 8", size_of(type_of(CompositionLayerEquirectKHR.next)));
    assert(((cast(*void)(*instance.layerFlags)) - cast(*void)(*instance)) == 16, "CompositionLayerEquirectKHR.layerFlags has unexpected offset % instead of 16", ((cast(*void)(*instance.layerFlags)) - cast(*void)(*instance)));
    assert(size_of(type_of(CompositionLayerEquirectKHR.layerFlags)) == 8, "CompositionLayerEquirectKHR.layerFlags has unexpected size % instead of 8", size_of(type_of(CompositionLayerEquirectKHR.layerFlags)));
    assert(((cast(*void)(*instance.space)) - cast(*void)(*instance)) == 24, "CompositionLayerEquirectKHR.space has unexpected offset % instead of 24", ((cast(*void)(*instance.space)) - cast(*void)(*instance)));
    assert(size_of(type_of(CompositionLayerEquirectKHR.space)) == 8, "CompositionLayerEquirectKHR.space has unexpected size % instead of 8", size_of(type_of(CompositionLayerEquirectKHR.space)));
    assert(((cast(*void)(*instance.eyeVisibility)) - cast(*void)(*instance)) == 32, "CompositionLayerEquirectKHR.eyeVisibility has unexpected offset % instead of 32", ((cast(*void)(*instance.eyeVisibility)) - cast(*void)(*instance)));
    assert(size_of(type_of(CompositionLayerEquirectKHR.eyeVisibility)) == 4, "CompositionLayerEquirectKHR.eyeVisibility has unexpected size % instead of 4", size_of(type_of(CompositionLayerEquirectKHR.eyeVisibility)));
    assert(((cast(*void)(*instance.subImage)) - cast(*void)(*instance)) == 40, "CompositionLayerEquirectKHR.subImage has unexpected offset % instead of 40", ((cast(*void)(*instance.subImage)) - cast(*void)(*instance)));
    assert(size_of(type_of(CompositionLayerEquirectKHR.subImage)) == 32, "CompositionLayerEquirectKHR.subImage has unexpected size % instead of 32", size_of(type_of(CompositionLayerEquirectKHR.subImage)));
    assert(((cast(*void)(*instance.pose)) - cast(*void)(*instance)) == 72, "CompositionLayerEquirectKHR.pose has unexpected offset % instead of 72", ((cast(*void)(*instance.pose)) - cast(*void)(*instance)));
    assert(size_of(type_of(CompositionLayerEquirectKHR.pose)) == 28, "CompositionLayerEquirectKHR.pose has unexpected size % instead of 28", size_of(type_of(CompositionLayerEquirectKHR.pose)));
    assert(((cast(*void)(*instance.radius)) - cast(*void)(*instance)) == 100, "CompositionLayerEquirectKHR.radius has unexpected offset % instead of 100", ((cast(*void)(*instance.radius)) - cast(*void)(*instance)));
    assert(size_of(type_of(CompositionLayerEquirectKHR.radius)) == 4, "CompositionLayerEquirectKHR.radius has unexpected size % instead of 4", size_of(type_of(CompositionLayerEquirectKHR.radius)));
    assert(((cast(*void)(*instance.scale)) - cast(*void)(*instance)) == 104, "CompositionLayerEquirectKHR.scale has unexpected offset % instead of 104", ((cast(*void)(*instance.scale)) - cast(*void)(*instance)));
    assert(size_of(type_of(CompositionLayerEquirectKHR.scale)) == 8, "CompositionLayerEquirectKHR.scale has unexpected size % instead of 8", size_of(type_of(CompositionLayerEquirectKHR.scale)));
    assert(((cast(*void)(*instance.bias)) - cast(*void)(*instance)) == 112, "CompositionLayerEquirectKHR.bias has unexpected offset % instead of 112", ((cast(*void)(*instance.bias)) - cast(*void)(*instance)));
    assert(size_of(type_of(CompositionLayerEquirectKHR.bias)) == 8, "CompositionLayerEquirectKHR.bias has unexpected size % instead of 8", size_of(type_of(CompositionLayerEquirectKHR.bias)));
    assert(size_of(CompositionLayerEquirectKHR) == 120, "CompositionLayerEquirectKHR has size % instead of 120", size_of(CompositionLayerEquirectKHR));
}

VisibilityMaskTypeKHR :: enum s32 {
    HIDDEN_TRIANGLE_MESH_KHR  :: 1;
    VISIBLE_TRIANGLE_MESH_KHR :: 2;
    LINE_LOOP_KHR             :: 3;
    MAX_ENUM_KHR              :: 2147483647;

    XR_VISIBILITY_MASK_TYPE_HIDDEN_TRIANGLE_MESH_KHR  :: HIDDEN_TRIANGLE_MESH_KHR;
    XR_VISIBILITY_MASK_TYPE_VISIBLE_TRIANGLE_MESH_KHR :: VISIBLE_TRIANGLE_MESH_KHR;
    XR_VISIBILITY_MASK_TYPE_LINE_LOOP_KHR             :: LINE_LOOP_KHR;
    XR_VISIBILITY_MASK_TYPE_MAX_ENUM_KHR              :: MAX_ENUM_KHR;
}

VisibilityMaskKHR :: struct {
    type:                StructureType;
    next:                *void;
    vertexCapacityInput: u32;
    vertexCountOutput:   u32;
    vertices:            *Vector2f;
    indexCapacityInput:  u32;
    indexCountOutput:    u32;
    indices:             *u32;
}
#run {
    instance: VisibilityMaskKHR;
    assert(((cast(*void)(*instance.type)) - cast(*void)(*instance)) == 0, "VisibilityMaskKHR.type has unexpected offset % instead of 0", ((cast(*void)(*instance.type)) - cast(*void)(*instance)));
    assert(size_of(type_of(VisibilityMaskKHR.type)) == 4, "VisibilityMaskKHR.type has unexpected size % instead of 4", size_of(type_of(VisibilityMaskKHR.type)));
    assert(((cast(*void)(*instance.next)) - cast(*void)(*instance)) == 8, "VisibilityMaskKHR.next has unexpected offset % instead of 8", ((cast(*void)(*instance.next)) - cast(*void)(*instance)));
    assert(size_of(type_of(VisibilityMaskKHR.next)) == 8, "VisibilityMaskKHR.next has unexpected size % instead of 8", size_of(type_of(VisibilityMaskKHR.next)));
    assert(((cast(*void)(*instance.vertexCapacityInput)) - cast(*void)(*instance)) == 16, "VisibilityMaskKHR.vertexCapacityInput has unexpected offset % instead of 16", ((cast(*void)(*instance.vertexCapacityInput)) - cast(*void)(*instance)));
    assert(size_of(type_of(VisibilityMaskKHR.vertexCapacityInput)) == 4, "VisibilityMaskKHR.vertexCapacityInput has unexpected size % instead of 4", size_of(type_of(VisibilityMaskKHR.vertexCapacityInput)));
    assert(((cast(*void)(*instance.vertexCountOutput)) - cast(*void)(*instance)) == 20, "VisibilityMaskKHR.vertexCountOutput has unexpected offset % instead of 20", ((cast(*void)(*instance.vertexCountOutput)) - cast(*void)(*instance)));
    assert(size_of(type_of(VisibilityMaskKHR.vertexCountOutput)) == 4, "VisibilityMaskKHR.vertexCountOutput has unexpected size % instead of 4", size_of(type_of(VisibilityMaskKHR.vertexCountOutput)));
    assert(((cast(*void)(*instance.vertices)) - cast(*void)(*instance)) == 24, "VisibilityMaskKHR.vertices has unexpected offset % instead of 24", ((cast(*void)(*instance.vertices)) - cast(*void)(*instance)));
    assert(size_of(type_of(VisibilityMaskKHR.vertices)) == 8, "VisibilityMaskKHR.vertices has unexpected size % instead of 8", size_of(type_of(VisibilityMaskKHR.vertices)));
    assert(((cast(*void)(*instance.indexCapacityInput)) - cast(*void)(*instance)) == 32, "VisibilityMaskKHR.indexCapacityInput has unexpected offset % instead of 32", ((cast(*void)(*instance.indexCapacityInput)) - cast(*void)(*instance)));
    assert(size_of(type_of(VisibilityMaskKHR.indexCapacityInput)) == 4, "VisibilityMaskKHR.indexCapacityInput has unexpected size % instead of 4", size_of(type_of(VisibilityMaskKHR.indexCapacityInput)));
    assert(((cast(*void)(*instance.indexCountOutput)) - cast(*void)(*instance)) == 36, "VisibilityMaskKHR.indexCountOutput has unexpected offset % instead of 36", ((cast(*void)(*instance.indexCountOutput)) - cast(*void)(*instance)));
    assert(size_of(type_of(VisibilityMaskKHR.indexCountOutput)) == 4, "VisibilityMaskKHR.indexCountOutput has unexpected size % instead of 4", size_of(type_of(VisibilityMaskKHR.indexCountOutput)));
    assert(((cast(*void)(*instance.indices)) - cast(*void)(*instance)) == 40, "VisibilityMaskKHR.indices has unexpected offset % instead of 40", ((cast(*void)(*instance.indices)) - cast(*void)(*instance)));
    assert(size_of(type_of(VisibilityMaskKHR.indices)) == 8, "VisibilityMaskKHR.indices has unexpected size % instead of 8", size_of(type_of(VisibilityMaskKHR.indices)));
    assert(size_of(VisibilityMaskKHR) == 48, "VisibilityMaskKHR has size % instead of 48", size_of(VisibilityMaskKHR));
}

EventDataVisibilityMaskChangedKHR :: struct {
    type:                  StructureType;
    next:                  *void;
    session:               Session;
    viewConfigurationType: ViewConfigurationType;
    viewIndex:             u32;
}
#run {
    instance: EventDataVisibilityMaskChangedKHR;
    assert(((cast(*void)(*instance.type)) - cast(*void)(*instance)) == 0, "EventDataVisibilityMaskChangedKHR.type has unexpected offset % instead of 0", ((cast(*void)(*instance.type)) - cast(*void)(*instance)));
    assert(size_of(type_of(EventDataVisibilityMaskChangedKHR.type)) == 4, "EventDataVisibilityMaskChangedKHR.type has unexpected size % instead of 4", size_of(type_of(EventDataVisibilityMaskChangedKHR.type)));
    assert(((cast(*void)(*instance.next)) - cast(*void)(*instance)) == 8, "EventDataVisibilityMaskChangedKHR.next has unexpected offset % instead of 8", ((cast(*void)(*instance.next)) - cast(*void)(*instance)));
    assert(size_of(type_of(EventDataVisibilityMaskChangedKHR.next)) == 8, "EventDataVisibilityMaskChangedKHR.next has unexpected size % instead of 8", size_of(type_of(EventDataVisibilityMaskChangedKHR.next)));
    assert(((cast(*void)(*instance.session)) - cast(*void)(*instance)) == 16, "EventDataVisibilityMaskChangedKHR.session has unexpected offset % instead of 16", ((cast(*void)(*instance.session)) - cast(*void)(*instance)));
    assert(size_of(type_of(EventDataVisibilityMaskChangedKHR.session)) == 8, "EventDataVisibilityMaskChangedKHR.session has unexpected size % instead of 8", size_of(type_of(EventDataVisibilityMaskChangedKHR.session)));
    assert(((cast(*void)(*instance.viewConfigurationType)) - cast(*void)(*instance)) == 24, "EventDataVisibilityMaskChangedKHR.viewConfigurationType has unexpected offset % instead of 24", ((cast(*void)(*instance.viewConfigurationType)) - cast(*void)(*instance)));
    assert(size_of(type_of(EventDataVisibilityMaskChangedKHR.viewConfigurationType)) == 4, "EventDataVisibilityMaskChangedKHR.viewConfigurationType has unexpected size % instead of 4", size_of(type_of(EventDataVisibilityMaskChangedKHR.viewConfigurationType)));
    assert(((cast(*void)(*instance.viewIndex)) - cast(*void)(*instance)) == 28, "EventDataVisibilityMaskChangedKHR.viewIndex has unexpected offset % instead of 28", ((cast(*void)(*instance.viewIndex)) - cast(*void)(*instance)));
    assert(size_of(type_of(EventDataVisibilityMaskChangedKHR.viewIndex)) == 4, "EventDataVisibilityMaskChangedKHR.viewIndex has unexpected size % instead of 4", size_of(type_of(EventDataVisibilityMaskChangedKHR.viewIndex)));
    assert(size_of(EventDataVisibilityMaskChangedKHR) == 32, "EventDataVisibilityMaskChangedKHR has size % instead of 32", size_of(EventDataVisibilityMaskChangedKHR));
}

PFN_xrGetVisibilityMaskKHR :: #type (a0: Session, a1: ViewConfigurationType, a2: u32, a3: VisibilityMaskTypeKHR, a4: *VisibilityMaskKHR) -> Result #c_call;

// XrCompositionLayerColorScaleBiasKHR extends XrCompositionLayerBaseHeader
CompositionLayerColorScaleBiasKHR :: struct {
    type:       StructureType;
    next:       *void;
    colorScale: Color4f;
    colorBias:  Color4f;
}
#run {
    instance: CompositionLayerColorScaleBiasKHR;
    assert(((cast(*void)(*instance.type)) - cast(*void)(*instance)) == 0, "CompositionLayerColorScaleBiasKHR.type has unexpected offset % instead of 0", ((cast(*void)(*instance.type)) - cast(*void)(*instance)));
    assert(size_of(type_of(CompositionLayerColorScaleBiasKHR.type)) == 4, "CompositionLayerColorScaleBiasKHR.type has unexpected size % instead of 4", size_of(type_of(CompositionLayerColorScaleBiasKHR.type)));
    assert(((cast(*void)(*instance.next)) - cast(*void)(*instance)) == 8, "CompositionLayerColorScaleBiasKHR.next has unexpected offset % instead of 8", ((cast(*void)(*instance.next)) - cast(*void)(*instance)));
    assert(size_of(type_of(CompositionLayerColorScaleBiasKHR.next)) == 8, "CompositionLayerColorScaleBiasKHR.next has unexpected size % instead of 8", size_of(type_of(CompositionLayerColorScaleBiasKHR.next)));
    assert(((cast(*void)(*instance.colorScale)) - cast(*void)(*instance)) == 16, "CompositionLayerColorScaleBiasKHR.colorScale has unexpected offset % instead of 16", ((cast(*void)(*instance.colorScale)) - cast(*void)(*instance)));
    assert(size_of(type_of(CompositionLayerColorScaleBiasKHR.colorScale)) == 16, "CompositionLayerColorScaleBiasKHR.colorScale has unexpected size % instead of 16", size_of(type_of(CompositionLayerColorScaleBiasKHR.colorScale)));
    assert(((cast(*void)(*instance.colorBias)) - cast(*void)(*instance)) == 32, "CompositionLayerColorScaleBiasKHR.colorBias has unexpected offset % instead of 32", ((cast(*void)(*instance.colorBias)) - cast(*void)(*instance)));
    assert(size_of(type_of(CompositionLayerColorScaleBiasKHR.colorBias)) == 16, "CompositionLayerColorScaleBiasKHR.colorBias has unexpected size % instead of 16", size_of(type_of(CompositionLayerColorScaleBiasKHR.colorBias)));
    assert(size_of(CompositionLayerColorScaleBiasKHR) == 48, "CompositionLayerColorScaleBiasKHR has size % instead of 48", size_of(CompositionLayerColorScaleBiasKHR));
}

LoaderInitInfoBaseHeaderKHR :: struct {
    type: StructureType;
    next: *void;
}
#run {
    instance: LoaderInitInfoBaseHeaderKHR;
    assert(((cast(*void)(*instance.type)) - cast(*void)(*instance)) == 0, "LoaderInitInfoBaseHeaderKHR.type has unexpected offset % instead of 0", ((cast(*void)(*instance.type)) - cast(*void)(*instance)));
    assert(size_of(type_of(LoaderInitInfoBaseHeaderKHR.type)) == 4, "LoaderInitInfoBaseHeaderKHR.type has unexpected size % instead of 4", size_of(type_of(LoaderInitInfoBaseHeaderKHR.type)));
    assert(((cast(*void)(*instance.next)) - cast(*void)(*instance)) == 8, "LoaderInitInfoBaseHeaderKHR.next has unexpected offset % instead of 8", ((cast(*void)(*instance.next)) - cast(*void)(*instance)));
    assert(size_of(type_of(LoaderInitInfoBaseHeaderKHR.next)) == 8, "LoaderInitInfoBaseHeaderKHR.next has unexpected size % instead of 8", size_of(type_of(LoaderInitInfoBaseHeaderKHR.next)));
    assert(size_of(LoaderInitInfoBaseHeaderKHR) == 16, "LoaderInitInfoBaseHeaderKHR has size % instead of 16", size_of(LoaderInitInfoBaseHeaderKHR));
}

PFN_xrInitializeLoaderKHR :: #type (a0: *LoaderInitInfoBaseHeaderKHR) -> Result #c_call;

CompositionLayerEquirect2KHR :: struct {
    type:                   StructureType;
    next:                   *void;
    layerFlags:             CompositionLayerFlags;
    space:                  Space;
    eyeVisibility:          EyeVisibility;
    subImage:               SwapchainSubImage;
    pose:                   Posef;
    radius:                 float;
    centralHorizontalAngle: float;
    upperVerticalAngle:     float;
    lowerVerticalAngle:     float;
}
#run {
    instance: CompositionLayerEquirect2KHR;
    assert(((cast(*void)(*instance.type)) - cast(*void)(*instance)) == 0, "CompositionLayerEquirect2KHR.type has unexpected offset % instead of 0", ((cast(*void)(*instance.type)) - cast(*void)(*instance)));
    assert(size_of(type_of(CompositionLayerEquirect2KHR.type)) == 4, "CompositionLayerEquirect2KHR.type has unexpected size % instead of 4", size_of(type_of(CompositionLayerEquirect2KHR.type)));
    assert(((cast(*void)(*instance.next)) - cast(*void)(*instance)) == 8, "CompositionLayerEquirect2KHR.next has unexpected offset % instead of 8", ((cast(*void)(*instance.next)) - cast(*void)(*instance)));
    assert(size_of(type_of(CompositionLayerEquirect2KHR.next)) == 8, "CompositionLayerEquirect2KHR.next has unexpected size % instead of 8", size_of(type_of(CompositionLayerEquirect2KHR.next)));
    assert(((cast(*void)(*instance.layerFlags)) - cast(*void)(*instance)) == 16, "CompositionLayerEquirect2KHR.layerFlags has unexpected offset % instead of 16", ((cast(*void)(*instance.layerFlags)) - cast(*void)(*instance)));
    assert(size_of(type_of(CompositionLayerEquirect2KHR.layerFlags)) == 8, "CompositionLayerEquirect2KHR.layerFlags has unexpected size % instead of 8", size_of(type_of(CompositionLayerEquirect2KHR.layerFlags)));
    assert(((cast(*void)(*instance.space)) - cast(*void)(*instance)) == 24, "CompositionLayerEquirect2KHR.space has unexpected offset % instead of 24", ((cast(*void)(*instance.space)) - cast(*void)(*instance)));
    assert(size_of(type_of(CompositionLayerEquirect2KHR.space)) == 8, "CompositionLayerEquirect2KHR.space has unexpected size % instead of 8", size_of(type_of(CompositionLayerEquirect2KHR.space)));
    assert(((cast(*void)(*instance.eyeVisibility)) - cast(*void)(*instance)) == 32, "CompositionLayerEquirect2KHR.eyeVisibility has unexpected offset % instead of 32", ((cast(*void)(*instance.eyeVisibility)) - cast(*void)(*instance)));
    assert(size_of(type_of(CompositionLayerEquirect2KHR.eyeVisibility)) == 4, "CompositionLayerEquirect2KHR.eyeVisibility has unexpected size % instead of 4", size_of(type_of(CompositionLayerEquirect2KHR.eyeVisibility)));
    assert(((cast(*void)(*instance.subImage)) - cast(*void)(*instance)) == 40, "CompositionLayerEquirect2KHR.subImage has unexpected offset % instead of 40", ((cast(*void)(*instance.subImage)) - cast(*void)(*instance)));
    assert(size_of(type_of(CompositionLayerEquirect2KHR.subImage)) == 32, "CompositionLayerEquirect2KHR.subImage has unexpected size % instead of 32", size_of(type_of(CompositionLayerEquirect2KHR.subImage)));
    assert(((cast(*void)(*instance.pose)) - cast(*void)(*instance)) == 72, "CompositionLayerEquirect2KHR.pose has unexpected offset % instead of 72", ((cast(*void)(*instance.pose)) - cast(*void)(*instance)));
    assert(size_of(type_of(CompositionLayerEquirect2KHR.pose)) == 28, "CompositionLayerEquirect2KHR.pose has unexpected size % instead of 28", size_of(type_of(CompositionLayerEquirect2KHR.pose)));
    assert(((cast(*void)(*instance.radius)) - cast(*void)(*instance)) == 100, "CompositionLayerEquirect2KHR.radius has unexpected offset % instead of 100", ((cast(*void)(*instance.radius)) - cast(*void)(*instance)));
    assert(size_of(type_of(CompositionLayerEquirect2KHR.radius)) == 4, "CompositionLayerEquirect2KHR.radius has unexpected size % instead of 4", size_of(type_of(CompositionLayerEquirect2KHR.radius)));
    assert(((cast(*void)(*instance.centralHorizontalAngle)) - cast(*void)(*instance)) == 104, "CompositionLayerEquirect2KHR.centralHorizontalAngle has unexpected offset % instead of 104", ((cast(*void)(*instance.centralHorizontalAngle)) - cast(*void)(*instance)));
    assert(size_of(type_of(CompositionLayerEquirect2KHR.centralHorizontalAngle)) == 4, "CompositionLayerEquirect2KHR.centralHorizontalAngle has unexpected size % instead of 4", size_of(type_of(CompositionLayerEquirect2KHR.centralHorizontalAngle)));
    assert(((cast(*void)(*instance.upperVerticalAngle)) - cast(*void)(*instance)) == 108, "CompositionLayerEquirect2KHR.upperVerticalAngle has unexpected offset % instead of 108", ((cast(*void)(*instance.upperVerticalAngle)) - cast(*void)(*instance)));
    assert(size_of(type_of(CompositionLayerEquirect2KHR.upperVerticalAngle)) == 4, "CompositionLayerEquirect2KHR.upperVerticalAngle has unexpected size % instead of 4", size_of(type_of(CompositionLayerEquirect2KHR.upperVerticalAngle)));
    assert(((cast(*void)(*instance.lowerVerticalAngle)) - cast(*void)(*instance)) == 112, "CompositionLayerEquirect2KHR.lowerVerticalAngle has unexpected offset % instead of 112", ((cast(*void)(*instance.lowerVerticalAngle)) - cast(*void)(*instance)));
    assert(size_of(type_of(CompositionLayerEquirect2KHR.lowerVerticalAngle)) == 4, "CompositionLayerEquirect2KHR.lowerVerticalAngle has unexpected size % instead of 4", size_of(type_of(CompositionLayerEquirect2KHR.lowerVerticalAngle)));
    assert(size_of(CompositionLayerEquirect2KHR) == 120, "CompositionLayerEquirect2KHR has size % instead of 120", size_of(CompositionLayerEquirect2KHR));
}

BindingModificationBaseHeaderKHR :: struct {
    type: StructureType;
    next: *void;
}
#run {
    instance: BindingModificationBaseHeaderKHR;
    assert(((cast(*void)(*instance.type)) - cast(*void)(*instance)) == 0, "BindingModificationBaseHeaderKHR.type has unexpected offset % instead of 0", ((cast(*void)(*instance.type)) - cast(*void)(*instance)));
    assert(size_of(type_of(BindingModificationBaseHeaderKHR.type)) == 4, "BindingModificationBaseHeaderKHR.type has unexpected size % instead of 4", size_of(type_of(BindingModificationBaseHeaderKHR.type)));
    assert(((cast(*void)(*instance.next)) - cast(*void)(*instance)) == 8, "BindingModificationBaseHeaderKHR.next has unexpected offset % instead of 8", ((cast(*void)(*instance.next)) - cast(*void)(*instance)));
    assert(size_of(type_of(BindingModificationBaseHeaderKHR.next)) == 8, "BindingModificationBaseHeaderKHR.next has unexpected size % instead of 8", size_of(type_of(BindingModificationBaseHeaderKHR.next)));
    assert(size_of(BindingModificationBaseHeaderKHR) == 16, "BindingModificationBaseHeaderKHR has size % instead of 16", size_of(BindingModificationBaseHeaderKHR));
}

// XrBindingModificationsKHR extends XrInteractionProfileSuggestedBinding
BindingModificationsKHR :: struct {
    type:                     StructureType;
    next:                     *void;
    bindingModificationCount: u32;
    bindingModifications:     **BindingModificationBaseHeaderKHR;
}
#run {
    instance: BindingModificationsKHR;
    assert(((cast(*void)(*instance.type)) - cast(*void)(*instance)) == 0, "BindingModificationsKHR.type has unexpected offset % instead of 0", ((cast(*void)(*instance.type)) - cast(*void)(*instance)));
    assert(size_of(type_of(BindingModificationsKHR.type)) == 4, "BindingModificationsKHR.type has unexpected size % instead of 4", size_of(type_of(BindingModificationsKHR.type)));
    assert(((cast(*void)(*instance.next)) - cast(*void)(*instance)) == 8, "BindingModificationsKHR.next has unexpected offset % instead of 8", ((cast(*void)(*instance.next)) - cast(*void)(*instance)));
    assert(size_of(type_of(BindingModificationsKHR.next)) == 8, "BindingModificationsKHR.next has unexpected size % instead of 8", size_of(type_of(BindingModificationsKHR.next)));
    assert(((cast(*void)(*instance.bindingModificationCount)) - cast(*void)(*instance)) == 16, "BindingModificationsKHR.bindingModificationCount has unexpected offset % instead of 16", ((cast(*void)(*instance.bindingModificationCount)) - cast(*void)(*instance)));
    assert(size_of(type_of(BindingModificationsKHR.bindingModificationCount)) == 4, "BindingModificationsKHR.bindingModificationCount has unexpected size % instead of 4", size_of(type_of(BindingModificationsKHR.bindingModificationCount)));
    assert(((cast(*void)(*instance.bindingModifications)) - cast(*void)(*instance)) == 24, "BindingModificationsKHR.bindingModifications has unexpected offset % instead of 24", ((cast(*void)(*instance.bindingModifications)) - cast(*void)(*instance)));
    assert(size_of(type_of(BindingModificationsKHR.bindingModifications)) == 8, "BindingModificationsKHR.bindingModifications has unexpected size % instead of 8", size_of(type_of(BindingModificationsKHR.bindingModifications)));
    assert(size_of(BindingModificationsKHR) == 32, "BindingModificationsKHR has size % instead of 32", size_of(BindingModificationsKHR));
}

PerfSettingsDomainEXT :: enum s32 {
    CPU_EXT      :: 1;
    GPU_EXT      :: 2;
    MAX_ENUM_EXT :: 2147483647;

    XR_PERF_SETTINGS_DOMAIN_CPU_EXT      :: CPU_EXT;
    XR_PERF_SETTINGS_DOMAIN_GPU_EXT      :: GPU_EXT;
    XR_PERF_SETTINGS_DOMAIN_MAX_ENUM_EXT :: MAX_ENUM_EXT;
}

PerfSettingsSubDomainEXT :: enum s32 {
    COMPOSITING_EXT :: 1;
    RENDERING_EXT   :: 2;
    THERMAL_EXT     :: 3;
    MAX_ENUM_EXT    :: 2147483647;

    XR_PERF_SETTINGS_SUB_DOMAIN_COMPOSITING_EXT :: COMPOSITING_EXT;
    XR_PERF_SETTINGS_SUB_DOMAIN_RENDERING_EXT   :: RENDERING_EXT;
    XR_PERF_SETTINGS_SUB_DOMAIN_THERMAL_EXT     :: THERMAL_EXT;
    XR_PERF_SETTINGS_SUB_DOMAIN_MAX_ENUM_EXT    :: MAX_ENUM_EXT;
}

PerfSettingsLevelEXT :: enum s32 {
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

PerfSettingsNotificationLevelEXT :: enum s32 {
    NOTIF_LEVEL_NORMAL_EXT          :: 0;
    NOTIF_LEVEL_WARNING_EXT         :: 25;
    NOTIF_LEVEL_IMPAIRED_EXT        :: 75;
    NOTIFICATION_LEVEL_MAX_ENUM_EXT :: 2147483647;

    XR_PERF_SETTINGS_NOTIF_LEVEL_NORMAL_EXT          :: NOTIF_LEVEL_NORMAL_EXT;
    XR_PERF_SETTINGS_NOTIF_LEVEL_WARNING_EXT         :: NOTIF_LEVEL_WARNING_EXT;
    XR_PERF_SETTINGS_NOTIF_LEVEL_IMPAIRED_EXT        :: NOTIF_LEVEL_IMPAIRED_EXT;
    XR_PERF_SETTINGS_NOTIFICATION_LEVEL_MAX_ENUM_EXT :: NOTIFICATION_LEVEL_MAX_ENUM_EXT;
}

EventDataPerfSettingsEXT :: struct {
    type:      StructureType;
    next:      *void;
    domain:    PerfSettingsDomainEXT;
    subDomain: PerfSettingsSubDomainEXT;
    fromLevel: PerfSettingsNotificationLevelEXT;
    toLevel:   PerfSettingsNotificationLevelEXT;
}
#run {
    instance: EventDataPerfSettingsEXT;
    assert(((cast(*void)(*instance.type)) - cast(*void)(*instance)) == 0, "EventDataPerfSettingsEXT.type has unexpected offset % instead of 0", ((cast(*void)(*instance.type)) - cast(*void)(*instance)));
    assert(size_of(type_of(EventDataPerfSettingsEXT.type)) == 4, "EventDataPerfSettingsEXT.type has unexpected size % instead of 4", size_of(type_of(EventDataPerfSettingsEXT.type)));
    assert(((cast(*void)(*instance.next)) - cast(*void)(*instance)) == 8, "EventDataPerfSettingsEXT.next has unexpected offset % instead of 8", ((cast(*void)(*instance.next)) - cast(*void)(*instance)));
    assert(size_of(type_of(EventDataPerfSettingsEXT.next)) == 8, "EventDataPerfSettingsEXT.next has unexpected size % instead of 8", size_of(type_of(EventDataPerfSettingsEXT.next)));
    assert(((cast(*void)(*instance.domain)) - cast(*void)(*instance)) == 16, "EventDataPerfSettingsEXT.domain has unexpected offset % instead of 16", ((cast(*void)(*instance.domain)) - cast(*void)(*instance)));
    assert(size_of(type_of(EventDataPerfSettingsEXT.domain)) == 4, "EventDataPerfSettingsEXT.domain has unexpected size % instead of 4", size_of(type_of(EventDataPerfSettingsEXT.domain)));
    assert(((cast(*void)(*instance.subDomain)) - cast(*void)(*instance)) == 20, "EventDataPerfSettingsEXT.subDomain has unexpected offset % instead of 20", ((cast(*void)(*instance.subDomain)) - cast(*void)(*instance)));
    assert(size_of(type_of(EventDataPerfSettingsEXT.subDomain)) == 4, "EventDataPerfSettingsEXT.subDomain has unexpected size % instead of 4", size_of(type_of(EventDataPerfSettingsEXT.subDomain)));
    assert(((cast(*void)(*instance.fromLevel)) - cast(*void)(*instance)) == 24, "EventDataPerfSettingsEXT.fromLevel has unexpected offset % instead of 24", ((cast(*void)(*instance.fromLevel)) - cast(*void)(*instance)));
    assert(size_of(type_of(EventDataPerfSettingsEXT.fromLevel)) == 4, "EventDataPerfSettingsEXT.fromLevel has unexpected size % instead of 4", size_of(type_of(EventDataPerfSettingsEXT.fromLevel)));
    assert(((cast(*void)(*instance.toLevel)) - cast(*void)(*instance)) == 28, "EventDataPerfSettingsEXT.toLevel has unexpected offset % instead of 28", ((cast(*void)(*instance.toLevel)) - cast(*void)(*instance)));
    assert(size_of(type_of(EventDataPerfSettingsEXT.toLevel)) == 4, "EventDataPerfSettingsEXT.toLevel has unexpected size % instead of 4", size_of(type_of(EventDataPerfSettingsEXT.toLevel)));
    assert(size_of(EventDataPerfSettingsEXT) == 32, "EventDataPerfSettingsEXT has size % instead of 32", size_of(EventDataPerfSettingsEXT));
}

PFN_xrPerfSettingsSetPerformanceLevelEXT :: #type (a0: Session, a1: PerfSettingsDomainEXT, a2: PerfSettingsLevelEXT) -> Result #c_call;

PFN_xrThermalGetTemperatureTrendEXT :: #type (a0: Session, a1: PerfSettingsDomainEXT, a2: *PerfSettingsNotificationLevelEXT, a3: *float, a4: *float) -> Result #c_call;

DebugUtilsMessengerEXT_T :: struct {}
DebugUtilsMessengerEXT :: *DebugUtilsMessengerEXT_T;

DebugUtilsMessageSeverityFlagsEXT :: Flags64;

// Flag bits for XrDebugUtilsMessageSeverityFlagsEXT
XR_DEBUG_UTILS_MESSAGE_SEVERITY_VERBOSE_BIT_EXT: DebugUtilsMessageSeverityFlagsEXT : 1;
XR_DEBUG_UTILS_MESSAGE_SEVERITY_INFO_BIT_EXT: DebugUtilsMessageSeverityFlagsEXT : 16;
XR_DEBUG_UTILS_MESSAGE_SEVERITY_WARNING_BIT_EXT: DebugUtilsMessageSeverityFlagsEXT : 256;
XR_DEBUG_UTILS_MESSAGE_SEVERITY_ERROR_BIT_EXT: DebugUtilsMessageSeverityFlagsEXT : 4096;

DebugUtilsMessageTypeFlagsEXT :: Flags64;

// Flag bits for XrDebugUtilsMessageTypeFlagsEXT
XR_DEBUG_UTILS_MESSAGE_TYPE_GENERAL_BIT_EXT: DebugUtilsMessageTypeFlagsEXT : 1;
XR_DEBUG_UTILS_MESSAGE_TYPE_VALIDATION_BIT_EXT: DebugUtilsMessageTypeFlagsEXT : 2;
XR_DEBUG_UTILS_MESSAGE_TYPE_PERFORMANCE_BIT_EXT: DebugUtilsMessageTypeFlagsEXT : 4;
XR_DEBUG_UTILS_MESSAGE_TYPE_CONFORMANCE_BIT_EXT: DebugUtilsMessageTypeFlagsEXT : 8;

DebugUtilsObjectNameInfoEXT :: struct {
    type:         StructureType;
    next:         *void;
    objectType:   ObjectType;
    objectHandle: u64;
    objectName:   *u8;
}
#run {
    instance: DebugUtilsObjectNameInfoEXT;
    assert(((cast(*void)(*instance.type)) - cast(*void)(*instance)) == 0, "DebugUtilsObjectNameInfoEXT.type has unexpected offset % instead of 0", ((cast(*void)(*instance.type)) - cast(*void)(*instance)));
    assert(size_of(type_of(DebugUtilsObjectNameInfoEXT.type)) == 4, "DebugUtilsObjectNameInfoEXT.type has unexpected size % instead of 4", size_of(type_of(DebugUtilsObjectNameInfoEXT.type)));
    assert(((cast(*void)(*instance.next)) - cast(*void)(*instance)) == 8, "DebugUtilsObjectNameInfoEXT.next has unexpected offset % instead of 8", ((cast(*void)(*instance.next)) - cast(*void)(*instance)));
    assert(size_of(type_of(DebugUtilsObjectNameInfoEXT.next)) == 8, "DebugUtilsObjectNameInfoEXT.next has unexpected size % instead of 8", size_of(type_of(DebugUtilsObjectNameInfoEXT.next)));
    assert(((cast(*void)(*instance.objectType)) - cast(*void)(*instance)) == 16, "DebugUtilsObjectNameInfoEXT.objectType has unexpected offset % instead of 16", ((cast(*void)(*instance.objectType)) - cast(*void)(*instance)));
    assert(size_of(type_of(DebugUtilsObjectNameInfoEXT.objectType)) == 4, "DebugUtilsObjectNameInfoEXT.objectType has unexpected size % instead of 4", size_of(type_of(DebugUtilsObjectNameInfoEXT.objectType)));
    assert(((cast(*void)(*instance.objectHandle)) - cast(*void)(*instance)) == 24, "DebugUtilsObjectNameInfoEXT.objectHandle has unexpected offset % instead of 24", ((cast(*void)(*instance.objectHandle)) - cast(*void)(*instance)));
    assert(size_of(type_of(DebugUtilsObjectNameInfoEXT.objectHandle)) == 8, "DebugUtilsObjectNameInfoEXT.objectHandle has unexpected size % instead of 8", size_of(type_of(DebugUtilsObjectNameInfoEXT.objectHandle)));
    assert(((cast(*void)(*instance.objectName)) - cast(*void)(*instance)) == 32, "DebugUtilsObjectNameInfoEXT.objectName has unexpected offset % instead of 32", ((cast(*void)(*instance.objectName)) - cast(*void)(*instance)));
    assert(size_of(type_of(DebugUtilsObjectNameInfoEXT.objectName)) == 8, "DebugUtilsObjectNameInfoEXT.objectName has unexpected size % instead of 8", size_of(type_of(DebugUtilsObjectNameInfoEXT.objectName)));
    assert(size_of(DebugUtilsObjectNameInfoEXT) == 40, "DebugUtilsObjectNameInfoEXT has size % instead of 40", size_of(DebugUtilsObjectNameInfoEXT));
}

DebugUtilsLabelEXT :: struct {
    type:      StructureType;
    next:      *void;
    labelName: *u8;
}
#run {
    instance: DebugUtilsLabelEXT;
    assert(((cast(*void)(*instance.type)) - cast(*void)(*instance)) == 0, "DebugUtilsLabelEXT.type has unexpected offset % instead of 0", ((cast(*void)(*instance.type)) - cast(*void)(*instance)));
    assert(size_of(type_of(DebugUtilsLabelEXT.type)) == 4, "DebugUtilsLabelEXT.type has unexpected size % instead of 4", size_of(type_of(DebugUtilsLabelEXT.type)));
    assert(((cast(*void)(*instance.next)) - cast(*void)(*instance)) == 8, "DebugUtilsLabelEXT.next has unexpected offset % instead of 8", ((cast(*void)(*instance.next)) - cast(*void)(*instance)));
    assert(size_of(type_of(DebugUtilsLabelEXT.next)) == 8, "DebugUtilsLabelEXT.next has unexpected size % instead of 8", size_of(type_of(DebugUtilsLabelEXT.next)));
    assert(((cast(*void)(*instance.labelName)) - cast(*void)(*instance)) == 16, "DebugUtilsLabelEXT.labelName has unexpected offset % instead of 16", ((cast(*void)(*instance.labelName)) - cast(*void)(*instance)));
    assert(size_of(type_of(DebugUtilsLabelEXT.labelName)) == 8, "DebugUtilsLabelEXT.labelName has unexpected size % instead of 8", size_of(type_of(DebugUtilsLabelEXT.labelName)));
    assert(size_of(DebugUtilsLabelEXT) == 24, "DebugUtilsLabelEXT has size % instead of 24", size_of(DebugUtilsLabelEXT));
}

DebugUtilsMessengerCallbackDataEXT :: struct {
    type:              StructureType;
    next:              *void;
    messageId:         *u8;
    functionName:      *u8;
    message:           *u8;
    objectCount:       u32;
    objects:           *DebugUtilsObjectNameInfoEXT;
    sessionLabelCount: u32;
    sessionLabels:     *DebugUtilsLabelEXT;
}
#run {
    instance: DebugUtilsMessengerCallbackDataEXT;
    assert(((cast(*void)(*instance.type)) - cast(*void)(*instance)) == 0, "DebugUtilsMessengerCallbackDataEXT.type has unexpected offset % instead of 0", ((cast(*void)(*instance.type)) - cast(*void)(*instance)));
    assert(size_of(type_of(DebugUtilsMessengerCallbackDataEXT.type)) == 4, "DebugUtilsMessengerCallbackDataEXT.type has unexpected size % instead of 4", size_of(type_of(DebugUtilsMessengerCallbackDataEXT.type)));
    assert(((cast(*void)(*instance.next)) - cast(*void)(*instance)) == 8, "DebugUtilsMessengerCallbackDataEXT.next has unexpected offset % instead of 8", ((cast(*void)(*instance.next)) - cast(*void)(*instance)));
    assert(size_of(type_of(DebugUtilsMessengerCallbackDataEXT.next)) == 8, "DebugUtilsMessengerCallbackDataEXT.next has unexpected size % instead of 8", size_of(type_of(DebugUtilsMessengerCallbackDataEXT.next)));
    assert(((cast(*void)(*instance.messageId)) - cast(*void)(*instance)) == 16, "DebugUtilsMessengerCallbackDataEXT.messageId has unexpected offset % instead of 16", ((cast(*void)(*instance.messageId)) - cast(*void)(*instance)));
    assert(size_of(type_of(DebugUtilsMessengerCallbackDataEXT.messageId)) == 8, "DebugUtilsMessengerCallbackDataEXT.messageId has unexpected size % instead of 8", size_of(type_of(DebugUtilsMessengerCallbackDataEXT.messageId)));
    assert(((cast(*void)(*instance.functionName)) - cast(*void)(*instance)) == 24, "DebugUtilsMessengerCallbackDataEXT.functionName has unexpected offset % instead of 24", ((cast(*void)(*instance.functionName)) - cast(*void)(*instance)));
    assert(size_of(type_of(DebugUtilsMessengerCallbackDataEXT.functionName)) == 8, "DebugUtilsMessengerCallbackDataEXT.functionName has unexpected size % instead of 8", size_of(type_of(DebugUtilsMessengerCallbackDataEXT.functionName)));
    assert(((cast(*void)(*instance.message)) - cast(*void)(*instance)) == 32, "DebugUtilsMessengerCallbackDataEXT.message has unexpected offset % instead of 32", ((cast(*void)(*instance.message)) - cast(*void)(*instance)));
    assert(size_of(type_of(DebugUtilsMessengerCallbackDataEXT.message)) == 8, "DebugUtilsMessengerCallbackDataEXT.message has unexpected size % instead of 8", size_of(type_of(DebugUtilsMessengerCallbackDataEXT.message)));
    assert(((cast(*void)(*instance.objectCount)) - cast(*void)(*instance)) == 40, "DebugUtilsMessengerCallbackDataEXT.objectCount has unexpected offset % instead of 40", ((cast(*void)(*instance.objectCount)) - cast(*void)(*instance)));
    assert(size_of(type_of(DebugUtilsMessengerCallbackDataEXT.objectCount)) == 4, "DebugUtilsMessengerCallbackDataEXT.objectCount has unexpected size % instead of 4", size_of(type_of(DebugUtilsMessengerCallbackDataEXT.objectCount)));
    assert(((cast(*void)(*instance.objects)) - cast(*void)(*instance)) == 48, "DebugUtilsMessengerCallbackDataEXT.objects has unexpected offset % instead of 48", ((cast(*void)(*instance.objects)) - cast(*void)(*instance)));
    assert(size_of(type_of(DebugUtilsMessengerCallbackDataEXT.objects)) == 8, "DebugUtilsMessengerCallbackDataEXT.objects has unexpected size % instead of 8", size_of(type_of(DebugUtilsMessengerCallbackDataEXT.objects)));
    assert(((cast(*void)(*instance.sessionLabelCount)) - cast(*void)(*instance)) == 56, "DebugUtilsMessengerCallbackDataEXT.sessionLabelCount has unexpected offset % instead of 56", ((cast(*void)(*instance.sessionLabelCount)) - cast(*void)(*instance)));
    assert(size_of(type_of(DebugUtilsMessengerCallbackDataEXT.sessionLabelCount)) == 4, "DebugUtilsMessengerCallbackDataEXT.sessionLabelCount has unexpected size % instead of 4", size_of(type_of(DebugUtilsMessengerCallbackDataEXT.sessionLabelCount)));
    assert(((cast(*void)(*instance.sessionLabels)) - cast(*void)(*instance)) == 64, "DebugUtilsMessengerCallbackDataEXT.sessionLabels has unexpected offset % instead of 64", ((cast(*void)(*instance.sessionLabels)) - cast(*void)(*instance)));
    assert(size_of(type_of(DebugUtilsMessengerCallbackDataEXT.sessionLabels)) == 8, "DebugUtilsMessengerCallbackDataEXT.sessionLabels has unexpected size % instead of 8", size_of(type_of(DebugUtilsMessengerCallbackDataEXT.sessionLabels)));
    assert(size_of(DebugUtilsMessengerCallbackDataEXT) == 72, "DebugUtilsMessengerCallbackDataEXT has size % instead of 72", size_of(DebugUtilsMessengerCallbackDataEXT));
}

PFN_xrDebugUtilsMessengerCallbackEXT :: #type (a0: DebugUtilsMessageSeverityFlagsEXT, a1: DebugUtilsMessageTypeFlagsEXT, a2: *DebugUtilsMessengerCallbackDataEXT, a3: *void) -> Bool32 #c_call;

// XrDebugUtilsMessengerCreateInfoEXT extends XrInstanceCreateInfo
DebugUtilsMessengerCreateInfoEXT :: struct {
    type:              StructureType;
    next:              *void;
    messageSeverities: DebugUtilsMessageSeverityFlagsEXT;
    messageTypes:      DebugUtilsMessageTypeFlagsEXT;
    userCallback:      PFN_xrDebugUtilsMessengerCallbackEXT;
    userData:          *void;
}
#run {
    instance: DebugUtilsMessengerCreateInfoEXT;
    assert(((cast(*void)(*instance.type)) - cast(*void)(*instance)) == 0, "DebugUtilsMessengerCreateInfoEXT.type has unexpected offset % instead of 0", ((cast(*void)(*instance.type)) - cast(*void)(*instance)));
    assert(size_of(type_of(DebugUtilsMessengerCreateInfoEXT.type)) == 4, "DebugUtilsMessengerCreateInfoEXT.type has unexpected size % instead of 4", size_of(type_of(DebugUtilsMessengerCreateInfoEXT.type)));
    assert(((cast(*void)(*instance.next)) - cast(*void)(*instance)) == 8, "DebugUtilsMessengerCreateInfoEXT.next has unexpected offset % instead of 8", ((cast(*void)(*instance.next)) - cast(*void)(*instance)));
    assert(size_of(type_of(DebugUtilsMessengerCreateInfoEXT.next)) == 8, "DebugUtilsMessengerCreateInfoEXT.next has unexpected size % instead of 8", size_of(type_of(DebugUtilsMessengerCreateInfoEXT.next)));
    assert(((cast(*void)(*instance.messageSeverities)) - cast(*void)(*instance)) == 16, "DebugUtilsMessengerCreateInfoEXT.messageSeverities has unexpected offset % instead of 16", ((cast(*void)(*instance.messageSeverities)) - cast(*void)(*instance)));
    assert(size_of(type_of(DebugUtilsMessengerCreateInfoEXT.messageSeverities)) == 8, "DebugUtilsMessengerCreateInfoEXT.messageSeverities has unexpected size % instead of 8", size_of(type_of(DebugUtilsMessengerCreateInfoEXT.messageSeverities)));
    assert(((cast(*void)(*instance.messageTypes)) - cast(*void)(*instance)) == 24, "DebugUtilsMessengerCreateInfoEXT.messageTypes has unexpected offset % instead of 24", ((cast(*void)(*instance.messageTypes)) - cast(*void)(*instance)));
    assert(size_of(type_of(DebugUtilsMessengerCreateInfoEXT.messageTypes)) == 8, "DebugUtilsMessengerCreateInfoEXT.messageTypes has unexpected size % instead of 8", size_of(type_of(DebugUtilsMessengerCreateInfoEXT.messageTypes)));
    assert(((cast(*void)(*instance.userCallback)) - cast(*void)(*instance)) == 32, "DebugUtilsMessengerCreateInfoEXT.userCallback has unexpected offset % instead of 32", ((cast(*void)(*instance.userCallback)) - cast(*void)(*instance)));
    assert(size_of(type_of(DebugUtilsMessengerCreateInfoEXT.userCallback)) == 8, "DebugUtilsMessengerCreateInfoEXT.userCallback has unexpected size % instead of 8", size_of(type_of(DebugUtilsMessengerCreateInfoEXT.userCallback)));
    assert(((cast(*void)(*instance.userData)) - cast(*void)(*instance)) == 40, "DebugUtilsMessengerCreateInfoEXT.userData has unexpected offset % instead of 40", ((cast(*void)(*instance.userData)) - cast(*void)(*instance)));
    assert(size_of(type_of(DebugUtilsMessengerCreateInfoEXT.userData)) == 8, "DebugUtilsMessengerCreateInfoEXT.userData has unexpected size % instead of 8", size_of(type_of(DebugUtilsMessengerCreateInfoEXT.userData)));
    assert(size_of(DebugUtilsMessengerCreateInfoEXT) == 48, "DebugUtilsMessengerCreateInfoEXT has size % instead of 48", size_of(DebugUtilsMessengerCreateInfoEXT));
}

PFN_xrSetDebugUtilsObjectNameEXT :: #type (a0: Instance, a1: *DebugUtilsObjectNameInfoEXT) -> Result #c_call;
PFN_xrCreateDebugUtilsMessengerEXT :: #type (a0: Instance, a1: *DebugUtilsMessengerCreateInfoEXT, a2: *DebugUtilsMessengerEXT) -> Result #c_call;
PFN_xrDestroyDebugUtilsMessengerEXT :: #type (a0: DebugUtilsMessengerEXT) -> Result #c_call;
PFN_xrSubmitDebugUtilsMessageEXT :: #type (a0: Instance, a1: DebugUtilsMessageSeverityFlagsEXT, a2: DebugUtilsMessageTypeFlagsEXT, a3: *DebugUtilsMessengerCallbackDataEXT) -> Result #c_call;
PFN_xrSessionBeginDebugUtilsLabelRegionEXT :: #type (a0: Session, a1: *DebugUtilsLabelEXT) -> Result #c_call;
PFN_xrSessionEndDebugUtilsLabelRegionEXT :: #type (a0: Session) -> Result #c_call;
PFN_xrSessionInsertDebugUtilsLabelEXT :: #type (a0: Session, a1: *DebugUtilsLabelEXT) -> Result #c_call;

// XrSystemEyeGazeInteractionPropertiesEXT extends XrSystemProperties
SystemEyeGazeInteractionPropertiesEXT :: struct {
    type:                       StructureType;
    next:                       *void;
    supportsEyeGazeInteraction: Bool32;
}
#run {
    instance: SystemEyeGazeInteractionPropertiesEXT;
    assert(((cast(*void)(*instance.type)) - cast(*void)(*instance)) == 0, "SystemEyeGazeInteractionPropertiesEXT.type has unexpected offset % instead of 0", ((cast(*void)(*instance.type)) - cast(*void)(*instance)));
    assert(size_of(type_of(SystemEyeGazeInteractionPropertiesEXT.type)) == 4, "SystemEyeGazeInteractionPropertiesEXT.type has unexpected size % instead of 4", size_of(type_of(SystemEyeGazeInteractionPropertiesEXT.type)));
    assert(((cast(*void)(*instance.next)) - cast(*void)(*instance)) == 8, "SystemEyeGazeInteractionPropertiesEXT.next has unexpected offset % instead of 8", ((cast(*void)(*instance.next)) - cast(*void)(*instance)));
    assert(size_of(type_of(SystemEyeGazeInteractionPropertiesEXT.next)) == 8, "SystemEyeGazeInteractionPropertiesEXT.next has unexpected size % instead of 8", size_of(type_of(SystemEyeGazeInteractionPropertiesEXT.next)));
    assert(((cast(*void)(*instance.supportsEyeGazeInteraction)) - cast(*void)(*instance)) == 16, "SystemEyeGazeInteractionPropertiesEXT.supportsEyeGazeInteraction has unexpected offset % instead of 16", ((cast(*void)(*instance.supportsEyeGazeInteraction)) - cast(*void)(*instance)));
    assert(size_of(type_of(SystemEyeGazeInteractionPropertiesEXT.supportsEyeGazeInteraction)) == 4, "SystemEyeGazeInteractionPropertiesEXT.supportsEyeGazeInteraction has unexpected size % instead of 4", size_of(type_of(SystemEyeGazeInteractionPropertiesEXT.supportsEyeGazeInteraction)));
    assert(size_of(SystemEyeGazeInteractionPropertiesEXT) == 24, "SystemEyeGazeInteractionPropertiesEXT has size % instead of 24", size_of(SystemEyeGazeInteractionPropertiesEXT));
}

// XrEyeGazeSampleTimeEXT extends XrSpaceLocation
EyeGazeSampleTimeEXT :: struct {
    type: StructureType;
    next: *void;
    time: Time;
}
#run {
    instance: EyeGazeSampleTimeEXT;
    assert(((cast(*void)(*instance.type)) - cast(*void)(*instance)) == 0, "EyeGazeSampleTimeEXT.type has unexpected offset % instead of 0", ((cast(*void)(*instance.type)) - cast(*void)(*instance)));
    assert(size_of(type_of(EyeGazeSampleTimeEXT.type)) == 4, "EyeGazeSampleTimeEXT.type has unexpected size % instead of 4", size_of(type_of(EyeGazeSampleTimeEXT.type)));
    assert(((cast(*void)(*instance.next)) - cast(*void)(*instance)) == 8, "EyeGazeSampleTimeEXT.next has unexpected offset % instead of 8", ((cast(*void)(*instance.next)) - cast(*void)(*instance)));
    assert(size_of(type_of(EyeGazeSampleTimeEXT.next)) == 8, "EyeGazeSampleTimeEXT.next has unexpected size % instead of 8", size_of(type_of(EyeGazeSampleTimeEXT.next)));
    assert(((cast(*void)(*instance.time)) - cast(*void)(*instance)) == 16, "EyeGazeSampleTimeEXT.time has unexpected offset % instead of 16", ((cast(*void)(*instance.time)) - cast(*void)(*instance)));
    assert(size_of(type_of(EyeGazeSampleTimeEXT.time)) == 8, "EyeGazeSampleTimeEXT.time has unexpected size % instead of 8", size_of(type_of(EyeGazeSampleTimeEXT.time)));
    assert(size_of(EyeGazeSampleTimeEXT) == 24, "EyeGazeSampleTimeEXT has size % instead of 24", size_of(EyeGazeSampleTimeEXT));
}

OverlaySessionCreateFlagsEXTX :: Flags64;

// Flag bits for XrOverlaySessionCreateFlagsEXTX
OverlayMainSessionFlagsEXTX :: Flags64;

// Flag bits for XrOverlayMainSessionFlagsEXTX
XR_OVERLAY_MAIN_SESSION_ENABLED_COMPOSITION_LAYER_INFO_DEPTH_BIT_EXTX: OverlayMainSessionFlagsEXTX : 1;

// XrSessionCreateInfoOverlayEXTX extends XrSessionCreateInfo
SessionCreateInfoOverlayEXTX :: struct {
    type:                   StructureType;
    next:                   *void;
    createFlags:            OverlaySessionCreateFlagsEXTX;
    sessionLayersPlacement: u32;
}
#run {
    instance: SessionCreateInfoOverlayEXTX;
    assert(((cast(*void)(*instance.type)) - cast(*void)(*instance)) == 0, "SessionCreateInfoOverlayEXTX.type has unexpected offset % instead of 0", ((cast(*void)(*instance.type)) - cast(*void)(*instance)));
    assert(size_of(type_of(SessionCreateInfoOverlayEXTX.type)) == 4, "SessionCreateInfoOverlayEXTX.type has unexpected size % instead of 4", size_of(type_of(SessionCreateInfoOverlayEXTX.type)));
    assert(((cast(*void)(*instance.next)) - cast(*void)(*instance)) == 8, "SessionCreateInfoOverlayEXTX.next has unexpected offset % instead of 8", ((cast(*void)(*instance.next)) - cast(*void)(*instance)));
    assert(size_of(type_of(SessionCreateInfoOverlayEXTX.next)) == 8, "SessionCreateInfoOverlayEXTX.next has unexpected size % instead of 8", size_of(type_of(SessionCreateInfoOverlayEXTX.next)));
    assert(((cast(*void)(*instance.createFlags)) - cast(*void)(*instance)) == 16, "SessionCreateInfoOverlayEXTX.createFlags has unexpected offset % instead of 16", ((cast(*void)(*instance.createFlags)) - cast(*void)(*instance)));
    assert(size_of(type_of(SessionCreateInfoOverlayEXTX.createFlags)) == 8, "SessionCreateInfoOverlayEXTX.createFlags has unexpected size % instead of 8", size_of(type_of(SessionCreateInfoOverlayEXTX.createFlags)));
    assert(((cast(*void)(*instance.sessionLayersPlacement)) - cast(*void)(*instance)) == 24, "SessionCreateInfoOverlayEXTX.sessionLayersPlacement has unexpected offset % instead of 24", ((cast(*void)(*instance.sessionLayersPlacement)) - cast(*void)(*instance)));
    assert(size_of(type_of(SessionCreateInfoOverlayEXTX.sessionLayersPlacement)) == 4, "SessionCreateInfoOverlayEXTX.sessionLayersPlacement has unexpected size % instead of 4", size_of(type_of(SessionCreateInfoOverlayEXTX.sessionLayersPlacement)));
    assert(size_of(SessionCreateInfoOverlayEXTX) == 32, "SessionCreateInfoOverlayEXTX has size % instead of 32", size_of(SessionCreateInfoOverlayEXTX));
}

EventDataMainSessionVisibilityChangedEXTX :: struct {
    type:    StructureType;
    next:    *void;
    visible: Bool32;
    flags:   OverlayMainSessionFlagsEXTX;
}
#run {
    instance: EventDataMainSessionVisibilityChangedEXTX;
    assert(((cast(*void)(*instance.type)) - cast(*void)(*instance)) == 0, "EventDataMainSessionVisibilityChangedEXTX.type has unexpected offset % instead of 0", ((cast(*void)(*instance.type)) - cast(*void)(*instance)));
    assert(size_of(type_of(EventDataMainSessionVisibilityChangedEXTX.type)) == 4, "EventDataMainSessionVisibilityChangedEXTX.type has unexpected size % instead of 4", size_of(type_of(EventDataMainSessionVisibilityChangedEXTX.type)));
    assert(((cast(*void)(*instance.next)) - cast(*void)(*instance)) == 8, "EventDataMainSessionVisibilityChangedEXTX.next has unexpected offset % instead of 8", ((cast(*void)(*instance.next)) - cast(*void)(*instance)));
    assert(size_of(type_of(EventDataMainSessionVisibilityChangedEXTX.next)) == 8, "EventDataMainSessionVisibilityChangedEXTX.next has unexpected size % instead of 8", size_of(type_of(EventDataMainSessionVisibilityChangedEXTX.next)));
    assert(((cast(*void)(*instance.visible)) - cast(*void)(*instance)) == 16, "EventDataMainSessionVisibilityChangedEXTX.visible has unexpected offset % instead of 16", ((cast(*void)(*instance.visible)) - cast(*void)(*instance)));
    assert(size_of(type_of(EventDataMainSessionVisibilityChangedEXTX.visible)) == 4, "EventDataMainSessionVisibilityChangedEXTX.visible has unexpected size % instead of 4", size_of(type_of(EventDataMainSessionVisibilityChangedEXTX.visible)));
    assert(((cast(*void)(*instance.flags)) - cast(*void)(*instance)) == 24, "EventDataMainSessionVisibilityChangedEXTX.flags has unexpected offset % instead of 24", ((cast(*void)(*instance.flags)) - cast(*void)(*instance)));
    assert(size_of(type_of(EventDataMainSessionVisibilityChangedEXTX.flags)) == 8, "EventDataMainSessionVisibilityChangedEXTX.flags has unexpected size % instead of 8", size_of(type_of(EventDataMainSessionVisibilityChangedEXTX.flags)));
    assert(size_of(EventDataMainSessionVisibilityChangedEXTX) == 32, "EventDataMainSessionVisibilityChangedEXTX has size % instead of 32", size_of(EventDataMainSessionVisibilityChangedEXTX));
}

SpatialAnchorMSFT_T :: struct {}
SpatialAnchorMSFT :: *SpatialAnchorMSFT_T;

SpatialAnchorCreateInfoMSFT :: struct {
    type:  StructureType;
    next:  *void;
    space: Space;
    pose:  Posef;
    time:  Time;
}
#run {
    instance: SpatialAnchorCreateInfoMSFT;
    assert(((cast(*void)(*instance.type)) - cast(*void)(*instance)) == 0, "SpatialAnchorCreateInfoMSFT.type has unexpected offset % instead of 0", ((cast(*void)(*instance.type)) - cast(*void)(*instance)));
    assert(size_of(type_of(SpatialAnchorCreateInfoMSFT.type)) == 4, "SpatialAnchorCreateInfoMSFT.type has unexpected size % instead of 4", size_of(type_of(SpatialAnchorCreateInfoMSFT.type)));
    assert(((cast(*void)(*instance.next)) - cast(*void)(*instance)) == 8, "SpatialAnchorCreateInfoMSFT.next has unexpected offset % instead of 8", ((cast(*void)(*instance.next)) - cast(*void)(*instance)));
    assert(size_of(type_of(SpatialAnchorCreateInfoMSFT.next)) == 8, "SpatialAnchorCreateInfoMSFT.next has unexpected size % instead of 8", size_of(type_of(SpatialAnchorCreateInfoMSFT.next)));
    assert(((cast(*void)(*instance.space)) - cast(*void)(*instance)) == 16, "SpatialAnchorCreateInfoMSFT.space has unexpected offset % instead of 16", ((cast(*void)(*instance.space)) - cast(*void)(*instance)));
    assert(size_of(type_of(SpatialAnchorCreateInfoMSFT.space)) == 8, "SpatialAnchorCreateInfoMSFT.space has unexpected size % instead of 8", size_of(type_of(SpatialAnchorCreateInfoMSFT.space)));
    assert(((cast(*void)(*instance.pose)) - cast(*void)(*instance)) == 24, "SpatialAnchorCreateInfoMSFT.pose has unexpected offset % instead of 24", ((cast(*void)(*instance.pose)) - cast(*void)(*instance)));
    assert(size_of(type_of(SpatialAnchorCreateInfoMSFT.pose)) == 28, "SpatialAnchorCreateInfoMSFT.pose has unexpected size % instead of 28", size_of(type_of(SpatialAnchorCreateInfoMSFT.pose)));
    assert(((cast(*void)(*instance.time)) - cast(*void)(*instance)) == 56, "SpatialAnchorCreateInfoMSFT.time has unexpected offset % instead of 56", ((cast(*void)(*instance.time)) - cast(*void)(*instance)));
    assert(size_of(type_of(SpatialAnchorCreateInfoMSFT.time)) == 8, "SpatialAnchorCreateInfoMSFT.time has unexpected size % instead of 8", size_of(type_of(SpatialAnchorCreateInfoMSFT.time)));
    assert(size_of(SpatialAnchorCreateInfoMSFT) == 64, "SpatialAnchorCreateInfoMSFT has size % instead of 64", size_of(SpatialAnchorCreateInfoMSFT));
}

SpatialAnchorSpaceCreateInfoMSFT :: struct {
    type:              StructureType;
    next:              *void;
    anchor:            SpatialAnchorMSFT;
    poseInAnchorSpace: Posef;
}
#run {
    instance: SpatialAnchorSpaceCreateInfoMSFT;
    assert(((cast(*void)(*instance.type)) - cast(*void)(*instance)) == 0, "SpatialAnchorSpaceCreateInfoMSFT.type has unexpected offset % instead of 0", ((cast(*void)(*instance.type)) - cast(*void)(*instance)));
    assert(size_of(type_of(SpatialAnchorSpaceCreateInfoMSFT.type)) == 4, "SpatialAnchorSpaceCreateInfoMSFT.type has unexpected size % instead of 4", size_of(type_of(SpatialAnchorSpaceCreateInfoMSFT.type)));
    assert(((cast(*void)(*instance.next)) - cast(*void)(*instance)) == 8, "SpatialAnchorSpaceCreateInfoMSFT.next has unexpected offset % instead of 8", ((cast(*void)(*instance.next)) - cast(*void)(*instance)));
    assert(size_of(type_of(SpatialAnchorSpaceCreateInfoMSFT.next)) == 8, "SpatialAnchorSpaceCreateInfoMSFT.next has unexpected size % instead of 8", size_of(type_of(SpatialAnchorSpaceCreateInfoMSFT.next)));
    assert(((cast(*void)(*instance.anchor)) - cast(*void)(*instance)) == 16, "SpatialAnchorSpaceCreateInfoMSFT.anchor has unexpected offset % instead of 16", ((cast(*void)(*instance.anchor)) - cast(*void)(*instance)));
    assert(size_of(type_of(SpatialAnchorSpaceCreateInfoMSFT.anchor)) == 8, "SpatialAnchorSpaceCreateInfoMSFT.anchor has unexpected size % instead of 8", size_of(type_of(SpatialAnchorSpaceCreateInfoMSFT.anchor)));
    assert(((cast(*void)(*instance.poseInAnchorSpace)) - cast(*void)(*instance)) == 24, "SpatialAnchorSpaceCreateInfoMSFT.poseInAnchorSpace has unexpected offset % instead of 24", ((cast(*void)(*instance.poseInAnchorSpace)) - cast(*void)(*instance)));
    assert(size_of(type_of(SpatialAnchorSpaceCreateInfoMSFT.poseInAnchorSpace)) == 28, "SpatialAnchorSpaceCreateInfoMSFT.poseInAnchorSpace has unexpected size % instead of 28", size_of(type_of(SpatialAnchorSpaceCreateInfoMSFT.poseInAnchorSpace)));
    assert(size_of(SpatialAnchorSpaceCreateInfoMSFT) == 56, "SpatialAnchorSpaceCreateInfoMSFT has size % instead of 56", size_of(SpatialAnchorSpaceCreateInfoMSFT));
}

PFN_xrCreateSpatialAnchorMSFT :: #type (a0: Session, a1: *SpatialAnchorCreateInfoMSFT, a2: *SpatialAnchorMSFT) -> Result #c_call;
PFN_xrCreateSpatialAnchorSpaceMSFT :: #type (a0: Session, a1: *SpatialAnchorSpaceCreateInfoMSFT, a2: *Space) -> Result #c_call;
PFN_xrDestroySpatialAnchorMSFT :: #type (a0: SpatialAnchorMSFT) -> Result #c_call;

CompositionLayerImageLayoutFlagsFB :: Flags64;

// Flag bits for XrCompositionLayerImageLayoutFlagsFB
XR_COMPOSITION_LAYER_IMAGE_LAYOUT_VERTICAL_FLIP_BIT_FB: CompositionLayerImageLayoutFlagsFB : 1;

// XrCompositionLayerImageLayoutFB extends XrCompositionLayerBaseHeader
CompositionLayerImageLayoutFB :: struct {
    type:  StructureType;
    next:  *void;
    flags: CompositionLayerImageLayoutFlagsFB;
}
#run {
    instance: CompositionLayerImageLayoutFB;
    assert(((cast(*void)(*instance.type)) - cast(*void)(*instance)) == 0, "CompositionLayerImageLayoutFB.type has unexpected offset % instead of 0", ((cast(*void)(*instance.type)) - cast(*void)(*instance)));
    assert(size_of(type_of(CompositionLayerImageLayoutFB.type)) == 4, "CompositionLayerImageLayoutFB.type has unexpected size % instead of 4", size_of(type_of(CompositionLayerImageLayoutFB.type)));
    assert(((cast(*void)(*instance.next)) - cast(*void)(*instance)) == 8, "CompositionLayerImageLayoutFB.next has unexpected offset % instead of 8", ((cast(*void)(*instance.next)) - cast(*void)(*instance)));
    assert(size_of(type_of(CompositionLayerImageLayoutFB.next)) == 8, "CompositionLayerImageLayoutFB.next has unexpected size % instead of 8", size_of(type_of(CompositionLayerImageLayoutFB.next)));
    assert(((cast(*void)(*instance.flags)) - cast(*void)(*instance)) == 16, "CompositionLayerImageLayoutFB.flags has unexpected offset % instead of 16", ((cast(*void)(*instance.flags)) - cast(*void)(*instance)));
    assert(size_of(type_of(CompositionLayerImageLayoutFB.flags)) == 8, "CompositionLayerImageLayoutFB.flags has unexpected size % instead of 8", size_of(type_of(CompositionLayerImageLayoutFB.flags)));
    assert(size_of(CompositionLayerImageLayoutFB) == 24, "CompositionLayerImageLayoutFB has size % instead of 24", size_of(CompositionLayerImageLayoutFB));
}

BlendFactorFB :: enum s32 {
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
CompositionLayerAlphaBlendFB :: struct {
    type:           StructureType;
    next:           *void;
    srcFactorColor: BlendFactorFB;
    dstFactorColor: BlendFactorFB;
    srcFactorAlpha: BlendFactorFB;
    dstFactorAlpha: BlendFactorFB;
}
#run {
    instance: CompositionLayerAlphaBlendFB;
    assert(((cast(*void)(*instance.type)) - cast(*void)(*instance)) == 0, "CompositionLayerAlphaBlendFB.type has unexpected offset % instead of 0", ((cast(*void)(*instance.type)) - cast(*void)(*instance)));
    assert(size_of(type_of(CompositionLayerAlphaBlendFB.type)) == 4, "CompositionLayerAlphaBlendFB.type has unexpected size % instead of 4", size_of(type_of(CompositionLayerAlphaBlendFB.type)));
    assert(((cast(*void)(*instance.next)) - cast(*void)(*instance)) == 8, "CompositionLayerAlphaBlendFB.next has unexpected offset % instead of 8", ((cast(*void)(*instance.next)) - cast(*void)(*instance)));
    assert(size_of(type_of(CompositionLayerAlphaBlendFB.next)) == 8, "CompositionLayerAlphaBlendFB.next has unexpected size % instead of 8", size_of(type_of(CompositionLayerAlphaBlendFB.next)));
    assert(((cast(*void)(*instance.srcFactorColor)) - cast(*void)(*instance)) == 16, "CompositionLayerAlphaBlendFB.srcFactorColor has unexpected offset % instead of 16", ((cast(*void)(*instance.srcFactorColor)) - cast(*void)(*instance)));
    assert(size_of(type_of(CompositionLayerAlphaBlendFB.srcFactorColor)) == 4, "CompositionLayerAlphaBlendFB.srcFactorColor has unexpected size % instead of 4", size_of(type_of(CompositionLayerAlphaBlendFB.srcFactorColor)));
    assert(((cast(*void)(*instance.dstFactorColor)) - cast(*void)(*instance)) == 20, "CompositionLayerAlphaBlendFB.dstFactorColor has unexpected offset % instead of 20", ((cast(*void)(*instance.dstFactorColor)) - cast(*void)(*instance)));
    assert(size_of(type_of(CompositionLayerAlphaBlendFB.dstFactorColor)) == 4, "CompositionLayerAlphaBlendFB.dstFactorColor has unexpected size % instead of 4", size_of(type_of(CompositionLayerAlphaBlendFB.dstFactorColor)));
    assert(((cast(*void)(*instance.srcFactorAlpha)) - cast(*void)(*instance)) == 24, "CompositionLayerAlphaBlendFB.srcFactorAlpha has unexpected offset % instead of 24", ((cast(*void)(*instance.srcFactorAlpha)) - cast(*void)(*instance)));
    assert(size_of(type_of(CompositionLayerAlphaBlendFB.srcFactorAlpha)) == 4, "CompositionLayerAlphaBlendFB.srcFactorAlpha has unexpected size % instead of 4", size_of(type_of(CompositionLayerAlphaBlendFB.srcFactorAlpha)));
    assert(((cast(*void)(*instance.dstFactorAlpha)) - cast(*void)(*instance)) == 28, "CompositionLayerAlphaBlendFB.dstFactorAlpha has unexpected offset % instead of 28", ((cast(*void)(*instance.dstFactorAlpha)) - cast(*void)(*instance)));
    assert(size_of(type_of(CompositionLayerAlphaBlendFB.dstFactorAlpha)) == 4, "CompositionLayerAlphaBlendFB.dstFactorAlpha has unexpected size % instead of 4", size_of(type_of(CompositionLayerAlphaBlendFB.dstFactorAlpha)));
    assert(size_of(CompositionLayerAlphaBlendFB) == 32, "CompositionLayerAlphaBlendFB has size % instead of 32", size_of(CompositionLayerAlphaBlendFB));
}

// XrViewConfigurationDepthRangeEXT extends XrViewConfigurationView
ViewConfigurationDepthRangeEXT :: struct {
    type:             StructureType;
    next:             *void;
    recommendedNearZ: float;
    minNearZ:         float;
    recommendedFarZ:  float;
    maxFarZ:          float;
}
#run {
    instance: ViewConfigurationDepthRangeEXT;
    assert(((cast(*void)(*instance.type)) - cast(*void)(*instance)) == 0, "ViewConfigurationDepthRangeEXT.type has unexpected offset % instead of 0", ((cast(*void)(*instance.type)) - cast(*void)(*instance)));
    assert(size_of(type_of(ViewConfigurationDepthRangeEXT.type)) == 4, "ViewConfigurationDepthRangeEXT.type has unexpected size % instead of 4", size_of(type_of(ViewConfigurationDepthRangeEXT.type)));
    assert(((cast(*void)(*instance.next)) - cast(*void)(*instance)) == 8, "ViewConfigurationDepthRangeEXT.next has unexpected offset % instead of 8", ((cast(*void)(*instance.next)) - cast(*void)(*instance)));
    assert(size_of(type_of(ViewConfigurationDepthRangeEXT.next)) == 8, "ViewConfigurationDepthRangeEXT.next has unexpected size % instead of 8", size_of(type_of(ViewConfigurationDepthRangeEXT.next)));
    assert(((cast(*void)(*instance.recommendedNearZ)) - cast(*void)(*instance)) == 16, "ViewConfigurationDepthRangeEXT.recommendedNearZ has unexpected offset % instead of 16", ((cast(*void)(*instance.recommendedNearZ)) - cast(*void)(*instance)));
    assert(size_of(type_of(ViewConfigurationDepthRangeEXT.recommendedNearZ)) == 4, "ViewConfigurationDepthRangeEXT.recommendedNearZ has unexpected size % instead of 4", size_of(type_of(ViewConfigurationDepthRangeEXT.recommendedNearZ)));
    assert(((cast(*void)(*instance.minNearZ)) - cast(*void)(*instance)) == 20, "ViewConfigurationDepthRangeEXT.minNearZ has unexpected offset % instead of 20", ((cast(*void)(*instance.minNearZ)) - cast(*void)(*instance)));
    assert(size_of(type_of(ViewConfigurationDepthRangeEXT.minNearZ)) == 4, "ViewConfigurationDepthRangeEXT.minNearZ has unexpected size % instead of 4", size_of(type_of(ViewConfigurationDepthRangeEXT.minNearZ)));
    assert(((cast(*void)(*instance.recommendedFarZ)) - cast(*void)(*instance)) == 24, "ViewConfigurationDepthRangeEXT.recommendedFarZ has unexpected offset % instead of 24", ((cast(*void)(*instance.recommendedFarZ)) - cast(*void)(*instance)));
    assert(size_of(type_of(ViewConfigurationDepthRangeEXT.recommendedFarZ)) == 4, "ViewConfigurationDepthRangeEXT.recommendedFarZ has unexpected size % instead of 4", size_of(type_of(ViewConfigurationDepthRangeEXT.recommendedFarZ)));
    assert(((cast(*void)(*instance.maxFarZ)) - cast(*void)(*instance)) == 28, "ViewConfigurationDepthRangeEXT.maxFarZ has unexpected offset % instead of 28", ((cast(*void)(*instance.maxFarZ)) - cast(*void)(*instance)));
    assert(size_of(type_of(ViewConfigurationDepthRangeEXT.maxFarZ)) == 4, "ViewConfigurationDepthRangeEXT.maxFarZ has unexpected size % instead of 4", size_of(type_of(ViewConfigurationDepthRangeEXT.maxFarZ)));
    assert(size_of(ViewConfigurationDepthRangeEXT) == 32, "ViewConfigurationDepthRangeEXT has size % instead of 32", size_of(ViewConfigurationDepthRangeEXT));
}

PFN_xrSetInputDeviceActiveEXT :: #type (a0: Session, a1: Path, a2: Path, a3: Bool32) -> Result #c_call;
PFN_xrSetInputDeviceStateBoolEXT :: #type (a0: Session, a1: Path, a2: Path, a3: Bool32) -> Result #c_call;
PFN_xrSetInputDeviceStateFloatEXT :: #type (a0: Session, a1: Path, a2: Path, a3: float) -> Result #c_call;
PFN_xrSetInputDeviceStateVector2fEXT :: #type (a0: Session, a1: Path, a2: Path, a3: Vector2f) -> Result #c_call;
PFN_xrSetInputDeviceLocationEXT :: #type (a0: Session, a1: Path, a2: Path, a3: Space, a4: Posef) -> Result #c_call;

SpatialGraphNodeBindingMSFT_T :: struct {}
SpatialGraphNodeBindingMSFT :: *SpatialGraphNodeBindingMSFT_T;

SpatialGraphNodeTypeMSFT :: enum s32 {
    STATIC_MSFT   :: 1;
    DYNAMIC_MSFT  :: 2;
    MAX_ENUM_MSFT :: 2147483647;

    XR_SPATIAL_GRAPH_NODE_TYPE_STATIC_MSFT   :: STATIC_MSFT;
    XR_SPATIAL_GRAPH_NODE_TYPE_DYNAMIC_MSFT  :: DYNAMIC_MSFT;
    XR_SPATIAL_GRAPH_NODE_TYPE_MAX_ENUM_MSFT :: MAX_ENUM_MSFT;
}

SpatialGraphNodeSpaceCreateInfoMSFT :: struct {
    type:     StructureType;
    next:     *void;
    nodeType: SpatialGraphNodeTypeMSFT;
    nodeId:   [16] u8;
    pose:     Posef;
}
#run {
    instance: SpatialGraphNodeSpaceCreateInfoMSFT;
    assert(((cast(*void)(*instance.type)) - cast(*void)(*instance)) == 0, "SpatialGraphNodeSpaceCreateInfoMSFT.type has unexpected offset % instead of 0", ((cast(*void)(*instance.type)) - cast(*void)(*instance)));
    assert(size_of(type_of(SpatialGraphNodeSpaceCreateInfoMSFT.type)) == 4, "SpatialGraphNodeSpaceCreateInfoMSFT.type has unexpected size % instead of 4", size_of(type_of(SpatialGraphNodeSpaceCreateInfoMSFT.type)));
    assert(((cast(*void)(*instance.next)) - cast(*void)(*instance)) == 8, "SpatialGraphNodeSpaceCreateInfoMSFT.next has unexpected offset % instead of 8", ((cast(*void)(*instance.next)) - cast(*void)(*instance)));
    assert(size_of(type_of(SpatialGraphNodeSpaceCreateInfoMSFT.next)) == 8, "SpatialGraphNodeSpaceCreateInfoMSFT.next has unexpected size % instead of 8", size_of(type_of(SpatialGraphNodeSpaceCreateInfoMSFT.next)));
    assert(((cast(*void)(*instance.nodeType)) - cast(*void)(*instance)) == 16, "SpatialGraphNodeSpaceCreateInfoMSFT.nodeType has unexpected offset % instead of 16", ((cast(*void)(*instance.nodeType)) - cast(*void)(*instance)));
    assert(size_of(type_of(SpatialGraphNodeSpaceCreateInfoMSFT.nodeType)) == 4, "SpatialGraphNodeSpaceCreateInfoMSFT.nodeType has unexpected size % instead of 4", size_of(type_of(SpatialGraphNodeSpaceCreateInfoMSFT.nodeType)));
    assert(((cast(*void)(*instance.nodeId)) - cast(*void)(*instance)) == 20, "SpatialGraphNodeSpaceCreateInfoMSFT.nodeId has unexpected offset % instead of 20", ((cast(*void)(*instance.nodeId)) - cast(*void)(*instance)));
    assert(size_of(type_of(SpatialGraphNodeSpaceCreateInfoMSFT.nodeId)) == 16, "SpatialGraphNodeSpaceCreateInfoMSFT.nodeId has unexpected size % instead of 16", size_of(type_of(SpatialGraphNodeSpaceCreateInfoMSFT.nodeId)));
    assert(((cast(*void)(*instance.pose)) - cast(*void)(*instance)) == 36, "SpatialGraphNodeSpaceCreateInfoMSFT.pose has unexpected offset % instead of 36", ((cast(*void)(*instance.pose)) - cast(*void)(*instance)));
    assert(size_of(type_of(SpatialGraphNodeSpaceCreateInfoMSFT.pose)) == 28, "SpatialGraphNodeSpaceCreateInfoMSFT.pose has unexpected size % instead of 28", size_of(type_of(SpatialGraphNodeSpaceCreateInfoMSFT.pose)));
    assert(size_of(SpatialGraphNodeSpaceCreateInfoMSFT) == 64, "SpatialGraphNodeSpaceCreateInfoMSFT has size % instead of 64", size_of(SpatialGraphNodeSpaceCreateInfoMSFT));
}

SpatialGraphStaticNodeBindingCreateInfoMSFT :: struct {
    type:        StructureType;
    next:        *void;
    space:       Space;
    poseInSpace: Posef;
    time:        Time;
}
#run {
    instance: SpatialGraphStaticNodeBindingCreateInfoMSFT;
    assert(((cast(*void)(*instance.type)) - cast(*void)(*instance)) == 0, "SpatialGraphStaticNodeBindingCreateInfoMSFT.type has unexpected offset % instead of 0", ((cast(*void)(*instance.type)) - cast(*void)(*instance)));
    assert(size_of(type_of(SpatialGraphStaticNodeBindingCreateInfoMSFT.type)) == 4, "SpatialGraphStaticNodeBindingCreateInfoMSFT.type has unexpected size % instead of 4", size_of(type_of(SpatialGraphStaticNodeBindingCreateInfoMSFT.type)));
    assert(((cast(*void)(*instance.next)) - cast(*void)(*instance)) == 8, "SpatialGraphStaticNodeBindingCreateInfoMSFT.next has unexpected offset % instead of 8", ((cast(*void)(*instance.next)) - cast(*void)(*instance)));
    assert(size_of(type_of(SpatialGraphStaticNodeBindingCreateInfoMSFT.next)) == 8, "SpatialGraphStaticNodeBindingCreateInfoMSFT.next has unexpected size % instead of 8", size_of(type_of(SpatialGraphStaticNodeBindingCreateInfoMSFT.next)));
    assert(((cast(*void)(*instance.space)) - cast(*void)(*instance)) == 16, "SpatialGraphStaticNodeBindingCreateInfoMSFT.space has unexpected offset % instead of 16", ((cast(*void)(*instance.space)) - cast(*void)(*instance)));
    assert(size_of(type_of(SpatialGraphStaticNodeBindingCreateInfoMSFT.space)) == 8, "SpatialGraphStaticNodeBindingCreateInfoMSFT.space has unexpected size % instead of 8", size_of(type_of(SpatialGraphStaticNodeBindingCreateInfoMSFT.space)));
    assert(((cast(*void)(*instance.poseInSpace)) - cast(*void)(*instance)) == 24, "SpatialGraphStaticNodeBindingCreateInfoMSFT.poseInSpace has unexpected offset % instead of 24", ((cast(*void)(*instance.poseInSpace)) - cast(*void)(*instance)));
    assert(size_of(type_of(SpatialGraphStaticNodeBindingCreateInfoMSFT.poseInSpace)) == 28, "SpatialGraphStaticNodeBindingCreateInfoMSFT.poseInSpace has unexpected size % instead of 28", size_of(type_of(SpatialGraphStaticNodeBindingCreateInfoMSFT.poseInSpace)));
    assert(((cast(*void)(*instance.time)) - cast(*void)(*instance)) == 56, "SpatialGraphStaticNodeBindingCreateInfoMSFT.time has unexpected offset % instead of 56", ((cast(*void)(*instance.time)) - cast(*void)(*instance)));
    assert(size_of(type_of(SpatialGraphStaticNodeBindingCreateInfoMSFT.time)) == 8, "SpatialGraphStaticNodeBindingCreateInfoMSFT.time has unexpected size % instead of 8", size_of(type_of(SpatialGraphStaticNodeBindingCreateInfoMSFT.time)));
    assert(size_of(SpatialGraphStaticNodeBindingCreateInfoMSFT) == 64, "SpatialGraphStaticNodeBindingCreateInfoMSFT has size % instead of 64", size_of(SpatialGraphStaticNodeBindingCreateInfoMSFT));
}

SpatialGraphNodeBindingPropertiesGetInfoMSFT :: struct {
    type: StructureType;
    next: *void;
}
#run {
    instance: SpatialGraphNodeBindingPropertiesGetInfoMSFT;
    assert(((cast(*void)(*instance.type)) - cast(*void)(*instance)) == 0, "SpatialGraphNodeBindingPropertiesGetInfoMSFT.type has unexpected offset % instead of 0", ((cast(*void)(*instance.type)) - cast(*void)(*instance)));
    assert(size_of(type_of(SpatialGraphNodeBindingPropertiesGetInfoMSFT.type)) == 4, "SpatialGraphNodeBindingPropertiesGetInfoMSFT.type has unexpected size % instead of 4", size_of(type_of(SpatialGraphNodeBindingPropertiesGetInfoMSFT.type)));
    assert(((cast(*void)(*instance.next)) - cast(*void)(*instance)) == 8, "SpatialGraphNodeBindingPropertiesGetInfoMSFT.next has unexpected offset % instead of 8", ((cast(*void)(*instance.next)) - cast(*void)(*instance)));
    assert(size_of(type_of(SpatialGraphNodeBindingPropertiesGetInfoMSFT.next)) == 8, "SpatialGraphNodeBindingPropertiesGetInfoMSFT.next has unexpected size % instead of 8", size_of(type_of(SpatialGraphNodeBindingPropertiesGetInfoMSFT.next)));
    assert(size_of(SpatialGraphNodeBindingPropertiesGetInfoMSFT) == 16, "SpatialGraphNodeBindingPropertiesGetInfoMSFT has size % instead of 16", size_of(SpatialGraphNodeBindingPropertiesGetInfoMSFT));
}

SpatialGraphNodeBindingPropertiesMSFT :: struct {
    type:            StructureType;
    next:            *void;
    nodeId:          [16] u8;
    poseInNodeSpace: Posef;
}
#run {
    instance: SpatialGraphNodeBindingPropertiesMSFT;
    assert(((cast(*void)(*instance.type)) - cast(*void)(*instance)) == 0, "SpatialGraphNodeBindingPropertiesMSFT.type has unexpected offset % instead of 0", ((cast(*void)(*instance.type)) - cast(*void)(*instance)));
    assert(size_of(type_of(SpatialGraphNodeBindingPropertiesMSFT.type)) == 4, "SpatialGraphNodeBindingPropertiesMSFT.type has unexpected size % instead of 4", size_of(type_of(SpatialGraphNodeBindingPropertiesMSFT.type)));
    assert(((cast(*void)(*instance.next)) - cast(*void)(*instance)) == 8, "SpatialGraphNodeBindingPropertiesMSFT.next has unexpected offset % instead of 8", ((cast(*void)(*instance.next)) - cast(*void)(*instance)));
    assert(size_of(type_of(SpatialGraphNodeBindingPropertiesMSFT.next)) == 8, "SpatialGraphNodeBindingPropertiesMSFT.next has unexpected size % instead of 8", size_of(type_of(SpatialGraphNodeBindingPropertiesMSFT.next)));
    assert(((cast(*void)(*instance.nodeId)) - cast(*void)(*instance)) == 16, "SpatialGraphNodeBindingPropertiesMSFT.nodeId has unexpected offset % instead of 16", ((cast(*void)(*instance.nodeId)) - cast(*void)(*instance)));
    assert(size_of(type_of(SpatialGraphNodeBindingPropertiesMSFT.nodeId)) == 16, "SpatialGraphNodeBindingPropertiesMSFT.nodeId has unexpected size % instead of 16", size_of(type_of(SpatialGraphNodeBindingPropertiesMSFT.nodeId)));
    assert(((cast(*void)(*instance.poseInNodeSpace)) - cast(*void)(*instance)) == 32, "SpatialGraphNodeBindingPropertiesMSFT.poseInNodeSpace has unexpected offset % instead of 32", ((cast(*void)(*instance.poseInNodeSpace)) - cast(*void)(*instance)));
    assert(size_of(type_of(SpatialGraphNodeBindingPropertiesMSFT.poseInNodeSpace)) == 28, "SpatialGraphNodeBindingPropertiesMSFT.poseInNodeSpace has unexpected size % instead of 28", size_of(type_of(SpatialGraphNodeBindingPropertiesMSFT.poseInNodeSpace)));
    assert(size_of(SpatialGraphNodeBindingPropertiesMSFT) == 64, "SpatialGraphNodeBindingPropertiesMSFT has size % instead of 64", size_of(SpatialGraphNodeBindingPropertiesMSFT));
}

PFN_xrCreateSpatialGraphNodeSpaceMSFT :: #type (a0: Session, a1: *SpatialGraphNodeSpaceCreateInfoMSFT, a2: *Space) -> Result #c_call;
PFN_xrTryCreateSpatialGraphStaticNodeBindingMSFT :: #type (a0: Session, a1: *SpatialGraphStaticNodeBindingCreateInfoMSFT, a2: *SpatialGraphNodeBindingMSFT) -> Result #c_call;
PFN_xrDestroySpatialGraphNodeBindingMSFT :: #type (a0: SpatialGraphNodeBindingMSFT) -> Result #c_call;
PFN_xrGetSpatialGraphNodeBindingPropertiesMSFT :: #type (a0: SpatialGraphNodeBindingMSFT, a1: *SpatialGraphNodeBindingPropertiesGetInfoMSFT, a2: *SpatialGraphNodeBindingPropertiesMSFT) -> Result #c_call;

HandTrackerEXT_T :: struct {}
HandTrackerEXT :: *HandTrackerEXT_T;

HandEXT :: enum s32 {
    LEFT_EXT     :: 1;
    RIGHT_EXT    :: 2;
    MAX_ENUM_EXT :: 2147483647;

    XR_HAND_LEFT_EXT     :: LEFT_EXT;
    XR_HAND_RIGHT_EXT    :: RIGHT_EXT;
    XR_HAND_MAX_ENUM_EXT :: MAX_ENUM_EXT;
}

HandJointEXT :: enum s32 {
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

HandJointSetEXT :: enum s32 {
    DEFAULT_EXT                 :: 0;
    HAND_WITH_FOREARM_ULTRALEAP :: 1000149000;
    MAX_ENUM_EXT                :: 2147483647;

    XR_HAND_JOINT_SET_DEFAULT_EXT                 :: DEFAULT_EXT;
    XR_HAND_JOINT_SET_HAND_WITH_FOREARM_ULTRALEAP :: HAND_WITH_FOREARM_ULTRALEAP;
    XR_HAND_JOINT_SET_MAX_ENUM_EXT                :: MAX_ENUM_EXT;
}

// XrSystemHandTrackingPropertiesEXT extends XrSystemProperties
SystemHandTrackingPropertiesEXT :: struct {
    type:                 StructureType;
    next:                 *void;
    supportsHandTracking: Bool32;
}
#run {
    instance: SystemHandTrackingPropertiesEXT;
    assert(((cast(*void)(*instance.type)) - cast(*void)(*instance)) == 0, "SystemHandTrackingPropertiesEXT.type has unexpected offset % instead of 0", ((cast(*void)(*instance.type)) - cast(*void)(*instance)));
    assert(size_of(type_of(SystemHandTrackingPropertiesEXT.type)) == 4, "SystemHandTrackingPropertiesEXT.type has unexpected size % instead of 4", size_of(type_of(SystemHandTrackingPropertiesEXT.type)));
    assert(((cast(*void)(*instance.next)) - cast(*void)(*instance)) == 8, "SystemHandTrackingPropertiesEXT.next has unexpected offset % instead of 8", ((cast(*void)(*instance.next)) - cast(*void)(*instance)));
    assert(size_of(type_of(SystemHandTrackingPropertiesEXT.next)) == 8, "SystemHandTrackingPropertiesEXT.next has unexpected size % instead of 8", size_of(type_of(SystemHandTrackingPropertiesEXT.next)));
    assert(((cast(*void)(*instance.supportsHandTracking)) - cast(*void)(*instance)) == 16, "SystemHandTrackingPropertiesEXT.supportsHandTracking has unexpected offset % instead of 16", ((cast(*void)(*instance.supportsHandTracking)) - cast(*void)(*instance)));
    assert(size_of(type_of(SystemHandTrackingPropertiesEXT.supportsHandTracking)) == 4, "SystemHandTrackingPropertiesEXT.supportsHandTracking has unexpected size % instead of 4", size_of(type_of(SystemHandTrackingPropertiesEXT.supportsHandTracking)));
    assert(size_of(SystemHandTrackingPropertiesEXT) == 24, "SystemHandTrackingPropertiesEXT has size % instead of 24", size_of(SystemHandTrackingPropertiesEXT));
}

HandTrackerCreateInfoEXT :: struct {
    type:         StructureType;
    next:         *void;
    hand:         HandEXT;
    handJointSet: HandJointSetEXT;
}
#run {
    instance: HandTrackerCreateInfoEXT;
    assert(((cast(*void)(*instance.type)) - cast(*void)(*instance)) == 0, "HandTrackerCreateInfoEXT.type has unexpected offset % instead of 0", ((cast(*void)(*instance.type)) - cast(*void)(*instance)));
    assert(size_of(type_of(HandTrackerCreateInfoEXT.type)) == 4, "HandTrackerCreateInfoEXT.type has unexpected size % instead of 4", size_of(type_of(HandTrackerCreateInfoEXT.type)));
    assert(((cast(*void)(*instance.next)) - cast(*void)(*instance)) == 8, "HandTrackerCreateInfoEXT.next has unexpected offset % instead of 8", ((cast(*void)(*instance.next)) - cast(*void)(*instance)));
    assert(size_of(type_of(HandTrackerCreateInfoEXT.next)) == 8, "HandTrackerCreateInfoEXT.next has unexpected size % instead of 8", size_of(type_of(HandTrackerCreateInfoEXT.next)));
    assert(((cast(*void)(*instance.hand)) - cast(*void)(*instance)) == 16, "HandTrackerCreateInfoEXT.hand has unexpected offset % instead of 16", ((cast(*void)(*instance.hand)) - cast(*void)(*instance)));
    assert(size_of(type_of(HandTrackerCreateInfoEXT.hand)) == 4, "HandTrackerCreateInfoEXT.hand has unexpected size % instead of 4", size_of(type_of(HandTrackerCreateInfoEXT.hand)));
    assert(((cast(*void)(*instance.handJointSet)) - cast(*void)(*instance)) == 20, "HandTrackerCreateInfoEXT.handJointSet has unexpected offset % instead of 20", ((cast(*void)(*instance.handJointSet)) - cast(*void)(*instance)));
    assert(size_of(type_of(HandTrackerCreateInfoEXT.handJointSet)) == 4, "HandTrackerCreateInfoEXT.handJointSet has unexpected size % instead of 4", size_of(type_of(HandTrackerCreateInfoEXT.handJointSet)));
    assert(size_of(HandTrackerCreateInfoEXT) == 24, "HandTrackerCreateInfoEXT has size % instead of 24", size_of(HandTrackerCreateInfoEXT));
}

HandJointsLocateInfoEXT :: struct {
    type:      StructureType;
    next:      *void;
    baseSpace: Space;
    time:      Time;
}
#run {
    instance: HandJointsLocateInfoEXT;
    assert(((cast(*void)(*instance.type)) - cast(*void)(*instance)) == 0, "HandJointsLocateInfoEXT.type has unexpected offset % instead of 0", ((cast(*void)(*instance.type)) - cast(*void)(*instance)));
    assert(size_of(type_of(HandJointsLocateInfoEXT.type)) == 4, "HandJointsLocateInfoEXT.type has unexpected size % instead of 4", size_of(type_of(HandJointsLocateInfoEXT.type)));
    assert(((cast(*void)(*instance.next)) - cast(*void)(*instance)) == 8, "HandJointsLocateInfoEXT.next has unexpected offset % instead of 8", ((cast(*void)(*instance.next)) - cast(*void)(*instance)));
    assert(size_of(type_of(HandJointsLocateInfoEXT.next)) == 8, "HandJointsLocateInfoEXT.next has unexpected size % instead of 8", size_of(type_of(HandJointsLocateInfoEXT.next)));
    assert(((cast(*void)(*instance.baseSpace)) - cast(*void)(*instance)) == 16, "HandJointsLocateInfoEXT.baseSpace has unexpected offset % instead of 16", ((cast(*void)(*instance.baseSpace)) - cast(*void)(*instance)));
    assert(size_of(type_of(HandJointsLocateInfoEXT.baseSpace)) == 8, "HandJointsLocateInfoEXT.baseSpace has unexpected size % instead of 8", size_of(type_of(HandJointsLocateInfoEXT.baseSpace)));
    assert(((cast(*void)(*instance.time)) - cast(*void)(*instance)) == 24, "HandJointsLocateInfoEXT.time has unexpected offset % instead of 24", ((cast(*void)(*instance.time)) - cast(*void)(*instance)));
    assert(size_of(type_of(HandJointsLocateInfoEXT.time)) == 8, "HandJointsLocateInfoEXT.time has unexpected size % instead of 8", size_of(type_of(HandJointsLocateInfoEXT.time)));
    assert(size_of(HandJointsLocateInfoEXT) == 32, "HandJointsLocateInfoEXT has size % instead of 32", size_of(HandJointsLocateInfoEXT));
}

HandJointLocationEXT :: struct {
    locationFlags: SpaceLocationFlags;
    pose:          Posef;
    radius:        float;
}
#run {
    instance: HandJointLocationEXT;
    assert(((cast(*void)(*instance.locationFlags)) - cast(*void)(*instance)) == 0, "HandJointLocationEXT.locationFlags has unexpected offset % instead of 0", ((cast(*void)(*instance.locationFlags)) - cast(*void)(*instance)));
    assert(size_of(type_of(HandJointLocationEXT.locationFlags)) == 8, "HandJointLocationEXT.locationFlags has unexpected size % instead of 8", size_of(type_of(HandJointLocationEXT.locationFlags)));
    assert(((cast(*void)(*instance.pose)) - cast(*void)(*instance)) == 8, "HandJointLocationEXT.pose has unexpected offset % instead of 8", ((cast(*void)(*instance.pose)) - cast(*void)(*instance)));
    assert(size_of(type_of(HandJointLocationEXT.pose)) == 28, "HandJointLocationEXT.pose has unexpected size % instead of 28", size_of(type_of(HandJointLocationEXT.pose)));
    assert(((cast(*void)(*instance.radius)) - cast(*void)(*instance)) == 36, "HandJointLocationEXT.radius has unexpected offset % instead of 36", ((cast(*void)(*instance.radius)) - cast(*void)(*instance)));
    assert(size_of(type_of(HandJointLocationEXT.radius)) == 4, "HandJointLocationEXT.radius has unexpected size % instead of 4", size_of(type_of(HandJointLocationEXT.radius)));
    assert(size_of(HandJointLocationEXT) == 40, "HandJointLocationEXT has size % instead of 40", size_of(HandJointLocationEXT));
}

HandJointVelocityEXT :: struct {
    velocityFlags:   SpaceVelocityFlags;
    linearVelocity:  Vector3f;
    angularVelocity: Vector3f;
}
#run {
    instance: HandJointVelocityEXT;
    assert(((cast(*void)(*instance.velocityFlags)) - cast(*void)(*instance)) == 0, "HandJointVelocityEXT.velocityFlags has unexpected offset % instead of 0", ((cast(*void)(*instance.velocityFlags)) - cast(*void)(*instance)));
    assert(size_of(type_of(HandJointVelocityEXT.velocityFlags)) == 8, "HandJointVelocityEXT.velocityFlags has unexpected size % instead of 8", size_of(type_of(HandJointVelocityEXT.velocityFlags)));
    assert(((cast(*void)(*instance.linearVelocity)) - cast(*void)(*instance)) == 8, "HandJointVelocityEXT.linearVelocity has unexpected offset % instead of 8", ((cast(*void)(*instance.linearVelocity)) - cast(*void)(*instance)));
    assert(size_of(type_of(HandJointVelocityEXT.linearVelocity)) == 12, "HandJointVelocityEXT.linearVelocity has unexpected size % instead of 12", size_of(type_of(HandJointVelocityEXT.linearVelocity)));
    assert(((cast(*void)(*instance.angularVelocity)) - cast(*void)(*instance)) == 20, "HandJointVelocityEXT.angularVelocity has unexpected offset % instead of 20", ((cast(*void)(*instance.angularVelocity)) - cast(*void)(*instance)));
    assert(size_of(type_of(HandJointVelocityEXT.angularVelocity)) == 12, "HandJointVelocityEXT.angularVelocity has unexpected size % instead of 12", size_of(type_of(HandJointVelocityEXT.angularVelocity)));
    assert(size_of(HandJointVelocityEXT) == 32, "HandJointVelocityEXT has size % instead of 32", size_of(HandJointVelocityEXT));
}

HandJointLocationsEXT :: struct {
    type:           StructureType;
    next:           *void;
    isActive:       Bool32;
    jointCount:     u32;
    jointLocations: *HandJointLocationEXT;
}
#run {
    instance: HandJointLocationsEXT;
    assert(((cast(*void)(*instance.type)) - cast(*void)(*instance)) == 0, "HandJointLocationsEXT.type has unexpected offset % instead of 0", ((cast(*void)(*instance.type)) - cast(*void)(*instance)));
    assert(size_of(type_of(HandJointLocationsEXT.type)) == 4, "HandJointLocationsEXT.type has unexpected size % instead of 4", size_of(type_of(HandJointLocationsEXT.type)));
    assert(((cast(*void)(*instance.next)) - cast(*void)(*instance)) == 8, "HandJointLocationsEXT.next has unexpected offset % instead of 8", ((cast(*void)(*instance.next)) - cast(*void)(*instance)));
    assert(size_of(type_of(HandJointLocationsEXT.next)) == 8, "HandJointLocationsEXT.next has unexpected size % instead of 8", size_of(type_of(HandJointLocationsEXT.next)));
    assert(((cast(*void)(*instance.isActive)) - cast(*void)(*instance)) == 16, "HandJointLocationsEXT.isActive has unexpected offset % instead of 16", ((cast(*void)(*instance.isActive)) - cast(*void)(*instance)));
    assert(size_of(type_of(HandJointLocationsEXT.isActive)) == 4, "HandJointLocationsEXT.isActive has unexpected size % instead of 4", size_of(type_of(HandJointLocationsEXT.isActive)));
    assert(((cast(*void)(*instance.jointCount)) - cast(*void)(*instance)) == 20, "HandJointLocationsEXT.jointCount has unexpected offset % instead of 20", ((cast(*void)(*instance.jointCount)) - cast(*void)(*instance)));
    assert(size_of(type_of(HandJointLocationsEXT.jointCount)) == 4, "HandJointLocationsEXT.jointCount has unexpected size % instead of 4", size_of(type_of(HandJointLocationsEXT.jointCount)));
    assert(((cast(*void)(*instance.jointLocations)) - cast(*void)(*instance)) == 24, "HandJointLocationsEXT.jointLocations has unexpected offset % instead of 24", ((cast(*void)(*instance.jointLocations)) - cast(*void)(*instance)));
    assert(size_of(type_of(HandJointLocationsEXT.jointLocations)) == 8, "HandJointLocationsEXT.jointLocations has unexpected size % instead of 8", size_of(type_of(HandJointLocationsEXT.jointLocations)));
    assert(size_of(HandJointLocationsEXT) == 32, "HandJointLocationsEXT has size % instead of 32", size_of(HandJointLocationsEXT));
}

// XrHandJointVelocitiesEXT extends XrHandJointLocationsEXT
HandJointVelocitiesEXT :: struct {
    type:            StructureType;
    next:            *void;
    jointCount:      u32;
    jointVelocities: *HandJointVelocityEXT;
}
#run {
    instance: HandJointVelocitiesEXT;
    assert(((cast(*void)(*instance.type)) - cast(*void)(*instance)) == 0, "HandJointVelocitiesEXT.type has unexpected offset % instead of 0", ((cast(*void)(*instance.type)) - cast(*void)(*instance)));
    assert(size_of(type_of(HandJointVelocitiesEXT.type)) == 4, "HandJointVelocitiesEXT.type has unexpected size % instead of 4", size_of(type_of(HandJointVelocitiesEXT.type)));
    assert(((cast(*void)(*instance.next)) - cast(*void)(*instance)) == 8, "HandJointVelocitiesEXT.next has unexpected offset % instead of 8", ((cast(*void)(*instance.next)) - cast(*void)(*instance)));
    assert(size_of(type_of(HandJointVelocitiesEXT.next)) == 8, "HandJointVelocitiesEXT.next has unexpected size % instead of 8", size_of(type_of(HandJointVelocitiesEXT.next)));
    assert(((cast(*void)(*instance.jointCount)) - cast(*void)(*instance)) == 16, "HandJointVelocitiesEXT.jointCount has unexpected offset % instead of 16", ((cast(*void)(*instance.jointCount)) - cast(*void)(*instance)));
    assert(size_of(type_of(HandJointVelocitiesEXT.jointCount)) == 4, "HandJointVelocitiesEXT.jointCount has unexpected size % instead of 4", size_of(type_of(HandJointVelocitiesEXT.jointCount)));
    assert(((cast(*void)(*instance.jointVelocities)) - cast(*void)(*instance)) == 24, "HandJointVelocitiesEXT.jointVelocities has unexpected offset % instead of 24", ((cast(*void)(*instance.jointVelocities)) - cast(*void)(*instance)));
    assert(size_of(type_of(HandJointVelocitiesEXT.jointVelocities)) == 8, "HandJointVelocitiesEXT.jointVelocities has unexpected size % instead of 8", size_of(type_of(HandJointVelocitiesEXT.jointVelocities)));
    assert(size_of(HandJointVelocitiesEXT) == 32, "HandJointVelocitiesEXT has size % instead of 32", size_of(HandJointVelocitiesEXT));
}

PFN_xrCreateHandTrackerEXT :: #type (a0: Session, a1: *HandTrackerCreateInfoEXT, a2: *HandTrackerEXT) -> Result #c_call;
PFN_xrDestroyHandTrackerEXT :: #type (a0: HandTrackerEXT) -> Result #c_call;
PFN_xrLocateHandJointsEXT :: #type (a0: HandTrackerEXT, a1: *HandJointsLocateInfoEXT, a2: *HandJointLocationsEXT) -> Result #c_call;

HandPoseTypeMSFT :: enum s32 {
    TRACKED_MSFT             :: 0;
    REFERENCE_OPEN_PALM_MSFT :: 1;
    MAX_ENUM_MSFT            :: 2147483647;

    XR_HAND_POSE_TYPE_TRACKED_MSFT             :: TRACKED_MSFT;
    XR_HAND_POSE_TYPE_REFERENCE_OPEN_PALM_MSFT :: REFERENCE_OPEN_PALM_MSFT;
    XR_HAND_POSE_TYPE_MAX_ENUM_MSFT            :: MAX_ENUM_MSFT;
}

// XrSystemHandTrackingMeshPropertiesMSFT extends XrSystemProperties
SystemHandTrackingMeshPropertiesMSFT :: struct {
    type:                     StructureType;
    next:                     *void;
    supportsHandTrackingMesh: Bool32;
    maxHandMeshIndexCount:    u32;
    maxHandMeshVertexCount:   u32;
}
#run {
    instance: SystemHandTrackingMeshPropertiesMSFT;
    assert(((cast(*void)(*instance.type)) - cast(*void)(*instance)) == 0, "SystemHandTrackingMeshPropertiesMSFT.type has unexpected offset % instead of 0", ((cast(*void)(*instance.type)) - cast(*void)(*instance)));
    assert(size_of(type_of(SystemHandTrackingMeshPropertiesMSFT.type)) == 4, "SystemHandTrackingMeshPropertiesMSFT.type has unexpected size % instead of 4", size_of(type_of(SystemHandTrackingMeshPropertiesMSFT.type)));
    assert(((cast(*void)(*instance.next)) - cast(*void)(*instance)) == 8, "SystemHandTrackingMeshPropertiesMSFT.next has unexpected offset % instead of 8", ((cast(*void)(*instance.next)) - cast(*void)(*instance)));
    assert(size_of(type_of(SystemHandTrackingMeshPropertiesMSFT.next)) == 8, "SystemHandTrackingMeshPropertiesMSFT.next has unexpected size % instead of 8", size_of(type_of(SystemHandTrackingMeshPropertiesMSFT.next)));
    assert(((cast(*void)(*instance.supportsHandTrackingMesh)) - cast(*void)(*instance)) == 16, "SystemHandTrackingMeshPropertiesMSFT.supportsHandTrackingMesh has unexpected offset % instead of 16", ((cast(*void)(*instance.supportsHandTrackingMesh)) - cast(*void)(*instance)));
    assert(size_of(type_of(SystemHandTrackingMeshPropertiesMSFT.supportsHandTrackingMesh)) == 4, "SystemHandTrackingMeshPropertiesMSFT.supportsHandTrackingMesh has unexpected size % instead of 4", size_of(type_of(SystemHandTrackingMeshPropertiesMSFT.supportsHandTrackingMesh)));
    assert(((cast(*void)(*instance.maxHandMeshIndexCount)) - cast(*void)(*instance)) == 20, "SystemHandTrackingMeshPropertiesMSFT.maxHandMeshIndexCount has unexpected offset % instead of 20", ((cast(*void)(*instance.maxHandMeshIndexCount)) - cast(*void)(*instance)));
    assert(size_of(type_of(SystemHandTrackingMeshPropertiesMSFT.maxHandMeshIndexCount)) == 4, "SystemHandTrackingMeshPropertiesMSFT.maxHandMeshIndexCount has unexpected size % instead of 4", size_of(type_of(SystemHandTrackingMeshPropertiesMSFT.maxHandMeshIndexCount)));
    assert(((cast(*void)(*instance.maxHandMeshVertexCount)) - cast(*void)(*instance)) == 24, "SystemHandTrackingMeshPropertiesMSFT.maxHandMeshVertexCount has unexpected offset % instead of 24", ((cast(*void)(*instance.maxHandMeshVertexCount)) - cast(*void)(*instance)));
    assert(size_of(type_of(SystemHandTrackingMeshPropertiesMSFT.maxHandMeshVertexCount)) == 4, "SystemHandTrackingMeshPropertiesMSFT.maxHandMeshVertexCount has unexpected size % instead of 4", size_of(type_of(SystemHandTrackingMeshPropertiesMSFT.maxHandMeshVertexCount)));
    assert(size_of(SystemHandTrackingMeshPropertiesMSFT) == 32, "SystemHandTrackingMeshPropertiesMSFT has size % instead of 32", size_of(SystemHandTrackingMeshPropertiesMSFT));
}

HandMeshSpaceCreateInfoMSFT :: struct {
    type:                StructureType;
    next:                *void;
    handPoseType:        HandPoseTypeMSFT;
    poseInHandMeshSpace: Posef;
}
#run {
    instance: HandMeshSpaceCreateInfoMSFT;
    assert(((cast(*void)(*instance.type)) - cast(*void)(*instance)) == 0, "HandMeshSpaceCreateInfoMSFT.type has unexpected offset % instead of 0", ((cast(*void)(*instance.type)) - cast(*void)(*instance)));
    assert(size_of(type_of(HandMeshSpaceCreateInfoMSFT.type)) == 4, "HandMeshSpaceCreateInfoMSFT.type has unexpected size % instead of 4", size_of(type_of(HandMeshSpaceCreateInfoMSFT.type)));
    assert(((cast(*void)(*instance.next)) - cast(*void)(*instance)) == 8, "HandMeshSpaceCreateInfoMSFT.next has unexpected offset % instead of 8", ((cast(*void)(*instance.next)) - cast(*void)(*instance)));
    assert(size_of(type_of(HandMeshSpaceCreateInfoMSFT.next)) == 8, "HandMeshSpaceCreateInfoMSFT.next has unexpected size % instead of 8", size_of(type_of(HandMeshSpaceCreateInfoMSFT.next)));
    assert(((cast(*void)(*instance.handPoseType)) - cast(*void)(*instance)) == 16, "HandMeshSpaceCreateInfoMSFT.handPoseType has unexpected offset % instead of 16", ((cast(*void)(*instance.handPoseType)) - cast(*void)(*instance)));
    assert(size_of(type_of(HandMeshSpaceCreateInfoMSFT.handPoseType)) == 4, "HandMeshSpaceCreateInfoMSFT.handPoseType has unexpected size % instead of 4", size_of(type_of(HandMeshSpaceCreateInfoMSFT.handPoseType)));
    assert(((cast(*void)(*instance.poseInHandMeshSpace)) - cast(*void)(*instance)) == 20, "HandMeshSpaceCreateInfoMSFT.poseInHandMeshSpace has unexpected offset % instead of 20", ((cast(*void)(*instance.poseInHandMeshSpace)) - cast(*void)(*instance)));
    assert(size_of(type_of(HandMeshSpaceCreateInfoMSFT.poseInHandMeshSpace)) == 28, "HandMeshSpaceCreateInfoMSFT.poseInHandMeshSpace has unexpected size % instead of 28", size_of(type_of(HandMeshSpaceCreateInfoMSFT.poseInHandMeshSpace)));
    assert(size_of(HandMeshSpaceCreateInfoMSFT) == 48, "HandMeshSpaceCreateInfoMSFT has size % instead of 48", size_of(HandMeshSpaceCreateInfoMSFT));
}

HandMeshUpdateInfoMSFT :: struct {
    type:         StructureType;
    next:         *void;
    time:         Time;
    handPoseType: HandPoseTypeMSFT;
}
#run {
    instance: HandMeshUpdateInfoMSFT;
    assert(((cast(*void)(*instance.type)) - cast(*void)(*instance)) == 0, "HandMeshUpdateInfoMSFT.type has unexpected offset % instead of 0", ((cast(*void)(*instance.type)) - cast(*void)(*instance)));
    assert(size_of(type_of(HandMeshUpdateInfoMSFT.type)) == 4, "HandMeshUpdateInfoMSFT.type has unexpected size % instead of 4", size_of(type_of(HandMeshUpdateInfoMSFT.type)));
    assert(((cast(*void)(*instance.next)) - cast(*void)(*instance)) == 8, "HandMeshUpdateInfoMSFT.next has unexpected offset % instead of 8", ((cast(*void)(*instance.next)) - cast(*void)(*instance)));
    assert(size_of(type_of(HandMeshUpdateInfoMSFT.next)) == 8, "HandMeshUpdateInfoMSFT.next has unexpected size % instead of 8", size_of(type_of(HandMeshUpdateInfoMSFT.next)));
    assert(((cast(*void)(*instance.time)) - cast(*void)(*instance)) == 16, "HandMeshUpdateInfoMSFT.time has unexpected offset % instead of 16", ((cast(*void)(*instance.time)) - cast(*void)(*instance)));
    assert(size_of(type_of(HandMeshUpdateInfoMSFT.time)) == 8, "HandMeshUpdateInfoMSFT.time has unexpected size % instead of 8", size_of(type_of(HandMeshUpdateInfoMSFT.time)));
    assert(((cast(*void)(*instance.handPoseType)) - cast(*void)(*instance)) == 24, "HandMeshUpdateInfoMSFT.handPoseType has unexpected offset % instead of 24", ((cast(*void)(*instance.handPoseType)) - cast(*void)(*instance)));
    assert(size_of(type_of(HandMeshUpdateInfoMSFT.handPoseType)) == 4, "HandMeshUpdateInfoMSFT.handPoseType has unexpected size % instead of 4", size_of(type_of(HandMeshUpdateInfoMSFT.handPoseType)));
    assert(size_of(HandMeshUpdateInfoMSFT) == 32, "HandMeshUpdateInfoMSFT has size % instead of 32", size_of(HandMeshUpdateInfoMSFT));
}

HandMeshIndexBufferMSFT :: struct {
    indexBufferKey:     u32;
    indexCapacityInput: u32;
    indexCountOutput:   u32;
    indices:            *u32;
}
#run {
    instance: HandMeshIndexBufferMSFT;
    assert(((cast(*void)(*instance.indexBufferKey)) - cast(*void)(*instance)) == 0, "HandMeshIndexBufferMSFT.indexBufferKey has unexpected offset % instead of 0", ((cast(*void)(*instance.indexBufferKey)) - cast(*void)(*instance)));
    assert(size_of(type_of(HandMeshIndexBufferMSFT.indexBufferKey)) == 4, "HandMeshIndexBufferMSFT.indexBufferKey has unexpected size % instead of 4", size_of(type_of(HandMeshIndexBufferMSFT.indexBufferKey)));
    assert(((cast(*void)(*instance.indexCapacityInput)) - cast(*void)(*instance)) == 4, "HandMeshIndexBufferMSFT.indexCapacityInput has unexpected offset % instead of 4", ((cast(*void)(*instance.indexCapacityInput)) - cast(*void)(*instance)));
    assert(size_of(type_of(HandMeshIndexBufferMSFT.indexCapacityInput)) == 4, "HandMeshIndexBufferMSFT.indexCapacityInput has unexpected size % instead of 4", size_of(type_of(HandMeshIndexBufferMSFT.indexCapacityInput)));
    assert(((cast(*void)(*instance.indexCountOutput)) - cast(*void)(*instance)) == 8, "HandMeshIndexBufferMSFT.indexCountOutput has unexpected offset % instead of 8", ((cast(*void)(*instance.indexCountOutput)) - cast(*void)(*instance)));
    assert(size_of(type_of(HandMeshIndexBufferMSFT.indexCountOutput)) == 4, "HandMeshIndexBufferMSFT.indexCountOutput has unexpected size % instead of 4", size_of(type_of(HandMeshIndexBufferMSFT.indexCountOutput)));
    assert(((cast(*void)(*instance.indices)) - cast(*void)(*instance)) == 16, "HandMeshIndexBufferMSFT.indices has unexpected offset % instead of 16", ((cast(*void)(*instance.indices)) - cast(*void)(*instance)));
    assert(size_of(type_of(HandMeshIndexBufferMSFT.indices)) == 8, "HandMeshIndexBufferMSFT.indices has unexpected size % instead of 8", size_of(type_of(HandMeshIndexBufferMSFT.indices)));
    assert(size_of(HandMeshIndexBufferMSFT) == 24, "HandMeshIndexBufferMSFT has size % instead of 24", size_of(HandMeshIndexBufferMSFT));
}

HandMeshVertexMSFT :: struct {
    position: Vector3f;
    normal:   Vector3f;
}
#run {
    instance: HandMeshVertexMSFT;
    assert(((cast(*void)(*instance.position)) - cast(*void)(*instance)) == 0, "HandMeshVertexMSFT.position has unexpected offset % instead of 0", ((cast(*void)(*instance.position)) - cast(*void)(*instance)));
    assert(size_of(type_of(HandMeshVertexMSFT.position)) == 12, "HandMeshVertexMSFT.position has unexpected size % instead of 12", size_of(type_of(HandMeshVertexMSFT.position)));
    assert(((cast(*void)(*instance.normal)) - cast(*void)(*instance)) == 12, "HandMeshVertexMSFT.normal has unexpected offset % instead of 12", ((cast(*void)(*instance.normal)) - cast(*void)(*instance)));
    assert(size_of(type_of(HandMeshVertexMSFT.normal)) == 12, "HandMeshVertexMSFT.normal has unexpected size % instead of 12", size_of(type_of(HandMeshVertexMSFT.normal)));
    assert(size_of(HandMeshVertexMSFT) == 24, "HandMeshVertexMSFT has size % instead of 24", size_of(HandMeshVertexMSFT));
}

HandMeshVertexBufferMSFT :: struct {
    vertexUpdateTime:    Time;
    vertexCapacityInput: u32;
    vertexCountOutput:   u32;
    vertices:            *HandMeshVertexMSFT;
}
#run {
    instance: HandMeshVertexBufferMSFT;
    assert(((cast(*void)(*instance.vertexUpdateTime)) - cast(*void)(*instance)) == 0, "HandMeshVertexBufferMSFT.vertexUpdateTime has unexpected offset % instead of 0", ((cast(*void)(*instance.vertexUpdateTime)) - cast(*void)(*instance)));
    assert(size_of(type_of(HandMeshVertexBufferMSFT.vertexUpdateTime)) == 8, "HandMeshVertexBufferMSFT.vertexUpdateTime has unexpected size % instead of 8", size_of(type_of(HandMeshVertexBufferMSFT.vertexUpdateTime)));
    assert(((cast(*void)(*instance.vertexCapacityInput)) - cast(*void)(*instance)) == 8, "HandMeshVertexBufferMSFT.vertexCapacityInput has unexpected offset % instead of 8", ((cast(*void)(*instance.vertexCapacityInput)) - cast(*void)(*instance)));
    assert(size_of(type_of(HandMeshVertexBufferMSFT.vertexCapacityInput)) == 4, "HandMeshVertexBufferMSFT.vertexCapacityInput has unexpected size % instead of 4", size_of(type_of(HandMeshVertexBufferMSFT.vertexCapacityInput)));
    assert(((cast(*void)(*instance.vertexCountOutput)) - cast(*void)(*instance)) == 12, "HandMeshVertexBufferMSFT.vertexCountOutput has unexpected offset % instead of 12", ((cast(*void)(*instance.vertexCountOutput)) - cast(*void)(*instance)));
    assert(size_of(type_of(HandMeshVertexBufferMSFT.vertexCountOutput)) == 4, "HandMeshVertexBufferMSFT.vertexCountOutput has unexpected size % instead of 4", size_of(type_of(HandMeshVertexBufferMSFT.vertexCountOutput)));
    assert(((cast(*void)(*instance.vertices)) - cast(*void)(*instance)) == 16, "HandMeshVertexBufferMSFT.vertices has unexpected offset % instead of 16", ((cast(*void)(*instance.vertices)) - cast(*void)(*instance)));
    assert(size_of(type_of(HandMeshVertexBufferMSFT.vertices)) == 8, "HandMeshVertexBufferMSFT.vertices has unexpected size % instead of 8", size_of(type_of(HandMeshVertexBufferMSFT.vertices)));
    assert(size_of(HandMeshVertexBufferMSFT) == 24, "HandMeshVertexBufferMSFT has size % instead of 24", size_of(HandMeshVertexBufferMSFT));
}

HandMeshMSFT :: struct {
    type:                StructureType;
    next:                *void;
    isActive:            Bool32;
    indexBufferChanged:  Bool32;
    vertexBufferChanged: Bool32;
    indexBuffer:         HandMeshIndexBufferMSFT;
    vertexBuffer:        HandMeshVertexBufferMSFT;
}
#run {
    instance: HandMeshMSFT;
    assert(((cast(*void)(*instance.type)) - cast(*void)(*instance)) == 0, "HandMeshMSFT.type has unexpected offset % instead of 0", ((cast(*void)(*instance.type)) - cast(*void)(*instance)));
    assert(size_of(type_of(HandMeshMSFT.type)) == 4, "HandMeshMSFT.type has unexpected size % instead of 4", size_of(type_of(HandMeshMSFT.type)));
    assert(((cast(*void)(*instance.next)) - cast(*void)(*instance)) == 8, "HandMeshMSFT.next has unexpected offset % instead of 8", ((cast(*void)(*instance.next)) - cast(*void)(*instance)));
    assert(size_of(type_of(HandMeshMSFT.next)) == 8, "HandMeshMSFT.next has unexpected size % instead of 8", size_of(type_of(HandMeshMSFT.next)));
    assert(((cast(*void)(*instance.isActive)) - cast(*void)(*instance)) == 16, "HandMeshMSFT.isActive has unexpected offset % instead of 16", ((cast(*void)(*instance.isActive)) - cast(*void)(*instance)));
    assert(size_of(type_of(HandMeshMSFT.isActive)) == 4, "HandMeshMSFT.isActive has unexpected size % instead of 4", size_of(type_of(HandMeshMSFT.isActive)));
    assert(((cast(*void)(*instance.indexBufferChanged)) - cast(*void)(*instance)) == 20, "HandMeshMSFT.indexBufferChanged has unexpected offset % instead of 20", ((cast(*void)(*instance.indexBufferChanged)) - cast(*void)(*instance)));
    assert(size_of(type_of(HandMeshMSFT.indexBufferChanged)) == 4, "HandMeshMSFT.indexBufferChanged has unexpected size % instead of 4", size_of(type_of(HandMeshMSFT.indexBufferChanged)));
    assert(((cast(*void)(*instance.vertexBufferChanged)) - cast(*void)(*instance)) == 24, "HandMeshMSFT.vertexBufferChanged has unexpected offset % instead of 24", ((cast(*void)(*instance.vertexBufferChanged)) - cast(*void)(*instance)));
    assert(size_of(type_of(HandMeshMSFT.vertexBufferChanged)) == 4, "HandMeshMSFT.vertexBufferChanged has unexpected size % instead of 4", size_of(type_of(HandMeshMSFT.vertexBufferChanged)));
    assert(((cast(*void)(*instance.indexBuffer)) - cast(*void)(*instance)) == 32, "HandMeshMSFT.indexBuffer has unexpected offset % instead of 32", ((cast(*void)(*instance.indexBuffer)) - cast(*void)(*instance)));
    assert(size_of(type_of(HandMeshMSFT.indexBuffer)) == 24, "HandMeshMSFT.indexBuffer has unexpected size % instead of 24", size_of(type_of(HandMeshMSFT.indexBuffer)));
    assert(((cast(*void)(*instance.vertexBuffer)) - cast(*void)(*instance)) == 56, "HandMeshMSFT.vertexBuffer has unexpected offset % instead of 56", ((cast(*void)(*instance.vertexBuffer)) - cast(*void)(*instance)));
    assert(size_of(type_of(HandMeshMSFT.vertexBuffer)) == 24, "HandMeshMSFT.vertexBuffer has unexpected size % instead of 24", size_of(type_of(HandMeshMSFT.vertexBuffer)));
    assert(size_of(HandMeshMSFT) == 80, "HandMeshMSFT has size % instead of 80", size_of(HandMeshMSFT));
}

// XrHandPoseTypeInfoMSFT extends XrHandTrackerCreateInfoEXT
HandPoseTypeInfoMSFT :: struct {
    type:         StructureType;
    next:         *void;
    handPoseType: HandPoseTypeMSFT;
}
#run {
    instance: HandPoseTypeInfoMSFT;
    assert(((cast(*void)(*instance.type)) - cast(*void)(*instance)) == 0, "HandPoseTypeInfoMSFT.type has unexpected offset % instead of 0", ((cast(*void)(*instance.type)) - cast(*void)(*instance)));
    assert(size_of(type_of(HandPoseTypeInfoMSFT.type)) == 4, "HandPoseTypeInfoMSFT.type has unexpected size % instead of 4", size_of(type_of(HandPoseTypeInfoMSFT.type)));
    assert(((cast(*void)(*instance.next)) - cast(*void)(*instance)) == 8, "HandPoseTypeInfoMSFT.next has unexpected offset % instead of 8", ((cast(*void)(*instance.next)) - cast(*void)(*instance)));
    assert(size_of(type_of(HandPoseTypeInfoMSFT.next)) == 8, "HandPoseTypeInfoMSFT.next has unexpected size % instead of 8", size_of(type_of(HandPoseTypeInfoMSFT.next)));
    assert(((cast(*void)(*instance.handPoseType)) - cast(*void)(*instance)) == 16, "HandPoseTypeInfoMSFT.handPoseType has unexpected offset % instead of 16", ((cast(*void)(*instance.handPoseType)) - cast(*void)(*instance)));
    assert(size_of(type_of(HandPoseTypeInfoMSFT.handPoseType)) == 4, "HandPoseTypeInfoMSFT.handPoseType has unexpected size % instead of 4", size_of(type_of(HandPoseTypeInfoMSFT.handPoseType)));
    assert(size_of(HandPoseTypeInfoMSFT) == 24, "HandPoseTypeInfoMSFT has size % instead of 24", size_of(HandPoseTypeInfoMSFT));
}

PFN_xrCreateHandMeshSpaceMSFT :: #type (a0: HandTrackerEXT, a1: *HandMeshSpaceCreateInfoMSFT, a2: *Space) -> Result #c_call;
PFN_xrUpdateHandMeshMSFT :: #type (a0: HandTrackerEXT, a1: *HandMeshUpdateInfoMSFT, a2: *HandMeshMSFT) -> Result #c_call;

// XrSecondaryViewConfigurationSessionBeginInfoMSFT extends XrSessionBeginInfo
SecondaryViewConfigurationSessionBeginInfoMSFT :: struct {
    type:                          StructureType;
    next:                          *void;
    viewConfigurationCount:        u32;
    enabledViewConfigurationTypes: *ViewConfigurationType;
}
#run {
    instance: SecondaryViewConfigurationSessionBeginInfoMSFT;
    assert(((cast(*void)(*instance.type)) - cast(*void)(*instance)) == 0, "SecondaryViewConfigurationSessionBeginInfoMSFT.type has unexpected offset % instead of 0", ((cast(*void)(*instance.type)) - cast(*void)(*instance)));
    assert(size_of(type_of(SecondaryViewConfigurationSessionBeginInfoMSFT.type)) == 4, "SecondaryViewConfigurationSessionBeginInfoMSFT.type has unexpected size % instead of 4", size_of(type_of(SecondaryViewConfigurationSessionBeginInfoMSFT.type)));
    assert(((cast(*void)(*instance.next)) - cast(*void)(*instance)) == 8, "SecondaryViewConfigurationSessionBeginInfoMSFT.next has unexpected offset % instead of 8", ((cast(*void)(*instance.next)) - cast(*void)(*instance)));
    assert(size_of(type_of(SecondaryViewConfigurationSessionBeginInfoMSFT.next)) == 8, "SecondaryViewConfigurationSessionBeginInfoMSFT.next has unexpected size % instead of 8", size_of(type_of(SecondaryViewConfigurationSessionBeginInfoMSFT.next)));
    assert(((cast(*void)(*instance.viewConfigurationCount)) - cast(*void)(*instance)) == 16, "SecondaryViewConfigurationSessionBeginInfoMSFT.viewConfigurationCount has unexpected offset % instead of 16", ((cast(*void)(*instance.viewConfigurationCount)) - cast(*void)(*instance)));
    assert(size_of(type_of(SecondaryViewConfigurationSessionBeginInfoMSFT.viewConfigurationCount)) == 4, "SecondaryViewConfigurationSessionBeginInfoMSFT.viewConfigurationCount has unexpected size % instead of 4", size_of(type_of(SecondaryViewConfigurationSessionBeginInfoMSFT.viewConfigurationCount)));
    assert(((cast(*void)(*instance.enabledViewConfigurationTypes)) - cast(*void)(*instance)) == 24, "SecondaryViewConfigurationSessionBeginInfoMSFT.enabledViewConfigurationTypes has unexpected offset % instead of 24", ((cast(*void)(*instance.enabledViewConfigurationTypes)) - cast(*void)(*instance)));
    assert(size_of(type_of(SecondaryViewConfigurationSessionBeginInfoMSFT.enabledViewConfigurationTypes)) == 8, "SecondaryViewConfigurationSessionBeginInfoMSFT.enabledViewConfigurationTypes has unexpected size % instead of 8", size_of(type_of(SecondaryViewConfigurationSessionBeginInfoMSFT.enabledViewConfigurationTypes)));
    assert(size_of(SecondaryViewConfigurationSessionBeginInfoMSFT) == 32, "SecondaryViewConfigurationSessionBeginInfoMSFT has size % instead of 32", size_of(SecondaryViewConfigurationSessionBeginInfoMSFT));
}

SecondaryViewConfigurationStateMSFT :: struct {
    type:                  StructureType;
    next:                  *void;
    viewConfigurationType: ViewConfigurationType;
    active:                Bool32;
}
#run {
    instance: SecondaryViewConfigurationStateMSFT;
    assert(((cast(*void)(*instance.type)) - cast(*void)(*instance)) == 0, "SecondaryViewConfigurationStateMSFT.type has unexpected offset % instead of 0", ((cast(*void)(*instance.type)) - cast(*void)(*instance)));
    assert(size_of(type_of(SecondaryViewConfigurationStateMSFT.type)) == 4, "SecondaryViewConfigurationStateMSFT.type has unexpected size % instead of 4", size_of(type_of(SecondaryViewConfigurationStateMSFT.type)));
    assert(((cast(*void)(*instance.next)) - cast(*void)(*instance)) == 8, "SecondaryViewConfigurationStateMSFT.next has unexpected offset % instead of 8", ((cast(*void)(*instance.next)) - cast(*void)(*instance)));
    assert(size_of(type_of(SecondaryViewConfigurationStateMSFT.next)) == 8, "SecondaryViewConfigurationStateMSFT.next has unexpected size % instead of 8", size_of(type_of(SecondaryViewConfigurationStateMSFT.next)));
    assert(((cast(*void)(*instance.viewConfigurationType)) - cast(*void)(*instance)) == 16, "SecondaryViewConfigurationStateMSFT.viewConfigurationType has unexpected offset % instead of 16", ((cast(*void)(*instance.viewConfigurationType)) - cast(*void)(*instance)));
    assert(size_of(type_of(SecondaryViewConfigurationStateMSFT.viewConfigurationType)) == 4, "SecondaryViewConfigurationStateMSFT.viewConfigurationType has unexpected size % instead of 4", size_of(type_of(SecondaryViewConfigurationStateMSFT.viewConfigurationType)));
    assert(((cast(*void)(*instance.active)) - cast(*void)(*instance)) == 20, "SecondaryViewConfigurationStateMSFT.active has unexpected offset % instead of 20", ((cast(*void)(*instance.active)) - cast(*void)(*instance)));
    assert(size_of(type_of(SecondaryViewConfigurationStateMSFT.active)) == 4, "SecondaryViewConfigurationStateMSFT.active has unexpected size % instead of 4", size_of(type_of(SecondaryViewConfigurationStateMSFT.active)));
    assert(size_of(SecondaryViewConfigurationStateMSFT) == 24, "SecondaryViewConfigurationStateMSFT has size % instead of 24", size_of(SecondaryViewConfigurationStateMSFT));
}

// XrSecondaryViewConfigurationFrameStateMSFT extends XrFrameState
SecondaryViewConfigurationFrameStateMSFT :: struct {
    type:                    StructureType;
    next:                    *void;
    viewConfigurationCount:  u32;
    viewConfigurationStates: *SecondaryViewConfigurationStateMSFT;
}
#run {
    instance: SecondaryViewConfigurationFrameStateMSFT;
    assert(((cast(*void)(*instance.type)) - cast(*void)(*instance)) == 0, "SecondaryViewConfigurationFrameStateMSFT.type has unexpected offset % instead of 0", ((cast(*void)(*instance.type)) - cast(*void)(*instance)));
    assert(size_of(type_of(SecondaryViewConfigurationFrameStateMSFT.type)) == 4, "SecondaryViewConfigurationFrameStateMSFT.type has unexpected size % instead of 4", size_of(type_of(SecondaryViewConfigurationFrameStateMSFT.type)));
    assert(((cast(*void)(*instance.next)) - cast(*void)(*instance)) == 8, "SecondaryViewConfigurationFrameStateMSFT.next has unexpected offset % instead of 8", ((cast(*void)(*instance.next)) - cast(*void)(*instance)));
    assert(size_of(type_of(SecondaryViewConfigurationFrameStateMSFT.next)) == 8, "SecondaryViewConfigurationFrameStateMSFT.next has unexpected size % instead of 8", size_of(type_of(SecondaryViewConfigurationFrameStateMSFT.next)));
    assert(((cast(*void)(*instance.viewConfigurationCount)) - cast(*void)(*instance)) == 16, "SecondaryViewConfigurationFrameStateMSFT.viewConfigurationCount has unexpected offset % instead of 16", ((cast(*void)(*instance.viewConfigurationCount)) - cast(*void)(*instance)));
    assert(size_of(type_of(SecondaryViewConfigurationFrameStateMSFT.viewConfigurationCount)) == 4, "SecondaryViewConfigurationFrameStateMSFT.viewConfigurationCount has unexpected size % instead of 4", size_of(type_of(SecondaryViewConfigurationFrameStateMSFT.viewConfigurationCount)));
    assert(((cast(*void)(*instance.viewConfigurationStates)) - cast(*void)(*instance)) == 24, "SecondaryViewConfigurationFrameStateMSFT.viewConfigurationStates has unexpected offset % instead of 24", ((cast(*void)(*instance.viewConfigurationStates)) - cast(*void)(*instance)));
    assert(size_of(type_of(SecondaryViewConfigurationFrameStateMSFT.viewConfigurationStates)) == 8, "SecondaryViewConfigurationFrameStateMSFT.viewConfigurationStates has unexpected size % instead of 8", size_of(type_of(SecondaryViewConfigurationFrameStateMSFT.viewConfigurationStates)));
    assert(size_of(SecondaryViewConfigurationFrameStateMSFT) == 32, "SecondaryViewConfigurationFrameStateMSFT has size % instead of 32", size_of(SecondaryViewConfigurationFrameStateMSFT));
}

SecondaryViewConfigurationLayerInfoMSFT :: struct {
    type:                  StructureType;
    next:                  *void;
    viewConfigurationType: ViewConfigurationType;
    environmentBlendMode:  EnvironmentBlendMode;
    layerCount:            u32;
    layers:                **CompositionLayerBaseHeader;
}
#run {
    instance: SecondaryViewConfigurationLayerInfoMSFT;
    assert(((cast(*void)(*instance.type)) - cast(*void)(*instance)) == 0, "SecondaryViewConfigurationLayerInfoMSFT.type has unexpected offset % instead of 0", ((cast(*void)(*instance.type)) - cast(*void)(*instance)));
    assert(size_of(type_of(SecondaryViewConfigurationLayerInfoMSFT.type)) == 4, "SecondaryViewConfigurationLayerInfoMSFT.type has unexpected size % instead of 4", size_of(type_of(SecondaryViewConfigurationLayerInfoMSFT.type)));
    assert(((cast(*void)(*instance.next)) - cast(*void)(*instance)) == 8, "SecondaryViewConfigurationLayerInfoMSFT.next has unexpected offset % instead of 8", ((cast(*void)(*instance.next)) - cast(*void)(*instance)));
    assert(size_of(type_of(SecondaryViewConfigurationLayerInfoMSFT.next)) == 8, "SecondaryViewConfigurationLayerInfoMSFT.next has unexpected size % instead of 8", size_of(type_of(SecondaryViewConfigurationLayerInfoMSFT.next)));
    assert(((cast(*void)(*instance.viewConfigurationType)) - cast(*void)(*instance)) == 16, "SecondaryViewConfigurationLayerInfoMSFT.viewConfigurationType has unexpected offset % instead of 16", ((cast(*void)(*instance.viewConfigurationType)) - cast(*void)(*instance)));
    assert(size_of(type_of(SecondaryViewConfigurationLayerInfoMSFT.viewConfigurationType)) == 4, "SecondaryViewConfigurationLayerInfoMSFT.viewConfigurationType has unexpected size % instead of 4", size_of(type_of(SecondaryViewConfigurationLayerInfoMSFT.viewConfigurationType)));
    assert(((cast(*void)(*instance.environmentBlendMode)) - cast(*void)(*instance)) == 20, "SecondaryViewConfigurationLayerInfoMSFT.environmentBlendMode has unexpected offset % instead of 20", ((cast(*void)(*instance.environmentBlendMode)) - cast(*void)(*instance)));
    assert(size_of(type_of(SecondaryViewConfigurationLayerInfoMSFT.environmentBlendMode)) == 4, "SecondaryViewConfigurationLayerInfoMSFT.environmentBlendMode has unexpected size % instead of 4", size_of(type_of(SecondaryViewConfigurationLayerInfoMSFT.environmentBlendMode)));
    assert(((cast(*void)(*instance.layerCount)) - cast(*void)(*instance)) == 24, "SecondaryViewConfigurationLayerInfoMSFT.layerCount has unexpected offset % instead of 24", ((cast(*void)(*instance.layerCount)) - cast(*void)(*instance)));
    assert(size_of(type_of(SecondaryViewConfigurationLayerInfoMSFT.layerCount)) == 4, "SecondaryViewConfigurationLayerInfoMSFT.layerCount has unexpected size % instead of 4", size_of(type_of(SecondaryViewConfigurationLayerInfoMSFT.layerCount)));
    assert(((cast(*void)(*instance.layers)) - cast(*void)(*instance)) == 32, "SecondaryViewConfigurationLayerInfoMSFT.layers has unexpected offset % instead of 32", ((cast(*void)(*instance.layers)) - cast(*void)(*instance)));
    assert(size_of(type_of(SecondaryViewConfigurationLayerInfoMSFT.layers)) == 8, "SecondaryViewConfigurationLayerInfoMSFT.layers has unexpected size % instead of 8", size_of(type_of(SecondaryViewConfigurationLayerInfoMSFT.layers)));
    assert(size_of(SecondaryViewConfigurationLayerInfoMSFT) == 40, "SecondaryViewConfigurationLayerInfoMSFT has size % instead of 40", size_of(SecondaryViewConfigurationLayerInfoMSFT));
}

// XrSecondaryViewConfigurationFrameEndInfoMSFT extends XrFrameEndInfo
SecondaryViewConfigurationFrameEndInfoMSFT :: struct {
    type:                        StructureType;
    next:                        *void;
    viewConfigurationCount:      u32;
    viewConfigurationLayersInfo: *SecondaryViewConfigurationLayerInfoMSFT;
}
#run {
    instance: SecondaryViewConfigurationFrameEndInfoMSFT;
    assert(((cast(*void)(*instance.type)) - cast(*void)(*instance)) == 0, "SecondaryViewConfigurationFrameEndInfoMSFT.type has unexpected offset % instead of 0", ((cast(*void)(*instance.type)) - cast(*void)(*instance)));
    assert(size_of(type_of(SecondaryViewConfigurationFrameEndInfoMSFT.type)) == 4, "SecondaryViewConfigurationFrameEndInfoMSFT.type has unexpected size % instead of 4", size_of(type_of(SecondaryViewConfigurationFrameEndInfoMSFT.type)));
    assert(((cast(*void)(*instance.next)) - cast(*void)(*instance)) == 8, "SecondaryViewConfigurationFrameEndInfoMSFT.next has unexpected offset % instead of 8", ((cast(*void)(*instance.next)) - cast(*void)(*instance)));
    assert(size_of(type_of(SecondaryViewConfigurationFrameEndInfoMSFT.next)) == 8, "SecondaryViewConfigurationFrameEndInfoMSFT.next has unexpected size % instead of 8", size_of(type_of(SecondaryViewConfigurationFrameEndInfoMSFT.next)));
    assert(((cast(*void)(*instance.viewConfigurationCount)) - cast(*void)(*instance)) == 16, "SecondaryViewConfigurationFrameEndInfoMSFT.viewConfigurationCount has unexpected offset % instead of 16", ((cast(*void)(*instance.viewConfigurationCount)) - cast(*void)(*instance)));
    assert(size_of(type_of(SecondaryViewConfigurationFrameEndInfoMSFT.viewConfigurationCount)) == 4, "SecondaryViewConfigurationFrameEndInfoMSFT.viewConfigurationCount has unexpected size % instead of 4", size_of(type_of(SecondaryViewConfigurationFrameEndInfoMSFT.viewConfigurationCount)));
    assert(((cast(*void)(*instance.viewConfigurationLayersInfo)) - cast(*void)(*instance)) == 24, "SecondaryViewConfigurationFrameEndInfoMSFT.viewConfigurationLayersInfo has unexpected offset % instead of 24", ((cast(*void)(*instance.viewConfigurationLayersInfo)) - cast(*void)(*instance)));
    assert(size_of(type_of(SecondaryViewConfigurationFrameEndInfoMSFT.viewConfigurationLayersInfo)) == 8, "SecondaryViewConfigurationFrameEndInfoMSFT.viewConfigurationLayersInfo has unexpected size % instead of 8", size_of(type_of(SecondaryViewConfigurationFrameEndInfoMSFT.viewConfigurationLayersInfo)));
    assert(size_of(SecondaryViewConfigurationFrameEndInfoMSFT) == 32, "SecondaryViewConfigurationFrameEndInfoMSFT has size % instead of 32", size_of(SecondaryViewConfigurationFrameEndInfoMSFT));
}

// XrSecondaryViewConfigurationSwapchainCreateInfoMSFT extends XrSwapchainCreateInfo
SecondaryViewConfigurationSwapchainCreateInfoMSFT :: struct {
    type:                  StructureType;
    next:                  *void;
    viewConfigurationType: ViewConfigurationType;
}
#run {
    instance: SecondaryViewConfigurationSwapchainCreateInfoMSFT;
    assert(((cast(*void)(*instance.type)) - cast(*void)(*instance)) == 0, "SecondaryViewConfigurationSwapchainCreateInfoMSFT.type has unexpected offset % instead of 0", ((cast(*void)(*instance.type)) - cast(*void)(*instance)));
    assert(size_of(type_of(SecondaryViewConfigurationSwapchainCreateInfoMSFT.type)) == 4, "SecondaryViewConfigurationSwapchainCreateInfoMSFT.type has unexpected size % instead of 4", size_of(type_of(SecondaryViewConfigurationSwapchainCreateInfoMSFT.type)));
    assert(((cast(*void)(*instance.next)) - cast(*void)(*instance)) == 8, "SecondaryViewConfigurationSwapchainCreateInfoMSFT.next has unexpected offset % instead of 8", ((cast(*void)(*instance.next)) - cast(*void)(*instance)));
    assert(size_of(type_of(SecondaryViewConfigurationSwapchainCreateInfoMSFT.next)) == 8, "SecondaryViewConfigurationSwapchainCreateInfoMSFT.next has unexpected size % instead of 8", size_of(type_of(SecondaryViewConfigurationSwapchainCreateInfoMSFT.next)));
    assert(((cast(*void)(*instance.viewConfigurationType)) - cast(*void)(*instance)) == 16, "SecondaryViewConfigurationSwapchainCreateInfoMSFT.viewConfigurationType has unexpected offset % instead of 16", ((cast(*void)(*instance.viewConfigurationType)) - cast(*void)(*instance)));
    assert(size_of(type_of(SecondaryViewConfigurationSwapchainCreateInfoMSFT.viewConfigurationType)) == 4, "SecondaryViewConfigurationSwapchainCreateInfoMSFT.viewConfigurationType has unexpected size % instead of 4", size_of(type_of(SecondaryViewConfigurationSwapchainCreateInfoMSFT.viewConfigurationType)));
    assert(size_of(SecondaryViewConfigurationSwapchainCreateInfoMSFT) == 24, "SecondaryViewConfigurationSwapchainCreateInfoMSFT has size % instead of 24", size_of(SecondaryViewConfigurationSwapchainCreateInfoMSFT));
}

ControllerModelKeyMSFT :: u64;

ControllerModelKeyStateMSFT :: struct {
    type:     StructureType;
    next:     *void;
    modelKey: ControllerModelKeyMSFT;
}
#run {
    instance: ControllerModelKeyStateMSFT;
    assert(((cast(*void)(*instance.type)) - cast(*void)(*instance)) == 0, "ControllerModelKeyStateMSFT.type has unexpected offset % instead of 0", ((cast(*void)(*instance.type)) - cast(*void)(*instance)));
    assert(size_of(type_of(ControllerModelKeyStateMSFT.type)) == 4, "ControllerModelKeyStateMSFT.type has unexpected size % instead of 4", size_of(type_of(ControllerModelKeyStateMSFT.type)));
    assert(((cast(*void)(*instance.next)) - cast(*void)(*instance)) == 8, "ControllerModelKeyStateMSFT.next has unexpected offset % instead of 8", ((cast(*void)(*instance.next)) - cast(*void)(*instance)));
    assert(size_of(type_of(ControllerModelKeyStateMSFT.next)) == 8, "ControllerModelKeyStateMSFT.next has unexpected size % instead of 8", size_of(type_of(ControllerModelKeyStateMSFT.next)));
    assert(((cast(*void)(*instance.modelKey)) - cast(*void)(*instance)) == 16, "ControllerModelKeyStateMSFT.modelKey has unexpected offset % instead of 16", ((cast(*void)(*instance.modelKey)) - cast(*void)(*instance)));
    assert(size_of(type_of(ControllerModelKeyStateMSFT.modelKey)) == 8, "ControllerModelKeyStateMSFT.modelKey has unexpected size % instead of 8", size_of(type_of(ControllerModelKeyStateMSFT.modelKey)));
    assert(size_of(ControllerModelKeyStateMSFT) == 24, "ControllerModelKeyStateMSFT has size % instead of 24", size_of(ControllerModelKeyStateMSFT));
}

ControllerModelNodePropertiesMSFT :: struct {
    type:           StructureType;
    next:           *void;
    parentNodeName: [64] u8;
    nodeName:       [64] u8;
}
#run {
    instance: ControllerModelNodePropertiesMSFT;
    assert(((cast(*void)(*instance.type)) - cast(*void)(*instance)) == 0, "ControllerModelNodePropertiesMSFT.type has unexpected offset % instead of 0", ((cast(*void)(*instance.type)) - cast(*void)(*instance)));
    assert(size_of(type_of(ControllerModelNodePropertiesMSFT.type)) == 4, "ControllerModelNodePropertiesMSFT.type has unexpected size % instead of 4", size_of(type_of(ControllerModelNodePropertiesMSFT.type)));
    assert(((cast(*void)(*instance.next)) - cast(*void)(*instance)) == 8, "ControllerModelNodePropertiesMSFT.next has unexpected offset % instead of 8", ((cast(*void)(*instance.next)) - cast(*void)(*instance)));
    assert(size_of(type_of(ControllerModelNodePropertiesMSFT.next)) == 8, "ControllerModelNodePropertiesMSFT.next has unexpected size % instead of 8", size_of(type_of(ControllerModelNodePropertiesMSFT.next)));
    assert(((cast(*void)(*instance.parentNodeName)) - cast(*void)(*instance)) == 16, "ControllerModelNodePropertiesMSFT.parentNodeName has unexpected offset % instead of 16", ((cast(*void)(*instance.parentNodeName)) - cast(*void)(*instance)));
    assert(size_of(type_of(ControllerModelNodePropertiesMSFT.parentNodeName)) == 64, "ControllerModelNodePropertiesMSFT.parentNodeName has unexpected size % instead of 64", size_of(type_of(ControllerModelNodePropertiesMSFT.parentNodeName)));
    assert(((cast(*void)(*instance.nodeName)) - cast(*void)(*instance)) == 80, "ControllerModelNodePropertiesMSFT.nodeName has unexpected offset % instead of 80", ((cast(*void)(*instance.nodeName)) - cast(*void)(*instance)));
    assert(size_of(type_of(ControllerModelNodePropertiesMSFT.nodeName)) == 64, "ControllerModelNodePropertiesMSFT.nodeName has unexpected size % instead of 64", size_of(type_of(ControllerModelNodePropertiesMSFT.nodeName)));
    assert(size_of(ControllerModelNodePropertiesMSFT) == 144, "ControllerModelNodePropertiesMSFT has size % instead of 144", size_of(ControllerModelNodePropertiesMSFT));
}

ControllerModelPropertiesMSFT :: struct {
    type:              StructureType;
    next:              *void;
    nodeCapacityInput: u32;
    nodeCountOutput:   u32;
    nodeProperties:    *ControllerModelNodePropertiesMSFT;
}
#run {
    instance: ControllerModelPropertiesMSFT;
    assert(((cast(*void)(*instance.type)) - cast(*void)(*instance)) == 0, "ControllerModelPropertiesMSFT.type has unexpected offset % instead of 0", ((cast(*void)(*instance.type)) - cast(*void)(*instance)));
    assert(size_of(type_of(ControllerModelPropertiesMSFT.type)) == 4, "ControllerModelPropertiesMSFT.type has unexpected size % instead of 4", size_of(type_of(ControllerModelPropertiesMSFT.type)));
    assert(((cast(*void)(*instance.next)) - cast(*void)(*instance)) == 8, "ControllerModelPropertiesMSFT.next has unexpected offset % instead of 8", ((cast(*void)(*instance.next)) - cast(*void)(*instance)));
    assert(size_of(type_of(ControllerModelPropertiesMSFT.next)) == 8, "ControllerModelPropertiesMSFT.next has unexpected size % instead of 8", size_of(type_of(ControllerModelPropertiesMSFT.next)));
    assert(((cast(*void)(*instance.nodeCapacityInput)) - cast(*void)(*instance)) == 16, "ControllerModelPropertiesMSFT.nodeCapacityInput has unexpected offset % instead of 16", ((cast(*void)(*instance.nodeCapacityInput)) - cast(*void)(*instance)));
    assert(size_of(type_of(ControllerModelPropertiesMSFT.nodeCapacityInput)) == 4, "ControllerModelPropertiesMSFT.nodeCapacityInput has unexpected size % instead of 4", size_of(type_of(ControllerModelPropertiesMSFT.nodeCapacityInput)));
    assert(((cast(*void)(*instance.nodeCountOutput)) - cast(*void)(*instance)) == 20, "ControllerModelPropertiesMSFT.nodeCountOutput has unexpected offset % instead of 20", ((cast(*void)(*instance.nodeCountOutput)) - cast(*void)(*instance)));
    assert(size_of(type_of(ControllerModelPropertiesMSFT.nodeCountOutput)) == 4, "ControllerModelPropertiesMSFT.nodeCountOutput has unexpected size % instead of 4", size_of(type_of(ControllerModelPropertiesMSFT.nodeCountOutput)));
    assert(((cast(*void)(*instance.nodeProperties)) - cast(*void)(*instance)) == 24, "ControllerModelPropertiesMSFT.nodeProperties has unexpected offset % instead of 24", ((cast(*void)(*instance.nodeProperties)) - cast(*void)(*instance)));
    assert(size_of(type_of(ControllerModelPropertiesMSFT.nodeProperties)) == 8, "ControllerModelPropertiesMSFT.nodeProperties has unexpected size % instead of 8", size_of(type_of(ControllerModelPropertiesMSFT.nodeProperties)));
    assert(size_of(ControllerModelPropertiesMSFT) == 32, "ControllerModelPropertiesMSFT has size % instead of 32", size_of(ControllerModelPropertiesMSFT));
}

ControllerModelNodeStateMSFT :: struct {
    type:     StructureType;
    next:     *void;
    nodePose: Posef;
}
#run {
    instance: ControllerModelNodeStateMSFT;
    assert(((cast(*void)(*instance.type)) - cast(*void)(*instance)) == 0, "ControllerModelNodeStateMSFT.type has unexpected offset % instead of 0", ((cast(*void)(*instance.type)) - cast(*void)(*instance)));
    assert(size_of(type_of(ControllerModelNodeStateMSFT.type)) == 4, "ControllerModelNodeStateMSFT.type has unexpected size % instead of 4", size_of(type_of(ControllerModelNodeStateMSFT.type)));
    assert(((cast(*void)(*instance.next)) - cast(*void)(*instance)) == 8, "ControllerModelNodeStateMSFT.next has unexpected offset % instead of 8", ((cast(*void)(*instance.next)) - cast(*void)(*instance)));
    assert(size_of(type_of(ControllerModelNodeStateMSFT.next)) == 8, "ControllerModelNodeStateMSFT.next has unexpected size % instead of 8", size_of(type_of(ControllerModelNodeStateMSFT.next)));
    assert(((cast(*void)(*instance.nodePose)) - cast(*void)(*instance)) == 16, "ControllerModelNodeStateMSFT.nodePose has unexpected offset % instead of 16", ((cast(*void)(*instance.nodePose)) - cast(*void)(*instance)));
    assert(size_of(type_of(ControllerModelNodeStateMSFT.nodePose)) == 28, "ControllerModelNodeStateMSFT.nodePose has unexpected size % instead of 28", size_of(type_of(ControllerModelNodeStateMSFT.nodePose)));
    assert(size_of(ControllerModelNodeStateMSFT) == 48, "ControllerModelNodeStateMSFT has size % instead of 48", size_of(ControllerModelNodeStateMSFT));
}

ControllerModelStateMSFT :: struct {
    type:              StructureType;
    next:              *void;
    nodeCapacityInput: u32;
    nodeCountOutput:   u32;
    nodeStates:        *ControllerModelNodeStateMSFT;
}
#run {
    instance: ControllerModelStateMSFT;
    assert(((cast(*void)(*instance.type)) - cast(*void)(*instance)) == 0, "ControllerModelStateMSFT.type has unexpected offset % instead of 0", ((cast(*void)(*instance.type)) - cast(*void)(*instance)));
    assert(size_of(type_of(ControllerModelStateMSFT.type)) == 4, "ControllerModelStateMSFT.type has unexpected size % instead of 4", size_of(type_of(ControllerModelStateMSFT.type)));
    assert(((cast(*void)(*instance.next)) - cast(*void)(*instance)) == 8, "ControllerModelStateMSFT.next has unexpected offset % instead of 8", ((cast(*void)(*instance.next)) - cast(*void)(*instance)));
    assert(size_of(type_of(ControllerModelStateMSFT.next)) == 8, "ControllerModelStateMSFT.next has unexpected size % instead of 8", size_of(type_of(ControllerModelStateMSFT.next)));
    assert(((cast(*void)(*instance.nodeCapacityInput)) - cast(*void)(*instance)) == 16, "ControllerModelStateMSFT.nodeCapacityInput has unexpected offset % instead of 16", ((cast(*void)(*instance.nodeCapacityInput)) - cast(*void)(*instance)));
    assert(size_of(type_of(ControllerModelStateMSFT.nodeCapacityInput)) == 4, "ControllerModelStateMSFT.nodeCapacityInput has unexpected size % instead of 4", size_of(type_of(ControllerModelStateMSFT.nodeCapacityInput)));
    assert(((cast(*void)(*instance.nodeCountOutput)) - cast(*void)(*instance)) == 20, "ControllerModelStateMSFT.nodeCountOutput has unexpected offset % instead of 20", ((cast(*void)(*instance.nodeCountOutput)) - cast(*void)(*instance)));
    assert(size_of(type_of(ControllerModelStateMSFT.nodeCountOutput)) == 4, "ControllerModelStateMSFT.nodeCountOutput has unexpected size % instead of 4", size_of(type_of(ControllerModelStateMSFT.nodeCountOutput)));
    assert(((cast(*void)(*instance.nodeStates)) - cast(*void)(*instance)) == 24, "ControllerModelStateMSFT.nodeStates has unexpected offset % instead of 24", ((cast(*void)(*instance.nodeStates)) - cast(*void)(*instance)));
    assert(size_of(type_of(ControllerModelStateMSFT.nodeStates)) == 8, "ControllerModelStateMSFT.nodeStates has unexpected size % instead of 8", size_of(type_of(ControllerModelStateMSFT.nodeStates)));
    assert(size_of(ControllerModelStateMSFT) == 32, "ControllerModelStateMSFT has size % instead of 32", size_of(ControllerModelStateMSFT));
}

PFN_xrGetControllerModelKeyMSFT :: #type (a0: Session, a1: Path, a2: *ControllerModelKeyStateMSFT) -> Result #c_call;
PFN_xrLoadControllerModelMSFT :: #type (a0: Session, a1: ControllerModelKeyMSFT, a2: u32, a3: *u32, a4: *u8) -> Result #c_call;
PFN_xrGetControllerModelPropertiesMSFT :: #type (a0: Session, a1: ControllerModelKeyMSFT, a2: *ControllerModelPropertiesMSFT) -> Result #c_call;
PFN_xrGetControllerModelStateMSFT :: #type (a0: Session, a1: ControllerModelKeyMSFT, a2: *ControllerModelStateMSFT) -> Result #c_call;

// XrViewConfigurationViewFovEPIC extends XrViewConfigurationView
ViewConfigurationViewFovEPIC :: struct {
    type:           StructureType;
    next:           *void;
    recommendedFov: Fovf;
    maxMutableFov:  Fovf;
}
#run {
    instance: ViewConfigurationViewFovEPIC;
    assert(((cast(*void)(*instance.type)) - cast(*void)(*instance)) == 0, "ViewConfigurationViewFovEPIC.type has unexpected offset % instead of 0", ((cast(*void)(*instance.type)) - cast(*void)(*instance)));
    assert(size_of(type_of(ViewConfigurationViewFovEPIC.type)) == 4, "ViewConfigurationViewFovEPIC.type has unexpected size % instead of 4", size_of(type_of(ViewConfigurationViewFovEPIC.type)));
    assert(((cast(*void)(*instance.next)) - cast(*void)(*instance)) == 8, "ViewConfigurationViewFovEPIC.next has unexpected offset % instead of 8", ((cast(*void)(*instance.next)) - cast(*void)(*instance)));
    assert(size_of(type_of(ViewConfigurationViewFovEPIC.next)) == 8, "ViewConfigurationViewFovEPIC.next has unexpected size % instead of 8", size_of(type_of(ViewConfigurationViewFovEPIC.next)));
    assert(((cast(*void)(*instance.recommendedFov)) - cast(*void)(*instance)) == 16, "ViewConfigurationViewFovEPIC.recommendedFov has unexpected offset % instead of 16", ((cast(*void)(*instance.recommendedFov)) - cast(*void)(*instance)));
    assert(size_of(type_of(ViewConfigurationViewFovEPIC.recommendedFov)) == 16, "ViewConfigurationViewFovEPIC.recommendedFov has unexpected size % instead of 16", size_of(type_of(ViewConfigurationViewFovEPIC.recommendedFov)));
    assert(((cast(*void)(*instance.maxMutableFov)) - cast(*void)(*instance)) == 32, "ViewConfigurationViewFovEPIC.maxMutableFov has unexpected offset % instead of 32", ((cast(*void)(*instance.maxMutableFov)) - cast(*void)(*instance)));
    assert(size_of(type_of(ViewConfigurationViewFovEPIC.maxMutableFov)) == 16, "ViewConfigurationViewFovEPIC.maxMutableFov has unexpected size % instead of 16", size_of(type_of(ViewConfigurationViewFovEPIC.maxMutableFov)));
    assert(size_of(ViewConfigurationViewFovEPIC) == 48, "ViewConfigurationViewFovEPIC has size % instead of 48", size_of(ViewConfigurationViewFovEPIC));
}

ReprojectionModeMSFT :: enum s32 {
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
CompositionLayerReprojectionInfoMSFT :: struct {
    type:             StructureType;
    next:             *void;
    reprojectionMode: ReprojectionModeMSFT;
}
#run {
    instance: CompositionLayerReprojectionInfoMSFT;
    assert(((cast(*void)(*instance.type)) - cast(*void)(*instance)) == 0, "CompositionLayerReprojectionInfoMSFT.type has unexpected offset % instead of 0", ((cast(*void)(*instance.type)) - cast(*void)(*instance)));
    assert(size_of(type_of(CompositionLayerReprojectionInfoMSFT.type)) == 4, "CompositionLayerReprojectionInfoMSFT.type has unexpected size % instead of 4", size_of(type_of(CompositionLayerReprojectionInfoMSFT.type)));
    assert(((cast(*void)(*instance.next)) - cast(*void)(*instance)) == 8, "CompositionLayerReprojectionInfoMSFT.next has unexpected offset % instead of 8", ((cast(*void)(*instance.next)) - cast(*void)(*instance)));
    assert(size_of(type_of(CompositionLayerReprojectionInfoMSFT.next)) == 8, "CompositionLayerReprojectionInfoMSFT.next has unexpected size % instead of 8", size_of(type_of(CompositionLayerReprojectionInfoMSFT.next)));
    assert(((cast(*void)(*instance.reprojectionMode)) - cast(*void)(*instance)) == 16, "CompositionLayerReprojectionInfoMSFT.reprojectionMode has unexpected offset % instead of 16", ((cast(*void)(*instance.reprojectionMode)) - cast(*void)(*instance)));
    assert(size_of(type_of(CompositionLayerReprojectionInfoMSFT.reprojectionMode)) == 4, "CompositionLayerReprojectionInfoMSFT.reprojectionMode has unexpected size % instead of 4", size_of(type_of(CompositionLayerReprojectionInfoMSFT.reprojectionMode)));
    assert(size_of(CompositionLayerReprojectionInfoMSFT) == 24, "CompositionLayerReprojectionInfoMSFT has size % instead of 24", size_of(CompositionLayerReprojectionInfoMSFT));
}

// XrCompositionLayerReprojectionPlaneOverrideMSFT extends XrCompositionLayerProjection
CompositionLayerReprojectionPlaneOverrideMSFT :: struct {
    type:     StructureType;
    next:     *void;
    position: Vector3f;
    normal:   Vector3f;
    velocity: Vector3f;
}
#run {
    instance: CompositionLayerReprojectionPlaneOverrideMSFT;
    assert(((cast(*void)(*instance.type)) - cast(*void)(*instance)) == 0, "CompositionLayerReprojectionPlaneOverrideMSFT.type has unexpected offset % instead of 0", ((cast(*void)(*instance.type)) - cast(*void)(*instance)));
    assert(size_of(type_of(CompositionLayerReprojectionPlaneOverrideMSFT.type)) == 4, "CompositionLayerReprojectionPlaneOverrideMSFT.type has unexpected size % instead of 4", size_of(type_of(CompositionLayerReprojectionPlaneOverrideMSFT.type)));
    assert(((cast(*void)(*instance.next)) - cast(*void)(*instance)) == 8, "CompositionLayerReprojectionPlaneOverrideMSFT.next has unexpected offset % instead of 8", ((cast(*void)(*instance.next)) - cast(*void)(*instance)));
    assert(size_of(type_of(CompositionLayerReprojectionPlaneOverrideMSFT.next)) == 8, "CompositionLayerReprojectionPlaneOverrideMSFT.next has unexpected size % instead of 8", size_of(type_of(CompositionLayerReprojectionPlaneOverrideMSFT.next)));
    assert(((cast(*void)(*instance.position)) - cast(*void)(*instance)) == 16, "CompositionLayerReprojectionPlaneOverrideMSFT.position has unexpected offset % instead of 16", ((cast(*void)(*instance.position)) - cast(*void)(*instance)));
    assert(size_of(type_of(CompositionLayerReprojectionPlaneOverrideMSFT.position)) == 12, "CompositionLayerReprojectionPlaneOverrideMSFT.position has unexpected size % instead of 12", size_of(type_of(CompositionLayerReprojectionPlaneOverrideMSFT.position)));
    assert(((cast(*void)(*instance.normal)) - cast(*void)(*instance)) == 28, "CompositionLayerReprojectionPlaneOverrideMSFT.normal has unexpected offset % instead of 28", ((cast(*void)(*instance.normal)) - cast(*void)(*instance)));
    assert(size_of(type_of(CompositionLayerReprojectionPlaneOverrideMSFT.normal)) == 12, "CompositionLayerReprojectionPlaneOverrideMSFT.normal has unexpected size % instead of 12", size_of(type_of(CompositionLayerReprojectionPlaneOverrideMSFT.normal)));
    assert(((cast(*void)(*instance.velocity)) - cast(*void)(*instance)) == 40, "CompositionLayerReprojectionPlaneOverrideMSFT.velocity has unexpected offset % instead of 40", ((cast(*void)(*instance.velocity)) - cast(*void)(*instance)));
    assert(size_of(type_of(CompositionLayerReprojectionPlaneOverrideMSFT.velocity)) == 12, "CompositionLayerReprojectionPlaneOverrideMSFT.velocity has unexpected size % instead of 12", size_of(type_of(CompositionLayerReprojectionPlaneOverrideMSFT.velocity)));
    assert(size_of(CompositionLayerReprojectionPlaneOverrideMSFT) == 56, "CompositionLayerReprojectionPlaneOverrideMSFT has size % instead of 56", size_of(CompositionLayerReprojectionPlaneOverrideMSFT));
}

PFN_xrEnumerateReprojectionModesMSFT :: #type (a0: Instance, a1: SystemId, a2: ViewConfigurationType, a3: u32, a4: *u32, a5: *ReprojectionModeMSFT) -> Result #c_call;

SwapchainStateBaseHeaderFB :: struct {
    type: StructureType;
    next: *void;
}
#run {
    instance: SwapchainStateBaseHeaderFB;
    assert(((cast(*void)(*instance.type)) - cast(*void)(*instance)) == 0, "SwapchainStateBaseHeaderFB.type has unexpected offset % instead of 0", ((cast(*void)(*instance.type)) - cast(*void)(*instance)));
    assert(size_of(type_of(SwapchainStateBaseHeaderFB.type)) == 4, "SwapchainStateBaseHeaderFB.type has unexpected size % instead of 4", size_of(type_of(SwapchainStateBaseHeaderFB.type)));
    assert(((cast(*void)(*instance.next)) - cast(*void)(*instance)) == 8, "SwapchainStateBaseHeaderFB.next has unexpected offset % instead of 8", ((cast(*void)(*instance.next)) - cast(*void)(*instance)));
    assert(size_of(type_of(SwapchainStateBaseHeaderFB.next)) == 8, "SwapchainStateBaseHeaderFB.next has unexpected size % instead of 8", size_of(type_of(SwapchainStateBaseHeaderFB.next)));
    assert(size_of(SwapchainStateBaseHeaderFB) == 16, "SwapchainStateBaseHeaderFB has size % instead of 16", size_of(SwapchainStateBaseHeaderFB));
}

PFN_xrUpdateSwapchainFB :: #type (a0: Swapchain, a1: *SwapchainStateBaseHeaderFB) -> Result #c_call;
PFN_xrGetSwapchainStateFB :: #type (a0: Swapchain, a1: *SwapchainStateBaseHeaderFB) -> Result #c_call;

CompositionLayerSecureContentFlagsFB :: Flags64;

// Flag bits for XrCompositionLayerSecureContentFlagsFB
XR_COMPOSITION_LAYER_SECURE_CONTENT_EXCLUDE_LAYER_BIT_FB: CompositionLayerSecureContentFlagsFB : 1;
XR_COMPOSITION_LAYER_SECURE_CONTENT_REPLACE_LAYER_BIT_FB: CompositionLayerSecureContentFlagsFB : 2;

// XrCompositionLayerSecureContentFB extends XrCompositionLayerBaseHeader
CompositionLayerSecureContentFB :: struct {
    type:  StructureType;
    next:  *void;
    flags: CompositionLayerSecureContentFlagsFB;
}
#run {
    instance: CompositionLayerSecureContentFB;
    assert(((cast(*void)(*instance.type)) - cast(*void)(*instance)) == 0, "CompositionLayerSecureContentFB.type has unexpected offset % instead of 0", ((cast(*void)(*instance.type)) - cast(*void)(*instance)));
    assert(size_of(type_of(CompositionLayerSecureContentFB.type)) == 4, "CompositionLayerSecureContentFB.type has unexpected size % instead of 4", size_of(type_of(CompositionLayerSecureContentFB.type)));
    assert(((cast(*void)(*instance.next)) - cast(*void)(*instance)) == 8, "CompositionLayerSecureContentFB.next has unexpected offset % instead of 8", ((cast(*void)(*instance.next)) - cast(*void)(*instance)));
    assert(size_of(type_of(CompositionLayerSecureContentFB.next)) == 8, "CompositionLayerSecureContentFB.next has unexpected size % instead of 8", size_of(type_of(CompositionLayerSecureContentFB.next)));
    assert(((cast(*void)(*instance.flags)) - cast(*void)(*instance)) == 16, "CompositionLayerSecureContentFB.flags has unexpected offset % instead of 16", ((cast(*void)(*instance.flags)) - cast(*void)(*instance)));
    assert(size_of(type_of(CompositionLayerSecureContentFB.flags)) == 8, "CompositionLayerSecureContentFB.flags has unexpected size % instead of 8", size_of(type_of(CompositionLayerSecureContentFB.flags)));
    assert(size_of(CompositionLayerSecureContentFB) == 24, "CompositionLayerSecureContentFB has size % instead of 24", size_of(CompositionLayerSecureContentFB));
}

InteractionProfileDpadBindingEXT :: struct {
    type:                   StructureType;
    next:                   *void;
    binding:                Path;
    actionSet:              ActionSet;
    forceThreshold:         float;
    forceThresholdReleased: float;
    centerRegion:           float;
    wedgeAngle:             float;
    isSticky:               Bool32;
    onHaptic:               *HapticBaseHeader;
    offHaptic:              *HapticBaseHeader;
}
#run {
    instance: InteractionProfileDpadBindingEXT;
    assert(((cast(*void)(*instance.type)) - cast(*void)(*instance)) == 0, "InteractionProfileDpadBindingEXT.type has unexpected offset % instead of 0", ((cast(*void)(*instance.type)) - cast(*void)(*instance)));
    assert(size_of(type_of(InteractionProfileDpadBindingEXT.type)) == 4, "InteractionProfileDpadBindingEXT.type has unexpected size % instead of 4", size_of(type_of(InteractionProfileDpadBindingEXT.type)));
    assert(((cast(*void)(*instance.next)) - cast(*void)(*instance)) == 8, "InteractionProfileDpadBindingEXT.next has unexpected offset % instead of 8", ((cast(*void)(*instance.next)) - cast(*void)(*instance)));
    assert(size_of(type_of(InteractionProfileDpadBindingEXT.next)) == 8, "InteractionProfileDpadBindingEXT.next has unexpected size % instead of 8", size_of(type_of(InteractionProfileDpadBindingEXT.next)));
    assert(((cast(*void)(*instance.binding)) - cast(*void)(*instance)) == 16, "InteractionProfileDpadBindingEXT.binding has unexpected offset % instead of 16", ((cast(*void)(*instance.binding)) - cast(*void)(*instance)));
    assert(size_of(type_of(InteractionProfileDpadBindingEXT.binding)) == 8, "InteractionProfileDpadBindingEXT.binding has unexpected size % instead of 8", size_of(type_of(InteractionProfileDpadBindingEXT.binding)));
    assert(((cast(*void)(*instance.actionSet)) - cast(*void)(*instance)) == 24, "InteractionProfileDpadBindingEXT.actionSet has unexpected offset % instead of 24", ((cast(*void)(*instance.actionSet)) - cast(*void)(*instance)));
    assert(size_of(type_of(InteractionProfileDpadBindingEXT.actionSet)) == 8, "InteractionProfileDpadBindingEXT.actionSet has unexpected size % instead of 8", size_of(type_of(InteractionProfileDpadBindingEXT.actionSet)));
    assert(((cast(*void)(*instance.forceThreshold)) - cast(*void)(*instance)) == 32, "InteractionProfileDpadBindingEXT.forceThreshold has unexpected offset % instead of 32", ((cast(*void)(*instance.forceThreshold)) - cast(*void)(*instance)));
    assert(size_of(type_of(InteractionProfileDpadBindingEXT.forceThreshold)) == 4, "InteractionProfileDpadBindingEXT.forceThreshold has unexpected size % instead of 4", size_of(type_of(InteractionProfileDpadBindingEXT.forceThreshold)));
    assert(((cast(*void)(*instance.forceThresholdReleased)) - cast(*void)(*instance)) == 36, "InteractionProfileDpadBindingEXT.forceThresholdReleased has unexpected offset % instead of 36", ((cast(*void)(*instance.forceThresholdReleased)) - cast(*void)(*instance)));
    assert(size_of(type_of(InteractionProfileDpadBindingEXT.forceThresholdReleased)) == 4, "InteractionProfileDpadBindingEXT.forceThresholdReleased has unexpected size % instead of 4", size_of(type_of(InteractionProfileDpadBindingEXT.forceThresholdReleased)));
    assert(((cast(*void)(*instance.centerRegion)) - cast(*void)(*instance)) == 40, "InteractionProfileDpadBindingEXT.centerRegion has unexpected offset % instead of 40", ((cast(*void)(*instance.centerRegion)) - cast(*void)(*instance)));
    assert(size_of(type_of(InteractionProfileDpadBindingEXT.centerRegion)) == 4, "InteractionProfileDpadBindingEXT.centerRegion has unexpected size % instead of 4", size_of(type_of(InteractionProfileDpadBindingEXT.centerRegion)));
    assert(((cast(*void)(*instance.wedgeAngle)) - cast(*void)(*instance)) == 44, "InteractionProfileDpadBindingEXT.wedgeAngle has unexpected offset % instead of 44", ((cast(*void)(*instance.wedgeAngle)) - cast(*void)(*instance)));
    assert(size_of(type_of(InteractionProfileDpadBindingEXT.wedgeAngle)) == 4, "InteractionProfileDpadBindingEXT.wedgeAngle has unexpected size % instead of 4", size_of(type_of(InteractionProfileDpadBindingEXT.wedgeAngle)));
    assert(((cast(*void)(*instance.isSticky)) - cast(*void)(*instance)) == 48, "InteractionProfileDpadBindingEXT.isSticky has unexpected offset % instead of 48", ((cast(*void)(*instance.isSticky)) - cast(*void)(*instance)));
    assert(size_of(type_of(InteractionProfileDpadBindingEXT.isSticky)) == 4, "InteractionProfileDpadBindingEXT.isSticky has unexpected size % instead of 4", size_of(type_of(InteractionProfileDpadBindingEXT.isSticky)));
    assert(((cast(*void)(*instance.onHaptic)) - cast(*void)(*instance)) == 56, "InteractionProfileDpadBindingEXT.onHaptic has unexpected offset % instead of 56", ((cast(*void)(*instance.onHaptic)) - cast(*void)(*instance)));
    assert(size_of(type_of(InteractionProfileDpadBindingEXT.onHaptic)) == 8, "InteractionProfileDpadBindingEXT.onHaptic has unexpected size % instead of 8", size_of(type_of(InteractionProfileDpadBindingEXT.onHaptic)));
    assert(((cast(*void)(*instance.offHaptic)) - cast(*void)(*instance)) == 64, "InteractionProfileDpadBindingEXT.offHaptic has unexpected offset % instead of 64", ((cast(*void)(*instance.offHaptic)) - cast(*void)(*instance)));
    assert(size_of(type_of(InteractionProfileDpadBindingEXT.offHaptic)) == 8, "InteractionProfileDpadBindingEXT.offHaptic has unexpected size % instead of 8", size_of(type_of(InteractionProfileDpadBindingEXT.offHaptic)));
    assert(size_of(InteractionProfileDpadBindingEXT) == 72, "InteractionProfileDpadBindingEXT has size % instead of 72", size_of(InteractionProfileDpadBindingEXT));
}

InteractionProfileAnalogThresholdVALVE :: struct {
    type:         StructureType;
    next:         *void;
    action:       Action;
    binding:      Path;
    onThreshold:  float;
    offThreshold: float;
    onHaptic:     *HapticBaseHeader;
    offHaptic:    *HapticBaseHeader;
}
#run {
    instance: InteractionProfileAnalogThresholdVALVE;
    assert(((cast(*void)(*instance.type)) - cast(*void)(*instance)) == 0, "InteractionProfileAnalogThresholdVALVE.type has unexpected offset % instead of 0", ((cast(*void)(*instance.type)) - cast(*void)(*instance)));
    assert(size_of(type_of(InteractionProfileAnalogThresholdVALVE.type)) == 4, "InteractionProfileAnalogThresholdVALVE.type has unexpected size % instead of 4", size_of(type_of(InteractionProfileAnalogThresholdVALVE.type)));
    assert(((cast(*void)(*instance.next)) - cast(*void)(*instance)) == 8, "InteractionProfileAnalogThresholdVALVE.next has unexpected offset % instead of 8", ((cast(*void)(*instance.next)) - cast(*void)(*instance)));
    assert(size_of(type_of(InteractionProfileAnalogThresholdVALVE.next)) == 8, "InteractionProfileAnalogThresholdVALVE.next has unexpected size % instead of 8", size_of(type_of(InteractionProfileAnalogThresholdVALVE.next)));
    assert(((cast(*void)(*instance.action)) - cast(*void)(*instance)) == 16, "InteractionProfileAnalogThresholdVALVE.action has unexpected offset % instead of 16", ((cast(*void)(*instance.action)) - cast(*void)(*instance)));
    assert(size_of(type_of(InteractionProfileAnalogThresholdVALVE.action)) == 8, "InteractionProfileAnalogThresholdVALVE.action has unexpected size % instead of 8", size_of(type_of(InteractionProfileAnalogThresholdVALVE.action)));
    assert(((cast(*void)(*instance.binding)) - cast(*void)(*instance)) == 24, "InteractionProfileAnalogThresholdVALVE.binding has unexpected offset % instead of 24", ((cast(*void)(*instance.binding)) - cast(*void)(*instance)));
    assert(size_of(type_of(InteractionProfileAnalogThresholdVALVE.binding)) == 8, "InteractionProfileAnalogThresholdVALVE.binding has unexpected size % instead of 8", size_of(type_of(InteractionProfileAnalogThresholdVALVE.binding)));
    assert(((cast(*void)(*instance.onThreshold)) - cast(*void)(*instance)) == 32, "InteractionProfileAnalogThresholdVALVE.onThreshold has unexpected offset % instead of 32", ((cast(*void)(*instance.onThreshold)) - cast(*void)(*instance)));
    assert(size_of(type_of(InteractionProfileAnalogThresholdVALVE.onThreshold)) == 4, "InteractionProfileAnalogThresholdVALVE.onThreshold has unexpected size % instead of 4", size_of(type_of(InteractionProfileAnalogThresholdVALVE.onThreshold)));
    assert(((cast(*void)(*instance.offThreshold)) - cast(*void)(*instance)) == 36, "InteractionProfileAnalogThresholdVALVE.offThreshold has unexpected offset % instead of 36", ((cast(*void)(*instance.offThreshold)) - cast(*void)(*instance)));
    assert(size_of(type_of(InteractionProfileAnalogThresholdVALVE.offThreshold)) == 4, "InteractionProfileAnalogThresholdVALVE.offThreshold has unexpected size % instead of 4", size_of(type_of(InteractionProfileAnalogThresholdVALVE.offThreshold)));
    assert(((cast(*void)(*instance.onHaptic)) - cast(*void)(*instance)) == 40, "InteractionProfileAnalogThresholdVALVE.onHaptic has unexpected offset % instead of 40", ((cast(*void)(*instance.onHaptic)) - cast(*void)(*instance)));
    assert(size_of(type_of(InteractionProfileAnalogThresholdVALVE.onHaptic)) == 8, "InteractionProfileAnalogThresholdVALVE.onHaptic has unexpected size % instead of 8", size_of(type_of(InteractionProfileAnalogThresholdVALVE.onHaptic)));
    assert(((cast(*void)(*instance.offHaptic)) - cast(*void)(*instance)) == 48, "InteractionProfileAnalogThresholdVALVE.offHaptic has unexpected offset % instead of 48", ((cast(*void)(*instance.offHaptic)) - cast(*void)(*instance)));
    assert(size_of(type_of(InteractionProfileAnalogThresholdVALVE.offHaptic)) == 8, "InteractionProfileAnalogThresholdVALVE.offHaptic has unexpected size % instead of 8", size_of(type_of(InteractionProfileAnalogThresholdVALVE.offHaptic)));
    assert(size_of(InteractionProfileAnalogThresholdVALVE) == 56, "InteractionProfileAnalogThresholdVALVE has size % instead of 56", size_of(InteractionProfileAnalogThresholdVALVE));
}

HandJointsMotionRangeEXT :: enum s32 {
    UNOBSTRUCTED_EXT             :: 1;
    CONFORMING_TO_CONTROLLER_EXT :: 2;
    MAX_ENUM_EXT                 :: 2147483647;

    XR_HAND_JOINTS_MOTION_RANGE_UNOBSTRUCTED_EXT             :: UNOBSTRUCTED_EXT;
    XR_HAND_JOINTS_MOTION_RANGE_CONFORMING_TO_CONTROLLER_EXT :: CONFORMING_TO_CONTROLLER_EXT;
    XR_HAND_JOINTS_MOTION_RANGE_MAX_ENUM_EXT                 :: MAX_ENUM_EXT;
}

// XrHandJointsMotionRangeInfoEXT extends XrHandJointsLocateInfoEXT
HandJointsMotionRangeInfoEXT :: struct {
    type:                  StructureType;
    next:                  *void;
    handJointsMotionRange: HandJointsMotionRangeEXT;
}
#run {
    instance: HandJointsMotionRangeInfoEXT;
    assert(((cast(*void)(*instance.type)) - cast(*void)(*instance)) == 0, "HandJointsMotionRangeInfoEXT.type has unexpected offset % instead of 0", ((cast(*void)(*instance.type)) - cast(*void)(*instance)));
    assert(size_of(type_of(HandJointsMotionRangeInfoEXT.type)) == 4, "HandJointsMotionRangeInfoEXT.type has unexpected size % instead of 4", size_of(type_of(HandJointsMotionRangeInfoEXT.type)));
    assert(((cast(*void)(*instance.next)) - cast(*void)(*instance)) == 8, "HandJointsMotionRangeInfoEXT.next has unexpected offset % instead of 8", ((cast(*void)(*instance.next)) - cast(*void)(*instance)));
    assert(size_of(type_of(HandJointsMotionRangeInfoEXT.next)) == 8, "HandJointsMotionRangeInfoEXT.next has unexpected size % instead of 8", size_of(type_of(HandJointsMotionRangeInfoEXT.next)));
    assert(((cast(*void)(*instance.handJointsMotionRange)) - cast(*void)(*instance)) == 16, "HandJointsMotionRangeInfoEXT.handJointsMotionRange has unexpected offset % instead of 16", ((cast(*void)(*instance.handJointsMotionRange)) - cast(*void)(*instance)));
    assert(size_of(type_of(HandJointsMotionRangeInfoEXT.handJointsMotionRange)) == 4, "HandJointsMotionRangeInfoEXT.handJointsMotionRange has unexpected size % instead of 4", size_of(type_of(HandJointsMotionRangeInfoEXT.handJointsMotionRange)));
    assert(size_of(HandJointsMotionRangeInfoEXT) == 24, "HandJointsMotionRangeInfoEXT has size % instead of 24", size_of(HandJointsMotionRangeInfoEXT));
}

SceneObserverMSFT_T :: struct {}
SceneObserverMSFT :: *SceneObserverMSFT_T;

SceneMSFT_T :: struct {}
SceneMSFT :: *SceneMSFT_T;

SceneComputeFeatureMSFT :: enum s32 {
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

SceneComputeConsistencyMSFT :: enum s32 {
    SNAPSHOT_COMPLETE_MSFT        :: 1;
    SNAPSHOT_INCOMPLETE_FAST_MSFT :: 2;
    OCCLUSION_OPTIMIZED_MSFT      :: 3;
    MAX_ENUM_MSFT                 :: 2147483647;

    XR_SCENE_COMPUTE_CONSISTENCY_SNAPSHOT_COMPLETE_MSFT        :: SNAPSHOT_COMPLETE_MSFT;
    XR_SCENE_COMPUTE_CONSISTENCY_SNAPSHOT_INCOMPLETE_FAST_MSFT :: SNAPSHOT_INCOMPLETE_FAST_MSFT;
    XR_SCENE_COMPUTE_CONSISTENCY_OCCLUSION_OPTIMIZED_MSFT      :: OCCLUSION_OPTIMIZED_MSFT;
    XR_SCENE_COMPUTE_CONSISTENCY_MAX_ENUM_MSFT                 :: MAX_ENUM_MSFT;
}

MeshComputeLodMSFT :: enum s32 {
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

SceneComponentTypeMSFT :: enum s32 {
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

SceneObjectTypeMSFT :: enum s32 {
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

ScenePlaneAlignmentTypeMSFT :: enum s32 {
    NON_ORTHOGONAL_MSFT :: 0;
    HORIZONTAL_MSFT     :: 1;
    VERTICAL_MSFT       :: 2;
    MAX_ENUM_MSFT       :: 2147483647;

    XR_SCENE_PLANE_ALIGNMENT_TYPE_NON_ORTHOGONAL_MSFT :: NON_ORTHOGONAL_MSFT;
    XR_SCENE_PLANE_ALIGNMENT_TYPE_HORIZONTAL_MSFT     :: HORIZONTAL_MSFT;
    XR_SCENE_PLANE_ALIGNMENT_TYPE_VERTICAL_MSFT       :: VERTICAL_MSFT;
    XR_SCENE_PLANE_ALIGNMENT_TYPE_MAX_ENUM_MSFT       :: MAX_ENUM_MSFT;
}

SceneComputeStateMSFT :: enum s32 {
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

UuidMSFT :: struct {
    bytes: [16] u8;
}
#run {
    instance: UuidMSFT;
    assert(((cast(*void)(*instance.bytes)) - cast(*void)(*instance)) == 0, "UuidMSFT.bytes has unexpected offset % instead of 0", ((cast(*void)(*instance.bytes)) - cast(*void)(*instance)));
    assert(size_of(type_of(UuidMSFT.bytes)) == 16, "UuidMSFT.bytes has unexpected size % instead of 16", size_of(type_of(UuidMSFT.bytes)));
    assert(size_of(UuidMSFT) == 16, "UuidMSFT has size % instead of 16", size_of(UuidMSFT));
}

SceneObserverCreateInfoMSFT :: struct {
    type: StructureType;
    next: *void;
}
#run {
    instance: SceneObserverCreateInfoMSFT;
    assert(((cast(*void)(*instance.type)) - cast(*void)(*instance)) == 0, "SceneObserverCreateInfoMSFT.type has unexpected offset % instead of 0", ((cast(*void)(*instance.type)) - cast(*void)(*instance)));
    assert(size_of(type_of(SceneObserverCreateInfoMSFT.type)) == 4, "SceneObserverCreateInfoMSFT.type has unexpected size % instead of 4", size_of(type_of(SceneObserverCreateInfoMSFT.type)));
    assert(((cast(*void)(*instance.next)) - cast(*void)(*instance)) == 8, "SceneObserverCreateInfoMSFT.next has unexpected offset % instead of 8", ((cast(*void)(*instance.next)) - cast(*void)(*instance)));
    assert(size_of(type_of(SceneObserverCreateInfoMSFT.next)) == 8, "SceneObserverCreateInfoMSFT.next has unexpected size % instead of 8", size_of(type_of(SceneObserverCreateInfoMSFT.next)));
    assert(size_of(SceneObserverCreateInfoMSFT) == 16, "SceneObserverCreateInfoMSFT has size % instead of 16", size_of(SceneObserverCreateInfoMSFT));
}

SceneCreateInfoMSFT :: struct {
    type: StructureType;
    next: *void;
}
#run {
    instance: SceneCreateInfoMSFT;
    assert(((cast(*void)(*instance.type)) - cast(*void)(*instance)) == 0, "SceneCreateInfoMSFT.type has unexpected offset % instead of 0", ((cast(*void)(*instance.type)) - cast(*void)(*instance)));
    assert(size_of(type_of(SceneCreateInfoMSFT.type)) == 4, "SceneCreateInfoMSFT.type has unexpected size % instead of 4", size_of(type_of(SceneCreateInfoMSFT.type)));
    assert(((cast(*void)(*instance.next)) - cast(*void)(*instance)) == 8, "SceneCreateInfoMSFT.next has unexpected offset % instead of 8", ((cast(*void)(*instance.next)) - cast(*void)(*instance)));
    assert(size_of(type_of(SceneCreateInfoMSFT.next)) == 8, "SceneCreateInfoMSFT.next has unexpected size % instead of 8", size_of(type_of(SceneCreateInfoMSFT.next)));
    assert(size_of(SceneCreateInfoMSFT) == 16, "SceneCreateInfoMSFT has size % instead of 16", size_of(SceneCreateInfoMSFT));
}

SceneSphereBoundMSFT :: struct {
    center: Vector3f;
    radius: float;
}
#run {
    instance: SceneSphereBoundMSFT;
    assert(((cast(*void)(*instance.center)) - cast(*void)(*instance)) == 0, "SceneSphereBoundMSFT.center has unexpected offset % instead of 0", ((cast(*void)(*instance.center)) - cast(*void)(*instance)));
    assert(size_of(type_of(SceneSphereBoundMSFT.center)) == 12, "SceneSphereBoundMSFT.center has unexpected size % instead of 12", size_of(type_of(SceneSphereBoundMSFT.center)));
    assert(((cast(*void)(*instance.radius)) - cast(*void)(*instance)) == 12, "SceneSphereBoundMSFT.radius has unexpected offset % instead of 12", ((cast(*void)(*instance.radius)) - cast(*void)(*instance)));
    assert(size_of(type_of(SceneSphereBoundMSFT.radius)) == 4, "SceneSphereBoundMSFT.radius has unexpected size % instead of 4", size_of(type_of(SceneSphereBoundMSFT.radius)));
    assert(size_of(SceneSphereBoundMSFT) == 16, "SceneSphereBoundMSFT has size % instead of 16", size_of(SceneSphereBoundMSFT));
}

SceneOrientedBoxBoundMSFT :: struct {
    pose:    Posef;
    extents: Vector3f;
}
#run {
    instance: SceneOrientedBoxBoundMSFT;
    assert(((cast(*void)(*instance.pose)) - cast(*void)(*instance)) == 0, "SceneOrientedBoxBoundMSFT.pose has unexpected offset % instead of 0", ((cast(*void)(*instance.pose)) - cast(*void)(*instance)));
    assert(size_of(type_of(SceneOrientedBoxBoundMSFT.pose)) == 28, "SceneOrientedBoxBoundMSFT.pose has unexpected size % instead of 28", size_of(type_of(SceneOrientedBoxBoundMSFT.pose)));
    assert(((cast(*void)(*instance.extents)) - cast(*void)(*instance)) == 28, "SceneOrientedBoxBoundMSFT.extents has unexpected offset % instead of 28", ((cast(*void)(*instance.extents)) - cast(*void)(*instance)));
    assert(size_of(type_of(SceneOrientedBoxBoundMSFT.extents)) == 12, "SceneOrientedBoxBoundMSFT.extents has unexpected size % instead of 12", size_of(type_of(SceneOrientedBoxBoundMSFT.extents)));
    assert(size_of(SceneOrientedBoxBoundMSFT) == 40, "SceneOrientedBoxBoundMSFT has size % instead of 40", size_of(SceneOrientedBoxBoundMSFT));
}

SceneFrustumBoundMSFT :: struct {
    pose:        Posef;
    fov:         Fovf;
    farDistance: float;
}
#run {
    instance: SceneFrustumBoundMSFT;
    assert(((cast(*void)(*instance.pose)) - cast(*void)(*instance)) == 0, "SceneFrustumBoundMSFT.pose has unexpected offset % instead of 0", ((cast(*void)(*instance.pose)) - cast(*void)(*instance)));
    assert(size_of(type_of(SceneFrustumBoundMSFT.pose)) == 28, "SceneFrustumBoundMSFT.pose has unexpected size % instead of 28", size_of(type_of(SceneFrustumBoundMSFT.pose)));
    assert(((cast(*void)(*instance.fov)) - cast(*void)(*instance)) == 28, "SceneFrustumBoundMSFT.fov has unexpected offset % instead of 28", ((cast(*void)(*instance.fov)) - cast(*void)(*instance)));
    assert(size_of(type_of(SceneFrustumBoundMSFT.fov)) == 16, "SceneFrustumBoundMSFT.fov has unexpected size % instead of 16", size_of(type_of(SceneFrustumBoundMSFT.fov)));
    assert(((cast(*void)(*instance.farDistance)) - cast(*void)(*instance)) == 44, "SceneFrustumBoundMSFT.farDistance has unexpected offset % instead of 44", ((cast(*void)(*instance.farDistance)) - cast(*void)(*instance)));
    assert(size_of(type_of(SceneFrustumBoundMSFT.farDistance)) == 4, "SceneFrustumBoundMSFT.farDistance has unexpected size % instead of 4", size_of(type_of(SceneFrustumBoundMSFT.farDistance)));
    assert(size_of(SceneFrustumBoundMSFT) == 48, "SceneFrustumBoundMSFT has size % instead of 48", size_of(SceneFrustumBoundMSFT));
}

SceneBoundsMSFT :: struct {
    space:        Space;
    time:         Time;
    sphereCount:  u32;
    spheres:      *SceneSphereBoundMSFT;
    boxCount:     u32;
    boxes:        *SceneOrientedBoxBoundMSFT;
    frustumCount: u32;
    frustums:     *SceneFrustumBoundMSFT;
}
#run {
    instance: SceneBoundsMSFT;
    assert(((cast(*void)(*instance.space)) - cast(*void)(*instance)) == 0, "SceneBoundsMSFT.space has unexpected offset % instead of 0", ((cast(*void)(*instance.space)) - cast(*void)(*instance)));
    assert(size_of(type_of(SceneBoundsMSFT.space)) == 8, "SceneBoundsMSFT.space has unexpected size % instead of 8", size_of(type_of(SceneBoundsMSFT.space)));
    assert(((cast(*void)(*instance.time)) - cast(*void)(*instance)) == 8, "SceneBoundsMSFT.time has unexpected offset % instead of 8", ((cast(*void)(*instance.time)) - cast(*void)(*instance)));
    assert(size_of(type_of(SceneBoundsMSFT.time)) == 8, "SceneBoundsMSFT.time has unexpected size % instead of 8", size_of(type_of(SceneBoundsMSFT.time)));
    assert(((cast(*void)(*instance.sphereCount)) - cast(*void)(*instance)) == 16, "SceneBoundsMSFT.sphereCount has unexpected offset % instead of 16", ((cast(*void)(*instance.sphereCount)) - cast(*void)(*instance)));
    assert(size_of(type_of(SceneBoundsMSFT.sphereCount)) == 4, "SceneBoundsMSFT.sphereCount has unexpected size % instead of 4", size_of(type_of(SceneBoundsMSFT.sphereCount)));
    assert(((cast(*void)(*instance.spheres)) - cast(*void)(*instance)) == 24, "SceneBoundsMSFT.spheres has unexpected offset % instead of 24", ((cast(*void)(*instance.spheres)) - cast(*void)(*instance)));
    assert(size_of(type_of(SceneBoundsMSFT.spheres)) == 8, "SceneBoundsMSFT.spheres has unexpected size % instead of 8", size_of(type_of(SceneBoundsMSFT.spheres)));
    assert(((cast(*void)(*instance.boxCount)) - cast(*void)(*instance)) == 32, "SceneBoundsMSFT.boxCount has unexpected offset % instead of 32", ((cast(*void)(*instance.boxCount)) - cast(*void)(*instance)));
    assert(size_of(type_of(SceneBoundsMSFT.boxCount)) == 4, "SceneBoundsMSFT.boxCount has unexpected size % instead of 4", size_of(type_of(SceneBoundsMSFT.boxCount)));
    assert(((cast(*void)(*instance.boxes)) - cast(*void)(*instance)) == 40, "SceneBoundsMSFT.boxes has unexpected offset % instead of 40", ((cast(*void)(*instance.boxes)) - cast(*void)(*instance)));
    assert(size_of(type_of(SceneBoundsMSFT.boxes)) == 8, "SceneBoundsMSFT.boxes has unexpected size % instead of 8", size_of(type_of(SceneBoundsMSFT.boxes)));
    assert(((cast(*void)(*instance.frustumCount)) - cast(*void)(*instance)) == 48, "SceneBoundsMSFT.frustumCount has unexpected offset % instead of 48", ((cast(*void)(*instance.frustumCount)) - cast(*void)(*instance)));
    assert(size_of(type_of(SceneBoundsMSFT.frustumCount)) == 4, "SceneBoundsMSFT.frustumCount has unexpected size % instead of 4", size_of(type_of(SceneBoundsMSFT.frustumCount)));
    assert(((cast(*void)(*instance.frustums)) - cast(*void)(*instance)) == 56, "SceneBoundsMSFT.frustums has unexpected offset % instead of 56", ((cast(*void)(*instance.frustums)) - cast(*void)(*instance)));
    assert(size_of(type_of(SceneBoundsMSFT.frustums)) == 8, "SceneBoundsMSFT.frustums has unexpected size % instead of 8", size_of(type_of(SceneBoundsMSFT.frustums)));
    assert(size_of(SceneBoundsMSFT) == 64, "SceneBoundsMSFT has size % instead of 64", size_of(SceneBoundsMSFT));
}

NewSceneComputeInfoMSFT :: struct {
    type:                  StructureType;
    next:                  *void;
    requestedFeatureCount: u32;
    requestedFeatures:     *SceneComputeFeatureMSFT;
    consistency:           SceneComputeConsistencyMSFT;
    bounds:                SceneBoundsMSFT;
}
#run {
    instance: NewSceneComputeInfoMSFT;
    assert(((cast(*void)(*instance.type)) - cast(*void)(*instance)) == 0, "NewSceneComputeInfoMSFT.type has unexpected offset % instead of 0", ((cast(*void)(*instance.type)) - cast(*void)(*instance)));
    assert(size_of(type_of(NewSceneComputeInfoMSFT.type)) == 4, "NewSceneComputeInfoMSFT.type has unexpected size % instead of 4", size_of(type_of(NewSceneComputeInfoMSFT.type)));
    assert(((cast(*void)(*instance.next)) - cast(*void)(*instance)) == 8, "NewSceneComputeInfoMSFT.next has unexpected offset % instead of 8", ((cast(*void)(*instance.next)) - cast(*void)(*instance)));
    assert(size_of(type_of(NewSceneComputeInfoMSFT.next)) == 8, "NewSceneComputeInfoMSFT.next has unexpected size % instead of 8", size_of(type_of(NewSceneComputeInfoMSFT.next)));
    assert(((cast(*void)(*instance.requestedFeatureCount)) - cast(*void)(*instance)) == 16, "NewSceneComputeInfoMSFT.requestedFeatureCount has unexpected offset % instead of 16", ((cast(*void)(*instance.requestedFeatureCount)) - cast(*void)(*instance)));
    assert(size_of(type_of(NewSceneComputeInfoMSFT.requestedFeatureCount)) == 4, "NewSceneComputeInfoMSFT.requestedFeatureCount has unexpected size % instead of 4", size_of(type_of(NewSceneComputeInfoMSFT.requestedFeatureCount)));
    assert(((cast(*void)(*instance.requestedFeatures)) - cast(*void)(*instance)) == 24, "NewSceneComputeInfoMSFT.requestedFeatures has unexpected offset % instead of 24", ((cast(*void)(*instance.requestedFeatures)) - cast(*void)(*instance)));
    assert(size_of(type_of(NewSceneComputeInfoMSFT.requestedFeatures)) == 8, "NewSceneComputeInfoMSFT.requestedFeatures has unexpected size % instead of 8", size_of(type_of(NewSceneComputeInfoMSFT.requestedFeatures)));
    assert(((cast(*void)(*instance.consistency)) - cast(*void)(*instance)) == 32, "NewSceneComputeInfoMSFT.consistency has unexpected offset % instead of 32", ((cast(*void)(*instance.consistency)) - cast(*void)(*instance)));
    assert(size_of(type_of(NewSceneComputeInfoMSFT.consistency)) == 4, "NewSceneComputeInfoMSFT.consistency has unexpected size % instead of 4", size_of(type_of(NewSceneComputeInfoMSFT.consistency)));
    assert(((cast(*void)(*instance.bounds)) - cast(*void)(*instance)) == 40, "NewSceneComputeInfoMSFT.bounds has unexpected offset % instead of 40", ((cast(*void)(*instance.bounds)) - cast(*void)(*instance)));
    assert(size_of(type_of(NewSceneComputeInfoMSFT.bounds)) == 64, "NewSceneComputeInfoMSFT.bounds has unexpected size % instead of 64", size_of(type_of(NewSceneComputeInfoMSFT.bounds)));
    assert(size_of(NewSceneComputeInfoMSFT) == 104, "NewSceneComputeInfoMSFT has size % instead of 104", size_of(NewSceneComputeInfoMSFT));
}

// XrVisualMeshComputeLodInfoMSFT extends XrNewSceneComputeInfoMSFT
VisualMeshComputeLodInfoMSFT :: struct {
    type: StructureType;
    next: *void;
    lod:  MeshComputeLodMSFT;
}
#run {
    instance: VisualMeshComputeLodInfoMSFT;
    assert(((cast(*void)(*instance.type)) - cast(*void)(*instance)) == 0, "VisualMeshComputeLodInfoMSFT.type has unexpected offset % instead of 0", ((cast(*void)(*instance.type)) - cast(*void)(*instance)));
    assert(size_of(type_of(VisualMeshComputeLodInfoMSFT.type)) == 4, "VisualMeshComputeLodInfoMSFT.type has unexpected size % instead of 4", size_of(type_of(VisualMeshComputeLodInfoMSFT.type)));
    assert(((cast(*void)(*instance.next)) - cast(*void)(*instance)) == 8, "VisualMeshComputeLodInfoMSFT.next has unexpected offset % instead of 8", ((cast(*void)(*instance.next)) - cast(*void)(*instance)));
    assert(size_of(type_of(VisualMeshComputeLodInfoMSFT.next)) == 8, "VisualMeshComputeLodInfoMSFT.next has unexpected size % instead of 8", size_of(type_of(VisualMeshComputeLodInfoMSFT.next)));
    assert(((cast(*void)(*instance.lod)) - cast(*void)(*instance)) == 16, "VisualMeshComputeLodInfoMSFT.lod has unexpected offset % instead of 16", ((cast(*void)(*instance.lod)) - cast(*void)(*instance)));
    assert(size_of(type_of(VisualMeshComputeLodInfoMSFT.lod)) == 4, "VisualMeshComputeLodInfoMSFT.lod has unexpected size % instead of 4", size_of(type_of(VisualMeshComputeLodInfoMSFT.lod)));
    assert(size_of(VisualMeshComputeLodInfoMSFT) == 24, "VisualMeshComputeLodInfoMSFT has size % instead of 24", size_of(VisualMeshComputeLodInfoMSFT));
}

SceneComponentMSFT :: struct {
    componentType: SceneComponentTypeMSFT;
    id:            UuidMSFT;
    parentId:      UuidMSFT;
    updateTime:    Time;
}
#run {
    instance: SceneComponentMSFT;
    assert(((cast(*void)(*instance.componentType)) - cast(*void)(*instance)) == 0, "SceneComponentMSFT.componentType has unexpected offset % instead of 0", ((cast(*void)(*instance.componentType)) - cast(*void)(*instance)));
    assert(size_of(type_of(SceneComponentMSFT.componentType)) == 4, "SceneComponentMSFT.componentType has unexpected size % instead of 4", size_of(type_of(SceneComponentMSFT.componentType)));
    assert(((cast(*void)(*instance.id)) - cast(*void)(*instance)) == 4, "SceneComponentMSFT.id has unexpected offset % instead of 4", ((cast(*void)(*instance.id)) - cast(*void)(*instance)));
    assert(size_of(type_of(SceneComponentMSFT.id)) == 16, "SceneComponentMSFT.id has unexpected size % instead of 16", size_of(type_of(SceneComponentMSFT.id)));
    assert(((cast(*void)(*instance.parentId)) - cast(*void)(*instance)) == 20, "SceneComponentMSFT.parentId has unexpected offset % instead of 20", ((cast(*void)(*instance.parentId)) - cast(*void)(*instance)));
    assert(size_of(type_of(SceneComponentMSFT.parentId)) == 16, "SceneComponentMSFT.parentId has unexpected size % instead of 16", size_of(type_of(SceneComponentMSFT.parentId)));
    assert(((cast(*void)(*instance.updateTime)) - cast(*void)(*instance)) == 40, "SceneComponentMSFT.updateTime has unexpected offset % instead of 40", ((cast(*void)(*instance.updateTime)) - cast(*void)(*instance)));
    assert(size_of(type_of(SceneComponentMSFT.updateTime)) == 8, "SceneComponentMSFT.updateTime has unexpected size % instead of 8", size_of(type_of(SceneComponentMSFT.updateTime)));
    assert(size_of(SceneComponentMSFT) == 48, "SceneComponentMSFT has size % instead of 48", size_of(SceneComponentMSFT));
}

SceneComponentsMSFT :: struct {
    type:                   StructureType;
    next:                   *void;
    componentCapacityInput: u32;
    componentCountOutput:   u32;
    components:             *SceneComponentMSFT;
}
#run {
    instance: SceneComponentsMSFT;
    assert(((cast(*void)(*instance.type)) - cast(*void)(*instance)) == 0, "SceneComponentsMSFT.type has unexpected offset % instead of 0", ((cast(*void)(*instance.type)) - cast(*void)(*instance)));
    assert(size_of(type_of(SceneComponentsMSFT.type)) == 4, "SceneComponentsMSFT.type has unexpected size % instead of 4", size_of(type_of(SceneComponentsMSFT.type)));
    assert(((cast(*void)(*instance.next)) - cast(*void)(*instance)) == 8, "SceneComponentsMSFT.next has unexpected offset % instead of 8", ((cast(*void)(*instance.next)) - cast(*void)(*instance)));
    assert(size_of(type_of(SceneComponentsMSFT.next)) == 8, "SceneComponentsMSFT.next has unexpected size % instead of 8", size_of(type_of(SceneComponentsMSFT.next)));
    assert(((cast(*void)(*instance.componentCapacityInput)) - cast(*void)(*instance)) == 16, "SceneComponentsMSFT.componentCapacityInput has unexpected offset % instead of 16", ((cast(*void)(*instance.componentCapacityInput)) - cast(*void)(*instance)));
    assert(size_of(type_of(SceneComponentsMSFT.componentCapacityInput)) == 4, "SceneComponentsMSFT.componentCapacityInput has unexpected size % instead of 4", size_of(type_of(SceneComponentsMSFT.componentCapacityInput)));
    assert(((cast(*void)(*instance.componentCountOutput)) - cast(*void)(*instance)) == 20, "SceneComponentsMSFT.componentCountOutput has unexpected offset % instead of 20", ((cast(*void)(*instance.componentCountOutput)) - cast(*void)(*instance)));
    assert(size_of(type_of(SceneComponentsMSFT.componentCountOutput)) == 4, "SceneComponentsMSFT.componentCountOutput has unexpected size % instead of 4", size_of(type_of(SceneComponentsMSFT.componentCountOutput)));
    assert(((cast(*void)(*instance.components)) - cast(*void)(*instance)) == 24, "SceneComponentsMSFT.components has unexpected offset % instead of 24", ((cast(*void)(*instance.components)) - cast(*void)(*instance)));
    assert(size_of(type_of(SceneComponentsMSFT.components)) == 8, "SceneComponentsMSFT.components has unexpected size % instead of 8", size_of(type_of(SceneComponentsMSFT.components)));
    assert(size_of(SceneComponentsMSFT) == 32, "SceneComponentsMSFT has size % instead of 32", size_of(SceneComponentsMSFT));
}

SceneComponentsGetInfoMSFT :: struct {
    type:          StructureType;
    next:          *void;
    componentType: SceneComponentTypeMSFT;
}
#run {
    instance: SceneComponentsGetInfoMSFT;
    assert(((cast(*void)(*instance.type)) - cast(*void)(*instance)) == 0, "SceneComponentsGetInfoMSFT.type has unexpected offset % instead of 0", ((cast(*void)(*instance.type)) - cast(*void)(*instance)));
    assert(size_of(type_of(SceneComponentsGetInfoMSFT.type)) == 4, "SceneComponentsGetInfoMSFT.type has unexpected size % instead of 4", size_of(type_of(SceneComponentsGetInfoMSFT.type)));
    assert(((cast(*void)(*instance.next)) - cast(*void)(*instance)) == 8, "SceneComponentsGetInfoMSFT.next has unexpected offset % instead of 8", ((cast(*void)(*instance.next)) - cast(*void)(*instance)));
    assert(size_of(type_of(SceneComponentsGetInfoMSFT.next)) == 8, "SceneComponentsGetInfoMSFT.next has unexpected size % instead of 8", size_of(type_of(SceneComponentsGetInfoMSFT.next)));
    assert(((cast(*void)(*instance.componentType)) - cast(*void)(*instance)) == 16, "SceneComponentsGetInfoMSFT.componentType has unexpected offset % instead of 16", ((cast(*void)(*instance.componentType)) - cast(*void)(*instance)));
    assert(size_of(type_of(SceneComponentsGetInfoMSFT.componentType)) == 4, "SceneComponentsGetInfoMSFT.componentType has unexpected size % instead of 4", size_of(type_of(SceneComponentsGetInfoMSFT.componentType)));
    assert(size_of(SceneComponentsGetInfoMSFT) == 24, "SceneComponentsGetInfoMSFT has size % instead of 24", size_of(SceneComponentsGetInfoMSFT));
}

SceneComponentLocationMSFT :: struct {
    flags: SpaceLocationFlags;
    pose:  Posef;
}
#run {
    instance: SceneComponentLocationMSFT;
    assert(((cast(*void)(*instance.flags)) - cast(*void)(*instance)) == 0, "SceneComponentLocationMSFT.flags has unexpected offset % instead of 0", ((cast(*void)(*instance.flags)) - cast(*void)(*instance)));
    assert(size_of(type_of(SceneComponentLocationMSFT.flags)) == 8, "SceneComponentLocationMSFT.flags has unexpected size % instead of 8", size_of(type_of(SceneComponentLocationMSFT.flags)));
    assert(((cast(*void)(*instance.pose)) - cast(*void)(*instance)) == 8, "SceneComponentLocationMSFT.pose has unexpected offset % instead of 8", ((cast(*void)(*instance.pose)) - cast(*void)(*instance)));
    assert(size_of(type_of(SceneComponentLocationMSFT.pose)) == 28, "SceneComponentLocationMSFT.pose has unexpected size % instead of 28", size_of(type_of(SceneComponentLocationMSFT.pose)));
    assert(size_of(SceneComponentLocationMSFT) == 40, "SceneComponentLocationMSFT has size % instead of 40", size_of(SceneComponentLocationMSFT));
}

SceneComponentLocationsMSFT :: struct {
    type:          StructureType;
    next:          *void;
    locationCount: u32;
    locations:     *SceneComponentLocationMSFT;
}
#run {
    instance: SceneComponentLocationsMSFT;
    assert(((cast(*void)(*instance.type)) - cast(*void)(*instance)) == 0, "SceneComponentLocationsMSFT.type has unexpected offset % instead of 0", ((cast(*void)(*instance.type)) - cast(*void)(*instance)));
    assert(size_of(type_of(SceneComponentLocationsMSFT.type)) == 4, "SceneComponentLocationsMSFT.type has unexpected size % instead of 4", size_of(type_of(SceneComponentLocationsMSFT.type)));
    assert(((cast(*void)(*instance.next)) - cast(*void)(*instance)) == 8, "SceneComponentLocationsMSFT.next has unexpected offset % instead of 8", ((cast(*void)(*instance.next)) - cast(*void)(*instance)));
    assert(size_of(type_of(SceneComponentLocationsMSFT.next)) == 8, "SceneComponentLocationsMSFT.next has unexpected size % instead of 8", size_of(type_of(SceneComponentLocationsMSFT.next)));
    assert(((cast(*void)(*instance.locationCount)) - cast(*void)(*instance)) == 16, "SceneComponentLocationsMSFT.locationCount has unexpected offset % instead of 16", ((cast(*void)(*instance.locationCount)) - cast(*void)(*instance)));
    assert(size_of(type_of(SceneComponentLocationsMSFT.locationCount)) == 4, "SceneComponentLocationsMSFT.locationCount has unexpected size % instead of 4", size_of(type_of(SceneComponentLocationsMSFT.locationCount)));
    assert(((cast(*void)(*instance.locations)) - cast(*void)(*instance)) == 24, "SceneComponentLocationsMSFT.locations has unexpected offset % instead of 24", ((cast(*void)(*instance.locations)) - cast(*void)(*instance)));
    assert(size_of(type_of(SceneComponentLocationsMSFT.locations)) == 8, "SceneComponentLocationsMSFT.locations has unexpected size % instead of 8", size_of(type_of(SceneComponentLocationsMSFT.locations)));
    assert(size_of(SceneComponentLocationsMSFT) == 32, "SceneComponentLocationsMSFT has size % instead of 32", size_of(SceneComponentLocationsMSFT));
}

SceneComponentsLocateInfoMSFT :: struct {
    type:             StructureType;
    next:             *void;
    baseSpace:        Space;
    time:             Time;
    componentIdCount: u32;
    componentIds:     *UuidMSFT;
}
#run {
    instance: SceneComponentsLocateInfoMSFT;
    assert(((cast(*void)(*instance.type)) - cast(*void)(*instance)) == 0, "SceneComponentsLocateInfoMSFT.type has unexpected offset % instead of 0", ((cast(*void)(*instance.type)) - cast(*void)(*instance)));
    assert(size_of(type_of(SceneComponentsLocateInfoMSFT.type)) == 4, "SceneComponentsLocateInfoMSFT.type has unexpected size % instead of 4", size_of(type_of(SceneComponentsLocateInfoMSFT.type)));
    assert(((cast(*void)(*instance.next)) - cast(*void)(*instance)) == 8, "SceneComponentsLocateInfoMSFT.next has unexpected offset % instead of 8", ((cast(*void)(*instance.next)) - cast(*void)(*instance)));
    assert(size_of(type_of(SceneComponentsLocateInfoMSFT.next)) == 8, "SceneComponentsLocateInfoMSFT.next has unexpected size % instead of 8", size_of(type_of(SceneComponentsLocateInfoMSFT.next)));
    assert(((cast(*void)(*instance.baseSpace)) - cast(*void)(*instance)) == 16, "SceneComponentsLocateInfoMSFT.baseSpace has unexpected offset % instead of 16", ((cast(*void)(*instance.baseSpace)) - cast(*void)(*instance)));
    assert(size_of(type_of(SceneComponentsLocateInfoMSFT.baseSpace)) == 8, "SceneComponentsLocateInfoMSFT.baseSpace has unexpected size % instead of 8", size_of(type_of(SceneComponentsLocateInfoMSFT.baseSpace)));
    assert(((cast(*void)(*instance.time)) - cast(*void)(*instance)) == 24, "SceneComponentsLocateInfoMSFT.time has unexpected offset % instead of 24", ((cast(*void)(*instance.time)) - cast(*void)(*instance)));
    assert(size_of(type_of(SceneComponentsLocateInfoMSFT.time)) == 8, "SceneComponentsLocateInfoMSFT.time has unexpected size % instead of 8", size_of(type_of(SceneComponentsLocateInfoMSFT.time)));
    assert(((cast(*void)(*instance.componentIdCount)) - cast(*void)(*instance)) == 32, "SceneComponentsLocateInfoMSFT.componentIdCount has unexpected offset % instead of 32", ((cast(*void)(*instance.componentIdCount)) - cast(*void)(*instance)));
    assert(size_of(type_of(SceneComponentsLocateInfoMSFT.componentIdCount)) == 4, "SceneComponentsLocateInfoMSFT.componentIdCount has unexpected size % instead of 4", size_of(type_of(SceneComponentsLocateInfoMSFT.componentIdCount)));
    assert(((cast(*void)(*instance.componentIds)) - cast(*void)(*instance)) == 40, "SceneComponentsLocateInfoMSFT.componentIds has unexpected offset % instead of 40", ((cast(*void)(*instance.componentIds)) - cast(*void)(*instance)));
    assert(size_of(type_of(SceneComponentsLocateInfoMSFT.componentIds)) == 8, "SceneComponentsLocateInfoMSFT.componentIds has unexpected size % instead of 8", size_of(type_of(SceneComponentsLocateInfoMSFT.componentIds)));
    assert(size_of(SceneComponentsLocateInfoMSFT) == 48, "SceneComponentsLocateInfoMSFT has size % instead of 48", size_of(SceneComponentsLocateInfoMSFT));
}

SceneObjectMSFT :: struct {
    objectType: SceneObjectTypeMSFT;
}
#run {
    instance: SceneObjectMSFT;
    assert(((cast(*void)(*instance.objectType)) - cast(*void)(*instance)) == 0, "SceneObjectMSFT.objectType has unexpected offset % instead of 0", ((cast(*void)(*instance.objectType)) - cast(*void)(*instance)));
    assert(size_of(type_of(SceneObjectMSFT.objectType)) == 4, "SceneObjectMSFT.objectType has unexpected size % instead of 4", size_of(type_of(SceneObjectMSFT.objectType)));
    assert(size_of(SceneObjectMSFT) == 4, "SceneObjectMSFT has size % instead of 4", size_of(SceneObjectMSFT));
}

// XrSceneObjectsMSFT extends XrSceneComponentsMSFT
SceneObjectsMSFT :: struct {
    type:             StructureType;
    next:             *void;
    sceneObjectCount: u32;
    sceneObjects:     *SceneObjectMSFT;
}
#run {
    instance: SceneObjectsMSFT;
    assert(((cast(*void)(*instance.type)) - cast(*void)(*instance)) == 0, "SceneObjectsMSFT.type has unexpected offset % instead of 0", ((cast(*void)(*instance.type)) - cast(*void)(*instance)));
    assert(size_of(type_of(SceneObjectsMSFT.type)) == 4, "SceneObjectsMSFT.type has unexpected size % instead of 4", size_of(type_of(SceneObjectsMSFT.type)));
    assert(((cast(*void)(*instance.next)) - cast(*void)(*instance)) == 8, "SceneObjectsMSFT.next has unexpected offset % instead of 8", ((cast(*void)(*instance.next)) - cast(*void)(*instance)));
    assert(size_of(type_of(SceneObjectsMSFT.next)) == 8, "SceneObjectsMSFT.next has unexpected size % instead of 8", size_of(type_of(SceneObjectsMSFT.next)));
    assert(((cast(*void)(*instance.sceneObjectCount)) - cast(*void)(*instance)) == 16, "SceneObjectsMSFT.sceneObjectCount has unexpected offset % instead of 16", ((cast(*void)(*instance.sceneObjectCount)) - cast(*void)(*instance)));
    assert(size_of(type_of(SceneObjectsMSFT.sceneObjectCount)) == 4, "SceneObjectsMSFT.sceneObjectCount has unexpected size % instead of 4", size_of(type_of(SceneObjectsMSFT.sceneObjectCount)));
    assert(((cast(*void)(*instance.sceneObjects)) - cast(*void)(*instance)) == 24, "SceneObjectsMSFT.sceneObjects has unexpected offset % instead of 24", ((cast(*void)(*instance.sceneObjects)) - cast(*void)(*instance)));
    assert(size_of(type_of(SceneObjectsMSFT.sceneObjects)) == 8, "SceneObjectsMSFT.sceneObjects has unexpected size % instead of 8", size_of(type_of(SceneObjectsMSFT.sceneObjects)));
    assert(size_of(SceneObjectsMSFT) == 32, "SceneObjectsMSFT has size % instead of 32", size_of(SceneObjectsMSFT));
}

// XrSceneComponentParentFilterInfoMSFT extends XrSceneComponentsGetInfoMSFT
SceneComponentParentFilterInfoMSFT :: struct {
    type:     StructureType;
    next:     *void;
    parentId: UuidMSFT;
}
#run {
    instance: SceneComponentParentFilterInfoMSFT;
    assert(((cast(*void)(*instance.type)) - cast(*void)(*instance)) == 0, "SceneComponentParentFilterInfoMSFT.type has unexpected offset % instead of 0", ((cast(*void)(*instance.type)) - cast(*void)(*instance)));
    assert(size_of(type_of(SceneComponentParentFilterInfoMSFT.type)) == 4, "SceneComponentParentFilterInfoMSFT.type has unexpected size % instead of 4", size_of(type_of(SceneComponentParentFilterInfoMSFT.type)));
    assert(((cast(*void)(*instance.next)) - cast(*void)(*instance)) == 8, "SceneComponentParentFilterInfoMSFT.next has unexpected offset % instead of 8", ((cast(*void)(*instance.next)) - cast(*void)(*instance)));
    assert(size_of(type_of(SceneComponentParentFilterInfoMSFT.next)) == 8, "SceneComponentParentFilterInfoMSFT.next has unexpected size % instead of 8", size_of(type_of(SceneComponentParentFilterInfoMSFT.next)));
    assert(((cast(*void)(*instance.parentId)) - cast(*void)(*instance)) == 16, "SceneComponentParentFilterInfoMSFT.parentId has unexpected offset % instead of 16", ((cast(*void)(*instance.parentId)) - cast(*void)(*instance)));
    assert(size_of(type_of(SceneComponentParentFilterInfoMSFT.parentId)) == 16, "SceneComponentParentFilterInfoMSFT.parentId has unexpected size % instead of 16", size_of(type_of(SceneComponentParentFilterInfoMSFT.parentId)));
    assert(size_of(SceneComponentParentFilterInfoMSFT) == 32, "SceneComponentParentFilterInfoMSFT has size % instead of 32", size_of(SceneComponentParentFilterInfoMSFT));
}

// XrSceneObjectTypesFilterInfoMSFT extends XrSceneComponentsGetInfoMSFT
SceneObjectTypesFilterInfoMSFT :: struct {
    type:            StructureType;
    next:            *void;
    objectTypeCount: u32;
    objectTypes:     *SceneObjectTypeMSFT;
}
#run {
    instance: SceneObjectTypesFilterInfoMSFT;
    assert(((cast(*void)(*instance.type)) - cast(*void)(*instance)) == 0, "SceneObjectTypesFilterInfoMSFT.type has unexpected offset % instead of 0", ((cast(*void)(*instance.type)) - cast(*void)(*instance)));
    assert(size_of(type_of(SceneObjectTypesFilterInfoMSFT.type)) == 4, "SceneObjectTypesFilterInfoMSFT.type has unexpected size % instead of 4", size_of(type_of(SceneObjectTypesFilterInfoMSFT.type)));
    assert(((cast(*void)(*instance.next)) - cast(*void)(*instance)) == 8, "SceneObjectTypesFilterInfoMSFT.next has unexpected offset % instead of 8", ((cast(*void)(*instance.next)) - cast(*void)(*instance)));
    assert(size_of(type_of(SceneObjectTypesFilterInfoMSFT.next)) == 8, "SceneObjectTypesFilterInfoMSFT.next has unexpected size % instead of 8", size_of(type_of(SceneObjectTypesFilterInfoMSFT.next)));
    assert(((cast(*void)(*instance.objectTypeCount)) - cast(*void)(*instance)) == 16, "SceneObjectTypesFilterInfoMSFT.objectTypeCount has unexpected offset % instead of 16", ((cast(*void)(*instance.objectTypeCount)) - cast(*void)(*instance)));
    assert(size_of(type_of(SceneObjectTypesFilterInfoMSFT.objectTypeCount)) == 4, "SceneObjectTypesFilterInfoMSFT.objectTypeCount has unexpected size % instead of 4", size_of(type_of(SceneObjectTypesFilterInfoMSFT.objectTypeCount)));
    assert(((cast(*void)(*instance.objectTypes)) - cast(*void)(*instance)) == 24, "SceneObjectTypesFilterInfoMSFT.objectTypes has unexpected offset % instead of 24", ((cast(*void)(*instance.objectTypes)) - cast(*void)(*instance)));
    assert(size_of(type_of(SceneObjectTypesFilterInfoMSFT.objectTypes)) == 8, "SceneObjectTypesFilterInfoMSFT.objectTypes has unexpected size % instead of 8", size_of(type_of(SceneObjectTypesFilterInfoMSFT.objectTypes)));
    assert(size_of(SceneObjectTypesFilterInfoMSFT) == 32, "SceneObjectTypesFilterInfoMSFT has size % instead of 32", size_of(SceneObjectTypesFilterInfoMSFT));
}

ScenePlaneMSFT :: struct {
    alignment:             ScenePlaneAlignmentTypeMSFT;
    size:                  Extent2Df;
    meshBufferId:          u64;
    supportsIndicesUint16: Bool32;
}
#run {
    instance: ScenePlaneMSFT;
    assert(((cast(*void)(*instance.alignment)) - cast(*void)(*instance)) == 0, "ScenePlaneMSFT.alignment has unexpected offset % instead of 0", ((cast(*void)(*instance.alignment)) - cast(*void)(*instance)));
    assert(size_of(type_of(ScenePlaneMSFT.alignment)) == 4, "ScenePlaneMSFT.alignment has unexpected size % instead of 4", size_of(type_of(ScenePlaneMSFT.alignment)));
    assert(((cast(*void)(*instance.size)) - cast(*void)(*instance)) == 4, "ScenePlaneMSFT.size has unexpected offset % instead of 4", ((cast(*void)(*instance.size)) - cast(*void)(*instance)));
    assert(size_of(type_of(ScenePlaneMSFT.size)) == 8, "ScenePlaneMSFT.size has unexpected size % instead of 8", size_of(type_of(ScenePlaneMSFT.size)));
    assert(((cast(*void)(*instance.meshBufferId)) - cast(*void)(*instance)) == 16, "ScenePlaneMSFT.meshBufferId has unexpected offset % instead of 16", ((cast(*void)(*instance.meshBufferId)) - cast(*void)(*instance)));
    assert(size_of(type_of(ScenePlaneMSFT.meshBufferId)) == 8, "ScenePlaneMSFT.meshBufferId has unexpected size % instead of 8", size_of(type_of(ScenePlaneMSFT.meshBufferId)));
    assert(((cast(*void)(*instance.supportsIndicesUint16)) - cast(*void)(*instance)) == 24, "ScenePlaneMSFT.supportsIndicesUint16 has unexpected offset % instead of 24", ((cast(*void)(*instance.supportsIndicesUint16)) - cast(*void)(*instance)));
    assert(size_of(type_of(ScenePlaneMSFT.supportsIndicesUint16)) == 4, "ScenePlaneMSFT.supportsIndicesUint16 has unexpected size % instead of 4", size_of(type_of(ScenePlaneMSFT.supportsIndicesUint16)));
    assert(size_of(ScenePlaneMSFT) == 32, "ScenePlaneMSFT has size % instead of 32", size_of(ScenePlaneMSFT));
}

// XrScenePlanesMSFT extends XrSceneComponentsMSFT
ScenePlanesMSFT :: struct {
    type:            StructureType;
    next:            *void;
    scenePlaneCount: u32;
    scenePlanes:     *ScenePlaneMSFT;
}
#run {
    instance: ScenePlanesMSFT;
    assert(((cast(*void)(*instance.type)) - cast(*void)(*instance)) == 0, "ScenePlanesMSFT.type has unexpected offset % instead of 0", ((cast(*void)(*instance.type)) - cast(*void)(*instance)));
    assert(size_of(type_of(ScenePlanesMSFT.type)) == 4, "ScenePlanesMSFT.type has unexpected size % instead of 4", size_of(type_of(ScenePlanesMSFT.type)));
    assert(((cast(*void)(*instance.next)) - cast(*void)(*instance)) == 8, "ScenePlanesMSFT.next has unexpected offset % instead of 8", ((cast(*void)(*instance.next)) - cast(*void)(*instance)));
    assert(size_of(type_of(ScenePlanesMSFT.next)) == 8, "ScenePlanesMSFT.next has unexpected size % instead of 8", size_of(type_of(ScenePlanesMSFT.next)));
    assert(((cast(*void)(*instance.scenePlaneCount)) - cast(*void)(*instance)) == 16, "ScenePlanesMSFT.scenePlaneCount has unexpected offset % instead of 16", ((cast(*void)(*instance.scenePlaneCount)) - cast(*void)(*instance)));
    assert(size_of(type_of(ScenePlanesMSFT.scenePlaneCount)) == 4, "ScenePlanesMSFT.scenePlaneCount has unexpected size % instead of 4", size_of(type_of(ScenePlanesMSFT.scenePlaneCount)));
    assert(((cast(*void)(*instance.scenePlanes)) - cast(*void)(*instance)) == 24, "ScenePlanesMSFT.scenePlanes has unexpected offset % instead of 24", ((cast(*void)(*instance.scenePlanes)) - cast(*void)(*instance)));
    assert(size_of(type_of(ScenePlanesMSFT.scenePlanes)) == 8, "ScenePlanesMSFT.scenePlanes has unexpected size % instead of 8", size_of(type_of(ScenePlanesMSFT.scenePlanes)));
    assert(size_of(ScenePlanesMSFT) == 32, "ScenePlanesMSFT has size % instead of 32", size_of(ScenePlanesMSFT));
}

// XrScenePlaneAlignmentFilterInfoMSFT extends XrSceneComponentsGetInfoMSFT
ScenePlaneAlignmentFilterInfoMSFT :: struct {
    type:           StructureType;
    next:           *void;
    alignmentCount: u32;
    alignments:     *ScenePlaneAlignmentTypeMSFT;
}
#run {
    instance: ScenePlaneAlignmentFilterInfoMSFT;
    assert(((cast(*void)(*instance.type)) - cast(*void)(*instance)) == 0, "ScenePlaneAlignmentFilterInfoMSFT.type has unexpected offset % instead of 0", ((cast(*void)(*instance.type)) - cast(*void)(*instance)));
    assert(size_of(type_of(ScenePlaneAlignmentFilterInfoMSFT.type)) == 4, "ScenePlaneAlignmentFilterInfoMSFT.type has unexpected size % instead of 4", size_of(type_of(ScenePlaneAlignmentFilterInfoMSFT.type)));
    assert(((cast(*void)(*instance.next)) - cast(*void)(*instance)) == 8, "ScenePlaneAlignmentFilterInfoMSFT.next has unexpected offset % instead of 8", ((cast(*void)(*instance.next)) - cast(*void)(*instance)));
    assert(size_of(type_of(ScenePlaneAlignmentFilterInfoMSFT.next)) == 8, "ScenePlaneAlignmentFilterInfoMSFT.next has unexpected size % instead of 8", size_of(type_of(ScenePlaneAlignmentFilterInfoMSFT.next)));
    assert(((cast(*void)(*instance.alignmentCount)) - cast(*void)(*instance)) == 16, "ScenePlaneAlignmentFilterInfoMSFT.alignmentCount has unexpected offset % instead of 16", ((cast(*void)(*instance.alignmentCount)) - cast(*void)(*instance)));
    assert(size_of(type_of(ScenePlaneAlignmentFilterInfoMSFT.alignmentCount)) == 4, "ScenePlaneAlignmentFilterInfoMSFT.alignmentCount has unexpected size % instead of 4", size_of(type_of(ScenePlaneAlignmentFilterInfoMSFT.alignmentCount)));
    assert(((cast(*void)(*instance.alignments)) - cast(*void)(*instance)) == 24, "ScenePlaneAlignmentFilterInfoMSFT.alignments has unexpected offset % instead of 24", ((cast(*void)(*instance.alignments)) - cast(*void)(*instance)));
    assert(size_of(type_of(ScenePlaneAlignmentFilterInfoMSFT.alignments)) == 8, "ScenePlaneAlignmentFilterInfoMSFT.alignments has unexpected size % instead of 8", size_of(type_of(ScenePlaneAlignmentFilterInfoMSFT.alignments)));
    assert(size_of(ScenePlaneAlignmentFilterInfoMSFT) == 32, "ScenePlaneAlignmentFilterInfoMSFT has size % instead of 32", size_of(ScenePlaneAlignmentFilterInfoMSFT));
}

SceneMeshMSFT :: struct {
    meshBufferId:          u64;
    supportsIndicesUint16: Bool32;
}
#run {
    instance: SceneMeshMSFT;
    assert(((cast(*void)(*instance.meshBufferId)) - cast(*void)(*instance)) == 0, "SceneMeshMSFT.meshBufferId has unexpected offset % instead of 0", ((cast(*void)(*instance.meshBufferId)) - cast(*void)(*instance)));
    assert(size_of(type_of(SceneMeshMSFT.meshBufferId)) == 8, "SceneMeshMSFT.meshBufferId has unexpected size % instead of 8", size_of(type_of(SceneMeshMSFT.meshBufferId)));
    assert(((cast(*void)(*instance.supportsIndicesUint16)) - cast(*void)(*instance)) == 8, "SceneMeshMSFT.supportsIndicesUint16 has unexpected offset % instead of 8", ((cast(*void)(*instance.supportsIndicesUint16)) - cast(*void)(*instance)));
    assert(size_of(type_of(SceneMeshMSFT.supportsIndicesUint16)) == 4, "SceneMeshMSFT.supportsIndicesUint16 has unexpected size % instead of 4", size_of(type_of(SceneMeshMSFT.supportsIndicesUint16)));
    assert(size_of(SceneMeshMSFT) == 16, "SceneMeshMSFT has size % instead of 16", size_of(SceneMeshMSFT));
}

// XrSceneMeshesMSFT extends XrSceneComponentsMSFT
SceneMeshesMSFT :: struct {
    type:           StructureType;
    next:           *void;
    sceneMeshCount: u32;
    sceneMeshes:    *SceneMeshMSFT;
}
#run {
    instance: SceneMeshesMSFT;
    assert(((cast(*void)(*instance.type)) - cast(*void)(*instance)) == 0, "SceneMeshesMSFT.type has unexpected offset % instead of 0", ((cast(*void)(*instance.type)) - cast(*void)(*instance)));
    assert(size_of(type_of(SceneMeshesMSFT.type)) == 4, "SceneMeshesMSFT.type has unexpected size % instead of 4", size_of(type_of(SceneMeshesMSFT.type)));
    assert(((cast(*void)(*instance.next)) - cast(*void)(*instance)) == 8, "SceneMeshesMSFT.next has unexpected offset % instead of 8", ((cast(*void)(*instance.next)) - cast(*void)(*instance)));
    assert(size_of(type_of(SceneMeshesMSFT.next)) == 8, "SceneMeshesMSFT.next has unexpected size % instead of 8", size_of(type_of(SceneMeshesMSFT.next)));
    assert(((cast(*void)(*instance.sceneMeshCount)) - cast(*void)(*instance)) == 16, "SceneMeshesMSFT.sceneMeshCount has unexpected offset % instead of 16", ((cast(*void)(*instance.sceneMeshCount)) - cast(*void)(*instance)));
    assert(size_of(type_of(SceneMeshesMSFT.sceneMeshCount)) == 4, "SceneMeshesMSFT.sceneMeshCount has unexpected size % instead of 4", size_of(type_of(SceneMeshesMSFT.sceneMeshCount)));
    assert(((cast(*void)(*instance.sceneMeshes)) - cast(*void)(*instance)) == 24, "SceneMeshesMSFT.sceneMeshes has unexpected offset % instead of 24", ((cast(*void)(*instance.sceneMeshes)) - cast(*void)(*instance)));
    assert(size_of(type_of(SceneMeshesMSFT.sceneMeshes)) == 8, "SceneMeshesMSFT.sceneMeshes has unexpected size % instead of 8", size_of(type_of(SceneMeshesMSFT.sceneMeshes)));
    assert(size_of(SceneMeshesMSFT) == 32, "SceneMeshesMSFT has size % instead of 32", size_of(SceneMeshesMSFT));
}

SceneMeshBuffersGetInfoMSFT :: struct {
    type:         StructureType;
    next:         *void;
    meshBufferId: u64;
}
#run {
    instance: SceneMeshBuffersGetInfoMSFT;
    assert(((cast(*void)(*instance.type)) - cast(*void)(*instance)) == 0, "SceneMeshBuffersGetInfoMSFT.type has unexpected offset % instead of 0", ((cast(*void)(*instance.type)) - cast(*void)(*instance)));
    assert(size_of(type_of(SceneMeshBuffersGetInfoMSFT.type)) == 4, "SceneMeshBuffersGetInfoMSFT.type has unexpected size % instead of 4", size_of(type_of(SceneMeshBuffersGetInfoMSFT.type)));
    assert(((cast(*void)(*instance.next)) - cast(*void)(*instance)) == 8, "SceneMeshBuffersGetInfoMSFT.next has unexpected offset % instead of 8", ((cast(*void)(*instance.next)) - cast(*void)(*instance)));
    assert(size_of(type_of(SceneMeshBuffersGetInfoMSFT.next)) == 8, "SceneMeshBuffersGetInfoMSFT.next has unexpected size % instead of 8", size_of(type_of(SceneMeshBuffersGetInfoMSFT.next)));
    assert(((cast(*void)(*instance.meshBufferId)) - cast(*void)(*instance)) == 16, "SceneMeshBuffersGetInfoMSFT.meshBufferId has unexpected offset % instead of 16", ((cast(*void)(*instance.meshBufferId)) - cast(*void)(*instance)));
    assert(size_of(type_of(SceneMeshBuffersGetInfoMSFT.meshBufferId)) == 8, "SceneMeshBuffersGetInfoMSFT.meshBufferId has unexpected size % instead of 8", size_of(type_of(SceneMeshBuffersGetInfoMSFT.meshBufferId)));
    assert(size_of(SceneMeshBuffersGetInfoMSFT) == 24, "SceneMeshBuffersGetInfoMSFT has size % instead of 24", size_of(SceneMeshBuffersGetInfoMSFT));
}

SceneMeshBuffersMSFT :: struct {
    type: StructureType;
    next: *void;
}
#run {
    instance: SceneMeshBuffersMSFT;
    assert(((cast(*void)(*instance.type)) - cast(*void)(*instance)) == 0, "SceneMeshBuffersMSFT.type has unexpected offset % instead of 0", ((cast(*void)(*instance.type)) - cast(*void)(*instance)));
    assert(size_of(type_of(SceneMeshBuffersMSFT.type)) == 4, "SceneMeshBuffersMSFT.type has unexpected size % instead of 4", size_of(type_of(SceneMeshBuffersMSFT.type)));
    assert(((cast(*void)(*instance.next)) - cast(*void)(*instance)) == 8, "SceneMeshBuffersMSFT.next has unexpected offset % instead of 8", ((cast(*void)(*instance.next)) - cast(*void)(*instance)));
    assert(size_of(type_of(SceneMeshBuffersMSFT.next)) == 8, "SceneMeshBuffersMSFT.next has unexpected size % instead of 8", size_of(type_of(SceneMeshBuffersMSFT.next)));
    assert(size_of(SceneMeshBuffersMSFT) == 16, "SceneMeshBuffersMSFT has size % instead of 16", size_of(SceneMeshBuffersMSFT));
}

SceneMeshVertexBufferMSFT :: struct {
    type:                StructureType;
    next:                *void;
    vertexCapacityInput: u32;
    vertexCountOutput:   u32;
    vertices:            *Vector3f;
}
#run {
    instance: SceneMeshVertexBufferMSFT;
    assert(((cast(*void)(*instance.type)) - cast(*void)(*instance)) == 0, "SceneMeshVertexBufferMSFT.type has unexpected offset % instead of 0", ((cast(*void)(*instance.type)) - cast(*void)(*instance)));
    assert(size_of(type_of(SceneMeshVertexBufferMSFT.type)) == 4, "SceneMeshVertexBufferMSFT.type has unexpected size % instead of 4", size_of(type_of(SceneMeshVertexBufferMSFT.type)));
    assert(((cast(*void)(*instance.next)) - cast(*void)(*instance)) == 8, "SceneMeshVertexBufferMSFT.next has unexpected offset % instead of 8", ((cast(*void)(*instance.next)) - cast(*void)(*instance)));
    assert(size_of(type_of(SceneMeshVertexBufferMSFT.next)) == 8, "SceneMeshVertexBufferMSFT.next has unexpected size % instead of 8", size_of(type_of(SceneMeshVertexBufferMSFT.next)));
    assert(((cast(*void)(*instance.vertexCapacityInput)) - cast(*void)(*instance)) == 16, "SceneMeshVertexBufferMSFT.vertexCapacityInput has unexpected offset % instead of 16", ((cast(*void)(*instance.vertexCapacityInput)) - cast(*void)(*instance)));
    assert(size_of(type_of(SceneMeshVertexBufferMSFT.vertexCapacityInput)) == 4, "SceneMeshVertexBufferMSFT.vertexCapacityInput has unexpected size % instead of 4", size_of(type_of(SceneMeshVertexBufferMSFT.vertexCapacityInput)));
    assert(((cast(*void)(*instance.vertexCountOutput)) - cast(*void)(*instance)) == 20, "SceneMeshVertexBufferMSFT.vertexCountOutput has unexpected offset % instead of 20", ((cast(*void)(*instance.vertexCountOutput)) - cast(*void)(*instance)));
    assert(size_of(type_of(SceneMeshVertexBufferMSFT.vertexCountOutput)) == 4, "SceneMeshVertexBufferMSFT.vertexCountOutput has unexpected size % instead of 4", size_of(type_of(SceneMeshVertexBufferMSFT.vertexCountOutput)));
    assert(((cast(*void)(*instance.vertices)) - cast(*void)(*instance)) == 24, "SceneMeshVertexBufferMSFT.vertices has unexpected offset % instead of 24", ((cast(*void)(*instance.vertices)) - cast(*void)(*instance)));
    assert(size_of(type_of(SceneMeshVertexBufferMSFT.vertices)) == 8, "SceneMeshVertexBufferMSFT.vertices has unexpected size % instead of 8", size_of(type_of(SceneMeshVertexBufferMSFT.vertices)));
    assert(size_of(SceneMeshVertexBufferMSFT) == 32, "SceneMeshVertexBufferMSFT has size % instead of 32", size_of(SceneMeshVertexBufferMSFT));
}

SceneMeshIndicesUint32MSFT :: struct {
    type:               StructureType;
    next:               *void;
    indexCapacityInput: u32;
    indexCountOutput:   u32;
    indices:            *u32;
}
#run {
    instance: SceneMeshIndicesUint32MSFT;
    assert(((cast(*void)(*instance.type)) - cast(*void)(*instance)) == 0, "SceneMeshIndicesUint32MSFT.type has unexpected offset % instead of 0", ((cast(*void)(*instance.type)) - cast(*void)(*instance)));
    assert(size_of(type_of(SceneMeshIndicesUint32MSFT.type)) == 4, "SceneMeshIndicesUint32MSFT.type has unexpected size % instead of 4", size_of(type_of(SceneMeshIndicesUint32MSFT.type)));
    assert(((cast(*void)(*instance.next)) - cast(*void)(*instance)) == 8, "SceneMeshIndicesUint32MSFT.next has unexpected offset % instead of 8", ((cast(*void)(*instance.next)) - cast(*void)(*instance)));
    assert(size_of(type_of(SceneMeshIndicesUint32MSFT.next)) == 8, "SceneMeshIndicesUint32MSFT.next has unexpected size % instead of 8", size_of(type_of(SceneMeshIndicesUint32MSFT.next)));
    assert(((cast(*void)(*instance.indexCapacityInput)) - cast(*void)(*instance)) == 16, "SceneMeshIndicesUint32MSFT.indexCapacityInput has unexpected offset % instead of 16", ((cast(*void)(*instance.indexCapacityInput)) - cast(*void)(*instance)));
    assert(size_of(type_of(SceneMeshIndicesUint32MSFT.indexCapacityInput)) == 4, "SceneMeshIndicesUint32MSFT.indexCapacityInput has unexpected size % instead of 4", size_of(type_of(SceneMeshIndicesUint32MSFT.indexCapacityInput)));
    assert(((cast(*void)(*instance.indexCountOutput)) - cast(*void)(*instance)) == 20, "SceneMeshIndicesUint32MSFT.indexCountOutput has unexpected offset % instead of 20", ((cast(*void)(*instance.indexCountOutput)) - cast(*void)(*instance)));
    assert(size_of(type_of(SceneMeshIndicesUint32MSFT.indexCountOutput)) == 4, "SceneMeshIndicesUint32MSFT.indexCountOutput has unexpected size % instead of 4", size_of(type_of(SceneMeshIndicesUint32MSFT.indexCountOutput)));
    assert(((cast(*void)(*instance.indices)) - cast(*void)(*instance)) == 24, "SceneMeshIndicesUint32MSFT.indices has unexpected offset % instead of 24", ((cast(*void)(*instance.indices)) - cast(*void)(*instance)));
    assert(size_of(type_of(SceneMeshIndicesUint32MSFT.indices)) == 8, "SceneMeshIndicesUint32MSFT.indices has unexpected size % instead of 8", size_of(type_of(SceneMeshIndicesUint32MSFT.indices)));
    assert(size_of(SceneMeshIndicesUint32MSFT) == 32, "SceneMeshIndicesUint32MSFT has size % instead of 32", size_of(SceneMeshIndicesUint32MSFT));
}

SceneMeshIndicesUint16MSFT :: struct {
    type:               StructureType;
    next:               *void;
    indexCapacityInput: u32;
    indexCountOutput:   u32;
    indices:            *u16;
}
#run {
    instance: SceneMeshIndicesUint16MSFT;
    assert(((cast(*void)(*instance.type)) - cast(*void)(*instance)) == 0, "SceneMeshIndicesUint16MSFT.type has unexpected offset % instead of 0", ((cast(*void)(*instance.type)) - cast(*void)(*instance)));
    assert(size_of(type_of(SceneMeshIndicesUint16MSFT.type)) == 4, "SceneMeshIndicesUint16MSFT.type has unexpected size % instead of 4", size_of(type_of(SceneMeshIndicesUint16MSFT.type)));
    assert(((cast(*void)(*instance.next)) - cast(*void)(*instance)) == 8, "SceneMeshIndicesUint16MSFT.next has unexpected offset % instead of 8", ((cast(*void)(*instance.next)) - cast(*void)(*instance)));
    assert(size_of(type_of(SceneMeshIndicesUint16MSFT.next)) == 8, "SceneMeshIndicesUint16MSFT.next has unexpected size % instead of 8", size_of(type_of(SceneMeshIndicesUint16MSFT.next)));
    assert(((cast(*void)(*instance.indexCapacityInput)) - cast(*void)(*instance)) == 16, "SceneMeshIndicesUint16MSFT.indexCapacityInput has unexpected offset % instead of 16", ((cast(*void)(*instance.indexCapacityInput)) - cast(*void)(*instance)));
    assert(size_of(type_of(SceneMeshIndicesUint16MSFT.indexCapacityInput)) == 4, "SceneMeshIndicesUint16MSFT.indexCapacityInput has unexpected size % instead of 4", size_of(type_of(SceneMeshIndicesUint16MSFT.indexCapacityInput)));
    assert(((cast(*void)(*instance.indexCountOutput)) - cast(*void)(*instance)) == 20, "SceneMeshIndicesUint16MSFT.indexCountOutput has unexpected offset % instead of 20", ((cast(*void)(*instance.indexCountOutput)) - cast(*void)(*instance)));
    assert(size_of(type_of(SceneMeshIndicesUint16MSFT.indexCountOutput)) == 4, "SceneMeshIndicesUint16MSFT.indexCountOutput has unexpected size % instead of 4", size_of(type_of(SceneMeshIndicesUint16MSFT.indexCountOutput)));
    assert(((cast(*void)(*instance.indices)) - cast(*void)(*instance)) == 24, "SceneMeshIndicesUint16MSFT.indices has unexpected offset % instead of 24", ((cast(*void)(*instance.indices)) - cast(*void)(*instance)));
    assert(size_of(type_of(SceneMeshIndicesUint16MSFT.indices)) == 8, "SceneMeshIndicesUint16MSFT.indices has unexpected size % instead of 8", size_of(type_of(SceneMeshIndicesUint16MSFT.indices)));
    assert(size_of(SceneMeshIndicesUint16MSFT) == 32, "SceneMeshIndicesUint16MSFT has size % instead of 32", size_of(SceneMeshIndicesUint16MSFT));
}

PFN_xrEnumerateSceneComputeFeaturesMSFT :: #type (a0: Instance, a1: SystemId, a2: u32, a3: *u32, a4: *SceneComputeFeatureMSFT) -> Result #c_call;
PFN_xrCreateSceneObserverMSFT :: #type (a0: Session, a1: *SceneObserverCreateInfoMSFT, a2: *SceneObserverMSFT) -> Result #c_call;
PFN_xrDestroySceneObserverMSFT :: #type (a0: SceneObserverMSFT) -> Result #c_call;
PFN_xrCreateSceneMSFT :: #type (a0: SceneObserverMSFT, a1: *SceneCreateInfoMSFT, a2: *SceneMSFT) -> Result #c_call;
PFN_xrDestroySceneMSFT :: #type (a0: SceneMSFT) -> Result #c_call;
PFN_xrComputeNewSceneMSFT :: #type (a0: SceneObserverMSFT, a1: *NewSceneComputeInfoMSFT) -> Result #c_call;
PFN_xrGetSceneComputeStateMSFT :: #type (a0: SceneObserverMSFT, a1: *SceneComputeStateMSFT) -> Result #c_call;
PFN_xrGetSceneComponentsMSFT :: #type (a0: SceneMSFT, a1: *SceneComponentsGetInfoMSFT, a2: *SceneComponentsMSFT) -> Result #c_call;
PFN_xrLocateSceneComponentsMSFT :: #type (a0: SceneMSFT, a1: *SceneComponentsLocateInfoMSFT, a2: *SceneComponentLocationsMSFT) -> Result #c_call;
PFN_xrGetSceneMeshBuffersMSFT :: #type (a0: SceneMSFT, a1: *SceneMeshBuffersGetInfoMSFT, a2: *SceneMeshBuffersMSFT) -> Result #c_call;

SerializedSceneFragmentDataGetInfoMSFT :: struct {
    type:            StructureType;
    next:            *void;
    sceneFragmentId: UuidMSFT;
}
#run {
    instance: SerializedSceneFragmentDataGetInfoMSFT;
    assert(((cast(*void)(*instance.type)) - cast(*void)(*instance)) == 0, "SerializedSceneFragmentDataGetInfoMSFT.type has unexpected offset % instead of 0", ((cast(*void)(*instance.type)) - cast(*void)(*instance)));
    assert(size_of(type_of(SerializedSceneFragmentDataGetInfoMSFT.type)) == 4, "SerializedSceneFragmentDataGetInfoMSFT.type has unexpected size % instead of 4", size_of(type_of(SerializedSceneFragmentDataGetInfoMSFT.type)));
    assert(((cast(*void)(*instance.next)) - cast(*void)(*instance)) == 8, "SerializedSceneFragmentDataGetInfoMSFT.next has unexpected offset % instead of 8", ((cast(*void)(*instance.next)) - cast(*void)(*instance)));
    assert(size_of(type_of(SerializedSceneFragmentDataGetInfoMSFT.next)) == 8, "SerializedSceneFragmentDataGetInfoMSFT.next has unexpected size % instead of 8", size_of(type_of(SerializedSceneFragmentDataGetInfoMSFT.next)));
    assert(((cast(*void)(*instance.sceneFragmentId)) - cast(*void)(*instance)) == 16, "SerializedSceneFragmentDataGetInfoMSFT.sceneFragmentId has unexpected offset % instead of 16", ((cast(*void)(*instance.sceneFragmentId)) - cast(*void)(*instance)));
    assert(size_of(type_of(SerializedSceneFragmentDataGetInfoMSFT.sceneFragmentId)) == 16, "SerializedSceneFragmentDataGetInfoMSFT.sceneFragmentId has unexpected size % instead of 16", size_of(type_of(SerializedSceneFragmentDataGetInfoMSFT.sceneFragmentId)));
    assert(size_of(SerializedSceneFragmentDataGetInfoMSFT) == 32, "SerializedSceneFragmentDataGetInfoMSFT has size % instead of 32", size_of(SerializedSceneFragmentDataGetInfoMSFT));
}

DeserializeSceneFragmentMSFT :: struct {
    bufferSize: u32;
    buffer:     *u8;
}
#run {
    instance: DeserializeSceneFragmentMSFT;
    assert(((cast(*void)(*instance.bufferSize)) - cast(*void)(*instance)) == 0, "DeserializeSceneFragmentMSFT.bufferSize has unexpected offset % instead of 0", ((cast(*void)(*instance.bufferSize)) - cast(*void)(*instance)));
    assert(size_of(type_of(DeserializeSceneFragmentMSFT.bufferSize)) == 4, "DeserializeSceneFragmentMSFT.bufferSize has unexpected size % instead of 4", size_of(type_of(DeserializeSceneFragmentMSFT.bufferSize)));
    assert(((cast(*void)(*instance.buffer)) - cast(*void)(*instance)) == 8, "DeserializeSceneFragmentMSFT.buffer has unexpected offset % instead of 8", ((cast(*void)(*instance.buffer)) - cast(*void)(*instance)));
    assert(size_of(type_of(DeserializeSceneFragmentMSFT.buffer)) == 8, "DeserializeSceneFragmentMSFT.buffer has unexpected size % instead of 8", size_of(type_of(DeserializeSceneFragmentMSFT.buffer)));
    assert(size_of(DeserializeSceneFragmentMSFT) == 16, "DeserializeSceneFragmentMSFT has size % instead of 16", size_of(DeserializeSceneFragmentMSFT));
}

SceneDeserializeInfoMSFT :: struct {
    type:          StructureType;
    next:          *void;
    fragmentCount: u32;
    fragments:     *DeserializeSceneFragmentMSFT;
}
#run {
    instance: SceneDeserializeInfoMSFT;
    assert(((cast(*void)(*instance.type)) - cast(*void)(*instance)) == 0, "SceneDeserializeInfoMSFT.type has unexpected offset % instead of 0", ((cast(*void)(*instance.type)) - cast(*void)(*instance)));
    assert(size_of(type_of(SceneDeserializeInfoMSFT.type)) == 4, "SceneDeserializeInfoMSFT.type has unexpected size % instead of 4", size_of(type_of(SceneDeserializeInfoMSFT.type)));
    assert(((cast(*void)(*instance.next)) - cast(*void)(*instance)) == 8, "SceneDeserializeInfoMSFT.next has unexpected offset % instead of 8", ((cast(*void)(*instance.next)) - cast(*void)(*instance)));
    assert(size_of(type_of(SceneDeserializeInfoMSFT.next)) == 8, "SceneDeserializeInfoMSFT.next has unexpected size % instead of 8", size_of(type_of(SceneDeserializeInfoMSFT.next)));
    assert(((cast(*void)(*instance.fragmentCount)) - cast(*void)(*instance)) == 16, "SceneDeserializeInfoMSFT.fragmentCount has unexpected offset % instead of 16", ((cast(*void)(*instance.fragmentCount)) - cast(*void)(*instance)));
    assert(size_of(type_of(SceneDeserializeInfoMSFT.fragmentCount)) == 4, "SceneDeserializeInfoMSFT.fragmentCount has unexpected size % instead of 4", size_of(type_of(SceneDeserializeInfoMSFT.fragmentCount)));
    assert(((cast(*void)(*instance.fragments)) - cast(*void)(*instance)) == 24, "SceneDeserializeInfoMSFT.fragments has unexpected offset % instead of 24", ((cast(*void)(*instance.fragments)) - cast(*void)(*instance)));
    assert(size_of(type_of(SceneDeserializeInfoMSFT.fragments)) == 8, "SceneDeserializeInfoMSFT.fragments has unexpected size % instead of 8", size_of(type_of(SceneDeserializeInfoMSFT.fragments)));
    assert(size_of(SceneDeserializeInfoMSFT) == 32, "SceneDeserializeInfoMSFT has size % instead of 32", size_of(SceneDeserializeInfoMSFT));
}

PFN_xrDeserializeSceneMSFT :: #type (a0: SceneObserverMSFT, a1: *SceneDeserializeInfoMSFT) -> Result #c_call;
PFN_xrGetSerializedSceneFragmentDataMSFT :: #type (a0: SceneMSFT, a1: *SerializedSceneFragmentDataGetInfoMSFT, a2: u32, a3: *u32, a4: *u8) -> Result #c_call;

EventDataDisplayRefreshRateChangedFB :: struct {
    type:                   StructureType;
    next:                   *void;
    fromDisplayRefreshRate: float;
    toDisplayRefreshRate:   float;
}
#run {
    instance: EventDataDisplayRefreshRateChangedFB;
    assert(((cast(*void)(*instance.type)) - cast(*void)(*instance)) == 0, "EventDataDisplayRefreshRateChangedFB.type has unexpected offset % instead of 0", ((cast(*void)(*instance.type)) - cast(*void)(*instance)));
    assert(size_of(type_of(EventDataDisplayRefreshRateChangedFB.type)) == 4, "EventDataDisplayRefreshRateChangedFB.type has unexpected size % instead of 4", size_of(type_of(EventDataDisplayRefreshRateChangedFB.type)));
    assert(((cast(*void)(*instance.next)) - cast(*void)(*instance)) == 8, "EventDataDisplayRefreshRateChangedFB.next has unexpected offset % instead of 8", ((cast(*void)(*instance.next)) - cast(*void)(*instance)));
    assert(size_of(type_of(EventDataDisplayRefreshRateChangedFB.next)) == 8, "EventDataDisplayRefreshRateChangedFB.next has unexpected size % instead of 8", size_of(type_of(EventDataDisplayRefreshRateChangedFB.next)));
    assert(((cast(*void)(*instance.fromDisplayRefreshRate)) - cast(*void)(*instance)) == 16, "EventDataDisplayRefreshRateChangedFB.fromDisplayRefreshRate has unexpected offset % instead of 16", ((cast(*void)(*instance.fromDisplayRefreshRate)) - cast(*void)(*instance)));
    assert(size_of(type_of(EventDataDisplayRefreshRateChangedFB.fromDisplayRefreshRate)) == 4, "EventDataDisplayRefreshRateChangedFB.fromDisplayRefreshRate has unexpected size % instead of 4", size_of(type_of(EventDataDisplayRefreshRateChangedFB.fromDisplayRefreshRate)));
    assert(((cast(*void)(*instance.toDisplayRefreshRate)) - cast(*void)(*instance)) == 20, "EventDataDisplayRefreshRateChangedFB.toDisplayRefreshRate has unexpected offset % instead of 20", ((cast(*void)(*instance.toDisplayRefreshRate)) - cast(*void)(*instance)));
    assert(size_of(type_of(EventDataDisplayRefreshRateChangedFB.toDisplayRefreshRate)) == 4, "EventDataDisplayRefreshRateChangedFB.toDisplayRefreshRate has unexpected size % instead of 4", size_of(type_of(EventDataDisplayRefreshRateChangedFB.toDisplayRefreshRate)));
    assert(size_of(EventDataDisplayRefreshRateChangedFB) == 24, "EventDataDisplayRefreshRateChangedFB has size % instead of 24", size_of(EventDataDisplayRefreshRateChangedFB));
}

PFN_xrEnumerateDisplayRefreshRatesFB :: #type (a0: Session, a1: u32, a2: *u32, a3: *float) -> Result #c_call;
PFN_xrGetDisplayRefreshRateFB :: #type (a0: Session, a1: *float) -> Result #c_call;
PFN_xrRequestDisplayRefreshRateFB :: #type (a0: Session, a1: float) -> Result #c_call;

ViveTrackerPathsHTCX :: struct {
    type:           StructureType;
    next:           *void;
    persistentPath: Path;
    rolePath:       Path;
}
#run {
    instance: ViveTrackerPathsHTCX;
    assert(((cast(*void)(*instance.type)) - cast(*void)(*instance)) == 0, "ViveTrackerPathsHTCX.type has unexpected offset % instead of 0", ((cast(*void)(*instance.type)) - cast(*void)(*instance)));
    assert(size_of(type_of(ViveTrackerPathsHTCX.type)) == 4, "ViveTrackerPathsHTCX.type has unexpected size % instead of 4", size_of(type_of(ViveTrackerPathsHTCX.type)));
    assert(((cast(*void)(*instance.next)) - cast(*void)(*instance)) == 8, "ViveTrackerPathsHTCX.next has unexpected offset % instead of 8", ((cast(*void)(*instance.next)) - cast(*void)(*instance)));
    assert(size_of(type_of(ViveTrackerPathsHTCX.next)) == 8, "ViveTrackerPathsHTCX.next has unexpected size % instead of 8", size_of(type_of(ViveTrackerPathsHTCX.next)));
    assert(((cast(*void)(*instance.persistentPath)) - cast(*void)(*instance)) == 16, "ViveTrackerPathsHTCX.persistentPath has unexpected offset % instead of 16", ((cast(*void)(*instance.persistentPath)) - cast(*void)(*instance)));
    assert(size_of(type_of(ViveTrackerPathsHTCX.persistentPath)) == 8, "ViveTrackerPathsHTCX.persistentPath has unexpected size % instead of 8", size_of(type_of(ViveTrackerPathsHTCX.persistentPath)));
    assert(((cast(*void)(*instance.rolePath)) - cast(*void)(*instance)) == 24, "ViveTrackerPathsHTCX.rolePath has unexpected offset % instead of 24", ((cast(*void)(*instance.rolePath)) - cast(*void)(*instance)));
    assert(size_of(type_of(ViveTrackerPathsHTCX.rolePath)) == 8, "ViveTrackerPathsHTCX.rolePath has unexpected size % instead of 8", size_of(type_of(ViveTrackerPathsHTCX.rolePath)));
    assert(size_of(ViveTrackerPathsHTCX) == 32, "ViveTrackerPathsHTCX has size % instead of 32", size_of(ViveTrackerPathsHTCX));
}

EventDataViveTrackerConnectedHTCX :: struct {
    type:  StructureType;
    next:  *void;
    paths: *ViveTrackerPathsHTCX;
}
#run {
    instance: EventDataViveTrackerConnectedHTCX;
    assert(((cast(*void)(*instance.type)) - cast(*void)(*instance)) == 0, "EventDataViveTrackerConnectedHTCX.type has unexpected offset % instead of 0", ((cast(*void)(*instance.type)) - cast(*void)(*instance)));
    assert(size_of(type_of(EventDataViveTrackerConnectedHTCX.type)) == 4, "EventDataViveTrackerConnectedHTCX.type has unexpected size % instead of 4", size_of(type_of(EventDataViveTrackerConnectedHTCX.type)));
    assert(((cast(*void)(*instance.next)) - cast(*void)(*instance)) == 8, "EventDataViveTrackerConnectedHTCX.next has unexpected offset % instead of 8", ((cast(*void)(*instance.next)) - cast(*void)(*instance)));
    assert(size_of(type_of(EventDataViveTrackerConnectedHTCX.next)) == 8, "EventDataViveTrackerConnectedHTCX.next has unexpected size % instead of 8", size_of(type_of(EventDataViveTrackerConnectedHTCX.next)));
    assert(((cast(*void)(*instance.paths)) - cast(*void)(*instance)) == 16, "EventDataViveTrackerConnectedHTCX.paths has unexpected offset % instead of 16", ((cast(*void)(*instance.paths)) - cast(*void)(*instance)));
    assert(size_of(type_of(EventDataViveTrackerConnectedHTCX.paths)) == 8, "EventDataViveTrackerConnectedHTCX.paths has unexpected size % instead of 8", size_of(type_of(EventDataViveTrackerConnectedHTCX.paths)));
    assert(size_of(EventDataViveTrackerConnectedHTCX) == 24, "EventDataViveTrackerConnectedHTCX has size % instead of 24", size_of(EventDataViveTrackerConnectedHTCX));
}

PFN_xrEnumerateViveTrackerPathsHTCX :: #type (a0: Instance, a1: u32, a2: *u32, a3: *ViveTrackerPathsHTCX) -> Result #c_call;

FacialTrackerHTC_T :: struct {}
FacialTrackerHTC :: *FacialTrackerHTC_T;

EyeExpressionHTC :: enum s32 {
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

LipExpressionHTC :: enum s32 {
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

FacialTrackingTypeHTC :: enum s32 {
    EYE_DEFAULT_HTC :: 1;
    LIP_DEFAULT_HTC :: 2;
    MAX_ENUM_HTC    :: 2147483647;

    XR_FACIAL_TRACKING_TYPE_EYE_DEFAULT_HTC :: EYE_DEFAULT_HTC;
    XR_FACIAL_TRACKING_TYPE_LIP_DEFAULT_HTC :: LIP_DEFAULT_HTC;
    XR_FACIAL_TRACKING_TYPE_MAX_ENUM_HTC    :: MAX_ENUM_HTC;
}

// XrSystemFacialTrackingPropertiesHTC extends XrSystemProperties
SystemFacialTrackingPropertiesHTC :: struct {
    type:                     StructureType;
    next:                     *void;
    supportEyeFacialTracking: Bool32;
    supportLipFacialTracking: Bool32;
}
#run {
    instance: SystemFacialTrackingPropertiesHTC;
    assert(((cast(*void)(*instance.type)) - cast(*void)(*instance)) == 0, "SystemFacialTrackingPropertiesHTC.type has unexpected offset % instead of 0", ((cast(*void)(*instance.type)) - cast(*void)(*instance)));
    assert(size_of(type_of(SystemFacialTrackingPropertiesHTC.type)) == 4, "SystemFacialTrackingPropertiesHTC.type has unexpected size % instead of 4", size_of(type_of(SystemFacialTrackingPropertiesHTC.type)));
    assert(((cast(*void)(*instance.next)) - cast(*void)(*instance)) == 8, "SystemFacialTrackingPropertiesHTC.next has unexpected offset % instead of 8", ((cast(*void)(*instance.next)) - cast(*void)(*instance)));
    assert(size_of(type_of(SystemFacialTrackingPropertiesHTC.next)) == 8, "SystemFacialTrackingPropertiesHTC.next has unexpected size % instead of 8", size_of(type_of(SystemFacialTrackingPropertiesHTC.next)));
    assert(((cast(*void)(*instance.supportEyeFacialTracking)) - cast(*void)(*instance)) == 16, "SystemFacialTrackingPropertiesHTC.supportEyeFacialTracking has unexpected offset % instead of 16", ((cast(*void)(*instance.supportEyeFacialTracking)) - cast(*void)(*instance)));
    assert(size_of(type_of(SystemFacialTrackingPropertiesHTC.supportEyeFacialTracking)) == 4, "SystemFacialTrackingPropertiesHTC.supportEyeFacialTracking has unexpected size % instead of 4", size_of(type_of(SystemFacialTrackingPropertiesHTC.supportEyeFacialTracking)));
    assert(((cast(*void)(*instance.supportLipFacialTracking)) - cast(*void)(*instance)) == 20, "SystemFacialTrackingPropertiesHTC.supportLipFacialTracking has unexpected offset % instead of 20", ((cast(*void)(*instance.supportLipFacialTracking)) - cast(*void)(*instance)));
    assert(size_of(type_of(SystemFacialTrackingPropertiesHTC.supportLipFacialTracking)) == 4, "SystemFacialTrackingPropertiesHTC.supportLipFacialTracking has unexpected size % instead of 4", size_of(type_of(SystemFacialTrackingPropertiesHTC.supportLipFacialTracking)));
    assert(size_of(SystemFacialTrackingPropertiesHTC) == 24, "SystemFacialTrackingPropertiesHTC has size % instead of 24", size_of(SystemFacialTrackingPropertiesHTC));
}

FacialExpressionsHTC :: struct {
    type:                 StructureType;
    next:                 *void;
    isActive:             Bool32;
    sampleTime:           Time;
    expressionCount:      u32;
    expressionWeightings: *float;
}
#run {
    instance: FacialExpressionsHTC;
    assert(((cast(*void)(*instance.type)) - cast(*void)(*instance)) == 0, "FacialExpressionsHTC.type has unexpected offset % instead of 0", ((cast(*void)(*instance.type)) - cast(*void)(*instance)));
    assert(size_of(type_of(FacialExpressionsHTC.type)) == 4, "FacialExpressionsHTC.type has unexpected size % instead of 4", size_of(type_of(FacialExpressionsHTC.type)));
    assert(((cast(*void)(*instance.next)) - cast(*void)(*instance)) == 8, "FacialExpressionsHTC.next has unexpected offset % instead of 8", ((cast(*void)(*instance.next)) - cast(*void)(*instance)));
    assert(size_of(type_of(FacialExpressionsHTC.next)) == 8, "FacialExpressionsHTC.next has unexpected size % instead of 8", size_of(type_of(FacialExpressionsHTC.next)));
    assert(((cast(*void)(*instance.isActive)) - cast(*void)(*instance)) == 16, "FacialExpressionsHTC.isActive has unexpected offset % instead of 16", ((cast(*void)(*instance.isActive)) - cast(*void)(*instance)));
    assert(size_of(type_of(FacialExpressionsHTC.isActive)) == 4, "FacialExpressionsHTC.isActive has unexpected size % instead of 4", size_of(type_of(FacialExpressionsHTC.isActive)));
    assert(((cast(*void)(*instance.sampleTime)) - cast(*void)(*instance)) == 24, "FacialExpressionsHTC.sampleTime has unexpected offset % instead of 24", ((cast(*void)(*instance.sampleTime)) - cast(*void)(*instance)));
    assert(size_of(type_of(FacialExpressionsHTC.sampleTime)) == 8, "FacialExpressionsHTC.sampleTime has unexpected size % instead of 8", size_of(type_of(FacialExpressionsHTC.sampleTime)));
    assert(((cast(*void)(*instance.expressionCount)) - cast(*void)(*instance)) == 32, "FacialExpressionsHTC.expressionCount has unexpected offset % instead of 32", ((cast(*void)(*instance.expressionCount)) - cast(*void)(*instance)));
    assert(size_of(type_of(FacialExpressionsHTC.expressionCount)) == 4, "FacialExpressionsHTC.expressionCount has unexpected size % instead of 4", size_of(type_of(FacialExpressionsHTC.expressionCount)));
    assert(((cast(*void)(*instance.expressionWeightings)) - cast(*void)(*instance)) == 40, "FacialExpressionsHTC.expressionWeightings has unexpected offset % instead of 40", ((cast(*void)(*instance.expressionWeightings)) - cast(*void)(*instance)));
    assert(size_of(type_of(FacialExpressionsHTC.expressionWeightings)) == 8, "FacialExpressionsHTC.expressionWeightings has unexpected size % instead of 8", size_of(type_of(FacialExpressionsHTC.expressionWeightings)));
    assert(size_of(FacialExpressionsHTC) == 48, "FacialExpressionsHTC has size % instead of 48", size_of(FacialExpressionsHTC));
}

FacialTrackerCreateInfoHTC :: struct {
    type:               StructureType;
    next:               *void;
    facialTrackingType: FacialTrackingTypeHTC;
}
#run {
    instance: FacialTrackerCreateInfoHTC;
    assert(((cast(*void)(*instance.type)) - cast(*void)(*instance)) == 0, "FacialTrackerCreateInfoHTC.type has unexpected offset % instead of 0", ((cast(*void)(*instance.type)) - cast(*void)(*instance)));
    assert(size_of(type_of(FacialTrackerCreateInfoHTC.type)) == 4, "FacialTrackerCreateInfoHTC.type has unexpected size % instead of 4", size_of(type_of(FacialTrackerCreateInfoHTC.type)));
    assert(((cast(*void)(*instance.next)) - cast(*void)(*instance)) == 8, "FacialTrackerCreateInfoHTC.next has unexpected offset % instead of 8", ((cast(*void)(*instance.next)) - cast(*void)(*instance)));
    assert(size_of(type_of(FacialTrackerCreateInfoHTC.next)) == 8, "FacialTrackerCreateInfoHTC.next has unexpected size % instead of 8", size_of(type_of(FacialTrackerCreateInfoHTC.next)));
    assert(((cast(*void)(*instance.facialTrackingType)) - cast(*void)(*instance)) == 16, "FacialTrackerCreateInfoHTC.facialTrackingType has unexpected offset % instead of 16", ((cast(*void)(*instance.facialTrackingType)) - cast(*void)(*instance)));
    assert(size_of(type_of(FacialTrackerCreateInfoHTC.facialTrackingType)) == 4, "FacialTrackerCreateInfoHTC.facialTrackingType has unexpected size % instead of 4", size_of(type_of(FacialTrackerCreateInfoHTC.facialTrackingType)));
    assert(size_of(FacialTrackerCreateInfoHTC) == 24, "FacialTrackerCreateInfoHTC has size % instead of 24", size_of(FacialTrackerCreateInfoHTC));
}

PFN_xrCreateFacialTrackerHTC :: #type (a0: Session, a1: *FacialTrackerCreateInfoHTC, a2: *FacialTrackerHTC) -> Result #c_call;
PFN_xrDestroyFacialTrackerHTC :: #type (a0: FacialTrackerHTC) -> Result #c_call;
PFN_xrGetFacialExpressionsHTC :: #type (a0: FacialTrackerHTC, a1: *FacialExpressionsHTC) -> Result #c_call;

ColorSpaceFB :: enum s32 {
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
SystemColorSpacePropertiesFB :: struct {
    type:       StructureType;
    next:       *void;
    colorSpace: ColorSpaceFB;
}
#run {
    instance: SystemColorSpacePropertiesFB;
    assert(((cast(*void)(*instance.type)) - cast(*void)(*instance)) == 0, "SystemColorSpacePropertiesFB.type has unexpected offset % instead of 0", ((cast(*void)(*instance.type)) - cast(*void)(*instance)));
    assert(size_of(type_of(SystemColorSpacePropertiesFB.type)) == 4, "SystemColorSpacePropertiesFB.type has unexpected size % instead of 4", size_of(type_of(SystemColorSpacePropertiesFB.type)));
    assert(((cast(*void)(*instance.next)) - cast(*void)(*instance)) == 8, "SystemColorSpacePropertiesFB.next has unexpected offset % instead of 8", ((cast(*void)(*instance.next)) - cast(*void)(*instance)));
    assert(size_of(type_of(SystemColorSpacePropertiesFB.next)) == 8, "SystemColorSpacePropertiesFB.next has unexpected size % instead of 8", size_of(type_of(SystemColorSpacePropertiesFB.next)));
    assert(((cast(*void)(*instance.colorSpace)) - cast(*void)(*instance)) == 16, "SystemColorSpacePropertiesFB.colorSpace has unexpected offset % instead of 16", ((cast(*void)(*instance.colorSpace)) - cast(*void)(*instance)));
    assert(size_of(type_of(SystemColorSpacePropertiesFB.colorSpace)) == 4, "SystemColorSpacePropertiesFB.colorSpace has unexpected size % instead of 4", size_of(type_of(SystemColorSpacePropertiesFB.colorSpace)));
    assert(size_of(SystemColorSpacePropertiesFB) == 24, "SystemColorSpacePropertiesFB has size % instead of 24", size_of(SystemColorSpacePropertiesFB));
}

PFN_xrEnumerateColorSpacesFB :: #type (a0: Session, a1: u32, a2: *u32, a3: *ColorSpaceFB) -> Result #c_call;
PFN_xrSetColorSpaceFB :: #type (a0: Session, a1: ColorSpaceFB) -> Result #c_call;

Vector4sFB :: struct {
    x: s16;
    y: s16;
    z: s16;
    w: s16;
}
#run {
    instance: Vector4sFB;
    assert(((cast(*void)(*instance.x)) - cast(*void)(*instance)) == 0, "Vector4sFB.x has unexpected offset % instead of 0", ((cast(*void)(*instance.x)) - cast(*void)(*instance)));
    assert(size_of(type_of(Vector4sFB.x)) == 2, "Vector4sFB.x has unexpected size % instead of 2", size_of(type_of(Vector4sFB.x)));
    assert(((cast(*void)(*instance.y)) - cast(*void)(*instance)) == 2, "Vector4sFB.y has unexpected offset % instead of 2", ((cast(*void)(*instance.y)) - cast(*void)(*instance)));
    assert(size_of(type_of(Vector4sFB.y)) == 2, "Vector4sFB.y has unexpected size % instead of 2", size_of(type_of(Vector4sFB.y)));
    assert(((cast(*void)(*instance.z)) - cast(*void)(*instance)) == 4, "Vector4sFB.z has unexpected offset % instead of 4", ((cast(*void)(*instance.z)) - cast(*void)(*instance)));
    assert(size_of(type_of(Vector4sFB.z)) == 2, "Vector4sFB.z has unexpected size % instead of 2", size_of(type_of(Vector4sFB.z)));
    assert(((cast(*void)(*instance.w)) - cast(*void)(*instance)) == 6, "Vector4sFB.w has unexpected offset % instead of 6", ((cast(*void)(*instance.w)) - cast(*void)(*instance)));
    assert(size_of(type_of(Vector4sFB.w)) == 2, "Vector4sFB.w has unexpected size % instead of 2", size_of(type_of(Vector4sFB.w)));
    assert(size_of(Vector4sFB) == 8, "Vector4sFB has size % instead of 8", size_of(Vector4sFB));
}

HandTrackingMeshFB :: struct {
    type:                StructureType;
    next:                *void;
    jointCapacityInput:  u32;
    jointCountOutput:    u32;
    jointBindPoses:      *Posef;
    jointRadii:          *float;
    jointParents:        *HandJointEXT;
    vertexCapacityInput: u32;
    vertexCountOutput:   u32;
    vertexPositions:     *Vector3f;
    vertexNormals:       *Vector3f;
    vertexUVs:           *Vector2f;
    vertexBlendIndices:  *Vector4sFB;
    vertexBlendWeights:  *Vector4f;
    indexCapacityInput:  u32;
    indexCountOutput:    u32;
    indices:             *s16;
}
#run {
    instance: HandTrackingMeshFB;
    assert(((cast(*void)(*instance.type)) - cast(*void)(*instance)) == 0, "HandTrackingMeshFB.type has unexpected offset % instead of 0", ((cast(*void)(*instance.type)) - cast(*void)(*instance)));
    assert(size_of(type_of(HandTrackingMeshFB.type)) == 4, "HandTrackingMeshFB.type has unexpected size % instead of 4", size_of(type_of(HandTrackingMeshFB.type)));
    assert(((cast(*void)(*instance.next)) - cast(*void)(*instance)) == 8, "HandTrackingMeshFB.next has unexpected offset % instead of 8", ((cast(*void)(*instance.next)) - cast(*void)(*instance)));
    assert(size_of(type_of(HandTrackingMeshFB.next)) == 8, "HandTrackingMeshFB.next has unexpected size % instead of 8", size_of(type_of(HandTrackingMeshFB.next)));
    assert(((cast(*void)(*instance.jointCapacityInput)) - cast(*void)(*instance)) == 16, "HandTrackingMeshFB.jointCapacityInput has unexpected offset % instead of 16", ((cast(*void)(*instance.jointCapacityInput)) - cast(*void)(*instance)));
    assert(size_of(type_of(HandTrackingMeshFB.jointCapacityInput)) == 4, "HandTrackingMeshFB.jointCapacityInput has unexpected size % instead of 4", size_of(type_of(HandTrackingMeshFB.jointCapacityInput)));
    assert(((cast(*void)(*instance.jointCountOutput)) - cast(*void)(*instance)) == 20, "HandTrackingMeshFB.jointCountOutput has unexpected offset % instead of 20", ((cast(*void)(*instance.jointCountOutput)) - cast(*void)(*instance)));
    assert(size_of(type_of(HandTrackingMeshFB.jointCountOutput)) == 4, "HandTrackingMeshFB.jointCountOutput has unexpected size % instead of 4", size_of(type_of(HandTrackingMeshFB.jointCountOutput)));
    assert(((cast(*void)(*instance.jointBindPoses)) - cast(*void)(*instance)) == 24, "HandTrackingMeshFB.jointBindPoses has unexpected offset % instead of 24", ((cast(*void)(*instance.jointBindPoses)) - cast(*void)(*instance)));
    assert(size_of(type_of(HandTrackingMeshFB.jointBindPoses)) == 8, "HandTrackingMeshFB.jointBindPoses has unexpected size % instead of 8", size_of(type_of(HandTrackingMeshFB.jointBindPoses)));
    assert(((cast(*void)(*instance.jointRadii)) - cast(*void)(*instance)) == 32, "HandTrackingMeshFB.jointRadii has unexpected offset % instead of 32", ((cast(*void)(*instance.jointRadii)) - cast(*void)(*instance)));
    assert(size_of(type_of(HandTrackingMeshFB.jointRadii)) == 8, "HandTrackingMeshFB.jointRadii has unexpected size % instead of 8", size_of(type_of(HandTrackingMeshFB.jointRadii)));
    assert(((cast(*void)(*instance.jointParents)) - cast(*void)(*instance)) == 40, "HandTrackingMeshFB.jointParents has unexpected offset % instead of 40", ((cast(*void)(*instance.jointParents)) - cast(*void)(*instance)));
    assert(size_of(type_of(HandTrackingMeshFB.jointParents)) == 8, "HandTrackingMeshFB.jointParents has unexpected size % instead of 8", size_of(type_of(HandTrackingMeshFB.jointParents)));
    assert(((cast(*void)(*instance.vertexCapacityInput)) - cast(*void)(*instance)) == 48, "HandTrackingMeshFB.vertexCapacityInput has unexpected offset % instead of 48", ((cast(*void)(*instance.vertexCapacityInput)) - cast(*void)(*instance)));
    assert(size_of(type_of(HandTrackingMeshFB.vertexCapacityInput)) == 4, "HandTrackingMeshFB.vertexCapacityInput has unexpected size % instead of 4", size_of(type_of(HandTrackingMeshFB.vertexCapacityInput)));
    assert(((cast(*void)(*instance.vertexCountOutput)) - cast(*void)(*instance)) == 52, "HandTrackingMeshFB.vertexCountOutput has unexpected offset % instead of 52", ((cast(*void)(*instance.vertexCountOutput)) - cast(*void)(*instance)));
    assert(size_of(type_of(HandTrackingMeshFB.vertexCountOutput)) == 4, "HandTrackingMeshFB.vertexCountOutput has unexpected size % instead of 4", size_of(type_of(HandTrackingMeshFB.vertexCountOutput)));
    assert(((cast(*void)(*instance.vertexPositions)) - cast(*void)(*instance)) == 56, "HandTrackingMeshFB.vertexPositions has unexpected offset % instead of 56", ((cast(*void)(*instance.vertexPositions)) - cast(*void)(*instance)));
    assert(size_of(type_of(HandTrackingMeshFB.vertexPositions)) == 8, "HandTrackingMeshFB.vertexPositions has unexpected size % instead of 8", size_of(type_of(HandTrackingMeshFB.vertexPositions)));
    assert(((cast(*void)(*instance.vertexNormals)) - cast(*void)(*instance)) == 64, "HandTrackingMeshFB.vertexNormals has unexpected offset % instead of 64", ((cast(*void)(*instance.vertexNormals)) - cast(*void)(*instance)));
    assert(size_of(type_of(HandTrackingMeshFB.vertexNormals)) == 8, "HandTrackingMeshFB.vertexNormals has unexpected size % instead of 8", size_of(type_of(HandTrackingMeshFB.vertexNormals)));
    assert(((cast(*void)(*instance.vertexUVs)) - cast(*void)(*instance)) == 72, "HandTrackingMeshFB.vertexUVs has unexpected offset % instead of 72", ((cast(*void)(*instance.vertexUVs)) - cast(*void)(*instance)));
    assert(size_of(type_of(HandTrackingMeshFB.vertexUVs)) == 8, "HandTrackingMeshFB.vertexUVs has unexpected size % instead of 8", size_of(type_of(HandTrackingMeshFB.vertexUVs)));
    assert(((cast(*void)(*instance.vertexBlendIndices)) - cast(*void)(*instance)) == 80, "HandTrackingMeshFB.vertexBlendIndices has unexpected offset % instead of 80", ((cast(*void)(*instance.vertexBlendIndices)) - cast(*void)(*instance)));
    assert(size_of(type_of(HandTrackingMeshFB.vertexBlendIndices)) == 8, "HandTrackingMeshFB.vertexBlendIndices has unexpected size % instead of 8", size_of(type_of(HandTrackingMeshFB.vertexBlendIndices)));
    assert(((cast(*void)(*instance.vertexBlendWeights)) - cast(*void)(*instance)) == 88, "HandTrackingMeshFB.vertexBlendWeights has unexpected offset % instead of 88", ((cast(*void)(*instance.vertexBlendWeights)) - cast(*void)(*instance)));
    assert(size_of(type_of(HandTrackingMeshFB.vertexBlendWeights)) == 8, "HandTrackingMeshFB.vertexBlendWeights has unexpected size % instead of 8", size_of(type_of(HandTrackingMeshFB.vertexBlendWeights)));
    assert(((cast(*void)(*instance.indexCapacityInput)) - cast(*void)(*instance)) == 96, "HandTrackingMeshFB.indexCapacityInput has unexpected offset % instead of 96", ((cast(*void)(*instance.indexCapacityInput)) - cast(*void)(*instance)));
    assert(size_of(type_of(HandTrackingMeshFB.indexCapacityInput)) == 4, "HandTrackingMeshFB.indexCapacityInput has unexpected size % instead of 4", size_of(type_of(HandTrackingMeshFB.indexCapacityInput)));
    assert(((cast(*void)(*instance.indexCountOutput)) - cast(*void)(*instance)) == 100, "HandTrackingMeshFB.indexCountOutput has unexpected offset % instead of 100", ((cast(*void)(*instance.indexCountOutput)) - cast(*void)(*instance)));
    assert(size_of(type_of(HandTrackingMeshFB.indexCountOutput)) == 4, "HandTrackingMeshFB.indexCountOutput has unexpected size % instead of 4", size_of(type_of(HandTrackingMeshFB.indexCountOutput)));
    assert(((cast(*void)(*instance.indices)) - cast(*void)(*instance)) == 104, "HandTrackingMeshFB.indices has unexpected offset % instead of 104", ((cast(*void)(*instance.indices)) - cast(*void)(*instance)));
    assert(size_of(type_of(HandTrackingMeshFB.indices)) == 8, "HandTrackingMeshFB.indices has unexpected size % instead of 8", size_of(type_of(HandTrackingMeshFB.indices)));
    assert(size_of(HandTrackingMeshFB) == 112, "HandTrackingMeshFB has size % instead of 112", size_of(HandTrackingMeshFB));
}

// XrHandTrackingScaleFB extends XrHandJointLocationsEXT
HandTrackingScaleFB :: struct {
    type:               StructureType;
    next:               *void;
    sensorOutput:       float;
    currentOutput:      float;
    overrideHandScale:  Bool32;
    overrideValueInput: float;
}
#run {
    instance: HandTrackingScaleFB;
    assert(((cast(*void)(*instance.type)) - cast(*void)(*instance)) == 0, "HandTrackingScaleFB.type has unexpected offset % instead of 0", ((cast(*void)(*instance.type)) - cast(*void)(*instance)));
    assert(size_of(type_of(HandTrackingScaleFB.type)) == 4, "HandTrackingScaleFB.type has unexpected size % instead of 4", size_of(type_of(HandTrackingScaleFB.type)));
    assert(((cast(*void)(*instance.next)) - cast(*void)(*instance)) == 8, "HandTrackingScaleFB.next has unexpected offset % instead of 8", ((cast(*void)(*instance.next)) - cast(*void)(*instance)));
    assert(size_of(type_of(HandTrackingScaleFB.next)) == 8, "HandTrackingScaleFB.next has unexpected size % instead of 8", size_of(type_of(HandTrackingScaleFB.next)));
    assert(((cast(*void)(*instance.sensorOutput)) - cast(*void)(*instance)) == 16, "HandTrackingScaleFB.sensorOutput has unexpected offset % instead of 16", ((cast(*void)(*instance.sensorOutput)) - cast(*void)(*instance)));
    assert(size_of(type_of(HandTrackingScaleFB.sensorOutput)) == 4, "HandTrackingScaleFB.sensorOutput has unexpected size % instead of 4", size_of(type_of(HandTrackingScaleFB.sensorOutput)));
    assert(((cast(*void)(*instance.currentOutput)) - cast(*void)(*instance)) == 20, "HandTrackingScaleFB.currentOutput has unexpected offset % instead of 20", ((cast(*void)(*instance.currentOutput)) - cast(*void)(*instance)));
    assert(size_of(type_of(HandTrackingScaleFB.currentOutput)) == 4, "HandTrackingScaleFB.currentOutput has unexpected size % instead of 4", size_of(type_of(HandTrackingScaleFB.currentOutput)));
    assert(((cast(*void)(*instance.overrideHandScale)) - cast(*void)(*instance)) == 24, "HandTrackingScaleFB.overrideHandScale has unexpected offset % instead of 24", ((cast(*void)(*instance.overrideHandScale)) - cast(*void)(*instance)));
    assert(size_of(type_of(HandTrackingScaleFB.overrideHandScale)) == 4, "HandTrackingScaleFB.overrideHandScale has unexpected size % instead of 4", size_of(type_of(HandTrackingScaleFB.overrideHandScale)));
    assert(((cast(*void)(*instance.overrideValueInput)) - cast(*void)(*instance)) == 28, "HandTrackingScaleFB.overrideValueInput has unexpected offset % instead of 28", ((cast(*void)(*instance.overrideValueInput)) - cast(*void)(*instance)));
    assert(size_of(type_of(HandTrackingScaleFB.overrideValueInput)) == 4, "HandTrackingScaleFB.overrideValueInput has unexpected size % instead of 4", size_of(type_of(HandTrackingScaleFB.overrideValueInput)));
    assert(size_of(HandTrackingScaleFB) == 32, "HandTrackingScaleFB has size % instead of 32", size_of(HandTrackingScaleFB));
}

PFN_xrGetHandMeshFB :: #type (a0: HandTrackerEXT, a1: *HandTrackingMeshFB) -> Result #c_call;

HandTrackingAimFlagsFB :: Flags64;

// Flag bits for XrHandTrackingAimFlagsFB
XR_HAND_TRACKING_AIM_COMPUTED_BIT_FB: HandTrackingAimFlagsFB : 1;
XR_HAND_TRACKING_AIM_VALID_BIT_FB: HandTrackingAimFlagsFB : 2;
XR_HAND_TRACKING_AIM_INDEX_PINCHING_BIT_FB: HandTrackingAimFlagsFB : 4;
XR_HAND_TRACKING_AIM_MIDDLE_PINCHING_BIT_FB: HandTrackingAimFlagsFB : 8;
XR_HAND_TRACKING_AIM_RING_PINCHING_BIT_FB: HandTrackingAimFlagsFB : 16;
XR_HAND_TRACKING_AIM_LITTLE_PINCHING_BIT_FB: HandTrackingAimFlagsFB : 32;
XR_HAND_TRACKING_AIM_SYSTEM_GESTURE_BIT_FB: HandTrackingAimFlagsFB : 64;
XR_HAND_TRACKING_AIM_DOMINANT_HAND_BIT_FB: HandTrackingAimFlagsFB : 128;
XR_HAND_TRACKING_AIM_MENU_PRESSED_BIT_FB: HandTrackingAimFlagsFB : 256;

// XrHandTrackingAimStateFB extends XrHandJointLocationsEXT
HandTrackingAimStateFB :: struct {
    type:                StructureType;
    next:                *void;
    status:              HandTrackingAimFlagsFB;
    aimPose:             Posef;
    pinchStrengthIndex:  float;
    pinchStrengthMiddle: float;
    pinchStrengthRing:   float;
    pinchStrengthLittle: float;
}
#run {
    instance: HandTrackingAimStateFB;
    assert(((cast(*void)(*instance.type)) - cast(*void)(*instance)) == 0, "HandTrackingAimStateFB.type has unexpected offset % instead of 0", ((cast(*void)(*instance.type)) - cast(*void)(*instance)));
    assert(size_of(type_of(HandTrackingAimStateFB.type)) == 4, "HandTrackingAimStateFB.type has unexpected size % instead of 4", size_of(type_of(HandTrackingAimStateFB.type)));
    assert(((cast(*void)(*instance.next)) - cast(*void)(*instance)) == 8, "HandTrackingAimStateFB.next has unexpected offset % instead of 8", ((cast(*void)(*instance.next)) - cast(*void)(*instance)));
    assert(size_of(type_of(HandTrackingAimStateFB.next)) == 8, "HandTrackingAimStateFB.next has unexpected size % instead of 8", size_of(type_of(HandTrackingAimStateFB.next)));
    assert(((cast(*void)(*instance.status)) - cast(*void)(*instance)) == 16, "HandTrackingAimStateFB.status has unexpected offset % instead of 16", ((cast(*void)(*instance.status)) - cast(*void)(*instance)));
    assert(size_of(type_of(HandTrackingAimStateFB.status)) == 8, "HandTrackingAimStateFB.status has unexpected size % instead of 8", size_of(type_of(HandTrackingAimStateFB.status)));
    assert(((cast(*void)(*instance.aimPose)) - cast(*void)(*instance)) == 24, "HandTrackingAimStateFB.aimPose has unexpected offset % instead of 24", ((cast(*void)(*instance.aimPose)) - cast(*void)(*instance)));
    assert(size_of(type_of(HandTrackingAimStateFB.aimPose)) == 28, "HandTrackingAimStateFB.aimPose has unexpected size % instead of 28", size_of(type_of(HandTrackingAimStateFB.aimPose)));
    assert(((cast(*void)(*instance.pinchStrengthIndex)) - cast(*void)(*instance)) == 52, "HandTrackingAimStateFB.pinchStrengthIndex has unexpected offset % instead of 52", ((cast(*void)(*instance.pinchStrengthIndex)) - cast(*void)(*instance)));
    assert(size_of(type_of(HandTrackingAimStateFB.pinchStrengthIndex)) == 4, "HandTrackingAimStateFB.pinchStrengthIndex has unexpected size % instead of 4", size_of(type_of(HandTrackingAimStateFB.pinchStrengthIndex)));
    assert(((cast(*void)(*instance.pinchStrengthMiddle)) - cast(*void)(*instance)) == 56, "HandTrackingAimStateFB.pinchStrengthMiddle has unexpected offset % instead of 56", ((cast(*void)(*instance.pinchStrengthMiddle)) - cast(*void)(*instance)));
    assert(size_of(type_of(HandTrackingAimStateFB.pinchStrengthMiddle)) == 4, "HandTrackingAimStateFB.pinchStrengthMiddle has unexpected size % instead of 4", size_of(type_of(HandTrackingAimStateFB.pinchStrengthMiddle)));
    assert(((cast(*void)(*instance.pinchStrengthRing)) - cast(*void)(*instance)) == 60, "HandTrackingAimStateFB.pinchStrengthRing has unexpected offset % instead of 60", ((cast(*void)(*instance.pinchStrengthRing)) - cast(*void)(*instance)));
    assert(size_of(type_of(HandTrackingAimStateFB.pinchStrengthRing)) == 4, "HandTrackingAimStateFB.pinchStrengthRing has unexpected size % instead of 4", size_of(type_of(HandTrackingAimStateFB.pinchStrengthRing)));
    assert(((cast(*void)(*instance.pinchStrengthLittle)) - cast(*void)(*instance)) == 64, "HandTrackingAimStateFB.pinchStrengthLittle has unexpected offset % instead of 64", ((cast(*void)(*instance.pinchStrengthLittle)) - cast(*void)(*instance)));
    assert(size_of(type_of(HandTrackingAimStateFB.pinchStrengthLittle)) == 4, "HandTrackingAimStateFB.pinchStrengthLittle has unexpected size % instead of 4", size_of(type_of(HandTrackingAimStateFB.pinchStrengthLittle)));
    assert(size_of(HandTrackingAimStateFB) == 72, "HandTrackingAimStateFB has size % instead of 72", size_of(HandTrackingAimStateFB));
}

HandCapsuleFB :: struct {
    points: [2] Vector3f;
    radius: float;
    joint:  HandJointEXT;
}
#run {
    instance: HandCapsuleFB;
    assert(((cast(*void)(*instance.points)) - cast(*void)(*instance)) == 0, "HandCapsuleFB.points has unexpected offset % instead of 0", ((cast(*void)(*instance.points)) - cast(*void)(*instance)));
    assert(size_of(type_of(HandCapsuleFB.points)) == 24, "HandCapsuleFB.points has unexpected size % instead of 24", size_of(type_of(HandCapsuleFB.points)));
    assert(((cast(*void)(*instance.radius)) - cast(*void)(*instance)) == 24, "HandCapsuleFB.radius has unexpected offset % instead of 24", ((cast(*void)(*instance.radius)) - cast(*void)(*instance)));
    assert(size_of(type_of(HandCapsuleFB.radius)) == 4, "HandCapsuleFB.radius has unexpected size % instead of 4", size_of(type_of(HandCapsuleFB.radius)));
    assert(((cast(*void)(*instance.joint)) - cast(*void)(*instance)) == 28, "HandCapsuleFB.joint has unexpected offset % instead of 28", ((cast(*void)(*instance.joint)) - cast(*void)(*instance)));
    assert(size_of(type_of(HandCapsuleFB.joint)) == 4, "HandCapsuleFB.joint has unexpected size % instead of 4", size_of(type_of(HandCapsuleFB.joint)));
    assert(size_of(HandCapsuleFB) == 32, "HandCapsuleFB has size % instead of 32", size_of(HandCapsuleFB));
}

// XrHandTrackingCapsulesStateFB extends XrHandJointLocationsEXT
HandTrackingCapsulesStateFB :: struct {
    type:     StructureType;
    next:     *void;
    capsules: [19] HandCapsuleFB;
}
#run {
    instance: HandTrackingCapsulesStateFB;
    assert(((cast(*void)(*instance.type)) - cast(*void)(*instance)) == 0, "HandTrackingCapsulesStateFB.type has unexpected offset % instead of 0", ((cast(*void)(*instance.type)) - cast(*void)(*instance)));
    assert(size_of(type_of(HandTrackingCapsulesStateFB.type)) == 4, "HandTrackingCapsulesStateFB.type has unexpected size % instead of 4", size_of(type_of(HandTrackingCapsulesStateFB.type)));
    assert(((cast(*void)(*instance.next)) - cast(*void)(*instance)) == 8, "HandTrackingCapsulesStateFB.next has unexpected offset % instead of 8", ((cast(*void)(*instance.next)) - cast(*void)(*instance)));
    assert(size_of(type_of(HandTrackingCapsulesStateFB.next)) == 8, "HandTrackingCapsulesStateFB.next has unexpected size % instead of 8", size_of(type_of(HandTrackingCapsulesStateFB.next)));
    assert(((cast(*void)(*instance.capsules)) - cast(*void)(*instance)) == 16, "HandTrackingCapsulesStateFB.capsules has unexpected offset % instead of 16", ((cast(*void)(*instance.capsules)) - cast(*void)(*instance)));
    assert(size_of(type_of(HandTrackingCapsulesStateFB.capsules)) == 608, "HandTrackingCapsulesStateFB.capsules has unexpected size % instead of 608", size_of(type_of(HandTrackingCapsulesStateFB.capsules)));
    assert(size_of(HandTrackingCapsulesStateFB) == 624, "HandTrackingCapsulesStateFB has size % instead of 624", size_of(HandTrackingCapsulesStateFB));
}

AsyncRequestIdFB :: u64;

SpaceComponentTypeFB :: enum s32 {
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
SystemSpatialEntityPropertiesFB :: struct {
    type:                  StructureType;
    next:                  *void;
    supportsSpatialEntity: Bool32;
}
#run {
    instance: SystemSpatialEntityPropertiesFB;
    assert(((cast(*void)(*instance.type)) - cast(*void)(*instance)) == 0, "SystemSpatialEntityPropertiesFB.type has unexpected offset % instead of 0", ((cast(*void)(*instance.type)) - cast(*void)(*instance)));
    assert(size_of(type_of(SystemSpatialEntityPropertiesFB.type)) == 4, "SystemSpatialEntityPropertiesFB.type has unexpected size % instead of 4", size_of(type_of(SystemSpatialEntityPropertiesFB.type)));
    assert(((cast(*void)(*instance.next)) - cast(*void)(*instance)) == 8, "SystemSpatialEntityPropertiesFB.next has unexpected offset % instead of 8", ((cast(*void)(*instance.next)) - cast(*void)(*instance)));
    assert(size_of(type_of(SystemSpatialEntityPropertiesFB.next)) == 8, "SystemSpatialEntityPropertiesFB.next has unexpected size % instead of 8", size_of(type_of(SystemSpatialEntityPropertiesFB.next)));
    assert(((cast(*void)(*instance.supportsSpatialEntity)) - cast(*void)(*instance)) == 16, "SystemSpatialEntityPropertiesFB.supportsSpatialEntity has unexpected offset % instead of 16", ((cast(*void)(*instance.supportsSpatialEntity)) - cast(*void)(*instance)));
    assert(size_of(type_of(SystemSpatialEntityPropertiesFB.supportsSpatialEntity)) == 4, "SystemSpatialEntityPropertiesFB.supportsSpatialEntity has unexpected size % instead of 4", size_of(type_of(SystemSpatialEntityPropertiesFB.supportsSpatialEntity)));
    assert(size_of(SystemSpatialEntityPropertiesFB) == 24, "SystemSpatialEntityPropertiesFB has size % instead of 24", size_of(SystemSpatialEntityPropertiesFB));
}

SpatialAnchorCreateInfoFB :: struct {
    type:        StructureType;
    next:        *void;
    space:       Space;
    poseInSpace: Posef;
    time:        Time;
}
#run {
    instance: SpatialAnchorCreateInfoFB;
    assert(((cast(*void)(*instance.type)) - cast(*void)(*instance)) == 0, "SpatialAnchorCreateInfoFB.type has unexpected offset % instead of 0", ((cast(*void)(*instance.type)) - cast(*void)(*instance)));
    assert(size_of(type_of(SpatialAnchorCreateInfoFB.type)) == 4, "SpatialAnchorCreateInfoFB.type has unexpected size % instead of 4", size_of(type_of(SpatialAnchorCreateInfoFB.type)));
    assert(((cast(*void)(*instance.next)) - cast(*void)(*instance)) == 8, "SpatialAnchorCreateInfoFB.next has unexpected offset % instead of 8", ((cast(*void)(*instance.next)) - cast(*void)(*instance)));
    assert(size_of(type_of(SpatialAnchorCreateInfoFB.next)) == 8, "SpatialAnchorCreateInfoFB.next has unexpected size % instead of 8", size_of(type_of(SpatialAnchorCreateInfoFB.next)));
    assert(((cast(*void)(*instance.space)) - cast(*void)(*instance)) == 16, "SpatialAnchorCreateInfoFB.space has unexpected offset % instead of 16", ((cast(*void)(*instance.space)) - cast(*void)(*instance)));
    assert(size_of(type_of(SpatialAnchorCreateInfoFB.space)) == 8, "SpatialAnchorCreateInfoFB.space has unexpected size % instead of 8", size_of(type_of(SpatialAnchorCreateInfoFB.space)));
    assert(((cast(*void)(*instance.poseInSpace)) - cast(*void)(*instance)) == 24, "SpatialAnchorCreateInfoFB.poseInSpace has unexpected offset % instead of 24", ((cast(*void)(*instance.poseInSpace)) - cast(*void)(*instance)));
    assert(size_of(type_of(SpatialAnchorCreateInfoFB.poseInSpace)) == 28, "SpatialAnchorCreateInfoFB.poseInSpace has unexpected size % instead of 28", size_of(type_of(SpatialAnchorCreateInfoFB.poseInSpace)));
    assert(((cast(*void)(*instance.time)) - cast(*void)(*instance)) == 56, "SpatialAnchorCreateInfoFB.time has unexpected offset % instead of 56", ((cast(*void)(*instance.time)) - cast(*void)(*instance)));
    assert(size_of(type_of(SpatialAnchorCreateInfoFB.time)) == 8, "SpatialAnchorCreateInfoFB.time has unexpected size % instead of 8", size_of(type_of(SpatialAnchorCreateInfoFB.time)));
    assert(size_of(SpatialAnchorCreateInfoFB) == 64, "SpatialAnchorCreateInfoFB has size % instead of 64", size_of(SpatialAnchorCreateInfoFB));
}

SpaceComponentStatusSetInfoFB :: struct {
    type:          StructureType;
    next:          *void;
    componentType: SpaceComponentTypeFB;
    enabled:       Bool32;
    timeout:       Duration;
}
#run {
    instance: SpaceComponentStatusSetInfoFB;
    assert(((cast(*void)(*instance.type)) - cast(*void)(*instance)) == 0, "SpaceComponentStatusSetInfoFB.type has unexpected offset % instead of 0", ((cast(*void)(*instance.type)) - cast(*void)(*instance)));
    assert(size_of(type_of(SpaceComponentStatusSetInfoFB.type)) == 4, "SpaceComponentStatusSetInfoFB.type has unexpected size % instead of 4", size_of(type_of(SpaceComponentStatusSetInfoFB.type)));
    assert(((cast(*void)(*instance.next)) - cast(*void)(*instance)) == 8, "SpaceComponentStatusSetInfoFB.next has unexpected offset % instead of 8", ((cast(*void)(*instance.next)) - cast(*void)(*instance)));
    assert(size_of(type_of(SpaceComponentStatusSetInfoFB.next)) == 8, "SpaceComponentStatusSetInfoFB.next has unexpected size % instead of 8", size_of(type_of(SpaceComponentStatusSetInfoFB.next)));
    assert(((cast(*void)(*instance.componentType)) - cast(*void)(*instance)) == 16, "SpaceComponentStatusSetInfoFB.componentType has unexpected offset % instead of 16", ((cast(*void)(*instance.componentType)) - cast(*void)(*instance)));
    assert(size_of(type_of(SpaceComponentStatusSetInfoFB.componentType)) == 4, "SpaceComponentStatusSetInfoFB.componentType has unexpected size % instead of 4", size_of(type_of(SpaceComponentStatusSetInfoFB.componentType)));
    assert(((cast(*void)(*instance.enabled)) - cast(*void)(*instance)) == 20, "SpaceComponentStatusSetInfoFB.enabled has unexpected offset % instead of 20", ((cast(*void)(*instance.enabled)) - cast(*void)(*instance)));
    assert(size_of(type_of(SpaceComponentStatusSetInfoFB.enabled)) == 4, "SpaceComponentStatusSetInfoFB.enabled has unexpected size % instead of 4", size_of(type_of(SpaceComponentStatusSetInfoFB.enabled)));
    assert(((cast(*void)(*instance.timeout)) - cast(*void)(*instance)) == 24, "SpaceComponentStatusSetInfoFB.timeout has unexpected offset % instead of 24", ((cast(*void)(*instance.timeout)) - cast(*void)(*instance)));
    assert(size_of(type_of(SpaceComponentStatusSetInfoFB.timeout)) == 8, "SpaceComponentStatusSetInfoFB.timeout has unexpected size % instead of 8", size_of(type_of(SpaceComponentStatusSetInfoFB.timeout)));
    assert(size_of(SpaceComponentStatusSetInfoFB) == 32, "SpaceComponentStatusSetInfoFB has size % instead of 32", size_of(SpaceComponentStatusSetInfoFB));
}

SpaceComponentStatusFB :: struct {
    type:          StructureType;
    next:          *void;
    enabled:       Bool32;
    changePending: Bool32;
}
#run {
    instance: SpaceComponentStatusFB;
    assert(((cast(*void)(*instance.type)) - cast(*void)(*instance)) == 0, "SpaceComponentStatusFB.type has unexpected offset % instead of 0", ((cast(*void)(*instance.type)) - cast(*void)(*instance)));
    assert(size_of(type_of(SpaceComponentStatusFB.type)) == 4, "SpaceComponentStatusFB.type has unexpected size % instead of 4", size_of(type_of(SpaceComponentStatusFB.type)));
    assert(((cast(*void)(*instance.next)) - cast(*void)(*instance)) == 8, "SpaceComponentStatusFB.next has unexpected offset % instead of 8", ((cast(*void)(*instance.next)) - cast(*void)(*instance)));
    assert(size_of(type_of(SpaceComponentStatusFB.next)) == 8, "SpaceComponentStatusFB.next has unexpected size % instead of 8", size_of(type_of(SpaceComponentStatusFB.next)));
    assert(((cast(*void)(*instance.enabled)) - cast(*void)(*instance)) == 16, "SpaceComponentStatusFB.enabled has unexpected offset % instead of 16", ((cast(*void)(*instance.enabled)) - cast(*void)(*instance)));
    assert(size_of(type_of(SpaceComponentStatusFB.enabled)) == 4, "SpaceComponentStatusFB.enabled has unexpected size % instead of 4", size_of(type_of(SpaceComponentStatusFB.enabled)));
    assert(((cast(*void)(*instance.changePending)) - cast(*void)(*instance)) == 20, "SpaceComponentStatusFB.changePending has unexpected offset % instead of 20", ((cast(*void)(*instance.changePending)) - cast(*void)(*instance)));
    assert(size_of(type_of(SpaceComponentStatusFB.changePending)) == 4, "SpaceComponentStatusFB.changePending has unexpected size % instead of 4", size_of(type_of(SpaceComponentStatusFB.changePending)));
    assert(size_of(SpaceComponentStatusFB) == 24, "SpaceComponentStatusFB has size % instead of 24", size_of(SpaceComponentStatusFB));
}

UuidEXT :: struct {
    data: [16] u8;
}
#run {
    instance: UuidEXT;
    assert(((cast(*void)(*instance.data)) - cast(*void)(*instance)) == 0, "UuidEXT.data has unexpected offset % instead of 0", ((cast(*void)(*instance.data)) - cast(*void)(*instance)));
    assert(size_of(type_of(UuidEXT.data)) == 16, "UuidEXT.data has unexpected size % instead of 16", size_of(type_of(UuidEXT.data)));
    assert(size_of(UuidEXT) == 16, "UuidEXT has size % instead of 16", size_of(UuidEXT));
}

EventDataSpatialAnchorCreateCompleteFB :: struct {
    type:      StructureType;
    next:      *void;
    requestId: AsyncRequestIdFB;
    result:    Result;
    space:     Space;
    uuid:      UuidEXT;
}
#run {
    instance: EventDataSpatialAnchorCreateCompleteFB;
    assert(((cast(*void)(*instance.type)) - cast(*void)(*instance)) == 0, "EventDataSpatialAnchorCreateCompleteFB.type has unexpected offset % instead of 0", ((cast(*void)(*instance.type)) - cast(*void)(*instance)));
    assert(size_of(type_of(EventDataSpatialAnchorCreateCompleteFB.type)) == 4, "EventDataSpatialAnchorCreateCompleteFB.type has unexpected size % instead of 4", size_of(type_of(EventDataSpatialAnchorCreateCompleteFB.type)));
    assert(((cast(*void)(*instance.next)) - cast(*void)(*instance)) == 8, "EventDataSpatialAnchorCreateCompleteFB.next has unexpected offset % instead of 8", ((cast(*void)(*instance.next)) - cast(*void)(*instance)));
    assert(size_of(type_of(EventDataSpatialAnchorCreateCompleteFB.next)) == 8, "EventDataSpatialAnchorCreateCompleteFB.next has unexpected size % instead of 8", size_of(type_of(EventDataSpatialAnchorCreateCompleteFB.next)));
    assert(((cast(*void)(*instance.requestId)) - cast(*void)(*instance)) == 16, "EventDataSpatialAnchorCreateCompleteFB.requestId has unexpected offset % instead of 16", ((cast(*void)(*instance.requestId)) - cast(*void)(*instance)));
    assert(size_of(type_of(EventDataSpatialAnchorCreateCompleteFB.requestId)) == 8, "EventDataSpatialAnchorCreateCompleteFB.requestId has unexpected size % instead of 8", size_of(type_of(EventDataSpatialAnchorCreateCompleteFB.requestId)));
    assert(((cast(*void)(*instance.result)) - cast(*void)(*instance)) == 24, "EventDataSpatialAnchorCreateCompleteFB.result has unexpected offset % instead of 24", ((cast(*void)(*instance.result)) - cast(*void)(*instance)));
    assert(size_of(type_of(EventDataSpatialAnchorCreateCompleteFB.result)) == 4, "EventDataSpatialAnchorCreateCompleteFB.result has unexpected size % instead of 4", size_of(type_of(EventDataSpatialAnchorCreateCompleteFB.result)));
    assert(((cast(*void)(*instance.space)) - cast(*void)(*instance)) == 32, "EventDataSpatialAnchorCreateCompleteFB.space has unexpected offset % instead of 32", ((cast(*void)(*instance.space)) - cast(*void)(*instance)));
    assert(size_of(type_of(EventDataSpatialAnchorCreateCompleteFB.space)) == 8, "EventDataSpatialAnchorCreateCompleteFB.space has unexpected size % instead of 8", size_of(type_of(EventDataSpatialAnchorCreateCompleteFB.space)));
    assert(((cast(*void)(*instance.uuid)) - cast(*void)(*instance)) == 40, "EventDataSpatialAnchorCreateCompleteFB.uuid has unexpected offset % instead of 40", ((cast(*void)(*instance.uuid)) - cast(*void)(*instance)));
    assert(size_of(type_of(EventDataSpatialAnchorCreateCompleteFB.uuid)) == 16, "EventDataSpatialAnchorCreateCompleteFB.uuid has unexpected size % instead of 16", size_of(type_of(EventDataSpatialAnchorCreateCompleteFB.uuid)));
    assert(size_of(EventDataSpatialAnchorCreateCompleteFB) == 56, "EventDataSpatialAnchorCreateCompleteFB has size % instead of 56", size_of(EventDataSpatialAnchorCreateCompleteFB));
}

EventDataSpaceSetStatusCompleteFB :: struct {
    type:          StructureType;
    next:          *void;
    requestId:     AsyncRequestIdFB;
    result:        Result;
    space:         Space;
    uuid:          UuidEXT;
    componentType: SpaceComponentTypeFB;
    enabled:       Bool32;
}
#run {
    instance: EventDataSpaceSetStatusCompleteFB;
    assert(((cast(*void)(*instance.type)) - cast(*void)(*instance)) == 0, "EventDataSpaceSetStatusCompleteFB.type has unexpected offset % instead of 0", ((cast(*void)(*instance.type)) - cast(*void)(*instance)));
    assert(size_of(type_of(EventDataSpaceSetStatusCompleteFB.type)) == 4, "EventDataSpaceSetStatusCompleteFB.type has unexpected size % instead of 4", size_of(type_of(EventDataSpaceSetStatusCompleteFB.type)));
    assert(((cast(*void)(*instance.next)) - cast(*void)(*instance)) == 8, "EventDataSpaceSetStatusCompleteFB.next has unexpected offset % instead of 8", ((cast(*void)(*instance.next)) - cast(*void)(*instance)));
    assert(size_of(type_of(EventDataSpaceSetStatusCompleteFB.next)) == 8, "EventDataSpaceSetStatusCompleteFB.next has unexpected size % instead of 8", size_of(type_of(EventDataSpaceSetStatusCompleteFB.next)));
    assert(((cast(*void)(*instance.requestId)) - cast(*void)(*instance)) == 16, "EventDataSpaceSetStatusCompleteFB.requestId has unexpected offset % instead of 16", ((cast(*void)(*instance.requestId)) - cast(*void)(*instance)));
    assert(size_of(type_of(EventDataSpaceSetStatusCompleteFB.requestId)) == 8, "EventDataSpaceSetStatusCompleteFB.requestId has unexpected size % instead of 8", size_of(type_of(EventDataSpaceSetStatusCompleteFB.requestId)));
    assert(((cast(*void)(*instance.result)) - cast(*void)(*instance)) == 24, "EventDataSpaceSetStatusCompleteFB.result has unexpected offset % instead of 24", ((cast(*void)(*instance.result)) - cast(*void)(*instance)));
    assert(size_of(type_of(EventDataSpaceSetStatusCompleteFB.result)) == 4, "EventDataSpaceSetStatusCompleteFB.result has unexpected size % instead of 4", size_of(type_of(EventDataSpaceSetStatusCompleteFB.result)));
    assert(((cast(*void)(*instance.space)) - cast(*void)(*instance)) == 32, "EventDataSpaceSetStatusCompleteFB.space has unexpected offset % instead of 32", ((cast(*void)(*instance.space)) - cast(*void)(*instance)));
    assert(size_of(type_of(EventDataSpaceSetStatusCompleteFB.space)) == 8, "EventDataSpaceSetStatusCompleteFB.space has unexpected size % instead of 8", size_of(type_of(EventDataSpaceSetStatusCompleteFB.space)));
    assert(((cast(*void)(*instance.uuid)) - cast(*void)(*instance)) == 40, "EventDataSpaceSetStatusCompleteFB.uuid has unexpected offset % instead of 40", ((cast(*void)(*instance.uuid)) - cast(*void)(*instance)));
    assert(size_of(type_of(EventDataSpaceSetStatusCompleteFB.uuid)) == 16, "EventDataSpaceSetStatusCompleteFB.uuid has unexpected size % instead of 16", size_of(type_of(EventDataSpaceSetStatusCompleteFB.uuid)));
    assert(((cast(*void)(*instance.componentType)) - cast(*void)(*instance)) == 56, "EventDataSpaceSetStatusCompleteFB.componentType has unexpected offset % instead of 56", ((cast(*void)(*instance.componentType)) - cast(*void)(*instance)));
    assert(size_of(type_of(EventDataSpaceSetStatusCompleteFB.componentType)) == 4, "EventDataSpaceSetStatusCompleteFB.componentType has unexpected size % instead of 4", size_of(type_of(EventDataSpaceSetStatusCompleteFB.componentType)));
    assert(((cast(*void)(*instance.enabled)) - cast(*void)(*instance)) == 60, "EventDataSpaceSetStatusCompleteFB.enabled has unexpected offset % instead of 60", ((cast(*void)(*instance.enabled)) - cast(*void)(*instance)));
    assert(size_of(type_of(EventDataSpaceSetStatusCompleteFB.enabled)) == 4, "EventDataSpaceSetStatusCompleteFB.enabled has unexpected size % instead of 4", size_of(type_of(EventDataSpaceSetStatusCompleteFB.enabled)));
    assert(size_of(EventDataSpaceSetStatusCompleteFB) == 64, "EventDataSpaceSetStatusCompleteFB has size % instead of 64", size_of(EventDataSpaceSetStatusCompleteFB));
}

PFN_xrCreateSpatialAnchorFB :: #type (a0: Session, a1: *SpatialAnchorCreateInfoFB, a2: *AsyncRequestIdFB) -> Result #c_call;
PFN_xrGetSpaceUuidFB :: #type (a0: Space, a1: *UuidEXT) -> Result #c_call;
PFN_xrEnumerateSpaceSupportedComponentsFB :: #type (a0: Space, a1: u32, a2: *u32, a3: *SpaceComponentTypeFB) -> Result #c_call;
PFN_xrSetSpaceComponentStatusFB :: #type (a0: Space, a1: *SpaceComponentStatusSetInfoFB, a2: *AsyncRequestIdFB) -> Result #c_call;
PFN_xrGetSpaceComponentStatusFB :: #type (a0: Space, a1: SpaceComponentTypeFB, a2: *SpaceComponentStatusFB) -> Result #c_call;

FoveationProfileFB_T :: struct {}
FoveationProfileFB :: *FoveationProfileFB_T;

SwapchainCreateFoveationFlagsFB :: Flags64;

// Flag bits for XrSwapchainCreateFoveationFlagsFB
XR_SWAPCHAIN_CREATE_FOVEATION_SCALED_BIN_BIT_FB: SwapchainCreateFoveationFlagsFB : 1;
XR_SWAPCHAIN_CREATE_FOVEATION_FRAGMENT_DENSITY_MAP_BIT_FB: SwapchainCreateFoveationFlagsFB : 2;

SwapchainStateFoveationFlagsFB :: Flags64;

// Flag bits for XrSwapchainStateFoveationFlagsFB
FoveationProfileCreateInfoFB :: struct {
    type: StructureType;
    next: *void;
}
#run {
    instance: FoveationProfileCreateInfoFB;
    assert(((cast(*void)(*instance.type)) - cast(*void)(*instance)) == 0, "FoveationProfileCreateInfoFB.type has unexpected offset % instead of 0", ((cast(*void)(*instance.type)) - cast(*void)(*instance)));
    assert(size_of(type_of(FoveationProfileCreateInfoFB.type)) == 4, "FoveationProfileCreateInfoFB.type has unexpected size % instead of 4", size_of(type_of(FoveationProfileCreateInfoFB.type)));
    assert(((cast(*void)(*instance.next)) - cast(*void)(*instance)) == 8, "FoveationProfileCreateInfoFB.next has unexpected offset % instead of 8", ((cast(*void)(*instance.next)) - cast(*void)(*instance)));
    assert(size_of(type_of(FoveationProfileCreateInfoFB.next)) == 8, "FoveationProfileCreateInfoFB.next has unexpected size % instead of 8", size_of(type_of(FoveationProfileCreateInfoFB.next)));
    assert(size_of(FoveationProfileCreateInfoFB) == 16, "FoveationProfileCreateInfoFB has size % instead of 16", size_of(FoveationProfileCreateInfoFB));
}

// XrSwapchainCreateInfoFoveationFB extends XrSwapchainCreateInfo
SwapchainCreateInfoFoveationFB :: struct {
    type:  StructureType;
    next:  *void;
    flags: SwapchainCreateFoveationFlagsFB;
}
#run {
    instance: SwapchainCreateInfoFoveationFB;
    assert(((cast(*void)(*instance.type)) - cast(*void)(*instance)) == 0, "SwapchainCreateInfoFoveationFB.type has unexpected offset % instead of 0", ((cast(*void)(*instance.type)) - cast(*void)(*instance)));
    assert(size_of(type_of(SwapchainCreateInfoFoveationFB.type)) == 4, "SwapchainCreateInfoFoveationFB.type has unexpected size % instead of 4", size_of(type_of(SwapchainCreateInfoFoveationFB.type)));
    assert(((cast(*void)(*instance.next)) - cast(*void)(*instance)) == 8, "SwapchainCreateInfoFoveationFB.next has unexpected offset % instead of 8", ((cast(*void)(*instance.next)) - cast(*void)(*instance)));
    assert(size_of(type_of(SwapchainCreateInfoFoveationFB.next)) == 8, "SwapchainCreateInfoFoveationFB.next has unexpected size % instead of 8", size_of(type_of(SwapchainCreateInfoFoveationFB.next)));
    assert(((cast(*void)(*instance.flags)) - cast(*void)(*instance)) == 16, "SwapchainCreateInfoFoveationFB.flags has unexpected offset % instead of 16", ((cast(*void)(*instance.flags)) - cast(*void)(*instance)));
    assert(size_of(type_of(SwapchainCreateInfoFoveationFB.flags)) == 8, "SwapchainCreateInfoFoveationFB.flags has unexpected size % instead of 8", size_of(type_of(SwapchainCreateInfoFoveationFB.flags)));
    assert(size_of(SwapchainCreateInfoFoveationFB) == 24, "SwapchainCreateInfoFoveationFB has size % instead of 24", size_of(SwapchainCreateInfoFoveationFB));
}

SwapchainStateFoveationFB :: struct {
    type:    StructureType;
    next:    *void;
    flags:   SwapchainStateFoveationFlagsFB;
    profile: FoveationProfileFB;
}
#run {
    instance: SwapchainStateFoveationFB;
    assert(((cast(*void)(*instance.type)) - cast(*void)(*instance)) == 0, "SwapchainStateFoveationFB.type has unexpected offset % instead of 0", ((cast(*void)(*instance.type)) - cast(*void)(*instance)));
    assert(size_of(type_of(SwapchainStateFoveationFB.type)) == 4, "SwapchainStateFoveationFB.type has unexpected size % instead of 4", size_of(type_of(SwapchainStateFoveationFB.type)));
    assert(((cast(*void)(*instance.next)) - cast(*void)(*instance)) == 8, "SwapchainStateFoveationFB.next has unexpected offset % instead of 8", ((cast(*void)(*instance.next)) - cast(*void)(*instance)));
    assert(size_of(type_of(SwapchainStateFoveationFB.next)) == 8, "SwapchainStateFoveationFB.next has unexpected size % instead of 8", size_of(type_of(SwapchainStateFoveationFB.next)));
    assert(((cast(*void)(*instance.flags)) - cast(*void)(*instance)) == 16, "SwapchainStateFoveationFB.flags has unexpected offset % instead of 16", ((cast(*void)(*instance.flags)) - cast(*void)(*instance)));
    assert(size_of(type_of(SwapchainStateFoveationFB.flags)) == 8, "SwapchainStateFoveationFB.flags has unexpected size % instead of 8", size_of(type_of(SwapchainStateFoveationFB.flags)));
    assert(((cast(*void)(*instance.profile)) - cast(*void)(*instance)) == 24, "SwapchainStateFoveationFB.profile has unexpected offset % instead of 24", ((cast(*void)(*instance.profile)) - cast(*void)(*instance)));
    assert(size_of(type_of(SwapchainStateFoveationFB.profile)) == 8, "SwapchainStateFoveationFB.profile has unexpected size % instead of 8", size_of(type_of(SwapchainStateFoveationFB.profile)));
    assert(size_of(SwapchainStateFoveationFB) == 32, "SwapchainStateFoveationFB has size % instead of 32", size_of(SwapchainStateFoveationFB));
}

PFN_xrCreateFoveationProfileFB :: #type (a0: Session, a1: *FoveationProfileCreateInfoFB, a2: *FoveationProfileFB) -> Result #c_call;
PFN_xrDestroyFoveationProfileFB :: #type (a0: FoveationProfileFB) -> Result #c_call;

FoveationLevelFB :: enum s32 {
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

FoveationDynamicFB :: enum s32 {
    DISABLED_FB      :: 0;
    LEVEL_ENABLED_FB :: 1;
    MAX_ENUM_FB      :: 2147483647;

    XR_FOVEATION_DYNAMIC_DISABLED_FB      :: DISABLED_FB;
    XR_FOVEATION_DYNAMIC_LEVEL_ENABLED_FB :: LEVEL_ENABLED_FB;
    XR_FOVEATION_DYNAMIC_MAX_ENUM_FB      :: MAX_ENUM_FB;
}

// XrFoveationLevelProfileCreateInfoFB extends XrFoveationProfileCreateInfoFB
FoveationLevelProfileCreateInfoFB :: struct {
    type:           StructureType;
    next:           *void;
    level:          FoveationLevelFB;
    verticalOffset: float;
    dynamic:        FoveationDynamicFB;
}
#run {
    instance: FoveationLevelProfileCreateInfoFB;
    assert(((cast(*void)(*instance.type)) - cast(*void)(*instance)) == 0, "FoveationLevelProfileCreateInfoFB.type has unexpected offset % instead of 0", ((cast(*void)(*instance.type)) - cast(*void)(*instance)));
    assert(size_of(type_of(FoveationLevelProfileCreateInfoFB.type)) == 4, "FoveationLevelProfileCreateInfoFB.type has unexpected size % instead of 4", size_of(type_of(FoveationLevelProfileCreateInfoFB.type)));
    assert(((cast(*void)(*instance.next)) - cast(*void)(*instance)) == 8, "FoveationLevelProfileCreateInfoFB.next has unexpected offset % instead of 8", ((cast(*void)(*instance.next)) - cast(*void)(*instance)));
    assert(size_of(type_of(FoveationLevelProfileCreateInfoFB.next)) == 8, "FoveationLevelProfileCreateInfoFB.next has unexpected size % instead of 8", size_of(type_of(FoveationLevelProfileCreateInfoFB.next)));
    assert(((cast(*void)(*instance.level)) - cast(*void)(*instance)) == 16, "FoveationLevelProfileCreateInfoFB.level has unexpected offset % instead of 16", ((cast(*void)(*instance.level)) - cast(*void)(*instance)));
    assert(size_of(type_of(FoveationLevelProfileCreateInfoFB.level)) == 4, "FoveationLevelProfileCreateInfoFB.level has unexpected size % instead of 4", size_of(type_of(FoveationLevelProfileCreateInfoFB.level)));
    assert(((cast(*void)(*instance.verticalOffset)) - cast(*void)(*instance)) == 20, "FoveationLevelProfileCreateInfoFB.verticalOffset has unexpected offset % instead of 20", ((cast(*void)(*instance.verticalOffset)) - cast(*void)(*instance)));
    assert(size_of(type_of(FoveationLevelProfileCreateInfoFB.verticalOffset)) == 4, "FoveationLevelProfileCreateInfoFB.verticalOffset has unexpected size % instead of 4", size_of(type_of(FoveationLevelProfileCreateInfoFB.verticalOffset)));
    assert(((cast(*void)(*instance.dynamic)) - cast(*void)(*instance)) == 24, "FoveationLevelProfileCreateInfoFB.dynamic has unexpected offset % instead of 24", ((cast(*void)(*instance.dynamic)) - cast(*void)(*instance)));
    assert(size_of(type_of(FoveationLevelProfileCreateInfoFB.dynamic)) == 4, "FoveationLevelProfileCreateInfoFB.dynamic has unexpected size % instead of 4", size_of(type_of(FoveationLevelProfileCreateInfoFB.dynamic)));
    assert(size_of(FoveationLevelProfileCreateInfoFB) == 32, "FoveationLevelProfileCreateInfoFB has size % instead of 32", size_of(FoveationLevelProfileCreateInfoFB));
}

KeyboardTrackingFlagsFB :: Flags64;

// Flag bits for XrKeyboardTrackingFlagsFB
XR_KEYBOARD_TRACKING_EXISTS_BIT_FB: KeyboardTrackingFlagsFB : 1;
XR_KEYBOARD_TRACKING_LOCAL_BIT_FB: KeyboardTrackingFlagsFB : 2;
XR_KEYBOARD_TRACKING_REMOTE_BIT_FB: KeyboardTrackingFlagsFB : 4;
XR_KEYBOARD_TRACKING_CONNECTED_BIT_FB: KeyboardTrackingFlagsFB : 8;

KeyboardTrackingQueryFlagsFB :: Flags64;

// Flag bits for XrKeyboardTrackingQueryFlagsFB
XR_KEYBOARD_TRACKING_QUERY_LOCAL_BIT_FB: KeyboardTrackingQueryFlagsFB : 2;
XR_KEYBOARD_TRACKING_QUERY_REMOTE_BIT_FB: KeyboardTrackingQueryFlagsFB : 4;

// XrSystemKeyboardTrackingPropertiesFB extends XrSystemProperties
SystemKeyboardTrackingPropertiesFB :: struct {
    type:                     StructureType;
    next:                     *void;
    supportsKeyboardTracking: Bool32;
}
#run {
    instance: SystemKeyboardTrackingPropertiesFB;
    assert(((cast(*void)(*instance.type)) - cast(*void)(*instance)) == 0, "SystemKeyboardTrackingPropertiesFB.type has unexpected offset % instead of 0", ((cast(*void)(*instance.type)) - cast(*void)(*instance)));
    assert(size_of(type_of(SystemKeyboardTrackingPropertiesFB.type)) == 4, "SystemKeyboardTrackingPropertiesFB.type has unexpected size % instead of 4", size_of(type_of(SystemKeyboardTrackingPropertiesFB.type)));
    assert(((cast(*void)(*instance.next)) - cast(*void)(*instance)) == 8, "SystemKeyboardTrackingPropertiesFB.next has unexpected offset % instead of 8", ((cast(*void)(*instance.next)) - cast(*void)(*instance)));
    assert(size_of(type_of(SystemKeyboardTrackingPropertiesFB.next)) == 8, "SystemKeyboardTrackingPropertiesFB.next has unexpected size % instead of 8", size_of(type_of(SystemKeyboardTrackingPropertiesFB.next)));
    assert(((cast(*void)(*instance.supportsKeyboardTracking)) - cast(*void)(*instance)) == 16, "SystemKeyboardTrackingPropertiesFB.supportsKeyboardTracking has unexpected offset % instead of 16", ((cast(*void)(*instance.supportsKeyboardTracking)) - cast(*void)(*instance)));
    assert(size_of(type_of(SystemKeyboardTrackingPropertiesFB.supportsKeyboardTracking)) == 4, "SystemKeyboardTrackingPropertiesFB.supportsKeyboardTracking has unexpected size % instead of 4", size_of(type_of(SystemKeyboardTrackingPropertiesFB.supportsKeyboardTracking)));
    assert(size_of(SystemKeyboardTrackingPropertiesFB) == 24, "SystemKeyboardTrackingPropertiesFB has size % instead of 24", size_of(SystemKeyboardTrackingPropertiesFB));
}

KeyboardTrackingDescriptionFB :: struct {
    trackedKeyboardId: u64;
    size:              Vector3f;
    flags:             KeyboardTrackingFlagsFB;
    name:              [128] u8;
}
#run {
    instance: KeyboardTrackingDescriptionFB;
    assert(((cast(*void)(*instance.trackedKeyboardId)) - cast(*void)(*instance)) == 0, "KeyboardTrackingDescriptionFB.trackedKeyboardId has unexpected offset % instead of 0", ((cast(*void)(*instance.trackedKeyboardId)) - cast(*void)(*instance)));
    assert(size_of(type_of(KeyboardTrackingDescriptionFB.trackedKeyboardId)) == 8, "KeyboardTrackingDescriptionFB.trackedKeyboardId has unexpected size % instead of 8", size_of(type_of(KeyboardTrackingDescriptionFB.trackedKeyboardId)));
    assert(((cast(*void)(*instance.size)) - cast(*void)(*instance)) == 8, "KeyboardTrackingDescriptionFB.size has unexpected offset % instead of 8", ((cast(*void)(*instance.size)) - cast(*void)(*instance)));
    assert(size_of(type_of(KeyboardTrackingDescriptionFB.size)) == 12, "KeyboardTrackingDescriptionFB.size has unexpected size % instead of 12", size_of(type_of(KeyboardTrackingDescriptionFB.size)));
    assert(((cast(*void)(*instance.flags)) - cast(*void)(*instance)) == 24, "KeyboardTrackingDescriptionFB.flags has unexpected offset % instead of 24", ((cast(*void)(*instance.flags)) - cast(*void)(*instance)));
    assert(size_of(type_of(KeyboardTrackingDescriptionFB.flags)) == 8, "KeyboardTrackingDescriptionFB.flags has unexpected size % instead of 8", size_of(type_of(KeyboardTrackingDescriptionFB.flags)));
    assert(((cast(*void)(*instance.name)) - cast(*void)(*instance)) == 32, "KeyboardTrackingDescriptionFB.name has unexpected offset % instead of 32", ((cast(*void)(*instance.name)) - cast(*void)(*instance)));
    assert(size_of(type_of(KeyboardTrackingDescriptionFB.name)) == 128, "KeyboardTrackingDescriptionFB.name has unexpected size % instead of 128", size_of(type_of(KeyboardTrackingDescriptionFB.name)));
    assert(size_of(KeyboardTrackingDescriptionFB) == 160, "KeyboardTrackingDescriptionFB has size % instead of 160", size_of(KeyboardTrackingDescriptionFB));
}

KeyboardSpaceCreateInfoFB :: struct {
    type:              StructureType;
    next:              *void;
    trackedKeyboardId: u64;
}
#run {
    instance: KeyboardSpaceCreateInfoFB;
    assert(((cast(*void)(*instance.type)) - cast(*void)(*instance)) == 0, "KeyboardSpaceCreateInfoFB.type has unexpected offset % instead of 0", ((cast(*void)(*instance.type)) - cast(*void)(*instance)));
    assert(size_of(type_of(KeyboardSpaceCreateInfoFB.type)) == 4, "KeyboardSpaceCreateInfoFB.type has unexpected size % instead of 4", size_of(type_of(KeyboardSpaceCreateInfoFB.type)));
    assert(((cast(*void)(*instance.next)) - cast(*void)(*instance)) == 8, "KeyboardSpaceCreateInfoFB.next has unexpected offset % instead of 8", ((cast(*void)(*instance.next)) - cast(*void)(*instance)));
    assert(size_of(type_of(KeyboardSpaceCreateInfoFB.next)) == 8, "KeyboardSpaceCreateInfoFB.next has unexpected size % instead of 8", size_of(type_of(KeyboardSpaceCreateInfoFB.next)));
    assert(((cast(*void)(*instance.trackedKeyboardId)) - cast(*void)(*instance)) == 16, "KeyboardSpaceCreateInfoFB.trackedKeyboardId has unexpected offset % instead of 16", ((cast(*void)(*instance.trackedKeyboardId)) - cast(*void)(*instance)));
    assert(size_of(type_of(KeyboardSpaceCreateInfoFB.trackedKeyboardId)) == 8, "KeyboardSpaceCreateInfoFB.trackedKeyboardId has unexpected size % instead of 8", size_of(type_of(KeyboardSpaceCreateInfoFB.trackedKeyboardId)));
    assert(size_of(KeyboardSpaceCreateInfoFB) == 24, "KeyboardSpaceCreateInfoFB has size % instead of 24", size_of(KeyboardSpaceCreateInfoFB));
}

KeyboardTrackingQueryFB :: struct {
    type:  StructureType;
    next:  *void;
    flags: KeyboardTrackingQueryFlagsFB;
}
#run {
    instance: KeyboardTrackingQueryFB;
    assert(((cast(*void)(*instance.type)) - cast(*void)(*instance)) == 0, "KeyboardTrackingQueryFB.type has unexpected offset % instead of 0", ((cast(*void)(*instance.type)) - cast(*void)(*instance)));
    assert(size_of(type_of(KeyboardTrackingQueryFB.type)) == 4, "KeyboardTrackingQueryFB.type has unexpected size % instead of 4", size_of(type_of(KeyboardTrackingQueryFB.type)));
    assert(((cast(*void)(*instance.next)) - cast(*void)(*instance)) == 8, "KeyboardTrackingQueryFB.next has unexpected offset % instead of 8", ((cast(*void)(*instance.next)) - cast(*void)(*instance)));
    assert(size_of(type_of(KeyboardTrackingQueryFB.next)) == 8, "KeyboardTrackingQueryFB.next has unexpected size % instead of 8", size_of(type_of(KeyboardTrackingQueryFB.next)));
    assert(((cast(*void)(*instance.flags)) - cast(*void)(*instance)) == 16, "KeyboardTrackingQueryFB.flags has unexpected offset % instead of 16", ((cast(*void)(*instance.flags)) - cast(*void)(*instance)));
    assert(size_of(type_of(KeyboardTrackingQueryFB.flags)) == 8, "KeyboardTrackingQueryFB.flags has unexpected size % instead of 8", size_of(type_of(KeyboardTrackingQueryFB.flags)));
    assert(size_of(KeyboardTrackingQueryFB) == 24, "KeyboardTrackingQueryFB has size % instead of 24", size_of(KeyboardTrackingQueryFB));
}

PFN_xrQuerySystemTrackedKeyboardFB :: #type (a0: Session, a1: *KeyboardTrackingQueryFB, a2: *KeyboardTrackingDescriptionFB) -> Result #c_call;
PFN_xrCreateKeyboardSpaceFB :: #type (a0: Session, a1: *KeyboardSpaceCreateInfoFB, a2: *Space) -> Result #c_call;

TriangleMeshFB_T :: struct {}
TriangleMeshFB :: *TriangleMeshFB_T;

WindingOrderFB :: enum s32 {
    UNKNOWN_FB  :: 0;
    CW_FB       :: 1;
    CCW_FB      :: 2;
    MAX_ENUM_FB :: 2147483647;

    XR_WINDING_ORDER_UNKNOWN_FB  :: UNKNOWN_FB;
    XR_WINDING_ORDER_CW_FB       :: CW_FB;
    XR_WINDING_ORDER_CCW_FB      :: CCW_FB;
    XR_WINDING_ORDER_MAX_ENUM_FB :: MAX_ENUM_FB;
}

TriangleMeshFlagsFB :: Flags64;

// Flag bits for XrTriangleMeshFlagsFB
XR_TRIANGLE_MESH_MUTABLE_BIT_FB: TriangleMeshFlagsFB : 1;

TriangleMeshCreateInfoFB :: struct {
    type:          StructureType;
    next:          *void;
    flags:         TriangleMeshFlagsFB;
    windingOrder:  WindingOrderFB;
    vertexCount:   u32;
    vertexBuffer:  *Vector3f;
    triangleCount: u32;
    indexBuffer:   *u32;
}
#run {
    instance: TriangleMeshCreateInfoFB;
    assert(((cast(*void)(*instance.type)) - cast(*void)(*instance)) == 0, "TriangleMeshCreateInfoFB.type has unexpected offset % instead of 0", ((cast(*void)(*instance.type)) - cast(*void)(*instance)));
    assert(size_of(type_of(TriangleMeshCreateInfoFB.type)) == 4, "TriangleMeshCreateInfoFB.type has unexpected size % instead of 4", size_of(type_of(TriangleMeshCreateInfoFB.type)));
    assert(((cast(*void)(*instance.next)) - cast(*void)(*instance)) == 8, "TriangleMeshCreateInfoFB.next has unexpected offset % instead of 8", ((cast(*void)(*instance.next)) - cast(*void)(*instance)));
    assert(size_of(type_of(TriangleMeshCreateInfoFB.next)) == 8, "TriangleMeshCreateInfoFB.next has unexpected size % instead of 8", size_of(type_of(TriangleMeshCreateInfoFB.next)));
    assert(((cast(*void)(*instance.flags)) - cast(*void)(*instance)) == 16, "TriangleMeshCreateInfoFB.flags has unexpected offset % instead of 16", ((cast(*void)(*instance.flags)) - cast(*void)(*instance)));
    assert(size_of(type_of(TriangleMeshCreateInfoFB.flags)) == 8, "TriangleMeshCreateInfoFB.flags has unexpected size % instead of 8", size_of(type_of(TriangleMeshCreateInfoFB.flags)));
    assert(((cast(*void)(*instance.windingOrder)) - cast(*void)(*instance)) == 24, "TriangleMeshCreateInfoFB.windingOrder has unexpected offset % instead of 24", ((cast(*void)(*instance.windingOrder)) - cast(*void)(*instance)));
    assert(size_of(type_of(TriangleMeshCreateInfoFB.windingOrder)) == 4, "TriangleMeshCreateInfoFB.windingOrder has unexpected size % instead of 4", size_of(type_of(TriangleMeshCreateInfoFB.windingOrder)));
    assert(((cast(*void)(*instance.vertexCount)) - cast(*void)(*instance)) == 28, "TriangleMeshCreateInfoFB.vertexCount has unexpected offset % instead of 28", ((cast(*void)(*instance.vertexCount)) - cast(*void)(*instance)));
    assert(size_of(type_of(TriangleMeshCreateInfoFB.vertexCount)) == 4, "TriangleMeshCreateInfoFB.vertexCount has unexpected size % instead of 4", size_of(type_of(TriangleMeshCreateInfoFB.vertexCount)));
    assert(((cast(*void)(*instance.vertexBuffer)) - cast(*void)(*instance)) == 32, "TriangleMeshCreateInfoFB.vertexBuffer has unexpected offset % instead of 32", ((cast(*void)(*instance.vertexBuffer)) - cast(*void)(*instance)));
    assert(size_of(type_of(TriangleMeshCreateInfoFB.vertexBuffer)) == 8, "TriangleMeshCreateInfoFB.vertexBuffer has unexpected size % instead of 8", size_of(type_of(TriangleMeshCreateInfoFB.vertexBuffer)));
    assert(((cast(*void)(*instance.triangleCount)) - cast(*void)(*instance)) == 40, "TriangleMeshCreateInfoFB.triangleCount has unexpected offset % instead of 40", ((cast(*void)(*instance.triangleCount)) - cast(*void)(*instance)));
    assert(size_of(type_of(TriangleMeshCreateInfoFB.triangleCount)) == 4, "TriangleMeshCreateInfoFB.triangleCount has unexpected size % instead of 4", size_of(type_of(TriangleMeshCreateInfoFB.triangleCount)));
    assert(((cast(*void)(*instance.indexBuffer)) - cast(*void)(*instance)) == 48, "TriangleMeshCreateInfoFB.indexBuffer has unexpected offset % instead of 48", ((cast(*void)(*instance.indexBuffer)) - cast(*void)(*instance)));
    assert(size_of(type_of(TriangleMeshCreateInfoFB.indexBuffer)) == 8, "TriangleMeshCreateInfoFB.indexBuffer has unexpected size % instead of 8", size_of(type_of(TriangleMeshCreateInfoFB.indexBuffer)));
    assert(size_of(TriangleMeshCreateInfoFB) == 56, "TriangleMeshCreateInfoFB has size % instead of 56", size_of(TriangleMeshCreateInfoFB));
}

PFN_xrCreateTriangleMeshFB :: #type (a0: Session, a1: *TriangleMeshCreateInfoFB, a2: *TriangleMeshFB) -> Result #c_call;
PFN_xrDestroyTriangleMeshFB :: #type (a0: TriangleMeshFB) -> Result #c_call;
PFN_xrTriangleMeshGetVertexBufferFB :: #type (a0: TriangleMeshFB, a1: **Vector3f) -> Result #c_call;
PFN_xrTriangleMeshGetIndexBufferFB :: #type (a0: TriangleMeshFB, a1: **u32) -> Result #c_call;
PFN_xrTriangleMeshBeginUpdateFB :: #type (a0: TriangleMeshFB) -> Result #c_call;
PFN_xrTriangleMeshEndUpdateFB :: #type (a0: TriangleMeshFB, a1: u32, a2: u32) -> Result #c_call;
PFN_xrTriangleMeshBeginVertexBufferUpdateFB :: #type (a0: TriangleMeshFB, a1: *u32) -> Result #c_call;
PFN_xrTriangleMeshEndVertexBufferUpdateFB :: #type (a0: TriangleMeshFB) -> Result #c_call;

PassthroughFB_T :: struct {}
PassthroughFB :: *PassthroughFB_T;
PassthroughLayerFB_T :: struct {}
PassthroughLayerFB :: *PassthroughLayerFB_T;
GeometryInstanceFB_T :: struct {}
GeometryInstanceFB :: *GeometryInstanceFB_T;

PassthroughLayerPurposeFB :: enum s32 {
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

PassthroughFlagsFB :: Flags64;

// Flag bits for XrPassthroughFlagsFB
XR_PASSTHROUGH_IS_RUNNING_AT_CREATION_BIT_FB: PassthroughFlagsFB : 1;

PassthroughStateChangedFlagsFB :: Flags64;

// Flag bits for XrPassthroughStateChangedFlagsFB
XR_PASSTHROUGH_STATE_CHANGED_REINIT_REQUIRED_BIT_FB: PassthroughStateChangedFlagsFB : 1;
XR_PASSTHROUGH_STATE_CHANGED_NON_RECOVERABLE_ERROR_BIT_FB: PassthroughStateChangedFlagsFB : 2;
XR_PASSTHROUGH_STATE_CHANGED_RECOVERABLE_ERROR_BIT_FB: PassthroughStateChangedFlagsFB : 4;
XR_PASSTHROUGH_STATE_CHANGED_RESTORED_ERROR_BIT_FB: PassthroughStateChangedFlagsFB : 8;

// XrSystemPassthroughPropertiesFB extends XrSystemProperties
SystemPassthroughPropertiesFB :: struct {
    type:                StructureType;
    next:                *void;
    supportsPassthrough: Bool32;
}
#run {
    instance: SystemPassthroughPropertiesFB;
    assert(((cast(*void)(*instance.type)) - cast(*void)(*instance)) == 0, "SystemPassthroughPropertiesFB.type has unexpected offset % instead of 0", ((cast(*void)(*instance.type)) - cast(*void)(*instance)));
    assert(size_of(type_of(SystemPassthroughPropertiesFB.type)) == 4, "SystemPassthroughPropertiesFB.type has unexpected size % instead of 4", size_of(type_of(SystemPassthroughPropertiesFB.type)));
    assert(((cast(*void)(*instance.next)) - cast(*void)(*instance)) == 8, "SystemPassthroughPropertiesFB.next has unexpected offset % instead of 8", ((cast(*void)(*instance.next)) - cast(*void)(*instance)));
    assert(size_of(type_of(SystemPassthroughPropertiesFB.next)) == 8, "SystemPassthroughPropertiesFB.next has unexpected size % instead of 8", size_of(type_of(SystemPassthroughPropertiesFB.next)));
    assert(((cast(*void)(*instance.supportsPassthrough)) - cast(*void)(*instance)) == 16, "SystemPassthroughPropertiesFB.supportsPassthrough has unexpected offset % instead of 16", ((cast(*void)(*instance.supportsPassthrough)) - cast(*void)(*instance)));
    assert(size_of(type_of(SystemPassthroughPropertiesFB.supportsPassthrough)) == 4, "SystemPassthroughPropertiesFB.supportsPassthrough has unexpected size % instead of 4", size_of(type_of(SystemPassthroughPropertiesFB.supportsPassthrough)));
    assert(size_of(SystemPassthroughPropertiesFB) == 24, "SystemPassthroughPropertiesFB has size % instead of 24", size_of(SystemPassthroughPropertiesFB));
}

PassthroughCreateInfoFB :: struct {
    type:  StructureType;
    next:  *void;
    flags: PassthroughFlagsFB;
}
#run {
    instance: PassthroughCreateInfoFB;
    assert(((cast(*void)(*instance.type)) - cast(*void)(*instance)) == 0, "PassthroughCreateInfoFB.type has unexpected offset % instead of 0", ((cast(*void)(*instance.type)) - cast(*void)(*instance)));
    assert(size_of(type_of(PassthroughCreateInfoFB.type)) == 4, "PassthroughCreateInfoFB.type has unexpected size % instead of 4", size_of(type_of(PassthroughCreateInfoFB.type)));
    assert(((cast(*void)(*instance.next)) - cast(*void)(*instance)) == 8, "PassthroughCreateInfoFB.next has unexpected offset % instead of 8", ((cast(*void)(*instance.next)) - cast(*void)(*instance)));
    assert(size_of(type_of(PassthroughCreateInfoFB.next)) == 8, "PassthroughCreateInfoFB.next has unexpected size % instead of 8", size_of(type_of(PassthroughCreateInfoFB.next)));
    assert(((cast(*void)(*instance.flags)) - cast(*void)(*instance)) == 16, "PassthroughCreateInfoFB.flags has unexpected offset % instead of 16", ((cast(*void)(*instance.flags)) - cast(*void)(*instance)));
    assert(size_of(type_of(PassthroughCreateInfoFB.flags)) == 8, "PassthroughCreateInfoFB.flags has unexpected size % instead of 8", size_of(type_of(PassthroughCreateInfoFB.flags)));
    assert(size_of(PassthroughCreateInfoFB) == 24, "PassthroughCreateInfoFB has size % instead of 24", size_of(PassthroughCreateInfoFB));
}

PassthroughLayerCreateInfoFB :: struct {
    type:        StructureType;
    next:        *void;
    passthrough: PassthroughFB;
    flags:       PassthroughFlagsFB;
    purpose:     PassthroughLayerPurposeFB;
}
#run {
    instance: PassthroughLayerCreateInfoFB;
    assert(((cast(*void)(*instance.type)) - cast(*void)(*instance)) == 0, "PassthroughLayerCreateInfoFB.type has unexpected offset % instead of 0", ((cast(*void)(*instance.type)) - cast(*void)(*instance)));
    assert(size_of(type_of(PassthroughLayerCreateInfoFB.type)) == 4, "PassthroughLayerCreateInfoFB.type has unexpected size % instead of 4", size_of(type_of(PassthroughLayerCreateInfoFB.type)));
    assert(((cast(*void)(*instance.next)) - cast(*void)(*instance)) == 8, "PassthroughLayerCreateInfoFB.next has unexpected offset % instead of 8", ((cast(*void)(*instance.next)) - cast(*void)(*instance)));
    assert(size_of(type_of(PassthroughLayerCreateInfoFB.next)) == 8, "PassthroughLayerCreateInfoFB.next has unexpected size % instead of 8", size_of(type_of(PassthroughLayerCreateInfoFB.next)));
    assert(((cast(*void)(*instance.passthrough)) - cast(*void)(*instance)) == 16, "PassthroughLayerCreateInfoFB.passthrough has unexpected offset % instead of 16", ((cast(*void)(*instance.passthrough)) - cast(*void)(*instance)));
    assert(size_of(type_of(PassthroughLayerCreateInfoFB.passthrough)) == 8, "PassthroughLayerCreateInfoFB.passthrough has unexpected size % instead of 8", size_of(type_of(PassthroughLayerCreateInfoFB.passthrough)));
    assert(((cast(*void)(*instance.flags)) - cast(*void)(*instance)) == 24, "PassthroughLayerCreateInfoFB.flags has unexpected offset % instead of 24", ((cast(*void)(*instance.flags)) - cast(*void)(*instance)));
    assert(size_of(type_of(PassthroughLayerCreateInfoFB.flags)) == 8, "PassthroughLayerCreateInfoFB.flags has unexpected size % instead of 8", size_of(type_of(PassthroughLayerCreateInfoFB.flags)));
    assert(((cast(*void)(*instance.purpose)) - cast(*void)(*instance)) == 32, "PassthroughLayerCreateInfoFB.purpose has unexpected offset % instead of 32", ((cast(*void)(*instance.purpose)) - cast(*void)(*instance)));
    assert(size_of(type_of(PassthroughLayerCreateInfoFB.purpose)) == 4, "PassthroughLayerCreateInfoFB.purpose has unexpected size % instead of 4", size_of(type_of(PassthroughLayerCreateInfoFB.purpose)));
    assert(size_of(PassthroughLayerCreateInfoFB) == 40, "PassthroughLayerCreateInfoFB has size % instead of 40", size_of(PassthroughLayerCreateInfoFB));
}

// XrCompositionLayerPassthroughFB extends XrCompositionLayerBaseHeader
CompositionLayerPassthroughFB :: struct {
    type:        StructureType;
    next:        *void;
    flags:       CompositionLayerFlags;
    space:       Space;
    layerHandle: PassthroughLayerFB;
}
#run {
    instance: CompositionLayerPassthroughFB;
    assert(((cast(*void)(*instance.type)) - cast(*void)(*instance)) == 0, "CompositionLayerPassthroughFB.type has unexpected offset % instead of 0", ((cast(*void)(*instance.type)) - cast(*void)(*instance)));
    assert(size_of(type_of(CompositionLayerPassthroughFB.type)) == 4, "CompositionLayerPassthroughFB.type has unexpected size % instead of 4", size_of(type_of(CompositionLayerPassthroughFB.type)));
    assert(((cast(*void)(*instance.next)) - cast(*void)(*instance)) == 8, "CompositionLayerPassthroughFB.next has unexpected offset % instead of 8", ((cast(*void)(*instance.next)) - cast(*void)(*instance)));
    assert(size_of(type_of(CompositionLayerPassthroughFB.next)) == 8, "CompositionLayerPassthroughFB.next has unexpected size % instead of 8", size_of(type_of(CompositionLayerPassthroughFB.next)));
    assert(((cast(*void)(*instance.flags)) - cast(*void)(*instance)) == 16, "CompositionLayerPassthroughFB.flags has unexpected offset % instead of 16", ((cast(*void)(*instance.flags)) - cast(*void)(*instance)));
    assert(size_of(type_of(CompositionLayerPassthroughFB.flags)) == 8, "CompositionLayerPassthroughFB.flags has unexpected size % instead of 8", size_of(type_of(CompositionLayerPassthroughFB.flags)));
    assert(((cast(*void)(*instance.space)) - cast(*void)(*instance)) == 24, "CompositionLayerPassthroughFB.space has unexpected offset % instead of 24", ((cast(*void)(*instance.space)) - cast(*void)(*instance)));
    assert(size_of(type_of(CompositionLayerPassthroughFB.space)) == 8, "CompositionLayerPassthroughFB.space has unexpected size % instead of 8", size_of(type_of(CompositionLayerPassthroughFB.space)));
    assert(((cast(*void)(*instance.layerHandle)) - cast(*void)(*instance)) == 32, "CompositionLayerPassthroughFB.layerHandle has unexpected offset % instead of 32", ((cast(*void)(*instance.layerHandle)) - cast(*void)(*instance)));
    assert(size_of(type_of(CompositionLayerPassthroughFB.layerHandle)) == 8, "CompositionLayerPassthroughFB.layerHandle has unexpected size % instead of 8", size_of(type_of(CompositionLayerPassthroughFB.layerHandle)));
    assert(size_of(CompositionLayerPassthroughFB) == 40, "CompositionLayerPassthroughFB has size % instead of 40", size_of(CompositionLayerPassthroughFB));
}

GeometryInstanceCreateInfoFB :: struct {
    type:      StructureType;
    next:      *void;
    layer:     PassthroughLayerFB;
    mesh:      TriangleMeshFB;
    baseSpace: Space;
    pose:      Posef;
    scale:     Vector3f;
}
#run {
    instance: GeometryInstanceCreateInfoFB;
    assert(((cast(*void)(*instance.type)) - cast(*void)(*instance)) == 0, "GeometryInstanceCreateInfoFB.type has unexpected offset % instead of 0", ((cast(*void)(*instance.type)) - cast(*void)(*instance)));
    assert(size_of(type_of(GeometryInstanceCreateInfoFB.type)) == 4, "GeometryInstanceCreateInfoFB.type has unexpected size % instead of 4", size_of(type_of(GeometryInstanceCreateInfoFB.type)));
    assert(((cast(*void)(*instance.next)) - cast(*void)(*instance)) == 8, "GeometryInstanceCreateInfoFB.next has unexpected offset % instead of 8", ((cast(*void)(*instance.next)) - cast(*void)(*instance)));
    assert(size_of(type_of(GeometryInstanceCreateInfoFB.next)) == 8, "GeometryInstanceCreateInfoFB.next has unexpected size % instead of 8", size_of(type_of(GeometryInstanceCreateInfoFB.next)));
    assert(((cast(*void)(*instance.layer)) - cast(*void)(*instance)) == 16, "GeometryInstanceCreateInfoFB.layer has unexpected offset % instead of 16", ((cast(*void)(*instance.layer)) - cast(*void)(*instance)));
    assert(size_of(type_of(GeometryInstanceCreateInfoFB.layer)) == 8, "GeometryInstanceCreateInfoFB.layer has unexpected size % instead of 8", size_of(type_of(GeometryInstanceCreateInfoFB.layer)));
    assert(((cast(*void)(*instance.mesh)) - cast(*void)(*instance)) == 24, "GeometryInstanceCreateInfoFB.mesh has unexpected offset % instead of 24", ((cast(*void)(*instance.mesh)) - cast(*void)(*instance)));
    assert(size_of(type_of(GeometryInstanceCreateInfoFB.mesh)) == 8, "GeometryInstanceCreateInfoFB.mesh has unexpected size % instead of 8", size_of(type_of(GeometryInstanceCreateInfoFB.mesh)));
    assert(((cast(*void)(*instance.baseSpace)) - cast(*void)(*instance)) == 32, "GeometryInstanceCreateInfoFB.baseSpace has unexpected offset % instead of 32", ((cast(*void)(*instance.baseSpace)) - cast(*void)(*instance)));
    assert(size_of(type_of(GeometryInstanceCreateInfoFB.baseSpace)) == 8, "GeometryInstanceCreateInfoFB.baseSpace has unexpected size % instead of 8", size_of(type_of(GeometryInstanceCreateInfoFB.baseSpace)));
    assert(((cast(*void)(*instance.pose)) - cast(*void)(*instance)) == 40, "GeometryInstanceCreateInfoFB.pose has unexpected offset % instead of 40", ((cast(*void)(*instance.pose)) - cast(*void)(*instance)));
    assert(size_of(type_of(GeometryInstanceCreateInfoFB.pose)) == 28, "GeometryInstanceCreateInfoFB.pose has unexpected size % instead of 28", size_of(type_of(GeometryInstanceCreateInfoFB.pose)));
    assert(((cast(*void)(*instance.scale)) - cast(*void)(*instance)) == 68, "GeometryInstanceCreateInfoFB.scale has unexpected offset % instead of 68", ((cast(*void)(*instance.scale)) - cast(*void)(*instance)));
    assert(size_of(type_of(GeometryInstanceCreateInfoFB.scale)) == 12, "GeometryInstanceCreateInfoFB.scale has unexpected size % instead of 12", size_of(type_of(GeometryInstanceCreateInfoFB.scale)));
    assert(size_of(GeometryInstanceCreateInfoFB) == 80, "GeometryInstanceCreateInfoFB has size % instead of 80", size_of(GeometryInstanceCreateInfoFB));
}

GeometryInstanceTransformFB :: struct {
    type:      StructureType;
    next:      *void;
    baseSpace: Space;
    time:      Time;
    pose:      Posef;
    scale:     Vector3f;
}
#run {
    instance: GeometryInstanceTransformFB;
    assert(((cast(*void)(*instance.type)) - cast(*void)(*instance)) == 0, "GeometryInstanceTransformFB.type has unexpected offset % instead of 0", ((cast(*void)(*instance.type)) - cast(*void)(*instance)));
    assert(size_of(type_of(GeometryInstanceTransformFB.type)) == 4, "GeometryInstanceTransformFB.type has unexpected size % instead of 4", size_of(type_of(GeometryInstanceTransformFB.type)));
    assert(((cast(*void)(*instance.next)) - cast(*void)(*instance)) == 8, "GeometryInstanceTransformFB.next has unexpected offset % instead of 8", ((cast(*void)(*instance.next)) - cast(*void)(*instance)));
    assert(size_of(type_of(GeometryInstanceTransformFB.next)) == 8, "GeometryInstanceTransformFB.next has unexpected size % instead of 8", size_of(type_of(GeometryInstanceTransformFB.next)));
    assert(((cast(*void)(*instance.baseSpace)) - cast(*void)(*instance)) == 16, "GeometryInstanceTransformFB.baseSpace has unexpected offset % instead of 16", ((cast(*void)(*instance.baseSpace)) - cast(*void)(*instance)));
    assert(size_of(type_of(GeometryInstanceTransformFB.baseSpace)) == 8, "GeometryInstanceTransformFB.baseSpace has unexpected size % instead of 8", size_of(type_of(GeometryInstanceTransformFB.baseSpace)));
    assert(((cast(*void)(*instance.time)) - cast(*void)(*instance)) == 24, "GeometryInstanceTransformFB.time has unexpected offset % instead of 24", ((cast(*void)(*instance.time)) - cast(*void)(*instance)));
    assert(size_of(type_of(GeometryInstanceTransformFB.time)) == 8, "GeometryInstanceTransformFB.time has unexpected size % instead of 8", size_of(type_of(GeometryInstanceTransformFB.time)));
    assert(((cast(*void)(*instance.pose)) - cast(*void)(*instance)) == 32, "GeometryInstanceTransformFB.pose has unexpected offset % instead of 32", ((cast(*void)(*instance.pose)) - cast(*void)(*instance)));
    assert(size_of(type_of(GeometryInstanceTransformFB.pose)) == 28, "GeometryInstanceTransformFB.pose has unexpected size % instead of 28", size_of(type_of(GeometryInstanceTransformFB.pose)));
    assert(((cast(*void)(*instance.scale)) - cast(*void)(*instance)) == 60, "GeometryInstanceTransformFB.scale has unexpected offset % instead of 60", ((cast(*void)(*instance.scale)) - cast(*void)(*instance)));
    assert(size_of(type_of(GeometryInstanceTransformFB.scale)) == 12, "GeometryInstanceTransformFB.scale has unexpected size % instead of 12", size_of(type_of(GeometryInstanceTransformFB.scale)));
    assert(size_of(GeometryInstanceTransformFB) == 72, "GeometryInstanceTransformFB has size % instead of 72", size_of(GeometryInstanceTransformFB));
}

PassthroughStyleFB :: struct {
    type:                 StructureType;
    next:                 *void;
    textureOpacityFactor: float;
    edgeColor:            Color4f;
}
#run {
    instance: PassthroughStyleFB;
    assert(((cast(*void)(*instance.type)) - cast(*void)(*instance)) == 0, "PassthroughStyleFB.type has unexpected offset % instead of 0", ((cast(*void)(*instance.type)) - cast(*void)(*instance)));
    assert(size_of(type_of(PassthroughStyleFB.type)) == 4, "PassthroughStyleFB.type has unexpected size % instead of 4", size_of(type_of(PassthroughStyleFB.type)));
    assert(((cast(*void)(*instance.next)) - cast(*void)(*instance)) == 8, "PassthroughStyleFB.next has unexpected offset % instead of 8", ((cast(*void)(*instance.next)) - cast(*void)(*instance)));
    assert(size_of(type_of(PassthroughStyleFB.next)) == 8, "PassthroughStyleFB.next has unexpected size % instead of 8", size_of(type_of(PassthroughStyleFB.next)));
    assert(((cast(*void)(*instance.textureOpacityFactor)) - cast(*void)(*instance)) == 16, "PassthroughStyleFB.textureOpacityFactor has unexpected offset % instead of 16", ((cast(*void)(*instance.textureOpacityFactor)) - cast(*void)(*instance)));
    assert(size_of(type_of(PassthroughStyleFB.textureOpacityFactor)) == 4, "PassthroughStyleFB.textureOpacityFactor has unexpected size % instead of 4", size_of(type_of(PassthroughStyleFB.textureOpacityFactor)));
    assert(((cast(*void)(*instance.edgeColor)) - cast(*void)(*instance)) == 20, "PassthroughStyleFB.edgeColor has unexpected offset % instead of 20", ((cast(*void)(*instance.edgeColor)) - cast(*void)(*instance)));
    assert(size_of(type_of(PassthroughStyleFB.edgeColor)) == 16, "PassthroughStyleFB.edgeColor has unexpected size % instead of 16", size_of(type_of(PassthroughStyleFB.edgeColor)));
    assert(size_of(PassthroughStyleFB) == 40, "PassthroughStyleFB has size % instead of 40", size_of(PassthroughStyleFB));
}

// XrPassthroughColorMapMonoToRgbaFB extends XrPassthroughStyleFB
PassthroughColorMapMonoToRgbaFB :: struct {
    type:            StructureType;
    next:            *void;
    textureColorMap: [256] Color4f;
}
#run {
    instance: PassthroughColorMapMonoToRgbaFB;
    assert(((cast(*void)(*instance.type)) - cast(*void)(*instance)) == 0, "PassthroughColorMapMonoToRgbaFB.type has unexpected offset % instead of 0", ((cast(*void)(*instance.type)) - cast(*void)(*instance)));
    assert(size_of(type_of(PassthroughColorMapMonoToRgbaFB.type)) == 4, "PassthroughColorMapMonoToRgbaFB.type has unexpected size % instead of 4", size_of(type_of(PassthroughColorMapMonoToRgbaFB.type)));
    assert(((cast(*void)(*instance.next)) - cast(*void)(*instance)) == 8, "PassthroughColorMapMonoToRgbaFB.next has unexpected offset % instead of 8", ((cast(*void)(*instance.next)) - cast(*void)(*instance)));
    assert(size_of(type_of(PassthroughColorMapMonoToRgbaFB.next)) == 8, "PassthroughColorMapMonoToRgbaFB.next has unexpected size % instead of 8", size_of(type_of(PassthroughColorMapMonoToRgbaFB.next)));
    assert(((cast(*void)(*instance.textureColorMap)) - cast(*void)(*instance)) == 16, "PassthroughColorMapMonoToRgbaFB.textureColorMap has unexpected offset % instead of 16", ((cast(*void)(*instance.textureColorMap)) - cast(*void)(*instance)));
    assert(size_of(type_of(PassthroughColorMapMonoToRgbaFB.textureColorMap)) == 4096, "PassthroughColorMapMonoToRgbaFB.textureColorMap has unexpected size % instead of 4096", size_of(type_of(PassthroughColorMapMonoToRgbaFB.textureColorMap)));
    assert(size_of(PassthroughColorMapMonoToRgbaFB) == 4112, "PassthroughColorMapMonoToRgbaFB has size % instead of 4112", size_of(PassthroughColorMapMonoToRgbaFB));
}

// XrPassthroughColorMapMonoToMonoFB extends XrPassthroughStyleFB
PassthroughColorMapMonoToMonoFB :: struct {
    type:            StructureType;
    next:            *void;
    textureColorMap: [256] u8;
}
#run {
    instance: PassthroughColorMapMonoToMonoFB;
    assert(((cast(*void)(*instance.type)) - cast(*void)(*instance)) == 0, "PassthroughColorMapMonoToMonoFB.type has unexpected offset % instead of 0", ((cast(*void)(*instance.type)) - cast(*void)(*instance)));
    assert(size_of(type_of(PassthroughColorMapMonoToMonoFB.type)) == 4, "PassthroughColorMapMonoToMonoFB.type has unexpected size % instead of 4", size_of(type_of(PassthroughColorMapMonoToMonoFB.type)));
    assert(((cast(*void)(*instance.next)) - cast(*void)(*instance)) == 8, "PassthroughColorMapMonoToMonoFB.next has unexpected offset % instead of 8", ((cast(*void)(*instance.next)) - cast(*void)(*instance)));
    assert(size_of(type_of(PassthroughColorMapMonoToMonoFB.next)) == 8, "PassthroughColorMapMonoToMonoFB.next has unexpected size % instead of 8", size_of(type_of(PassthroughColorMapMonoToMonoFB.next)));
    assert(((cast(*void)(*instance.textureColorMap)) - cast(*void)(*instance)) == 16, "PassthroughColorMapMonoToMonoFB.textureColorMap has unexpected offset % instead of 16", ((cast(*void)(*instance.textureColorMap)) - cast(*void)(*instance)));
    assert(size_of(type_of(PassthroughColorMapMonoToMonoFB.textureColorMap)) == 256, "PassthroughColorMapMonoToMonoFB.textureColorMap has unexpected size % instead of 256", size_of(type_of(PassthroughColorMapMonoToMonoFB.textureColorMap)));
    assert(size_of(PassthroughColorMapMonoToMonoFB) == 272, "PassthroughColorMapMonoToMonoFB has size % instead of 272", size_of(PassthroughColorMapMonoToMonoFB));
}

// XrPassthroughBrightnessContrastSaturationFB extends XrPassthroughStyleFB
PassthroughBrightnessContrastSaturationFB :: struct {
    type:       StructureType;
    next:       *void;
    brightness: float;
    contrast:   float;
    saturation: float;
}
#run {
    instance: PassthroughBrightnessContrastSaturationFB;
    assert(((cast(*void)(*instance.type)) - cast(*void)(*instance)) == 0, "PassthroughBrightnessContrastSaturationFB.type has unexpected offset % instead of 0", ((cast(*void)(*instance.type)) - cast(*void)(*instance)));
    assert(size_of(type_of(PassthroughBrightnessContrastSaturationFB.type)) == 4, "PassthroughBrightnessContrastSaturationFB.type has unexpected size % instead of 4", size_of(type_of(PassthroughBrightnessContrastSaturationFB.type)));
    assert(((cast(*void)(*instance.next)) - cast(*void)(*instance)) == 8, "PassthroughBrightnessContrastSaturationFB.next has unexpected offset % instead of 8", ((cast(*void)(*instance.next)) - cast(*void)(*instance)));
    assert(size_of(type_of(PassthroughBrightnessContrastSaturationFB.next)) == 8, "PassthroughBrightnessContrastSaturationFB.next has unexpected size % instead of 8", size_of(type_of(PassthroughBrightnessContrastSaturationFB.next)));
    assert(((cast(*void)(*instance.brightness)) - cast(*void)(*instance)) == 16, "PassthroughBrightnessContrastSaturationFB.brightness has unexpected offset % instead of 16", ((cast(*void)(*instance.brightness)) - cast(*void)(*instance)));
    assert(size_of(type_of(PassthroughBrightnessContrastSaturationFB.brightness)) == 4, "PassthroughBrightnessContrastSaturationFB.brightness has unexpected size % instead of 4", size_of(type_of(PassthroughBrightnessContrastSaturationFB.brightness)));
    assert(((cast(*void)(*instance.contrast)) - cast(*void)(*instance)) == 20, "PassthroughBrightnessContrastSaturationFB.contrast has unexpected offset % instead of 20", ((cast(*void)(*instance.contrast)) - cast(*void)(*instance)));
    assert(size_of(type_of(PassthroughBrightnessContrastSaturationFB.contrast)) == 4, "PassthroughBrightnessContrastSaturationFB.contrast has unexpected size % instead of 4", size_of(type_of(PassthroughBrightnessContrastSaturationFB.contrast)));
    assert(((cast(*void)(*instance.saturation)) - cast(*void)(*instance)) == 24, "PassthroughBrightnessContrastSaturationFB.saturation has unexpected offset % instead of 24", ((cast(*void)(*instance.saturation)) - cast(*void)(*instance)));
    assert(size_of(type_of(PassthroughBrightnessContrastSaturationFB.saturation)) == 4, "PassthroughBrightnessContrastSaturationFB.saturation has unexpected size % instead of 4", size_of(type_of(PassthroughBrightnessContrastSaturationFB.saturation)));
    assert(size_of(PassthroughBrightnessContrastSaturationFB) == 32, "PassthroughBrightnessContrastSaturationFB has size % instead of 32", size_of(PassthroughBrightnessContrastSaturationFB));
}

EventDataPassthroughStateChangedFB :: struct {
    type:  StructureType;
    next:  *void;
    flags: PassthroughStateChangedFlagsFB;
}
#run {
    instance: EventDataPassthroughStateChangedFB;
    assert(((cast(*void)(*instance.type)) - cast(*void)(*instance)) == 0, "EventDataPassthroughStateChangedFB.type has unexpected offset % instead of 0", ((cast(*void)(*instance.type)) - cast(*void)(*instance)));
    assert(size_of(type_of(EventDataPassthroughStateChangedFB.type)) == 4, "EventDataPassthroughStateChangedFB.type has unexpected size % instead of 4", size_of(type_of(EventDataPassthroughStateChangedFB.type)));
    assert(((cast(*void)(*instance.next)) - cast(*void)(*instance)) == 8, "EventDataPassthroughStateChangedFB.next has unexpected offset % instead of 8", ((cast(*void)(*instance.next)) - cast(*void)(*instance)));
    assert(size_of(type_of(EventDataPassthroughStateChangedFB.next)) == 8, "EventDataPassthroughStateChangedFB.next has unexpected size % instead of 8", size_of(type_of(EventDataPassthroughStateChangedFB.next)));
    assert(((cast(*void)(*instance.flags)) - cast(*void)(*instance)) == 16, "EventDataPassthroughStateChangedFB.flags has unexpected offset % instead of 16", ((cast(*void)(*instance.flags)) - cast(*void)(*instance)));
    assert(size_of(type_of(EventDataPassthroughStateChangedFB.flags)) == 8, "EventDataPassthroughStateChangedFB.flags has unexpected size % instead of 8", size_of(type_of(EventDataPassthroughStateChangedFB.flags)));
    assert(size_of(EventDataPassthroughStateChangedFB) == 24, "EventDataPassthroughStateChangedFB has size % instead of 24", size_of(EventDataPassthroughStateChangedFB));
}

PFN_xrCreatePassthroughFB :: #type (a0: Session, a1: *PassthroughCreateInfoFB, a2: *PassthroughFB) -> Result #c_call;
PFN_xrDestroyPassthroughFB :: #type (a0: PassthroughFB) -> Result #c_call;
PFN_xrPassthroughStartFB :: #type (a0: PassthroughFB) -> Result #c_call;
PFN_xrPassthroughPauseFB :: #type (a0: PassthroughFB) -> Result #c_call;
PFN_xrCreatePassthroughLayerFB :: #type (a0: Session, a1: *PassthroughLayerCreateInfoFB, a2: *PassthroughLayerFB) -> Result #c_call;
PFN_xrDestroyPassthroughLayerFB :: #type (a0: PassthroughLayerFB) -> Result #c_call;
PFN_xrPassthroughLayerPauseFB :: #type (a0: PassthroughLayerFB) -> Result #c_call;
PFN_xrPassthroughLayerResumeFB :: #type (a0: PassthroughLayerFB) -> Result #c_call;
PFN_xrPassthroughLayerSetStyleFB :: #type (a0: PassthroughLayerFB, a1: *PassthroughStyleFB) -> Result #c_call;
PFN_xrCreateGeometryInstanceFB :: #type (a0: Session, a1: *GeometryInstanceCreateInfoFB, a2: *GeometryInstanceFB) -> Result #c_call;
PFN_xrDestroyGeometryInstanceFB :: #type (a0: GeometryInstanceFB) -> Result #c_call;
PFN_xrGeometryInstanceSetTransformFB :: #type (a0: GeometryInstanceFB, a1: *GeometryInstanceTransformFB) -> Result #c_call;

RenderModelKeyFB :: u64;

RenderModelFlagsFB :: Flags64;

// Flag bits for XrRenderModelFlagsFB
XR_RENDER_MODEL_SUPPORTS_GLTF_2_0_SUBSET_1_BIT_FB: RenderModelFlagsFB : 1;
XR_RENDER_MODEL_SUPPORTS_GLTF_2_0_SUBSET_2_BIT_FB: RenderModelFlagsFB : 2;

RenderModelPathInfoFB :: struct {
    type: StructureType;
    next: *void;
    path: Path;
}
#run {
    instance: RenderModelPathInfoFB;
    assert(((cast(*void)(*instance.type)) - cast(*void)(*instance)) == 0, "RenderModelPathInfoFB.type has unexpected offset % instead of 0", ((cast(*void)(*instance.type)) - cast(*void)(*instance)));
    assert(size_of(type_of(RenderModelPathInfoFB.type)) == 4, "RenderModelPathInfoFB.type has unexpected size % instead of 4", size_of(type_of(RenderModelPathInfoFB.type)));
    assert(((cast(*void)(*instance.next)) - cast(*void)(*instance)) == 8, "RenderModelPathInfoFB.next has unexpected offset % instead of 8", ((cast(*void)(*instance.next)) - cast(*void)(*instance)));
    assert(size_of(type_of(RenderModelPathInfoFB.next)) == 8, "RenderModelPathInfoFB.next has unexpected size % instead of 8", size_of(type_of(RenderModelPathInfoFB.next)));
    assert(((cast(*void)(*instance.path)) - cast(*void)(*instance)) == 16, "RenderModelPathInfoFB.path has unexpected offset % instead of 16", ((cast(*void)(*instance.path)) - cast(*void)(*instance)));
    assert(size_of(type_of(RenderModelPathInfoFB.path)) == 8, "RenderModelPathInfoFB.path has unexpected size % instead of 8", size_of(type_of(RenderModelPathInfoFB.path)));
    assert(size_of(RenderModelPathInfoFB) == 24, "RenderModelPathInfoFB has size % instead of 24", size_of(RenderModelPathInfoFB));
}

RenderModelPropertiesFB :: struct {
    type:         StructureType;
    next:         *void;
    vendorId:     u32;
    modelName:    [64] u8;
    modelKey:     RenderModelKeyFB;
    modelVersion: u32;
    flags:        RenderModelFlagsFB;
}
#run {
    instance: RenderModelPropertiesFB;
    assert(((cast(*void)(*instance.type)) - cast(*void)(*instance)) == 0, "RenderModelPropertiesFB.type has unexpected offset % instead of 0", ((cast(*void)(*instance.type)) - cast(*void)(*instance)));
    assert(size_of(type_of(RenderModelPropertiesFB.type)) == 4, "RenderModelPropertiesFB.type has unexpected size % instead of 4", size_of(type_of(RenderModelPropertiesFB.type)));
    assert(((cast(*void)(*instance.next)) - cast(*void)(*instance)) == 8, "RenderModelPropertiesFB.next has unexpected offset % instead of 8", ((cast(*void)(*instance.next)) - cast(*void)(*instance)));
    assert(size_of(type_of(RenderModelPropertiesFB.next)) == 8, "RenderModelPropertiesFB.next has unexpected size % instead of 8", size_of(type_of(RenderModelPropertiesFB.next)));
    assert(((cast(*void)(*instance.vendorId)) - cast(*void)(*instance)) == 16, "RenderModelPropertiesFB.vendorId has unexpected offset % instead of 16", ((cast(*void)(*instance.vendorId)) - cast(*void)(*instance)));
    assert(size_of(type_of(RenderModelPropertiesFB.vendorId)) == 4, "RenderModelPropertiesFB.vendorId has unexpected size % instead of 4", size_of(type_of(RenderModelPropertiesFB.vendorId)));
    assert(((cast(*void)(*instance.modelName)) - cast(*void)(*instance)) == 20, "RenderModelPropertiesFB.modelName has unexpected offset % instead of 20", ((cast(*void)(*instance.modelName)) - cast(*void)(*instance)));
    assert(size_of(type_of(RenderModelPropertiesFB.modelName)) == 64, "RenderModelPropertiesFB.modelName has unexpected size % instead of 64", size_of(type_of(RenderModelPropertiesFB.modelName)));
    assert(((cast(*void)(*instance.modelKey)) - cast(*void)(*instance)) == 88, "RenderModelPropertiesFB.modelKey has unexpected offset % instead of 88", ((cast(*void)(*instance.modelKey)) - cast(*void)(*instance)));
    assert(size_of(type_of(RenderModelPropertiesFB.modelKey)) == 8, "RenderModelPropertiesFB.modelKey has unexpected size % instead of 8", size_of(type_of(RenderModelPropertiesFB.modelKey)));
    assert(((cast(*void)(*instance.modelVersion)) - cast(*void)(*instance)) == 96, "RenderModelPropertiesFB.modelVersion has unexpected offset % instead of 96", ((cast(*void)(*instance.modelVersion)) - cast(*void)(*instance)));
    assert(size_of(type_of(RenderModelPropertiesFB.modelVersion)) == 4, "RenderModelPropertiesFB.modelVersion has unexpected size % instead of 4", size_of(type_of(RenderModelPropertiesFB.modelVersion)));
    assert(((cast(*void)(*instance.flags)) - cast(*void)(*instance)) == 104, "RenderModelPropertiesFB.flags has unexpected offset % instead of 104", ((cast(*void)(*instance.flags)) - cast(*void)(*instance)));
    assert(size_of(type_of(RenderModelPropertiesFB.flags)) == 8, "RenderModelPropertiesFB.flags has unexpected size % instead of 8", size_of(type_of(RenderModelPropertiesFB.flags)));
    assert(size_of(RenderModelPropertiesFB) == 112, "RenderModelPropertiesFB has size % instead of 112", size_of(RenderModelPropertiesFB));
}

RenderModelBufferFB :: struct {
    type:                StructureType;
    next:                *void;
    bufferCapacityInput: u32;
    bufferCountOutput:   u32;
    buffer:              *u8;
}
#run {
    instance: RenderModelBufferFB;
    assert(((cast(*void)(*instance.type)) - cast(*void)(*instance)) == 0, "RenderModelBufferFB.type has unexpected offset % instead of 0", ((cast(*void)(*instance.type)) - cast(*void)(*instance)));
    assert(size_of(type_of(RenderModelBufferFB.type)) == 4, "RenderModelBufferFB.type has unexpected size % instead of 4", size_of(type_of(RenderModelBufferFB.type)));
    assert(((cast(*void)(*instance.next)) - cast(*void)(*instance)) == 8, "RenderModelBufferFB.next has unexpected offset % instead of 8", ((cast(*void)(*instance.next)) - cast(*void)(*instance)));
    assert(size_of(type_of(RenderModelBufferFB.next)) == 8, "RenderModelBufferFB.next has unexpected size % instead of 8", size_of(type_of(RenderModelBufferFB.next)));
    assert(((cast(*void)(*instance.bufferCapacityInput)) - cast(*void)(*instance)) == 16, "RenderModelBufferFB.bufferCapacityInput has unexpected offset % instead of 16", ((cast(*void)(*instance.bufferCapacityInput)) - cast(*void)(*instance)));
    assert(size_of(type_of(RenderModelBufferFB.bufferCapacityInput)) == 4, "RenderModelBufferFB.bufferCapacityInput has unexpected size % instead of 4", size_of(type_of(RenderModelBufferFB.bufferCapacityInput)));
    assert(((cast(*void)(*instance.bufferCountOutput)) - cast(*void)(*instance)) == 20, "RenderModelBufferFB.bufferCountOutput has unexpected offset % instead of 20", ((cast(*void)(*instance.bufferCountOutput)) - cast(*void)(*instance)));
    assert(size_of(type_of(RenderModelBufferFB.bufferCountOutput)) == 4, "RenderModelBufferFB.bufferCountOutput has unexpected size % instead of 4", size_of(type_of(RenderModelBufferFB.bufferCountOutput)));
    assert(((cast(*void)(*instance.buffer)) - cast(*void)(*instance)) == 24, "RenderModelBufferFB.buffer has unexpected offset % instead of 24", ((cast(*void)(*instance.buffer)) - cast(*void)(*instance)));
    assert(size_of(type_of(RenderModelBufferFB.buffer)) == 8, "RenderModelBufferFB.buffer has unexpected size % instead of 8", size_of(type_of(RenderModelBufferFB.buffer)));
    assert(size_of(RenderModelBufferFB) == 32, "RenderModelBufferFB has size % instead of 32", size_of(RenderModelBufferFB));
}

RenderModelLoadInfoFB :: struct {
    type:     StructureType;
    next:     *void;
    modelKey: RenderModelKeyFB;
}
#run {
    instance: RenderModelLoadInfoFB;
    assert(((cast(*void)(*instance.type)) - cast(*void)(*instance)) == 0, "RenderModelLoadInfoFB.type has unexpected offset % instead of 0", ((cast(*void)(*instance.type)) - cast(*void)(*instance)));
    assert(size_of(type_of(RenderModelLoadInfoFB.type)) == 4, "RenderModelLoadInfoFB.type has unexpected size % instead of 4", size_of(type_of(RenderModelLoadInfoFB.type)));
    assert(((cast(*void)(*instance.next)) - cast(*void)(*instance)) == 8, "RenderModelLoadInfoFB.next has unexpected offset % instead of 8", ((cast(*void)(*instance.next)) - cast(*void)(*instance)));
    assert(size_of(type_of(RenderModelLoadInfoFB.next)) == 8, "RenderModelLoadInfoFB.next has unexpected size % instead of 8", size_of(type_of(RenderModelLoadInfoFB.next)));
    assert(((cast(*void)(*instance.modelKey)) - cast(*void)(*instance)) == 16, "RenderModelLoadInfoFB.modelKey has unexpected offset % instead of 16", ((cast(*void)(*instance.modelKey)) - cast(*void)(*instance)));
    assert(size_of(type_of(RenderModelLoadInfoFB.modelKey)) == 8, "RenderModelLoadInfoFB.modelKey has unexpected size % instead of 8", size_of(type_of(RenderModelLoadInfoFB.modelKey)));
    assert(size_of(RenderModelLoadInfoFB) == 24, "RenderModelLoadInfoFB has size % instead of 24", size_of(RenderModelLoadInfoFB));
}

// XrSystemRenderModelPropertiesFB extends XrSystemProperties
SystemRenderModelPropertiesFB :: struct {
    type:                       StructureType;
    next:                       *void;
    supportsRenderModelLoading: Bool32;
}
#run {
    instance: SystemRenderModelPropertiesFB;
    assert(((cast(*void)(*instance.type)) - cast(*void)(*instance)) == 0, "SystemRenderModelPropertiesFB.type has unexpected offset % instead of 0", ((cast(*void)(*instance.type)) - cast(*void)(*instance)));
    assert(size_of(type_of(SystemRenderModelPropertiesFB.type)) == 4, "SystemRenderModelPropertiesFB.type has unexpected size % instead of 4", size_of(type_of(SystemRenderModelPropertiesFB.type)));
    assert(((cast(*void)(*instance.next)) - cast(*void)(*instance)) == 8, "SystemRenderModelPropertiesFB.next has unexpected offset % instead of 8", ((cast(*void)(*instance.next)) - cast(*void)(*instance)));
    assert(size_of(type_of(SystemRenderModelPropertiesFB.next)) == 8, "SystemRenderModelPropertiesFB.next has unexpected size % instead of 8", size_of(type_of(SystemRenderModelPropertiesFB.next)));
    assert(((cast(*void)(*instance.supportsRenderModelLoading)) - cast(*void)(*instance)) == 16, "SystemRenderModelPropertiesFB.supportsRenderModelLoading has unexpected offset % instead of 16", ((cast(*void)(*instance.supportsRenderModelLoading)) - cast(*void)(*instance)));
    assert(size_of(type_of(SystemRenderModelPropertiesFB.supportsRenderModelLoading)) == 4, "SystemRenderModelPropertiesFB.supportsRenderModelLoading has unexpected size % instead of 4", size_of(type_of(SystemRenderModelPropertiesFB.supportsRenderModelLoading)));
    assert(size_of(SystemRenderModelPropertiesFB) == 24, "SystemRenderModelPropertiesFB has size % instead of 24", size_of(SystemRenderModelPropertiesFB));
}

// XrRenderModelCapabilitiesRequestFB extends XrSystemProperties
RenderModelCapabilitiesRequestFB :: struct {
    type:  StructureType;
    next:  *void;
    flags: RenderModelFlagsFB;
}
#run {
    instance: RenderModelCapabilitiesRequestFB;
    assert(((cast(*void)(*instance.type)) - cast(*void)(*instance)) == 0, "RenderModelCapabilitiesRequestFB.type has unexpected offset % instead of 0", ((cast(*void)(*instance.type)) - cast(*void)(*instance)));
    assert(size_of(type_of(RenderModelCapabilitiesRequestFB.type)) == 4, "RenderModelCapabilitiesRequestFB.type has unexpected size % instead of 4", size_of(type_of(RenderModelCapabilitiesRequestFB.type)));
    assert(((cast(*void)(*instance.next)) - cast(*void)(*instance)) == 8, "RenderModelCapabilitiesRequestFB.next has unexpected offset % instead of 8", ((cast(*void)(*instance.next)) - cast(*void)(*instance)));
    assert(size_of(type_of(RenderModelCapabilitiesRequestFB.next)) == 8, "RenderModelCapabilitiesRequestFB.next has unexpected size % instead of 8", size_of(type_of(RenderModelCapabilitiesRequestFB.next)));
    assert(((cast(*void)(*instance.flags)) - cast(*void)(*instance)) == 16, "RenderModelCapabilitiesRequestFB.flags has unexpected offset % instead of 16", ((cast(*void)(*instance.flags)) - cast(*void)(*instance)));
    assert(size_of(type_of(RenderModelCapabilitiesRequestFB.flags)) == 8, "RenderModelCapabilitiesRequestFB.flags has unexpected size % instead of 8", size_of(type_of(RenderModelCapabilitiesRequestFB.flags)));
    assert(size_of(RenderModelCapabilitiesRequestFB) == 24, "RenderModelCapabilitiesRequestFB has size % instead of 24", size_of(RenderModelCapabilitiesRequestFB));
}

PFN_xrEnumerateRenderModelPathsFB :: #type (a0: Session, a1: u32, a2: *u32, a3: *RenderModelPathInfoFB) -> Result #c_call;
PFN_xrGetRenderModelPropertiesFB :: #type (a0: Session, a1: Path, a2: *RenderModelPropertiesFB) -> Result #c_call;
PFN_xrLoadRenderModelFB :: #type (a0: Session, a1: *RenderModelLoadInfoFB, a2: *RenderModelBufferFB) -> Result #c_call;

// XrViewLocateFoveatedRenderingVARJO extends XrViewLocateInfo
ViewLocateFoveatedRenderingVARJO :: struct {
    type:                    StructureType;
    next:                    *void;
    foveatedRenderingActive: Bool32;
}
#run {
    instance: ViewLocateFoveatedRenderingVARJO;
    assert(((cast(*void)(*instance.type)) - cast(*void)(*instance)) == 0, "ViewLocateFoveatedRenderingVARJO.type has unexpected offset % instead of 0", ((cast(*void)(*instance.type)) - cast(*void)(*instance)));
    assert(size_of(type_of(ViewLocateFoveatedRenderingVARJO.type)) == 4, "ViewLocateFoveatedRenderingVARJO.type has unexpected size % instead of 4", size_of(type_of(ViewLocateFoveatedRenderingVARJO.type)));
    assert(((cast(*void)(*instance.next)) - cast(*void)(*instance)) == 8, "ViewLocateFoveatedRenderingVARJO.next has unexpected offset % instead of 8", ((cast(*void)(*instance.next)) - cast(*void)(*instance)));
    assert(size_of(type_of(ViewLocateFoveatedRenderingVARJO.next)) == 8, "ViewLocateFoveatedRenderingVARJO.next has unexpected size % instead of 8", size_of(type_of(ViewLocateFoveatedRenderingVARJO.next)));
    assert(((cast(*void)(*instance.foveatedRenderingActive)) - cast(*void)(*instance)) == 16, "ViewLocateFoveatedRenderingVARJO.foveatedRenderingActive has unexpected offset % instead of 16", ((cast(*void)(*instance.foveatedRenderingActive)) - cast(*void)(*instance)));
    assert(size_of(type_of(ViewLocateFoveatedRenderingVARJO.foveatedRenderingActive)) == 4, "ViewLocateFoveatedRenderingVARJO.foveatedRenderingActive has unexpected size % instead of 4", size_of(type_of(ViewLocateFoveatedRenderingVARJO.foveatedRenderingActive)));
    assert(size_of(ViewLocateFoveatedRenderingVARJO) == 24, "ViewLocateFoveatedRenderingVARJO has size % instead of 24", size_of(ViewLocateFoveatedRenderingVARJO));
}

// XrFoveatedViewConfigurationViewVARJO extends XrViewConfigurationView
FoveatedViewConfigurationViewVARJO :: struct {
    type:                    StructureType;
    next:                    *void;
    foveatedRenderingActive: Bool32;
}
#run {
    instance: FoveatedViewConfigurationViewVARJO;
    assert(((cast(*void)(*instance.type)) - cast(*void)(*instance)) == 0, "FoveatedViewConfigurationViewVARJO.type has unexpected offset % instead of 0", ((cast(*void)(*instance.type)) - cast(*void)(*instance)));
    assert(size_of(type_of(FoveatedViewConfigurationViewVARJO.type)) == 4, "FoveatedViewConfigurationViewVARJO.type has unexpected size % instead of 4", size_of(type_of(FoveatedViewConfigurationViewVARJO.type)));
    assert(((cast(*void)(*instance.next)) - cast(*void)(*instance)) == 8, "FoveatedViewConfigurationViewVARJO.next has unexpected offset % instead of 8", ((cast(*void)(*instance.next)) - cast(*void)(*instance)));
    assert(size_of(type_of(FoveatedViewConfigurationViewVARJO.next)) == 8, "FoveatedViewConfigurationViewVARJO.next has unexpected size % instead of 8", size_of(type_of(FoveatedViewConfigurationViewVARJO.next)));
    assert(((cast(*void)(*instance.foveatedRenderingActive)) - cast(*void)(*instance)) == 16, "FoveatedViewConfigurationViewVARJO.foveatedRenderingActive has unexpected offset % instead of 16", ((cast(*void)(*instance.foveatedRenderingActive)) - cast(*void)(*instance)));
    assert(size_of(type_of(FoveatedViewConfigurationViewVARJO.foveatedRenderingActive)) == 4, "FoveatedViewConfigurationViewVARJO.foveatedRenderingActive has unexpected size % instead of 4", size_of(type_of(FoveatedViewConfigurationViewVARJO.foveatedRenderingActive)));
    assert(size_of(FoveatedViewConfigurationViewVARJO) == 24, "FoveatedViewConfigurationViewVARJO has size % instead of 24", size_of(FoveatedViewConfigurationViewVARJO));
}

// XrSystemFoveatedRenderingPropertiesVARJO extends XrSystemProperties
SystemFoveatedRenderingPropertiesVARJO :: struct {
    type:                      StructureType;
    next:                      *void;
    supportsFoveatedRendering: Bool32;
}
#run {
    instance: SystemFoveatedRenderingPropertiesVARJO;
    assert(((cast(*void)(*instance.type)) - cast(*void)(*instance)) == 0, "SystemFoveatedRenderingPropertiesVARJO.type has unexpected offset % instead of 0", ((cast(*void)(*instance.type)) - cast(*void)(*instance)));
    assert(size_of(type_of(SystemFoveatedRenderingPropertiesVARJO.type)) == 4, "SystemFoveatedRenderingPropertiesVARJO.type has unexpected size % instead of 4", size_of(type_of(SystemFoveatedRenderingPropertiesVARJO.type)));
    assert(((cast(*void)(*instance.next)) - cast(*void)(*instance)) == 8, "SystemFoveatedRenderingPropertiesVARJO.next has unexpected offset % instead of 8", ((cast(*void)(*instance.next)) - cast(*void)(*instance)));
    assert(size_of(type_of(SystemFoveatedRenderingPropertiesVARJO.next)) == 8, "SystemFoveatedRenderingPropertiesVARJO.next has unexpected size % instead of 8", size_of(type_of(SystemFoveatedRenderingPropertiesVARJO.next)));
    assert(((cast(*void)(*instance.supportsFoveatedRendering)) - cast(*void)(*instance)) == 16, "SystemFoveatedRenderingPropertiesVARJO.supportsFoveatedRendering has unexpected offset % instead of 16", ((cast(*void)(*instance.supportsFoveatedRendering)) - cast(*void)(*instance)));
    assert(size_of(type_of(SystemFoveatedRenderingPropertiesVARJO.supportsFoveatedRendering)) == 4, "SystemFoveatedRenderingPropertiesVARJO.supportsFoveatedRendering has unexpected size % instead of 4", size_of(type_of(SystemFoveatedRenderingPropertiesVARJO.supportsFoveatedRendering)));
    assert(size_of(SystemFoveatedRenderingPropertiesVARJO) == 24, "SystemFoveatedRenderingPropertiesVARJO has size % instead of 24", size_of(SystemFoveatedRenderingPropertiesVARJO));
}

// XrCompositionLayerDepthTestVARJO extends XrCompositionLayerProjection
CompositionLayerDepthTestVARJO :: struct {
    type:                StructureType;
    next:                *void;
    depthTestRangeNearZ: float;
    depthTestRangeFarZ:  float;
}
#run {
    instance: CompositionLayerDepthTestVARJO;
    assert(((cast(*void)(*instance.type)) - cast(*void)(*instance)) == 0, "CompositionLayerDepthTestVARJO.type has unexpected offset % instead of 0", ((cast(*void)(*instance.type)) - cast(*void)(*instance)));
    assert(size_of(type_of(CompositionLayerDepthTestVARJO.type)) == 4, "CompositionLayerDepthTestVARJO.type has unexpected size % instead of 4", size_of(type_of(CompositionLayerDepthTestVARJO.type)));
    assert(((cast(*void)(*instance.next)) - cast(*void)(*instance)) == 8, "CompositionLayerDepthTestVARJO.next has unexpected offset % instead of 8", ((cast(*void)(*instance.next)) - cast(*void)(*instance)));
    assert(size_of(type_of(CompositionLayerDepthTestVARJO.next)) == 8, "CompositionLayerDepthTestVARJO.next has unexpected size % instead of 8", size_of(type_of(CompositionLayerDepthTestVARJO.next)));
    assert(((cast(*void)(*instance.depthTestRangeNearZ)) - cast(*void)(*instance)) == 16, "CompositionLayerDepthTestVARJO.depthTestRangeNearZ has unexpected offset % instead of 16", ((cast(*void)(*instance.depthTestRangeNearZ)) - cast(*void)(*instance)));
    assert(size_of(type_of(CompositionLayerDepthTestVARJO.depthTestRangeNearZ)) == 4, "CompositionLayerDepthTestVARJO.depthTestRangeNearZ has unexpected size % instead of 4", size_of(type_of(CompositionLayerDepthTestVARJO.depthTestRangeNearZ)));
    assert(((cast(*void)(*instance.depthTestRangeFarZ)) - cast(*void)(*instance)) == 20, "CompositionLayerDepthTestVARJO.depthTestRangeFarZ has unexpected offset % instead of 20", ((cast(*void)(*instance.depthTestRangeFarZ)) - cast(*void)(*instance)));
    assert(size_of(type_of(CompositionLayerDepthTestVARJO.depthTestRangeFarZ)) == 4, "CompositionLayerDepthTestVARJO.depthTestRangeFarZ has unexpected size % instead of 4", size_of(type_of(CompositionLayerDepthTestVARJO.depthTestRangeFarZ)));
    assert(size_of(CompositionLayerDepthTestVARJO) == 24, "CompositionLayerDepthTestVARJO has size % instead of 24", size_of(CompositionLayerDepthTestVARJO));
}

PFN_xrSetEnvironmentDepthEstimationVARJO :: #type (a0: Session, a1: Bool32) -> Result #c_call;

// XrSystemMarkerTrackingPropertiesVARJO extends XrSystemProperties
SystemMarkerTrackingPropertiesVARJO :: struct {
    type:                   StructureType;
    next:                   *void;
    supportsMarkerTracking: Bool32;
}
#run {
    instance: SystemMarkerTrackingPropertiesVARJO;
    assert(((cast(*void)(*instance.type)) - cast(*void)(*instance)) == 0, "SystemMarkerTrackingPropertiesVARJO.type has unexpected offset % instead of 0", ((cast(*void)(*instance.type)) - cast(*void)(*instance)));
    assert(size_of(type_of(SystemMarkerTrackingPropertiesVARJO.type)) == 4, "SystemMarkerTrackingPropertiesVARJO.type has unexpected size % instead of 4", size_of(type_of(SystemMarkerTrackingPropertiesVARJO.type)));
    assert(((cast(*void)(*instance.next)) - cast(*void)(*instance)) == 8, "SystemMarkerTrackingPropertiesVARJO.next has unexpected offset % instead of 8", ((cast(*void)(*instance.next)) - cast(*void)(*instance)));
    assert(size_of(type_of(SystemMarkerTrackingPropertiesVARJO.next)) == 8, "SystemMarkerTrackingPropertiesVARJO.next has unexpected size % instead of 8", size_of(type_of(SystemMarkerTrackingPropertiesVARJO.next)));
    assert(((cast(*void)(*instance.supportsMarkerTracking)) - cast(*void)(*instance)) == 16, "SystemMarkerTrackingPropertiesVARJO.supportsMarkerTracking has unexpected offset % instead of 16", ((cast(*void)(*instance.supportsMarkerTracking)) - cast(*void)(*instance)));
    assert(size_of(type_of(SystemMarkerTrackingPropertiesVARJO.supportsMarkerTracking)) == 4, "SystemMarkerTrackingPropertiesVARJO.supportsMarkerTracking has unexpected size % instead of 4", size_of(type_of(SystemMarkerTrackingPropertiesVARJO.supportsMarkerTracking)));
    assert(size_of(SystemMarkerTrackingPropertiesVARJO) == 24, "SystemMarkerTrackingPropertiesVARJO has size % instead of 24", size_of(SystemMarkerTrackingPropertiesVARJO));
}

EventDataMarkerTrackingUpdateVARJO :: struct {
    type:        StructureType;
    next:        *void;
    markerId:    u64;
    isActive:    Bool32;
    isPredicted: Bool32;
    time:        Time;
}
#run {
    instance: EventDataMarkerTrackingUpdateVARJO;
    assert(((cast(*void)(*instance.type)) - cast(*void)(*instance)) == 0, "EventDataMarkerTrackingUpdateVARJO.type has unexpected offset % instead of 0", ((cast(*void)(*instance.type)) - cast(*void)(*instance)));
    assert(size_of(type_of(EventDataMarkerTrackingUpdateVARJO.type)) == 4, "EventDataMarkerTrackingUpdateVARJO.type has unexpected size % instead of 4", size_of(type_of(EventDataMarkerTrackingUpdateVARJO.type)));
    assert(((cast(*void)(*instance.next)) - cast(*void)(*instance)) == 8, "EventDataMarkerTrackingUpdateVARJO.next has unexpected offset % instead of 8", ((cast(*void)(*instance.next)) - cast(*void)(*instance)));
    assert(size_of(type_of(EventDataMarkerTrackingUpdateVARJO.next)) == 8, "EventDataMarkerTrackingUpdateVARJO.next has unexpected size % instead of 8", size_of(type_of(EventDataMarkerTrackingUpdateVARJO.next)));
    assert(((cast(*void)(*instance.markerId)) - cast(*void)(*instance)) == 16, "EventDataMarkerTrackingUpdateVARJO.markerId has unexpected offset % instead of 16", ((cast(*void)(*instance.markerId)) - cast(*void)(*instance)));
    assert(size_of(type_of(EventDataMarkerTrackingUpdateVARJO.markerId)) == 8, "EventDataMarkerTrackingUpdateVARJO.markerId has unexpected size % instead of 8", size_of(type_of(EventDataMarkerTrackingUpdateVARJO.markerId)));
    assert(((cast(*void)(*instance.isActive)) - cast(*void)(*instance)) == 24, "EventDataMarkerTrackingUpdateVARJO.isActive has unexpected offset % instead of 24", ((cast(*void)(*instance.isActive)) - cast(*void)(*instance)));
    assert(size_of(type_of(EventDataMarkerTrackingUpdateVARJO.isActive)) == 4, "EventDataMarkerTrackingUpdateVARJO.isActive has unexpected size % instead of 4", size_of(type_of(EventDataMarkerTrackingUpdateVARJO.isActive)));
    assert(((cast(*void)(*instance.isPredicted)) - cast(*void)(*instance)) == 28, "EventDataMarkerTrackingUpdateVARJO.isPredicted has unexpected offset % instead of 28", ((cast(*void)(*instance.isPredicted)) - cast(*void)(*instance)));
    assert(size_of(type_of(EventDataMarkerTrackingUpdateVARJO.isPredicted)) == 4, "EventDataMarkerTrackingUpdateVARJO.isPredicted has unexpected size % instead of 4", size_of(type_of(EventDataMarkerTrackingUpdateVARJO.isPredicted)));
    assert(((cast(*void)(*instance.time)) - cast(*void)(*instance)) == 32, "EventDataMarkerTrackingUpdateVARJO.time has unexpected offset % instead of 32", ((cast(*void)(*instance.time)) - cast(*void)(*instance)));
    assert(size_of(type_of(EventDataMarkerTrackingUpdateVARJO.time)) == 8, "EventDataMarkerTrackingUpdateVARJO.time has unexpected size % instead of 8", size_of(type_of(EventDataMarkerTrackingUpdateVARJO.time)));
    assert(size_of(EventDataMarkerTrackingUpdateVARJO) == 40, "EventDataMarkerTrackingUpdateVARJO has size % instead of 40", size_of(EventDataMarkerTrackingUpdateVARJO));
}

MarkerSpaceCreateInfoVARJO :: struct {
    type:              StructureType;
    next:              *void;
    markerId:          u64;
    poseInMarkerSpace: Posef;
}
#run {
    instance: MarkerSpaceCreateInfoVARJO;
    assert(((cast(*void)(*instance.type)) - cast(*void)(*instance)) == 0, "MarkerSpaceCreateInfoVARJO.type has unexpected offset % instead of 0", ((cast(*void)(*instance.type)) - cast(*void)(*instance)));
    assert(size_of(type_of(MarkerSpaceCreateInfoVARJO.type)) == 4, "MarkerSpaceCreateInfoVARJO.type has unexpected size % instead of 4", size_of(type_of(MarkerSpaceCreateInfoVARJO.type)));
    assert(((cast(*void)(*instance.next)) - cast(*void)(*instance)) == 8, "MarkerSpaceCreateInfoVARJO.next has unexpected offset % instead of 8", ((cast(*void)(*instance.next)) - cast(*void)(*instance)));
    assert(size_of(type_of(MarkerSpaceCreateInfoVARJO.next)) == 8, "MarkerSpaceCreateInfoVARJO.next has unexpected size % instead of 8", size_of(type_of(MarkerSpaceCreateInfoVARJO.next)));
    assert(((cast(*void)(*instance.markerId)) - cast(*void)(*instance)) == 16, "MarkerSpaceCreateInfoVARJO.markerId has unexpected offset % instead of 16", ((cast(*void)(*instance.markerId)) - cast(*void)(*instance)));
    assert(size_of(type_of(MarkerSpaceCreateInfoVARJO.markerId)) == 8, "MarkerSpaceCreateInfoVARJO.markerId has unexpected size % instead of 8", size_of(type_of(MarkerSpaceCreateInfoVARJO.markerId)));
    assert(((cast(*void)(*instance.poseInMarkerSpace)) - cast(*void)(*instance)) == 24, "MarkerSpaceCreateInfoVARJO.poseInMarkerSpace has unexpected offset % instead of 24", ((cast(*void)(*instance.poseInMarkerSpace)) - cast(*void)(*instance)));
    assert(size_of(type_of(MarkerSpaceCreateInfoVARJO.poseInMarkerSpace)) == 28, "MarkerSpaceCreateInfoVARJO.poseInMarkerSpace has unexpected size % instead of 28", size_of(type_of(MarkerSpaceCreateInfoVARJO.poseInMarkerSpace)));
    assert(size_of(MarkerSpaceCreateInfoVARJO) == 56, "MarkerSpaceCreateInfoVARJO has size % instead of 56", size_of(MarkerSpaceCreateInfoVARJO));
}

PFN_xrSetMarkerTrackingVARJO :: #type (a0: Session, a1: Bool32) -> Result #c_call;
PFN_xrSetMarkerTrackingTimeoutVARJO :: #type (a0: Session, a1: u64, a2: Duration) -> Result #c_call;
PFN_xrSetMarkerTrackingPredictionVARJO :: #type (a0: Session, a1: u64, a2: Bool32) -> Result #c_call;
PFN_xrGetMarkerSizeVARJO :: #type (a0: Session, a1: u64, a2: *Extent2Df) -> Result #c_call;
PFN_xrCreateMarkerSpaceVARJO :: #type (a0: Session, a1: *MarkerSpaceCreateInfoVARJO, a2: *Space) -> Result #c_call;

PFN_xrSetViewOffsetVARJO :: #type (a0: Session, a1: float) -> Result #c_call;

SpatialAnchorStoreConnectionMSFT_T :: struct {}
SpatialAnchorStoreConnectionMSFT :: *SpatialAnchorStoreConnectionMSFT_T;

SpatialAnchorPersistenceNameMSFT :: struct {
    name: [256] u8;
}
#run {
    instance: SpatialAnchorPersistenceNameMSFT;
    assert(((cast(*void)(*instance.name)) - cast(*void)(*instance)) == 0, "SpatialAnchorPersistenceNameMSFT.name has unexpected offset % instead of 0", ((cast(*void)(*instance.name)) - cast(*void)(*instance)));
    assert(size_of(type_of(SpatialAnchorPersistenceNameMSFT.name)) == 256, "SpatialAnchorPersistenceNameMSFT.name has unexpected size % instead of 256", size_of(type_of(SpatialAnchorPersistenceNameMSFT.name)));
    assert(size_of(SpatialAnchorPersistenceNameMSFT) == 256, "SpatialAnchorPersistenceNameMSFT has size % instead of 256", size_of(SpatialAnchorPersistenceNameMSFT));
}

SpatialAnchorPersistenceInfoMSFT :: struct {
    type:                         StructureType;
    next:                         *void;
    spatialAnchorPersistenceName: SpatialAnchorPersistenceNameMSFT;
    spatialAnchor:                SpatialAnchorMSFT;
}
#run {
    instance: SpatialAnchorPersistenceInfoMSFT;
    assert(((cast(*void)(*instance.type)) - cast(*void)(*instance)) == 0, "SpatialAnchorPersistenceInfoMSFT.type has unexpected offset % instead of 0", ((cast(*void)(*instance.type)) - cast(*void)(*instance)));
    assert(size_of(type_of(SpatialAnchorPersistenceInfoMSFT.type)) == 4, "SpatialAnchorPersistenceInfoMSFT.type has unexpected size % instead of 4", size_of(type_of(SpatialAnchorPersistenceInfoMSFT.type)));
    assert(((cast(*void)(*instance.next)) - cast(*void)(*instance)) == 8, "SpatialAnchorPersistenceInfoMSFT.next has unexpected offset % instead of 8", ((cast(*void)(*instance.next)) - cast(*void)(*instance)));
    assert(size_of(type_of(SpatialAnchorPersistenceInfoMSFT.next)) == 8, "SpatialAnchorPersistenceInfoMSFT.next has unexpected size % instead of 8", size_of(type_of(SpatialAnchorPersistenceInfoMSFT.next)));
    assert(((cast(*void)(*instance.spatialAnchorPersistenceName)) - cast(*void)(*instance)) == 16, "SpatialAnchorPersistenceInfoMSFT.spatialAnchorPersistenceName has unexpected offset % instead of 16", ((cast(*void)(*instance.spatialAnchorPersistenceName)) - cast(*void)(*instance)));
    assert(size_of(type_of(SpatialAnchorPersistenceInfoMSFT.spatialAnchorPersistenceName)) == 256, "SpatialAnchorPersistenceInfoMSFT.spatialAnchorPersistenceName has unexpected size % instead of 256", size_of(type_of(SpatialAnchorPersistenceInfoMSFT.spatialAnchorPersistenceName)));
    assert(((cast(*void)(*instance.spatialAnchor)) - cast(*void)(*instance)) == 272, "SpatialAnchorPersistenceInfoMSFT.spatialAnchor has unexpected offset % instead of 272", ((cast(*void)(*instance.spatialAnchor)) - cast(*void)(*instance)));
    assert(size_of(type_of(SpatialAnchorPersistenceInfoMSFT.spatialAnchor)) == 8, "SpatialAnchorPersistenceInfoMSFT.spatialAnchor has unexpected size % instead of 8", size_of(type_of(SpatialAnchorPersistenceInfoMSFT.spatialAnchor)));
    assert(size_of(SpatialAnchorPersistenceInfoMSFT) == 280, "SpatialAnchorPersistenceInfoMSFT has size % instead of 280", size_of(SpatialAnchorPersistenceInfoMSFT));
}

SpatialAnchorFromPersistedAnchorCreateInfoMSFT :: struct {
    type:                         StructureType;
    next:                         *void;
    spatialAnchorStore:           SpatialAnchorStoreConnectionMSFT;
    spatialAnchorPersistenceName: SpatialAnchorPersistenceNameMSFT;
}
#run {
    instance: SpatialAnchorFromPersistedAnchorCreateInfoMSFT;
    assert(((cast(*void)(*instance.type)) - cast(*void)(*instance)) == 0, "SpatialAnchorFromPersistedAnchorCreateInfoMSFT.type has unexpected offset % instead of 0", ((cast(*void)(*instance.type)) - cast(*void)(*instance)));
    assert(size_of(type_of(SpatialAnchorFromPersistedAnchorCreateInfoMSFT.type)) == 4, "SpatialAnchorFromPersistedAnchorCreateInfoMSFT.type has unexpected size % instead of 4", size_of(type_of(SpatialAnchorFromPersistedAnchorCreateInfoMSFT.type)));
    assert(((cast(*void)(*instance.next)) - cast(*void)(*instance)) == 8, "SpatialAnchorFromPersistedAnchorCreateInfoMSFT.next has unexpected offset % instead of 8", ((cast(*void)(*instance.next)) - cast(*void)(*instance)));
    assert(size_of(type_of(SpatialAnchorFromPersistedAnchorCreateInfoMSFT.next)) == 8, "SpatialAnchorFromPersistedAnchorCreateInfoMSFT.next has unexpected size % instead of 8", size_of(type_of(SpatialAnchorFromPersistedAnchorCreateInfoMSFT.next)));
    assert(((cast(*void)(*instance.spatialAnchorStore)) - cast(*void)(*instance)) == 16, "SpatialAnchorFromPersistedAnchorCreateInfoMSFT.spatialAnchorStore has unexpected offset % instead of 16", ((cast(*void)(*instance.spatialAnchorStore)) - cast(*void)(*instance)));
    assert(size_of(type_of(SpatialAnchorFromPersistedAnchorCreateInfoMSFT.spatialAnchorStore)) == 8, "SpatialAnchorFromPersistedAnchorCreateInfoMSFT.spatialAnchorStore has unexpected size % instead of 8", size_of(type_of(SpatialAnchorFromPersistedAnchorCreateInfoMSFT.spatialAnchorStore)));
    assert(((cast(*void)(*instance.spatialAnchorPersistenceName)) - cast(*void)(*instance)) == 24, "SpatialAnchorFromPersistedAnchorCreateInfoMSFT.spatialAnchorPersistenceName has unexpected offset % instead of 24", ((cast(*void)(*instance.spatialAnchorPersistenceName)) - cast(*void)(*instance)));
    assert(size_of(type_of(SpatialAnchorFromPersistedAnchorCreateInfoMSFT.spatialAnchorPersistenceName)) == 256, "SpatialAnchorFromPersistedAnchorCreateInfoMSFT.spatialAnchorPersistenceName has unexpected size % instead of 256", size_of(type_of(SpatialAnchorFromPersistedAnchorCreateInfoMSFT.spatialAnchorPersistenceName)));
    assert(size_of(SpatialAnchorFromPersistedAnchorCreateInfoMSFT) == 280, "SpatialAnchorFromPersistedAnchorCreateInfoMSFT has size % instead of 280", size_of(SpatialAnchorFromPersistedAnchorCreateInfoMSFT));
}

PFN_xrCreateSpatialAnchorStoreConnectionMSFT :: #type (a0: Session, a1: *SpatialAnchorStoreConnectionMSFT) -> Result #c_call;
PFN_xrDestroySpatialAnchorStoreConnectionMSFT :: #type (a0: SpatialAnchorStoreConnectionMSFT) -> Result #c_call;
PFN_xrPersistSpatialAnchorMSFT :: #type (a0: SpatialAnchorStoreConnectionMSFT, a1: *SpatialAnchorPersistenceInfoMSFT) -> Result #c_call;
PFN_xrEnumeratePersistedSpatialAnchorNamesMSFT :: #type (a0: SpatialAnchorStoreConnectionMSFT, a1: u32, a2: *u32, a3: *SpatialAnchorPersistenceNameMSFT) -> Result #c_call;
PFN_xrCreateSpatialAnchorFromPersistedNameMSFT :: #type (a0: Session, a1: *SpatialAnchorFromPersistedAnchorCreateInfoMSFT, a2: *SpatialAnchorMSFT) -> Result #c_call;
PFN_xrUnpersistSpatialAnchorMSFT :: #type (a0: SpatialAnchorStoreConnectionMSFT, a1: *SpatialAnchorPersistenceNameMSFT) -> Result #c_call;
PFN_xrClearSpatialAnchorStoreMSFT :: #type (a0: SpatialAnchorStoreConnectionMSFT) -> Result #c_call;

HandForearmJointULTRALEAP :: enum s32 {
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

SpaceQueryActionFB :: enum s32 {
    LOAD_FB     :: 0;
    MAX_ENUM_FB :: 2147483647;

    XR_SPACE_QUERY_ACTION_LOAD_FB     :: LOAD_FB;
    XR_SPACE_QUERY_ACTION_MAX_ENUM_FB :: MAX_ENUM_FB;
}

SpaceStorageLocationFB :: enum s32 {
    INVALID_FB  :: 0;
    LOCAL_FB    :: 1;
    MAX_ENUM_FB :: 2147483647;

    XR_SPACE_STORAGE_LOCATION_INVALID_FB  :: INVALID_FB;
    XR_SPACE_STORAGE_LOCATION_LOCAL_FB    :: LOCAL_FB;
    XR_SPACE_STORAGE_LOCATION_MAX_ENUM_FB :: MAX_ENUM_FB;
}

SpaceQueryInfoBaseHeaderFB :: struct {
    type: StructureType;
    next: *void;
}
#run {
    instance: SpaceQueryInfoBaseHeaderFB;
    assert(((cast(*void)(*instance.type)) - cast(*void)(*instance)) == 0, "SpaceQueryInfoBaseHeaderFB.type has unexpected offset % instead of 0", ((cast(*void)(*instance.type)) - cast(*void)(*instance)));
    assert(size_of(type_of(SpaceQueryInfoBaseHeaderFB.type)) == 4, "SpaceQueryInfoBaseHeaderFB.type has unexpected size % instead of 4", size_of(type_of(SpaceQueryInfoBaseHeaderFB.type)));
    assert(((cast(*void)(*instance.next)) - cast(*void)(*instance)) == 8, "SpaceQueryInfoBaseHeaderFB.next has unexpected offset % instead of 8", ((cast(*void)(*instance.next)) - cast(*void)(*instance)));
    assert(size_of(type_of(SpaceQueryInfoBaseHeaderFB.next)) == 8, "SpaceQueryInfoBaseHeaderFB.next has unexpected size % instead of 8", size_of(type_of(SpaceQueryInfoBaseHeaderFB.next)));
    assert(size_of(SpaceQueryInfoBaseHeaderFB) == 16, "SpaceQueryInfoBaseHeaderFB has size % instead of 16", size_of(SpaceQueryInfoBaseHeaderFB));
}

SpaceFilterInfoBaseHeaderFB :: struct {
    type: StructureType;
    next: *void;
}
#run {
    instance: SpaceFilterInfoBaseHeaderFB;
    assert(((cast(*void)(*instance.type)) - cast(*void)(*instance)) == 0, "SpaceFilterInfoBaseHeaderFB.type has unexpected offset % instead of 0", ((cast(*void)(*instance.type)) - cast(*void)(*instance)));
    assert(size_of(type_of(SpaceFilterInfoBaseHeaderFB.type)) == 4, "SpaceFilterInfoBaseHeaderFB.type has unexpected size % instead of 4", size_of(type_of(SpaceFilterInfoBaseHeaderFB.type)));
    assert(((cast(*void)(*instance.next)) - cast(*void)(*instance)) == 8, "SpaceFilterInfoBaseHeaderFB.next has unexpected offset % instead of 8", ((cast(*void)(*instance.next)) - cast(*void)(*instance)));
    assert(size_of(type_of(SpaceFilterInfoBaseHeaderFB.next)) == 8, "SpaceFilterInfoBaseHeaderFB.next has unexpected size % instead of 8", size_of(type_of(SpaceFilterInfoBaseHeaderFB.next)));
    assert(size_of(SpaceFilterInfoBaseHeaderFB) == 16, "SpaceFilterInfoBaseHeaderFB has size % instead of 16", size_of(SpaceFilterInfoBaseHeaderFB));
}

SpaceQueryInfoFB :: struct {
    type:           StructureType;
    next:           *void;
    queryAction:    SpaceQueryActionFB;
    maxResultCount: u32;
    timeout:        Duration;
    filter:         *SpaceFilterInfoBaseHeaderFB;
    excludeFilter:  *SpaceFilterInfoBaseHeaderFB;
}
#run {
    instance: SpaceQueryInfoFB;
    assert(((cast(*void)(*instance.type)) - cast(*void)(*instance)) == 0, "SpaceQueryInfoFB.type has unexpected offset % instead of 0", ((cast(*void)(*instance.type)) - cast(*void)(*instance)));
    assert(size_of(type_of(SpaceQueryInfoFB.type)) == 4, "SpaceQueryInfoFB.type has unexpected size % instead of 4", size_of(type_of(SpaceQueryInfoFB.type)));
    assert(((cast(*void)(*instance.next)) - cast(*void)(*instance)) == 8, "SpaceQueryInfoFB.next has unexpected offset % instead of 8", ((cast(*void)(*instance.next)) - cast(*void)(*instance)));
    assert(size_of(type_of(SpaceQueryInfoFB.next)) == 8, "SpaceQueryInfoFB.next has unexpected size % instead of 8", size_of(type_of(SpaceQueryInfoFB.next)));
    assert(((cast(*void)(*instance.queryAction)) - cast(*void)(*instance)) == 16, "SpaceQueryInfoFB.queryAction has unexpected offset % instead of 16", ((cast(*void)(*instance.queryAction)) - cast(*void)(*instance)));
    assert(size_of(type_of(SpaceQueryInfoFB.queryAction)) == 4, "SpaceQueryInfoFB.queryAction has unexpected size % instead of 4", size_of(type_of(SpaceQueryInfoFB.queryAction)));
    assert(((cast(*void)(*instance.maxResultCount)) - cast(*void)(*instance)) == 20, "SpaceQueryInfoFB.maxResultCount has unexpected offset % instead of 20", ((cast(*void)(*instance.maxResultCount)) - cast(*void)(*instance)));
    assert(size_of(type_of(SpaceQueryInfoFB.maxResultCount)) == 4, "SpaceQueryInfoFB.maxResultCount has unexpected size % instead of 4", size_of(type_of(SpaceQueryInfoFB.maxResultCount)));
    assert(((cast(*void)(*instance.timeout)) - cast(*void)(*instance)) == 24, "SpaceQueryInfoFB.timeout has unexpected offset % instead of 24", ((cast(*void)(*instance.timeout)) - cast(*void)(*instance)));
    assert(size_of(type_of(SpaceQueryInfoFB.timeout)) == 8, "SpaceQueryInfoFB.timeout has unexpected size % instead of 8", size_of(type_of(SpaceQueryInfoFB.timeout)));
    assert(((cast(*void)(*instance.filter)) - cast(*void)(*instance)) == 32, "SpaceQueryInfoFB.filter has unexpected offset % instead of 32", ((cast(*void)(*instance.filter)) - cast(*void)(*instance)));
    assert(size_of(type_of(SpaceQueryInfoFB.filter)) == 8, "SpaceQueryInfoFB.filter has unexpected size % instead of 8", size_of(type_of(SpaceQueryInfoFB.filter)));
    assert(((cast(*void)(*instance.excludeFilter)) - cast(*void)(*instance)) == 40, "SpaceQueryInfoFB.excludeFilter has unexpected offset % instead of 40", ((cast(*void)(*instance.excludeFilter)) - cast(*void)(*instance)));
    assert(size_of(type_of(SpaceQueryInfoFB.excludeFilter)) == 8, "SpaceQueryInfoFB.excludeFilter has unexpected size % instead of 8", size_of(type_of(SpaceQueryInfoFB.excludeFilter)));
    assert(size_of(SpaceQueryInfoFB) == 48, "SpaceQueryInfoFB has size % instead of 48", size_of(SpaceQueryInfoFB));
}

// XrSpaceStorageLocationFilterInfoFB extends XrSpaceFilterInfoBaseHeaderFB
SpaceStorageLocationFilterInfoFB :: struct {
    type:     StructureType;
    next:     *void;
    location: SpaceStorageLocationFB;
}
#run {
    instance: SpaceStorageLocationFilterInfoFB;
    assert(((cast(*void)(*instance.type)) - cast(*void)(*instance)) == 0, "SpaceStorageLocationFilterInfoFB.type has unexpected offset % instead of 0", ((cast(*void)(*instance.type)) - cast(*void)(*instance)));
    assert(size_of(type_of(SpaceStorageLocationFilterInfoFB.type)) == 4, "SpaceStorageLocationFilterInfoFB.type has unexpected size % instead of 4", size_of(type_of(SpaceStorageLocationFilterInfoFB.type)));
    assert(((cast(*void)(*instance.next)) - cast(*void)(*instance)) == 8, "SpaceStorageLocationFilterInfoFB.next has unexpected offset % instead of 8", ((cast(*void)(*instance.next)) - cast(*void)(*instance)));
    assert(size_of(type_of(SpaceStorageLocationFilterInfoFB.next)) == 8, "SpaceStorageLocationFilterInfoFB.next has unexpected size % instead of 8", size_of(type_of(SpaceStorageLocationFilterInfoFB.next)));
    assert(((cast(*void)(*instance.location)) - cast(*void)(*instance)) == 16, "SpaceStorageLocationFilterInfoFB.location has unexpected offset % instead of 16", ((cast(*void)(*instance.location)) - cast(*void)(*instance)));
    assert(size_of(type_of(SpaceStorageLocationFilterInfoFB.location)) == 4, "SpaceStorageLocationFilterInfoFB.location has unexpected size % instead of 4", size_of(type_of(SpaceStorageLocationFilterInfoFB.location)));
    assert(size_of(SpaceStorageLocationFilterInfoFB) == 24, "SpaceStorageLocationFilterInfoFB has size % instead of 24", size_of(SpaceStorageLocationFilterInfoFB));
}

SpaceUuidFilterInfoFB :: struct {
    type:      StructureType;
    next:      *void;
    uuidCount: u32;
    uuids:     *UuidEXT;
}
#run {
    instance: SpaceUuidFilterInfoFB;
    assert(((cast(*void)(*instance.type)) - cast(*void)(*instance)) == 0, "SpaceUuidFilterInfoFB.type has unexpected offset % instead of 0", ((cast(*void)(*instance.type)) - cast(*void)(*instance)));
    assert(size_of(type_of(SpaceUuidFilterInfoFB.type)) == 4, "SpaceUuidFilterInfoFB.type has unexpected size % instead of 4", size_of(type_of(SpaceUuidFilterInfoFB.type)));
    assert(((cast(*void)(*instance.next)) - cast(*void)(*instance)) == 8, "SpaceUuidFilterInfoFB.next has unexpected offset % instead of 8", ((cast(*void)(*instance.next)) - cast(*void)(*instance)));
    assert(size_of(type_of(SpaceUuidFilterInfoFB.next)) == 8, "SpaceUuidFilterInfoFB.next has unexpected size % instead of 8", size_of(type_of(SpaceUuidFilterInfoFB.next)));
    assert(((cast(*void)(*instance.uuidCount)) - cast(*void)(*instance)) == 16, "SpaceUuidFilterInfoFB.uuidCount has unexpected offset % instead of 16", ((cast(*void)(*instance.uuidCount)) - cast(*void)(*instance)));
    assert(size_of(type_of(SpaceUuidFilterInfoFB.uuidCount)) == 4, "SpaceUuidFilterInfoFB.uuidCount has unexpected size % instead of 4", size_of(type_of(SpaceUuidFilterInfoFB.uuidCount)));
    assert(((cast(*void)(*instance.uuids)) - cast(*void)(*instance)) == 24, "SpaceUuidFilterInfoFB.uuids has unexpected offset % instead of 24", ((cast(*void)(*instance.uuids)) - cast(*void)(*instance)));
    assert(size_of(type_of(SpaceUuidFilterInfoFB.uuids)) == 8, "SpaceUuidFilterInfoFB.uuids has unexpected size % instead of 8", size_of(type_of(SpaceUuidFilterInfoFB.uuids)));
    assert(size_of(SpaceUuidFilterInfoFB) == 32, "SpaceUuidFilterInfoFB has size % instead of 32", size_of(SpaceUuidFilterInfoFB));
}

SpaceComponentFilterInfoFB :: struct {
    type:          StructureType;
    next:          *void;
    componentType: SpaceComponentTypeFB;
}
#run {
    instance: SpaceComponentFilterInfoFB;
    assert(((cast(*void)(*instance.type)) - cast(*void)(*instance)) == 0, "SpaceComponentFilterInfoFB.type has unexpected offset % instead of 0", ((cast(*void)(*instance.type)) - cast(*void)(*instance)));
    assert(size_of(type_of(SpaceComponentFilterInfoFB.type)) == 4, "SpaceComponentFilterInfoFB.type has unexpected size % instead of 4", size_of(type_of(SpaceComponentFilterInfoFB.type)));
    assert(((cast(*void)(*instance.next)) - cast(*void)(*instance)) == 8, "SpaceComponentFilterInfoFB.next has unexpected offset % instead of 8", ((cast(*void)(*instance.next)) - cast(*void)(*instance)));
    assert(size_of(type_of(SpaceComponentFilterInfoFB.next)) == 8, "SpaceComponentFilterInfoFB.next has unexpected size % instead of 8", size_of(type_of(SpaceComponentFilterInfoFB.next)));
    assert(((cast(*void)(*instance.componentType)) - cast(*void)(*instance)) == 16, "SpaceComponentFilterInfoFB.componentType has unexpected offset % instead of 16", ((cast(*void)(*instance.componentType)) - cast(*void)(*instance)));
    assert(size_of(type_of(SpaceComponentFilterInfoFB.componentType)) == 4, "SpaceComponentFilterInfoFB.componentType has unexpected size % instead of 4", size_of(type_of(SpaceComponentFilterInfoFB.componentType)));
    assert(size_of(SpaceComponentFilterInfoFB) == 24, "SpaceComponentFilterInfoFB has size % instead of 24", size_of(SpaceComponentFilterInfoFB));
}

SpaceQueryResultFB :: struct {
    space: Space;
    uuid:  UuidEXT;
}
#run {
    instance: SpaceQueryResultFB;
    assert(((cast(*void)(*instance.space)) - cast(*void)(*instance)) == 0, "SpaceQueryResultFB.space has unexpected offset % instead of 0", ((cast(*void)(*instance.space)) - cast(*void)(*instance)));
    assert(size_of(type_of(SpaceQueryResultFB.space)) == 8, "SpaceQueryResultFB.space has unexpected size % instead of 8", size_of(type_of(SpaceQueryResultFB.space)));
    assert(((cast(*void)(*instance.uuid)) - cast(*void)(*instance)) == 8, "SpaceQueryResultFB.uuid has unexpected offset % instead of 8", ((cast(*void)(*instance.uuid)) - cast(*void)(*instance)));
    assert(size_of(type_of(SpaceQueryResultFB.uuid)) == 16, "SpaceQueryResultFB.uuid has unexpected size % instead of 16", size_of(type_of(SpaceQueryResultFB.uuid)));
    assert(size_of(SpaceQueryResultFB) == 24, "SpaceQueryResultFB has size % instead of 24", size_of(SpaceQueryResultFB));
}

SpaceQueryResultsFB :: struct {
    type:                StructureType;
    next:                *void;
    resultCapacityInput: u32;
    resultCountOutput:   u32;
    results:             *SpaceQueryResultFB;
}
#run {
    instance: SpaceQueryResultsFB;
    assert(((cast(*void)(*instance.type)) - cast(*void)(*instance)) == 0, "SpaceQueryResultsFB.type has unexpected offset % instead of 0", ((cast(*void)(*instance.type)) - cast(*void)(*instance)));
    assert(size_of(type_of(SpaceQueryResultsFB.type)) == 4, "SpaceQueryResultsFB.type has unexpected size % instead of 4", size_of(type_of(SpaceQueryResultsFB.type)));
    assert(((cast(*void)(*instance.next)) - cast(*void)(*instance)) == 8, "SpaceQueryResultsFB.next has unexpected offset % instead of 8", ((cast(*void)(*instance.next)) - cast(*void)(*instance)));
    assert(size_of(type_of(SpaceQueryResultsFB.next)) == 8, "SpaceQueryResultsFB.next has unexpected size % instead of 8", size_of(type_of(SpaceQueryResultsFB.next)));
    assert(((cast(*void)(*instance.resultCapacityInput)) - cast(*void)(*instance)) == 16, "SpaceQueryResultsFB.resultCapacityInput has unexpected offset % instead of 16", ((cast(*void)(*instance.resultCapacityInput)) - cast(*void)(*instance)));
    assert(size_of(type_of(SpaceQueryResultsFB.resultCapacityInput)) == 4, "SpaceQueryResultsFB.resultCapacityInput has unexpected size % instead of 4", size_of(type_of(SpaceQueryResultsFB.resultCapacityInput)));
    assert(((cast(*void)(*instance.resultCountOutput)) - cast(*void)(*instance)) == 20, "SpaceQueryResultsFB.resultCountOutput has unexpected offset % instead of 20", ((cast(*void)(*instance.resultCountOutput)) - cast(*void)(*instance)));
    assert(size_of(type_of(SpaceQueryResultsFB.resultCountOutput)) == 4, "SpaceQueryResultsFB.resultCountOutput has unexpected size % instead of 4", size_of(type_of(SpaceQueryResultsFB.resultCountOutput)));
    assert(((cast(*void)(*instance.results)) - cast(*void)(*instance)) == 24, "SpaceQueryResultsFB.results has unexpected offset % instead of 24", ((cast(*void)(*instance.results)) - cast(*void)(*instance)));
    assert(size_of(type_of(SpaceQueryResultsFB.results)) == 8, "SpaceQueryResultsFB.results has unexpected size % instead of 8", size_of(type_of(SpaceQueryResultsFB.results)));
    assert(size_of(SpaceQueryResultsFB) == 32, "SpaceQueryResultsFB has size % instead of 32", size_of(SpaceQueryResultsFB));
}

EventDataSpaceQueryResultsAvailableFB :: struct {
    type:      StructureType;
    next:      *void;
    requestId: AsyncRequestIdFB;
}
#run {
    instance: EventDataSpaceQueryResultsAvailableFB;
    assert(((cast(*void)(*instance.type)) - cast(*void)(*instance)) == 0, "EventDataSpaceQueryResultsAvailableFB.type has unexpected offset % instead of 0", ((cast(*void)(*instance.type)) - cast(*void)(*instance)));
    assert(size_of(type_of(EventDataSpaceQueryResultsAvailableFB.type)) == 4, "EventDataSpaceQueryResultsAvailableFB.type has unexpected size % instead of 4", size_of(type_of(EventDataSpaceQueryResultsAvailableFB.type)));
    assert(((cast(*void)(*instance.next)) - cast(*void)(*instance)) == 8, "EventDataSpaceQueryResultsAvailableFB.next has unexpected offset % instead of 8", ((cast(*void)(*instance.next)) - cast(*void)(*instance)));
    assert(size_of(type_of(EventDataSpaceQueryResultsAvailableFB.next)) == 8, "EventDataSpaceQueryResultsAvailableFB.next has unexpected size % instead of 8", size_of(type_of(EventDataSpaceQueryResultsAvailableFB.next)));
    assert(((cast(*void)(*instance.requestId)) - cast(*void)(*instance)) == 16, "EventDataSpaceQueryResultsAvailableFB.requestId has unexpected offset % instead of 16", ((cast(*void)(*instance.requestId)) - cast(*void)(*instance)));
    assert(size_of(type_of(EventDataSpaceQueryResultsAvailableFB.requestId)) == 8, "EventDataSpaceQueryResultsAvailableFB.requestId has unexpected size % instead of 8", size_of(type_of(EventDataSpaceQueryResultsAvailableFB.requestId)));
    assert(size_of(EventDataSpaceQueryResultsAvailableFB) == 24, "EventDataSpaceQueryResultsAvailableFB has size % instead of 24", size_of(EventDataSpaceQueryResultsAvailableFB));
}

EventDataSpaceQueryCompleteFB :: struct {
    type:      StructureType;
    next:      *void;
    requestId: AsyncRequestIdFB;
    result:    Result;
}
#run {
    instance: EventDataSpaceQueryCompleteFB;
    assert(((cast(*void)(*instance.type)) - cast(*void)(*instance)) == 0, "EventDataSpaceQueryCompleteFB.type has unexpected offset % instead of 0", ((cast(*void)(*instance.type)) - cast(*void)(*instance)));
    assert(size_of(type_of(EventDataSpaceQueryCompleteFB.type)) == 4, "EventDataSpaceQueryCompleteFB.type has unexpected size % instead of 4", size_of(type_of(EventDataSpaceQueryCompleteFB.type)));
    assert(((cast(*void)(*instance.next)) - cast(*void)(*instance)) == 8, "EventDataSpaceQueryCompleteFB.next has unexpected offset % instead of 8", ((cast(*void)(*instance.next)) - cast(*void)(*instance)));
    assert(size_of(type_of(EventDataSpaceQueryCompleteFB.next)) == 8, "EventDataSpaceQueryCompleteFB.next has unexpected size % instead of 8", size_of(type_of(EventDataSpaceQueryCompleteFB.next)));
    assert(((cast(*void)(*instance.requestId)) - cast(*void)(*instance)) == 16, "EventDataSpaceQueryCompleteFB.requestId has unexpected offset % instead of 16", ((cast(*void)(*instance.requestId)) - cast(*void)(*instance)));
    assert(size_of(type_of(EventDataSpaceQueryCompleteFB.requestId)) == 8, "EventDataSpaceQueryCompleteFB.requestId has unexpected size % instead of 8", size_of(type_of(EventDataSpaceQueryCompleteFB.requestId)));
    assert(((cast(*void)(*instance.result)) - cast(*void)(*instance)) == 24, "EventDataSpaceQueryCompleteFB.result has unexpected offset % instead of 24", ((cast(*void)(*instance.result)) - cast(*void)(*instance)));
    assert(size_of(type_of(EventDataSpaceQueryCompleteFB.result)) == 4, "EventDataSpaceQueryCompleteFB.result has unexpected size % instead of 4", size_of(type_of(EventDataSpaceQueryCompleteFB.result)));
    assert(size_of(EventDataSpaceQueryCompleteFB) == 32, "EventDataSpaceQueryCompleteFB has size % instead of 32", size_of(EventDataSpaceQueryCompleteFB));
}

PFN_xrQuerySpacesFB :: #type (a0: Session, a1: *SpaceQueryInfoBaseHeaderFB, a2: *AsyncRequestIdFB) -> Result #c_call;
PFN_xrRetrieveSpaceQueryResultsFB :: #type (a0: Session, a1: AsyncRequestIdFB, a2: *SpaceQueryResultsFB) -> Result #c_call;

SpacePersistenceModeFB :: enum s32 {
    INVALID_FB    :: 0;
    INDEFINITE_FB :: 1;
    MAX_ENUM_FB   :: 2147483647;

    XR_SPACE_PERSISTENCE_MODE_INVALID_FB    :: INVALID_FB;
    XR_SPACE_PERSISTENCE_MODE_INDEFINITE_FB :: INDEFINITE_FB;
    XR_SPACE_PERSISTENCE_MODE_MAX_ENUM_FB   :: MAX_ENUM_FB;
}

SpaceSaveInfoFB :: struct {
    type:            StructureType;
    next:            *void;
    space:           Space;
    location:        SpaceStorageLocationFB;
    persistenceMode: SpacePersistenceModeFB;
}
#run {
    instance: SpaceSaveInfoFB;
    assert(((cast(*void)(*instance.type)) - cast(*void)(*instance)) == 0, "SpaceSaveInfoFB.type has unexpected offset % instead of 0", ((cast(*void)(*instance.type)) - cast(*void)(*instance)));
    assert(size_of(type_of(SpaceSaveInfoFB.type)) == 4, "SpaceSaveInfoFB.type has unexpected size % instead of 4", size_of(type_of(SpaceSaveInfoFB.type)));
    assert(((cast(*void)(*instance.next)) - cast(*void)(*instance)) == 8, "SpaceSaveInfoFB.next has unexpected offset % instead of 8", ((cast(*void)(*instance.next)) - cast(*void)(*instance)));
    assert(size_of(type_of(SpaceSaveInfoFB.next)) == 8, "SpaceSaveInfoFB.next has unexpected size % instead of 8", size_of(type_of(SpaceSaveInfoFB.next)));
    assert(((cast(*void)(*instance.space)) - cast(*void)(*instance)) == 16, "SpaceSaveInfoFB.space has unexpected offset % instead of 16", ((cast(*void)(*instance.space)) - cast(*void)(*instance)));
    assert(size_of(type_of(SpaceSaveInfoFB.space)) == 8, "SpaceSaveInfoFB.space has unexpected size % instead of 8", size_of(type_of(SpaceSaveInfoFB.space)));
    assert(((cast(*void)(*instance.location)) - cast(*void)(*instance)) == 24, "SpaceSaveInfoFB.location has unexpected offset % instead of 24", ((cast(*void)(*instance.location)) - cast(*void)(*instance)));
    assert(size_of(type_of(SpaceSaveInfoFB.location)) == 4, "SpaceSaveInfoFB.location has unexpected size % instead of 4", size_of(type_of(SpaceSaveInfoFB.location)));
    assert(((cast(*void)(*instance.persistenceMode)) - cast(*void)(*instance)) == 28, "SpaceSaveInfoFB.persistenceMode has unexpected offset % instead of 28", ((cast(*void)(*instance.persistenceMode)) - cast(*void)(*instance)));
    assert(size_of(type_of(SpaceSaveInfoFB.persistenceMode)) == 4, "SpaceSaveInfoFB.persistenceMode has unexpected size % instead of 4", size_of(type_of(SpaceSaveInfoFB.persistenceMode)));
    assert(size_of(SpaceSaveInfoFB) == 32, "SpaceSaveInfoFB has size % instead of 32", size_of(SpaceSaveInfoFB));
}

SpaceEraseInfoFB :: struct {
    type:     StructureType;
    next:     *void;
    space:    Space;
    location: SpaceStorageLocationFB;
}
#run {
    instance: SpaceEraseInfoFB;
    assert(((cast(*void)(*instance.type)) - cast(*void)(*instance)) == 0, "SpaceEraseInfoFB.type has unexpected offset % instead of 0", ((cast(*void)(*instance.type)) - cast(*void)(*instance)));
    assert(size_of(type_of(SpaceEraseInfoFB.type)) == 4, "SpaceEraseInfoFB.type has unexpected size % instead of 4", size_of(type_of(SpaceEraseInfoFB.type)));
    assert(((cast(*void)(*instance.next)) - cast(*void)(*instance)) == 8, "SpaceEraseInfoFB.next has unexpected offset % instead of 8", ((cast(*void)(*instance.next)) - cast(*void)(*instance)));
    assert(size_of(type_of(SpaceEraseInfoFB.next)) == 8, "SpaceEraseInfoFB.next has unexpected size % instead of 8", size_of(type_of(SpaceEraseInfoFB.next)));
    assert(((cast(*void)(*instance.space)) - cast(*void)(*instance)) == 16, "SpaceEraseInfoFB.space has unexpected offset % instead of 16", ((cast(*void)(*instance.space)) - cast(*void)(*instance)));
    assert(size_of(type_of(SpaceEraseInfoFB.space)) == 8, "SpaceEraseInfoFB.space has unexpected size % instead of 8", size_of(type_of(SpaceEraseInfoFB.space)));
    assert(((cast(*void)(*instance.location)) - cast(*void)(*instance)) == 24, "SpaceEraseInfoFB.location has unexpected offset % instead of 24", ((cast(*void)(*instance.location)) - cast(*void)(*instance)));
    assert(size_of(type_of(SpaceEraseInfoFB.location)) == 4, "SpaceEraseInfoFB.location has unexpected size % instead of 4", size_of(type_of(SpaceEraseInfoFB.location)));
    assert(size_of(SpaceEraseInfoFB) == 32, "SpaceEraseInfoFB has size % instead of 32", size_of(SpaceEraseInfoFB));
}

EventDataSpaceSaveCompleteFB :: struct {
    type:      StructureType;
    next:      *void;
    requestId: AsyncRequestIdFB;
    result:    Result;
    space:     Space;
    uuid:      UuidEXT;
    location:  SpaceStorageLocationFB;
}
#run {
    instance: EventDataSpaceSaveCompleteFB;
    assert(((cast(*void)(*instance.type)) - cast(*void)(*instance)) == 0, "EventDataSpaceSaveCompleteFB.type has unexpected offset % instead of 0", ((cast(*void)(*instance.type)) - cast(*void)(*instance)));
    assert(size_of(type_of(EventDataSpaceSaveCompleteFB.type)) == 4, "EventDataSpaceSaveCompleteFB.type has unexpected size % instead of 4", size_of(type_of(EventDataSpaceSaveCompleteFB.type)));
    assert(((cast(*void)(*instance.next)) - cast(*void)(*instance)) == 8, "EventDataSpaceSaveCompleteFB.next has unexpected offset % instead of 8", ((cast(*void)(*instance.next)) - cast(*void)(*instance)));
    assert(size_of(type_of(EventDataSpaceSaveCompleteFB.next)) == 8, "EventDataSpaceSaveCompleteFB.next has unexpected size % instead of 8", size_of(type_of(EventDataSpaceSaveCompleteFB.next)));
    assert(((cast(*void)(*instance.requestId)) - cast(*void)(*instance)) == 16, "EventDataSpaceSaveCompleteFB.requestId has unexpected offset % instead of 16", ((cast(*void)(*instance.requestId)) - cast(*void)(*instance)));
    assert(size_of(type_of(EventDataSpaceSaveCompleteFB.requestId)) == 8, "EventDataSpaceSaveCompleteFB.requestId has unexpected size % instead of 8", size_of(type_of(EventDataSpaceSaveCompleteFB.requestId)));
    assert(((cast(*void)(*instance.result)) - cast(*void)(*instance)) == 24, "EventDataSpaceSaveCompleteFB.result has unexpected offset % instead of 24", ((cast(*void)(*instance.result)) - cast(*void)(*instance)));
    assert(size_of(type_of(EventDataSpaceSaveCompleteFB.result)) == 4, "EventDataSpaceSaveCompleteFB.result has unexpected size % instead of 4", size_of(type_of(EventDataSpaceSaveCompleteFB.result)));
    assert(((cast(*void)(*instance.space)) - cast(*void)(*instance)) == 32, "EventDataSpaceSaveCompleteFB.space has unexpected offset % instead of 32", ((cast(*void)(*instance.space)) - cast(*void)(*instance)));
    assert(size_of(type_of(EventDataSpaceSaveCompleteFB.space)) == 8, "EventDataSpaceSaveCompleteFB.space has unexpected size % instead of 8", size_of(type_of(EventDataSpaceSaveCompleteFB.space)));
    assert(((cast(*void)(*instance.uuid)) - cast(*void)(*instance)) == 40, "EventDataSpaceSaveCompleteFB.uuid has unexpected offset % instead of 40", ((cast(*void)(*instance.uuid)) - cast(*void)(*instance)));
    assert(size_of(type_of(EventDataSpaceSaveCompleteFB.uuid)) == 16, "EventDataSpaceSaveCompleteFB.uuid has unexpected size % instead of 16", size_of(type_of(EventDataSpaceSaveCompleteFB.uuid)));
    assert(((cast(*void)(*instance.location)) - cast(*void)(*instance)) == 56, "EventDataSpaceSaveCompleteFB.location has unexpected offset % instead of 56", ((cast(*void)(*instance.location)) - cast(*void)(*instance)));
    assert(size_of(type_of(EventDataSpaceSaveCompleteFB.location)) == 4, "EventDataSpaceSaveCompleteFB.location has unexpected size % instead of 4", size_of(type_of(EventDataSpaceSaveCompleteFB.location)));
    assert(size_of(EventDataSpaceSaveCompleteFB) == 64, "EventDataSpaceSaveCompleteFB has size % instead of 64", size_of(EventDataSpaceSaveCompleteFB));
}

EventDataSpaceEraseCompleteFB :: struct {
    type:      StructureType;
    next:      *void;
    requestId: AsyncRequestIdFB;
    result:    Result;
    space:     Space;
    uuid:      UuidEXT;
    location:  SpaceStorageLocationFB;
}
#run {
    instance: EventDataSpaceEraseCompleteFB;
    assert(((cast(*void)(*instance.type)) - cast(*void)(*instance)) == 0, "EventDataSpaceEraseCompleteFB.type has unexpected offset % instead of 0", ((cast(*void)(*instance.type)) - cast(*void)(*instance)));
    assert(size_of(type_of(EventDataSpaceEraseCompleteFB.type)) == 4, "EventDataSpaceEraseCompleteFB.type has unexpected size % instead of 4", size_of(type_of(EventDataSpaceEraseCompleteFB.type)));
    assert(((cast(*void)(*instance.next)) - cast(*void)(*instance)) == 8, "EventDataSpaceEraseCompleteFB.next has unexpected offset % instead of 8", ((cast(*void)(*instance.next)) - cast(*void)(*instance)));
    assert(size_of(type_of(EventDataSpaceEraseCompleteFB.next)) == 8, "EventDataSpaceEraseCompleteFB.next has unexpected size % instead of 8", size_of(type_of(EventDataSpaceEraseCompleteFB.next)));
    assert(((cast(*void)(*instance.requestId)) - cast(*void)(*instance)) == 16, "EventDataSpaceEraseCompleteFB.requestId has unexpected offset % instead of 16", ((cast(*void)(*instance.requestId)) - cast(*void)(*instance)));
    assert(size_of(type_of(EventDataSpaceEraseCompleteFB.requestId)) == 8, "EventDataSpaceEraseCompleteFB.requestId has unexpected size % instead of 8", size_of(type_of(EventDataSpaceEraseCompleteFB.requestId)));
    assert(((cast(*void)(*instance.result)) - cast(*void)(*instance)) == 24, "EventDataSpaceEraseCompleteFB.result has unexpected offset % instead of 24", ((cast(*void)(*instance.result)) - cast(*void)(*instance)));
    assert(size_of(type_of(EventDataSpaceEraseCompleteFB.result)) == 4, "EventDataSpaceEraseCompleteFB.result has unexpected size % instead of 4", size_of(type_of(EventDataSpaceEraseCompleteFB.result)));
    assert(((cast(*void)(*instance.space)) - cast(*void)(*instance)) == 32, "EventDataSpaceEraseCompleteFB.space has unexpected offset % instead of 32", ((cast(*void)(*instance.space)) - cast(*void)(*instance)));
    assert(size_of(type_of(EventDataSpaceEraseCompleteFB.space)) == 8, "EventDataSpaceEraseCompleteFB.space has unexpected size % instead of 8", size_of(type_of(EventDataSpaceEraseCompleteFB.space)));
    assert(((cast(*void)(*instance.uuid)) - cast(*void)(*instance)) == 40, "EventDataSpaceEraseCompleteFB.uuid has unexpected offset % instead of 40", ((cast(*void)(*instance.uuid)) - cast(*void)(*instance)));
    assert(size_of(type_of(EventDataSpaceEraseCompleteFB.uuid)) == 16, "EventDataSpaceEraseCompleteFB.uuid has unexpected size % instead of 16", size_of(type_of(EventDataSpaceEraseCompleteFB.uuid)));
    assert(((cast(*void)(*instance.location)) - cast(*void)(*instance)) == 56, "EventDataSpaceEraseCompleteFB.location has unexpected offset % instead of 56", ((cast(*void)(*instance.location)) - cast(*void)(*instance)));
    assert(size_of(type_of(EventDataSpaceEraseCompleteFB.location)) == 4, "EventDataSpaceEraseCompleteFB.location has unexpected size % instead of 4", size_of(type_of(EventDataSpaceEraseCompleteFB.location)));
    assert(size_of(EventDataSpaceEraseCompleteFB) == 64, "EventDataSpaceEraseCompleteFB has size % instead of 64", size_of(EventDataSpaceEraseCompleteFB));
}

PFN_xrSaveSpaceFB :: #type (a0: Session, a1: *SpaceSaveInfoFB, a2: *AsyncRequestIdFB) -> Result #c_call;
PFN_xrEraseSpaceFB :: #type (a0: Session, a1: *SpaceEraseInfoFB, a2: *AsyncRequestIdFB) -> Result #c_call;

CompositionLayerSpaceWarpInfoFlagsFB :: Flags64;

// Flag bits for XrCompositionLayerSpaceWarpInfoFlagsFB
XR_COMPOSITION_LAYER_SPACE_WARP_INFO_FRAME_SKIP_BIT_FB: CompositionLayerSpaceWarpInfoFlagsFB : 1;

// XrCompositionLayerSpaceWarpInfoFB extends XrCompositionLayerProjectionView
CompositionLayerSpaceWarpInfoFB :: struct {
    type:                 StructureType;
    next:                 *void;
    layerFlags:           CompositionLayerSpaceWarpInfoFlagsFB;
    motionVectorSubImage: SwapchainSubImage;
    appSpaceDeltaPose:    Posef;
    depthSubImage:        SwapchainSubImage;
    minDepth:             float;
    maxDepth:             float;
    nearZ:                float;
    farZ:                 float;
}
#run {
    instance: CompositionLayerSpaceWarpInfoFB;
    assert(((cast(*void)(*instance.type)) - cast(*void)(*instance)) == 0, "CompositionLayerSpaceWarpInfoFB.type has unexpected offset % instead of 0", ((cast(*void)(*instance.type)) - cast(*void)(*instance)));
    assert(size_of(type_of(CompositionLayerSpaceWarpInfoFB.type)) == 4, "CompositionLayerSpaceWarpInfoFB.type has unexpected size % instead of 4", size_of(type_of(CompositionLayerSpaceWarpInfoFB.type)));
    assert(((cast(*void)(*instance.next)) - cast(*void)(*instance)) == 8, "CompositionLayerSpaceWarpInfoFB.next has unexpected offset % instead of 8", ((cast(*void)(*instance.next)) - cast(*void)(*instance)));
    assert(size_of(type_of(CompositionLayerSpaceWarpInfoFB.next)) == 8, "CompositionLayerSpaceWarpInfoFB.next has unexpected size % instead of 8", size_of(type_of(CompositionLayerSpaceWarpInfoFB.next)));
    assert(((cast(*void)(*instance.layerFlags)) - cast(*void)(*instance)) == 16, "CompositionLayerSpaceWarpInfoFB.layerFlags has unexpected offset % instead of 16", ((cast(*void)(*instance.layerFlags)) - cast(*void)(*instance)));
    assert(size_of(type_of(CompositionLayerSpaceWarpInfoFB.layerFlags)) == 8, "CompositionLayerSpaceWarpInfoFB.layerFlags has unexpected size % instead of 8", size_of(type_of(CompositionLayerSpaceWarpInfoFB.layerFlags)));
    assert(((cast(*void)(*instance.motionVectorSubImage)) - cast(*void)(*instance)) == 24, "CompositionLayerSpaceWarpInfoFB.motionVectorSubImage has unexpected offset % instead of 24", ((cast(*void)(*instance.motionVectorSubImage)) - cast(*void)(*instance)));
    assert(size_of(type_of(CompositionLayerSpaceWarpInfoFB.motionVectorSubImage)) == 32, "CompositionLayerSpaceWarpInfoFB.motionVectorSubImage has unexpected size % instead of 32", size_of(type_of(CompositionLayerSpaceWarpInfoFB.motionVectorSubImage)));
    assert(((cast(*void)(*instance.appSpaceDeltaPose)) - cast(*void)(*instance)) == 56, "CompositionLayerSpaceWarpInfoFB.appSpaceDeltaPose has unexpected offset % instead of 56", ((cast(*void)(*instance.appSpaceDeltaPose)) - cast(*void)(*instance)));
    assert(size_of(type_of(CompositionLayerSpaceWarpInfoFB.appSpaceDeltaPose)) == 28, "CompositionLayerSpaceWarpInfoFB.appSpaceDeltaPose has unexpected size % instead of 28", size_of(type_of(CompositionLayerSpaceWarpInfoFB.appSpaceDeltaPose)));
    assert(((cast(*void)(*instance.depthSubImage)) - cast(*void)(*instance)) == 88, "CompositionLayerSpaceWarpInfoFB.depthSubImage has unexpected offset % instead of 88", ((cast(*void)(*instance.depthSubImage)) - cast(*void)(*instance)));
    assert(size_of(type_of(CompositionLayerSpaceWarpInfoFB.depthSubImage)) == 32, "CompositionLayerSpaceWarpInfoFB.depthSubImage has unexpected size % instead of 32", size_of(type_of(CompositionLayerSpaceWarpInfoFB.depthSubImage)));
    assert(((cast(*void)(*instance.minDepth)) - cast(*void)(*instance)) == 120, "CompositionLayerSpaceWarpInfoFB.minDepth has unexpected offset % instead of 120", ((cast(*void)(*instance.minDepth)) - cast(*void)(*instance)));
    assert(size_of(type_of(CompositionLayerSpaceWarpInfoFB.minDepth)) == 4, "CompositionLayerSpaceWarpInfoFB.minDepth has unexpected size % instead of 4", size_of(type_of(CompositionLayerSpaceWarpInfoFB.minDepth)));
    assert(((cast(*void)(*instance.maxDepth)) - cast(*void)(*instance)) == 124, "CompositionLayerSpaceWarpInfoFB.maxDepth has unexpected offset % instead of 124", ((cast(*void)(*instance.maxDepth)) - cast(*void)(*instance)));
    assert(size_of(type_of(CompositionLayerSpaceWarpInfoFB.maxDepth)) == 4, "CompositionLayerSpaceWarpInfoFB.maxDepth has unexpected size % instead of 4", size_of(type_of(CompositionLayerSpaceWarpInfoFB.maxDepth)));
    assert(((cast(*void)(*instance.nearZ)) - cast(*void)(*instance)) == 128, "CompositionLayerSpaceWarpInfoFB.nearZ has unexpected offset % instead of 128", ((cast(*void)(*instance.nearZ)) - cast(*void)(*instance)));
    assert(size_of(type_of(CompositionLayerSpaceWarpInfoFB.nearZ)) == 4, "CompositionLayerSpaceWarpInfoFB.nearZ has unexpected size % instead of 4", size_of(type_of(CompositionLayerSpaceWarpInfoFB.nearZ)));
    assert(((cast(*void)(*instance.farZ)) - cast(*void)(*instance)) == 132, "CompositionLayerSpaceWarpInfoFB.farZ has unexpected offset % instead of 132", ((cast(*void)(*instance.farZ)) - cast(*void)(*instance)));
    assert(size_of(type_of(CompositionLayerSpaceWarpInfoFB.farZ)) == 4, "CompositionLayerSpaceWarpInfoFB.farZ has unexpected size % instead of 4", size_of(type_of(CompositionLayerSpaceWarpInfoFB.farZ)));
    assert(size_of(CompositionLayerSpaceWarpInfoFB) == 136, "CompositionLayerSpaceWarpInfoFB has size % instead of 136", size_of(CompositionLayerSpaceWarpInfoFB));
}

// XrSystemSpaceWarpPropertiesFB extends XrSystemProperties
SystemSpaceWarpPropertiesFB :: struct {
    type:                                   StructureType;
    next:                                   *void;
    recommendedMotionVectorImageRectWidth:  u32;
    recommendedMotionVectorImageRectHeight: u32;
}
#run {
    instance: SystemSpaceWarpPropertiesFB;
    assert(((cast(*void)(*instance.type)) - cast(*void)(*instance)) == 0, "SystemSpaceWarpPropertiesFB.type has unexpected offset % instead of 0", ((cast(*void)(*instance.type)) - cast(*void)(*instance)));
    assert(size_of(type_of(SystemSpaceWarpPropertiesFB.type)) == 4, "SystemSpaceWarpPropertiesFB.type has unexpected size % instead of 4", size_of(type_of(SystemSpaceWarpPropertiesFB.type)));
    assert(((cast(*void)(*instance.next)) - cast(*void)(*instance)) == 8, "SystemSpaceWarpPropertiesFB.next has unexpected offset % instead of 8", ((cast(*void)(*instance.next)) - cast(*void)(*instance)));
    assert(size_of(type_of(SystemSpaceWarpPropertiesFB.next)) == 8, "SystemSpaceWarpPropertiesFB.next has unexpected size % instead of 8", size_of(type_of(SystemSpaceWarpPropertiesFB.next)));
    assert(((cast(*void)(*instance.recommendedMotionVectorImageRectWidth)) - cast(*void)(*instance)) == 16, "SystemSpaceWarpPropertiesFB.recommendedMotionVectorImageRectWidth has unexpected offset % instead of 16", ((cast(*void)(*instance.recommendedMotionVectorImageRectWidth)) - cast(*void)(*instance)));
    assert(size_of(type_of(SystemSpaceWarpPropertiesFB.recommendedMotionVectorImageRectWidth)) == 4, "SystemSpaceWarpPropertiesFB.recommendedMotionVectorImageRectWidth has unexpected size % instead of 4", size_of(type_of(SystemSpaceWarpPropertiesFB.recommendedMotionVectorImageRectWidth)));
    assert(((cast(*void)(*instance.recommendedMotionVectorImageRectHeight)) - cast(*void)(*instance)) == 20, "SystemSpaceWarpPropertiesFB.recommendedMotionVectorImageRectHeight has unexpected offset % instead of 20", ((cast(*void)(*instance.recommendedMotionVectorImageRectHeight)) - cast(*void)(*instance)));
    assert(size_of(type_of(SystemSpaceWarpPropertiesFB.recommendedMotionVectorImageRectHeight)) == 4, "SystemSpaceWarpPropertiesFB.recommendedMotionVectorImageRectHeight has unexpected size % instead of 4", size_of(type_of(SystemSpaceWarpPropertiesFB.recommendedMotionVectorImageRectHeight)));
    assert(size_of(SystemSpaceWarpPropertiesFB) == 24, "SystemSpaceWarpPropertiesFB has size % instead of 24", size_of(SystemSpaceWarpPropertiesFB));
}

Extent3DfFB :: struct {
    width:  float;
    height: float;
    depth:  float;
}
#run {
    instance: Extent3DfFB;
    assert(((cast(*void)(*instance.width)) - cast(*void)(*instance)) == 0, "Extent3DfFB.width has unexpected offset % instead of 0", ((cast(*void)(*instance.width)) - cast(*void)(*instance)));
    assert(size_of(type_of(Extent3DfFB.width)) == 4, "Extent3DfFB.width has unexpected size % instead of 4", size_of(type_of(Extent3DfFB.width)));
    assert(((cast(*void)(*instance.height)) - cast(*void)(*instance)) == 4, "Extent3DfFB.height has unexpected offset % instead of 4", ((cast(*void)(*instance.height)) - cast(*void)(*instance)));
    assert(size_of(type_of(Extent3DfFB.height)) == 4, "Extent3DfFB.height has unexpected size % instead of 4", size_of(type_of(Extent3DfFB.height)));
    assert(((cast(*void)(*instance.depth)) - cast(*void)(*instance)) == 8, "Extent3DfFB.depth has unexpected offset % instead of 8", ((cast(*void)(*instance.depth)) - cast(*void)(*instance)));
    assert(size_of(type_of(Extent3DfFB.depth)) == 4, "Extent3DfFB.depth has unexpected size % instead of 4", size_of(type_of(Extent3DfFB.depth)));
    assert(size_of(Extent3DfFB) == 12, "Extent3DfFB has size % instead of 12", size_of(Extent3DfFB));
}

Offset3DfFB :: struct {
    x: float;
    y: float;
    z: float;
}
#run {
    instance: Offset3DfFB;
    assert(((cast(*void)(*instance.x)) - cast(*void)(*instance)) == 0, "Offset3DfFB.x has unexpected offset % instead of 0", ((cast(*void)(*instance.x)) - cast(*void)(*instance)));
    assert(size_of(type_of(Offset3DfFB.x)) == 4, "Offset3DfFB.x has unexpected size % instead of 4", size_of(type_of(Offset3DfFB.x)));
    assert(((cast(*void)(*instance.y)) - cast(*void)(*instance)) == 4, "Offset3DfFB.y has unexpected offset % instead of 4", ((cast(*void)(*instance.y)) - cast(*void)(*instance)));
    assert(size_of(type_of(Offset3DfFB.y)) == 4, "Offset3DfFB.y has unexpected size % instead of 4", size_of(type_of(Offset3DfFB.y)));
    assert(((cast(*void)(*instance.z)) - cast(*void)(*instance)) == 8, "Offset3DfFB.z has unexpected offset % instead of 8", ((cast(*void)(*instance.z)) - cast(*void)(*instance)));
    assert(size_of(type_of(Offset3DfFB.z)) == 4, "Offset3DfFB.z has unexpected size % instead of 4", size_of(type_of(Offset3DfFB.z)));
    assert(size_of(Offset3DfFB) == 12, "Offset3DfFB has size % instead of 12", size_of(Offset3DfFB));
}

Rect3DfFB :: struct {
    offset: Offset3DfFB;
    extent: Extent3DfFB;
}
#run {
    instance: Rect3DfFB;
    assert(((cast(*void)(*instance.offset)) - cast(*void)(*instance)) == 0, "Rect3DfFB.offset has unexpected offset % instead of 0", ((cast(*void)(*instance.offset)) - cast(*void)(*instance)));
    assert(size_of(type_of(Rect3DfFB.offset)) == 12, "Rect3DfFB.offset has unexpected size % instead of 12", size_of(type_of(Rect3DfFB.offset)));
    assert(((cast(*void)(*instance.extent)) - cast(*void)(*instance)) == 12, "Rect3DfFB.extent has unexpected offset % instead of 12", ((cast(*void)(*instance.extent)) - cast(*void)(*instance)));
    assert(size_of(type_of(Rect3DfFB.extent)) == 12, "Rect3DfFB.extent has unexpected size % instead of 12", size_of(type_of(Rect3DfFB.extent)));
    assert(size_of(Rect3DfFB) == 24, "Rect3DfFB has size % instead of 24", size_of(Rect3DfFB));
}

SemanticLabelsFB :: struct {
    type:                StructureType;
    next:                *void;
    bufferCapacityInput: u32;
    bufferCountOutput:   u32;
    buffer:              *u8;
}
#run {
    instance: SemanticLabelsFB;
    assert(((cast(*void)(*instance.type)) - cast(*void)(*instance)) == 0, "SemanticLabelsFB.type has unexpected offset % instead of 0", ((cast(*void)(*instance.type)) - cast(*void)(*instance)));
    assert(size_of(type_of(SemanticLabelsFB.type)) == 4, "SemanticLabelsFB.type has unexpected size % instead of 4", size_of(type_of(SemanticLabelsFB.type)));
    assert(((cast(*void)(*instance.next)) - cast(*void)(*instance)) == 8, "SemanticLabelsFB.next has unexpected offset % instead of 8", ((cast(*void)(*instance.next)) - cast(*void)(*instance)));
    assert(size_of(type_of(SemanticLabelsFB.next)) == 8, "SemanticLabelsFB.next has unexpected size % instead of 8", size_of(type_of(SemanticLabelsFB.next)));
    assert(((cast(*void)(*instance.bufferCapacityInput)) - cast(*void)(*instance)) == 16, "SemanticLabelsFB.bufferCapacityInput has unexpected offset % instead of 16", ((cast(*void)(*instance.bufferCapacityInput)) - cast(*void)(*instance)));
    assert(size_of(type_of(SemanticLabelsFB.bufferCapacityInput)) == 4, "SemanticLabelsFB.bufferCapacityInput has unexpected size % instead of 4", size_of(type_of(SemanticLabelsFB.bufferCapacityInput)));
    assert(((cast(*void)(*instance.bufferCountOutput)) - cast(*void)(*instance)) == 20, "SemanticLabelsFB.bufferCountOutput has unexpected offset % instead of 20", ((cast(*void)(*instance.bufferCountOutput)) - cast(*void)(*instance)));
    assert(size_of(type_of(SemanticLabelsFB.bufferCountOutput)) == 4, "SemanticLabelsFB.bufferCountOutput has unexpected size % instead of 4", size_of(type_of(SemanticLabelsFB.bufferCountOutput)));
    assert(((cast(*void)(*instance.buffer)) - cast(*void)(*instance)) == 24, "SemanticLabelsFB.buffer has unexpected offset % instead of 24", ((cast(*void)(*instance.buffer)) - cast(*void)(*instance)));
    assert(size_of(type_of(SemanticLabelsFB.buffer)) == 8, "SemanticLabelsFB.buffer has unexpected size % instead of 8", size_of(type_of(SemanticLabelsFB.buffer)));
    assert(size_of(SemanticLabelsFB) == 32, "SemanticLabelsFB has size % instead of 32", size_of(SemanticLabelsFB));
}

RoomLayoutFB :: struct {
    type:                  StructureType;
    next:                  *void;
    floorUuid:             UuidEXT;
    ceilingUuid:           UuidEXT;
    wallUuidCapacityInput: u32;
    wallUuidCountOutput:   u32;
    wallUuids:             *UuidEXT;
}
#run {
    instance: RoomLayoutFB;
    assert(((cast(*void)(*instance.type)) - cast(*void)(*instance)) == 0, "RoomLayoutFB.type has unexpected offset % instead of 0", ((cast(*void)(*instance.type)) - cast(*void)(*instance)));
    assert(size_of(type_of(RoomLayoutFB.type)) == 4, "RoomLayoutFB.type has unexpected size % instead of 4", size_of(type_of(RoomLayoutFB.type)));
    assert(((cast(*void)(*instance.next)) - cast(*void)(*instance)) == 8, "RoomLayoutFB.next has unexpected offset % instead of 8", ((cast(*void)(*instance.next)) - cast(*void)(*instance)));
    assert(size_of(type_of(RoomLayoutFB.next)) == 8, "RoomLayoutFB.next has unexpected size % instead of 8", size_of(type_of(RoomLayoutFB.next)));
    assert(((cast(*void)(*instance.floorUuid)) - cast(*void)(*instance)) == 16, "RoomLayoutFB.floorUuid has unexpected offset % instead of 16", ((cast(*void)(*instance.floorUuid)) - cast(*void)(*instance)));
    assert(size_of(type_of(RoomLayoutFB.floorUuid)) == 16, "RoomLayoutFB.floorUuid has unexpected size % instead of 16", size_of(type_of(RoomLayoutFB.floorUuid)));
    assert(((cast(*void)(*instance.ceilingUuid)) - cast(*void)(*instance)) == 32, "RoomLayoutFB.ceilingUuid has unexpected offset % instead of 32", ((cast(*void)(*instance.ceilingUuid)) - cast(*void)(*instance)));
    assert(size_of(type_of(RoomLayoutFB.ceilingUuid)) == 16, "RoomLayoutFB.ceilingUuid has unexpected size % instead of 16", size_of(type_of(RoomLayoutFB.ceilingUuid)));
    assert(((cast(*void)(*instance.wallUuidCapacityInput)) - cast(*void)(*instance)) == 48, "RoomLayoutFB.wallUuidCapacityInput has unexpected offset % instead of 48", ((cast(*void)(*instance.wallUuidCapacityInput)) - cast(*void)(*instance)));
    assert(size_of(type_of(RoomLayoutFB.wallUuidCapacityInput)) == 4, "RoomLayoutFB.wallUuidCapacityInput has unexpected size % instead of 4", size_of(type_of(RoomLayoutFB.wallUuidCapacityInput)));
    assert(((cast(*void)(*instance.wallUuidCountOutput)) - cast(*void)(*instance)) == 52, "RoomLayoutFB.wallUuidCountOutput has unexpected offset % instead of 52", ((cast(*void)(*instance.wallUuidCountOutput)) - cast(*void)(*instance)));
    assert(size_of(type_of(RoomLayoutFB.wallUuidCountOutput)) == 4, "RoomLayoutFB.wallUuidCountOutput has unexpected size % instead of 4", size_of(type_of(RoomLayoutFB.wallUuidCountOutput)));
    assert(((cast(*void)(*instance.wallUuids)) - cast(*void)(*instance)) == 56, "RoomLayoutFB.wallUuids has unexpected offset % instead of 56", ((cast(*void)(*instance.wallUuids)) - cast(*void)(*instance)));
    assert(size_of(type_of(RoomLayoutFB.wallUuids)) == 8, "RoomLayoutFB.wallUuids has unexpected size % instead of 8", size_of(type_of(RoomLayoutFB.wallUuids)));
    assert(size_of(RoomLayoutFB) == 64, "RoomLayoutFB has size % instead of 64", size_of(RoomLayoutFB));
}

Boundary2DFB :: struct {
    type:                StructureType;
    next:                *void;
    vertexCapacityInput: u32;
    vertexCountOutput:   u32;
    vertices:            *Vector2f;
}
#run {
    instance: Boundary2DFB;
    assert(((cast(*void)(*instance.type)) - cast(*void)(*instance)) == 0, "Boundary2DFB.type has unexpected offset % instead of 0", ((cast(*void)(*instance.type)) - cast(*void)(*instance)));
    assert(size_of(type_of(Boundary2DFB.type)) == 4, "Boundary2DFB.type has unexpected size % instead of 4", size_of(type_of(Boundary2DFB.type)));
    assert(((cast(*void)(*instance.next)) - cast(*void)(*instance)) == 8, "Boundary2DFB.next has unexpected offset % instead of 8", ((cast(*void)(*instance.next)) - cast(*void)(*instance)));
    assert(size_of(type_of(Boundary2DFB.next)) == 8, "Boundary2DFB.next has unexpected size % instead of 8", size_of(type_of(Boundary2DFB.next)));
    assert(((cast(*void)(*instance.vertexCapacityInput)) - cast(*void)(*instance)) == 16, "Boundary2DFB.vertexCapacityInput has unexpected offset % instead of 16", ((cast(*void)(*instance.vertexCapacityInput)) - cast(*void)(*instance)));
    assert(size_of(type_of(Boundary2DFB.vertexCapacityInput)) == 4, "Boundary2DFB.vertexCapacityInput has unexpected size % instead of 4", size_of(type_of(Boundary2DFB.vertexCapacityInput)));
    assert(((cast(*void)(*instance.vertexCountOutput)) - cast(*void)(*instance)) == 20, "Boundary2DFB.vertexCountOutput has unexpected offset % instead of 20", ((cast(*void)(*instance.vertexCountOutput)) - cast(*void)(*instance)));
    assert(size_of(type_of(Boundary2DFB.vertexCountOutput)) == 4, "Boundary2DFB.vertexCountOutput has unexpected size % instead of 4", size_of(type_of(Boundary2DFB.vertexCountOutput)));
    assert(((cast(*void)(*instance.vertices)) - cast(*void)(*instance)) == 24, "Boundary2DFB.vertices has unexpected offset % instead of 24", ((cast(*void)(*instance.vertices)) - cast(*void)(*instance)));
    assert(size_of(type_of(Boundary2DFB.vertices)) == 8, "Boundary2DFB.vertices has unexpected size % instead of 8", size_of(type_of(Boundary2DFB.vertices)));
    assert(size_of(Boundary2DFB) == 32, "Boundary2DFB has size % instead of 32", size_of(Boundary2DFB));
}

PFN_xrGetSpaceBoundingBox2DFB :: #type (a0: Session, a1: Space, a2: *Rect2Df) -> Result #c_call;
PFN_xrGetSpaceBoundingBox3DFB :: #type (a0: Session, a1: Space, a2: *Rect3DfFB) -> Result #c_call;
PFN_xrGetSpaceSemanticLabelsFB :: #type (a0: Session, a1: Space, a2: *SemanticLabelsFB) -> Result #c_call;
PFN_xrGetSpaceBoundary2DFB :: #type (a0: Session, a1: Space, a2: *Boundary2DFB) -> Result #c_call;
PFN_xrGetSpaceRoomLayoutFB :: #type (a0: Session, a1: Space, a2: *RoomLayoutFB) -> Result #c_call;

DigitalLensControlFlagsALMALENCE :: Flags64;

// Flag bits for XrDigitalLensControlFlagsALMALENCE
XR_DIGITAL_LENS_CONTROL_PROCESSING_DISABLE_BIT_ALMALENCE: DigitalLensControlFlagsALMALENCE : 1;

DigitalLensControlALMALENCE :: struct {
    type:  StructureType;
    next:  *void;
    flags: DigitalLensControlFlagsALMALENCE;
}
#run {
    instance: DigitalLensControlALMALENCE;
    assert(((cast(*void)(*instance.type)) - cast(*void)(*instance)) == 0, "DigitalLensControlALMALENCE.type has unexpected offset % instead of 0", ((cast(*void)(*instance.type)) - cast(*void)(*instance)));
    assert(size_of(type_of(DigitalLensControlALMALENCE.type)) == 4, "DigitalLensControlALMALENCE.type has unexpected size % instead of 4", size_of(type_of(DigitalLensControlALMALENCE.type)));
    assert(((cast(*void)(*instance.next)) - cast(*void)(*instance)) == 8, "DigitalLensControlALMALENCE.next has unexpected offset % instead of 8", ((cast(*void)(*instance.next)) - cast(*void)(*instance)));
    assert(size_of(type_of(DigitalLensControlALMALENCE.next)) == 8, "DigitalLensControlALMALENCE.next has unexpected size % instead of 8", size_of(type_of(DigitalLensControlALMALENCE.next)));
    assert(((cast(*void)(*instance.flags)) - cast(*void)(*instance)) == 16, "DigitalLensControlALMALENCE.flags has unexpected offset % instead of 16", ((cast(*void)(*instance.flags)) - cast(*void)(*instance)));
    assert(size_of(type_of(DigitalLensControlALMALENCE.flags)) == 8, "DigitalLensControlALMALENCE.flags has unexpected size % instead of 8", size_of(type_of(DigitalLensControlALMALENCE.flags)));
    assert(size_of(DigitalLensControlALMALENCE) == 24, "DigitalLensControlALMALENCE has size % instead of 24", size_of(DigitalLensControlALMALENCE));
}

PFN_xrSetDigitalLensControlALMALENCE :: #type (a0: Session, a1: *DigitalLensControlALMALENCE) -> Result #c_call;

SpaceContainerFB :: struct {
    type:              StructureType;
    next:              *void;
    uuidCapacityInput: u32;
    uuidCountOutput:   u32;
    uuids:             *UuidEXT;
}
#run {
    instance: SpaceContainerFB;
    assert(((cast(*void)(*instance.type)) - cast(*void)(*instance)) == 0, "SpaceContainerFB.type has unexpected offset % instead of 0", ((cast(*void)(*instance.type)) - cast(*void)(*instance)));
    assert(size_of(type_of(SpaceContainerFB.type)) == 4, "SpaceContainerFB.type has unexpected size % instead of 4", size_of(type_of(SpaceContainerFB.type)));
    assert(((cast(*void)(*instance.next)) - cast(*void)(*instance)) == 8, "SpaceContainerFB.next has unexpected offset % instead of 8", ((cast(*void)(*instance.next)) - cast(*void)(*instance)));
    assert(size_of(type_of(SpaceContainerFB.next)) == 8, "SpaceContainerFB.next has unexpected size % instead of 8", size_of(type_of(SpaceContainerFB.next)));
    assert(((cast(*void)(*instance.uuidCapacityInput)) - cast(*void)(*instance)) == 16, "SpaceContainerFB.uuidCapacityInput has unexpected offset % instead of 16", ((cast(*void)(*instance.uuidCapacityInput)) - cast(*void)(*instance)));
    assert(size_of(type_of(SpaceContainerFB.uuidCapacityInput)) == 4, "SpaceContainerFB.uuidCapacityInput has unexpected size % instead of 4", size_of(type_of(SpaceContainerFB.uuidCapacityInput)));
    assert(((cast(*void)(*instance.uuidCountOutput)) - cast(*void)(*instance)) == 20, "SpaceContainerFB.uuidCountOutput has unexpected offset % instead of 20", ((cast(*void)(*instance.uuidCountOutput)) - cast(*void)(*instance)));
    assert(size_of(type_of(SpaceContainerFB.uuidCountOutput)) == 4, "SpaceContainerFB.uuidCountOutput has unexpected size % instead of 4", size_of(type_of(SpaceContainerFB.uuidCountOutput)));
    assert(((cast(*void)(*instance.uuids)) - cast(*void)(*instance)) == 24, "SpaceContainerFB.uuids has unexpected offset % instead of 24", ((cast(*void)(*instance.uuids)) - cast(*void)(*instance)));
    assert(size_of(type_of(SpaceContainerFB.uuids)) == 8, "SpaceContainerFB.uuids has unexpected size % instead of 8", size_of(type_of(SpaceContainerFB.uuids)));
    assert(size_of(SpaceContainerFB) == 32, "SpaceContainerFB has size % instead of 32", size_of(SpaceContainerFB));
}

PFN_xrGetSpaceContainerFB :: #type (a0: Session, a1: Space, a2: *SpaceContainerFB) -> Result #c_call;

PassthroughKeyboardHandsIntensityFB :: struct {
    type:               StructureType;
    next:               *void;
    leftHandIntensity:  float;
    rightHandIntensity: float;
}
#run {
    instance: PassthroughKeyboardHandsIntensityFB;
    assert(((cast(*void)(*instance.type)) - cast(*void)(*instance)) == 0, "PassthroughKeyboardHandsIntensityFB.type has unexpected offset % instead of 0", ((cast(*void)(*instance.type)) - cast(*void)(*instance)));
    assert(size_of(type_of(PassthroughKeyboardHandsIntensityFB.type)) == 4, "PassthroughKeyboardHandsIntensityFB.type has unexpected size % instead of 4", size_of(type_of(PassthroughKeyboardHandsIntensityFB.type)));
    assert(((cast(*void)(*instance.next)) - cast(*void)(*instance)) == 8, "PassthroughKeyboardHandsIntensityFB.next has unexpected offset % instead of 8", ((cast(*void)(*instance.next)) - cast(*void)(*instance)));
    assert(size_of(type_of(PassthroughKeyboardHandsIntensityFB.next)) == 8, "PassthroughKeyboardHandsIntensityFB.next has unexpected size % instead of 8", size_of(type_of(PassthroughKeyboardHandsIntensityFB.next)));
    assert(((cast(*void)(*instance.leftHandIntensity)) - cast(*void)(*instance)) == 16, "PassthroughKeyboardHandsIntensityFB.leftHandIntensity has unexpected offset % instead of 16", ((cast(*void)(*instance.leftHandIntensity)) - cast(*void)(*instance)));
    assert(size_of(type_of(PassthroughKeyboardHandsIntensityFB.leftHandIntensity)) == 4, "PassthroughKeyboardHandsIntensityFB.leftHandIntensity has unexpected size % instead of 4", size_of(type_of(PassthroughKeyboardHandsIntensityFB.leftHandIntensity)));
    assert(((cast(*void)(*instance.rightHandIntensity)) - cast(*void)(*instance)) == 20, "PassthroughKeyboardHandsIntensityFB.rightHandIntensity has unexpected offset % instead of 20", ((cast(*void)(*instance.rightHandIntensity)) - cast(*void)(*instance)));
    assert(size_of(type_of(PassthroughKeyboardHandsIntensityFB.rightHandIntensity)) == 4, "PassthroughKeyboardHandsIntensityFB.rightHandIntensity has unexpected size % instead of 4", size_of(type_of(PassthroughKeyboardHandsIntensityFB.rightHandIntensity)));
    assert(size_of(PassthroughKeyboardHandsIntensityFB) == 24, "PassthroughKeyboardHandsIntensityFB has size % instead of 24", size_of(PassthroughKeyboardHandsIntensityFB));
}

PFN_xrPassthroughLayerSetKeyboardHandsIntensityFB :: #type (a0: PassthroughLayerFB, a1: *PassthroughKeyboardHandsIntensityFB) -> Result #c_call;

CompositionLayerSettingsFlagsFB :: Flags64;

// Flag bits for XrCompositionLayerSettingsFlagsFB
XR_COMPOSITION_LAYER_SETTINGS_NORMAL_SUPER_SAMPLING_BIT_FB: CompositionLayerSettingsFlagsFB : 1;
XR_COMPOSITION_LAYER_SETTINGS_QUALITY_SUPER_SAMPLING_BIT_FB: CompositionLayerSettingsFlagsFB : 2;
XR_COMPOSITION_LAYER_SETTINGS_NORMAL_SHARPENING_BIT_FB: CompositionLayerSettingsFlagsFB : 4;
XR_COMPOSITION_LAYER_SETTINGS_QUALITY_SHARPENING_BIT_FB: CompositionLayerSettingsFlagsFB : 8;

// XrCompositionLayerSettingsFB extends XrCompositionLayerBaseHeader
CompositionLayerSettingsFB :: struct {
    type:       StructureType;
    next:       *void;
    layerFlags: CompositionLayerSettingsFlagsFB;
}
#run {
    instance: CompositionLayerSettingsFB;
    assert(((cast(*void)(*instance.type)) - cast(*void)(*instance)) == 0, "CompositionLayerSettingsFB.type has unexpected offset % instead of 0", ((cast(*void)(*instance.type)) - cast(*void)(*instance)));
    assert(size_of(type_of(CompositionLayerSettingsFB.type)) == 4, "CompositionLayerSettingsFB.type has unexpected size % instead of 4", size_of(type_of(CompositionLayerSettingsFB.type)));
    assert(((cast(*void)(*instance.next)) - cast(*void)(*instance)) == 8, "CompositionLayerSettingsFB.next has unexpected offset % instead of 8", ((cast(*void)(*instance.next)) - cast(*void)(*instance)));
    assert(size_of(type_of(CompositionLayerSettingsFB.next)) == 8, "CompositionLayerSettingsFB.next has unexpected size % instead of 8", size_of(type_of(CompositionLayerSettingsFB.next)));
    assert(((cast(*void)(*instance.layerFlags)) - cast(*void)(*instance)) == 16, "CompositionLayerSettingsFB.layerFlags has unexpected offset % instead of 16", ((cast(*void)(*instance.layerFlags)) - cast(*void)(*instance)));
    assert(size_of(type_of(CompositionLayerSettingsFB.layerFlags)) == 8, "CompositionLayerSettingsFB.layerFlags has unexpected size % instead of 8", size_of(type_of(CompositionLayerSettingsFB.layerFlags)));
    assert(size_of(CompositionLayerSettingsFB) == 24, "CompositionLayerSettingsFB has size % instead of 24", size_of(CompositionLayerSettingsFB));
}

PerformanceMetricsCounterUnitMETA :: enum s32 {
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

PerformanceMetricsCounterFlagsMETA :: Flags64;

// Flag bits for XrPerformanceMetricsCounterFlagsMETA
XR_PERFORMANCE_METRICS_COUNTER_ANY_VALUE_VALID_BIT_META: PerformanceMetricsCounterFlagsMETA : 1;
XR_PERFORMANCE_METRICS_COUNTER_UINT_VALUE_VALID_BIT_META: PerformanceMetricsCounterFlagsMETA : 2;
XR_PERFORMANCE_METRICS_COUNTER_FLOAT_VALUE_VALID_BIT_META: PerformanceMetricsCounterFlagsMETA : 4;

PerformanceMetricsStateMETA :: struct {
    type:    StructureType;
    next:    *void;
    enabled: Bool32;
}
#run {
    instance: PerformanceMetricsStateMETA;
    assert(((cast(*void)(*instance.type)) - cast(*void)(*instance)) == 0, "PerformanceMetricsStateMETA.type has unexpected offset % instead of 0", ((cast(*void)(*instance.type)) - cast(*void)(*instance)));
    assert(size_of(type_of(PerformanceMetricsStateMETA.type)) == 4, "PerformanceMetricsStateMETA.type has unexpected size % instead of 4", size_of(type_of(PerformanceMetricsStateMETA.type)));
    assert(((cast(*void)(*instance.next)) - cast(*void)(*instance)) == 8, "PerformanceMetricsStateMETA.next has unexpected offset % instead of 8", ((cast(*void)(*instance.next)) - cast(*void)(*instance)));
    assert(size_of(type_of(PerformanceMetricsStateMETA.next)) == 8, "PerformanceMetricsStateMETA.next has unexpected size % instead of 8", size_of(type_of(PerformanceMetricsStateMETA.next)));
    assert(((cast(*void)(*instance.enabled)) - cast(*void)(*instance)) == 16, "PerformanceMetricsStateMETA.enabled has unexpected offset % instead of 16", ((cast(*void)(*instance.enabled)) - cast(*void)(*instance)));
    assert(size_of(type_of(PerformanceMetricsStateMETA.enabled)) == 4, "PerformanceMetricsStateMETA.enabled has unexpected size % instead of 4", size_of(type_of(PerformanceMetricsStateMETA.enabled)));
    assert(size_of(PerformanceMetricsStateMETA) == 24, "PerformanceMetricsStateMETA has size % instead of 24", size_of(PerformanceMetricsStateMETA));
}

PerformanceMetricsCounterMETA :: struct {
    type:         StructureType;
    next:         *void;
    counterFlags: PerformanceMetricsCounterFlagsMETA;
    counterUnit:  PerformanceMetricsCounterUnitMETA;
    uintValue:    u32;
    floatValue:   float;
}
#run {
    instance: PerformanceMetricsCounterMETA;
    assert(((cast(*void)(*instance.type)) - cast(*void)(*instance)) == 0, "PerformanceMetricsCounterMETA.type has unexpected offset % instead of 0", ((cast(*void)(*instance.type)) - cast(*void)(*instance)));
    assert(size_of(type_of(PerformanceMetricsCounterMETA.type)) == 4, "PerformanceMetricsCounterMETA.type has unexpected size % instead of 4", size_of(type_of(PerformanceMetricsCounterMETA.type)));
    assert(((cast(*void)(*instance.next)) - cast(*void)(*instance)) == 8, "PerformanceMetricsCounterMETA.next has unexpected offset % instead of 8", ((cast(*void)(*instance.next)) - cast(*void)(*instance)));
    assert(size_of(type_of(PerformanceMetricsCounterMETA.next)) == 8, "PerformanceMetricsCounterMETA.next has unexpected size % instead of 8", size_of(type_of(PerformanceMetricsCounterMETA.next)));
    assert(((cast(*void)(*instance.counterFlags)) - cast(*void)(*instance)) == 16, "PerformanceMetricsCounterMETA.counterFlags has unexpected offset % instead of 16", ((cast(*void)(*instance.counterFlags)) - cast(*void)(*instance)));
    assert(size_of(type_of(PerformanceMetricsCounterMETA.counterFlags)) == 8, "PerformanceMetricsCounterMETA.counterFlags has unexpected size % instead of 8", size_of(type_of(PerformanceMetricsCounterMETA.counterFlags)));
    assert(((cast(*void)(*instance.counterUnit)) - cast(*void)(*instance)) == 24, "PerformanceMetricsCounterMETA.counterUnit has unexpected offset % instead of 24", ((cast(*void)(*instance.counterUnit)) - cast(*void)(*instance)));
    assert(size_of(type_of(PerformanceMetricsCounterMETA.counterUnit)) == 4, "PerformanceMetricsCounterMETA.counterUnit has unexpected size % instead of 4", size_of(type_of(PerformanceMetricsCounterMETA.counterUnit)));
    assert(((cast(*void)(*instance.uintValue)) - cast(*void)(*instance)) == 28, "PerformanceMetricsCounterMETA.uintValue has unexpected offset % instead of 28", ((cast(*void)(*instance.uintValue)) - cast(*void)(*instance)));
    assert(size_of(type_of(PerformanceMetricsCounterMETA.uintValue)) == 4, "PerformanceMetricsCounterMETA.uintValue has unexpected size % instead of 4", size_of(type_of(PerformanceMetricsCounterMETA.uintValue)));
    assert(((cast(*void)(*instance.floatValue)) - cast(*void)(*instance)) == 32, "PerformanceMetricsCounterMETA.floatValue has unexpected offset % instead of 32", ((cast(*void)(*instance.floatValue)) - cast(*void)(*instance)));
    assert(size_of(type_of(PerformanceMetricsCounterMETA.floatValue)) == 4, "PerformanceMetricsCounterMETA.floatValue has unexpected size % instead of 4", size_of(type_of(PerformanceMetricsCounterMETA.floatValue)));
    assert(size_of(PerformanceMetricsCounterMETA) == 40, "PerformanceMetricsCounterMETA has size % instead of 40", size_of(PerformanceMetricsCounterMETA));
}

PFN_xrEnumeratePerformanceMetricsCounterPathsMETA :: #type (a0: Instance, a1: u32, a2: *u32, a3: *Path) -> Result #c_call;
PFN_xrSetPerformanceMetricsStateMETA :: #type (a0: Session, a1: *PerformanceMetricsStateMETA) -> Result #c_call;
PFN_xrGetPerformanceMetricsStateMETA :: #type (a0: Session, a1: *PerformanceMetricsStateMETA) -> Result #c_call;
PFN_xrQueryPerformanceMetricsCounterMETA :: #type (a0: Session, a1: Path, a2: *PerformanceMetricsCounterMETA) -> Result #c_call;

#scope_file

#import "Basic"; // For assert
openxr_loader :: #foreign_library "openxr_loader";
