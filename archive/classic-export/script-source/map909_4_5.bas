Sub Main(Player as Long)

If GetGuildHall(GetPlayerGuild(Player)) = 44 Then
	OpenDoor(909, 3, 4)
	OpenDoor(909, 4, 4)
	PlayerMessage(Player, "Sailor says, ''Right this way.''", White)
End If

End Sub