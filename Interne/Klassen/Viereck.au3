; ----------------------------- ;
; ---------- Minions ---------- ;
; ----------------------------- ;

; Viereck

; Erstellt ein neues Viereck
Func _Viereck_Create()
	Local $oViereck = _AutoItObject_Class()

	With $oViereck
		.AddProperty("vertex1", _AutoItObject_Create($oVektor))
		.AddProperty("vertex2", _AutoItObject_Create($oVektor))
		.AddProperty("vertex3", _AutoItObject_Create($oVektor))
		.AddProperty("vertex4", _AutoItObject_Create($oVektor))
		.AddDestructor("_Viereck_Destroy")
	EndWith

	Return $oViereck.Object
EndFunc

; ----------------------

; Zerstört das Viereck
Func _Viereck_Destroy($oSelf)
	$oSelf.vektor1 = 0
	$oSelf.vektor2 = 0
	$oSelf.vektor3 = 0
	$oSelf.vektor4 = 0
EndFunc
