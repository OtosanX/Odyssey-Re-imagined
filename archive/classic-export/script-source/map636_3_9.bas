Sub Main(Player as Long)

If strcmp(GetPlayerUser(Player), "lax") Then OpenDoor(636, 3, 8)
If strcmp(GetPlayerUser(Player), "citrus") Then OpenDoor(636, 3, 8)

End Sub