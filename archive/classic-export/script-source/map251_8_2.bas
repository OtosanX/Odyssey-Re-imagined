Sub Main(Player as Long)

If GetPlayerGuild(Player) > 0 Then
	If GetGuildHall(GetPlayerGuild(Player)) = 1 Then
		If GetPlayerGuildRank(Player) = 2 | GetPlayerGuildRank(Player) = 3 Then
			OpenDoor(251, 8, 3)
		Else
			PlayerMessage(Player, "Only leaders may open this vault.", White)
		End If
	End If
End If

End Sub