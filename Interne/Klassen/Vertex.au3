; ----------------------------- ;
; ---------- Minions ---------- ;
; ----------------------------- ;

; Vertex

; Erstellt einen Vertex
Func _Vertex_Create()
	Local $oVertex = _AutoItObject_Class()

	With $oVertex
		.AddProperty("red", $ELSCOPE_READONLY, 0)
		.AddProperty("green", $ELSCOPE_READONLY, 0)
		.AddProperty("blue", $ELSCOPE_READONLY, 0)
		.AddProperty("alpha", $ELSCOPE_READONLY, 0)
		.AddProperty("vektor", $ELSCOPE_READONLY, _AutoItObject_Create($oVektor))
		.AddMethod("SetRed", "_Vertex_SetRed")
		.AddMethod("SetGreen", "_Vertex_SetGreen")
		.AddMethod("SetBlue", "_Vertex_SetBlue")
		.AddMethod("SetAlpha", "_Vertex_SetAlpha")
		.AddDestructor("_Vertex_Destroy")
	EndWith

	Return $oVertex.Object
EndFunc

; ----------------------

; Zerstört den Vektor
Func _Vertex_Destroy($oSelf)
	$oSelf.vektor = 0
EndFunc

; Ändert die Farbe des Vertex
Func _Vertex_SetRed($oSelf, $iColor)
	$oSelf.red = $iColor
EndFunc

Func _Vertex_SetGreen($oSelf, $iColor)
	$oSelf.green = $iColor
EndFunc

Func _Vertex_SetBlue($oSelf, $iColor)
	$oSelf.blue = $iColor
EndFunc

; Ändert die Tranzparenz
Func _Vertex_SetAlpha($oSelf, $iAlpha)
	$oSelf.alpha = $iAlpha
EndFunc