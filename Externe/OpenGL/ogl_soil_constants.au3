#include-once

Enum _
	$SOIL_LOAD_AUTO = 0, _	; leaves the image in whatever format it was found.
	$SOIL_LOAD_L = 1, _		; forces the image to load as Luminous (greyscale)
	$SOIL_LOAD_LA = 2, _	; forces the image to load as Luminous with Alpha
	$SOIL_LOAD_RGB = 3, _	; forces the image to load as Red Green Blue
	$SOIL_LOAD_RGBA = 4		; forces the image to load as Red Green Blue Alpha

#cs
	Passed in as reuse_texture_ID, will cause SOIL to
	register a new texture ID using glGenTextures().
	If the value passed into reuse_texture_ID > 0 then
	SOIL will just re-use that texture ID (great for
	reloading image assets in-game!)
#ce
Enum _
	$SOIL_CREATE_NEW_ID = 0

#cs
	flags you can pass into SOIL_load_OGL_texture()
	and SOIL_create_OGL_texture().
	(note that if SOIL_FLAG_DDS_LOAD_DIRECT is used
	the rest of the flags with the exception of
	SOIL_FLAG_TEXTURE_REPEATS will be ignored while
	loading already-compressed DDS files.)
#ce
Enum _
	$SOIL_FLAG_POWER_OF_TWO = 1, _		; force the image to be POT
	$SOIL_FLAG_MIPMAPS = 2, _			; generate mipmaps for the texture
	$SOIL_FLAG_TEXTURE_REPEATS = 4, _	; otherwise will clamp
	$SOIL_FLAG_MULTIPLY_ALPHA = 8, _	; for using (GL_ONE,GL_ONE_MINUS_SRC_ALPHA) blending
	$SOIL_FLAG_INVERT_Y = 16, _			; flip the image vertically
	$SOIL_FLAG_COMPRESS_TO_DXT = 32, _	; if the card can display them, will convert RGB to DXT1, RGBA to DXT5
	$SOIL_FLAG_DDS_LOAD_DIRECT = 64, _	; will load DDS files directly without _ANY_ additional processing
	$SOIL_FLAG_NTSC_SAFE_RGB = 128, _	; clamps RGB components to the range [16,235]
	$SOIL_FLAG_CoCg_Y = 256, _			; Google YCoCg; RGB=>CoYCg, RGBA=>CoCgAY
	$SOIL_FLAG_TEXTURE_RECTANGLE = 512	; uses ARB_texture_rectangle ; pixel indexed & no repeat or MIPmaps or cubemaps

#cs
	The types of images that may be saved.
#ce
Enum _
	$SOIL_SAVE_TYPE_TGA = 0, _	; (TGA supports uncompressed RGB / RGBA)
	$SOIL_SAVE_TYPE_BMP = 1, _	; (BMP supports uncompressed RGB)
	$SOIL_SAVE_TYPE_DDS = 2		; (DDS supports DXT1 and DXT5)

#cs
	Defines the order of faces in a DDS cubemap.
	I recommend that you use the same order in single
	image cubemap files, so they will be interchangeable
	with DDS cubemaps when using SOIL.
#ce
Const $SOIL_DDS_CUBEMAP_FACE_ORDER = "EWUDNS"

#cs
	The types of internal fake HDR representations
#ce
Enum _
	$SOIL_HDR_RGBE = 0, _		; RGB * pow( 2.0, A - 128.0 )
	$SOIL_HDR_RGBdivA = 1, _	; RGB / A
	$SOIL_HDR_RGBdivA2 = 2		; RGB / (A*A)
