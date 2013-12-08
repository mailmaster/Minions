; ----------------------------- ;
; ---------- Minions ---------- ;
; ----------------------------- ;

; Physik

; Variablen
Local $oGravity = -1

; ----------------------

; Startet die Physikengine
Func _Physik_Start()
	$oGravity = _Vektor_Create3D()
	$oGravity.Set(0, -10, 0)
EndFunc

; Beendet die Physikengine
Func _Physik_Ende()
	$oGravity = 0
EndFunc

; ----------------------

; Errechnet einen Bewegungsvektor und addiert in zu der Position
; Fügt auf Wunsch einen Kraftvektor hinzu
Func _Physik_NewPos($oSelf, $iTime, $iMass = 1, $oForce = -1, $iGravity = 1)
	If $oForce = -1 Then
		$oForce = _Vektor_Create3D()
	EndIf

	If $iGravity Then
		$oForce.Add($oGravity)
	EndIf

	With $oForce
		.Set((.x/$iMass), (.y/$iMass), (.z/$iMass))
	EndWith

	Local $oVelocity = _Vektor_Create3D()
	With $oVelocity
		.Set((.x+($oForce.x*$iTime)), (.y+($oForce.y*$iTime)), (.z+($oForce.z*$iTime)))
	EndWith

	With $oSelf
		.Set((.x+($oVelocity.x*$iTime)), (.y+($oVelocity.y*$iTime)), (.z+($oVelocity.z*$iTime)))
	EndWith
EndFunc