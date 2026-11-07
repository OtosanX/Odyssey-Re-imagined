Sub Main(Player as Long)

If StrCmp(GetPlayerUser(Player), "Garrot") Then OpenDoor(1173, 8, 1)
If StrCmp(GetPlayerUser(Player), "Calvin") Then OpenDoor(1173, 8, 1)

End Sub