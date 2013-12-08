; ----------------------------- ;
; ---------- Minions ---------- ;
; ----------------------------- ;

; Draw

Local $oMinion = -1, $oKraft = -1
Local $oJump = -1, $iJump = 0

Func _Bewegung_Start()
	$oMinion = _Vektor_Create3D()
	$oJump = _Vektor_Create3D()
	$oJump.Set(0, 200, 0)
	ConsoleWrite($oJump.y)
	$oKraft = _Vektor_Create3D()
EndFunc

; Bewegt die Einheit
Func _Bewegen_Next($iTime)
	If $iJump Then
		$oKraft.Add($oJump)
		$iJump = 0
	EndIf

	_Physik_NewPos($oMinion, $iTime, 1, $oKraft)
EndFunc