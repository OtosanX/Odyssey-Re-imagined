'FARSIGHT
Sub Main(Player as Long)
dim Loop as Long, Mana as Long, Count as Long

If GetPlayerGuild(Player) = 0 Then
	PlayerMessage(Player, "You must be guilded to use this.", White)
	Exit Sub
End If



if getplayerflag(player, 250) = 0 | getplayerflag(player,250) >1 then
	playermessage(player, "You must be a venerate Knight to use this spell.", white)
	exit sub
end if


Mana = (GetPlayerMaxMana(Player) - Divide(GetPlayerWisdom(Player), 2))
If GetPlayerMana(Player) < Mana Then
	PlayerMessage(Player, "You must regenerate.", White)
	Exit Sub
End If
SetPlayerMana(Player, GetPlayerMana(Player) - Mana)

PlayerMessage(Player, "=Farsight=", White)
For Loop = 1 To GetMaxUsers()
	If IsPlaying(Loop) Then
		If Loop <> Player Then
			If GetPlayerGuild(Loop) = GetPlayerGuild(Player) Then
				PlayerMessage(Player, strcat(GetPlayerName(Loop), strcat(" - ", GetMapName(GetPlayerMap(Loop)))), Grey)
				Count = Count + 1
			End If
		End If
	End If
Next Loop

If Count = 0 Then PlayerMessage(Player, "You are alone.", Grey)

End Sub