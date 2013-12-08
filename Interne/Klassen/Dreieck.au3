; ----------------------------- ;
; ---------- Minions ---------- ;
; ----------------------------- ;

; Dreieck

; Erstellt ein neues Dreieck
Func _Dreieck_Create()
	Local $oDreieck = _AutoItObject_Class()

	With $oDreieck
		.AddProperty("vertex1", _AutoItObject_Create($oVektor))
		.AddProperty("vertex2", _AutoItObject_Create($oVektor))
		.AddProperty("vertex3", _AutoItObject_Create($oVektor))
		.AddDestructor("_Dreieck_Destroy")
	EndWith

	Return $oDreieck.Object
EndFunc

; ----------------------

; Zerstört das Dreieck
Func _Dreieck_Destroy($oSelf)
	$oSelf.vertex1 = 0
	$oSelf.vertex2 = 0
	$oSelf.vertex3 = 0
EndFunc