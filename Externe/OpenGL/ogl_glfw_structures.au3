#include-once

; ##############################################################
; /* Structures */

; #STRUCTURE# ===================================================================================================================
; Name...........: $tagGLFWvidmode
; Description ...: The video mode structure used by glfwGetVideoModes()
; Fields ........: int Width, int Height, int RedBits, int BlueBits, int GreenBits
; Author ........: Matwachich
; Remarks .......:
; ===============================================================================================================================
Global Const $tagGLFWvidmode = "int Width; int Height; int RedBits; int BlueBits; int GreenBits"

; #STRUCTURE# ===================================================================================================================
; Name...........: $tagGLFWimage
; Description ...: Image/texture information
; Fields ........: int Width, int Height, int Format, int BytesPerPixel, unsigned char *Data;
; Author ........: Matwachich
; Remarks .......:
; ===============================================================================================================================
Global Const $tagGLFWimage = "int Width; int Height; int Format; int BytesPerPixel; ptr Data"
