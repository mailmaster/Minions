; ----------------------------- ;
; ---------- Minions ---------- ;
; ----------------------------- ;

; Press

; Variablen
; --------
; Tastenarrays
Local $aKeys[325]
Local $aButtons[8]

; Mouse
Local $aMousePos[2] = [0, 0], $aOldMousePos[2] = [0, 0]
Local $iMouseWheelPos = -10, $iLastWheel = 0

Local $iRotateY = 0, $iRotateX = 0
Local $iTranslateX = 0, $iTranslateY = 0
Local $iBewegen = 1

; ----------------------

; --------------- ;
; Main-Funktions
; --------------- ;

; Wertet Keys und Buttons aus und startet Aktionen
Func _Press_Main($iTimeStep)
	; Tastatur
	Select
		; System
		Case $aKeys[$GLFW_KEY_ESC]
			$iActive = False
		Case $aKeys[$GLFW_KEY_F4] and not $aKeys[$GLFW_KEY_LALT]
			If $iFullscreen Then
				_SetGlFullscreen(False)
			Else
				_SetGlFullscreen(True)
			EndIf
			$aKeys[$GLFW_KEY_F4] = $GLFW_RELEASE

		; Mehrfach
		Case $aKeys[$GLFW_KEY_LEFT] and $aKeys[$GLFW_KEY_UP]
			$iRotateY -= ($iTimeStep*60)
			$iRotateX += ($iTimeStep*60)
		Case $aKeys[$GLFW_KEY_LEFT] and $aKeys[$GLFW_KEY_DOWN]
			$iRotateY -= ($iTimeStep*60)
			$iRotateX -= ($iTimeStep*60)
		Case $aKeys[$GLFW_KEY_RIGHT] and $aKeys[$GLFW_KEY_UP]
			$iRotateY += ($iTimeStep*60)
			$iRotateX += ($iTimeStep*60)
		Case $aKeys[$GLFW_KEY_RIGHT] and $aKeys[$GLFW_KEY_DOWN]
			$iRotateY += ($iTimeStep*60)
			$iRotateX -= ($iTimeStep*60)

		; Einfach
		Case $aKeys[$GLFW_KEY_LEFT]
			$iRotateY -= ($iTimeStep*60)
		Case $aKeys[$GLFW_KEY_RIGHT]
			$iRotateY += ($iTimeStep*60)
		Case $aKeys[$GLFW_KEY_UP]
			$iRotateX += ($iTimeStep*60)
		Case $aKeys[$GLFW_KEY_DOWN]
			$iRotateX -= ($iTimeStep*60)
		Case $aKeys[$GLFW_KEY_SPACE]
			$iJump = 1
	EndSelect

	; Maus
	Select
		Case $aButtons[$GLFW_MOUSE_BUTTON_LEFT]
			If $iBewegen Then
				$iBewegen = 0
			Else
				If $aMousePos[0] <> $aOldMousePos[0] Then ; X
					If $aMousePos[0] < $aOldMousePos[0] Then ; Verschieben nach Links
						$iTranslateX -= ($iTimeStep*($aOldMousePos[0]-$aMousePos[0]))
					Else ; Verschieben nach Rechts
						$iTranslateX += ($iTimeStep*($aMousePos[0]-$aOldMousePos[0]))
					EndIf
				EndIf

				If $aMousePos[1] <> $aOldMousePos[1] Then ; Y
					If $aMousePos[1] < $aOldMousePos[1] Then ; Verschieben nach Oben
						$iTranslateY += ($iTimeStep*($aOldMousePos[1]-$aMousePos[1]))
					Else ; Verschieben nach Unten
						$iTranslateY -= ($iTimeStep*($aMousePos[1]-$aOldMousePos[1]))
					EndIf
				EndIf
			EndIf
	EndSelect
EndFunc

; ----------------------

; --------------- ;
; Callbacks
; --------------- ;

; Tastatur
; --------

; Callback für Tastendrücke
Func _Press_KeyCallback($iKey, $iAction)
	$aKeys[$iKey] = $iAction
EndFunc

; Maus
; --------

; Callback für Maustastendrücke
Func _Press_ButtonCallback($iButton, $iAction)
	$aButtons[$iButton] = $iAction
EndFunc

; Callback für Mausbewegung
Func _Press_MousePosCallback($iX, $iY)
	If $iFullscreen Then

	Else
		$aOldMousePos[0] = $aMousePos[0]
		$aOldMousePos[1] = $aMousePos[1]
		;ConsoleWrite("OldMousePos: " & $aOldMousePos[0] & "|" & $aOldMousePos[1])
		$aMousePos[0] = $iX
		$aMousePos[1] = $iY
		;ConsoleWrite("MousePos: " & $aMousePos[0] & "|" & $aMousePos[1])
	EndIf
EndFunc

; Callback für Mausradbewegung
Func _Press_MouseWheelCallback($iPos)
	#cs
	If $iLastWheel > $iPos Then
		$iMouseWheelPos += $iPos
	ElseIf $iLastWheel < $iPos Then
		$iMouseWheelPos -= $iPos
	EndIf
	ConsoleWrite($iMouseWheelPos)
	$iLastWheel = $iPos
	#ce

	$iMouseWheelPos = $iPos
EndFunc
