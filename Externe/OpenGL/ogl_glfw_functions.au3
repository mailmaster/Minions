#include-once


; ##############################################################
; /* GLFW initialization, termination and version querying */

Global $glfw_hDLL = -1


; #FUNCTION# ;===============================================================================
;
; Name...........: glfwInit
; Description ...: Initializes GLFW.
; Syntax.........: glfwInit()
; Parameters ....: None
; Return values .: Success - 1
;                  Failure - 0 and set @error
;                  |-1 - Dll load failed
;                  |1 - glfwInit failed
; Author ........: see main UDF
; Remarks .......:
;
; ;==========================================================================================
Func glfwInit()
	If glfw_IsInit() Then Return SetError(0, 0, 1)
	; ---
	$glfw_hDLL = DllOpen("glfw.dll")
	If $glfw_hDLL = -1 Then Return SetError(-1, 0, 0)
	; ---
	Local $ret = DllCall($glfw_hDLL, "int", "glfwInit")
	Return SetError($ret[0] = 0, 0, $ret[0] = 1)
EndFunc

; #FUNCTION# ;===============================================================================
;
; Name...........: glfwTerminate
; Description ...: Terminates GLFW.
; Syntax.........: glfwTerminate()
; Parameters ....: None
; Return values .: Success - 1
;                  Failure - 0 and set @error
;                  |-1 - Not initialized
;                  |Other values - See DllCall help
; Author ........: see main UDF
; Remarks .......:
;
; ;==========================================================================================
Func glfwTerminate()
	If Not glfw_IsInit() Then Return SetError(-1, 0, 0)
	; ---
	Local $err = 0, $ext = 0
	Local $ret = DllCall($glfw_hDLL, "none", "glfwTerminate")
	If @error Then
		$err = @error
		$ext = @extended
	EndIf
	DllClose($glfw_hDLL)
	$glfw_hDLL = -1
	; ---
	glfw_FreeCallbacks()
	; ---
	Return SetError($err, $ext, 1)
EndFunc

; #FUNCTION# ;===============================================================================
;
; Name...........: glfwGetVersion
; Description ...: Return the version of the GLFW library
; Syntax.........: glfwGetVersion(ByRef $iMajor, ByRef $iMinor, ByRef $iRev)
; Parameters ....: $iMajor - Will be filled with the major version number
;                  $iMinor - Will be filled with the minor version number
;                  $iRev - Will be filled with the revision number
; Return values .: Success - 1
;                  Failure - 0 and set @error
;                  |-1 - Not initialized
;                  |Other values - See DllCall help
; Author ........: see main UDF
; Remarks .......:
;
; ;==========================================================================================
Func glfwGetVersion(ByRef $iMajor, ByRef $iMinor, ByRef $iRev)
	If Not glfw_IsInit() Then Return SetError(-1, 0, 0)
	; ---
	Local $ret = DllCall($glfw_hDLL, "none", "glfwGetVersion", "int*", 0, "int*", 0, "int*", 0)
	If @error Then Return SetError(@error, @extended, $ret)
	; ---
	$iMajor = $ret[1]
	$iMinor = $ret[2]
	$iRev = $ret[3]
	; ---
	Return SetError(0, 0, 1)
EndFunc

; ##############################################################
; /* Window handling */

; #FUNCTION# ;===============================================================================
;
; Name...........: glfwOpenWindow
; Description ...: Create a window with an OpenGL display context
; Syntax.........: glfwOpenWindow($iWidth, $iHeight, $iRedbits, $iGreenbits, $iBluebits, $iAlphabits, $iDepthbits, $iStencilbits, $iMode)
; Parameters ....: $iWidth - Width of the window
;                  $iHeight - Height of the window
;                  $iRedbits, $iGreenbits, $iBluebits - Number of bits to use for each color component
;                  $iAlphabits - Number of bits to use for the alpha channel (0 - no alpha channel)
;                  $iDepthbits - Number of bits to use for the depth buffer
;                  $oStencilbits - Number of bits to use for the stencil buffer
;                  $iMode - $GLFW_WINDOW or $GLFW_FULLSCREEN
; Return values .: Success - 1
;                  Failure - 0 and set @error
;                  |-1 - Not initialized
;                  |Other values - See DllCall help
; Author ........: see main UDF
; Remarks .......:
;
; ;==========================================================================================
Func glfwOpenWindow($iWidth, $iHeight, $iRedbits, $iGreenbits, $iBluebits, $iAlphabits, $iDepthbits, $iStencilbits, $iMode)
	If Not glfw_IsInit() Then Return SetError(-1, 0, 0)
	; ---
	Local $ret = DllCall($glfw_hDLL, "int", "glfwOpenWindow", "int", $iWidth, "int", $iHeight, _
												"int", $iRedbits, "int", $iGreenbits, "int", $iBluebits, "int", $iAlphabits, _
												"int", $iDepthbits, "int", $iStencilbits, _
												"int", $iMode)
	If @error Then Return SetError(@error, @extended, $ret)
	; ---
	Return SetError($ret[0] <> 1, 0, $ret[0] = 1)
EndFunc

; #FUNCTION# ;===============================================================================
;
; Name...........: glfwOpenWindowHint
; Description ...: Set additional properties for a window to be opened. Must be called befor glfwOpenWindow
; Syntax.........: glfwOpenWindowHint($iTarget, $iHint)
; Parameters ....: $iTarger - Any of the following tokens (default value):
;                  |$GLFW_REFRESH_RATE (0)
;                  |$GLFW_ACCUM_RED_BITS (0)
;                  |$GLFW_ACCUM_GREEN_BITS (0)
;                  |$GLFW_ACCUM_BLUE_BITS (0)
;                  |$GLFW_ACCUM_ALPHA_BITS (0)
;                  |$GLFW_AUX_BUFFERS (0)
;                  |$GLFW_STEREO (0)
;                  |$GLFW_WINDOW_NO_RESIZE (0)
;                  |$GLFW_FSAA_SAMPLES (0)
;                  |$GLFW_OPENGL_VERSION_MAJOR (1)
;                  |$GLFW_OPENGL_VERSION_MINOR (1)
;                  |$GLFW_OPENGL_FORWARD_COMPAT (0)
;                  |$GLFW_OPENGL_DEBUG_CONTEXT (0)
;                  |$GLFW_OPENGL_PROFILE (0)
;                  $iHint - Value to assign to the token specified in $iTarget
; Return values .: Success - 1
;                  Failure - 0 and set @error
;                  |-1 - Not initialized
;                  |Other values - See DllCall help
; Author ........: see main UDF
; Remarks .......:
;
; ;==========================================================================================
Func glfwOpenWindowHint($iTarget, $iHint)
	If Not glfw_IsInit() Then Return SetError(-1, 0, 0)
	; ---
	Local $ret = DllCall($glfw_hDLL, "none", "glfwOpenWindowHint", "int", $iTarget, "int", $iHint)
	If @error Then Return SetError(@error, @extended, $ret)
	; ---
	Return SetError(0, 0, 1)
EndFunc

; #FUNCTION# ;===============================================================================
;
; Name...........: glfwCloseWindow
; Description ...: Close an open window and destroy the OpenGL context
; Syntax.........: glfwCloseWindow()
; Parameters ....: None
; Return values .: Success - 1
;                  Failure - 0 and set @error
;                  |-1 - Not initialized
;                  |Other values - See DllCall help
; Author ........: see main UDF
; Remarks .......:
;
; ;==========================================================================================
Func glfwCloseWindow()
	If Not glfw_IsInit() Then Return SetError(-1, 0, 0)
	; ---
	Local $ret = DllCall($glfw_hDLL, "none", "glfwCloseWindow")
	If @error Then Return SetError(@error, @extended, $ret)
	; ---
	Return SetError(0, 0, 1)
EndFunc

; #FUNCTION# ;===============================================================================
;
; Name...........: glfwSetWindowTitle
; Description ...: Set the title of the opened window
; Syntax.........: glfwSetWindowTitle($sTitle)
; Parameters ....: $sTitle - New title
; Return values .: Success - 1
;                  Failure - 0 and set @error
;                  |-1 - Not initialized
;                  |Other values - See DllCall help
; Author ........: see main UDF
; Remarks .......:
;
; ;==========================================================================================
Func glfwSetWindowTitle($sTitle)
	If Not glfw_IsInit() Then Return SetError(-1, 0, 0)
	; ---
	Local $ret = DllCall($glfw_hDLL, "none", "glfwSetWindowTitle", "str", $sTitle)
	If @error Then Return SetError(@error, @extended, $ret)
	; ---
	Return SetError(0, 0, 1)
EndFunc

; #FUNCTION# ;===============================================================================
;
; Name...........: glfwGetWindowSize
; Description ...: Get the dimensions of the window (Client area)
; Syntax.........: glfwGetWindowSize(ByRef $iWidth, ByRef $iHeight)
; Parameters ....: $iWidth - Will contain the width of the window
;                  $iHeight - Will contain the height of the window
; Return values .: Success - 1
;                  Failure - 0 and set @error
;                  |-1 - Not initialized
;                  |Other values - See DllCall help
; Author ........: see main UDF
; Remarks .......:
;
; ;==========================================================================================
Func glfwGetWindowSize(ByRef $iWidth, ByRef $iHeight)
	If Not glfw_IsInit() Then Return SetError(-1, 0, 0)
	; ---
	Local $ret = DllCall($glfw_hDLL, "none", "glfwGetWindowSize", "int*", 0, "int*", 0)
	If @error Then Return SetError(@error, @extended, $ret)
	; ---
	$iWidth = $ret[1]
	$iHeight = $ret[2]
	; ---
	Return SetError(0, 0, 1)
EndFunc

; #FUNCTION# ;===============================================================================
;
; Name...........: glfwSetWindowSize
; Description ...: Set the window's dimensions (Client area)
; Syntax.........: glfwSetWindowSize($iWidth, $iHeight)
; Parameters ....: $iWidth - Width of the window
;                  $iHeight - Height of the window
; Return values .: Success - 1
;                  Failure - 0 and set @error
;                  |-1 - Not initialized
;                  |Other values - See DllCall help
; Author ........: see main UDF
; Remarks .......:
;
; ;==========================================================================================
Func glfwSetWindowSize($iWidth, $iHeight)
	If Not glfw_IsInit() Then Return SetError(-1, 0, 0)
	; ---
	Local $ret = DllCall($glfw_hDLL, "none", "glfwSetWindowSize", "int", $iWidth, "int", $iHeight)
	If @error Then Return SetError(@error, @extended, $ret)
	; ---
	Return SetError(0, 0, 1)
EndFunc

; #FUNCTION# ;===============================================================================
;
; Name...........: glfwSetWindowPos
; Description ...: Set the position of the window
; Syntax.........: glfwSetWindowPos($iX, $iY)
; Parameters ....: $iX - Horizontal position according to the upper left corner of the desktop
;                  $iY - Vertical position according to the upper left corner of the desktop
; Return values .: Success - 1
;                  Failure - 0 and set @error
;                  |-1 - Not initialized
;                  |Other values - See DllCall help
; Author ........: see main UDF
; Remarks .......: No effect when in fullscreen mode
;
; ;==========================================================================================
Func glfwSetWindowPos($iX, $iY)
	If Not glfw_IsInit() Then Return SetError(-1, 0, 0)
	; ---
	Local $ret = DllCall($glfw_hDLL, "none", "glfwSetWindowPos", "int", $iX, "int", $iY)
	If @error Then Return SetError(@error, @extended, $ret)
	; ---
	Return SetError(0, 0, 1)
EndFunc

; #FUNCTION# ;===============================================================================
;
; Name...........: glfwIconifyWindow
; Description ...: Iconify the window
; Syntax.........: glfwIconifyWindow()
; Parameters ....: None
; Return values .: Success - 1
;                  Failure - 0 and set @error
;                  |-1 - Not initialized
;                  |Other values - See DllCall help
; Author ........: see main UDF
; Remarks .......: In fullscreen mode, the desktop video mode will be restored
;
; ;==========================================================================================
Func glfwIconifyWindow()
	If Not glfw_IsInit() Then Return SetError(-1, 0, 0)
	; ---
	Local $ret = DllCall($glfw_hDLL, "none", "glfwIconifyWindow")
	If @error Then Return SetError(@error, @extended, $ret)
	; ---
	Return SetError(0, 0, 1)
EndFunc

; #FUNCTION# ;===============================================================================
;
; Name...........: glfwRestoreWindow
; Description ...: Restor an iconified window
; Syntax.........: glfwRestoreWindow()
; Parameters ....: None
; Return values .: Success - 1
;                  Failure - 0 and set @error
;                  |-1 - Not initialized
;                  |Other values - See DllCall help
; Author ........: see main UDF
; Remarks .......: In fullscreen mode, the fullscreen video mode will be restored
;
; ;==========================================================================================
Func glfwRestoreWindow()
	If Not glfw_IsInit() Then Return SetError(-1, 0, 0)
	; ---
	Local $ret = DllCall($glfw_hDLL, "none", "glfwRestoreWindow")
	If @error Then Return SetError(@error, @extended, $ret)
	; ---
	Return SetError(0, 0, 1)
EndFunc

; #FUNCTION# ;===============================================================================
;
; Name...........: glfwSwapBuffers
; Description ...: Swap the back and front color buffer of the window
; Syntax.........: glfwSwapBuffers()
; Parameters ....: None
; Return values .: Success - 1
;                  Failure - 0 and set @error
;                  |-1 - Not initialized
;                  |Other values - See DllCall help
; Author ........: see main UDF
; Remarks .......: If $GLFW_AUTO_POLL_EVENTS is enabled (default), glfwPollEvents
;                  +is called after swapping the front and back buffers
;
; ;==========================================================================================
Func glfwSwapBuffers()
	If Not glfw_IsInit() Then Return SetError(-1, 0, 0)
	; ---
	Local $ret = DllCall($glfw_hDLL, "none", "glfwSwapBuffers")
	If @error Then Return SetError(@error, @extended, $ret)
	; ---
	Return SetError(0, 0, 1)
EndFunc

; #FUNCTION# ;===============================================================================
;
; Name...........: glfwSwapInterval
; Description ...: Adjust vertical sync.
; Syntax.........: glfwSwapInterval($iInterval)
; Parameters ....: $iInterval - Minimum number of monitor vertical retraces between each buffer swap performed by glfwSwapBuffers
; Return values .: Success - 1
;                  Failure - 0 and set @error
;                  |-1 - Not initialized
;                  |Other values - See DllCall help
; Author ........: see main UDF
; Remarks .......: 0 - Vertical Sync. OFF, 1 - Vertical Sync. ON
;                  |Other values: for example 2, will limite the FPS to 1/2 screen's vertical refresh rate (60hz -> 30fps)
;
; ;==========================================================================================
Func glfwSwapInterval($iInterval)
	If Not glfw_IsInit() Then Return SetError(-1, 0, 0)
	; ---
	Local $ret = DllCall($glfw_hDLL, "none", "glfwSwapInterval", "int", $iInterval)
	If @error Then Return SetError(@error, @extended, $ret)
	; ---
	Return SetError(0, 0, 1)
EndFunc

; #FUNCTION# ;===============================================================================
;
; Name...........: glfwGetWindowParam
; Description ...: Function used for acquiring various properties of an opened window
; Syntax.........: glfwGetWindowParam($iParam)
; Parameters ....: $iParam - A token selecting which parameter the function should return:
;                  |$GLFW_OPENED					1 if window is opened, else 0.
;                  |$GLFW_ACTIVE					1 if window has focus, else 0.
;                  |$GLFW_ICONIFIED					1 if window is iconified, else 0.
;                  |$GLFW_ACCELERATED				1 if window is hardware accelerated, else 0.
;                  |$GLFW_RED_BITS					Number of bits for the red color component.
;                  |$GLFW_GREEN_BITS				Number of bits for the green color component.
;                  |$GLFW_BLUE_BITS					Number of bits for the blue color component.
;                  |$GLFW_ALPHA_BITS				Number of bits for the alpha buffer.
;                  |$GLFW_DEPTH_BITS				Number of bits for the depth buffer.
;                  |$GLFW_STENCIL_BITS				Number of bits for the stencil buffer.
;                  |$GLFW_REFRESH_RATE				Vertical monitor refresh rate in Hz. Zero indicates an unknown or a default refresh rate.
;                  |$GLFW_ACCUM_RED_BITS			Number of bits for the red channel of the accumulation buffer.
;                  |$GLFW_ACCUM_GREEN_BITS			Number of bits for the green channel of the accumulation buffer.
;                  |$GLFW_ACCUM_BLUE_BITS			Number of bits for the blue channel of the accumulation buffer.
;                  |$GLFW_ACCUM_ALPHA_BITS			Number of bits for the alpha channel of the accumulation buffer.
;                  |$GLFW_AUX_BUFFERS				Number of auxiliary buffers.
;                  |$GLFW_STEREO					1 if stereo rendering is supported, else GL_FALSE.
;                  |$GLFW_WINDOW_NO_RESIZE			1 if the window cannot be resized by the user, else 0.
;                  |$GLFW_FSAA_SAMPLES				Number of multisampling buffer samples. Zero indicated multisampling is disabled.
;                  |$GLFW_OPENGL_VERSION_MAJOR		Major number of the actual version of the context.
;                  |$GLFW_OPENGL_VERSION_MINOR		Minor number of the actual version of the context.
;                  |$GLFW_OPENGL_FORWARD_COMPAT		1 if the context is forward-compatible, else 0.
;                  |$GLFW_OPENGL_DEBUG_CONTEXT		1 if the context is a debug context.
;                  |$GLFW_OPENGL_PROFILE			The profile implemented by the context, or zero.
; Return values .: Success - Value of the selected parameter
;                  Failure - 0 and set @error
;                  |-1 - Not initialized
;                  |Other values - See DllCall help
; Author ........: see main UDF
; Remarks .......:
;
; ;==========================================================================================
Func glfwGetWindowParam($iParam)
	If Not glfw_IsInit() Then Return SetError(-1, 0, 0)
	; ---
	Local $ret = DllCall($glfw_hDLL, "int", "glfwGetWindowParam", "int", $iParam)
	If @error Then Return SetError(@error, @extended, $ret)
	; ---
	Return SetError(0, 0, $ret[0])
EndFunc

; #FUNCTION# ;===============================================================================
;
; Name...........: glfwSetWindowSizeCallback
; Description ...: Set a window resize event callback function
; Syntax.........: glfwSetWindowSizeCallback($sFunction)
; Parameters ....: $sFunction - Name of a function to use as callback. Or "" to unset the callback
; Return values .: Success - 1
;                  Failure - 0 and set @error
;                  |-1 - Not initialized
;                  |Other values - See DllCall help
; Author ........: see main UDF
; Remarks .......: Callback function prototype: func_name($iWidth, $iHeight)
;
; ;==========================================================================================
Func glfwSetWindowSizeCallback($sFunction)
	If Not glfw_IsInit() Then Return SetError(-1, 0, 0)
	; ---
	Return SetError(@error, @extended, glfw_SetCallback($glfw_cb_WinSize, "glfwSetWindowSizeCallback", $sFunction))
EndFunc

; #FUNCTION# ;===============================================================================
;
; Name...........: glfwSetWindowCloseCallback
; Description ...: Set a window close event callback function
; Syntax.........: glfwSetWindowCloseCallback($sFunction)
; Parameters ....: $sFunction - Name of a function to use as callback. Or "" to unset the callback
; Return values .: Success - 1
;                  Failure - 0 and set @error
;                  |-1 - Not initialized
;                  |Other values - See DllCall help
; Author ........: see main UDF
; Remarks .......: Callback function prototype: func_name()
;                  |If the callback function returns 1 -> The window will be closed
;                  |If the callback function returns 0 -> The window will not be closed
;
; ;==========================================================================================
Func glfwSetWindowCloseCallback($sFunction)
	If Not glfw_IsInit() Then Return SetError(-1, 0, 0)
	; ---
	Return SetError(@error, @extended, glfw_SetCallback($glfw_cb_Close, "glfwSetWindowCloseCallback", $sFunction))
EndFunc

; #FUNCTION# ;===============================================================================
;
; Name...........: glfwSetWindowRefreshCallback
; Description ...: Set a callback function that will be called when the window client area need to be refreshed
; Syntax.........: glfwSetWindowRefreshCallback($sFunction)
; Parameters ....: $sFunction - Name of a function to use as callback. Or "" to unset the callback
; Return values .: Success - 1
;                  Failure - 0 and set @error
;                  |-1 - Not initialized
;                  |Other values - See DllCall help
; Author ........: see main UDF
; Remarks .......: Callback function prototype: func_name()
;
; ;==========================================================================================
Func glfwSetWindowRefreshCallback($sFunction)
	If Not glfw_IsInit() Then Return SetError(-1, 0, 0)
	; ---
	Return SetError(@error, @extended, glfw_SetCallback($glfw_cb_Refresh, "glfwSetWindowRefreshCallback", $sFunction))
EndFunc

; ##############################################################
; /* Video mode functions */

; #FUNCTION# ;===============================================================================
;
; Name...........: glfwGetVideoModes
; Description ...: Return an array of valid video modes for your hardware
; Syntax.........: glfwGetVideoModes($iMaxCount)
; Parameters ....: $iMaxCount - Maximum number of video modes to return
; Return values .: Success - Array containing the video modes:
;                  |$array[0][0] = Number of video modes
;                  |$array[x][0] = Screen resolution (width)
;                  |$array[x][1] = Screen resolution (height)
;                  |$array[x][2] = Red Bits
;                  |$array[x][3] = Green Bits
;                  |$array[x][4] = Blue Bits
;                  Failure - 0 and set @error
;                  |-1 - Not initialized
;                  |Other values - See DllCall help
; Author ........: see main UDF
; Remarks .......:
;
; ;==========================================================================================
Func glfwGetVideoModes($iMaxCount)
	If Not glfw_IsInit() Then Return SetError(-1, 0, 0)
	; ---
	Local $str = ""
	For $i = 1 To $iMaxCount
		$str &= "STRUCT;" & $tagGLFWvidmode & ";ENDSTRUCT;"
	Next
	Local $struct = DllStructCreate($str)
	; ---
	Local $ret = DllCall($glfw_hDLL, "int", "glfwGetVideoModes", "ptr", DllStructGetPtr($struct), "int", $iMaxCount)
	If @error Then Return SetError(@error, @extended, $ret)
	; ---
	Local $aModes[$iMaxCount + 1][5]
	$aModes[0][0] = $iMaxCount
	; ---
	Local $iId = 1
	For $i = 1 To 5 * $iMaxCount Step + 5
		$aModes[$iId][0] = DllStructGetData($struct, $i)
		$aModes[$iId][1] = DllStructGetData($struct, $i + 1)
		$aModes[$iId][2] = DllStructGetData($struct, $i + 2)
		$aModes[$iId][3] = DllStructGetData($struct, $i + 3)
		$aModes[$iId][4] = DllStructGetData($struct, $i + 4)
		$iId += 1
	Next
	; ---
	Return $aModes
EndFunc

; #FUNCTION# ;===============================================================================
;
; Name...........: glfwGetDesktopMode
; Description ...: Return the desktop video mode
; Syntax.........: glfwGetDesktopMode()
; Parameters ....: None
; Return values .: Success - Array containing the current desktop mode:
;                  |$array[0] = Screen resolution (width)
;                  |$array[1] = Screen resolution (height)
;                  |$array[2] = Red Bits
;                  |$array[3] = Green Bits
;                  |$array[4] = Blue Bits
;                  Failure - 0 and set @error
;                  |-1 - Not initialized
;                  |Other values - See DllCall help
; Author ........: see main UDF
; Remarks .......:
;
; ;==========================================================================================
Func glfwGetDesktopMode()
	If Not glfw_IsInit() Then Return SetError(-1, 0, 0)
	; ---
	Local $struct = DllStructCreate($tagGLFWvidmode)
	Local $ret = DllCall($glfw_hDLL, "none", "glfwGetDesktopMode", "ptr", DllStructGetPtr($struct))
	If @error Then Return SetError(@error, @extended, $ret)
	; ---
	Local $aMode[5]
	For $i = 0 To 4
		$aMode[$i] = DllStructGetData($struct, $i + 1)
	Next
	Return $aMode
EndFunc

; ##############################################################
; /* Input handling */

; #FUNCTION# ;===============================================================================
;
; Name...........: glfwPollEvents
; Description ...: Poll events, all window, keyboard and mouse stats are updated, and any registered callback function is called
; Syntax.........: glfwPollEvents()
; Parameters ....: None
; Return values .: Success - 1
;                  Failure - 0 and set @error
;                  |-1 - Not initialized
;                  |Other values - See DllCall help
; Author ........: see main UDF
; Remarks .......: This function is called implicitly from glfwSwapBuffers if GLFW_AUTO_POLL_EVENTS is
;                  enabled (as it is by default). Thus, if glfwSwapBuffers is called frequently, which is normally the case,
;                  there is no need to call glfwPollEvents.
;
; ;==========================================================================================
Func glfwPollEvents()
	If Not glfw_IsInit() Then Return SetError(-1, 0, 0)
	; ---
	Local $ret = DllCall($glfw_hDLL, "none", "glfwPollEvents")
	If @error Then Return SetError(@error, @extended, $ret)
	; ---
	Return SetError(0, 0, 1)
EndFunc

; #FUNCTION# ;===============================================================================
;
; Name...........: glfwWaitEvents
; Description ...: Wait for an event to occure
; Syntax.........: glfwWaitEvents()
; Parameters ....: None
; Return values .: Success - 1
;                  Failure - 0 and set @error
;                  |-1 - Not initialized
;                  |Other values - See DllCall help
; Author ........: see main UDF
; Remarks .......:
;
; ;==========================================================================================
Func glfwWaitEvents()
	If Not glfw_IsInit() Then Return SetError(-1, 0, 0)
	; ---
	Local $ret = DllCall($glfw_hDLL, "none", "glfwWaitEvents")
	If @error Then Return SetError(@error, @extended, $ret)
	; ---
	Return SetError(0, 0, 1)
EndFunc

; #FUNCTION# ;===============================================================================
;
; Name...........: glfwGetKey
; Description ...: Querie the current state of a specific keyboard key
; Syntax.........: glfwGetKey($iKey)
; Parameters ....: $iKey - An uppercase printable ISO 8859-1 (Latin 1) character (Chr('A'), Chr('.')...)
;                  or a special key identifier ($GLFW_KEY_...)
; Return values .: Success - Either $GLFW_PRESS (1) or $GLFW_RELEASE (0)
;                  Failure - 0 and set @error
;                  |-1 - Not initialized
;                  |Other values - See DllCall help
; Author ........: see main UDF
; Remarks .......:
;
; ;==========================================================================================
Func glfwGetKey($iKey)
	If Not glfw_IsInit() Then Return SetError(-1, 0, 0)
	; ---
	Local $ret = DllCall($glfw_hDLL, "int", "glfwGetKey", "int", $iKey)
	If @error Then Return SetError(@error, @extended, $ret)
	; ---
	Return SetError(0, 0, $ret[0])
EndFunc

; #FUNCTION# ;===============================================================================
;
; Name...........: glfwGetMouseButton
; Description ...: Querie the current state of a specific mouse button
; Syntax.........: glfwGetMouseButton($iButton)
; Parameters ....: $iButton - Mouse button identifier ($GLFW_MOUSE_BUTTON_...)
; Return values .: Success - Either $GLFW_PRESS (1) or $GLFW_RELEASE (0)
;                  Failure - 0 and set @error
;                  |-1 - Not initialized
;                  |Other values - See DllCall help
; Author ........: see main UDF
; Remarks .......:
;
; ;==========================================================================================
Func glfwGetMouseButton($iButton)
	If Not glfw_IsInit() Then Return SetError(-1, 0, 0)
	; ---
	Local $ret = DllCall($glfw_hDLL, "int", "glfwGetMouseButton", "int", $iButton)
	If @error Then Return SetError(@error, @extended, $ret)
	; ---
	Return SetError(0, 0, $ret[0])
EndFunc

; #FUNCTION# ;===============================================================================
;
; Name...........: glfwGetMousePos
; Description ...: Return the current mouse position
; Syntax.........: glfwGetMousePos(ByRef $iXpos, ByRef $iYpos)
; Parameters ....: $iXpos, $iYpos - Will contain the mouse position (x, y)
; Return values .: Success - 1
;                  Failure - 0 and set @error
;                  |-1 - Not initialized
;                  |Other values - See DllCall help
; Author ........: see main UDF
; Remarks .......:
;
; ;==========================================================================================
Func glfwGetMousePos(ByRef $iXpos, ByRef $iYpos)
	If Not glfw_IsInit() Then Return SetError(-1, 0, 0)
	; ---
	Local $ret = DllCall($glfw_hDLL, "none", "glfwGetMousePos", "int*", 0, "int*", 0)
	If @error Then Return SetError(@error, @extended, $ret)
	; ---
	$iXpos = $ret[1]
	$iYpos = $ret[2]
	; ---
	Return SetError(0, 0, 1)
EndFunc

; #FUNCTION# ;===============================================================================
;
; Name...........: glfwSetMousePos
; Description ...: Set the mouse position
; Syntax.........: glfwSetMousePos($iXpos, $iYpos)
; Parameters ....: $iXpos, $iYpos - The new mouse position (x, y)
; Return values .: Success - 1
;                  Failure - 0 and set @error
;                  |-1 - Not initialized
;                  |Other values - See DllCall help
; Author ........: see main UDF
; Remarks .......:
;
; ;==========================================================================================
Func glfwSetMousePos($iXpos, $iYpos)
	If Not glfw_IsInit() Then Return SetError(-1, 0, 0)
	; ---
	Local $ret = DllCall($glfw_hDLL, "none", "glfwSetMousePos", "int", $iXpos, "int", $iYpos)
	If @error Then Return SetError(@error, @extended, $ret)
	; ---
	Return SetError(0, 0, 1)
EndFunc

; #FUNCTION# ;===============================================================================
;
; Name...........: glfwGetMouseWheel
; Description ...: Return the current mouse wheel position
; Syntax.........: glfwGetMouseWheel()
; Parameters ....: None
; Return values .: Success - Mouse wheel position
;                  Failure - 0 and set @error
;                  |-1 - Not initialized
;                  |Other values - See DllCall help
; Author ........: see main UDF
; Remarks .......: glfwPollEvents, glfwWaitEvents or glfwSwapBuffers(with GLFW_AUTO_POLL_EVENTS enabled)
;                  must be called before any mouse wheel movements are recorded and reported by glfwGetMouseWheel
;
; ;==========================================================================================
Func glfwGetMouseWheel()
	If Not glfw_IsInit() Then Return SetError(-1, 0, 0)
	; ---
	Local $ret = DllCall($glfw_hDLL, "int", "glfwGetMouseWheel")
	If @error Then Return SetError(@error, @extended, $ret)
	; ---
	Return SetError(0, 0, $ret[0])
EndFunc

; #FUNCTION# ;===============================================================================
;
; Name...........: glfwSetMouseWheel
; Description ...: Set the position of the mouse wheel
; Syntax.........: glfwSetMouseWheel($iPos)
; Parameters ....: $iPos - New mouse wheel position
; Return values .: Success - 1
;                  Failure - 0 and set @error
;                  |-1 - Not initialized
;                  |Other values - See DllCall help
; Author ........: see main UDF
; Remarks .......:
;
; ;==========================================================================================
Func glfwSetMouseWheel($iPos)
	If Not glfw_IsInit() Then Return SetError(-1, 0, 0)
	; ---
	Local $ret = DllCall($glfw_hDLL, "none", "glfwSetMouseWheel", "int", $iPos)
	If @error Then Return SetError(@error, @extended, $ret)
	; ---
	Return SetError(0, 0, 1)
EndFunc

; #FUNCTION# ;===============================================================================
;
; Name...........: glfwSetKeyCallback
; Description ...: Set a callback function for key (Press/Release) events
; Syntax.........: glfwSetKeyCallback($sFunction)
; Parameters ....: $sFunction - Name of a function to use as callback. Or "" to unset the callback
; Return values .: Success - 1
;                  Failure - 0 and set @error
;                  |-1 - Not initialized
;                  |Other values - See DllCall help
; Author ........: see main UDF
; Remarks .......: Callback function prototype: func_name($iKey, $iAction)
;                  |$iKey - Key identifier (see glfwGetKey)
;                  |$iAction - $GLFW_PRESS (1) or $GLFW_RELEASE (0)
;
; ;==========================================================================================
Func glfwSetKeyCallback($sFunction)
	If Not glfw_IsInit() Then Return SetError(-1, 0, 0)
	; ---
	Return SetError(@error, @extended, glfw_SetCallback($glfw_cb_Key, "glfwSetKeyCallback", $sFunction))
EndFunc

; #FUNCTION# ;===============================================================================
;
; Name...........: glfwSetCharCallback
; Description ...: Set a callback function that will be called every time a printable caracter is generated by the keyboard
; Syntax.........: glfwSetCharCallback($sFunction)
; Parameters ....: $sFunction - Name of a function to use as callback. Or "" to unset the callback
; Return values .: Success - 1
;                  Failure - 0 and set @error
;                  |-1 - Not initialized
;                  |Other values - See DllCall help
; Author ........: see main UDF
; Remarks .......: Callback function prototype: func_name($iCharacter, $iAction)
;                  |$iCharacter - Unicode caracter
;                  |$iAction - $GLFW_PRESS (1) or $GLFW_RELEASE (0)
;
; ;==========================================================================================
Func glfwSetCharCallback($sFunction)
	If Not glfw_IsInit() Then Return SetError(-1, 0, 0)
	; ---
	Return SetError(@error, @extended, glfw_SetCallback($glfw_cb_Char, "glfwSetCharCallback", $sFunction))
EndFunc

; #FUNCTION# ;===============================================================================
;
; Name...........: glfwSetMouseButtonCallback
; Description ...: Set a callback function for mouse button (Press/Release) events
; Syntax.........: glfwSetMouseButtonCallback($sFunction)
; Parameters ....: $sFunction - Name of a function to use as callback. Or "" to unset the callback
; Return values .: Success - 1
;                  Failure - 0 and set @error
;                  |-1 - Not initialized
;                  |Other values - See DllCall help
; Author ........: see main UDF
; Remarks .......: Callback function prototype: func_name($iButton, $iAction)
;                  |$iButton - Mouse button identifier
;                  |$iAction - $GLFW_PRESS (1) or $GLFW_RELEASE (0)
;
; ;==========================================================================================
Func glfwSetMouseButtonCallback($sFunction)
	If Not glfw_IsInit() Then Return SetError(-1, 0, 0)
	; ---
	Return SetError(@error, @extended, glfw_SetCallback($glfw_cb_Button, "glfwSetMouseButtonCallback", $sFunction))
EndFunc

; #FUNCTION# ;===============================================================================
;
; Name...........: glfwSetMousePosCallback
; Description ...: Set a callback function for mouse motion (position) events
; Syntax.........: glfwSetMousePosCallback($sFunction)
; Parameters ....: $sFunction - Name of a function to use as callback. Or "" to unset the callback
; Return values .: Success - 1
;                  Failure - 0 and set @error
;                  |-1 - Not initialized
;                  |Other values - See DllCall help
; Author ........: see main UDF
; Remarks .......: Callback function prototype: func_name($iX, $iY)
;
; ;==========================================================================================
Func glfwSetMousePosCallback($sFunction)
	If Not glfw_IsInit() Then Return SetError(-1, 0, 0)
	; ---
	Return SetError(@error, @extended, glfw_SetCallback($glfw_cb_Pos, "glfwSetMousePosCallback", $sFunction))
EndFunc

; #FUNCTION# ;===============================================================================
;
; Name...........: glfwSetMouseWheelCallback
; Description ...: Set a callback function for mouse wheel events
; Syntax.........: glfwSetMouseWheelCallback($sFunction)
; Parameters ....: $sFunction - Name of a function to use as callback. Or "" to unset the callback
; Return values .: Success - 1
;                  Failure - 0 and set @error
;                  |-1 - Not initialized
;                  |Other values - See DllCall help
; Author ........: see main UDF
; Remarks .......: Callback function prototype: func_name($iPos)
;
; ;==========================================================================================
Func glfwSetMouseWheelCallback($sFunction)
	If Not glfw_IsInit() Then Return SetError(-1, 0, 0)
	; ---
	Return SetError(@error, @extended, glfw_SetCallback($glfw_cb_Wheel, "glfwSetMouseWheelCallback", $sFunction))
EndFunc

; ##############################################################

#cs
/* Joystick input */
GLFWAPI int GLFWAPIENTRY glfwGetJoystickParam( int joy, int param );
GLFWAPI int GLFWAPIENTRY glfwGetJoystickPos( int joy, float *pos, int numaxes );
GLFWAPI int GLFWAPIENTRY glfwGetJoystickButtons( int joy, unsigned char *buttons, int numbuttons );

/* Time */
GLFWAPI double GLFWAPIENTRY glfwGetTime( void );
GLFWAPI void   GLFWAPIENTRY glfwSetTime( double time );
GLFWAPI void   GLFWAPIENTRY glfwSleep( double time );
#ce


; ##############################################################
; /* Extension support */

; #FUNCTION# ;===============================================================================
;
; Name...........: glfwExtensionSupported
; Description ...: Check if an OpenGL extension is supported
; Syntax.........: glfwExtensionSupported($sExtension)
; Parameters ....: $sExtension - The name of an OpenGL extension
; Return values .: Success - 1 if the extension is supported. Otherwise, 0
;                  Failure - 0 and set @error
;                  |-1 - Not initialized
;                  |Other values - See DllCall help
; Author ........: see main UDF
; Remarks .......:
;
; ;==========================================================================================
Func glfwExtensionSupported($sExtension)
	If Not glfw_IsInit() Then Return SetError(-1, 0, 0)
	; ---
	Local $ret = DllCall($glfw_hDLL, "none", "glfwExtensionSupported", "str", $sExtension)
	If @error Then Return SetError(@error, @extended, $ret)
	; ---
	Return SetError(0, 0, $ret[0])
EndFunc

#cs
GLFWAPI void* GLFWAPIENTRY glfwGetProcAddress( const char *procname );
#ce

; #FUNCTION# ;===============================================================================
;
; Name...........: glfwGetGLVersion
; Description ...: Return the version of the currently used OpenGL implementation
; Syntax.........: glfwGetGLVersion(ByRef $iMajor, ByRef $iMinor, ByRef $iRev)
; Parameters ....: $iMajor - Will be filled with the major version number
;                  $iMinor - Will be filled with the minor version number
;                  $iRev - Will be filled with the revision number
; Return values .: Success - 1
;                  Failure - 0 and set @error
;                  |-1 - Not initialized
;                  |Other values - See DllCall help
; Author ........: see main UDF
; Remarks .......:
;
; ;==========================================================================================
Func glfwGetGLVersion(ByRef $iMajor, ByRef $iMinor, ByRef $iRev)
	If Not glfw_IsInit() Then Return SetError(-1, 0, 0)
	; ---
	Local $ret = DllCall($glfw_hDLL, "none", "glfwGetGLVersion", "int*", 0, "int*", 0, "int*", 0)
	If @error Then Return SetError(@error, @extended, $ret)
	; ---
	$iMajor = $ret[1]
	$iMinor = $ret[2]
	$iRev = $ret[3]
	; ---
	Return SetError(0, 0, 1)
EndFunc

#cs
/* Threading support */
GLFWAPI GLFWthread GLFWAPIENTRY glfwCreateThread( GLFWthreadfun fun, void *arg );
GLFWAPI void GLFWAPIENTRY glfwDestroyThread( GLFWthread ID );
GLFWAPI int  GLFWAPIENTRY glfwWaitThread( GLFWthread ID, int waitmode );
GLFWAPI GLFWthread GLFWAPIENTRY glfwGetThreadID( void );

GLFWAPI GLFWmutex GLFWAPIENTRY glfwCreateMutex( void );
GLFWAPI void GLFWAPIENTRY glfwDestroyMutex( GLFWmutex mutex );
GLFWAPI void GLFWAPIENTRY glfwLockMutex( GLFWmutex mutex );
GLFWAPI void GLFWAPIENTRY glfwUnlockMutex( GLFWmutex mutex );
GLFWAPI GLFWcond GLFWAPIENTRY glfwCreateCond( void );
GLFWAPI void GLFWAPIENTRY glfwDestroyCond( GLFWcond cond );
GLFWAPI void GLFWAPIENTRY glfwWaitCond( GLFWcond cond, GLFWmutex mutex, double timeout );
GLFWAPI void GLFWAPIENTRY glfwSignalCond( GLFWcond cond );
GLFWAPI void GLFWAPIENTRY glfwBroadcastCond( GLFWcond cond );
GLFWAPI int  GLFWAPIENTRY glfwGetNumberOfProcessors( void );
#ce

; ##############################################################
; /* Enable/disable functions */

; #FUNCTION# ;===============================================================================
;
; Name...........: glfwEnable / glfwDisable
; Description ...: Enable/disable certain featurs
; Syntax.........: glfwEnable($iToken) / glfwDisable($iToken)
; Parameters ....: $iToken - A value specifying the feature (with default status):
;                  |$GLFW_AUTO_POLL_EVENTS		Automatic event polling when glfwSwapBuffersis called (Enable)
;                  |$GLFW_KEY_REPEAT			Keyboard key repeat (Disable)
;                  |$GLFW_MOUSE_CURSOR			Mouse cursor visibility (Enable in windowed mode, disable in fullscreen mode)
;                  |$GLFW_STICKY_KEYS			Keyboard key "stickiness" (Disable)
;                  |$GLFW_STICKY_MOUSE_BUTTONS	Mouse button "stickiness" (Disable)
;                  |$GLFW_SYSTEM_KEYS			Special system key actions (Enable)
; Return values .: Success - 1
;                  Failure - 0 and set @error
;                  |-1 - Not initialized
;                  |Other values - See DllCall help
; Author ........: see main UDF
; Remarks .......: For description of each feature, see the official GLFW documentation
;
; ;==========================================================================================
Func glfwEnable($iToken)
	If Not glfw_IsInit() Then Return SetError(-1, 0, 0)
	; ---
	Local $ret = DllCall($glfw_hDLL, "none", "glfwEnable", "int", $iToken)
	If @error Then Return SetError(@error, @extended, $ret)
	; ---
	Return SetError(0, 0, 1)
EndFunc

Func glfwDisable($iToken)
	If Not glfw_IsInit() Then Return SetError(-1, 0, 0)
	; ---
	Local $ret = DllCall($glfw_hDLL, "none", "glfwDisable", "int", $iToken)
	If @error Then Return SetError(@error, @extended, $ret)
	; ---
	Return SetError(0, 0, 1)
EndFunc

; ##############################################################
; /* Image/texture I/O support */

#cs
; #FUNCTION# ;===============================================================================
;
; Name...........: glfwReadImage
; Description ...: Read an image file and store image info and data in a GLFWimage structure
; Syntax.........: glfwReadImage($sName, $iFlags)
; Parameters ....: $sName - File name
;                  $iFlags - Flags controling the image load process:
;                  |$GLFW_BUILD_MIPMAPS_BIT		Automatically build and upload all mipmap levels
;                  |$GLFW_ORIGIN_UL_BIT			Specifies that the origin of theloaded image should be in
;+												the upper left corner (default is the lower left corner)
;                  |$GLFW_ALPHA_MAP_BIT			Treat single component images as alpha maps rather than
;+												luminance maps
; Return values .: Success - Pointer to an GLFWimage structure
;                  Failure - 0 and set @error
;                  |-1 - Not initialized
;                  |Other values - See DllCall help
; Author ........: see main UDF
; Remarks .......: Every image loaded should be freed with glfwFreeImage
;
; ;==========================================================================================
Func glfwReadImage($sName, $iFlags)
	If Not glfw_IsInit() Then Return SetError(-1, 0, 0)
	; ---
	Local $struct = DllStructCreate($tagGLFWimage)
	Local $ret = DllCall($glfw_hDLL, "int", "glfwReadImage", "str", $sName, "ptr", DllStructGetPtr($struct), "int", $iFlags)
	If @error Then Return SetError(@error, @extended, $ret)
	; ---
	Return SetError(0, 0, $ret[2])
EndFunc

#cs
GLFWAPI int  GLFWAPIENTRY glfwReadMemoryImage( const void *data, long size, GLFWimage *img, int flags );
#ce

; #FUNCTION# ;===============================================================================
;
; Name...........: glfwFreeImage
; Description ...: Free the memory occupied by and GLFWimage structure
; Syntax.........: glfwFreeImage($pImg)
; Parameters ....: $pImg - Pointer to an GLFWimage structure (returned by glfwReadImage)
; Return values .: Success - 1
;                  Failure - 0 and set @error
;                  |-1 - Not initialized
;                  |Other values - See DllCall help
; Author ........: see main UDF
; Remarks .......: Every image loaded with glfwReadImage should be freed with this function
;
; ;==========================================================================================
Func glfwFreeImage($pImg)
	If Not glfw_IsInit() Then Return SetError(-1, 0, 0)
	; ---
	Local $ret = DllCall($glfw_hDLL, "int", "glfwFreeImage", "ptr", $pImg)
	If @error Then Return SetError(@error, @extended, $ret)
	; ---
	Return SetError(0, 0, 1)
EndFunc
#ce

; #FUNCTION# ;===============================================================================
;
; Name...........: glfwLoadTexture2D
; Description ...: Upload an image file to the currently OpenGL binded 2D Texture
; Syntax.........: glfwLoadTexture2D($sName, $iFlags)
; Parameters ....: $sName - File name
;                  $iFlags - Flags controling the image load process:
;                  |$GLFW_BUILD_MIPMAPS_BIT		Automatically build and upload all mipmap levels
;                  |$GLFW_ORIGIN_UL_BIT			Specifies that the origin of theloaded image should be in
;+												the upper left corner (default is the lower left corner)
;                  |$GLFW_ALPHA_MAP_BIT			Treat single component images as alpha maps rather than
;+												luminance maps
; Return values .: Success - 1
;                  Failure - 0 and set @error
;                  |-1 - Not initialized
;                  |Other values - See DllCall help
; Author ........: see main UDF
; Remarks .......:
;
; ;==========================================================================================
Func glfwLoadTexture2D($sName, $iFlags)
	If Not glfw_IsInit() Then Return SetError(-1, 0, 0)
	; ---
	Local $ret = DllCall($glfw_hDLL, "uint", "glfwLoadTexture2D", "str", $sName, "int", $iFlags)
	If @error Then Return SetError(@error, @extended, $ret)
	; ---
	Return SetError(0, 0, $ret[0])
EndFunc

#cs
GLFWAPI int  GLFWAPIENTRY glfwLoadMemoryTexture2D( const void *data, long size, int flags );
#ce

#cs
; #FUNCTION# ;===============================================================================
;
; Name...........: glfwLoadTextureImage2D
; Description ...: Upload a previosly loaded image (glfwReadImage) into currently OpenGL binded 2D Texture
; Syntax.........: glfwLoadTextureImage2D($pImg, $iFlags)
; Parameters ....: $pImg - Pointer to an GLFWimage structure (returned by glfwReadImage)
;                  $iFlags - Flags controling the image load process:
;                  |$GLFW_BUILD_MIPMAPS_BIT		Automatically build and upload all mipmap levels
;                  |$GLFW_ORIGIN_UL_BIT			Specifies that the origin of theloaded image should be in
;+												the upper left corner (default is the lower left corner)
;                  |$GLFW_ALPHA_MAP_BIT			Treat single component images as alpha maps rather than
;+												luminance maps
; Return values .: Success - 1
;                  Failure - 0 and set @error
;                  |-1 - Not initialized
;                  |Other values - See DllCall help
; Author ........: see main UDF
; Remarks .......:
;
; ;==========================================================================================
Func glfwLoadTextureImage2D($pImg, $iFlags)
	If Not glfw_IsInit() Then Return SetError(-1, 0, 0)
	; ---
	Local $ret = DllCall($glfw_hDLL, "uint", "glfwLoadTextureImage2D", "ptr", $pImg, "int", $iFlags)
	If @error Then Return SetError(@error, @extended, $ret)
	; ---
	Return SetError(0, 0, $ret[0])
EndFunc

; #FUNCTION# ;===============================================================================
;
; Name...........: glfwImageGetInfo
; Description ...: Get information about a previosly loaded image (glfwReadImage)
; Syntax.........: glfwGetImageInfo($pImg)
; Parameters ....: $pImg - Pointer to an GLFWimage structure (returned by glfwReadImage)
; Return values .: Success - Array containing image informations
;                  Failure - 0 and set @error
;                  |-1 - Not initialized
;                  |Other values - See DllStructCreate help
; Author ........: see main UDF
; Remarks .......:
;
; ;==========================================================================================
Func glfwGetImageInfo($pImg)
	If Not glfw_IsInit() Then Return SetError(-1, 0, 0)
	; ---
	Local $struct = DllStructCreate($tagGLFWimage, $pImg)
	If @error Then Return SetError(@error, @extended, $struct)
	; ---
	Local $ret[5]
	For $i = 0 To 4
		$ret[$i] = DllStructGetData($struct, $i + 1)
	Next
	Return $ret
EndFunc
#ce


; #INTERNAL_USE_ONLY# ===========================================================================================================

Func glfw_IsInit()
	Return $glfw_hDLL <> -1
EndFunc

Func glfw_SetCallback($iCbId, $sGlfwFunc, $sFunction)
	glfw_FreeCallbacks($iCbId)
	If $sFunction Then
		$glfw_CallBack[$iCbId][0] = DllCallbackRegister($sFunction, $glfw_CallBack[$iCbId][1], $glfw_CallBack[$iCbId][2])
		Local $ret = DllCall($glfw_hDLL, "none", $sGlfwFunc, "ptr", DllCallbackGetPtr($glfw_CallBack[$iCbId][0]))
		If @error Then Return SetError(@error, @extended, $ret)
	Else
		Local $ret = DllCall($glfw_hDLL, "none", $sGlfwFunc, "ptr", 0)
		If @error Then Return SetError(@error, @extended, $ret)
	EndIf
	; ---
	Return SetError(0, 0, 1)
EndFunc

Func glfw_FreeCallbacks($id = -1)
	If $id >= 0 Then
		If $glfw_CallBack[$id][0] <> 0 Then
			DllCallbackFree($glfw_CallBack[$id][0])
			$glfw_CallBack[$id][0] = 0
		EndIf
	Else
		For $i = 0 To 8
			If $glfw_CallBack[$i][0] <> 0 Then
				DllCallbackFree($glfw_CallBack[$i][0])
				$glfw_CallBack[$i][0] = 0
			EndIf
		Next
	EndIf
EndFunc
