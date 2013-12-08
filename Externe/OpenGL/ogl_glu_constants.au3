#include-once

; Boolean
Global Const $GLU_FALSE = 0
Global Const $GLU_TRUE = 1

; Version
Global Const $GLU_VERSION_1_1 = 1
Global Const $GLU_VERSION_1_2 = 1

; StringName
Global Const $GLU_VERSION = 100800
Global Const $GLU_EXTENSIONS = 100801

; ErrorCode
Global Const $GLU_INVALID_ENUM = 100900
Global Const $GLU_INVALID_VALUE = 100901
Global Const $GLU_OUT_OF_MEMORY = 100902
Global Const $GLU_INVALID_OPERATION = 100904

; NurbsDisplay
; GLU_FILL
Global Const $GLU_OUTLINE_POLYGON = 100240
Global Const $GLU_OUTLINE_PATCH = 100241

; NurbsError
Global Const $GLU_NURBS_ERROR1 = 100251
Global Const $GLU_NURBS_ERROR2 = 100252
Global Const $GLU_NURBS_ERROR3 = 100253
Global Const $GLU_NURBS_ERROR4 = 100254
Global Const $GLU_NURBS_ERROR5 = 100255
Global Const $GLU_NURBS_ERROR6 = 100256
Global Const $GLU_NURBS_ERROR7 = 100257
Global Const $GLU_NURBS_ERROR8 = 100258
Global Const $GLU_NURBS_ERROR9 = 100259
Global Const $GLU_NURBS_ERROR10 = 100260
Global Const $GLU_NURBS_ERROR11 = 100261
Global Const $GLU_NURBS_ERROR12 = 100262
Global Const $GLU_NURBS_ERROR13 = 100263
Global Const $GLU_NURBS_ERROR14 = 100264
Global Const $GLU_NURBS_ERROR15 = 100265
Global Const $GLU_NURBS_ERROR16 = 100266
Global Const $GLU_NURBS_ERROR17 = 100267
Global Const $GLU_NURBS_ERROR18 = 100268
Global Const $GLU_NURBS_ERROR19 = 100269
Global Const $GLU_NURBS_ERROR20 = 100270
Global Const $GLU_NURBS_ERROR21 = 100271
Global Const $GLU_NURBS_ERROR22 = 100272
Global Const $GLU_NURBS_ERROR23 = 100273
Global Const $GLU_NURBS_ERROR24 = 100274
Global Const $GLU_NURBS_ERROR25 = 100275
Global Const $GLU_NURBS_ERROR26 = 100276
Global Const $GLU_NURBS_ERROR27 = 100277
Global Const $GLU_NURBS_ERROR28 = 100278
Global Const $GLU_NURBS_ERROR29 = 100279
Global Const $GLU_NURBS_ERROR30 = 100280
Global Const $GLU_NURBS_ERROR31 = 100281
Global Const $GLU_NURBS_ERROR32 = 100282
Global Const $GLU_NURBS_ERROR33 = 100283
Global Const $GLU_NURBS_ERROR34 = 100284
Global Const $GLU_NURBS_ERROR35 = 100285
Global Const $GLU_NURBS_ERROR36 = 100286
Global Const $GLU_NURBS_ERROR37 = 100287

; NurbsProperty
Global Const $GLU_AUTO_LOAD_MATRIX = 100200
Global Const $GLU_CULLING = 100201
Global Const $GLU_SAMPLING_TOLERANCE = 100203
Global Const $GLU_DISPLAY_MODE = 100204
Global Const $GLU_PARAMETRIC_TOLERANCE = 100202
Global Const $GLU_SAMPLING_METHOD = 100205
Global Const $GLU_U_STEP = 100206
Global Const $GLU_V_STEP = 100207

; NurbsSampling
Global Const $GLU_PATH_LENGTH = 100215
Global Const $GLU_PARAMETRIC_ERROR = 100216
Global Const $GLU_DOMAIN_DISTANCE = 100217

; NurbsTrim
Global Const $GLU_MAP1_TRIM_2 = 100210
Global Const $GLU_MAP1_TRIM_3 = 100211

; QuadricDrawStyle
Global Const $GLU_POINT = 100010
Global Const $GLU_LINE = 100011
Global Const $GLU_FILL = 100012
Global Const $GLU_SILHOUETTE = 100013

; QuadricCallback
Global Const $GLU_ERROR = 100103

; QuadricNormal
Global Const $GLU_SMOOTH = 100000
Global Const $GLU_FLAT = 100001
Global Const $GLU_NONE = 100002

; QuadricOrientation
Global Const $GLU_OUTSIDE = 100020
Global Const $GLU_INSIDE = 100021

; TessCallback
Global Const $GLU_TESS_BEGIN = 100100
Global Const $GLU_BEGIN = 100100
Global Const $GLU_TESS_VERTEX = 100101
Global Const $GLU_VERTEX = 100101
Global Const $GLU_TESS_END = 100102
Global Const $GLU_END = 100102
Global Const $GLU_TESS_ERROR = 100103
Global Const $GLU_TESS_EDGE_FLAG = 100104
Global Const $GLU_EDGE_FLAG = 100104
Global Const $GLU_TESS_COMBINE = 100105
Global Const $GLU_TESS_BEGIN_DATA = 100106
Global Const $GLU_TESS_VERTEX_DATA = 100107
Global Const $GLU_TESS_END_DATA = 100108
Global Const $GLU_TESS_ERROR_DATA = 100109
Global Const $GLU_TESS_EDGE_FLAG_DATA = 100110
Global Const $GLU_TESS_COMBINE_DATA = 100111

; TessContour
Global Const $GLU_CW = 100120
Global Const $GLU_CCW = 100121
Global Const $GLU_INTERIOR = 100122
Global Const $GLU_EXTERIOR = 100123
Global Const $GLU_UNKNOWN = 100124

; TessProperty
Global Const $GLU_TESS_WINDING_RULE = 100140
Global Const $GLU_TESS_BOUNDARY_ONLY = 100141
Global Const $GLU_TESS_TOLERANCE = 100142

; TessError
Global Const $GLU_TESS_ERROR1 = 100151
Global Const $GLU_TESS_ERROR2 = 100152
Global Const $GLU_TESS_ERROR3 = 100153
Global Const $GLU_TESS_ERROR4 = 100154
Global Const $GLU_TESS_ERROR5 = 100155
Global Const $GLU_TESS_ERROR6 = 100156
Global Const $GLU_TESS_ERROR7 = 100157
Global Const $GLU_TESS_ERROR8 = 100158
Global Const $GLU_TESS_MISSING_BEGIN_POLYGON = 100151
Global Const $GLU_TESS_MISSING_BEGIN_CONTOUR = 100152
Global Const $GLU_TESS_MISSING_END_POLYGON = 100153
Global Const $GLU_TESS_MISSING_END_CONTOUR = 100154
Global Const $GLU_TESS_COORD_TOO_LARGE = 100155
Global Const $GLU_TESS_NEED_COMBINE_CALLBACK = 100156

; TessWinding
Global Const $GLU_TESS_WINDING_ODD = 100130
Global Const $GLU_TESS_WINDING_NONZERO = 100131
Global Const $GLU_TESS_WINDING_POSITIVE = 100132
Global Const $GLU_TESS_WINDING_NEGATIVE = 100133
Global Const $GLU_TESS_WINDING_ABS_GEQ_TWO = 100134

Global Const $GLU_INCOMPATIBLE_GL_VERSION = 100903

Global Const $GLU_TESS_MAX_COORD = 1.0e150