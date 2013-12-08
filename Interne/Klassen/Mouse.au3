; ----------------------------- ;
; ---------- Minions ---------- ;
; ----------------------------- ;

; Mouse

; Erstellt ein Mausobjekt
Func _Mouse_Create()
	Local $oMaus = _AutoItObject_Class()

	With $oMaus
		.AddProperty("x", $ELSCOPE_READONLY, 0)
		.AddProperty("y", $ELSCOPE_READONLY, 0)
		.AddProperty("wheel", $ELSCOPE_READONLY, 0)
		.AddMethod("Set", "_Mouse_Set")
		.AddMethod("SetWheel", "_Mouse_SetWheel")
	EndWith

	Return $oMaus.Object
EndFunc

; Setzt x- und y-Wert des Mausobjektes
Func _Mouse_Set($oSelf, $iX, $iY)
	$oSelf.x = $iX
	$oSelf.y = $iY
EndFunc

; Setzt die Wheelposition eines Mausobjektes
Func _Mouse_SetWheel($oSelf, $iWheel)
	$oSelf.wheel = $iWheel
EndFunc