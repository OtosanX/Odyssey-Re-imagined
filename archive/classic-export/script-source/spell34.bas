Function Main(Player as Long) AS LONG
dim Loop as Long

If GetPlayerGuild(Player) > 0 Then
	If GetPlayerFlag(Player, 23) = 0 Then
		SetPlayerFlag(Player, 23, 1)
		RunScript1("SpellCooldown", Player)

	PlayerMessage(Player, "You call out to fellow guild members to join the fight!", Grey)
	For Loop = 1 To GetMaxUsers()
		If GetPlayerGuild(Loop) <> 0 Then
			If Loop <> Player Then
				If GetPlayerGuild(Loop) = GetPlayerGuild(Player) Then
					PlayerMessage(Loop, strcat(GetPlayerName(Player), strcat(" has called you to ", GetMapName(GetPlayerMap(Player)))), White)
				End If
			End If
		End If
	Next Loop
	End If
Else
	PlayerMessage(Player, "You must be in a guild to cast this spell.", Grey)
End If

End Function