Sub Main(Player as long)
	Dim A As Long
	Dim B As Long
	B = 0
	For A = 1 to GetMaxUsers
		If GetPlayerMap(A) = 553 Then
			B = A
		End If
	Next A
	
	If B > 0 Then
		PlayerMessage(Player, StrCat(GetPlayerName(B), " is already in the treasure room!"), BRIGHTRED)
		PlayerWarp(Player, 552, 11, 2)
	Else
		ResetMap(553)
		PlayerWarp(Player, 553, 5, 6)
	End If
End Sub