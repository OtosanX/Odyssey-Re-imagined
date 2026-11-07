Sub Main(Player as Long)
dim Hall as Long
Hall = GetGuildHall(GetPlayerGuild(Player))

If GetPlayerGuild(Player) > 0 Then
	If Hall >= 17 & Hall <= 20 Then OpenDoor(450, 0, 9)
End If

End Sub