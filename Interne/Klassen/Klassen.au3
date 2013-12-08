; ----------------------------- ;
; ---------- Minions ---------- ;
; ----------------------------- ;

; Klassen

#include-once
#include <Vektor.au3>
#include <Vertex.au3>
#include <Linie.au3>
#include <Dreieck.au3>
#include <Viereck.au3>
#include <Einstellungen.au3>

; Vererbare Objekte
Local $oVektor = -1

; Erstellt die vererbaren Objekte
Func _Klassen_Start()
	$oVektor = _Vektor_Create3D()
EndFunc