Sub Main(Player as Long)
	Dim A As Long, Message as Long
	PlayerMessage(Player, "Gods online:", WHITE)
	For A = 1 to GetMaxUsers()
		If IsPlaying(A) Then
			If GetPlayerAccess(A) > 0 Then
				If GetPlayerStatus(A) < 25 Then PlayerMessage(Player, GetPlayerName(A), BRIGHTGREEN)
			Else
				If GetPlayerFlag(A, 78) = 1 | GetPlayerFlag(A, 74) = 1 Then
					PlayerMessage(Player, StrCat(GetPlayerName(A), " - Minor God"), BRIGHTBLUE)
				End If
			End If
		End If
	Next A
End Sub