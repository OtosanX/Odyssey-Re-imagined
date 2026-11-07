Sub Main(Player as Long)

If StrCmp(GetPlayerUser(Player), "travisabrown") Then OpenDoor(533, 6, 8)
If StrCmp(GetPlayerUser(Player), "jug") Then OpenDoor(533, 6, 8)

End Sub