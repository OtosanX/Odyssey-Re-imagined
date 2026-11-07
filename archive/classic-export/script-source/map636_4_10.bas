Sub Main(Player as Long)

If strcmp(GetPlayerUser(Player), "lax") Then OpenDoor(636, 4, 9)
If strcmp(GetPlayerUser(Player), "citrus") Then OpenDoor(636, 4, 9)

End Sub