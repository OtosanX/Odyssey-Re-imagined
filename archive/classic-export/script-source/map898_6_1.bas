SUB Main(Player AS LONG)
	Dim A As Long, B As Long
	B = 0
	For A = 1 to GetMaxUsers
		If GetPlayerMap(A) = 1725 Then
			B = A
		End If
	Next A
	
	If B > 0 Then
		PlayerMessage(Player, StrCat(GetPlayerName(B), " is already in the treasure room!"), BRIGHTRED)
		PlayerWarp(Player, 898, 6, 2)
	Else
		ResetMap(1725)
		PlayerWarp(Player, 1725, 6, 6)
	End If
END SUB