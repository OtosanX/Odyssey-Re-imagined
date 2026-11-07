Sub Main(Player as Long)

If StrCmp(GetPlayerUser(Player), "travisabrown") Then PlayerWarp(Player, 533, 9, 7)
If StrCmp(GetPlayerUser(Player), "jug") Then PlayerWarp(Player, 533, 9, 7)

End Sub