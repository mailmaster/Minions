; ----------------------------- ;
; ---------- Minions ---------- ;
; ----------------------------- ;

; Main

; Autoit
#include <WinAPI.au3>
#include <String.au3>
#include <Array.au3>

; Externe
#include <Externe\OpenGL\opengl.au3>
#include <Externe\AutoItObject.au3>

; ------------------------------ ;

; Variablen
Local $sTitle = "Minions"
Local $iActive = True
Local $iFullscreen = True

; ------------------------------ ;

; Interne
#include <Interne\Bewegung.au3>
#include <Interne\Physik.au3>
#include <Interne\Press.au3>
#include <Interne\Draw.au3>
#include <Interne\Ordner.au3>
#include <Interne\Klassen\Klassen.au3>

; ------------------------------ ;

; Objekte
Local $oEinstellungen = -1
Local $oError = ObjEvent("AutoIt.Error", "_ErrFunc")

; ----------------------

; Programablauf
If _Start() Then
	_Main()
EndIf
_Ende()

; --------------- ;
; Main-Funktions
; --------------- ;

; Bearbeitet die Zeitgeber und MainLoop
Func _Main()
	Local $iAnswer = MsgBox(4+32, "Vollbild?", "Wollen Sie im Vollbildmodus starten?")
	If $iAnswer = 6 Then
		; Fullscreen
		_SetGlFullscreen(True)
	Else
		; Windowed
		_SetGlFullscreen(False)
	EndIf

	; ----------------------

	; Variablen
	$iTimer = -1
	$iTimeDiff = -1
	$iTimeStep = 0

	; Zusätzliche Funktionen
	_Physik_Start()
	_Bewegung_Start()

	; MainLoop ~ Herz
	While $iActive
		; Timer-Start
		; -----------
		; Timer löschen
		$iTimer = -1

		; Timer setzen
		$iTimer = TimerInit()

		; Mainpart
		; -----------
		; Press abfragen - Benutzt den Timestep
		_Press_Main($iTimeStep)

		; Bewegen - Benutzt den Timestep
		_Bewegen_Next($iTimeStep)

		; Zeichnen
		_DrawGlScene()

		; Timer-Ende
		; -----------
		; Säubern
		$iTimeDiff = -1
		$iTimeStep = 0

		; Dauer ausrechnen
		$iTimeDiff = TimerDiff($iTimer)

		; Next Timestep ausrechnen - Sorgt dafür das es auf jeden Pc gleich schnell abläuft
		$iTimeStep = ($iTimeDiff/1000)

		; Timestep anzeigen lassen - Nur Windowed
		If not $iFullscreen Then glfwSetWindowTitle($sTitle & "- iTS: " & $iTimeStep)
	WEnd
EndFunc

; Startet alles und prüft auf Fehler
Func _Start()
	; Ordnerstruktur erstellen
	_Ordner_Create()

	; OpenGL, usw. starten
	If not glInit() Then
		MsgBox(48, "Fehler!", "Fehler beim Starten von OpenGL!", 3)
		Return 0
	EndIf

	If not gluInit() Then
		MsgBox(48, "Fehler!", "Fehler beim Starten von Glut!", 3)
		Return 0
	EndIf

	If not glfwInit() Then
		MsgBox(48, "Fehler!", "Fehler beim Starten von GLFW!", 3)
		Return 0
	EndIf

	If not _AutoItObject_Startup() Then
		MsgBox(48, "Fehler!", "Fehler beim Starten von AutoItObject!", 3)
		Return 0
	EndIf

	; Einstellungen laden
	$oEinstellungen = _Einstellungen_Create()
	If not FileExists($sEinstellungenIni) Then
		$oEinstellungen.Save()
	EndIf
	$oEinstellungen.Load()

	Return 1
EndFunc

; Beendet alles
Func _Ende()
	; Zusätzliche Funktionen
	_Physik_Ende()

	; Einstellungen speichern
	$oEinstellungen.Save()

	; Objekte freigeben
	$oEinstellungen = 0
	$oError = 0

	; Exit
	_KillGlWindow()

	; Opengl, usw. beenden
	_AutoItObject_Shutdown()
	glfwTerminate()
	gluTerminate()
	glTerminate()
EndFunc

; --------------- ;
; Funktions
; --------------- ;

; Erstellt ein Fenster
Func _CreateGlWindow($sTitle, $iWidth, $iHeight, ByRef $aiBits, $iFullscreenFlag)
	; Initialisieren
	$iFullscreen = $iFullscreenFlag

	If not $iWidth Then
		If not $iFullscreen Then
			$iWidth = 800
		Else
			$iWidth = @DesktopHeight
		EndIf
	EndIf

	If not $iHeight Then
		If not $iFullscreen Then
			$iHeight = 800
		Else
			$iHeight = @DesktopHeight
		EndIf
	EndIf

	; Fenstereinstellungen setzen
	With $oEinstellungen
		glfwOpenWindowHint($GLFW_REFRESH_RATE, .refreshrate)
		glfwOpenWindowHint($GLFW_STEREO, .stereo)
		glfwOpenWindowHint($GLFW_FSAA_SAMPLES, .fsaasample)
	EndWith

	; Fenster erstellen
	If $iFullscreen Then
		; Fullscreen
		glfwOpenWindow($iWidth, $iHeight, $aiBits[0], $aiBits[1], $aiBits[2], $aiBits[3], $aiBits[4], $aiBits[5], $GLFW_FULLSCREEN)
		glfwSetWindowTitle($sTitle)
	Else
		; Windowed
		glfwOpenWindow($iWidth, $iHeight, $aiBits[0], $aiBits[1], $aiBits[2], $aiBits[3], $aiBits[4], $aiBits[5], $GLFW_WINDOW)
		glfwSetWindowTitle($sTitle)
	EndIf

	If not _InitGl() Then
		_KillGlWindow()
		$iActive = False
	EndIf

	; Szene setzen
	_ReSizeGlScene($iWidth, $iHeight)

	; Callbacks registrieren
	glfwSetWindowCloseCallback("_ExitMainLoop")
	glfwSetWindowSizeCallback("_ReSizeGlScene")
	glfwSetKeyCallback("_Press_KeyCallback")
	glfwSetMouseButtonCallback("_Press_ButtonCallback")
	glfwSetMousePosCallback("_Press_MousePosCallback")
	glfwSetMouseWheelCallback("_Press_MouseWheelCallback")
EndFunc

; Initialisiert das geöffnete Fenster
Func _InitGl()
	glShadeModel($GL_SMOOTH)
	glClearColor(0, 0, 0, 0)
	glClearDepth(1)
	glEnable($GL_DEPTH_TEST)
	glDepthFunc($GL_LEQUAL)

	; Einstellungen setzen
	With $oEinstellungen
		glHint($GL_PERSPECTIVE_CORRECTION_HINT, .perspective)
		glHint($GL_FOG_HINT, .fog)
		glHint($GL_LINE_SMOOTH_HINT, .linesmooth)
		glHint($GL_POINT_SMOOTH_HINT, .pointsmooth)
		glHint($GL_POLYGON_SMOOTH_HINT, .polygonsmooth)
	EndWith

	glEnable($GL_CULL_FACE)

	Return True
EndFunc

; Bearbeitet Änderungen am Fenster
Func _ReSizeGlScene($iWidth, $iHeight)
	If $iHeight = 0 Then
		$iHeight = 1
	EndIf

	glViewport(0, 0, $iWidth, $iHeight)
	glMatrixMode($GL_PROJECTION)
	glLoadIdentity()

	gluPerspective(45, $iWidth/$iHeight, .1, 100)

	glMatrixMode($GL_MODELVIEW)
	glLoadIdentity()
EndFunc

; Setzt das Fenster in den Vollbildmodus und zurück
Func _SetGlFullscreen($iFullscreenFlag = True)
	; Andere Variablen
	Dim $aiBits[6] = [8, 8, 8, 0, 8, 0] ; Rot, Grün, Blau, Alpha, Depth, Stencil
	Local $iWidth = 0, $iHeight = 0, $sAufloesung = -1, $aAufloesung = -1

	If $iFullscreenFlag Then
		$iFullscreen = True
		$sAufloesung = $oEinstellungen.aufloesung
		$aAufloesung = _StringExplode($sAufloesung, "x")
		If IsArray($aAufloesung) Then
			$iWidth = $aAufloesung[0]
			$iHeight = $aAufloesung[1]
		Else
			$iWidth = 800
			$iHeight = 640
		EndIf

		glfwDisable($GLFW_MOUSE_CURSOR)
		_KillGlWindow()
		_CreateGlWindow($sTitle, $iWidth, $iHeight, $aiBits, $iFullscreen)
	Else
		$iFullscreen = False
		$iWidth = 500
		$iHeight = 500

		glfwEnable($GLFW_MOUSE_CURSOR)
		_KillGlWindow()
		_CreateGlWindow($sTitle, $iWidth, $iHeight, $aiBits, $iFullscreen)
	EndIf
EndFunc

; Beendet das Fenster
Func _KillGlWindow()
	; Maus anzeigen
	If $iFullscreen Then
		glfwEnable($GLFW_MOUSE_CURSOR)
	EndIf

	; Callbacks freigeben
	glfwSetKeyCallback("")
	glfwSetMouseButtonCallback("")
	glfwSetMousePosCallback("")
	glfwSetMouseWheelCallback("")
	glfwSetWindowSizeCallback("")
	glfwSetWindowCloseCallback("")

	; Fenster schließen
	glfwCloseWindow()
EndFunc

; Beendet das Programm bei Klick auf das rote X
Func _ExitMainLoop()
	$iActive = False
EndFunc

; ----------------------

Func _ErrFunc()
	ConsoleWrite("! COM Error !  Number: 0x" & Hex($oError.number, 8) & "   ScriptLine: " & $oError.scriptline & " - " & $oError.windescription & @CRLF)
	Return
EndFunc   ;==>_ErrFunc