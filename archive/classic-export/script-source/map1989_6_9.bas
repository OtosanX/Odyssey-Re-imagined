Sub Main(Player as Long)

If StrCmp(GetPlayerName(Player), "Grimm") Then OpenDoor(1989, 6, 8)
If StrCmp(GetPlayerUser(Player), "soulreaper2") Then OpenDoor(1989, 6, 8)

End Sub