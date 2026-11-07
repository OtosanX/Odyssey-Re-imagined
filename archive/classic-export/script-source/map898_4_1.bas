SUB Main(Player AS LONG)
	Dim A As Long, B As Long
	B = 0
	For A = 1 to GetMaxUsers
		If GetPlayerMap(A) = 1723 Then
			B = A
		End If
	Next A
	
	If B > 0 Then
		PlayerMessage(Player, StrCat(GetPlayerName(B), " is already in the treasure room!"), BRIGHTRED)
		PlayerWarp(Player, 898, 4, 2)
	Else
		ResetMap(1723)
		PlayerWarp(Player, 1723, 6, 6)
	End If
END SUB