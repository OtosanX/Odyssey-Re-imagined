Sub Main(Player as Long)

If StrCmp(GetPlayerName(Player), "Grimm") Then OpenDoor(1986, 6, 5)
If StrCmp(GetPlayerUser(Player), "soulreaper2") Then OpenDoor(1986, 6, 5)

End Sub