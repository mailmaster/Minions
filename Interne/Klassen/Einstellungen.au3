; ----------------------------- ;
; ---------- Minions ---------- ;
; ----------------------------- ;

; Einstellungen

; Variablen
Local $sEinstellungenIni = $sDaten & "\Einstellungen.ini"

; Erstellt die Einstellungsklasse
Func _Einstellungen_Create()
	Local $oEinstellungen = _AutoItObject_Class()

	With $oEinstellungen
		.AddProperty("refreshrate", $ELSCOPE_READONLY, 0)
		.AddProperty("stereo", $ELSCOPE_READONLY, $GL_FALSE)
		.AddProperty("fsaasample", $ELSCOPE_READONLY, 0)
		.AddProperty("fullscreen", $ELSCOPE_READONLY, 0)
		.AddProperty("aufloesung", $ELSCOPE_READONLY, "800x640")
		.AddProperty("perspective", $ELSCOPE_READONLY, $GL_NICEST)
		.AddProperty("fog", $ELSCOPE_READONLY, $GL_NICEST)
		.AddProperty("linesmooth", $ELSCOPE_READONLY, $GL_NICEST)
		.AddProperty("pointsmooth", $ELSCOPE_READONLY, $GL_NICEST)
		.AddProperty("polygonsmooth", $ELSCOPE_READONLY, $GL_NICEST)
		.AddProperty("seitenverhaeltnis", $ELSCOPE_READONLY, "4:3")
		.AddMethod("Load", "_Einstellungen_Load")
		.AddMethod("Save", "_Einstellungen_Save")
		.AddDestructor("_Einstellungen_Destroy")
	EndWith

	Return $oEinstellungen.Object
EndFunc

; ----------------------

; Lädt die Einstellungen
Func _Einstellungen_Load($oSelf)
	With $oSelf
		.refreshrate =  IniRead($sEinstellungenIni, "Einstellungen", "refreshrate", 0)
		.stereo = IniRead($sEinstellungenIni, "Einstellungen", "stereo", $GL_FALSE)
		.fsaasample = IniRead($sEinstellungenIni, "Einstellungen", "fsaasample", 0)
		.fullscreen = IniRead($sEinstellungenIni, "Einstellungen", "fullscreen", 0)
		.aufloesung = IniRead($sEinstellungenIni, "Einstellungen", "aufloesung", "800x640")
		.perspective = IniRead($sEinstellungenIni, "Einstellungen", "perspective", $GL_NICEST)
		.fog = IniRead($sEinstellungenIni, "Einstellungen", "fog", $GL_NICEST)
		.linesmooth = IniRead($sEinstellungenIni, "Einstellungen", "line", $GL_NICEST)
		.pointsmooth = IniRead($sEinstellungenIni, "Einstellungen", "point", $GL_NICEST)
		.polygonsmooth = IniRead($sEinstellungenIni, "Einstellungen", "polygon", $GL_NICEST)
		.seitenverhaeltnis = IniRead($sEinstellungenIni, "Einstellungen", "seiten", "4:3")
	EndWith
EndFunc

; Speichert die Einstellungen
Func _Einstellungen_Save($oSelf)
	With $oSelf
		IniWrite($sEinstellungenIni, "Einstellungen", "refreshrate", .refreshrate)
		IniWrite($sEinstellungenIni, "Einstellungen", "stereo", .stereo)
		IniWrite($sEinstellungenIni, "Einstellungen", "fsaasample", .fsaasample)
		IniWrite($sEinstellungenIni, "Einstellungen", "fullscreen", .fullscreen)
		IniWrite($sEinstellungenIni, "Einstellungen", "aufloesung", .aufloesung)
		IniWrite($sEinstellungenIni, "Einstellungen", "perspective", .perspective)
		IniWrite($sEinstellungenIni, "Einstellungen", "fog", .fog)
		IniWrite($sEinstellungenIni, "Einstellungen", "line", .linesmooth)
		IniWrite($sEinstellungenIni, "Einstellungen", "point", .pointsmooth)
		IniWrite($sEinstellungenIni, "Einstellungen", "polygon", .polygonsmooth)
		IniWrite($sEinstellungenIni, "Einstellungen", "seiten", .seitenverhaeltnis)
	EndWith
EndFunc

; Bei beenden wird nochmal gespeichert
Func _Einstellungen_Destroy($oSelf)
	$oSelf.Save()
EndFunc