SUB Main(Player AS LONG)
	Dim A As Long, B As Long
	B = 0
	For A = 1 to GetMaxUsers
		If GetPlayerMap(A) = 814 Then
			B = A
		End If
	Next A

	If B > 0 Then
		PlayerMessage(Player, StrCat(GetPlayerName(B), " is already in the treasure room!"), BRIGHTRED)
		PlayerWarp(Player, 813, 6, 10)
	Else
		ResetMap(814)
		PlayerWarp(Player, 814, 6, 0)
	End If
	
End Sub