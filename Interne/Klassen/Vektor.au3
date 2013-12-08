; ----------------------------- ;
; ---------- Minions ---------- ;
; ----------------------------- ;

; Vektor

; Erstellt einen neuen 3D-Vektor
Func _Vektor_Create3D()
	Local $oVektor3D = _AutoItObject_Class()

	With $oVektor3D
		.AddProperty("x", $ELSCOPE_READONLY, 0)
		.AddProperty("y", $ELSCOPE_READONLY, 0)
		.AddProperty("z", $ELSCOPE_READONLY, 0)
		.AddMethod("Set", "_Vektor3D_Set")
		.AddMethod("Get", "_Vektor3D_Get")
		.AddMethod("Null", "_Vektor3D_Null")
		.AddMethod("Add", "_Vektor3D_Add")
	EndWith

	Return $oVektor3D.Object
EndFunc

; ----------------------

; Fügt einen Vektor zum Vektor hinzu
Func _Vektor3D_Add($oSelf, $oVektor)
	$oSelf.x = $oSelf.x+$oVektor.x
	$oSelf.y = $oSelf.y+$oVektor.y
	$oSelf.z = $oSelf.z+$oVektor.z
EndFunc

; Holt alle oder einen Wert aus dem 3D-Vektor
; 1ner = int | 3 = Array
Func _Vektor3D_Get($oSelf, $iALl = 1, $iKoordinate = -1) ; 1 = x; 2 = y; 3 = z
	With $oSelf
		If $iAll Then
			Local $aKoordinate[3] = [.x, .y, .z]
			Return $aKoordinate
		Else
			Switch $iKoordinate
				Case 1 ; x
					Return .x
				Case 2 ; y
					Return .y
				Case 3 ; z
					Return .z
			EndSwitch
		EndIf
	EndWith
EndFunc

; Setzt den 3D-Vektor auf Wert
Func _Vektor3D_Set($oSelf, $iX, $iY, $iZ)
	$oSelf.x = $iX
	$oSelf.y = $iY
	$oSelf.z = $iZ
EndFunc

; Setzt den 3D-Vektor auf Null
Func _Vektor3D_Null($oSelf)
	$oSelf.x = 0
	$oSelf.y = 0
	$oSelf.z = 0
EndFunc
