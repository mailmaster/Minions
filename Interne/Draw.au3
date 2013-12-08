; ----------------------------- ;
; ---------- Minions ---------- ;
; ----------------------------- ;

; Draw

; Zeichnet alles
Func _DrawGlScene()
	; Säubern
	glClear($GL_COLOR_BUFFER_BIT + $GL_DEPTH_BUFFER_BIT)
	glLoadIdentity()

	; Kamera
	glTranslatef($iTranslateX, $iTranslateY, $iMouseWheelPos)
	glRotatef(30, 1, 0, 0)

	; Objekt bewegen, drehen und skalieren
	glRotatef($iRotateY, 0, 1, 0)
	glRotatef($iRotateX, 1, 0, 0)

	; Malen
	glColor3f(0, 1, 0)
	_DrawQuad($oMinion.x, $oMinion.y, $oMinion.z)

	; Buffer tauschen
	glfwSwapBuffers()

	Return True
EndFunc

Func _DrawQuad($iX, $iY, $iZ)
	glBegin($GL_QUADS)
		; Dach
		glVertex3f($iX-.5, $iY+3, $iZ-.5)
		glVertex3f($iX-.5, $iY+3, $iZ+.5)
		glVertex3f($iX+.5, $iY+3, $iZ+.5)
		glVertex3f($iX+.5, $iY+3, $iZ-.5)
		; Boden
		glVertex3f($iX-.5, $iY+0, $iZ-.5)
		glVertex3f($iX-.5, $iY+0, $iZ+.5)
		glVertex3f($iX+.5, $iY+0, $iZ+.5)
		glVertex3f($iX+.5, $iY+0, $iZ-.5)
		; Links
		glVertex3f($iX-.5, $iY+0, $iZ-.5)
		glVertex3f($iX-.5, $iY+0, $iZ+.5)
		glVertex3f($iX-.5, $iY+3, $iZ+.5)
		glVertex3f($iX-.5, $iY+3, $iZ-.5)
		; Rechts
		glVertex3f($iX+.5, $iY+0, $iZ+.5)
		glVertex3f($iX+.5, $iY+0, $iZ-.5)
		glVertex3f($iX+.5, $iY+3, $iZ-.5)
		glVertex3f($iX+.5, $iY+3, $iZ+.5)
		; Hinten
		glVertex3f($iX+.5, $iY+0, $iZ-.5)
		glVertex3f($iX-.5, $iY+0, $iZ-.5)
		glVertex3f($iX-.5, $iY+3, $iZ-.5)
		glVertex3f($iX+.5, $iY+3, $iZ-.5)
		; Vorne
		glVertex3f($iX-.5, $iY+0, $iZ+.5)
		glVertex3f($iX+.5, $iY+0, $iZ+.5)
		glVertex3f($iX+.5, $iY+3, $iZ+.5)
		glVertex3f($iX-.5, $iY+3, $iZ+.5)
	glEnd()
EndFunc