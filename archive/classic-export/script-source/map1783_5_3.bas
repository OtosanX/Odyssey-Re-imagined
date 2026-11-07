Sub Main(Player as Long)

If StrCmp(GetPlayerUser(Player), "kramew") Then OpenDoor(1783, 5, 2)
If StrCmp(GetPlayerName(Player), "Ehrlich") Then OpenDoor(1783, 5, 2)

End Sub