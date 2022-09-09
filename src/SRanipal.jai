//
// This file was auto-generated using the following command:
//
// jai main.jai
//



///////////////////////////////////////////////////////////////////////////////////////
//
//  IMPORTANT: READ BEFORE DOWNLOADING, COPYING, INSTALLING OR USING.
//
//  By downloading, copying, installing or using the software you agree to this license.
//  If you do not agree to this license, do not download, install,
//  copy or use the software.
//
//                           License Agreement
//                     For Vive Super Reality Library
//
// Copyright (c) 2019,		HTC Corporation
//
// All rights reserved. Third party copyrights are property of their respective owners.
//
// Redistribution and use in source and binary forms, with or without modification,
// are permitted provided that the following conditions are met:
//
//   * Redistribution's of source code must retain the above copyright notice,
//     this list of conditions and the following disclaimer.
//
//   * Redistribution's in binary form must reproduce the above copyright notice,
//     this list of conditions and the following disclaimer in the documentation
//     and/or other materials provided with the distribution.
//
//   * The name of the copyright holders may not be used to endorse or promote products
//     derived from this software without specific prior written permission.
//
// This software is provided by the copyright holders and contributors "as is" and
// any express or implied warranties, including, but not limited to, the implied
// warranties of merchantability and fitness for a particular purpose are disclaimed.
// In no event shall the Intel Corporation or contributors be liable for any direct,
// indirect, incidental, special, exemplary, or consequential damages
// (including, but not limited to, procurement of substitute goods or services;
// loss of use, data, or profits; or business interruption) however caused
// and on any theory of liability, whether in contract, strict liability,
// or tort (including negligence or otherwise) arising in any way out of
// the use of this software, even if advised of the possibility of such damage.
//
ViveSR :: struct {    /** Animation pal
    */
    
    /** @enum AnipalStatus
    An enum type of the status of the specific anipal engine.
    */
    AnipalStatus :: enum s32 {
        ERROR   :: 0;
        IDLE    :: 1;
        WORKING :: 2;

        ANIPAL_STATUS_ERROR   :: ERROR;
        ANIPAL_STATUS_IDLE    :: IDLE;
        ANIPAL_STATUS_WORKING :: WORKING;
    }
    /**
    * Eye module
    */
    
    Calibration :: struct {
        CommandType :: enum s32 {
            IPD_CONFIG :: 7;
            START      :: 8;
            CLEAR      :: 9;
            COLLECT    :: 10;
            DONE       :: 11;
            STOP       :: 12;
        }
    }

    /**
    * @struct Vector3
    * A basic 3d vector type
    */
    Vector3 :: struct {
        union {
            struct {
                x: float;
                y: float;
                z: float;
            }

            elem_: [3] float;
        }
    }
    #run {
        assert(size_of(Vector3) == 12, "Vector3 has size % instead of 12", size_of(Vector3));
    }

    /**
    *  @struct Vector2
    *  A basic 2d vector type
    */
    Vector2 :: struct {
        union {
            struct {
                x: float;
                y: float;
            }

            elem_: [2] float;
        }
    }
    #run {
        assert(size_of(Vector2) == 8, "Vector2 has size % instead of 8", size_of(Vector2));
    }

    /**
    * @struct Matrix4x4
    *  A basic affine matrix in 3D space
    */
    Matrix4x4 :: struct {
        union {
            struct {
                m00: float;
                m33: float;
                m23: float;
                m13: float;
                m03: float;
                m32: float;
                m22: float;
                m02: float;
                m12: float;
                m21: float;
                m11: float;
                m01: float;
                m30: float;
                m20: float;
                m10: float;
                m31: float;
            }

            elem_: [16] float;
        }
    }
    #run {
        assert(size_of(Matrix4x4) == 64, "Matrix4x4 has size % instead of 64", size_of(Matrix4x4));
    }

    /** @enum SingleEyeDataValidity
    An enum type for getting validity from the structure: eye data's bitmask
    */
    SingleEyeDataValidity :: enum s32 {
        GAZE_ORIGIN_VALIDITY                   :: 0;
        GAZE_DIRECTION_VALIDITY                :: 1;
        PUPIL_DIAMETER_VALIDITY                :: 2;
        EYE_OPENNESS_VALIDITY                  :: 3;
        PUPIL_POSITION_IN_SENSOR_AREA_VALIDITY :: 4;

        SINGLE_EYE_DATA_GAZE_ORIGIN_VALIDITY                   :: GAZE_ORIGIN_VALIDITY;
        SINGLE_EYE_DATA_GAZE_DIRECTION_VALIDITY                :: GAZE_DIRECTION_VALIDITY;
        SINGLE_EYE_DATA_PUPIL_DIAMETER_VALIDITY                :: PUPIL_DIAMETER_VALIDITY;
        SINGLE_EYE_DATA_EYE_OPENNESS_VALIDITY                  :: EYE_OPENNESS_VALIDITY;
        SINGLE_EYE_DATA_PUPIL_POSITION_IN_SENSOR_AREA_VALIDITY :: PUPIL_POSITION_IN_SENSOR_AREA_VALIDITY;
    }

    TrackingImprovement :: enum s32 {
        USER_POSITION_HMD                :: 0;
        CALIBRATION_CONTAINS_POOR_DATA   :: 1;
        CALIBRATION_DIFFERENT_BRIGHTNESS :: 2;
        IMAGE_QUALITY                    :: 3;
        INCREASE_EYE_RELIEF              :: 4;

        TRACKING_IMPROVEMENT_USER_POSITION_HMD                :: USER_POSITION_HMD;
        TRACKING_IMPROVEMENT_CALIBRATION_CONTAINS_POOR_DATA   :: CALIBRATION_CONTAINS_POOR_DATA;
        TRACKING_IMPROVEMENT_CALIBRATION_DIFFERENT_BRIGHTNESS :: CALIBRATION_DIFFERENT_BRIGHTNESS;
        TRACKING_IMPROVEMENT_IMAGE_QUALITY                    :: IMAGE_QUALITY;
        TRACKING_IMPROVEMENT_INCREASE_EYE_RELIEF              :: INCREASE_EYE_RELIEF;
    }

    /** A utility function for decoding bits by bitmask.
    @param bits the input as bitmask
    @param position the the position of the bits.
    @return The status of a bit.
    @sa VerboseDataValidity, EyeDataValidity
    */
    DecodeBitMask :: (bits: *u64, position: u8) -> bool #no_context #c_call {
        return (<<bits & (cast(u64)1 << position)) != 0;
    }
    DecodeBitMask :: (bits: u64, position: u8) -> bool #no_context #c_call {
        return DecodeBitMask(*bits, position);
    }

    /** A utility function for encoding bits by bitmask
    @param position the the position of the bits.
    @param status the status you would set.
    @param[out] bits the bits.
    @sa VerboseDataValidity, EyeDataValidity
    */
    EecodeBitMask :: (position: u8, status: bool, bits: *u64) #no_context #c_call {
        the_mask : u64 = (cast(u64)1) << position;
        if status {
            (<<bits) |= the_mask; // REPORT: i need braces for this
        } else {
            (<<bits) &= ~the_mask;   
        }
    }

    TrackingImprovements :: struct {
        count: s32;
        union {
            struct {
                t0: TrackingImprovement;
                t1: TrackingImprovement;
                t2: TrackingImprovement;
                t3: TrackingImprovement;
                t4: TrackingImprovement;
                t5: TrackingImprovement;
                t6: TrackingImprovement;
                t7: TrackingImprovement;
                t8: TrackingImprovement;
                t9: TrackingImprovement;
            }

            elem_: [10] TrackingImprovement;
        }
    }
    #run {
        instance: TrackingImprovements;
        assert(((cast(*void)(*instance.count)) - cast(*void)(*instance)) == 0, "TrackingImprovements.count has unexpected offset % instead of 0", ((cast(*void)(*instance.count)) - cast(*void)(*instance)));
        assert(size_of(type_of(TrackingImprovements.count)) == 4, "TrackingImprovements.count has unexpected size % instead of 4", size_of(type_of(TrackingImprovements.count)));
        assert(size_of(TrackingImprovements) == 44, "TrackingImprovements has size % instead of 44", size_of(TrackingImprovements));
    }

    /** @struct GazeRayParameter
    * A struct containing all data listed below.
    */
    GazeRayParameter :: struct {
        sensitive_factor: float64; /*!<The sensitive factor of gaze ray in [0,1]. The bigger factor is, the more sensitive the gaze ray is.*/
    }
    #run {
        instance: GazeRayParameter;
        assert(((cast(*void)(*instance.sensitive_factor)) - cast(*void)(*instance)) == 0, "GazeRayParameter.sensitive_factor has unexpected offset % instead of 0", ((cast(*void)(*instance.sensitive_factor)) - cast(*void)(*instance)));
        assert(size_of(type_of(GazeRayParameter.sensitive_factor)) == 8, "GazeRayParameter.sensitive_factor has unexpected size % instead of 8", size_of(type_of(GazeRayParameter.sensitive_factor)));
        assert(size_of(GazeRayParameter) == 8, "GazeRayParameter has size % instead of 8", size_of(GazeRayParameter));
    }

    /** @struct EyeParameter
    * A struct containing all data listed below.
    */
    EyeParameter :: struct {
        gaze_ray_parameter: GazeRayParameter;
    }
    #run {
        instance: EyeParameter;
        assert(((cast(*void)(*instance.gaze_ray_parameter)) - cast(*void)(*instance)) == 0, "EyeParameter.gaze_ray_parameter has unexpected offset % instead of 0", ((cast(*void)(*instance.gaze_ray_parameter)) - cast(*void)(*instance)));
        assert(size_of(type_of(EyeParameter.gaze_ray_parameter)) == 8, "EyeParameter.gaze_ray_parameter has unexpected size % instead of 8", size_of(type_of(EyeParameter.gaze_ray_parameter)));
        assert(size_of(EyeParameter) == 8, "EyeParameter has size % instead of 8", size_of(EyeParameter));
    }

    /** @struct SingleEyeData
    * A struct containing status related an eye.
    */
    SingleEyeData :: struct {
        eye_data_validata_bit_mask:    u64; /*!<The bits containing all validity for this frame.*/
        gaze_origin_mm:                Vector3; /*!<The point in the eye from which the gaze ray originates in meter miles.(right-handed coordinate system)*/
        gaze_direction_normalized:     Vector3;
        pupil_diameter_mm:             float; /*!<The diameter of the pupil in meter miles*/
        eye_openness:                  float; /*!<A value representing how open the eye is.*/
        pupil_position_in_sensor_area: Vector2; /*!<The normalized position of a pupil in [0,1]*/
    }
    #run {
        instance: SingleEyeData;
        assert(((cast(*void)(*instance.eye_data_validata_bit_mask)) - cast(*void)(*instance)) == 0, "SingleEyeData.eye_data_validata_bit_mask has unexpected offset % instead of 0", ((cast(*void)(*instance.eye_data_validata_bit_mask)) - cast(*void)(*instance)));
        assert(size_of(type_of(SingleEyeData.eye_data_validata_bit_mask)) == 8, "SingleEyeData.eye_data_validata_bit_mask has unexpected size % instead of 8", size_of(type_of(SingleEyeData.eye_data_validata_bit_mask)));
        assert(((cast(*void)(*instance.gaze_origin_mm)) - cast(*void)(*instance)) == 8, "SingleEyeData.gaze_origin_mm has unexpected offset % instead of 8", ((cast(*void)(*instance.gaze_origin_mm)) - cast(*void)(*instance)));
        assert(size_of(type_of(SingleEyeData.gaze_origin_mm)) == 12, "SingleEyeData.gaze_origin_mm has unexpected size % instead of 12", size_of(type_of(SingleEyeData.gaze_origin_mm)));
        assert(((cast(*void)(*instance.gaze_direction_normalized)) - cast(*void)(*instance)) == 20, "SingleEyeData.gaze_direction_normalized has unexpected offset % instead of 20", ((cast(*void)(*instance.gaze_direction_normalized)) - cast(*void)(*instance)));
        assert(size_of(type_of(SingleEyeData.gaze_direction_normalized)) == 12, "SingleEyeData.gaze_direction_normalized has unexpected size % instead of 12", size_of(type_of(SingleEyeData.gaze_direction_normalized)));
        assert(((cast(*void)(*instance.pupil_diameter_mm)) - cast(*void)(*instance)) == 32, "SingleEyeData.pupil_diameter_mm has unexpected offset % instead of 32", ((cast(*void)(*instance.pupil_diameter_mm)) - cast(*void)(*instance)));
        assert(size_of(type_of(SingleEyeData.pupil_diameter_mm)) == 4, "SingleEyeData.pupil_diameter_mm has unexpected size % instead of 4", size_of(type_of(SingleEyeData.pupil_diameter_mm)));
        assert(((cast(*void)(*instance.eye_openness)) - cast(*void)(*instance)) == 36, "SingleEyeData.eye_openness has unexpected offset % instead of 36", ((cast(*void)(*instance.eye_openness)) - cast(*void)(*instance)));
        assert(size_of(type_of(SingleEyeData.eye_openness)) == 4, "SingleEyeData.eye_openness has unexpected size % instead of 4", size_of(type_of(SingleEyeData.eye_openness)));
        assert(((cast(*void)(*instance.pupil_position_in_sensor_area)) - cast(*void)(*instance)) == 40, "SingleEyeData.pupil_position_in_sensor_area has unexpected offset % instead of 40", ((cast(*void)(*instance.pupil_position_in_sensor_area)) - cast(*void)(*instance)));
        assert(size_of(type_of(SingleEyeData.pupil_position_in_sensor_area)) == 8, "SingleEyeData.pupil_position_in_sensor_area has unexpected size % instead of 8", size_of(type_of(SingleEyeData.pupil_position_in_sensor_area)));
        assert(size_of(SingleEyeData) == 48, "SingleEyeData has size % instead of 48", size_of(SingleEyeData));
    }

    /** @struct SingleEyeData
    * A struct containing status related an eye.
    */

    CombinedEyeData :: struct {
        eye_data:                      SingleEyeData;
        convergence_distance_validity: bool;
        convergence_distance_mm:       float;
    }
    #run {
        instance: CombinedEyeData;
        assert(((cast(*void)(*instance.eye_data)) - cast(*void)(*instance)) == 0, "CombinedEyeData.eye_data has unexpected offset % instead of 0", ((cast(*void)(*instance.eye_data)) - cast(*void)(*instance)));
        assert(size_of(type_of(CombinedEyeData.eye_data)) == 48, "CombinedEyeData.eye_data has unexpected size % instead of 48", size_of(type_of(CombinedEyeData.eye_data)));
        assert(((cast(*void)(*instance.convergence_distance_validity)) - cast(*void)(*instance)) == 48, "CombinedEyeData.convergence_distance_validity has unexpected offset % instead of 48", ((cast(*void)(*instance.convergence_distance_validity)) - cast(*void)(*instance)));
        assert(size_of(type_of(CombinedEyeData.convergence_distance_validity)) == 1, "CombinedEyeData.convergence_distance_validity has unexpected size % instead of 1", size_of(type_of(CombinedEyeData.convergence_distance_validity)));
        assert(((cast(*void)(*instance.convergence_distance_mm)) - cast(*void)(*instance)) == 52, "CombinedEyeData.convergence_distance_mm has unexpected offset % instead of 52", ((cast(*void)(*instance.convergence_distance_mm)) - cast(*void)(*instance)));
        assert(size_of(type_of(CombinedEyeData.convergence_distance_mm)) == 4, "CombinedEyeData.convergence_distance_mm has unexpected size % instead of 4", size_of(type_of(CombinedEyeData.convergence_distance_mm)));
        assert(size_of(CombinedEyeData) == 56, "CombinedEyeData has size % instead of 56", size_of(CombinedEyeData));
    }

    /** @struct VerboseData
    * A struct containing all data listed below.
    */
    VerboseData :: struct {
        left:                  SingleEyeData; /*!<A instance of the struct as @ref EyeData related to the left eye*/
        right:                 SingleEyeData; /*!<A instance of the struct as @ref EyeData related to the right eye*/
        combined:              CombinedEyeData; /*!<A instance of the struct as @ref EyeData related to the combined eye*/
        tracking_improvements: TrackingImprovements;
    }
    #run {
        instance: VerboseData;
        assert(((cast(*void)(*instance.left)) - cast(*void)(*instance)) == 0, "VerboseData.left has unexpected offset % instead of 0", ((cast(*void)(*instance.left)) - cast(*void)(*instance)));
        assert(size_of(type_of(VerboseData.left)) == 48, "VerboseData.left has unexpected size % instead of 48", size_of(type_of(VerboseData.left)));
        assert(((cast(*void)(*instance.right)) - cast(*void)(*instance)) == 48, "VerboseData.right has unexpected offset % instead of 48", ((cast(*void)(*instance.right)) - cast(*void)(*instance)));
        assert(size_of(type_of(VerboseData.right)) == 48, "VerboseData.right has unexpected size % instead of 48", size_of(type_of(VerboseData.right)));
        assert(((cast(*void)(*instance.combined)) - cast(*void)(*instance)) == 96, "VerboseData.combined has unexpected offset % instead of 96", ((cast(*void)(*instance.combined)) - cast(*void)(*instance)));
        assert(size_of(type_of(VerboseData.combined)) == 56, "VerboseData.combined has unexpected size % instead of 56", size_of(type_of(VerboseData.combined)));
        assert(((cast(*void)(*instance.tracking_improvements)) - cast(*void)(*instance)) == 152, "VerboseData.tracking_improvements has unexpected offset % instead of 152", ((cast(*void)(*instance.tracking_improvements)) - cast(*void)(*instance)));
        assert(size_of(type_of(VerboseData.tracking_improvements)) == 44, "VerboseData.tracking_improvements has unexpected size % instead of 44", size_of(type_of(VerboseData.tracking_improvements)));
        assert(size_of(VerboseData) == 200, "VerboseData has size % instead of 200", size_of(VerboseData));
    }

    /** @struct VerboseData
    * A struct containing all data listed below.
    */

    /** @struct EyeData
    * A struct containing all data listed below.
    */
    EyeData :: struct {
        no_user:        bool;
        frame_sequence: s32; /*!<The frame sequence.*/
        timestamp:      s32; /*!<The time when the frame was capturing. in millisecond.*/
        verbose_data:   VerboseData;
    }
    #run {
        instance: EyeData;
        assert(((cast(*void)(*instance.no_user)) - cast(*void)(*instance)) == 0, "EyeData.no_user has unexpected offset % instead of 0", ((cast(*void)(*instance.no_user)) - cast(*void)(*instance)));
        assert(size_of(type_of(EyeData.no_user)) == 1, "EyeData.no_user has unexpected size % instead of 1", size_of(type_of(EyeData.no_user)));
        assert(((cast(*void)(*instance.frame_sequence)) - cast(*void)(*instance)) == 4, "EyeData.frame_sequence has unexpected offset % instead of 4", ((cast(*void)(*instance.frame_sequence)) - cast(*void)(*instance)));
        assert(size_of(type_of(EyeData.frame_sequence)) == 4, "EyeData.frame_sequence has unexpected size % instead of 4", size_of(type_of(EyeData.frame_sequence)));
        assert(((cast(*void)(*instance.timestamp)) - cast(*void)(*instance)) == 8, "EyeData.timestamp has unexpected offset % instead of 8", ((cast(*void)(*instance.timestamp)) - cast(*void)(*instance)));
        assert(size_of(type_of(EyeData.timestamp)) == 4, "EyeData.timestamp has unexpected size % instead of 4", size_of(type_of(EyeData.timestamp)));
        assert(((cast(*void)(*instance.verbose_data)) - cast(*void)(*instance)) == 16, "EyeData.verbose_data has unexpected offset % instead of 16", ((cast(*void)(*instance.verbose_data)) - cast(*void)(*instance)));
        assert(size_of(type_of(EyeData.verbose_data)) == 200, "EyeData.verbose_data has unexpected size % instead of 200", size_of(type_of(EyeData.verbose_data)));
        assert(size_of(EyeData) == 216, "EyeData has size % instead of 216", size_of(EyeData));
    }

    SingleEyeExpression :: struct {
        eye_wide:    float; /*!<A value representing how open eye widely.*/
        eye_squeeze: float; /*!<A value representing how the eye is closed tightly.*/
        eye_frown:   float; /*!<A value representing user's frown.*/
    }
    #run {
        instance: SingleEyeExpression;
        assert(((cast(*void)(*instance.eye_wide)) - cast(*void)(*instance)) == 0, "SingleEyeExpression.eye_wide has unexpected offset % instead of 0", ((cast(*void)(*instance.eye_wide)) - cast(*void)(*instance)));
        assert(size_of(type_of(SingleEyeExpression.eye_wide)) == 4, "SingleEyeExpression.eye_wide has unexpected size % instead of 4", size_of(type_of(SingleEyeExpression.eye_wide)));
        assert(((cast(*void)(*instance.eye_squeeze)) - cast(*void)(*instance)) == 4, "SingleEyeExpression.eye_squeeze has unexpected offset % instead of 4", ((cast(*void)(*instance.eye_squeeze)) - cast(*void)(*instance)));
        assert(size_of(type_of(SingleEyeExpression.eye_squeeze)) == 4, "SingleEyeExpression.eye_squeeze has unexpected size % instead of 4", size_of(type_of(SingleEyeExpression.eye_squeeze)));
        assert(((cast(*void)(*instance.eye_frown)) - cast(*void)(*instance)) == 8, "SingleEyeExpression.eye_frown has unexpected offset % instead of 8", ((cast(*void)(*instance.eye_frown)) - cast(*void)(*instance)));
        assert(size_of(type_of(SingleEyeExpression.eye_frown)) == 4, "SingleEyeExpression.eye_frown has unexpected size % instead of 4", size_of(type_of(SingleEyeExpression.eye_frown)));
        assert(size_of(SingleEyeExpression) == 12, "SingleEyeExpression has size % instead of 12", size_of(SingleEyeExpression));
    }

    EyeExpression :: struct {
        left:  SingleEyeExpression;
        right: SingleEyeExpression;
    }
    #run {
        instance: EyeExpression;
        assert(((cast(*void)(*instance.left)) - cast(*void)(*instance)) == 0, "EyeExpression.left has unexpected offset % instead of 0", ((cast(*void)(*instance.left)) - cast(*void)(*instance)));
        assert(size_of(type_of(EyeExpression.left)) == 12, "EyeExpression.left has unexpected size % instead of 12", size_of(type_of(EyeExpression.left)));
        assert(((cast(*void)(*instance.right)) - cast(*void)(*instance)) == 12, "EyeExpression.right has unexpected offset % instead of 12", ((cast(*void)(*instance.right)) - cast(*void)(*instance)));
        assert(size_of(type_of(EyeExpression.right)) == 12, "EyeExpression.right has unexpected size % instead of 12", size_of(type_of(EyeExpression.right)));
        assert(size_of(EyeExpression) == 24, "EyeExpression has size % instead of 24", size_of(EyeExpression));
    }

    /** @struct EyeData
    * A struct containing all data listed below.
    */
    EyeData_v2 :: struct {
        no_user:         bool;
        frame_sequence:  s32; /*!<The frame sequence.*/
        timestamp:       s32; /*!<The time when the frame was capturing. in millisecond.*/
        verbose_data:    VerboseData;
        expression_data: EyeExpression;
    }
    #run {
        instance: EyeData_v2;
        assert(((cast(*void)(*instance.no_user)) - cast(*void)(*instance)) == 0, "EyeData_v2.no_user has unexpected offset % instead of 0", ((cast(*void)(*instance.no_user)) - cast(*void)(*instance)));
        assert(size_of(type_of(EyeData_v2.no_user)) == 1, "EyeData_v2.no_user has unexpected size % instead of 1", size_of(type_of(EyeData_v2.no_user)));
        assert(((cast(*void)(*instance.frame_sequence)) - cast(*void)(*instance)) == 4, "EyeData_v2.frame_sequence has unexpected offset % instead of 4", ((cast(*void)(*instance.frame_sequence)) - cast(*void)(*instance)));
        assert(size_of(type_of(EyeData_v2.frame_sequence)) == 4, "EyeData_v2.frame_sequence has unexpected size % instead of 4", size_of(type_of(EyeData_v2.frame_sequence)));
        assert(((cast(*void)(*instance.timestamp)) - cast(*void)(*instance)) == 8, "EyeData_v2.timestamp has unexpected offset % instead of 8", ((cast(*void)(*instance.timestamp)) - cast(*void)(*instance)));
        assert(size_of(type_of(EyeData_v2.timestamp)) == 4, "EyeData_v2.timestamp has unexpected size % instead of 4", size_of(type_of(EyeData_v2.timestamp)));
        assert(((cast(*void)(*instance.verbose_data)) - cast(*void)(*instance)) == 16, "EyeData_v2.verbose_data has unexpected offset % instead of 16", ((cast(*void)(*instance.verbose_data)) - cast(*void)(*instance)));
        assert(size_of(type_of(EyeData_v2.verbose_data)) == 200, "EyeData_v2.verbose_data has unexpected size % instead of 200", size_of(type_of(EyeData_v2.verbose_data)));
        assert(((cast(*void)(*instance.expression_data)) - cast(*void)(*instance)) == 216, "EyeData_v2.expression_data has unexpected offset % instead of 216", ((cast(*void)(*instance.expression_data)) - cast(*void)(*instance)));
        assert(size_of(type_of(EyeData_v2.expression_data)) == 24, "EyeData_v2.expression_data has unexpected size % instead of 24", size_of(type_of(EyeData_v2.expression_data)));
        assert(size_of(EyeData_v2) == 240, "EyeData_v2 has size % instead of 240", size_of(EyeData_v2));
    }

    ANIPAL_TYPE_EYE: s32 : 0;

    ANIPAL_TYPE_EYE_V2: s32 : 2;

    /** Check HMD device is ViveProEye or not.
    * @return true : ViveProEye, false : other HMD.
    */
    IsViveProEye :: () -> bool #foreign sranipal;

    /** Gets data from anipal's Eye module.
    * @param data ViveSR::anipal::Eye::EyeData
    * @return Indicates the resulting ViveSR::Error status of this method.
    */
    GetEyeData :: (data: *EyeData) -> s32 #foreign sranipal;

    /** Gets data from anipal's Eye module.
    * @param data ViveSR::anipal::Eye::EyeData
    * @return Indicates the resulting ViveSR::Error status of this method.
    */
    GetEyeData_v2 :: (data: *EyeData_v2) -> s32 #foreign sranipal;

    /** Sets the parameter of anipal's Eye module.
    * @param parameter ViveSR::anipal::Eye::EyeParameter
    * @return Indicates the resulting ViveSR::Error status of this method.
    */
    SetEyeParameter :: (parameter: EyeParameter) -> s32 #foreign sranipal;

    /** Get the EyeParameter from Eye engine.
    * @param parameter ViveSR::anipal::Eye::EyeParameter
    * @return Indicates the resulting ViveSR::Error status of this method.
    */
    GetEyeParameter :: (parameter: *EyeParameter) -> s32 #foreign sranipal;

    /** Launches anipal's Eye Calibration tool (an overlay program).
    * @param callback (Upcoming feature) A callback method invoked at the end of the calibration process.
    * @return Indicates the resulting ViveSR::Error and CalibrationExitCode status of this method.
    */
    LaunchEyeCalibration :: (callback: *void) -> s32 #foreign sranipal;

    /** Indicate if user is use right calibration configuration and in good IPD and HMD position.
    * @param[out] result Indicate is needed or not.
    * @return Indicates the resulting ViveSR::Error status of this method.
    */
    IsUserNeedCalibration :: (need: *bool) -> s32 #foreign sranipal;

    /* Register a callback function to receive eye camera related data when the module has new outputs.
    [in] function pointer of callback
    [out] error code. please refer Error in ViveSR_Enums.h
    */
    RegisterEyeDataCallback :: (callback: VivesrEyeDataCallback) -> s32 #foreign sranipal;

    /* Unegister a callback function to stop receiving eye camera related data.
    [in] function pointer of callback
    [out] error code. please refer Error in ViveSR_Enums.h
    */
    UnregisterEyeDataCallback :: (callback: VivesrEyeDataCallback) -> s32 #foreign sranipal;

    /* Register a callback function to receive eye camera related data when the module has new outputs.
    [in] function pointer of callback
    [out] error code. please refer Error in ViveSR_Enums.h
    */
    RegisterEyeDataCallback_v2 :: (callback: VivesrEyeDataCallback_v2) -> s32 #foreign sranipal;

    /* Unegister a callback function to stop receiving eye camera related data.
    [in] function pointer of callback
    [out] error code. please refer Error in ViveSR_Enums.h
    */
    UnregisterEyeDataCallback_v2 :: (callback: VivesrEyeDataCallback_v2) -> s32 #foreign sranipal;

    /* Synchronization the clock on the device and the clock on the system.
    * @param[in] Trigger for Synchronization function.
    * @return error code. please refer Error in ViveSR_Enums.h
    */
    SRanipal_UpdateTimeSync :: () -> Error #foreign sranipal;

    /* Get the system timestamp.
    * @param[out] the value of system timestamp.
    * @return error code. please refer Error in ViveSR_Enums.h
    */
    SRanipal_GetSystemTime :: (time: *s64) -> Error #foreign sranipal;

    /**
    One of return code of API LaunchEyeCalibration()
    */
    CalibrationExitCode :: enum s32 {
        CALIBRATION_IS_ALREADY_RUNNING   :: 2001;
        OPENVR_DASHBOARD_ACTIVATED       :: 2002;
        OPENVR_INIT_FAILED               :: 2003;
        OPENVR_OVERLAY_ALREADY_EXISTS    :: 2004;
        OPENVR_OVERLAY_CREATE_FAILED     :: 2005;
        OPENVR_OVERLAY_INTERFACE_INVALID :: 2006;
        OPENVR_QUIT                      :: 2007;
    }

    GetEyeDataAndImage :: (data: *EyeData, image: **u8, weightings: **float) -> s32 #foreign sranipal;

    /**
    * Lip module
    */
    Lip :: struct {
        /** @enum LipShape
        An enum type for defined muscle.
        */
        LipShape :: enum s32 {
            Jaw_Forward           :: 0;
            Jaw_Right             :: 1;
            Jaw_Left              :: 2;
            Jaw_Open              :: 3;
            Mouth_Ape_Shape       :: 4;
            Mouth_O_Shape         :: 5;
            Mouth_Pout            :: 6;
            Mouth_Lower_Right     :: 7;
            Mouth_Lower_Left      :: 8;
            Mouth_Smile_Right     :: 9;
            Mouth_Smile_Left      :: 10;
            Mouth_Sad_Right       :: 11;
            Mouth_Sad_Left        :: 12;
            Cheek_Puff_Right      :: 13;
            Cheek_Puff_Left       :: 14;
            Mouth_Lower_Inside    :: 15;
            Mouth_Upper_Inside    :: 16;
            Mouth_Lower_Overlay   :: 17;
            Mouth_Upper_Overlay   :: 18;
            Cheek_Suck            :: 19;
            Mouth_LowerRight_Down :: 20;
            Mouth_LowerLeft_Down  :: 21;
            Mouth_UpperRight_Up   :: 22;
            Mouth_UpperLeft_Up    :: 23;
            Mouth_Philtrum_Right  :: 24;
            Mouth_Philtrum_Left   :: 25;
            None                  :: 26;
        }

        /**
        * @struct PredictionData
        * A struct containing all data listed below.
        */
        PredictionData :: struct {
            blend_shape_weight: [27] float; /*!<The prediction result listing all of @ref LipShape in [0,1].*/
        }
        #run {
            instance: PredictionData;
            assert(((cast(*void)(*instance.blend_shape_weight)) - cast(*void)(*instance)) == 0, "PredictionData.blend_shape_weight has unexpected offset % instead of 0", ((cast(*void)(*instance.blend_shape_weight)) - cast(*void)(*instance)));
            assert(size_of(type_of(PredictionData.blend_shape_weight)) == 108, "PredictionData.blend_shape_weight has unexpected size % instead of 108", size_of(type_of(PredictionData.blend_shape_weight)));
            assert(size_of(PredictionData) == 108, "PredictionData has size % instead of 108", size_of(PredictionData));
        }

        /**
        * @struct LipData
        * A struct containing all data listed below.
        */
        LipData :: struct {
            frame_sequence:  s32; /*!<The frame sequence.*/
            timestamp:       s32; /*!<The time when the frame was capturing. in millisecond.*/
            image:           *u8; /*!<The raw buffer. width=800, height=400, channel=1*/
            prediction_data: PredictionData; /*!<The prediction result listing all of @ref LipShape in [0,1].*/
        }
        #run {
            instance: LipData;
            assert(((cast(*void)(*instance.frame_sequence)) - cast(*void)(*instance)) == 0, "LipData.frame_sequence has unexpected offset % instead of 0", ((cast(*void)(*instance.frame_sequence)) - cast(*void)(*instance)));
            assert(size_of(type_of(LipData.frame_sequence)) == 4, "LipData.frame_sequence has unexpected size % instead of 4", size_of(type_of(LipData.frame_sequence)));
            assert(((cast(*void)(*instance.timestamp)) - cast(*void)(*instance)) == 4, "LipData.timestamp has unexpected offset % instead of 4", ((cast(*void)(*instance.timestamp)) - cast(*void)(*instance)));
            assert(size_of(type_of(LipData.timestamp)) == 4, "LipData.timestamp has unexpected size % instead of 4", size_of(type_of(LipData.timestamp)));
            assert(((cast(*void)(*instance.image)) - cast(*void)(*instance)) == 8, "LipData.image has unexpected offset % instead of 8", ((cast(*void)(*instance.image)) - cast(*void)(*instance)));
            assert(size_of(type_of(LipData.image)) == 8, "LipData.image has unexpected size % instead of 8", size_of(type_of(LipData.image)));
            assert(((cast(*void)(*instance.prediction_data)) - cast(*void)(*instance)) == 16, "LipData.prediction_data has unexpected offset % instead of 16", ((cast(*void)(*instance.prediction_data)) - cast(*void)(*instance)));
            assert(size_of(type_of(LipData.prediction_data)) == 108, "LipData.prediction_data has unexpected size % instead of 108", size_of(type_of(LipData.prediction_data)));
            assert(size_of(LipData) == 128, "LipData has size % instead of 128", size_of(LipData));
        }

        blend_shape_nums: s32 : 60;

        /** @enum LipShape
        An enum type for defined muscle.
        */
        Version2 :: struct {
            /**
            * To avoid naming conflict
            */
            LipShape_v2 :: enum s32 {
                None                   :: -1;
                Jaw_Right              :: 0;
                Jaw_Left               :: 1;
                Jaw_Forward            :: 2;
                Jaw_Open               :: 3;
                Mouth_Ape_Shape        :: 4;
                Mouth_Upper_Right      :: 5;
                Mouth_Upper_Left       :: 6;
                Mouth_Lower_Right      :: 7;
                Mouth_Lower_Left       :: 8;
                Mouth_Upper_Overturn   :: 9;
                Mouth_Lower_Overturn   :: 10;
                Mouth_Pout             :: 11;
                Mouth_Smile_Right      :: 12;
                Mouth_Smile_Left       :: 13;
                Mouth_Sad_Right        :: 14;
                Mouth_Sad_Left         :: 15;
                Cheek_Puff_Right       :: 16;
                Cheek_Puff_Left        :: 17;
                Cheek_Suck             :: 18;
                Mouth_Upper_UpRight    :: 19;
                Mouth_Upper_UpLeft     :: 20;
                Mouth_Lower_DownRight  :: 21;
                Mouth_Lower_DownLeft   :: 22;
                Mouth_Upper_Inside     :: 23;
                Mouth_Lower_Inside     :: 24;
                Mouth_Lower_Overlay    :: 25;
                Tongue_LongStep1       :: 26;
                Tongue_LongStep2       :: 32;
                Tongue_Down            :: 30;
                Tongue_Up              :: 29;
                Tongue_Right           :: 28;
                Tongue_Left            :: 27;
                Tongue_Roll            :: 31;
                Tongue_UpLeft_Morph    :: 34;
                Tongue_UpRight_Morph   :: 33;
                Tongue_DownLeft_Morph  :: 36;
                Tongue_DownRight_Morph :: 35;
                Max                    :: 37;
            }
        }

        /**
        * @struct PredictionData
        * A struct containing all data listed below.
        */
        PredictionData_v2 :: struct {
            blend_shape_weight: [60] float; /*!<The prediction result listing all of @ref LipShape in [0,1].*/
        }
        #run {
            instance: PredictionData_v2;
            assert(((cast(*void)(*instance.blend_shape_weight)) - cast(*void)(*instance)) == 0, "PredictionData_v2.blend_shape_weight has unexpected offset % instead of 0", ((cast(*void)(*instance.blend_shape_weight)) - cast(*void)(*instance)));
            assert(size_of(type_of(PredictionData_v2.blend_shape_weight)) == 240, "PredictionData_v2.blend_shape_weight has unexpected size % instead of 240", size_of(type_of(PredictionData_v2.blend_shape_weight)));
            assert(size_of(PredictionData_v2) == 240, "PredictionData_v2 has size % instead of 240", size_of(PredictionData_v2));
        }

        /**
        * @struct LipData
        * A struct containing all data listed below.
        */
        LipData_v2 :: struct {
            frame_sequence:  s32; /*!<The frame sequence.*/
            timestamp:       s32; /*!<The time when the frame was capturing. in millisecond.*/
            image:           *u8; /*!<The raw buffer. width=800, height=400, channel=1*/
            prediction_data: PredictionData_v2; /*!<The prediction result listing all of @ref LipShape in [0,1].*/
        }
        #run {
            instance: LipData_v2;
            assert(((cast(*void)(*instance.frame_sequence)) - cast(*void)(*instance)) == 0, "LipData_v2.frame_sequence has unexpected offset % instead of 0", ((cast(*void)(*instance.frame_sequence)) - cast(*void)(*instance)));
            assert(size_of(type_of(LipData_v2.frame_sequence)) == 4, "LipData_v2.frame_sequence has unexpected size % instead of 4", size_of(type_of(LipData_v2.frame_sequence)));
            assert(((cast(*void)(*instance.timestamp)) - cast(*void)(*instance)) == 4, "LipData_v2.timestamp has unexpected offset % instead of 4", ((cast(*void)(*instance.timestamp)) - cast(*void)(*instance)));
            assert(size_of(type_of(LipData_v2.timestamp)) == 4, "LipData_v2.timestamp has unexpected size % instead of 4", size_of(type_of(LipData_v2.timestamp)));
            assert(((cast(*void)(*instance.image)) - cast(*void)(*instance)) == 8, "LipData_v2.image has unexpected offset % instead of 8", ((cast(*void)(*instance.image)) - cast(*void)(*instance)));
            assert(size_of(type_of(LipData_v2.image)) == 8, "LipData_v2.image has unexpected size % instead of 8", size_of(type_of(LipData_v2.image)));
            assert(((cast(*void)(*instance.prediction_data)) - cast(*void)(*instance)) == 16, "LipData_v2.prediction_data has unexpected offset % instead of 16", ((cast(*void)(*instance.prediction_data)) - cast(*void)(*instance)));
            assert(size_of(type_of(LipData_v2.prediction_data)) == 240, "LipData_v2.prediction_data has unexpected size % instead of 240", size_of(type_of(LipData_v2.prediction_data)));
            assert(size_of(LipData_v2) == 256, "LipData_v2 has size % instead of 256", size_of(LipData_v2));
        }

        ANIPAL_TYPE_LIP: s32 : 1;

        ANIPAL_TYPE_LIP_V2: s32 : 3;

        /** Gets the LipData from Lip engine.
        * @param data ViveSR::anipal::Lip::LipData
        * @return Indicates the resulting ViveSR::Error status of this method.
        */
        GetLipData :: (data: *LipData) -> s32 #foreign sranipal;

        /** Gets the LipData_v2 from Lip engine. The version 2 LipData contains tongue's blendshape
        * @param data ViveSR::anipal::Lip::LipData_v2
        * @return Indicates the resulting ViveSR::Error status of this method.
        */
        GetLipData_v2 :: (data: *LipData_v2) -> s32 #foreign sranipal;
    }

    /** Create connection between SR_Runtime.
    */
    CreateRuntimeConnection :: () -> s32 #foreign sranipal;

    ModuleStatus :: enum s32 {
        CREATE  :: 0;
        INITIAL :: 1;
        START   :: 2;
        STOP    :: 3;
        RELEASE :: 4;
        DESTROY :: 5;
    }

    Error :: enum s32 {
        RUNTIME_NOT_FOUND        :: -3;
        NOT_INITIAL              :: -2;
        FAILED                   :: -1;
        WORK                     :: 0;
        INVALID_INPUT            :: 1;
        FILE_NOT_FOUND           :: 2;
        DATA_NOT_FOUND           :: 13;
        UNDEFINED                :: 319;
        INITIAL_FAILED           :: 1001;
        NOT_IMPLEMENTED          :: 1003;
        NULL_POINTER             :: 1004;
        OVER_MAX_LENGTH          :: 1005;
        FILE_INVALID             :: 1006;
        UNINSTALL_STEAM          :: 1007;
        MEMCPY_FAIL              :: 1008;
        NOT_MATCH                :: 1009;
        NODE_NOT_EXIST           :: 1010;
        UNKONW_MODULE            :: 1011;
        MODULE_FULL              :: 1012;
        UNKNOW_TYPE              :: 1013;
        INVALID_MODULE           :: 1014;
        INVALID_TYPE             :: 1015;
        MEMORY_NOT_ENOUGH        :: 1016;
        BUSY                     :: 1017;
        NOT_SUPPORTED            :: 1018;
        INVALID_VALUE            :: 1019;
        COMING_SOON              :: 1020;
        INVALID_CHANGE           :: 1021;
        TIMEOUT                  :: 1022;
        DEVICE_NOT_FOUND         :: 1023;
        INVALID_DEVICE           :: 1024;
        NOT_AUTHORIZED           :: 1025;
        ALREADY                  :: 1026;
        INTERNAL                 :: 1027;
        CONNECTION_FAILED        :: 1028;
        ALLOCATION_FAILED        :: 1029;
        OPERATION_FAILED         :: 1030;
        NOT_AVAILABLE            :: 1031;
        CALLBACK_IN_PROGRESS     :: 1032;
        SERVICE_NOT_FOUND        :: 1033;
        DISABLED_BY_USER         :: 1034;
        EULA_NOT_ACCEPT          :: 1035;
        RUNTIME_NO_RESPONSE      :: 1036;
        OPENCL_NOT_SUPPORT       :: 1037;
        NOT_SUPPORT_EYE_TRACKING :: 1038;

        LIP_NOT_SUPPORT          :: 1051;
    }
}

VivesrEyeDataCallback :: #type (a0: *ViveSR.EyeData) -> void #c_call;

VivesrEyeDataCallback_v2 :: #type (a0: *ViveSR.EyeData_v2) -> void #c_call;

#scope_file

#import "Basic"; // For assert
sranipal :: #foreign_library,no_dll "../lib/SRanipal";
