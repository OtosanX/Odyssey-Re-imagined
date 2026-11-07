SUB Main(Player AS LONG)
	Dim A As Long
	Dim B As Long
	B = 0
	For A = 1 to GetMaxUsers
		If GetPlayerMap(A) = 2132 Then
			B = A
		End If
	Next A
	
	If B > 0 Then
		PlayerMessage(Player, StrCat(GetPlayerName(B), " is already in the treasure room!"), BRIGHTRED)
		PlayerWarp(Player, 2131, 1, 1)
	Else
		ResetMap(2132)
		PlayerWarp(Player, 2132, 5, 6)
		GivePlayerExp(Player, 50000)
		GivePlayerExp(Player, 50000)
		PlayerMessage(Player, "You receive 100k experience for completing Hero's Quest!", White)
	End If
END SUB