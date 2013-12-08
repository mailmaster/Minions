#include-once
; WARNING! These functions are highly experimental!
; glext. Author: minx

Global Const $GLFONT_ITALIC = 2
Global Const $GLFONT_UNDERLINE = 4
Global Const $GLFONT_STRIKEOUT = 8
Global Const $GLFONT_DRAFT_QUALITY = 16
Global Const $GLFONT_PROOF_QUALITY = 32
Global Const $GLFONT_NONANTIALIASED_QUALITY = 64
Global Const $GLFONT_ANTIALIASED_QUALITY = 128
Global Const $GLFONT_CLEARTYPE_QUALITY = 256
Global Const $GLFONT_CLEARTYPE_COMPAT_QUALITY = 512

; Function: extTexture3a
; Lädt eine 3-Channel Textur
Func extTexture3a($File)
	Local $iW, $iH, $iChannels
	$imgData = soil_load_image($File, $iW, $iH, $iChannels, 3) 
	$Textur = soil_create_OGL_texture($imgData, $iW, $iH, $iChannels, 0, $SOIL_FLAG_POWER_OF_TWO)
	soil_free_image_data($imgData)
	Return $Textur
EndFunc

; Function: extTexture4a
; Lädt eine 4-Channel Textur
Func extTexture4a($File)
	Local $iW, $iH, $iChannels
	$imgData = soil_load_image($File, $iW, $iH, $iChannels, 4) 
	$Textur = soil_create_OGL_texture($imgData, $iW, $iH, $iChannels, 0, $SOIL_FLAG_POWER_OF_TWO)
	soil_free_image_data($imgData)
	Return $Textur
EndFunc

; Function: extDrawText()
; Schreibt Text mit der extCreateFont()
Func extDrawText($iXcoordinate, $iYcoordinate, $sString, $hFontList)
    glPushMatrix()
    glRasterPos2f($iXcoordinate, $iYcoordinate)
    glPushAttrib($GL_ALL_ATTRIB_BITS)
    glListBase($hFontList)
    glCallListsChar(StringLen($sString), $GL_UNSIGNED_BYTE, $sString)
    glPopAttrib()
    glPopMatrix()
EndFunc   ;==>_glDrawText


; Function: extCreateFont()
; Erstellt eine Font
Func extCreateFont($iSize = 8.5, $iWeight = 400, $iAttribute = 256, $sFontName = "", $hFontList = 0, $iNumberOf = 1)
    Local $aCall = DllCall("opengl32.dll", "hwnd", "wglGetCurrentDC")
    If @error Or Not $aCall[0] Then
        Return SetError(1, 0, 0)
    EndIf
    Local $hDC = $aCall[0]
    $aCall = DllCall("gdi32.dll", "int", "GetDeviceCaps", "hwnd", $hDC, "int", 90) ; LOGPIXELSY
    If @error Or Not $aCall[0] Then
        Return SetError(2, 0, 0)
    EndIf
    Local $iDCaps = $aCall[0]
    Local $iItalic = BitAND($iAttribute, 2)
    Local $iUnderline = BitAND($iAttribute, 4)
    Local $iStrikeout = BitAND($iAttribute, 8)
    Local $iQuality
    If BitAND($iAttribute, 16) Then
        $iQuality = 1 ; DRAFT_QUALITY
    ElseIf BitAND($iAttribute, 32) Then
        $iQuality = 2 ; PROOF_QUALITY
    ElseIf BitAND($iAttribute, 64) Then
        $iQuality = 3 ; NONANTIALIASED_QUALITY
    ElseIf BitAND($iAttribute, 128) Then
        $iQuality = 4 ; ANTIALIASED_QUALITY
    ElseIf BitAND($iAttribute, 256) Then
        $iQuality = 5 ; CLEARTYPE_QUALITY
    ElseIf BitAND($iAttribute, 512) Then
        $iQuality = 6 ; CLEARTYPE_COMPAT_QUALITY
    EndIf
    $aCall = DllCall("gdi32.dll", "ptr", "CreateFontW", "int", -$iSize * $iDCaps / 72, "int", 0, "int", 0, "int", 0, "int", $iWeight, "dword", $iItalic, "dword", $iUnderline, "dword", $iStrikeout, "dword", 0, "dword", 0, "dword", 0, "dword", $iQuality, "dword", 0, "wstr", $sFontName)
    If @error Or Not $aCall[0] Then
        Return SetError(3, 0, 0)
    EndIf
    Local $hFont = $aCall[0]
    $aCall = DllCall("gdi32.dll", "hwnd", "SelectObject", "hwnd", $hDC, "hwnd", $hFont)
    If @error Or Not $aCall[0] Then
        DllCall("gdi32.dll", "int", "DeleteObject", "hwnd", $hFont)
        Return SetError(4, 0, 0)
    EndIf
    Local $hOldFont = $aCall[0]
    If $hFontList Then DllCall("opengl32.dll", "dword", "glDeleteLists", "dword", $hFontList, "dword", $iNumberOf)
    $aCall = DllCall("opengl32.dll", "dword", "glGenLists", "dword", 1)
    If @error Or Not $aCall[0] Then
        DllCall("gdi32.dll", "int", "DeleteObject", "hwnd", $hFont)
        Return SetError(5, 0, 0)
    EndIf
    $hFontList = $aCall[0]
    $aCall = DllCall("opengl32.dll", "int", "wglUseFontBitmapsW", "ptr", $hDC, "dword", 0, "dword", 256, "ptr", $hFontList)
    If @error Or Not $aCall[0] Then
        DllCall("gdi32.dll", "int", "DeleteObject", "hwnd", $hFont)
        Return SetError(6, 0, 0)
    EndIf
    DllCall("gdi32.dll", "int", "DeleteObject", "hwnd", $hOldFont)
    Return SetError(0, 0, $hFontList)
EndFunc   ;==>_CreateOpenGLFont

; Function: extTexCube
; Draws a textured cube
; $mx, $my, $mz are the coordinates of the MID!!! Vertex.
; $s is the Size as FLOAT
Func extTexCube($mx, $my, $mz, $s)
	glBegin($GL_QUADS)
		glTexCoord2f(1, 0)
		glVertex3f($mx-$s, $my+$s, $mz+$s)
		glTexCoord2f(1, 1)
		glVertex3f($mx-$s, $my-$s, $mz+$s)
		glTexCoord2f(0, 1)
		glVertex3f($mx+$s, $my-$s, $mz+$s)
		glTexCoord2f(0, 0)
		glVertex3f($mx+$s, $my+$s, $mz+$s)
		
		glTexCoord2f(0, 0)
		glVertex3f($mx-$s, $my+$s, $mz-$s)
		glTexCoord2f(1, 0)
		glVertex3f($mx+$s, $my+$s, $mz-$s)
		glTexCoord2f(1, 1)
		glVertex3f($mx+$s, $my-$s, $mz-$s)
		glTexCoord2f(0, 1)
		glVertex3f($mx-$s, $my-$s, $mz-$s)
		
		glTexCoord2f(1, 0)
		glVertex3f($mx-$s, $my+$s, $mz-$s)
		glTexCoord2f(1, 1)
		glVertex3f($mx-$s, $my+$s, $mz+$s)
		glTexCoord2f(0, 1)
		glVertex3f($mx+$s, $my+$s, $mz+$s)
		glTexCoord2f(0, 0)
		glVertex3f($mx+$s, $my+$s, $mz-$s)
		
		glTexCoord2f(1, 1)
		glVertex3f($mx-$s, $my-$s, $mz-$s)
		glTexCoord2f(0, 1)
		glVertex3f($mx+$s, $my-$s, $mz-$s)
		glTexCoord2f(0, 0)
		glVertex3f($mx+$s, $my-$s, $mz+$s)
		glTexCoord2f(1, 0)
		glVertex3f($mx-$s, $my-$s, $mz+$s)
		
		glTexCoord2f(1, 0)
		glVertex3f($mx-$s, $my+$s, $mz-$s)
		glTexCoord2f(1, 1)
		glVertex3f($mx-$s, $my-$s, $mz-$s)
		glTexCoord2f(0, 1)
		glVertex3f($mx-$s, $my-$s, $mz+$s)
		glTexCoord2f(0, 0)
		glVertex3f($mx-$s, $my+$s, $mz+$s)
		
		glTexCoord2f(1, 0)
		glVertex3f($mx+$s, $my+$s, $mz+$s)
		glTexCoord2f(1, 1)
		glVertex3f($mx+$s, $my-$s, $mz+$s)
		glTexCoord2f(0, 1)
		glVertex3f($mx+$s, $my-$s, $mz-$s)
		glTexCoord2f(0, 0)
		glVertex3f($mx+$s, $my+$s, $mz-$s)
	glEnd()
EndFunc

Func extSolidCube($mx, $my, $mz, $s)
	glBegin($GL_QUADS)
		glVertex3f($mx-$s, $my+$s, $mz+$s)
		glVertex3f($mx-$s, $my-$s, $mz+$s)
		glVertex3f($mx+$s, $my-$s, $mz+$s)
		glVertex3f($mx+$s, $my+$s, $mz+$s)
		glVertex3f($mx-$s, $my+$s, $mz-$s)
		glVertex3f($mx+$s, $my+$s, $mz-$s)
		glVertex3f($mx+$s, $my-$s, $mz-$s)
		glVertex3f($mx-$s, $my-$s, $mz-$s)
		glVertex3f($mx-$s, $my+$s, $mz-$s)
		glVertex3f($mx-$s, $my+$s, $mz+$s)
		glVertex3f($mx+$s, $my+$s, $mz+$s)
		glVertex3f($mx+$s, $my+$s, $mz-$s)
		glVertex3f($mx-$s, $my-$s, $mz-$s)
		glVertex3f($mx+$s, $my-$s, $mz-$s)
		glVertex3f($mx+$s, $my-$s, $mz+$s)
		glVertex3f($mx-$s, $my-$s, $mz+$s)
		glVertex3f($mx-$s, $my+$s, $mz-$s)
		glVertex3f($mx-$s, $my-$s, $mz-$s)
		glVertex3f($mx-$s, $my-$s, $mz+$s)
		glVertex3f($mx-$s, $my+$s, $mz+$s)
		glVertex3f($mx+$s, $my+$s, $mz+$s)
		glVertex3f($mx+$s, $my-$s, $mz+$s)
		glVertex3f($mx+$s, $my-$s, $mz-$s)
		glVertex3f($mx+$s, $my+$s, $mz-$s)
	glEnd()
EndFunc
