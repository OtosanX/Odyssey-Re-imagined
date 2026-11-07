Sub Main(Player as Long)

If strcmp(GetPlayerUser(Player), "Chaos") Then OpenDoor(1504, 5, 7)
If strcmp(GetPlayerUser(Player), "Hyperlide") Then OpenDoor(1504, 5, 7)

End Sub