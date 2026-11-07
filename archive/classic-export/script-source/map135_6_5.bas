Sub Main(Player as Long)

If GetPlayerGuild(Player) > 0 Then
	If GetGuildHall(GetPlayerGuild(Player)) = 22 Then
		If GetPlayerGuildRank(Player) = 3 Then
			OpenDoor(135, 6, 6)
		Else
			PlayerMessage(Player, "Only Founders may open this vault.", White)
		End If
	End If
End If

End Sub