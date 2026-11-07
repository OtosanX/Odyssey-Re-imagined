Sub Main(Player as Long)

If GetPlayerClass(Player) = 4 Then
	If GetPlayerFlag(Player, 16) = 0 Then
		If GetPlayerGuild(Player) > 0 Then
			SetPlayerFlag(Player, 16, 1)
			PlayerMessage(Player, "Your spells have been set to affect your Guild only.", White)
		Else
			PlayerMessage(Player, "You must be Guilded to use this.", Grey)
		End If
	Else
		SetPlayerFlag(Player, 16, 0)
		PlayerMessage(Player, "Your spells have been set to affect everyone.", White)
	End If
Else
	PlayerMessage(Player, "You must be a Cleric to use this.", Grey)
End If

End Sub