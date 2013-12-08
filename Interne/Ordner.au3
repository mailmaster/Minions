; ----------------------------- ;
; ---------- Minions ---------- ;
; ----------------------------- ;

; Ordner

; Pfade
Local $sDaten = @ScriptDir & "\Daten"

; ----------------------

; Erstellt die Ordnerstruktur
Func _Ordner_Create()
	If not FileExists($sDaten) Then
		DirCreate($sDaten)
	EndIf
EndFunc