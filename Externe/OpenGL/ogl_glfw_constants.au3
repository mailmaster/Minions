#include-once

; /* Function pointer types */
Global Enum $glfw_cb_WinSize, $glfw_cb_Close, $glfw_cb_Refresh, $glfw_cb_Button, $glfw_cb_Pos, $glfw_cb_Wheel, $glfw_cb_Key, $glfw_cb_Char, $glfw_cb_Thread
Global $glfw_CallBack[9][3] = [ _
	[0, "none", "int;int"], _	; typedef void (GLFWCALL * GLFWwindowsizefun)(int,int);
	[0, "int", ""], _			; typedef int  (GLFWCALL * GLFWwindowclosefun)(void);
	[0, "none", ""], _			; typedef void (GLFWCALL * GLFWwindowrefreshfun)(void);
	[0, "none", "int;int"], _	; typedef void (GLFWCALL * GLFWmousebuttonfun)(int,int);
	[0, "none", "int;int"], _	; typedef void (GLFWCALL * GLFWmouseposfun)(int,int);
	[0, "none", "int"], _		; typedef void (GLFWCALL * GLFWmousewheelfun)(int);
	[0, "none", "int;int"], _	; typedef void (GLFWCALL * GLFWkeyfun)(int,int);
	[0, "none", "int;int"], _	; typedef void (GLFWCALL * GLFWcharfun)(int,int);
	[0, "none", "ptr"] ]		; typedef void (GLFWCALL * GLFWthreadfun)(void *);
; ===============================================================================================================================

; #CONSTANTS# ===================================================================================================================
Global Const $GLFW_VERSION_MAJOR = 2
Global Const $GLFW_VERSION_MINOR = 7
Global Const $GLFW_VERSION_REVISION = 3

; ==========================================================================================
; Input handling definitions
; ==========================================================================================
; Key and button state/action definitions
Global Const $GLFW_RELEASE = 0
Global Const $GLFW_PRESS = 1

; Keyboard key definitions: 8-bit ISO-8859-1 (Latin 1) encoding is used
; for printable keys (such as A-Z, 0-9 etc), and values above 256
; represent special (non-printable) keys (e.g. F1, Page Up etc).
Global Const $GLFW_KEY_UNKNOWN = -1
Global Const $GLFW_KEY_SPACE = 32
Global Const $GLFW_KEY_SPECIAL = 256
Global Const $GLFW_KEY_ESC = $GLFW_KEY_SPECIAL + 1
Global Const $GLFW_KEY_F1 = $GLFW_KEY_SPECIAL + 2
Global Const $GLFW_KEY_F2 = $GLFW_KEY_SPECIAL + 3
Global Const $GLFW_KEY_F3 = $GLFW_KEY_SPECIAL + 4
Global Const $GLFW_KEY_F4 = $GLFW_KEY_SPECIAL + 5
Global Const $GLFW_KEY_F5 = $GLFW_KEY_SPECIAL + 6
Global Const $GLFW_KEY_F6 = $GLFW_KEY_SPECIAL + 7
Global Const $GLFW_KEY_F7 = $GLFW_KEY_SPECIAL + 8
Global Const $GLFW_KEY_F8 = $GLFW_KEY_SPECIAL + 9
Global Const $GLFW_KEY_F9 = $GLFW_KEY_SPECIAL + 10
Global Const $GLFW_KEY_F10 = $GLFW_KEY_SPECIAL + 11
Global Const $GLFW_KEY_F11 = $GLFW_KEY_SPECIAL + 12
Global Const $GLFW_KEY_F12 = $GLFW_KEY_SPECIAL + 13
Global Const $GLFW_KEY_F13 = $GLFW_KEY_SPECIAL + 14
Global Const $GLFW_KEY_F14 = $GLFW_KEY_SPECIAL + 15
Global Const $GLFW_KEY_F15 = $GLFW_KEY_SPECIAL + 16
Global Const $GLFW_KEY_F16 = $GLFW_KEY_SPECIAL + 17
Global Const $GLFW_KEY_F17 = $GLFW_KEY_SPECIAL + 18
Global Const $GLFW_KEY_F18 = $GLFW_KEY_SPECIAL + 19
Global Const $GLFW_KEY_F19 = $GLFW_KEY_SPECIAL + 20
Global Const $GLFW_KEY_F20 = $GLFW_KEY_SPECIAL + 21
Global Const $GLFW_KEY_F21 = $GLFW_KEY_SPECIAL + 22
Global Const $GLFW_KEY_F22 = $GLFW_KEY_SPECIAL + 23
Global Const $GLFW_KEY_F23 = $GLFW_KEY_SPECIAL + 24
Global Const $GLFW_KEY_F24 = $GLFW_KEY_SPECIAL + 25
Global Const $GLFW_KEY_F25 = $GLFW_KEY_SPECIAL + 26
Global Const $GLFW_KEY_UP = $GLFW_KEY_SPECIAL + 27
Global Const $GLFW_KEY_DOWN = $GLFW_KEY_SPECIAL + 28
Global Const $GLFW_KEY_LEFT = $GLFW_KEY_SPECIAL + 29
Global Const $GLFW_KEY_RIGHT = $GLFW_KEY_SPECIAL + 30
Global Const $GLFW_KEY_LSHIFT = $GLFW_KEY_SPECIAL + 31
Global Const $GLFW_KEY_RSHIFT = $GLFW_KEY_SPECIAL + 32
Global Const $GLFW_KEY_LCTRL = $GLFW_KEY_SPECIAL + 33
Global Const $GLFW_KEY_RCTRL = $GLFW_KEY_SPECIAL + 34
Global Const $GLFW_KEY_LALT = $GLFW_KEY_SPECIAL + 35
Global Const $GLFW_KEY_RALT = $GLFW_KEY_SPECIAL + 36
Global Const $GLFW_KEY_TAB = $GLFW_KEY_SPECIAL + 37
Global Const $GLFW_KEY_ENTER = $GLFW_KEY_SPECIAL + 38
Global Const $GLFW_KEY_BACKSPACE = $GLFW_KEY_SPECIAL + 39
Global Const $GLFW_KEY_INSERT = $GLFW_KEY_SPECIAL + 40
Global Const $GLFW_KEY_DEL = $GLFW_KEY_SPECIAL + 41
Global Const $GLFW_KEY_PAGEUP = $GLFW_KEY_SPECIAL + 42
Global Const $GLFW_KEY_PAGEDOWN = $GLFW_KEY_SPECIAL + 43
Global Const $GLFW_KEY_HOME = $GLFW_KEY_SPECIAL + 44
Global Const $GLFW_KEY_END = $GLFW_KEY_SPECIAL + 45
Global Const $GLFW_KEY_KP_0 = $GLFW_KEY_SPECIAL + 46
Global Const $GLFW_KEY_KP_1 = $GLFW_KEY_SPECIAL + 47
Global Const $GLFW_KEY_KP_2 = $GLFW_KEY_SPECIAL + 48
Global Const $GLFW_KEY_KP_3 = $GLFW_KEY_SPECIAL + 49
Global Const $GLFW_KEY_KP_4 = $GLFW_KEY_SPECIAL + 50
Global Const $GLFW_KEY_KP_5 = $GLFW_KEY_SPECIAL + 51
Global Const $GLFW_KEY_KP_6 = $GLFW_KEY_SPECIAL + 52
Global Const $GLFW_KEY_KP_7 = $GLFW_KEY_SPECIAL + 53
Global Const $GLFW_KEY_KP_8 = $GLFW_KEY_SPECIAL + 54
Global Const $GLFW_KEY_KP_9 = $GLFW_KEY_SPECIAL + 55
Global Const $GLFW_KEY_KP_DIVIDE = $GLFW_KEY_SPECIAL + 56
Global Const $GLFW_KEY_KP_MULTIPLY = $GLFW_KEY_SPECIAL + 57
Global Const $GLFW_KEY_KP_SUBTRACT = $GLFW_KEY_SPECIAL + 58
Global Const $GLFW_KEY_KP_ADD = $GLFW_KEY_SPECIAL + 59
Global Const $GLFW_KEY_KP_DECIMAL = $GLFW_KEY_SPECIAL + 60
Global Const $GLFW_KEY_KP_EQUAL = $GLFW_KEY_SPECIAL + 61
Global Const $GLFW_KEY_KP_ENTER = $GLFW_KEY_SPECIAL + 62
Global Const $GLFW_KEY_KP_NUM_LOCK = $GLFW_KEY_SPECIAL + 63
Global Const $GLFW_KEY_CAPS_LOCK = $GLFW_KEY_SPECIAL + 64
Global Const $GLFW_KEY_SCROLL_LOCK = $GLFW_KEY_SPECIAL + 65
Global Const $GLFW_KEY_PAUSE = $GLFW_KEY_SPECIAL + 66
Global Const $GLFW_KEY_LSUPER = $GLFW_KEY_SPECIAL + 67
Global Const $GLFW_KEY_RSUPER = $GLFW_KEY_SPECIAL + 68
Global Const $GLFW_KEY_MENU = $GLFW_KEY_SPECIAL + 69
Global Const $GLFW_KEY_LAST = $GLFW_KEY_MENU

; Mouse button definitions
Global Const $GLFW_MOUSE_BUTTON_1 = 0
Global Const $GLFW_MOUSE_BUTTON_2 = 1
Global Const $GLFW_MOUSE_BUTTON_3 = 2
Global Const $GLFW_MOUSE_BUTTON_4 = 3
Global Const $GLFW_MOUSE_BUTTON_5 = 4
Global Const $GLFW_MOUSE_BUTTON_6 = 5
Global Const $GLFW_MOUSE_BUTTON_7 = 6
Global Const $GLFW_MOUSE_BUTTON_8 = 7
Global Const $GLFW_MOUSE_BUTTON_LAST = $GLFW_MOUSE_BUTTON_8

; Mouse button aliases
Global Const $GLFW_MOUSE_BUTTON_LEFT = $GLFW_MOUSE_BUTTON_1
Global Const $GLFW_MOUSE_BUTTON_RIGHT = $GLFW_MOUSE_BUTTON_2
Global Const $GLFW_MOUSE_BUTTON_MIDDLE = $GLFW_MOUSE_BUTTON_3

; Joystick identifiers
Global Const $GLFW_JOYSTICK_1 = 0
Global Const $GLFW_JOYSTICK_2 = 1
Global Const $GLFW_JOYSTICK_3 = 2
Global Const $GLFW_JOYSTICK_4 = 3
Global Const $GLFW_JOYSTICK_5 = 4
Global Const $GLFW_JOYSTICK_6 = 5
Global Const $GLFW_JOYSTICK_7 = 6
Global Const $GLFW_JOYSTICK_8 = 7
Global Const $GLFW_JOYSTICK_9 = 8
Global Const $GLFW_JOYSTICK_10 = 9
Global Const $GLFW_JOYSTICK_11 = 10
Global Const $GLFW_JOYSTICK_12 = 11
Global Const $GLFW_JOYSTICK_13 = 12
Global Const $GLFW_JOYSTICK_14 = 13
Global Const $GLFW_JOYSTICK_15 = 14
Global Const $GLFW_JOYSTICK_16 = 15
Global Const $GLFW_JOYSTICK_LAST = $GLFW_JOYSTICK_16

; ==========================================================================================
; Other definitions
; ==========================================================================================
; glfwOpenWindow modes
Global Const $GLFW_WINDOW = 0x00010001
Global Const $GLFW_FULLSCREEN = 0x00010002

; glfwGetWindowParam tokens
Global Const $GLFW_OPENED = 0x00020001
Global Const $GLFW_ACTIVE = 0x00020002
Global Const $GLFW_ICONIFIED = 0x00020003
Global Const $GLFW_ACCELERATED = 0x00020004
Global Const $GLFW_RED_BITS = 0x00020005
Global Const $GLFW_GREEN_BITS = 0x00020006
Global Const $GLFW_BLUE_BITS = 0x00020007
Global Const $GLFW_ALPHA_BITS = 0x00020008
Global Const $GLFW_DEPTH_BITS = 0x00020009
Global Const $GLFW_STENCIL_BITS = 0x0002000A

; The following constants are used for both glfwGetWindowParam and glfwOpenWindowHint
Global Const $GLFW_REFRESH_RATE = 0x0002000B
Global Const $GLFW_ACCUM_RED_BITS = 0x0002000C
Global Const $GLFW_ACCUM_GREEN_BITS = 0x0002000D
Global Const $GLFW_ACCUM_BLUE_BITS = 0x0002000E
Global Const $GLFW_ACCUM_ALPHA_BITS = 0x0002000F
Global Const $GLFW_AUX_BUFFERS = 0x00020010
Global Const $GLFW_STEREO = 0x00020011
Global Const $GLFW_WINDOW_NO_RESIZE = 0x00020012
Global Const $GLFW_FSAA_SAMPLES = 0x00020013
Global Const $GLFW_OPENGL_VERSION_MAJOR = 0x00020014
Global Const $GLFW_OPENGL_VERSION_MINOR = 0x00020015
Global Const $GLFW_OPENGL_FORWARD_COMPAT = 0x00020016
Global Const $GLFW_OPENGL_DEBUG_CONTEXT = 0x00020017
Global Const $GLFW_OPENGL_PROFILE = 0x00020018

; GLFW_OPENGL_PROFILE tokens
Global Const $GLFW_OPENGL_CORE_PROFILE = 0x00050001
Global Const $GLFW_OPENGL_COMPAT_PROFILE = 0x00050002

; glfwEnable/glfwDisable tokens
Global Const $GLFW_MOUSE_CURSOR = 0x00030001
Global Const $GLFW_STICKY_KEYS = 0x00030002
Global Const $GLFW_STICKY_MOUSE_BUTTONS = 0x00030003
Global Const $GLFW_SYSTEM_KEYS = 0x00030004
Global Const $GLFW_KEY_REPEAT = 0x00030005
Global Const $GLFW_AUTO_POLL_EVENTS = 0x00030006

; glfwWaitThread wait modes
Global Const $GLFW_WAIT = 0x00040001
Global Const $GLFW_NOWAIT = 0x00040002

; glfwGetJoystickParam tokens
Global Const $GLFW_PRESENT = 0x00050001
Global Const $GLFW_AXES = 0x00050002
Global Const $GLFW_BUTTONS = 0x00050003

; glfwReadImage/glfwLoadTexture2D flags
Global Const $GLFW_NO_RESCALE_BIT = 0x00000001 ; Only for glfwReadImage
Global Const $GLFW_ORIGIN_UL_BIT = 0x00000002
Global Const $GLFW_BUILD_MIPMAPS_BIT = 0x00000004 ; Only for glfwLoadTexture2D
Global Const $GLFW_ALPHA_MAP_BIT = 0x00000008

; Time spans longer than this (seconds) are considered to be infinity
Global Const $GLFW_INFINITY = 100000.0
