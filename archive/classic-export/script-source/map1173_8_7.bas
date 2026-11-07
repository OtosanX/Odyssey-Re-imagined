Sub Main(Player as Long)

If StrCmp(GetPlayerUser(Player), "Garrot") Then PlayerWarp(Player, 1173, 8, 9)
If StrCmp(GetPlayerUser(Player), "Calvin") Then PlayerWarp(Player, 1173, 8, 9)

End Sub