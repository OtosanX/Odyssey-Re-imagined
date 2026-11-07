Sub Main(Player as Long)

If StrCmp(GetPlayerUser(Player), "kramew") Then OpenDoor(1783, 6, 2)
If StrCmp(GetPlayerName(Player), "Ehrlich") Then OpenDoor(1783, 6, 2)

End Sub