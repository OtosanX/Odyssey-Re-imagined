Sub Main(Player as Long)

If strcmp(GetPlayerUser(Player), "Carrera") Then OpenDoor(1430, 5, 6)
If strcmp(GetPlayerUser(Player), "Xin") Then OpenDoor(1430, 5, 6)

End Sub