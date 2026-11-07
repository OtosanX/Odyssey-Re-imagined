Sub Main(Player as Long)

If strcmp(GetPlayerUser(Player), "Carrera") Then OpenDoor(1430, 6, 9)
If strcmp(GetPlayerUser(Player), "Xin") Then OpenDoor(1430, 6, 9)

End Sub