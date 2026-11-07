Sub Main(Player as Long)

If strcmp(GetPlayerUser(Player), "lax") Then OpenDoor(636, 2, 7)
If strcmp(GetPlayerUser(Player), "citrus") Then OpenDoor(636, 2, 7)

End Sub