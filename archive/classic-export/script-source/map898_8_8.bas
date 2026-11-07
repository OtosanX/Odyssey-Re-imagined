SUB Main(Player AS LONG)
	Dim A As Long, B As Long
	B = 0
	For A = 1 to GetMaxUsers
		If GetPlayerMap(A) = 602 Then
			B = A
		End If
	Next A
	
	If B > 0 Then
		PlayerMessage(Player, StrCat(GetPlayerName(B), " is already in the treasure room!"), BRIGHTRED)
		PlayerWarp(Player, 898, 7, 8)
	Else
		ResetMap(602)
		PlayerWarp(Player, 602, 6, 6)
	End If
END SUB