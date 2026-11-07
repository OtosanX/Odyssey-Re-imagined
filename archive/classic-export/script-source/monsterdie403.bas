Function Main(Player AS LONG) AS LONG
GlobalMessage("Fire Lord Lavos has been slain!!", yellow)
setflag (183,0)
setflag(184,420)
setflag(194,420)

	Dim A As LONG
	For A = 1 to GetMaxUsers()
		If GetPlayerMap(A) = 2111 Then
			PlayerWarp(A, 2112, 5, 5)
		End If
	Next A

	Main = Continue

END FUNCTION




