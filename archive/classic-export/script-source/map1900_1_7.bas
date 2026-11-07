Sub Main(Player as Long)

If GetPlayerGuild(Player) > 0 Then
	If GetGuildHall(GetPlayerGuild(Player)) = 44 Then
		If GetPlayerGuildRank(Player) = 2 | GetPlayerGuildRank(Player) = 3 Then
			OpenDoor(1900, 1, 6)
		Else
			PlayerMessage(Player, "Only leaders may open this vault.", White)
		End If
	End If
End If

End Sub