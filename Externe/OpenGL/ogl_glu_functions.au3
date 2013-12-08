;~ #Include "oglglu_constants.au3"

; ##############################################################

Global $__GLU_hDLL = "Glu32.dll"

Func gluInit()
	$__GLU_hDLL = DllOpen("Glu32.dll")
	If $__GLU_hDLL = -1 Then
		$__GLU_hDLL = "Glu32.dll"
		Return SetError(1, 0, 0)
	Else
		Return SetError(0, 0, 1)
	EndIf
EndFunc

Func gluTerminate()
	DllClose($__GLU_hDLL)
	$__GLU_hDLL = "Glu32.dll"
	Return SetError(0, 0, 1)
EndFunc

; ##############################################################

;GLAPI void APIENTRY gluLookAt (double eyeX, double eyeY, double eyeZ, double centerX, double centerY, double centerZ, double upX, double upY, double upZ);
Func gluLookAt($fEyeX, $fEyeY, $fEyeZ, $fCenterX, $fCenterY, $fCenterZ, $fUpX, $fUpY, $fUpZ)
	DllCall($__GLU_hDLL, "none", "gluLookAt", "double", $fEyeX, "double", $fEyeY, "double", $fEyeZ, "double", $fCenterX, "double", $fCenterY, "double", $fCenterZ, "double", $fUpX, "double", $fUpY, "double", $fUpZ)
EndFunc

;GLAPI void APIENTRY gluOrtho2D (double left, double right, double bottom, double top);
Func gluOrtho2D($fLeft, $fRight, $fBottom, $fTop)
	DllCall($__GLU_hDLL, "none", "gluOrtho2D", "double", $fLeft, "double", $fRight, "double", $fBottom, "double", $fTop)
EndFunc

;GLAPI void APIENTRY gluPerspective (double fovy, double aspect, double zNear, double zFar);
Func gluPerspective($fFovy, $fAspect, $fZnear, $fZfar)
	DllCall($__GLU_hDLL, "none", "gluPerspective", "double", $fFovy, "double", $fAspect, "double", $fZnear, "double", $fZfar)
EndFunc

;GLAPI const unsigned char * APIENTRY gluGetString (unsigned int name);
Func gluGetString($iName)
	Local $ret = DllCall($__GLU_hDLL, "str", "gluGetString", "uint", $iName)
	If @error Then Return SetError(@error, @extended, $ret)
	; ---
	Return $ret[0]
EndFunc

;GLAPI GLUquadric* APIENTRY gluNewQuadric (void);
Func gluNewQuadric()
	Local $ret = DllCall($__GLU_hDLL, "ptr", "gluNewQuadric")
	If @error Then Return SetError(@error, @extended, $ret)
	; ---
	Local $Quad[2] = [$ret[0], 0]
	Return $Quad
EndFunc

;GLAPI void APIENTRY gluDeleteQuadric (GLUquadric* quad);
Func gluDeleteQuadric(ByRef $pQuad)
	DllCall($__GLU_hDLL, "none", "gluDeleteQuadric", "ptr", $pQuad[0])
EndFunc

;GLAPI void APIENTRY gluQuadricCallback (GLUquadric* quad, unsigned int which, _GLUfuncptr CallBackFunc);
Func gluQuadricCallback(ByRef $pQuad, $iWhich, $sCallBackFunc)
	If $sCallBackFunc Then
		$pQuad[1] = DllCallbackRegister($sCallBackFunc, "none", "uint")
		DllCall($__GLU_hDLL, "none", "gluQuadricCallback", "ptr", $pQuad[0], "uint", $iWhich, "ptr", DllCallbackGetPtr($pQuad[1]))
	Else
		DllCallbackFree($pQuad[1])
		$pQuad[1] = 0
		DllCall($__GLU_hDLL, "none", "gluQuadricCallback", "ptr", $pQuad[0], "uint", $iWhich, "ptr", 0)
	EndIf
EndFunc

;GLAPI void APIENTRY gluQuadricDrawStyle (GLUquadric* quad, unsigned int draw);
Func gluQuadricDrawStyle(ByRef $pQuad, $iDraw)
	DllCall($__GLU_hDLL, "none", "gluQuadricDrawStyle", "ptr", $pQuad[0], "uint", $iDraw)
EndFunc

;GLAPI void APIENTRY gluQuadricNormals (GLUquadric* quad, unsigned int normal);
Func gluQuadricNormals(ByRef $pQuad, $iNormal)
	DllCall($__GLU_hDLL, "none", "gluQuadricNormals", "ptr", $pQuad[0], "uint", $iNormal)
EndFunc

;GLAPI void APIENTRY gluQuadricOrientation (GLUquadric* quad, unsigned int orientation);
Func gluQuadricOrientation(ByRef $pQuad, $iOrientation)
	DllCall($__GLU_hDLL, "none", "gluQuadricOrientation", "ptr", $pQuad[0], "uint", $iOrientation)
EndFunc

;GLAPI void APIENTRY gluQuadricTexture (GLUquadric* quad, unsigned char texture);
Func gluQuadricTexture(ByRef $pQuad, $iTexture)
	DllCall($__GLU_hDLL, "none", "gluQuadricTexture", "ptr", $pQuad[0], "uint", $iTexture)
EndFunc

;GLAPI void APIENTRY gluCylinder (GLUquadric* quad, double base, double top, double height, int slices, int stacks);
Func gluCylinder(ByRef $pQuad, $fBase, $fTop, $fHeight, $iSlices, $iStacks)
	DllCall($__GLU_hDLL, "none", "gluCylinder", "ptr", $pQuad[0], "double", $fBase, "double", $fHeight, "int", $iSlices, "int", $iStacks)
EndFunc

;GLAPI void APIENTRY gluDisk (GLUquadric* quad, double inner, double outer, int slices, int loops);
Func gluDisk(ByRef $pQuad, $fInner, $fOuter, $iSlices, $iLoops)
	DllCall($__GLU_hDLL, "none", "gluDisk", "ptr", $pQuad[0], "double", $fInner, "double", $fOuter, "int", $iSlices, "int", $iLoops)
EndFunc

;GLAPI void APIENTRY gluPartialDisk (GLUquadric* quad, double inner, double outer, int slices, int loops, double start, double sweep);
Func gluPartialDisk(ByRef $pQuad, $fInner, $fOuter, $iSlices, $iLoops, $fStart, $fSweep)
	DllCall($__GLU_hDLL, "none", "gluPartialDisk", "ptr", $pQuad[0], "double", $fInner, "double", $fOuter, "int", $iSlices, "int", $iLoops, "double", $fStart, "double", $fSweep)
EndFunc

;GLAPI void APIENTRY gluSphere (GLUquadric* quad, double radius, int slices, int stacks);
Func gluSphere(ByRef $pQuad, $fRadius, $iSlices, $iStacks)
	DllCall($__GLU_hDLL, "none", "gluSphere", "ptr", $pQuad[0], "double", $fRadius, "int", $iSlices, "int", $iStacks)
EndFunc

;GLAPI GLUnurbs* APIENTRY gluNewNurbsRenderer (void);
Func gluNewNurbsRenderer()
	Local $ret = DllCall($__GLU_hDLL, "ptr", "gluNewNurbsRenderer")
	If @error Then Return SetError(@error, @extended, $ret)
	; ---
	Return $ret[0]
EndFunc

;GLAPI void APIENTRY gluDeleteNurbsRenderer (GLUnurbs* nurb);
Func gluDeleteNurbsRenderer($pNurb)
	DllCall($__GLU_hDLL, "none", "gluDeleteNurbsRenderer", "ptr", $pNurb)
EndFunc

;GLAPI void APIENTRY gluGetNurbsProperty (GLUnurbs* nurb, unsigned int property, float* data);
Func gluGetNurbsProperty($pNurb, $iProperty)
	Local $ret = DllCall($__GLU_hDLL, "none", "gluGetNurbsProperty", "ptr", $pNurb, "uint", $iProperty, "float*", 0)
	If @error Then Return SetError(@error, @extended, $ret)
	; ---
	Return $ret[3]
EndFunc

;GLAPI void APIENTRY gluBeginCurve (GLUnurbs* nurb);
Func gluBeginCurve($pNurb)
	DllCall($__GLU_hDLL, "none", "gluBeginCurve", "ptr", $pNurb)
EndFunc
;GLAPI void APIENTRY gluEndCurve (GLUnurbs* nurb);
Func gluEndCurve($pNurb)
	DllCall($__GLU_hDLL, "none", "gluEndCurve", "ptr", $pNurb)
EndFunc

;GLAPI void APIENTRY gluBeginSurface (GLUnurbs* nurb);
Func gluBeginSurface($pNurb)
	DllCall($__GLU_hDLL, "none", "gluBeginSurface", "ptr", $pNurb)
EndFunc
;GLAPI void APIENTRY gluEndSurface (GLUnurbs* nurb);
Func gluEndSurface($pNurb)
	DllCall($__GLU_hDLL, "none", "gluEndSurface", "ptr", $pNurb)
EndFunc

;GLAPI void APIENTRY gluBeginTrim (GLUnurbs* nurb);
Func gluBeginTrim($pNurb)
	DllCall($__GLU_hDLL, "none", "gluBeginTrim", "ptr", $pNurb)
EndFunc
;GLAPI void APIENTRY gluEndTrim (GLUnurbs* nurb);
Func gluEndTrim($pNurb)
	DllCall($__GLU_hDLL, "none", "gluEndTrim", "ptr", $pNurb)
EndFunc

;GLAPI void APIENTRY gluNurbsCallback (GLUnurbs* nurb, unsigned int which, _GLUfuncptr CallBackFunc);
;GLAPI void APIENTRY gluNurbsCurve (GLUnurbs* nurb, int knotCount, float *knots, int stride, float *control, int order, unsigned int type);
;GLAPI void APIENTRY gluNurbsProperty (GLUnurbs* nurb, unsigned int property, float value);
Func gluNurbsProperty($pNurb, $iProperty, $fValue)
	DllCall($__GLU_hDLL, "none", "gluNurbsProperty", "ptr", $pNurb, "uint", $iProperty, "float", $fValue)
EndFunc

;GLAPI void APIENTRY gluNurbsSurface (GLUnurbs* nurb, int sKnotCount, float* sKnots, int tKnotCount, float* tKnots, int sStride, int tStride, float* control, int sOrder, int tOrder, unsigned int type);
;GLAPI void APIENTRY gluLoadSamplingMatrices (GLUnurbs* nurb, const float *model, const float *perspective, const int *view);
;GLAPI void APIENTRY gluPwlCurve (GLUnurbs* nurb, int count, float* data, int stride, unsigned int type);

;GLAPI GLUtesselator* APIENTRY gluNewTess (void);
Func gluNewTess()
	Local $ret = DllCall($__GLU_hDLL, "ptr", "gluNewTess")
	If @error Then Return SetError(@error, @extended, $ret)
	; ---
	Return $ret[0]
EndFunc

;GLAPI void APIENTRY gluDeleteTess (GLUtesselator* tess);
Func gluDeleteTess($pTess)
	DllCall($__GLU_hDLL, "none", "gluDeleteTess", "ptr", $pTess)
EndFunc

;GLAPI void APIENTRY gluTessProperty (GLUtesselator* tess, unsigned int which, double data);
Func gluTessProperty($pTess, $iWhich, $fData)
	DllCall($__GLU_hDLL, "none", "gluTessProperty", "ptr", $pTess, "uint", $iWhich, "double", $fData)
EndFunc

;GLAPI void APIENTRY gluGetTessProperty (GLUtesselator* tess, unsigned int which, double* data);
Func gluGetTessProperty($pTess, $iWhich)
	Local $ret = DllCall($__GLU_hDLL, "none", "gluGetTessProperty", "ptr", $pTess, "uint", $iWhich, "double*", 0)
	If @error Then Return SetError(@error, @extended, $ret)
	; ---
	Return $ret[3]
EndFunc

;GLAPI void APIENTRY gluTessNormal (GLUtesselator* tess, double valueX, double valueY, double valueZ);
Func gluTessNormal($pTess, $fValueX, $fValueY, $fValueZ)
	DllCall($__GLU_hDLL, "none", "gluTessNormal", "ptr", $pTess, "double", $fValueX, "double", $fValueY, "double", $fValueZ)
EndFunc

;GLAPI void APIENTRY gluBeginPolygon (GLUtesselator* tess);
Func gluBeginPolygon($pTess)
	DllCall($__GLU_hDLL, "none", "gluBeginPolygon", "ptr", $pTess)
EndFunc
;GLAPI void APIENTRY gluEndPolygon (GLUtesselator* tess);
Func gluEndPolygon($pTess)
	DllCall($__GLU_hDLL, "none", "gluEndPolygon", "ptr", $pTess)
EndFunc

;GLAPI void APIENTRY gluTessBeginPolygon (GLUtesselator* tess, void* data);
Func gluTessBeginPolygon($pTess)
	DllCall($__GLU_hDLL, "none", "gluTessBeginPolygon", "ptr", $pTess, "ptr", 0)
EndFunc
;GLAPI void APIENTRY gluTessEndPolygon (GLUtesselator* tess);
Func gluTessEndPolygon($pTess)
	DllCall($__GLU_hDLL, "none", "gluTessEndPolygon", "ptr", $pTess)
EndFunc

;GLAPI void APIENTRY gluTessBeginContour (GLUtesselator* tess);
Func gluTessBeginContour($pTess)
	DllCall($__GLU_hDLL, "none", "gluTessBeginContour", "ptr", $pTess)
EndFunc
;GLAPI void APIENTRY gluTessEndContour (GLUtesselator* tess);
Func gluTessEndContour($pTess)
	DllCall($__GLU_hDLL, "none", "gluTessEndContour", "ptr", $pTess)
EndFunc

;GLAPI void APIENTRY gluNextContour (GLUtesselator* tess, unsigned int type);
Func gluNextContour($pTess, $iType)
	DllCall($__GLU_hDLL, "none", "gluNextContour", "ptr", $pTess, "uint", $iType)
EndFunc

;GLAPI void APIENTRY gluTessVertex (GLUtesselator* tess, double *location, void* data);
;GLAPI void APIENTRY gluTessCallback (GLUtesselator* tess, unsigned int which, _GLUfuncptr CallBackFunc);

;GLAPI const unsigned char * APIENTRY gluErrorString (unsigned int error);
Func gluErrorString($iError)
	Local $ret = DllCall($__GLU_hDLL, "str", "gluErrorString", "uint", $iError)
	If @error Then Return SetError(@error, @extended, $ret)
	; ---
	Return $ret[0]
EndFunc

;GLAPI const wchar_t * APIENTRY gluErrorUnicodeStringEXT (unsigned int error);
Func gluErrorUnicodeStringEXT($iError)
	Local $ret = DllCall($__GLU_hDLL, "str", "gluErrorUnicodeStringEXT", "uint", $iError)
	If @error Then Return SetError(@error, @extended, $ret)
	; ---
	Return $ret[0]
EndFunc
