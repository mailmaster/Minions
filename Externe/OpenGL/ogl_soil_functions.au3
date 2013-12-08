#include-once

Global $_soil_hDLL = "soil.dll"

Func soil_Init()
	$_soil_hDLL = DllOpen("soil.dll")
EndFunc

Func soil_Terminate()
	DllClose($_soil_hDLL)
	$_soil_hDLL = "soil.dll"
EndFunc

; =============================================================================
; ### Functions ###
; =============================================================================
; Description ...: Loads an image from disk into an OpenGL texture.
; Syntax.........: soil_load_OGL_texture($sFileName, $iForceChannels, $iReuseTextureId, $iFlags)
#cs
	\param filename the name of the file to upload as a texture
	\param force_channels 0-image format, 1-luminous, 2-luminous/alpha, 3-RGB, 4-RGBA
	\param reuse_texture_ID 0-generate a new texture ID, otherwise reuse the texture ID (overwriting the old texture)
	\param flags can be any of SOIL_FLAG_POWER_OF_TWO | SOIL_FLAG_MIPMAPS | SOIL_FLAG_TEXTURE_REPEATS | SOIL_FLAG_MULTIPLY_ALPHA | SOIL_FLAG_INVERT_Y | SOIL_FLAG_COMPRESS_TO_DXT | SOIL_FLAG_DDS_LOAD_DIRECT
	\return 0-failed, otherwise returns the OpenGL texture handle
#ce

Func soil_load_OGL_texture($sFileName, $iForceChannels, $iReuseTextureId, $iFlags)
	Local $ret = DllCall($_soil_hDLL, "uint:cdecl", "SOIL_load_OGL_texture", _
		"str", $sFileName, _			; const char *filename,
		"int", $iForceChannels, _		; int force_channels,
		"uint", $iReuseTextureId, _		; unsigned int reuse_texture_ID,
		"uint", $iFlags)				; unsigned int flags
	If @error Then Return SetError(@error, @extended, $ret)
	; ---
	Return $ret[0]
EndFunc


; Description ...: Loads 6 images from disk into an OpenGL cubemap texture.
; Syntax.........: soil_load_OGL_cubemap($sXPosFile, $sXNegFile, $iYPosFile, $iYNegFile, $iZPosFile, $iZNegFile, $iForceChannels, $iReuseTextureId, $iFlags)
#cs
	Loads 6 images from disk into an OpenGL cubemap texture.
	\param x_pos_file the name of the file to upload as the +x cube face
	\param x_neg_file the name of the file to upload as the -x cube face
	\param y_pos_file the name of the file to upload as the +y cube face
	\param y_neg_file the name of the file to upload as the -y cube face
	\param z_pos_file the name of the file to upload as the +z cube face
	\param z_neg_file the name of the file to upload as the -z cube face
	\param force_channels 0-image format, 1-luminous, 2-luminous/alpha, 3-RGB, 4-RGBA
	\param reuse_texture_ID 0-generate a new texture ID, otherwise reuse the texture ID (overwriting the old texture)
	\param flags can be any of SOIL_FLAG_POWER_OF_TWO | SOIL_FLAG_MIPMAPS | SOIL_FLAG_TEXTURE_REPEATS | SOIL_FLAG_MULTIPLY_ALPHA | SOIL_FLAG_INVERT_Y | SOIL_FLAG_COMPRESS_TO_DXT | SOIL_FLAG_DDS_LOAD_DIRECT
	\return 0-failed, otherwise returns the OpenGL texture handle
#ce
Func soil_load_OGL_cubemap($sXPosFile, $sXNegFile, $iYPosFile, $iYNegFile, $iZPosFile, $iZNegFile, $iForceChannels, $iReuseTextureId, $iFlags)
	Local $ret = DllCall($_soil_hDLL, "uint:cdecl", "SOIL_load_OGL_cubemap", _
		"str", $sXPosFile, "str", $sXNegFile, _		; const char *x_pos_file, const char *x_neg_file,
		"str", $iYPosFile, "str", $iYNegFile, _		; const char *y_pos_file, const char *y_neg_file,
		"str", $iZPosFile, "str", $iZNegFile, _		; const char *z_pos_file, const char *z_neg_file,
		"int", $iForceChannels, _					; int force_channels,
		"uint", $iReuseTextureId, _					; unsigned int reuse_texture_ID,
		"uint", $iFlags)							; unsigned int flags
	If @error Then Return SetError(@error, @extended, $ret)
	; ---
	Return $ret[0]
EndFunc


; Description ...: Loads 1 image from disk and splits it into an OpenGL cubemap texture.
; Syntax.........: soil_load_OGL_single_cubemap($sFileName, $sFaceOrder, $iForceChannels, $iReuseTextureId, $iFlags)
#cs
	Loads 1 image from disk and splits it into an OpenGL cubemap texture.
	\param filename the name of the file to upload as a texture
	\param face_order the order of the faces in the file, any combination of NSWEUD, for North, South, Up, etc.
	\param force_channels 0-image format, 1-luminous, 2-luminous/alpha, 3-RGB, 4-RGBA
	\param reuse_texture_ID 0-generate a new texture ID, otherwise reuse the texture ID (overwriting the old texture)
	\param flags can be any of SOIL_FLAG_POWER_OF_TWO | SOIL_FLAG_MIPMAPS | SOIL_FLAG_TEXTURE_REPEATS | SOIL_FLAG_MULTIPLY_ALPHA | SOIL_FLAG_INVERT_Y | SOIL_FLAG_COMPRESS_TO_DXT | SOIL_FLAG_DDS_LOAD_DIRECT
	\return 0-failed, otherwise returns the OpenGL texture handle
#ce
Func soil_load_OGL_single_cubemap($sFileName, $sFaceOrder, $iForceChannels, $iReuseTextureId, $iFlags)
	If StringLen($sFaceOrder) <> 6 Then Return SetError(-1, 0, 0)
	; ---
	Local $ret = DllCall($_soil_hDLL, "uint:cdecl", "SOIL_load_OGL_single_cubemap", _
		"str", $sFileName, _			; const char *filename,
		"str", $sFaceOrder, _			; const char face_order[6],
		"int", $iForceChannels, _		; int force_channels,
		"uint", $iReuseTextureId, _		; unsigned int reuse_texture_ID,
		"uint", $iFlags)				; unsigned int flags
	If @error Then Return SetError(@error, @extended, $ret)
	; ---
	Return $ret[0]
EndFunc


; Description ...: Loads an HDR image from disk into an OpenGL texture.
; Syntax.........: soil_load_OGL_HDR_texture($sFileName, $iFakeHDRFormat, $iRescaleToMax, $iReuseTextureId, $iFlags)
#cs
	Loads an HDR image from disk into an OpenGL texture.
	\param filename the name of the file to upload as a texture
	\param fake_HDR_format SOIL_HDR_RGBE, SOIL_HDR_RGBdivA, SOIL_HDR_RGBdivA2
	\param reuse_texture_ID 0-generate a new texture ID, otherwise reuse the texture ID (overwriting the old texture)
	\param flags can be any of SOIL_FLAG_POWER_OF_TWO | SOIL_FLAG_MIPMAPS | SOIL_FLAG_TEXTURE_REPEATS | SOIL_FLAG_MULTIPLY_ALPHA | SOIL_FLAG_INVERT_Y | SOIL_FLAG_COMPRESS_TO_DXT
	\return 0-failed, otherwise returns the OpenGL texture handle
#ce
Func soil_load_OGL_HDR_texture($sFileName, $iFakeHDRFormat, $iRescaleToMax, $iReuseTextureId, $iFlags)
	Local $ret = DllCall($_soil_hDLL, "uint:cdecl", "SOIL_load_OGL_HDR_texture", _
		"str", $sFileName, _			; const char *filename,
		"int", $iFakeHDRFormat, _		; int fake_HDR_format,
		"int", $iRescaleToMax, _		; int rescale_to_max,
		"uint", $iReuseTextureId, _		; unsigned int reuse_texture_ID,
		"uint", $iFlags)				; unsigned int flags
	If @error Then Return SetError(@error, @extended, $ret)
	; ---
	Return $ret[0]
EndFunc

#cs
	Loads an image from RAM into an OpenGL texture.
	\param buffer the image data in RAM just as if it were still in a file
	\param buffer_length the size of the buffer in bytes
	\param force_channels 0-image format, 1-luminous, 2-luminous/alpha, 3-RGB, 4-RGBA
	\param reuse_texture_ID 0-generate a new texture ID, otherwise reuse the texture ID (overwriting the old texture)
	\param flags can be any of SOIL_FLAG_POWER_OF_TWO | SOIL_FLAG_MIPMAPS | SOIL_FLAG_TEXTURE_REPEATS | SOIL_FLAG_MULTIPLY_ALPHA | SOIL_FLAG_INVERT_Y | SOIL_FLAG_COMPRESS_TO_DXT | SOIL_FLAG_DDS_LOAD_DIRECT
	\return 0-failed, otherwise returns the OpenGL texture handle

unsigned int
	SOIL_load_OGL_texture_from_memory
	(
		const unsigned char *const buffer,
		int buffer_length,
		int force_channels,
		unsigned int reuse_texture_ID,
		unsigned int flags
	);
#ce

#cs
	Loads 6 images from memory into an OpenGL cubemap texture.
	\param x_pos_buffer the image data in RAM to upload as the +x cube face
	\param x_pos_buffer_length the size of the above buffer
	\param x_neg_buffer the image data in RAM to upload as the +x cube face
	\param x_neg_buffer_length the size of the above buffer
	\param y_pos_buffer the image data in RAM to upload as the +x cube face
	\param y_pos_buffer_length the size of the above buffer
	\param y_neg_buffer the image data in RAM to upload as the +x cube face
	\param y_neg_buffer_length the size of the above buffer
	\param z_pos_buffer the image data in RAM to upload as the +x cube face
	\param z_pos_buffer_length the size of the above buffer
	\param z_neg_buffer the image data in RAM to upload as the +x cube face
	\param z_neg_buffer_length the size of the above buffer
	\param force_channels 0-image format, 1-luminous, 2-luminous/alpha, 3-RGB, 4-RGBA
	\param reuse_texture_ID 0-generate a new texture ID, otherwise reuse the texture ID (overwriting the old texture)
	\param flags can be any of SOIL_FLAG_POWER_OF_TWO | SOIL_FLAG_MIPMAPS | SOIL_FLAG_TEXTURE_REPEATS | SOIL_FLAG_MULTIPLY_ALPHA | SOIL_FLAG_INVERT_Y | SOIL_FLAG_COMPRESS_TO_DXT | SOIL_FLAG_DDS_LOAD_DIRECT
	\return 0-failed, otherwise returns the OpenGL texture handle

unsigned int
	SOIL_load_OGL_cubemap_from_memory
	(
		const unsigned char *const x_pos_buffer,
		int x_pos_buffer_length,
		const unsigned char *const x_neg_buffer,
		int x_neg_buffer_length,
		const unsigned char *const y_pos_buffer,
		int y_pos_buffer_length,
		const unsigned char *const y_neg_buffer,
		int y_neg_buffer_length,
		const unsigned char *const z_pos_buffer,
		int z_pos_buffer_length,
		const unsigned char *const z_neg_buffer,
		int z_neg_buffer_length,
		int force_channels,
		unsigned int reuse_texture_ID,
		unsigned int flags
	);
#ce

#cs
	Loads 1 image from RAM and splits it into an OpenGL cubemap texture.
	\param buffer the image data in RAM just as if it were still in a file
	\param buffer_length the size of the buffer in bytes
	\param face_order the order of the faces in the file, any combination of NSWEUD, for North, South, Up, etc.
	\param force_channels 0-image format, 1-luminous, 2-luminous/alpha, 3-RGB, 4-RGBA
	\param reuse_texture_ID 0-generate a new texture ID, otherwise reuse the texture ID (overwriting the old texture)
	\param flags can be any of SOIL_FLAG_POWER_OF_TWO | SOIL_FLAG_MIPMAPS | SOIL_FLAG_TEXTURE_REPEATS | SOIL_FLAG_MULTIPLY_ALPHA | SOIL_FLAG_INVERT_Y | SOIL_FLAG_COMPRESS_TO_DXT | SOIL_FLAG_DDS_LOAD_DIRECT
	\return 0-failed, otherwise returns the OpenGL texture handle

unsigned int
	SOIL_load_OGL_single_cubemap_from_memory
	(
		const unsigned char *const buffer,
		int buffer_length,
		const char face_order[6],
		int force_channels,
		unsigned int reuse_texture_ID,
		unsigned int flags
	);
#ce


; Description ...: Creates a 2D OpenGL texture from raw image data.
; Syntax.........: soil_create_OGL_texture($pImgData, $iWidth, $iHeight, $iChannels, $iReuseTextureId, $iFlags)
#cs
	Creates a 2D OpenGL texture from raw image data.  Note that the raw data is
	_NOT_ freed after the upload (so the user can load various versions).
	\param data the raw data to be uploaded as an OpenGL texture
	\param width the width of the image in pixels
	\param height the height of the image in pixels
	\param channels the number of channels: 1-luminous, 2-luminous/alpha, 3-RGB, 4-RGBA
	\param reuse_texture_ID 0-generate a new texture ID, otherwise reuse the texture ID (overwriting the old texture)
	\param flags can be any of SOIL_FLAG_POWER_OF_TWO | SOIL_FLAG_MIPMAPS | SOIL_FLAG_TEXTURE_REPEATS | SOIL_FLAG_MULTIPLY_ALPHA | SOIL_FLAG_INVERT_Y | SOIL_FLAG_COMPRESS_TO_DXT
	\return 0-failed, otherwise returns the OpenGL texture handle
#ce
Func soil_create_OGL_texture($pImgData, $iWidth, $iHeight, $iChannels, $iReuseTextureId, $iFlags)
	Local $ret = DllCall($_soil_hDLL, "uint:cdecl", "SOIL_create_OGL_texture", _
		"ptr", $pImgData, _										; const unsigned char *const data,
		"int", $iWidth, "int", $iHeight, "int", $iChannels, _	; int width, int height, int channels,
		"uint", $iReuseTextureId, _								; unsigned int reuse_texture_ID,
		"uint", $iFlags)										; unsigned int flags
	If @error Then Return SetError(@error, @extended, $ret)
	; ---
	Return $ret[0]
EndFunc


; Description ...: Creates an OpenGL cubemap texture by splitting up 1 image into 6 parts.
; Syntax.........: soil_create_OGL_single_cubemap($pImgData, $iWidth, $iHeight, $iChannels, $sFaceOrder, $iReuseTextureId, $iFlags)
#cs
	Creates an OpenGL cubemap texture by splitting up 1 image into 6 parts.
	\param data the raw data to be uploaded as an OpenGL texture
	\param width the width of the image in pixels
	\param height the height of the image in pixels
	\param channels the number of channels: 1-luminous, 2-luminous/alpha, 3-RGB, 4-RGBA
	\param face_order the order of the faces in the file, and combination of NSWEUD, for North, South, Up, etc.
	\param reuse_texture_ID 0-generate a new texture ID, otherwise reuse the texture ID (overwriting the old texture)
	\param flags can be any of SOIL_FLAG_POWER_OF_TWO | SOIL_FLAG_MIPMAPS | SOIL_FLAG_TEXTURE_REPEATS | SOIL_FLAG_MULTIPLY_ALPHA | SOIL_FLAG_INVERT_Y | SOIL_FLAG_COMPRESS_TO_DXT | SOIL_FLAG_DDS_LOAD_DIRECT
	\return 0-failed, otherwise returns the OpenGL texture handle
#ce
Func soil_create_OGL_single_cubemap($pImgData, $iWidth, $iHeight, $iChannels, $sFaceOrder, $iReuseTextureId, $iFlags)
	If StringLen($sFaceOrder) <> 6 Then Return SetError(-1, 0, 0)
	; ---
	Local $ret = DllCall($_soil_hDLL, "uint:cdecl", "SOIL_create_OGL_single_cubemap", _
		"ptr", $pImgData, _										; const unsigned char *const data,
		"int", $iWidth, "int", $iHeight, "int", $iChannels, _	; int width, int height, int channels,
		"str", $sFaceOrder, _									; const char face_order[6],
		"uint", $iReuseTextureId, _								; unsigned int reuse_texture_ID,
		"uint", $iFlags)										; unsigned int flags
	If @error Then SetError(@error, @extended, $ret)
	; ---
	Return $ret[0]
EndFunc


; Description ...: Captures the OpenGL window (RGB) and saves it to disk.
; Syntax.........: soil_save_screenshot($sFileName, $iType, $iX, $iY, $iWidth, $iHeight)
#cs
	Captures the OpenGL window (RGB) and saves it to disk
	\return 0 if it failed, otherwise returns 1
#ce
Func soil_save_screenshot($sFileName, $iType, $iX, $iY, $iWidth, $iHeight)
	Local $ret = DllCall($_soil_hDLL, "int:cdecl", "SOIL_save_screenshot", _
		"str", $sFileName, _				; const char *filename,
		"int", $iType, _					; int image_type,
		"int", $iX, "int", $iY, _			; int x, int y,
		"int", $iWidth, "int", $iHeight)	; int width, int height
	If @error Then Return SetError(@error, @extended, $ret)
	; ---
	Return $ret[0]
EndFunc


; Description ...: Loads an image from disk into an array of unsigned chars.
; Syntax.........: soil_load_image($sFileName, ByRef $iWidth, ByRef $iHeight, ByRef $iChannels, $iForceChannels)
#cs
	Loads an image from disk into an array of unsigned chars.
	Note that *channels return the original channel count of the
	image.  If force_channels was other than SOIL_LOAD_AUTO,
	the resulting image has force_channels, but *channels may be
	different (if the original image had a different channel
	count).
	\return 0 if failed, otherwise returns 1
#ce
Func soil_load_image($sFileName, ByRef $iWidth, ByRef $iHeight, ByRef $iChannels, $iForceChannels)
	Local $ret = DllCall($_soil_hDLL, "ptr:cdecl", "SOIL_load_image", _
		"str", $sFileName, _					; const char *filename,
		"int*", 0, "int*", 0, "int*", 0, _		; int *width, int *height, int *channels,
		"int", $iForceChannels)					; int force_channels
	If @error Then Return SetError(@error, @extended, $ret)
	; ---
	$iWidth = $ret[2]
	$iHeight = $ret[3]
	$iChannels = $ret[4]
	; ---
	Return $ret[0]
EndFunc

#cs
	Loads an image from memory into an array of unsigned chars.
	Note that *channels return the original channel count of the
	image.  If force_channels was other than SOIL_LOAD_AUTO,
	the resulting image has force_channels, but *channels may be
	different (if the original image had a different channel
	count).
	\return 0 if failed, otherwise returns 1

unsigned char*
	SOIL_load_image_from_memory
	(
		const unsigned char *const buffer,
		int buffer_length,
		int *width, int *height, int *channels,
		int force_channels
	);
#ce


; Description ...: Saves an image from an array of unsigned chars (RGBA) to disk
; Syntax.........: soil_save_image($sFileName, $iImgType, $iWidth, $iHeight, $iChannels, $pImgData)
#cs
	Saves an image from an array of unsigned chars (RGBA) to disk
	\return 0 if failed, otherwise returns 1
#ce
Func soil_save_image($sFileName, $iImgType, $iWidth, $iHeight, $iChannels, $pImgData)
	Local $ret = DllCall($_soil_hDLL, "int:cdecl", "SOIL_save_image", _
		"str", $sFileName, _									; const char *filename,
		"int", $iImgType, _										; int image_type,
		"int", $iWidth, "int", $iHeight, "int", $iChannels, _	; int width, int height, int channels,
		"ptr", $pImgData)										; const unsigned char *const data
	If @error Then Return SetError(@error, @extended, $ret)
	; ---
	Return $ret[0]
EndFunc


; Description ...: Frees the image data
; Syntax.........: soil_free_image_data($pImgData)
#cs
	Frees the image data (note, this is just C's "free()"...this function is
	present mostly so C++ programmers don't forget to use "free()" and call
	"delete []" instead [8^)
#ce
Func soil_free_image_data($pImgData)
	Local $ret = DllCall($_soil_hDLL, "none:cdecl", "SOIL_free_image_data", _
		"ptr", $pImgData)	; unsigned char *img_data
	If @error Then Return SetError(@error, @extended, $ret)
	; ---
	Return SetError(0, 0, 1)
EndFunc


; Description ...: Return a string describing the last thing that happened inside SOIL
; Syntax.........: soil_last_result()
#cs
	This function resturn a pointer to a string describing the last thing
	that happened inside SOIL.  It can be used to determine why an image
	failed to load.
#ce
Func soil_last_result()
	Local $ret = DllCall($_soil_hDLL, "str:cdecl", "SOIL_last_result")
	If @error Then Return SetError(@error, @extended, $ret)
	; ---
	Return $ret[0]
EndFunc