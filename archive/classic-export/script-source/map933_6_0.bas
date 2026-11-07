SUB Main(Player AS LONG)
	Dim A As Long, B As Long
	B = 0
	For A = 1 to GetMaxUsers
		If GetPlayerMap(A) = 934 Then
			B = A
		End If
	Next A

	If B > 0 Then
		PlayerMessage(Player, StrCat(GetPlayerName(B), " is already in the treasure room!"), BRIGHTRED)
		PlayerWarp(Player, 933, 6, 1)
	Else
		ResetMap(934)
		PlayerWarp(Player, 934, 6, 11)
	End If
	
End Sub