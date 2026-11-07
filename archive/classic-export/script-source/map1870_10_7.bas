Sub Main(Player as Long)

If strcmp(GetPlayerUser(Player), "tyu") Then OpenDoor(1870, 10, 6)
If strcmp(GetPlayerUser(Player), "ville") Then OpenDoor(1870, 10, 6)

End Sub