; ----------------------------- ;
; ---------- Minions ---------- ;
; ----------------------------- ;

; Linie

; Erstellt die Linien-Klasse
Func _Linie_Create()
	Local $oLinie = _AutoItObject_Class()

	With $oLinie
		.AddProperty("vertex1", $ELSCOPE_READONLY, _AutoItObject_Create($oVektor))
		.AddProperty("vertex2", $ELSCOPE_READONLY, _AutoItObject_Create($oVektor))
		.AddDestructor("_Linie_Destroy")
	EndWith

	Return $oLinie.Object
EndFunc

; ----------------------

; Zerstört die Vertexe
Func _Linie_Destroy($oSelf)
	$oSelf.vertex1 = 0
	$oSelf.vertex2 = 0
EndFunc