SUB Main(Player AS LONG)
	Dim A As Long, B As Long
	B = 0
	For A = 1 to GetMaxUsers
		If GetPlayerMap(A) = 938 Then
			B = A
		End If
	Next A

	If B > 0 Then
		PlayerMessage(Player, StrCat(GetPlayerName(B), " is already in the treasure room!"), BRIGHTRED)
		PlayerWarp(Player, 933, 8, 3)
	Else
		ResetMap(938)
		PlayerWarp(Player, 938, 6, 10)
	End If
	
End Sub