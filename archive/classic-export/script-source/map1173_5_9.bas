Sub Main(Player as Long)

If StrCmp(GetPlayerUser(Player), "Garrot") Then OpenDoor(1173, 5, 8)
If StrCmp(GetPlayerUser(Player), "Calvin") Then OpenDoor(1173, 5, 8)

End Sub