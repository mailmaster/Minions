Global $__GL_hDLL = "OpenGL32.dll"

Func glInit()
	$__GL_hDLL = DllOpen("OpenGL32.dll")
	If $__GL_hDLL = -1 Then
		$__GL_hDLL = "OpenGL32.dll"
		Return SetError(1, 0, 0)
	Else
		Return SetError(0, 0, 1)
	EndIf
EndFunc

Func glTerminate()
	DllClose($__GL_hDLL)
	$__GL_hDLL = "OpenGL32.dll"
	Return SetError(0, 0, 1)
EndFunc

; ##############################################################

#region ### Miscellaneous ###
;GLAPI void APIENTRY glClearIndex ( float c )
Func glClearIndex($fC)
	DllCall($__GL_hDLL, "none", "glClearIndex", "float", $fC)
EndFunc

;GLAPI void APIENTRY glClearColor ( float red, float green, float blue, float alpha )
Func glClearColor($fRed, $fGreen, $fBlue, $fAlpha)
	DllCall($__GL_hDLL, "none", "glClearColor", "float", $fRed, "float", $fGreen, "float", $fBlue, "float", $fAlpha)
EndFunc

;GLAPI void APIENTRY glClear ( unsigned int mask )
Func glClear($iMask)
	DllCall($__GL_hDLL, "none", "glClear", "uint", $iMask)
EndFunc

;GLAPI void APIENTRY glIndexMask ( unsigned int mask )
Func glIndexMask($iMask)
	DllCall($__GL_hDLL, "none", "glIndexMask", "uint", $iMask)
EndFunc

;GLAPI void APIENTRY glColorMask ( unsigned char red, unsigned char green, unsigned char blue, unsigned char alpha )
Func glColorMask($iRed, $iGreen, $iBlue, $iAlpha)
	DllCall($__GL_hDLL, "none", "glColorMask", "byte", $iRed, "byte", $iGreen, "byte", $iBlue, "byte", $iAlpha)
EndFunc

;GLAPI void APIENTRY glAlphaFunc ( unsigned int func, float ref )
Func glAlphaFunc($iFunc, $fRef)
	DllCall($__GL_hDLL, "none", "glAlphaFunc", "uint", $iFunc, "float", $fRef)
EndFunc

;GLAPI void APIENTRY glBlendFunc ( unsigned int sfactor, unsigned int dfactor )
Func glBlendFunc($iSfactor, $iDfactor)
	DllCall($__GL_hDLL, "none", "glBlendFunc", "uint", $iSfactor, "uint", $iDfactor)
EndFunc

;GLAPI void APIENTRY glLogicOp ( unsigned int opcode )
Func glLogicOp($iOpCode)
	DllCall($__GL_hDLL, "none", "glLogicOp", "uint", $iOpCode)
EndFunc

;GLAPI void APIENTRY glCullFace ( unsigned int mode )
Func glCullFace($iMode)
	DllCall($__GL_hDLL, "none", "glCullFace", "uint", $iMode)
EndFunc

;GLAPI void APIENTRY glFrontFace ( unsigned int mode )
Func glFrontFace($iMode)
	DllCall($__GL_hDLL, "none", "glFrontFace", "uint", $iMode)
EndFunc

;GLAPI void APIENTRY glPointSize ( float size )
Func glPointSize($fSize)
	DllCall($__GL_hDLL, "none", "glPointSize", "float", $fSize)
EndFunc

;GLAPI void APIENTRY glLineWidth ( float width )
Func glLineWidth($fWidth)
	DllCall($__GL_hDLL, "none", "glLineWidth", "float", $fWidth)
EndFunc

;GLAPI void APIENTRY glLineStipple ( int factor, unsigned short pattern )
Func glLineStipple($iFactor, $iPattern)
	DllCall($__GL_hDLL, "none", "glLineStipple", "int", $iFactor, "ushort", $iPattern)
EndFunc

;GLAPI void APIENTRY glPolygonMode ( unsigned int face, unsigned int mode )
Func glPolygonMode($iFace, $iMode)
	DllCall($__GL_hDLL, "none", "glPolygonMode", "uint", $iFace, "uint", $iMode)
EndFunc

;GLAPI void APIENTRY glPolygonOffset ( float factor, float units )
Func glPolygonOffset($fFactor, $fUnits)
	DllCall($__GL_hDLL, "none", "glPolygonOffset", "float", $fFactor, "float", $fUnits)
EndFunc

;GLAPI void APIENTRY glPolygonStipple ( const unsigned char *mask )
Func glPolygonStipple($iMask)
	DllCall($__GL_hDLL, "none", "glPolygonStipple", "byte*", $iMask)
EndFunc

;GLAPI void APIENTRY glGetPolygonStipple ( unsigned char *mask )
Func glGetPolygonStipple()
	Local $ret = DllCall($__GL_hDLL, "none", "glGetPolygonStipple", "byte*", 0)
	If @error Then Return SetError(@error, @extended, $ret)
	; ---
	Return $ret[1]
EndFunc

;GLAPI void APIENTRY glEdgeFlag ( unsigned char flag )
Func glEdgeFlag($iFlag)
	DllCall($__GL_hDLL, "none", "glEdgeFlag", "byte", $iFlag)
EndFunc

;GLAPI void APIENTRY glEdgeFlagv ( const unsigned char *flag )
Func glEdgeFlagv($iFlag)
	DllCall($__GL_hDLL, "none", "glEdgeFlag", "byte", $iFlag)
EndFunc

;GLAPI void APIENTRY glScissor ( int x, int y, int width, int height)
Func glScissor($iX, $iY, $iWidth, $iHeight)
	DllCall($__GL_hDLL, "none", "glScissor", "int", $iX, "int", $iY, "int", $iWidth, "int", $iHeight)
EndFunc

;GLAPI void APIENTRY glClipPlane ( unsigned int plane, const double *equation )
Func glClipPlane($iPlane, $fEquation) ; check
	DllCall($__GL_hDLL, "none", "glClipPlane", "uint", $iPlane, "double*", $fEquation)
EndFunc

;GLAPI void APIENTRY glGetClipPlane ( unsigned int plane, double *equation )
Func glGetClipPlane($iPlane, ByRef $fEquation) ; check
	DllCall($__GL_hDLL, "none", "glGetClipPlane", "uint", $iPlane, "double*", $fEquation)
EndFunc

;GLAPI void APIENTRY glDrawBuffer ( unsigned int mode )
Func glDrawBuffer($iMode)
	DllCall($__GL_hDLL, "none", "glDrawBuffer", "uint", $iMode)
EndFunc

;GLAPI void APIENTRY glReadBuffer ( unsigned int mode )
Func glReadBuffer($iMode)
	DllCall($__GL_hDLL, "none", "glReadBuffer", "uint", $iMode)
EndFunc

;GLAPI void APIENTRY glEnable ( unsigned int cap )
Func glEnable($iCap)
	DllCall($__GL_hDLL, "none", "glEnable", "uint", $iCap)
EndFunc

;GLAPI void APIENTRY glDisable ( unsigned int cap )
Func glDisable($iCap)
	DllCall($__GL_hDLL, "none", "glDisable", "uint", $iCap)
EndFunc

;GLAPI unsigned char APIENTRY glIsEnabled ( unsigned int cap )
Func glIsEnabled($iCap)
	Local $ret = DllCall($__GL_hDLL, "byte", "glIsEnabled", "uint", $iCap)
	If @error Then Return SetError(@error, @extended, $ret)
	; ---
	Return $ret[0]
EndFunc

;GLAPI void APIENTRY glEnableClientState ( unsigned int cap ) ; 1.1
Func glEnableClientState($iCap)
	DllCall($__GL_hDLL, "none", "glEnableClientState", "uint", $iCap)
EndFunc

;GLAPI void APIENTRY glDisableClientState ( unsigned int cap ) ; 1.1
Func glDisableClientState($iCap)
	DllCall($__GL_hDLL, "none", "glDisableClientState", "uint", $iCap)
EndFunc

;GLAPI void APIENTRY glGetBooleanv ( unsigned int pname, unsigned char *params )
Func glGetBooleanv($iPname)
	Local $ret = DllCall($__GL_hDLL, "none", "glGetBooleanv", "uint", $iPname, "byte*", 0)
	If @error Then Return SetError(@error, @extended, $ret)
	; ---
	Return $ret[2]
EndFunc

;GLAPI void APIENTRY glGetDoublev ( unsigned int pname, double *params )
Func glGetDoublev($iPname)
	Local $ret = DllCall($__GL_hDLL, "none", "glGetDoublev", "uint", $iPname, "double*", 0)
	If @error Then Return SetError(@error, @extended, $ret)
	; ---
	Return $ret[2]
EndFunc

;GLAPI void APIENTRY glGetFloatv ( unsigned int pname, float *params )
Func glGetFloatv($iPname)
	Local $ret = DllCall($__GL_hDLL, "none", "glGetFloatv", "uint", $iPname, "float*", 0)
	If @error Then Return SetError(@error, @extended, $ret)
	; ---
	Return $ret[2]
EndFunc

;GLAPI void APIENTRY glGetIntegerv ( unsigned int pname, int *params )
Func glGetIntegerv($iPname)
	Local $ret = DllCall($__GL_hDLL, "none", "glGetIntegerv", "uint", $iPname, "int*", 0)
	If @error Then Return SetError(@error, @extended, $ret)
	; ---
	Return $ret[2]
EndFunc

;GLAPI void APIENTRY glPushAttrib ( unsigned int mask )
Func glPushAttrib($iMask)
	DllCall($__GL_hDLL, "none", "glPushAttrib", "uint", $iMask)
EndFunc

;GLAPI void APIENTRY glPopAttrib ( void )
Func glPopAttrib()
	DllCall($__GL_hDLL, "none", "glPopAttrib")
EndFunc

;GLAPI void APIENTRY glPushClientAttrib ( unsigned int mask ) ; 1.1
Func glPushClientAttrib($iMask)
	DllCall($__GL_hDLL, "none", "glPushClientAttrib", "uint", $iMask)
EndFunc

;GLAPI void APIENTRY glPopClientAttrib ( void ) ; 1.1
Func glPopClientAttrib()
	DllCall($__GL_hDLL, "none", "glPopClientAttrib")
EndFunc

;GLAPI int APIENTRY glRenderMode ( unsigned int mode )
Func glRenderMode($iMode)
	Local $ret = DllCall($__GL_hDLL, "int", "glRenderMode", "uint", $iMode)
	If @error Then Return SetError(@error, @extended, $ret)
	; ---
	Return $ret[0]
EndFunc

;GLAPI unsigned int APIENTRY glGetError ( void )
Func glGetError()
	Local $ret = DllCall($__GL_hDLL, "uint", "glGetError")
	If @error Then Return SetError(@error, @extended, $ret)
	; ---
	Return $ret[0]
EndFunc

;GLAPI const unsigned char* APIENTRY glGetString ( unsigned int name )
Func glGetString($iName) ; check
	Local $ret = DllCall($__GL_hDLL, "str", "glGetString", "uint", $iName)
	If @error Then Return SetError(@error, @extended, $ret)
	; ---
	Return $ret[0]
EndFunc

;GLAPI void APIENTRY glFinish ( void )
Func glFinish()
	DllCall($__GL_hDLL, "none", "glFinish")
EndFunc

;GLAPI void APIENTRY glFlush ( void )
Func glFlush()
	DllCall($__GL_hDLL, "none", "glFlush")
EndFunc

;GLAPI void APIENTRY glHint ( unsigned int target, unsigned int mode )
Func glHint($iTarget, $iMode)
	DllCall($__GL_hDLL, "none", "glHint", "uint", $iTarget, "uint", $iMode)
EndFunc
#endregion ### Miscellaneous ###

; ##############################################################

#region ### Depth Buffer ###
;GLAPI void APIENTRY glClearDepth ( double depth )
Func glClearDepth($fDepth)
	DllCall($__GL_hDLL, "none", "glClearDepth", "double", $fDepth)
EndFunc

;GLAPI void APIENTRY glDepthFunc ( unsigned int func )
Func glDepthFunc($iFunc)
	DllCall($__GL_hDLL, "none", "glDepthFunc", "uint", $iFunc)
EndFunc

;GLAPI void APIENTRY glDepthMask ( unsigned char flag )
Func glDepthMask($iFlag)
	DllCall($__GL_hDLL, "none", "glDepthMask", "byte", $iFlag)
EndFunc

;GLAPI void APIENTRY glDepthRange ( double near_val, double far_val )
Func glDepthRange($fNearVal, $fFarVal)
	DllCall($__GL_hDLL, "none", "glDepthRange", "double", $fNearVal, "double", $fFarVal)
EndFunc

#endregion ### Depth Buffer ###

; ##############################################################

#region ### Accumulation Buffer ###
;GLAPI void APIENTRY glClearAccum ( float red, float green, float blue, float alpha )
Func glClearAccum($fRed, $fGreen, $fBlue, $fAlpha)
	DllCall($__GL_hDLL, "none", "glClearAccum", "float", $fRed, "float", $fGreen, "float", $fBlue, "float", $fAlpha)
EndFunc

;GLAPI void APIENTRY glAccum ( unsigned int op, float value )
Func glAccum($iOp, $fValue)
	DllCall($__GL_hDLL, "none", "glAccum", "uint", $iOp, "float", $fValue)
EndFunc
#endregion ### Accumulation Buffer ###

; ##############################################################

#region ### Transformation ###
;GLAPI void APIENTRY glMatrixMode ( unsigned int mode )
Func glMatrixMode($iMode)
	DllCall($__GL_hDLL, "none", "glMatrixMode", "uint", $iMode)
EndFunc

;GLAPI void APIENTRY glOrtho ( double left, double right, double bottom, double top, double near_val, double far_val )
Func glOrtho($fLeft, $fRight, $fBottom, $fTop, $fNearVal, $fFarVal)
	DllCall($__GL_hDLL, "none", "glOrtho", "double", $fLeft, "double", $fRight, "double", $fBottom, "double", $fTop, "double", $fNearVal, "double", $fFarVal)
EndFunc

;GLAPI void APIENTRY glFrustum ( double left, double right, double bottom, double top, double near_val, double far_val )
Func glFrustum($fLeft, $fRight, $fBottom, $fTop, $fNearVal, $fFarVal)
	DllCall($__GL_hDLL, "none", "glFrustum", "double", $fLeft, "double", $fRight, "double", $fBottom, "double", $fTop, "double", $fNearVal, "double", $fFarVal)
EndFunc

;GLAPI void APIENTRY glViewport ( int x, int y, int width, int height )
Func glViewport($iX, $iY, $iWidth, $iHeight)
	DllCall($__GL_hDLL, "none", "glViewport", "int", $iX, "int", $iY, "int", $iWidth, "int", $iHeight)
EndFunc

;GLAPI void APIENTRY glPushMatrix ( void )
Func glPushMatrix()
	DllCall($__GL_hDLL, "none", "glPushMatrix")
EndFunc

;GLAPI void APIENTRY glPopMatrix ( void )
Func glPopMatrix()
	DllCall($__GL_hDLL, "none", "glPopMatrix")
EndFunc

;GLAPI void APIENTRY glLoadIdentity ( void )
Func glLoadIdentity()
	DllCall($__GL_hDLL, "none", "glLoadIdentity")
EndFunc

;GLAPI void APIENTRY glLoadMatrixd ( const double *m )
Func glLoadMatrixd($aM) ; not tested
	If Not IsArray($aM) Or UBound($aM) <> 16 Then Return SetError(1, 0, 0)
	; ---
	Local $struct = DllStructCreate("double[16]")
	For $i = 0 To 15
		DllStructSetData($struct, 1, $aM[$i], $i + 1)
	Next
	DllCall($__GL_hDLL, "none", "glLoadMatrixd", "ptr", DllStructGetPtr($struct))
EndFunc

;GLAPI void APIENTRY glLoadMatrixf ( const float *m )
Func glLoadMatrixf($aM) ; not tested
	If Not IsArray($aM) Or UBound($aM) <> 16 Then Return SetError(1, 0, 0)
	; ---
	Local $struct = DllStructCreate("float[16]")
	For $i = 0 To 15
		DllStructSetData($struct, 1, $aM[$i], $i + 1)
	Next
	DllCall($__GL_hDLL, "none", "glLoadMatrixf", "ptr", DllStructGetPtr($struct))
EndFunc

;GLAPI void APIENTRY glMultMatrixd ( const double *m )
Func glMultMatrixd($aM) ; not tested
	If Not IsArray($aM) Or UBound($aM) <> 16 Then Return SetError(1, 0, 0)
	; ---
	Local $struct = DllStructCreate("double[16]")
	For $i = 0 To 15
		DllStructSetData($struct, 1, $aM[$i], $i + 1)
	Next
	DllCall($__GL_hDLL, "none", "glMultMatrixd", "ptr", DllStructGetPtr($struct))
EndFunc

;GLAPI void APIENTRY glMultMatrixf ( const float *m )
Func glMultMatrixf($aM) ; not tested
	If Not IsArray($aM) Or UBound($aM) <> 16 Then Return SetError(1, 0, 0)
	; ---
	Local $struct = DllStructCreate("float[16]")
	For $i = 0 To 15
		DllStructSetData($struct, 1, $aM[$i], $i + 1)
	Next
	DllCall($__GL_hDLL, "none", "glMultMatrixf", "ptr", DllStructGetPtr($struct))
EndFunc

;GLAPI void APIENTRY glRotated ( double angle, double x, double y, double z )
Func glRotated($fAngle, $fX, $fY, $fZ)
	DllCall($__GL_hDLL, "none", "glRotated", "double", $fAngle, "double", $fX, "double", $fY, "double", $fZ)
EndFunc

;GLAPI void APIENTRY glRotatef ( float angle, float x, float y, float z )
Func glRotatef($fAngle, $fX, $fY, $fZ)
	DllCall($__GL_hDLL, "none", "glRotatef", "float", $fAngle, "float", $fX, "float", $fY, "float", $fZ)
EndFunc

;GLAPI void APIENTRY glScaled ( double x, double y, double z )
Func glScaled($fX, $fY, $fZ)
	DllCall($__GL_hDLL, "none", "glScaled", "double", $fX, "double", $fY, "double", $fZ)
EndFunc

;GLAPI void APIENTRY glScalef ( float x, float y, float z )
Func glScalef($fX, $fY, $fZ)
	DllCall($__GL_hDLL, "none", "glScalef", "float", $fX, "float", $fY, "float", $fZ)
EndFunc

;GLAPI void APIENTRY glTranslated ( double x, double y, double z )
Func glTranslated($fX, $fY, $fZ)
	DllCall($__GL_hDLL, "none", "glTranslated", "double", $fX, "double", $fY, "double", $fZ)
EndFunc

;GLAPI void APIENTRY glTranslatef ( float x, float y, float z )
Func glTranslatef($fX, $fY, $fZ)
	DllCall($__GL_hDLL, "none", "glTranslatef", "float", $fX, "float", $fY, "float", $fZ)
EndFunc
#endregion ### Transformation ###

; ##############################################################

#region ### Display Lists ###
;GLAPI unsigned char APIENTRY glIsList ( unsigned int list )
Func glIsList($iList)
	Local $ret = DllCall($__GL_hDLL, "byte", "glIsList", "uint", $iList)
	If @error Then Return SetError(@error, @extended, $ret)
	; ---
	Return SetError(0, 0, $ret[0])
EndFunc

;GLAPI void APIENTRY glDeleteLists ( unsigned int list, int range )
Func glDeleteLists($iList, $iRange = 1)
	DllCall($__GL_hDLL, "none", "glDeleteLists", "uint", $iList, "int", $iRange)
EndFunc

;GLAPI unsigned int APIENTRY glGenLists ( int range )
Func glGenLists($iRange = 1)
	Local $ret = DllCall($__GL_hDLL, "uint", "glGenLists", "int", $iRange)
	If @error Then Return SetError(@error, @extended, $ret)
	; ---
	Return SetError(0, 0, $ret[0])
EndFunc

;GLAPI void APIENTRY glNewList ( unsigned int list, unsigned int mode )
Func glNewList($iList, $iMode)
	DllCall($__GL_hDLL, "none", "glNewList", "uint", $iList, "uint", $iMode)
EndFunc

;GLAPI void APIENTRY glEndList ( void )
Func glEndList()
	DllCall($__GL_hDLL, "none", "glEndList")
EndFunc

;GLAPI void APIENTRY glCallList ( unsigned int list )
Func glCallList($iList)
	DllCall($__GL_hDLL, "none", "glCallList", "uint", $iList)
EndFunc

;GLAPI void APIENTRY glCallLists ( int n, unsigned int type, const void *lists )
Func glCallLists($aLists)
	If Not IsArray($aLists) Then Return SetError(1, 0, 0)
	; ---
	Local $ub = UBound($aLists)
	Local $struct = DllStructCreate("uint[" & $ub & "]")
	For $i = 0 To $ub - 1
		DllStructSetData($struct, 1, $ub[$i], $i + 1)
	Next
	DllCall($__GL_hDLL, "none", "glCallLists", "int", $ub, "uint", $GL_UNSIGNED_INT, "ptr", DllStructGetPtr($struct))
EndFunc

;GLAPI void APIENTRY glListBase ( unsigned int base )
Func glListBase($iBase)
	DllCall($__GL_hDLL, "none", "glListBase", "uint", $iBase)
EndFunc
#endregion ### Display Lists ###

; ##############################################################

#region ### Drawing Functions ###
;GLAPI void APIENTRY glBegin ( unsigned int mode )
Func glBegin($iMode)
	DllCall($__GL_hDLL, "none", "glBegin", "uint", $iMode)
EndFunc

;GLAPI void APIENTRY glEnd ( void )
Func glEnd()
	DllCall($__GL_hDLL, "none", "glEnd")
EndFunc

;GLAPI void APIENTRY glVertex2d ( double x, double y )
Func glVertex2d($fX, $fY)
	DllCall($__GL_hDLL, "none", "glVertex2d", "double", $fX, "double", $fY)
EndFunc
;GLAPI void APIENTRY glVertex2f ( float x, float y )
Func glVertex2f($fX, $fY)
	DllCall($__GL_hDLL, "none", "glVertex2f", "float", $fX, "float", $fY)
EndFunc
;GLAPI void APIENTRY glVertex2i ( int x, int y )
Func glVertex2i($iX, $iY)
	DllCall($__GL_hDLL, "none", "glVertex2i", "int", $iX, "int", $iY)
EndFunc
;GLAPI void APIENTRY glVertex2s ( short x, short y )
Func glVertex2s($iX, $iY)
	DllCall($__GL_hDLL, "none", "glVertex2s", "short", $iX, "short", $iY)
EndFunc

;GLAPI void APIENTRY glVertex3d ( double x, double y, double z )
Func glVertex3d($fX, $fY, $fZ)
	DllCall($__GL_hDLL, "none", "glVertex3d", "double", $fX, "double", $fY, "double", $fZ)
EndFunc
;GLAPI void APIENTRY glVertex3f ( float x, float y, float z )
Func glVertex3f($fX, $fY, $fZ)
	DllCall($__GL_hDLL, "none", "glVertex3f", "float", $fX, "float", $fY, "float", $fZ)
EndFunc
;GLAPI void APIENTRY glVertex3i ( int x, int y, int z )
Func glVertex3i($iX, $iY, $iZ)
	DllCall($__GL_hDLL, "none", "glVertex3i", "int", $iX, "int", $iY, "int", $iZ)
EndFunc
;GLAPI void APIENTRY glVertex3s ( short x, short y, short z )
Func glVertex3s($iX, $iY, $iZ)
	DllCall($__GL_hDLL, "none", "glVertex3s", "short", $iX, "short", $iY, "short", $iZ)
EndFunc

;GLAPI void APIENTRY glVertex4d ( double x, double y, double z, double w )
Func glVertex4d($fX, $fY, $fZ, $fW)
	DllCall($__GL_hDLL, "none", "glVertex4d", "double", $fX, "double", $fY, "double", $fZ, "double", $fW)
EndFunc
;GLAPI void APIENTRY glVertex4f ( float x, float y, float z, float w )
Func glVertex4f($fX, $fY, $fZ, $fW)
	DllCall($__GL_hDLL, "none", "glVertex4f", "float", $fX, "float", $fY, "float", $fZ, "float", $fW)
EndFunc
;GLAPI void APIENTRY glVertex4i ( int x, int y, int z, int w )
Func glVertex4i($iX, $iY, $iZ, $iW)
	DllCall($__GL_hDLL, "none", "glVertex4i", "int", $iX, "int", $iY, "int", $iZ, "int", $iW)
EndFunc
;GLAPI void APIENTRY glVertex4s ( short x, short y, short z, short w )
Func glVertex4s($iX, $iY, $iZ, $iW)
	DllCall($__GL_hDLL, "none", "glVertex4s", "short", $iX, "short", $iY, "short", $iZ, "short", $iW)
EndFunc

;GLAPI void APIENTRY glVertex2dv ( const double *v )
Func glVertex2dv($aV)
	If Not IsArray($aV) Or UBound($aV) <> 2 Then Return SetError(1, 0, 0)
	; ---
	DllCall($__GL_hDLL, "none", "glVertex2d", "double", $aV[0], "double", $aV[1])
EndFunc
;GLAPI void APIENTRY glVertex2fv ( const float *v )
Func glVertex2fv($aV)
	If Not IsArray($aV) Or UBound($aV) <> 2 Then Return SetError(1, 0, 0)
	; ---
	DllCall($__GL_hDLL, "none", "glVertex2f", "float", $aV[0], "float", $aV[1])
EndFunc
;GLAPI void APIENTRY glVertex2iv ( const int *v )
Func glVertex2iv($aV)
	If Not IsArray($aV) Or UBound($aV) <> 2 Then Return SetError(1, 0, 0)
	; ---
	DllCall($__GL_hDLL, "none", "glVertex2i", "int", $aV[0], "int", $aV[1])
EndFunc
;GLAPI void APIENTRY glVertex2sv ( const short *v )
Func glVertex2sv($aV)
	If Not IsArray($aV) Or UBound($aV) <> 2 Then Return SetError(1, 0, 0)
	; ---
	DllCall($__GL_hDLL, "none", "glVertex2s", "short", $aV[0], "short", $aV[1])
EndFunc

;GLAPI void APIENTRY glVertex3dv ( const double *v )
Func glVertex3dv($aV)
	If Not IsArray($aV) Or UBound($aV) <> 3 Then Return SetError(1, 0, 0)
	; ---
	DllCall($__GL_hDLL, "none", "glVertex3d", "double", $aV[0], "double", $aV[1], "double", $aV[2])
EndFunc
;GLAPI void APIENTRY glVertex3fv ( const float *v )
Func glVertex3fv($aV)
	If Not IsArray($aV) Or UBound($aV) <> 3 Then Return SetError(1, 0, 0)
	; ---
	DllCall($__GL_hDLL, "none", "glVertex3f", "float", $aV[0], "float", $aV[1], "float", $aV[2])
EndFunc
;GLAPI void APIENTRY glVertex3iv ( const int *v )
Func glVertex3iv($aV)
	If Not IsArray($aV) Or UBound($aV) <> 3 Then Return SetError(1, 0, 0)
	; ---
	DllCall($__GL_hDLL, "none", "glVertex3i", "int", $aV[0], "int", $aV[1], "int", $aV[2])
EndFunc
;GLAPI void APIENTRY glVertex3sv ( const short *v )
Func glVertex3sv($aV)
	If Not IsArray($aV) Or UBound($aV) <> 3 Then Return SetError(1, 0, 0)
	; ---
	DllCall($__GL_hDLL, "none", "glVertex3s", "short", $aV[0], "short", $aV[1], "short", $aV[2])
EndFunc

;GLAPI void APIENTRY glVertex4dv ( const double *v )
Func glVertex4dv($aV)
	If Not IsArray($aV) Or UBound($aV) <> 4 Then Return SetError(1, 0, 0)
	; ---
	DllCall($__GL_hDLL, "none", "glVertex4d", "double", $aV[0], "double", $aV[1], "double", $aV[2], "double", $aV[3])
EndFunc
;GLAPI void APIENTRY glVertex4fv ( const float *v )
Func glVertex4fv($aV)
	If Not IsArray($aV) Or UBound($aV) <> 4 Then Return SetError(1, 0, 0)
	; ---
	DllCall($__GL_hDLL, "none", "glVertex4f", "float", $aV[0], "float", $aV[1], "float", $aV[2], "float", $aV[3])
EndFunc
;GLAPI void APIENTRY glVertex4iv ( const int *v )
Func glVertex4iv($aV)
	If Not IsArray($aV) Or UBound($aV) <> 4 Then Return SetError(1, 0, 0)
	; ---
	DllCall($__GL_hDLL, "none", "glVertex4i", "int", $aV[0], "int", $aV[1], "int", $aV[2], "int", $aV[3])
EndFunc
;GLAPI void APIENTRY glVertex4sv ( const short *v )
Func glVertex4sv($aV)
	If Not IsArray($aV) Or UBound($aV) <> 4 Then Return SetError(1, 0, 0)
	; ---
	DllCall($__GL_hDLL, "none", "glVertex4s", "short", $aV[0], "short", $aV[1], "short", $aV[2], "short", $aV[3])
EndFunc

;GLAPI void APIENTRY glNormal3b ( signed char nx, signed char ny, signed char nz )
Func glNormal3b($iNx, $iNy, $iNz)
	DllCall($__GL_hDLL, "none", "glNormal3b", "char", $iNx, "char", $iNy, "char", $iNz)
EndFunc

;GLAPI void APIENTRY glNormal3d ( double nx, double ny, double nz )
Func glNormal3d($fNx, $fNy, $fNz)
	DllCall($__GL_hDLL, "none", "glNormal3d", "double", $fNx, "double", $fNy, "double", $fNz)
EndFunc

;GLAPI void APIENTRY glNormal3f ( float nx, float ny, float nz )
Func glNormal3f($fNx, $fNy, $fNz)
	DllCall($__GL_hDLL, "none", "glNormal3f", "float", $fNx, "float", $fNy, "float", $fNz)
EndFunc

;GLAPI void APIENTRY glNormal3i ( int nx, int ny, int nz )
Func glNormal3i($iNx, $iNy, $iNz)
	DllCall($__GL_hDLL, "none", "glNormal3i", "int", $iNx, "int", $iNy, "int", $iNz)
EndFunc

;GLAPI void APIENTRY glNormal3s ( short nx, short ny, short nz )
Func glNormal3s($iNx, $iNy, $iNz)
	DllCall($__GL_hDLL, "none", "glNormal3s", "short", $iNx, "short", $iNy, "short", $iNz)
EndFunc

;GLAPI void APIENTRY glNormal3bv ( const signed char *v )
Func glNormal3bv($aV)
	If Not IsArray($aV) Or UBound($aV) <> 3 Then Return SetError(1, 0, 0)
	; ---
	DllCall($__GL_hDLL, "none", "glNormal3b", "char", $aV[0], "char", $aV[1], "char", $aV[2])
EndFunc
;GLAPI void APIENTRY glNormal3dv ( const double *v )
Func glNormal3dv($aV)
	If Not IsArray($aV) Or UBound($aV) <> 3 Then Return SetError(1, 0, 0)
	; ---
	DllCall($__GL_hDLL, "none", "glNormal3d", "double", $aV[0], "double", $aV[1], "double", $aV[2])
EndFunc
;GLAPI void APIENTRY glNormal3fv ( const float *v )
Func glNormal3fv($aV)
	If Not IsArray($aV) Or UBound($aV) <> 3 Then Return SetError(1, 0, 0)
	; ---
	DllCall($__GL_hDLL, "none", "glNormal3f", "float", $aV[0], "float", $aV[1], "float", $aV[2])
EndFunc
;GLAPI void APIENTRY glNormal3iv ( const int *v )
Func glNormal3iv($aV)
	If Not IsArray($aV) Or UBound($aV) <> 3 Then Return SetError(1, 0, 0)
	; ---
	DllCall($__GL_hDLL, "none", "glNormal3i", "int", $aV[0], "int", $aV[1], "int", $aV[2])
EndFunc
;GLAPI void APIENTRY glNormal3sv ( const short *v )
Func glNormal3sv($aV)
	If Not IsArray($aV) Or UBound($aV) <> 3 Then Return SetError(1, 0, 0)
	; ---
	DllCall($__GL_hDLL, "none", "glNormal3s", "short", $aV[0], "short", $aV[1], "short", $aV[2])
EndFunc

;GLAPI void APIENTRY glIndexd ( double c )
Func glIndexd($fC)
	DllCall($__GL_hDLL, "none", "glIndexd", "double", $fC)
EndFunc
;GLAPI void APIENTRY glIndexf ( float c )
Func glIndexf($fC)
	DllCall($__GL_hDLL, "none", "glIndexf", "float", $fC)
EndFunc
;GLAPI void APIENTRY glIndexi ( int c )
Func glIndexi($iC)
	DllCall($__GL_hDLL, "none", "glIndexi", "int", $iC)
EndFunc
;GLAPI void APIENTRY glIndexs ( short c )
Func glIndexs($iC)
	DllCall($__GL_hDLL, "none", "glIndexs", "short", $iC)
EndFunc
;GLAPI void APIENTRY glIndexub ( unsigned char c ) ; 1.1
Func glIndexub($iC)
	DllCall($__GL_hDLL, "none", "glIndexub", "byte", $iC)
EndFunc

;GLAPI void APIENTRY glIndexdv ( const double *c )
Func glIndexdv($fC)
	DllCall($__GL_hDLL, "none", "glIndexd", "double", $fC)
EndFunc
;GLAPI void APIENTRY glIndexfv ( const float *c )
Func glIndexfv($fC)
	DllCall($__GL_hDLL, "none", "glIndexf", "float", $fC)
EndFunc
;GLAPI void APIENTRY glIndexiv ( const int *c )
Func glIndexiv($iC)
	DllCall($__GL_hDLL, "none", "glIndexi", "int", $iC)
EndFunc
;GLAPI void APIENTRY glIndexsv ( const short *c )
Func glIndexsv($iC)
	DllCall($__GL_hDLL, "none", "glIndexs", "short", $iC)
EndFunc
;GLAPI void APIENTRY glIndexubv ( const unsigned char *c ) ; 1.1
Func glIndexubv($iC)
	DllCall($__GL_hDLL, "none", "glIndexubv", "byte", $iC)
EndFunc

;GLAPI void APIENTRY glColor3b ( signed char red, signed char green, signed char blue )
Func glColor3b($iRed, $iGreen, $iBlue)
	DllCall($__GL_hDLL, "none", "glColor3b", "char", $iRed, "char", $iGreen, "char", $iBlue)
EndFunc
;GLAPI void APIENTRY glColor3d ( double red, double green, double blue )
Func glColor3d($fRed, $fGreen, $fBlue)
	DllCall($__GL_hDLL, "none", "glColor3d", "double", $fRed, "double", $fGreen, "double", $fBlue)
EndFunc
;GLAPI void APIENTRY glColor3f ( float red, float green, float blue )
Func glColor3f($fRed, $fGreen, $fBlue)
	DllCall($__GL_hDLL, "none", "glColor3f", "float", $fRed, "float", $fGreen, "float", $fBlue)
EndFunc
;GLAPI void APIENTRY glColor3i ( int red, int green, int blue )
Func glColor3i($iRed, $iGreen, $iBlue)
	DllCall($__GL_hDLL, "none", "glColor3i", "int", $iRed, "int", $iGreen, "int", $iBlue)
EndFunc
;GLAPI void APIENTRY glColor3s ( short red, short green, short blue )
Func glColor3s($iRed, $iGreen, $iBlue)
	DllCall($__GL_hDLL, "none", "glColor3s", "short", $iRed, "short", $iGreen, "short", $iBlue)
EndFunc
;GLAPI void APIENTRY glColor3ub ( unsigned char red, unsigned char green, unsigned char blue )
Func glColor3ub($iRed, $iGreen, $iBlue)
	DllCall($__GL_hDLL, "none", "glColor3ub", "byte", $iRed, "byte", $iGreen, "byte", $iBlue)
EndFunc
;GLAPI void APIENTRY glColor3ui ( unsigned int red, unsigned int green, unsigned int blue )
Func glColor3ui($iRed, $iGreen, $iBlue)
	DllCall($__GL_hDLL, "none", "glColor3ui", "uint", $iRed, "uint", $iGreen, "uint", $iBlue)
EndFunc
;GLAPI void APIENTRY glColor3us ( unsigned short red, unsigned short green, unsigned short blue )
Func glColor3us($iRed, $iGreen, $iBlue)
	DllCall($__GL_hDLL, "none", "glColor3us", "ushort", $iRed, "ushort", $iGreen, "ushort", $iBlue)
EndFunc

;GLAPI void APIENTRY glColor4b ( signed char red, signed char green, signed char blue, signed char alpha )
Func glColor4b($iRed, $iGreen, $iBlue, $iAlpha)
	DllCall($__GL_hDLL, "none", "glColor4b", "char", $iRed, "char", $iGreen, "char", $iBlue, "char", $iAlpha)
EndFunc
;GLAPI void APIENTRY glColor4d ( double red, double green, double blue, double alpha )
Func glColor4d($fRed, $fGreen, $fBlue, $fAlpha)
	DllCall($__GL_hDLL, "none", "glColor4d", "double", $fRed, "double", $fGreen, "double", $fBlue, "double", $fAlpha)
EndFunc
;GLAPI void APIENTRY glColor4f ( float red, float green, float blue, float alpha )
Func glColor4f($fRed, $fGreen, $fBlue, $fAlpha)
	DllCall($__GL_hDLL, "none", "glColor4f", "float", $fRed, "float", $fGreen, "float", $fBlue, "float", $fAlpha)
EndFunc
;GLAPI void APIENTRY glColor4i ( int red, int green, int blue, int alpha )
Func glColor4i($iRed, $iGreen, $iBlue, $iAlpha)
	DllCall($__GL_hDLL, "none", "glColor4i", "int", $iRed, "int", $iGreen, "int", $iBlue, "int", $iAlpha)
EndFunc
;GLAPI void APIENTRY glColor4s ( short red, short green, short blue, short alpha )
Func glColor4s($iRed, $iGreen, $iBlue, $iAlpha)
	DllCall($__GL_hDLL, "none", "glColor4s", "short", $iRed, "short", $iGreen, "short", $iBlue, "short", $iAlpha)
EndFunc
;GLAPI void APIENTRY glColor4ub ( unsigned char red, unsigned char green, unsigned char blue, unsigned char alpha )
Func glColor4ub($iRed, $iGreen, $iBlue, $iAlpha)
	DllCall($__GL_hDLL, "none", "glColor4ub", "byte", $iRed, "byte", $iGreen, "byte", $iBlue, "byte", $iAlpha)
EndFunc
;GLAPI void APIENTRY glColor4ui ( unsigned int red, unsigned int green, unsigned int blue, unsigned int alpha )
Func glColor4ui($iRed, $iGreen, $iBlue, $iAlpha)
	DllCall($__GL_hDLL, "none", "glColor4ui", "uint", $iRed, "uint", $iGreen, "uint", $iBlue, "uint", $iAlpha)
EndFunc
;GLAPI void APIENTRY glColor4us ( unsigned short red, unsigned short green, unsigned short blue, unsigned short alpha )
Func glColor4us($iRed, $iGreen, $iBlue, $iAlpha)
	DllCall($__GL_hDLL, "none", "glColor4us", "ushort", $iRed, "ushort", $iGreen, "ushort", $iBlue, "ushort", $iAlpha)
EndFunc

;GLAPI void APIENTRY glColor3bv ( const signed char *v )
Func glColor3bv($aV)
	If Not IsArray($aV) Or UBound($aV) <> 3 Then Return SetError(1, 0, 0)
	; ---
	DllCall($__GL_hDLL, "none", "glColor3b", "char", $aV[0], "char", $aV[1], "char", $aV[2])
EndFunc
;GLAPI void APIENTRY glColor3dv ( const double *v )
Func glColor3dv($aV)
	If Not IsArray($aV) Or UBound($aV) <> 3 Then Return SetError(1, 0, 0)
	; ---
	DllCall($__GL_hDLL, "none", "glColor3d", "double", $aV[0], "double", $aV[1], "double", $aV[2])
EndFunc
;GLAPI void APIENTRY glColor3fv ( const float *v )
Func glColor3fv($aV)
	If Not IsArray($aV) Or UBound($aV) <> 3 Then Return SetError(1, 0, 0)
	; ---
	DllCall($__GL_hDLL, "none", "glColor3f", "float", $aV[0], "float", $aV[1], "float", $aV[2])
EndFunc
;GLAPI void APIENTRY glColor3iv ( const int *v )
Func glColor3iv($aV)
	If Not IsArray($aV) Or UBound($aV) <> 3 Then Return SetError(1, 0, 0)
	; ---
	DllCall($__GL_hDLL, "none", "glColor3i", "int", $aV[0], "int", $aV[1], "int", $aV[2])
EndFunc
;GLAPI void APIENTRY glColor3sv ( const short *v )
Func glColor3sv($aV)
	If Not IsArray($aV) Or UBound($aV) <> 3 Then Return SetError(1, 0, 0)
	; ---
	DllCall($__GL_hDLL, "none", "glColor3s", "short", $aV[0], "short", $aV[1], "short", $aV[2])
EndFunc
;GLAPI void APIENTRY glColor3ubv ( const unsigned char *v )
Func glColor3ubv($aV)
	If Not IsArray($aV) Or UBound($aV) <> 3 Then Return SetError(1, 0, 0)
	; ---
	DllCall($__GL_hDLL, "none", "glColor3ub", "byte", $aV[0], "byte", $aV[1], "byte", $aV[2])
EndFunc
;GLAPI void APIENTRY glColor3uiv ( const unsigned int *v )
Func glColor3uiv($aV)
	If Not IsArray($aV) Or UBound($aV) <> 3 Then Return SetError(1, 0, 0)
	; ---
	DllCall($__GL_hDLL, "none", "glColor3ui", "uint", $aV[0], "uint", $aV[1], "uint", $aV[2])
EndFunc
;GLAPI void APIENTRY glColor3usv ( const unsigned short *v )
Func glColor3usv($aV)
	If Not IsArray($aV) Or UBound($aV) <> 3 Then Return SetError(1, 0, 0)
	; ---
	DllCall($__GL_hDLL, "none", "glColor3us", "ushort", $aV[0], "ushort", $aV[1], "ushort", $aV[2])
EndFunc

;GLAPI void APIENTRY glColor4bv ( const signed char *v )
Func glColor4bv($aV)
	If Not IsArray($aV) Or UBound($aV) <> 4 Then Return SetError(1, 0, 0)
	; ---
	DllCall($__GL_hDLL, "none", "glColor4b", "char", $aV[0], "char", $aV[1], "char", $aV[2], "char", $aV[3])
EndFunc
;GLAPI void APIENTRY glColor4dv ( const double *v )
Func glColor4dv($aV)
	If Not IsArray($aV) Or UBound($aV) <> 4 Then Return SetError(1, 0, 0)
	; ---
	DllCall($__GL_hDLL, "none", "glColor4d", "double", $aV[0], "double", $aV[1], "double", $aV[2], "double", $aV[3])
EndFunc
;GLAPI void APIENTRY glColor4fv ( const float *v )
Func glColor4fv($aV)
	If Not IsArray($aV) Or UBound($aV) <> 4 Then Return SetError(1, 0, 0)
	; ---
	DllCall($__GL_hDLL, "none", "glColor4f", "float", $aV[0], "float", $aV[1], "float", $aV[2], "float", $aV[3])
EndFunc
;GLAPI void APIENTRY glColor4iv ( const int *v )
Func glColor4iv($aV)
	If Not IsArray($aV) Or UBound($aV) <> 4 Then Return SetError(1, 0, 0)
	; ---
	DllCall($__GL_hDLL, "none", "glColor4i", "int", $aV[0], "int", $aV[1], "int", $aV[2], "int", $aV[3])
EndFunc
;GLAPI void APIENTRY glColor4sv ( const short *v )
Func glColor4sv($aV)
	If Not IsArray($aV) Or UBound($aV) <> 4 Then Return SetError(1, 0, 0)
	; ---
	DllCall($__GL_hDLL, "none", "glColor4s", "short", $aV[0], "short", $aV[1], "short", $aV[2], "short", $aV[3])
EndFunc
;GLAPI void APIENTRY glColor4ubv ( const unsigned char *v )
Func glColor4ubv($aV)
	If Not IsArray($aV) Or UBound($aV) <> 4 Then Return SetError(1, 0, 0)
	; ---
	DllCall($__GL_hDLL, "none", "glColor4ub", "byte", $aV[0], "byte", $aV[1], "byte", $aV[2], "byte", $aV[3])
EndFunc
;GLAPI void APIENTRY glColor4uiv ( const unsigned int *v )
Func glColor4uiv($aV)
	If Not IsArray($aV) Or UBound($aV) <> 4 Then Return SetError(1, 0, 0)
	; ---
	DllCall($__GL_hDLL, "none", "glColor4ui", "uint", $aV[0], "uint", $aV[1], "uint", $aV[2], "uint", $aV[3])
EndFunc
;GLAPI void APIENTRY glColor4usv ( const unsigned short *v )
Func glColor4usv($aV)
	If Not IsArray($aV) Or UBound($aV) <> 4 Then Return SetError(1, 0, 0)
	; ---
	DllCall($__GL_hDLL, "none", "glColor4us", "ushort", $aV[0], "ushort", $aV[1], "ushort", $aV[2], "ushort", $aV[3])
EndFunc

;GLAPI void APIENTRY glTexCoord1d ( double s )
Func glTexCoord1d($fS)
	DllCall($__GL_hDLL, "none", "glTexCoord1d", "double", $fS)
EndFunc
;GLAPI void APIENTRY glTexCoord1f ( float s )
Func glTexCoord1f($fS)
	DllCall($__GL_hDLL, "none", "glTexCoord1f", "float", $fS)
EndFunc
;GLAPI void APIENTRY glTexCoord1i ( int s )
Func glTexCoord1i($iS)
	DllCall($__GL_hDLL, "none", "glTexCoord1i", "int", $iS)
EndFunc
;GLAPI void APIENTRY glTexCoord1s ( short s )
Func glTexCoord1s($iS)
	DllCall($__GL_hDLL, "none", "glTexCoord1s", "short", $iS)
EndFunc

;GLAPI void APIENTRY glTexCoord2d ( double s, double t )
Func glTexCoord2d($fS, $fT)
	DllCall($__GL_hDLL, "none", "glTexCoord2d", "double", $fS, "double", $fT)
EndFunc
;GLAPI void APIENTRY glTexCoord2f ( float s, float t )
Func glTexCoord2f($fS, $fT)
	DllCall($__GL_hDLL, "none", "glTexCoord2f", "float", $fS, "float", $fT)
EndFunc
;GLAPI void APIENTRY glTexCoord2i ( int s, int t )
Func glTexCoord2i($fS, $fT)
	DllCall($__GL_hDLL, "none", "glTexCoord2i", "int", $fS, "int", $fT)
EndFunc
;GLAPI void APIENTRY glTexCoord2s ( short s, short t )
Func glTexCoord2s($fS, $fT)
	DllCall($__GL_hDLL, "none", "glTexCoord2s", "short", $fS, "short", $fT)
EndFunc

;GLAPI void APIENTRY glTexCoord3d ( double s, double t, double r )
Func glTexCoord3d($fS, $fT, $fR)
	DllCall($__GL_hDLL, "none", "glTexCoord3d", "double", $fS, "double", $fT, "double", $fR)
EndFunc
;GLAPI void APIENTRY glTexCoord3f ( float s, float t, float r )
Func glTexCoord3f($fS, $fT, $fR)
	DllCall($__GL_hDLL, "none", "glTexCoord3f", "float", $fS, "float", $fT, "float", $fR)
EndFunc
;GLAPI void APIENTRY glTexCoord3i ( int s, int t, int r )
Func glTexCoord3i($fS, $fT, $iR)
	DllCall($__GL_hDLL, "none", "glTexCoord3i", "int", $fS, "int", $fT, "int", $iR)
EndFunc
;GLAPI void APIENTRY glTexCoord3s ( short s, short t, short r )
Func glTexCoord3s($fS, $fT, $iR)
	DllCall($__GL_hDLL, "none", "glTexCoord3s", "short", $fS, "short", $fT, "short", $iR)
EndFunc

;GLAPI void APIENTRY glTexCoord4d ( double s, double t, double r, double q )
Func glTexCoord4d($fS, $fT, $fR, $fQ)
	DllCall($__GL_hDLL, "none", "glTexCoord4d", "double", $fS, "double", $fT, "double", $fR, "double", $fQ)
EndFunc
;GLAPI void APIENTRY glTexCoord4f ( float s, float t, float r, float q )
Func glTexCoord4f($fS, $fT, $fR, $fQ)
	DllCall($__GL_hDLL, "none", "glTexCoord4f", "float", $fS, "float", $fT, "float", $fR, "float", $fQ)
EndFunc
;GLAPI void APIENTRY glTexCoord4i ( int s, int t, int r, int q )
Func glTexCoord4i($fS, $fT, $iR, $iQ)
	DllCall($__GL_hDLL, "none", "glTexCoord4i", "int", $fS, "int", $fT, "int", $iR, "int", $iQ)
EndFunc
;GLAPI void APIENTRY glTexCoord4s ( short s, short t, short r, short q )
Func glTexCoord4s($fS, $fT, $iR, $iQ)
	DllCall($__GL_hDLL, "none", "glTexCoord4s", "short", $fS, "short", $fT, "short", $iR, "short", $iQ)
EndFunc

;GLAPI void APIENTRY glTexCoord1dv ( const double *v )
Func glTexCoord1dv($aV)
	If Not IsArray($aV) Or UBound($aV) <> 1 Then Return SetError(1, 0, 0)
	; ---
	DllCall($__GL_hDLL, "none", "glTexCoord1d", "double", $aV[0])
EndFunc
;GLAPI void APIENTRY glTexCoord1fv ( const float *v )
Func glTexCoord1fv($aV)
	If Not IsArray($aV) Or UBound($aV) <> 1 Then Return SetError(1, 0, 0)
	; ---
	DllCall($__GL_hDLL, "none", "glTexCoord1f", "float", $aV[0])
EndFunc
;GLAPI void APIENTRY glTexCoord1iv ( const int *v )
Func glTexCoord1iv($aV)
	If Not IsArray($aV) Or UBound($aV) <> 1 Then Return SetError(1, 0, 0)
	; ---
	DllCall($__GL_hDLL, "none", "glTexCoord1i", "int", $aV[0])
EndFunc
;GLAPI void APIENTRY glTexCoord1sv ( const short *v )
Func glTexCoord1sv($aV)
	If Not IsArray($aV) Or UBound($aV) <> 1 Then Return SetError(1, 0, 0)
	; ---
	DllCall($__GL_hDLL, "none", "glTexCoord1s", "short", $aV[0])
EndFunc

;GLAPI void APIENTRY glTexCoord2dv ( const double *v )
Func glTexCoord2dv($aV)
	If Not IsArray($aV) Or UBound($aV) <> 2 Then Return SetError(1, 0, 0)
	; ---
	DllCall($__GL_hDLL, "none", "glTexCoord2d", "double", $aV[0], "double", $aV[1])
EndFunc
;GLAPI void APIENTRY glTexCoord2fv ( const float *v )
Func glTexCoord2fv($aV)
	If Not IsArray($aV) Or UBound($aV) <> 2 Then Return SetError(1, 0, 0)
	; ---
	DllCall($__GL_hDLL, "none", "glTexCoord2f", "float", $aV[0], "float", $aV[1])
EndFunc
;GLAPI void APIENTRY glTexCoord2iv ( const int *v )
Func glTexCoord2iv($aV)
	If Not IsArray($aV) Or UBound($aV) <> 2 Then Return SetError(1, 0, 0)
	; ---
	DllCall($__GL_hDLL, "none", "glTexCoord2i", "int", $aV[0], "int", $aV[1])
EndFunc
;GLAPI void APIENTRY glTexCoord2sv ( const short *v )
Func glTexCoord2sv($aV)
	If Not IsArray($aV) Or UBound($aV) <> 2 Then Return SetError(1, 0, 0)
	; ---
	DllCall($__GL_hDLL, "none", "glTexCoord2s", "short", $aV[0], "short", $aV[1])
EndFunc

;GLAPI void APIENTRY glTexCoord3dv ( const double *v )
Func glTexCoord3dv($aV)
	If Not IsArray($aV) Or UBound($aV) <> 3 Then Return SetError(1, 0, 0)
	; ---
	DllCall($__GL_hDLL, "none", "glTexCoord3d", "double", $aV[0], "double", $aV[1], "double", $aV[2])
EndFunc
;GLAPI void APIENTRY glTexCoord3fv ( const float *v )
Func glTexCoord3fv($aV)
	If Not IsArray($aV) Or UBound($aV) <> 3 Then Return SetError(1, 0, 0)
	; ---
	DllCall($__GL_hDLL, "none", "glTexCoord3f", "float", $aV[0], "float", $aV[1], "float", $aV[2])
EndFunc
;GLAPI void APIENTRY glTexCoord3iv ( const int *v )
Func glTexCoord3iv($aV)
	If Not IsArray($aV) Or UBound($aV) <> 3 Then Return SetError(1, 0, 0)
	; ---
	DllCall($__GL_hDLL, "none", "glTexCoord3i", "int", $aV[0], "int", $aV[1], "int", $aV[2])
EndFunc
;GLAPI void APIENTRY glTexCoord3sv ( const short *v )
Func glTexCoord3sv($aV)
	If Not IsArray($aV) Or UBound($aV) <> 3 Then Return SetError(1, 0, 0)
	; ---
	DllCall($__GL_hDLL, "none", "glTexCoord3s", "short", $aV[0], "short", $aV[1], "short", $aV[2])
EndFunc

;GLAPI void APIENTRY glTexCoord4dv ( const double *v )
Func glTexCoord4dv($aV)
	If Not IsArray($aV) Or UBound($aV) <> 4 Then Return SetError(1, 0, 0)
	; ---
	DllCall($__GL_hDLL, "none", "glTexCoord4d", "double", $aV[0], "double", $aV[1], "double", $aV[2], "double", $aV[3])
EndFunc
;GLAPI void APIENTRY glTexCoord4fv ( const float *v )
Func glTexCoord4fv($aV)
	If Not IsArray($aV) Or UBound($aV) <> 4 Then Return SetError(1, 0, 0)
	; ---
	DllCall($__GL_hDLL, "none", "glTexCoord4f", "float", $aV[0], "float", $aV[1], "float", $aV[2], "float", $aV[3])
EndFunc
;GLAPI void APIENTRY glTexCoord4iv ( const int *v )
Func glTexCoord4iv($aV)
	If Not IsArray($aV) Or UBound($aV) <> 4 Then Return SetError(1, 0, 0)
	; ---
	DllCall($__GL_hDLL, "none", "glTexCoord4i", "int", $aV[0], "int", $aV[1], "int", $aV[2], "int", $aV[3])
EndFunc
;GLAPI void APIENTRY glTexCoord4sv ( const short *v )
Func glTexCoord4sv($aV)
	If Not IsArray($aV) Or UBound($aV) <> 4 Then Return SetError(1, 0, 0)
	; ---
	DllCall($__GL_hDLL, "none", "glTexCoord4s", "short", $aV[0], "short", $aV[1], "short", $aV[2], "short", $aV[3])
EndFunc

;GLAPI void APIENTRY glRasterPos2d ( double x, double y )
Func glRasterPos2d($fX, $fY)
	DllCall($__GL_hDLL, "none", "glRasterPos2d", "double", $fX, "double", $fY)
EndFunc
;GLAPI void APIENTRY glRasterPos2f ( float x, float y )
Func glRasterPos2f($fX, $fY)
	DllCall($__GL_hDLL, "none", "glRasterPos2f", "float", $fX, "float", $fY)
EndFunc
;GLAPI void APIENTRY glRasterPos2i ( int x, int y )
Func glRasterPos2i($iX, $iY)
	DllCall($__GL_hDLL, "none", "glRasterPos2i", "int", $iX, "int", $iY)
EndFunc
;GLAPI void APIENTRY glRasterPos2s ( short x, short y )
Func glRasterPos2s($iX, $iY)
	DllCall($__GL_hDLL, "none", "glRasterPos2s", "short", $iX, "short", $iY)
EndFunc

;GLAPI void APIENTRY glRasterPos3d ( double x, double y, double z )
Func glRasterPos3d($fX, $fY, $fZ)
	DllCall($__GL_hDLL, "none", "glRasterPos3d", "double", $fX, "double", $fY, "double", $fZ)
EndFunc
;GLAPI void APIENTRY glRasterPos3f ( float x, float y, float z )
Func glRasterPos3f($fX, $fY, $fZ)
	DllCall($__GL_hDLL, "none", "glRasterPos3f", "float", $fX, "float", $fY, "float", $fZ)
EndFunc
;GLAPI void APIENTRY glRasterPos3i ( int x, int y, int z )
Func glRasterPos3i($iX, $iY, $iZ)
	DllCall($__GL_hDLL, "none", "glRasterPos3i", "int", $iX, "int", $iY, "int", $iZ)
EndFunc
;GLAPI void APIENTRY glRasterPos3s ( short x, short y, short z )
Func glRasterPos3s($iX, $iY, $iZ)
	DllCall($__GL_hDLL, "none", "glRasterPos3s", "short", $iX, "short", $iY, "short", $iZ)
EndFunc

;GLAPI void APIENTRY glRasterPos4d ( double x, double y, double z, double w )
Func glRasterPos4d($fX, $fY, $fZ, $fW)
	DllCall($__GL_hDLL, "none", "glRasterPos4d", "double", $fX, "double", $fY, "double", $fZ, "double", $fW)
EndFunc
;GLAPI void APIENTRY glRasterPos4f ( float x, float y, float z, float w )
Func glRasterPos4f($fX, $fY, $fZ, $fW)
	DllCall($__GL_hDLL, "none", "glRasterPos4f", "float", $fX, "float", $fY, "float", $fZ, "float", $fW)
EndFunc
;GLAPI void APIENTRY glRasterPos4i ( int x, int y, int z, int w )
Func glRasterPos4i($iX, $iY, $iZ, $iW)
	DllCall($__GL_hDLL, "none", "glRasterPos4i", "int", $iX, "int", $iY, "int", $iZ, "int", $iW)
EndFunc
;GLAPI void APIENTRY glRasterPos4s ( short x, short y, short z, short w )
Func glRasterPos4s($iX, $iY, $iZ, $iW)
	DllCall($__GL_hDLL, "none", "glRasterPos4s", "short", $iX, "short", $iY, "short", $iZ, "short", $iW)
EndFunc

;GLAPI void APIENTRY glRasterPos2dv ( const double *v )
Func glRasterPos2dv($aV)
	If Not IsArray($aV) Or UBound($aV) <> 2 Then Return SetError(1, 0, 0)
	; ---
	DllCall($__GL_hDLL, "none", "glRasterPos2d", "double", $aV[0], "double", $aV[1])
EndFunc
;GLAPI void APIENTRY glRasterPos2fv ( const float *v )
Func glRasterPos2fv($aV)
	If Not IsArray($aV) Or UBound($aV) <> 2 Then Return SetError(1, 0, 0)
	; ---
	DllCall($__GL_hDLL, "none", "glRasterPos2f", "float", $aV[0], "float", $aV[1])
EndFunc
;GLAPI void APIENTRY glRasterPos2iv ( const int *v )
Func glRasterPos2iv($aV)
	If Not IsArray($aV) Or UBound($aV) <> 2 Then Return SetError(1, 0, 0)
	; ---
	DllCall($__GL_hDLL, "none", "glRasterPos2i", "int", $aV[0], "int", $aV[1])
EndFunc
;GLAPI void APIENTRY glRasterPos2sv ( const short *v )
Func glRasterPos2sv($aV)
	If Not IsArray($aV) Or UBound($aV) <> 2 Then Return SetError(1, 0, 0)
	; ---
	DllCall($__GL_hDLL, "none", "glRasterPos2s", "short", $aV[0], "short", $aV[1])
EndFunc

;GLAPI void APIENTRY glRasterPos3dv ( const double *v )
Func glRasterPos3dv($aV)
	If Not IsArray($aV) Or UBound($aV) <> 3 Then Return SetError(1, 0, 0)
	; ---
	DllCall($__GL_hDLL, "none", "glRasterPos3d", "double", $aV[0], "double", $aV[1], "double", $aV[2])
EndFunc
;GLAPI void APIENTRY glRasterPos3fv ( const float *v )
Func glRasterPos3fv($aV)
	If Not IsArray($aV) Or UBound($aV) <> 3 Then Return SetError(1, 0, 0)
	; ---
	DllCall($__GL_hDLL, "none", "glRasterPos3f", "float", $aV[0], "float", $aV[1], "float", $aV[2])
EndFunc
;GLAPI void APIENTRY glRasterPos3iv ( const int *v )
Func glRasterPos3iv($aV)
	If Not IsArray($aV) Or UBound($aV) <> 3 Then Return SetError(1, 0, 0)
	; ---
	DllCall($__GL_hDLL, "none", "glRasterPos3i", "int", $aV[0], "int", $aV[1], "int", $aV[2])
EndFunc
;GLAPI void APIENTRY glRasterPos3sv ( const short *v )
Func glRasterPos3sv($aV)
	If Not IsArray($aV) Or UBound($aV) <> 3 Then Return SetError(1, 0, 0)
	; ---
	DllCall($__GL_hDLL, "none", "glRasterPos3s", "short", $aV[0], "short", $aV[1], "short", $aV[2])
EndFunc

;GLAPI void APIENTRY glRasterPos4dv ( const double *v )
Func glRasterPos4dv($aV)
	If Not IsArray($aV) Or UBound($aV) <> 4 Then Return SetError(1, 0, 0)
	; ---
	DllCall($__GL_hDLL, "none", "glRasterPos4d", "double", $aV[0], "double", $aV[1], "double", $aV[2], "double", $aV[3])
EndFunc
;GLAPI void APIENTRY glRasterPos4fv ( const float *v )
Func glRasterPos4fv($aV)
	If Not IsArray($aV) Or UBound($aV) <> 4 Then Return SetError(1, 0, 0)
	; ---
	DllCall($__GL_hDLL, "none", "glRasterPos4f", "float", $aV[0], "float", $aV[1], "float", $aV[2], "float", $aV[3])
EndFunc
;GLAPI void APIENTRY glRasterPos4iv ( const int *v )
Func glRasterPos4iv($aV)
	If Not IsArray($aV) Or UBound($aV) <> 4 Then Return SetError(1, 0, 0)
	; ---
	DllCall($__GL_hDLL, "none", "glRasterPos4i", "int", $aV[0], "int", $aV[1], "int", $aV[2], "int", $aV[3])
EndFunc
;GLAPI void APIENTRY glRasterPos4sv ( const short *v )
Func glRasterPos4sv($aV)
	If Not IsArray($aV) Or UBound($aV) <> 4 Then Return SetError(1, 0, 0)
	; ---
	DllCall($__GL_hDLL, "none", "glRasterPos4s", "short", $aV[0], "short", $aV[1], "short", $aV[2], "short", $aV[3])
EndFunc

;GLAPI void APIENTRY glRectd ( double x1, double y1, double x2, double y2 )
Func glRectd($fX1, $fY1, $fX2, $fY2)
	DllCall($__GL_hDLL, "none", "glRectd", "double", $fX1, "double", $fY1, "double", $fX2, "double", $fY2)
EndFunc
;GLAPI void APIENTRY glRectf ( float x1, float y1, float x2, float y2 )
Func glRectf($fX1, $fY1, $fX2, $fY2)
	DllCall($__GL_hDLL, "none", "glRectf", "float", $fX1, "float", $fY1, "float", $fX2, "float", $fY2)
EndFunc
;GLAPI void APIENTRY glRecti ( int x1, int y1, int x2, int y2 )
Func glRecti($iX1, $iY1, $iX2, $iY2)
	DllCall($__GL_hDLL, "none", "glRecti", "int", $iX1, "int", $iY1, "int", $iX2, "int", $iY2)
EndFunc
;GLAPI void APIENTRY glRects ( short x1, short y1, short x2, short y2 )
Func glRects($iX1, $iY1, $iX2, $iY2)
	DllCall($__GL_hDLL, "none", "glRects", "short", $iX1, "short", $iY1, "short", $iX2, "short", $iY2)
EndFunc

;GLAPI void APIENTRY glRectdv ( const double *v1, const double *v2 )
Func glRectdv($aV1, $aV2)
	DllCall($__GL_hDLL, "none", "glRectdv", "double", $aV1[0], "double", $aV1[1], "double", $aV2[0], "double", $aV2[1])
EndFunc
;GLAPI void APIENTRY glRectfv ( const float *v1, const float *v2 )
Func glRectfv($aV1, $aV2)
	DllCall($__GL_hDLL, "none", "glRectfv", "float", $aV1[0], "float", $aV1[1], "float", $aV2[0], "float", $aV2[1])
EndFunc
;GLAPI void APIENTRY glRectiv ( const int *v1, const int *v2 )
Func glRectiv($aV1, $aV2)
	DllCall($__GL_hDLL, "none", "glRectiv", "int", $aV1[0], "int", $aV1[1], "int", $aV2[0], "int", $aV2[1])
EndFunc
;GLAPI void APIENTRY glRectsv ( const short *v1, const short *v2 )
Func glRectsv($aV1, $aV2)
	DllCall($__GL_hDLL, "none", "glRectsv", "short", $aV1[0], "short", $aV1[1], "short", $aV2[0], "short", $aV2[1])
EndFunc
#endregion ### Drawing Functions ###

; ##############################################################

#region ### Lighting ###
;GLAPI void APIENTRY glShadeModel ( unsigned int mode )
Func glShadeModel($iMode)
	DllCall($__GL_hDLL, "none", "glShadeModel", "uint", $iMode)
EndFunc

;GLAPI void APIENTRY glLightf ( unsigned int light, unsigned int pname, float param )
Func glLightf($iLight, $iPname, $fParam)
	DllCall($__GL_hDLL, "none", "glLightf", "uint", $iLight, "uint", $iPname, "float", $fParam)
EndFunc
;GLAPI void APIENTRY glLighti ( unsigned int light, unsigned int pname, int param )
Func glLighti($iLight, $iPname, $iParam)
	DllCall($__GL_hDLL, "none", "glLighti", "uint", $iLight, "uint", $iPname, "int", $iParam)
EndFunc

;GLAPI void APIENTRY glLightfv ( unsigned int light, unsigned int pname, const float *params )
Func glLightfv($iLight, $iPname, $aParams)
	If Not IsArray($aParams) Then glLightf($iLight, $iPname, $aParams)
	; ---
	Local $ub = UBound($aParams)
	Local $struct = DllStructCreate("float[" & $ub & "]")
	For $i = 0 To $ub - 1
		DllStructSetData($struct, 1, $aParams[$i], $i + 1)
	Next
	; ---
	DllCall($__GL_hDLL, "none", "glLightfv", "uint", $iLight, "uint", $iPname, "ptr", DllStructGetPtr($struct))
EndFunc

;GLAPI void APIENTRY glLightiv ( unsigned int light, unsigned int pname, const int *params )
Func glLightiv($iLight, $iPname, $aParams)
	If Not IsArray($aParams) Then glLighti($iLight, $iPname, $aParams)
	; ---
	Local $ub = UBound($aParams)
	Local $struct = DllStructCreate("int[" & $ub & "]")
	For $i = 0 To $ub - 1
		DllStructSetData($struct, 1, $aParams[$i], $i + 1)
	Next
	; ---
	DllCall($__GL_hDLL, "none", "glLightiv", "uint", $iLight, "uint", $iPname, "ptr", DllStructGetPtr($struct))
EndFunc

;GLAPI void APIENTRY glGetLightfv ( unsigned int light, unsigned int pname, float *params )
Func glGetLightfv($iLight, $iPname)
	Local $ret = DllCall($__GL_hDLL, "none", "glGetLightfv", "uint", $iLight, "uint", $iPname, "float*", 0)
	If @error Then Return SetError(@error, @extended, $ret)
	; ---
	Return $ret[3]
EndFunc
;GLAPI void APIENTRY glGetLightiv ( unsigned int light, unsigned int pname, int *params )
Func glGetLightiv($iLight, $iPname)
	Local $ret = DllCall($__GL_hDLL, "none", "glGetLightiv", "uint", $iLight, "uint", $iPname, "int*", 0)
	If @error Then Return SetError(@error, @extended, $ret)
	; ---
	Return $ret[3]
EndFunc

;GLAPI void APIENTRY glLightModelf ( unsigned int pname, float param )
Func glLightModelf($iPname, $fParam)
	DllCall($__GL_hDLL, "none", "glLightModelf", "uint", $iPname, "float", $fParam)
EndFunc
;GLAPI void APIENTRY glLightModeli ( unsigned int pname, int param )
Func glLightModeli($iPname, $iParam)
	DllCall($__GL_hDLL, "none", "glLightModeli", "uint", $iPname, "int", $iParam)
EndFunc

;GLAPI void APIENTRY glLightModelfv ( unsigned int pname, const float *params )
Func glLightModelfv($iPname, $aParams)
	If Not IsArray($aParams) Then Return glLightModelf($iPname, $aParams)
	; ---
	Local $ub = UBound($aParams)
	Local $struct = DllStructCreate("float[" & $ub & "]")
	For $i = 0 To $ub - 1
		DllStructSetData($struct, 1, $aParams[$i], $i + 1)
	Next
	DllCall($__GL_hDLL, "none", "glLightModelfv", "uint", $iPname, "ptr", DllStructGetPtr($struct))
EndFunc

;GLAPI void APIENTRY glLightModeliv ( unsigned int pname, const int *params )
Func glLightModeliv($iPname, $aParams)
	If Not IsArray($aParams) Then Return glLightModeli($iPname, $aParams)
	; ---
	Local $ub = UBound($aParams)
	Local $struct = DllStructCreate("int[" & $ub & "]")
	For $i = 0 To $ub - 1
		DllStructSetData($struct, 1, $aParams[$i], $i + 1)
	Next
	DllCall($__GL_hDLL, "none", "glLightModeliv", "uint", $iPname, "ptr", DllStructGetPtr($struct))
EndFunc

;GLAPI void APIENTRY glMaterialf ( unsigned int face, unsigned int pname, float param )
Func glMaterialf($iFace, $iPname, $fParam)
	DllCall($__GL_hDLL, "none", "glMaterialf", "uint", $iFace, "uint", $iPname, "float", $fParam)
EndFunc
;GLAPI void APIENTRY glMateriali ( unsigned int face, unsigned int pname, int param )
Func glMateriali($iFace, $iPname, $iParam)
	DllCall($__GL_hDLL, "none", "glMateriali", "uint", $iFace, "uint", $iPname, "int", $iParam)
EndFunc

;GLAPI void APIENTRY glMaterialfv ( unsigned int face, unsigned int pname, const float *params )
Func glMaterialfv($iFace, $iPname, $aParams)
	If Not IsArray($aParams) Then Return glMaterialf($iFace, $iPname, $aParams)
	; ---
	Local $ub = UBound($aParams)
	Local $struct = DllStructCreate("float[" & $ub & "]")
	For $i = 0 To $ub - 1
		DllStructSetData($struct, 1, $aParams[$i], $i + 1)
	Next
	DllCall($__GL_hDLL, "none", "glMaterialfv", "uint", $iFace, "uint", $iPname, "ptr", DllStructGetPtr($struct))
EndFunc
;GLAPI void APIENTRY glMaterialiv ( unsigned int face, unsigned int pname, const int *params )
Func glMaterialiv($iFace, $iPname, $aParams)
	If Not IsArray($aParams) Then Return glMateriali($iFace, $iPname, $aParams)
	; ---
	Local $ub = UBound($aParams)
	Local $struct = DllStructCreate("int[" & $ub & "]")
	For $i = 0 To $ub - 1
		DllStructSetData($struct, 1, $aParams[$i], $i + 1)
	Next
	DllCall($__GL_hDLL, "none", "glMaterialiv", "uint", $iFace, "uint", $iPname, "ptr", DllStructGetPtr($struct))
EndFunc

;GLAPI void APIENTRY glGetMaterialfv ( unsigned int face, unsigned int pname, float *params )
Func glGetMaterialfv($iFace, $iPname)
	Local $ret = DllCall($__GL_hDLL, "none", "glGetMaterialfv", "uint", $iFace, "uint", $iPname, "float*", 0)
	If @error Then Return SetError(@error, @extended, $ret)
	; ---
	Return $ret[3]
EndFunc
;GLAPI void APIENTRY glGetMaterialiv ( unsigned int face, unsigned int pname, int *params )
Func glGetMaterialiv($iFace, $iPname)
	Local $ret = DllCall($__GL_hDLL, "none", "glGetMaterialiv", "uint", $iFace, "uint", $iPname, "iny*", 0)
	If @error Then Return SetError(@error, @extended, $ret)
	; ---
	Return $ret[3]
EndFunc

;GLAPI void APIENTRY glColorMaterial ( unsigned int face, unsigned int mode )
Func glColorMaterial($iFace, $iMode)
	DllCall($__GL_hDLL, "none", "glColorMaterial", "uint", $iFace, "uint", $iMode)
EndFunc
#endregion ### Lighting ###

; ##############################################################

#region ### Raster functions ###
;GLAPI void APIENTRY glPixelZoom ( float xfactor, float yfactor )
Func glPixelZoom($fXfactor, $fYfactor)
	DllCall($__GL_hDLL, "none", "glPixelZoom", "float", $fXfactor, "float", $fYfactor)
EndFunc

;GLAPI void APIENTRY glPixelStoref ( unsigned int pname, float param )
Func glPixelStoref($iPname, $fParam)
	DllCall($__GL_hDLL, "none", "glPixelStoref", "uint", $iPname, "float", $fParam)
EndFunc
;GLAPI void APIENTRY glPixelStorei ( unsigned int pname, int param )
Func glPixelStorei($iPname, $iParam)
	DllCall($__GL_hDLL, "none", "glPixelStorei", "uint", $iPname, "int", $iParam)
EndFunc

;GLAPI void APIENTRY glPixelTransferf ( unsigned int pname, float param )
Func glPixelTransferf($iPname, $fParam)
	DllCall($__GL_hDLL, "none", "glPixelTransferf", "uint", $iPname, "float", $fParam)
EndFunc
;GLAPI void APIENTRY glPixelTransferi ( unsigned int pname, int param )
Func glPixelTransferi($iPname, $iParam)
	DllCall($__GL_hDLL, "none", "glPixelTransferi", "uint", $iPname, "int", $iParam)
EndFunc

;GLAPI void APIENTRY glPixelMapfv ( unsigned int map, int mapsize, const float *values )
;GLAPI void APIENTRY glPixelMapuiv ( unsigned int map, int mapsize, const unsigned int *values )
;GLAPI void APIENTRY glPixelMapusv ( unsigned int map, int mapsize, const unsigned short *values )

;GLAPI void APIENTRY glGetPixelMapfv ( unsigned int map, float *values )
;GLAPI void APIENTRY glGetPixelMapuiv ( unsigned int map, unsigned int *values )
;GLAPI void APIENTRY glGetPixelMapusv ( unsigned int map, unsigned short *values )

;GLAPI void APIENTRY glBitmap ( int width, int height, float xorig, float yorig, float xmove, float ymove, const unsigned char *bitmap )
;GLAPI void APIENTRY glReadPixels ( int x, int y, int width, int height, unsigned int format, unsigned int type, void *pixels )
;GLAPI void APIENTRY glDrawPixels ( int width, int height, unsigned int format, unsigned int type, const void *pixels )
;GLAPI void APIENTRY glCopyPixels ( int x, int y, int width, int height, unsigned int type )
#endregion ### Raster functions ###

; ##############################################################

#region ### Stenciling ###
;GLAPI void APIENTRY glStencilFunc ( unsigned int func, int ref, unsigned int mask )
Func glStencilFunc($iFunc, $iRef, $iMask)
	DllCall($__GL_hDLL, "none", "glStencilFunc", "uint", $iFunc, "int", $iRef, "uint", $iMask)
EndFunc

;GLAPI void APIENTRY glStencilMask ( unsigned int mask )
Func glStencilMask($iMask)
	DllCall($__GL_hDLL, "none", "glStencilMask", "uint", $iMask)
EndFunc

;GLAPI void APIENTRY glStencilOp ( unsigned int fail, unsigned int zfail, unsigned int zpass )
Func glStencilOp($iFail, $iZfail, $iZpass)
	DllCall($__GL_hDLL, "none", "glStencilOp", "uint", $iFail, "uint", $iZfail, "uint", $iZpass)
EndFunc

;GLAPI void APIENTRY glClearStencil ( int s )
Func glClearStencil($iS)
	DllCall($__GL_hDLL, "none", "glClearStencil", "int", $iS)
EndFunc
#endregion ### Stenciling ###

; ##############################################################

#region ### Texture mapping ###
;GLAPI void APIENTRY glTexGend ( unsigned int coord, unsigned int pname, double param )
Func glTexGend($iCoord, $iPname, $fParam)
	DllCall($__GL_hDLL, "none", "glTexGend", "uint", $iCoord, "uint", $iPname, "double", $fParam)
EndFunc
;GLAPI void APIENTRY glTexGenf ( unsigned int coord, unsigned int pname, float param )
Func glTexGenf($iCoord, $iPname, $fParam)
	DllCall($__GL_hDLL, "none", "glTexGenf", "uint", $iCoord, "uint", $iPname, "float", $fParam)
EndFunc
;GLAPI void APIENTRY glTexGeni ( unsigned int coord, unsigned int pname, int param )
Func glTexGeni($iCoord, $iPname, $iParam)
	DllCall($__GL_hDLL, "none", "glTexGeni", "uint", $iCoord, "uint", $iPname, "int", $iParam)
EndFunc

;GLAPI void APIENTRY glTexGendv ( unsigned int coord, unsigned int pname, const double *params )
Func glTexGendv($iCoord, $iPname, $aParams)
	If Not IsArray($aParams) Then Return SetError(1, 0, 0)
	; ---
	Local $ub = UBound($aParams)
	Local $struct = DllStructCreate("double[" & $ub & "]")
	For $i = 0 To $ub - 1
		DllStructSetData($struct, 1, $aParams[$i], $i + 1)
	Next
	DllCall($__GL_hDLL, "none", "glTexGendv", "uint", $iCoord, "uint", $iPname, "ptr", DllStructGetPtr($struct))
EndFunc
;GLAPI void APIENTRY glTexGenfv ( unsigned int coord, unsigned int pname, const float *params )
Func glTexGenfv($iCoord, $iPname, $aParams)
	If Not IsArray($aParams) Then Return SetError(1, 0, 0)
	; ---
	Local $ub = UBound($aParams)
	Local $struct = DllStructCreate("float[" & $ub & "]")
	For $i = 0 To $ub - 1
		DllStructSetData($struct, 1, $aParams[$i], $i + 1)
	Next
	DllCall($__GL_hDLL, "none", "glTexGenfv", "uint", $iCoord, "uint", $iPname, "ptr", DllStructGetPtr($struct))
EndFunc
;GLAPI void APIENTRY glTexGeniv ( unsigned int coord, unsigned int pname, const int *params )
Func glTexGeniv($iCoord, $iPname, $aParams)
	If Not IsArray($aParams) Then Return SetError(1, 0, 0)
	; ---
	Local $ub = UBound($aParams)
	Local $struct = DllStructCreate("int[" & $ub & "]")
	For $i = 0 To $ub - 1
		DllStructSetData($struct, 1, $aParams[$i], $i + 1)
	Next
	DllCall($__GL_hDLL, "none", "glTexGeniv", "uint", $iCoord, "uint", $iPname, "ptr", DllStructGetPtr($struct))
EndFunc

;GLAPI void APIENTRY glGetTexGendv ( unsigned int coord, unsigned int pname, double *params )
Func glGetTexGendv($iCoord, $iPname)
	Local $ret = DllCall($__GL_hDLL, "none", "glGetTexGendv", "uint", $iCoord, "uint", $iPname, "double*", 0)
	If @error Then Return SetError(@error, @extended, $ret)
	; ---
	Return $ret[3]
EndFunc
;GLAPI void APIENTRY glGetTexGenfv ( unsigned int coord, unsigned int pname, float *params )
Func glGetTexGenfv($iCoord, $iPname)
	Local $ret = DllCall($__GL_hDLL, "none", "glGetTexGenfv", "uint", $iCoord, "uint", $iPname, "float*", 0)
	If @error Then Return SetError(@error, @extended, $ret)
	; ---
	Return $ret[3]
EndFunc
;GLAPI void APIENTRY glGetTexGeniv ( unsigned int coord, unsigned int pname, int *params )
Func glGetTexGeniv($iCoord, $iPname)
	Local $ret = DllCall($__GL_hDLL, "none", "glGetTexGeniv", "uint", $iCoord, "uint", $iPname, "int*", 0)
	If @error Then Return SetError(@error, @extended, $ret)
	; ---
	Return $ret[3]
EndFunc

;GLAPI void APIENTRY glTexEnvf ( unsigned int target, unsigned int pname, float param )
Func glTexEnvf($iTarget, $iPname, $fParam)
	DllCall($__GL_hDLL, "none", "glTexEnvf", "uint", $iTarget, "uint", $iPname, "float", $fParam)
EndFunc
;GLAPI void APIENTRY glTexEnvi ( unsigned int target, unsigned int pname, int param )
Func glTexEnvi($iTarget, $iPname, $iParam)
	DllCall($__GL_hDLL, "none", "glTexEnvi", "uint", $iTarget, "uint", $iPname, "int", $iParam)
EndFunc

;GLAPI void APIENTRY glTexEnvfv ( unsigned int target, unsigned int pname, const float *params )
Func glTexEnvfv($iTarget, $iPname, $aParams)
	If Not IsArray($aParams) Then Return SetError(1, 0, 0)
	; ---
	Local $ub = UBound($aParams)
	Local $struct = DllStructCreate("float[" & $ub & "]")
	For $i = 0 To $ub - 1
		DllStructSetData($struct, 1, $aParams[$i], $i + 1)
	Next
	DllCall($__GL_hDLL, "none", "glTexEnvfv", "uint", $iTarget, "uint", $iPname, "ptr", DllStructGetPtr($struct))
EndFunc
;GLAPI void APIENTRY glTexEnviv ( unsigned int target, unsigned int pname, const int *params )
Func glTexEnviv($iTarget, $iPname, $aParams)
	If Not IsArray($aParams) Then Return SetError(1, 0, 0)
	; ---
	Local $ub = UBound($aParams)
	Local $struct = DllStructCreate("int[" & $ub & "]")
	For $i = 0 To $ub - 1
		DllStructSetData($struct, 1, $aParams[$i], $i + 1)
	Next
	DllCall($__GL_hDLL, "none", "glTexEnviv", "uint", $iTarget, "uint", $iPname, "ptr", DllStructGetPtr($struct))
EndFunc

;GLAPI void APIENTRY glGetTexEnvfv ( unsigned int target, unsigned int pname, float *params )
Func glGetTexEnvfv($iTarget, $iPname)
	Local $ret = DllCall($__GL_hDLL, "none", "glGetTexEnvfv", "uint", $iTarget, "uint", $iPname, "float*", 0)
	If @error Then Return SetError(@error, @extended, $ret)
	; ---
	Return $ret[3]
EndFunc

;GLAPI void APIENTRY glGetTexEnviv ( unsigned int target, unsigned int pname, int *params )
Func glGetTexEnviv($iTarget, $iPname)
	Local $ret = DllCall($__GL_hDLL, "none", "glGetTexEnviv", "uint", $iTarget, "uint", $iPname, "int*", 0)
	If @error Then Return SetError(@error, @extended, $ret)
	; ---
	Return $ret[3]
EndFunc

;GLAPI void APIENTRY glTexParameterf ( unsigned int target, unsigned int pname, float param )
Func glTexParameterf($iTarget, $iPname, $fParam)
	DllCall($__GL_hDLL, "none", "glTexParameterf", "uint", $iTarget, "uint", $iPname, "float", $fParam)
EndFunc
;GLAPI void APIENTRY glTexParameteri ( unsigned int target, unsigned int pname, int param )
Func glTexParameteri($iTarget, $iPname, $iParam)
	DllCall($__GL_hDLL, "none", "glTexParameteri", "uint", $iTarget, "uint", $iPname, "int", $iParam)
EndFunc

;GLAPI void APIENTRY glTexParameterfv ( unsigned int target, unsigned int pname, const float *params )
Func glTexParameterfv($iTarget, $iPname, $aParams)
	If Not IsArray($aParams) Then Return SetError(1, 0, 0)
	; ---
	Local $ub = UBound($aParams)
	Local $struct = DllStructCreate("float[" & $ub & "]")
	For $i = 0 To $ub - 1
		DllStructSetData($struct, 1, $aParams[$i], $i + 1)
	Next
	DllCall($__GL_hDLL, "none", "glTexParameterfv", "uint", $iTarget, "uint", $iPname, "ptr", DllStructGetPtr($struct))
EndFunc
;GLAPI void APIENTRY glTexParameteriv ( unsigned int target, unsigned int pname, const int *params )
Func glTexParameteriv($iTarget, $iPname, $aParams)
	If Not IsArray($aParams) Then Return SetError(1, 0, 0)
	; ---
	Local $ub = UBound($aParams)
	Local $struct = DllStructCreate("int[" & $ub & "]")
	For $i = 0 To $ub - 1
		DllStructSetData($struct, 1, $aParams[$i], $i + 1)
	Next
	DllCall($__GL_hDLL, "none", "glTexParameteriv", "uint", $iTarget, "uint", $iPname, "ptr", DllStructGetPtr($struct))
EndFunc

;GLAPI void APIENTRY glGetTexParameterfv ( unsigned int target, unsigned int pname, float *params)
Func glGetTexParameterfv($iTarget, $iPname)
	Local $ret = DllCall($__GL_hDLL, "none", "glGetTexParameterfv", "uint", $iTarget, "uint", $iPname, "float*", 0)
	If @error Then Return SetError(@error, @extended, $ret)
	; ---
	Return $ret[3]
EndFunc

;GLAPI void APIENTRY glGetTexParameteriv ( unsigned int target, unsigned int pname, int *params )
Func glGetTexParameteriv($iTarget, $iPname)
	Local $ret = DllCall($__GL_hDLL, "none", "glGetTexParameteriv", "uint", $iTarget, "uint", $iPname, "int*", 0)
	If @error Then Return SetError(@error, @extended, $ret)
	; ---
	Return $ret[3]
EndFunc

;GLAPI void APIENTRY glGetTexLevelParameterfv ( unsigned int target, int level, unsigned int pname, float *params )
Func glGetTexLevelParameterfv($iTarget, $iLevel, $iPname)
	Local $ret = DllCall($__GL_hDLL, "none", "glGetTexLevelParameterfv", "uint", $iTarget, "int", $iLevel, "uint", $iPname, "float*", 0)
	If @error Then Return SetError(@error, @extended, $ret)
	; ---
	Return $ret[4]
EndFunc
;GLAPI void APIENTRY glGetTexLevelParameteriv ( unsigned int target, int level, unsigned int pname, int *params )
Func glGetTexLevelParameteriv($iTarget, $iLevel, $iPname)
	Local $ret = DllCall($__GL_hDLL, "none", "glGetTexLevelParameteriv", "uint", $iTarget, "int", $iLevel, "uint", $iPname, "int*", 0)
	If @error Then Return SetError(@error, @extended, $ret)
	; ---
	Return $ret[4]
EndFunc

;GLAPI void APIENTRY glTexImage1D ( unsigned int target, int level, int internalFormat, int width, int border, unsigned int format, unsigned int type, const void *pixels )
;GLAPI void APIENTRY glTexImage2D ( unsigned int target, int level, int internalFormat, int width, int height, int border, unsigned int format, unsigned int type, const void *pixels )
;GLAPI void APIENTRY glGetTexImage ( unsigned int target, int level, unsigned int format, unsigned int type, void *pixels )
#endregion ### Texture mapping ###

; ##############################################################

#region ### Evaluators ###
;GLAPI void APIENTRY glMap1d ( unsigned int target, double u1, double u2, int stride, int order, const double *points )
Func glMap1d($iTarget, $fU1, $fU2, $iStride, $iOrder, Const ByRef $aPoints)
	Local $struct = DllStructCreate("double[" & $iOrder & "]")
	For $i = 0 To $iOrder - 1
		DllStructSetData($struct, 1, $aPoints[$i], $i + 1)
	Next
	DllCall($__GL_hDLL, "none", "glMap1d", "uint", $iTarget, "double", $fU1, "double", $fU2, "int", $iStride, "int", $iOrder, "ptr", DllStructGetPtr($struct))
EndFunc
;GLAPI void APIENTRY glMap1f ( unsigned int target, float u1, float u2, int stride, int order, const float *points )
Func glMap1f($iTarget, $fU1, $fU2, $iStride, $iOrder, Const ByRef $aPoints)
	Local $struct = DllStructCreate("float[" & $iOrder & "]")
	For $i = 0 To $iOrder - 1
		DllStructSetData($struct, 1, $aPoints[$i], $i + 1)
	Next
	DllCall($__GL_hDLL, "none", "glMap1f", "uint", $iTarget, "double", $fU1, "double", $fU2, "int", $iStride, "int", $iOrder, "ptr", DllStructGetPtr($struct))
EndFunc

;GLAPI void APIENTRY glMap2d ( unsigned int target, double u1, double u2, int ustride, int uorder, double v1, double v2, int vstride, int vorder, const double *points )
;GLAPI void APIENTRY glMap2f ( unsigned int target, float u1, float u2, int ustride, int uorder, float v1, float v2, int vstride, int vorder, const float *points )

;GLAPI void APIENTRY glGetMapdv ( unsigned int target, unsigned int query, double *v )
;GLAPI void APIENTRY glGetMapfv ( unsigned int target, unsigned int query, float *v )
;GLAPI void APIENTRY glGetMapiv ( unsigned int target, unsigned int query, int *v )

;GLAPI void APIENTRY glEvalCoord1d ( double u )
Func glEvalCoord1d($fU)
	DllCall($__GL_hDLL, "none", "glEvalCoord1d", "double", $fU)
EndFunc
;GLAPI void APIENTRY glEvalCoord1f ( float u )
Func glEvalCoord1f($fU)
	DllCall($__GL_hDLL, "none", "glEvalCoord1f", "float", $fU)
EndFunc

;GLAPI void APIENTRY glEvalCoord1dv ( const double *u )
Func glEvalCoord1dv($fU)
	DllCall($__GL_hDLL, "none", "glEvalCoord1d", "double", $fU)
EndFunc
;GLAPI void APIENTRY glEvalCoord1fv ( const float *u )
Func glEvalCoord1fv($fU)
	DllCall($__GL_hDLL, "none", "glEvalCoord1f", "float", $fU)
EndFunc

;GLAPI void APIENTRY glEvalCoord2d ( double u, double v )
Func glEvalCoord2d($fU, $fV)
	DllCall($__GL_hDLL, "none", "glEvalCoord2d", "double", $fU, "double", $fV)
EndFunc
;GLAPI void APIENTRY glEvalCoord2f ( float u, float v )
Func glEvalCoord2f($fU, $fV)
	DllCall($__GL_hDLL, "none", "glEvalCoord2f", "float", $fU, "float", $fV)
EndFunc

;GLAPI void APIENTRY glEvalCoord2dv ( const double *u )
Func glEvalCoord2dv($aUV)
	If UBound($aUV) <> 2 Then Return SetError(1, 0, 0)
	; ---
	DllCall($__GL_hDLL, "none", "glEvalCoord2d", "double", $aUV[0], "double", $aUV[1])
EndFunc
;GLAPI void APIENTRY glEvalCoord2fv ( const float *u )
Func glEvalCoord2fv($aUV)
	If UBound($aUV) <> 2 Then Return SetError(1, 0, 0)
	; ---
	DllCall($__GL_hDLL, "none", "glEvalCoord2f", "float", $aUV[0], "float", $aUV[1])
EndFunc

;GLAPI void APIENTRY glMapGrid1d ( int un, double u1, double u2 )
Func glMapGrid1d($iUn, $fU1, $fU2)
	DllCall($__GL_hDLL, "none", "glMapGrid1d", "int", $iUn, "double", $fU1, "double", $fU2)
EndFunc
;GLAPI void APIENTRY glMapGrid1f ( int un, float u1, float u2 )
Func glMapGrid1f($iUn, $fU1, $fU2)
	DllCall($__GL_hDLL, "none", "glMapGrid1f", "int", $iUn, "float", $fU1, "float", $fU2)
EndFunc

;GLAPI void APIENTRY glMapGrid2d ( int un, double u1, double u2, int vn, double v1, double v2 )
Func glMapGrid2d($iUn, $fU1, $fU2, $iVn, $fV1, $fV2)
	DllCall($__GL_hDLL, "none", "glMapGrid2d", "int", $iUn, "double", $fU1, "double", $fU2, "int", $iVn, "double", $fV1, "double", $fV2)
EndFunc
;GLAPI void APIENTRY glMapGrid2f ( int un, float u1, float u2, int vn, float v1, float v2 )
Func glMapGrid2f($iUn, $fU1, $fU2, $iVn, $fV1, $fV2)
	DllCall($__GL_hDLL, "none", "glMapGrid2f", "int", $iUn, "float", $fU1, "float", $fU2, "int", $iVn, "float", $fV1, "float", $fV2)
EndFunc

;GLAPI void APIENTRY glEvalPoint1 ( int i )
Func glEvalPoint1($iI)
	DllCall($__GL_hDLL, "none", "glEvalPoint1", "int", $iI)
EndFunc
;GLAPI void APIENTRY glEvalPoint2 ( int i, int j )
Func glEvalPoint2($iI, $iJ)
	DllCall($__GL_hDLL, "none", "glEvalPoint2", "int", $iI, "int", $iJ)
EndFunc

;GLAPI void APIENTRY glEvalMesh1 ( unsigned int mode, int i1, int i2 )
Func glEvalMesh1($iMode, $iI1, $iI2)
	DllCall($__GL_hDLL, "none", "glEvalMesh1", "uint", $iMode, "int", $iI1, "int", $iI2)
EndFunc
;GLAPI void APIENTRY glEvalMesh2 ( unsigned int mode, int i1, int i2, int j1, int j2 )
Func glEvalMesh2($iMode, $iI1, $iI2, $iJ1, $iJ2)
	DllCall($__GL_hDLL, "none", "glEvalMesh2", "uint", $iMode, "int", $iI1, "int", $iI2, "int", $iJ1, "int", $iJ2)
EndFunc
#endregion ### Evaluators ###

; ##############################################################

#region ### Fog ###
;GLAPI void APIENTRY glFogf ( unsigned int pname, float param )
Func glFogf($iPname, $fParam)
	DllCall($__GL_hDLL, "none", "glFogf", "uint", $iPname, "float", $fParam)
EndFunc

;GLAPI void APIENTRY glFogi ( unsigned int pname, int param )
Func glFogi($iPname, $iParam)
	DllCall($__GL_hDLL, "none", "glFogi", "uint", $iPname, "int", $iParam)
EndFunc

;GLAPI void APIENTRY glFogfv ( unsigned int pname, const float *params )
Func glFogfv($iPname, $aParams)
	If $iPname = $GL_FOG_COLOR Then
		If UBound($aParams) = 4 Then
			Local $struct = DllStructCreate("float[4]")
			DllStructSetData($struct, 1, $aParams[0], 1)
			DllStructSetData($struct, 1, $aParams[1], 2)
			DllStructSetData($struct, 1, $aParams[2], 3)
			DllStructSetData($struct, 1, $aParams[3], 4)
			DllCall($__GL_hDLL, "none", "glFogfv", "uint", $iPname, "ptr", DllStructGetPtr($struct))
		Else
			Return SetError(1, 0, 0)
		EndIf
	Else
		If IsArray($aParams) Then
			DllCall($__GL_hDLL, "none", "glFogf", "uint", $iPname, "float", $aParams[0])
		Else
			DllCall($__GL_hDLL, "none", "glFogf", "uint", $iPname, "float", $aParams)
		EndIf
	EndIf
EndFunc

;GLAPI void APIENTRY glFogiv ( unsigned int pname, const int *params )
Func glFogiv($iPname, $aParams)
	If $iPname = $GL_FOG_COLOR Then
		If UBound($aParams) = 4 Then
			Local $struct = DllStructCreate("int[4]")
			DllStructSetData($struct, 1, $aParams[0], 1)
			DllStructSetData($struct, 1, $aParams[1], 2)
			DllStructSetData($struct, 1, $aParams[2], 3)
			DllStructSetData($struct, 1, $aParams[3], 4)
			DllCall($__GL_hDLL, "none", "glFogfv", "uint", $iPname, "ptr", DllStructGetPtr($struct))
		Else
			Return SetError(1, 0, 0)
		EndIf
	Else
		If IsArray($aParams) Then
			DllCall($__GL_hDLL, "none", "glFogi", "uint", $iPname, "int", $aParams[0])
		Else
			DllCall($__GL_hDLL, "none", "glFogi", "uint", $iPname, "int", $aParams)
		EndIf
	EndIf
EndFunc
#endregion ### Fog ###

; ##############################################################

#region ### Selection and Feedback ###
;GLAPI void APIENTRY glFeedbackBuffer ( int size, unsigned int type, float *buffer )
Func glFeedbackBuffer($iSize, $iType, ByRef $aBuffer)
	Local $struct = DllStructCreate("float[" & $iSize & "]")
	DllCall($__GL_hDLL, "none", "glFeedbackBuffer", "int", $iSize, "uint", $iType, "ptr", DllStructGetPtr($struct))
	; ---
	Dim $aBuffer[$iSize]
	For $i = 0 To $iSize - 1
		$aBuffer[$i] = DllStructGetData($struct, 1, $i + 1)
	Next
EndFunc

;GLAPI void APIENTRY glPassThrough ( float token )
Func glPassThrough($fToken)
	DllCall($__GL_hDLL, "none", "glPassThrough", "float", $fToken)
EndFunc

;GLAPI void APIENTRY glSelectBuffer ( int size, unsigned int *buffer )
Func glSelectBuffer($iSize, ByRef $aBuffer)
	Local $struct = DllStructCreate("uint[" & $iSize & "]")
	DllCall($__GL_hDLL, "none", "glSelectBuffer", "int", $iSize, "ptr", DllStructGetPtr($struct))
	; ---
	Dim $aBuffer[$iSize]
	For $i = 0 To $iSize - 1
		$aBuffer[$i] = DllStructGetData($struct, 1, $i + 1)
	Next
EndFunc

;GLAPI void APIENTRY glInitNames ( void )
Func glInitNames()
	DllCall($__GL_hDLL, "none", "glInitNames")
EndFunc

;GLAPI void APIENTRY glLoadName ( unsigned int name )
Func glLoadName($iName)
	DllCall($__GL_hDLL, "none", "glLoadName", "uint", $iName)
EndFunc

;GLAPI void APIENTRY glPushName ( unsigned int name )
Func glPushName($iName)
	DllCall($__GL_hDLL, "none", "glPushName", "uint", $iName)
EndFunc

;GLAPI void APIENTRY glPopName ( void )
Func glPopName()
	DllCall($__GL_hDLL, "none", "glPopName")
EndFunc
#endregion ### Selection and Feedback ###

; ##############################################################

#region ### 1.1 functions ###
; texture objects
;GLAPI void APIENTRY glGenTextures ( int n, unsigned int *textures )
Func glGenTextures($iN)
	Local $struct = DllStructCreate("int[" & $iN & "]")
	Local $ret = DllCall($__GL_hDLL, "none", "glGenTextures", "int", $iN, "ptr", DllStructGetPtr($struct))
	If @error Then Return SetError(@error, @extended, $ret)
	; ---
	If $iN = 1 Then
		Return DllStructGetData($struct, 1, 1)
	Else
		Local $aTex[$iN + 1]
		$aTex[0] = $iN
		; ---
		For $i = 1 To $iN
			$aTex[$i] = DllStructGetData($struct, 1, $i)
		Next
		Return $aTex
	EndIf
EndFunc

;GLAPI void APIENTRY glDeleteTextures ( int n, const unsigned int *textures)
Func glDeleteTextures($iN, $aTex)
	If $iN = 1 Then
		Dim $aTex[$iN] = [$aTex]
	EndIf
	; ---
	Local $struct = DllStructCreate("int[" & $iN & "]")
	For $i = 0 To $iN - 1
		DllStructSetData($struct, 1, $aTex[$i], $i + 1)
	Next
	; ---
	Local $ret = DllCall($__GL_hDLL, "none", "glDeleteTextures", "int", $iN, "ptr", DllStructGetPtr($struct))
	If @error Then Return SetError(@error, @extended, $ret)
	; ---
	Return SetError(0, 0, 1)
EndFunc

;GLAPI void APIENTRY glBindTexture ( unsigned int target, unsigned int texture )
Func glBindTexture($iTarget, $iTexture)
	DllCall($__GL_hDLL, "none", "glBindTexture", "uint", $iTarget, "uint", $iTexture)
EndFunc

;GLAPI void APIENTRY glPrioritizeTextures ( int n, const unsigned int *textures, const float *priorities )
Func glPrioritizeTextures($iN, Const ByRef $aTextures, Const ByRef $aPriorities) ; Not tested
	If Not IsArray($aTextures) Or Not IsArray($aPriorities) Then Return SetError(1, 0, 0)
	; ---
	Local $ub1 = UBound($aTextures), $ub2 = UBound($aPriorities)
	If $ub1 <> $ub2 Then Return SetError(2, 0, 0)
	; ---
	Local $s1 = DllStructCreate("uint[" & $ub1 & "]")
	Local $s2 = DllStructCreate("float[" & $ub2 & "]")
	For $i = 0 To $ub1 - 1
		DllStructSetData($s1, 1, $aTextures[$i], $i + 1)
		DllStructSetData($s2, 1, $aPriorities[$i], $i + 1)
	Next
	DllCall($__GL_hDLL, "none", "glPrioritizeTextures", "int", $iN, "ptr", DllStructGetPtr($s1), "ptr", DllStructGetPtr($s2))
EndFunc

;GLAPI unsigned char APIENTRY glAreTexturesResident ( int n, const unsigned int *textures, unsigned char *residences )
Func glAreTexturesResident($iN, Const ByRef $aTextures, ByRef $aResidences) ; Not tested
	If Not IsArray($aTextures) Then Return SetError(1, 0, 0)
	; ---
	Local $ub = UBound($aTextures)
	Local $s_in = DllStructCreate("uint[" & $ub & "]")
	Local $s_out = DllStructCreate("byte[" & $ub & "]")
	For $i = 0 To $ub - 1
		DllStructSetData($s_in, 1, $aTextures[$i], $i + 1)
	Next
	Local $ret = DllCall($__GL_hDLL, "none", "glAreTexturesResident", "int", $iN, "ptr", $s_in, "ptr", $s_out)
	If @error Then Return SetError(@error, @extended, $ret)
	; ---
	Dim $aResidences[$ub]
	For $i = 0 To $ub - 1
		$aResidences[$i] = DllStructGetData($s_out, 1, $i + 1)
	Next
	; ---
	Return $ret[0]
EndFunc

;GLAPI unsigned char APIENTRY glIsTexture ( unsigned int texture )
Func glIsTexture($iTexture)
	Local $ret = DllCall($__GL_hDLL, "byte", "glIsTexture", "uint", $iTexture)
	If @error Then Return SetError(@error, @extended, $ret)
	; ---
	Return SetError(0, 0, $ret[0])
EndFunc

; SUPER EXPERIMENTAL FUNCTION!!!!
Func glCallListsChar($iSize, $iType, $pList)
    DllCall($__GL_hDLL, "none", "glCallLists", "dword", $iSize, "dword", $iType, "str", $pList)
EndFunc   ;==>_glCallListsChar
