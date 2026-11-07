SUB Main(Player AS LONG)
	Dim A As Long
	Dim B As Long
	B = 0
	For A = 1 to GetMaxUsers
		If GetPlayerMap(A) = 983 Then
			B = A
		End If
	Next A
	
	If B > 0 Then
		PlayerMessage(Player, StrCat(GetPlayerName(B), " is already in the treasure room!"), BRIGHTRED)
		PlayerWarp(Player, 982, 2, 3)
	Else
		ResetMap(983)
		PlayerWarp(Player, 983, 6, 10)
	End If
END SUB