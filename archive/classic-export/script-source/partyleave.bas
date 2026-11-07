Function Main(Player as Long) AS LONG
dim Loop as Long, Leader as Long

If GetPlayerFlag(Player, 201) > 0 Then
	For Loop = 1 To GetMaxUsers()
		If Player <> Loop Then
			If GetPlayerFlag(Loop, 201) = GetPlayerFlag(Player, 201) Then
				PlayerMessage(Loop, strcat(GetPlayerName(Player), " has left your Party."), White)
			End If
		End If
	Next Loop
	For Loop = 1 To GetMaxUsers()
		If Player <> Loop Then
			If GetPlayerFlag(Loop, 201) = GetPlayerFlag(Player, 201) Then
				Leader = Loop
				Goto Finish
			End If
		End If
	Next Loop
End If

Finish:
RunScript2("partyleader", Player, Leader)
SetPlayerFlag(Player, 201, 0)
SetPlayerFlag(Player, 202, 0)
PlayerMessage(Player, "You are no longer part of any Party.", Grey)

End Function