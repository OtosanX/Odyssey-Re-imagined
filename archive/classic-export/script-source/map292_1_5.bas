SUB Main(Player AS LONG)
	Dim A As Long
	Dim B As Long
	B = 0
	For A = 1 to GetMaxUsers
		If GetPlayerMap(A) = 295 Then
			B = A
		End If
	Next A
	
	If B > 0 Then
		PlayerMessage(Player, StrCat(GetPlayerName(B), " is already in the treasure room!"), BRIGHTRED)
		PlayerWarp(Player, 292, 1, 6)
	Else
		ResetMap(295)
		PlayerWarp(Player, 295, 6, 6)
	End If
END SUB