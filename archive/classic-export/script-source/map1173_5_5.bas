Sub Main(Player as Long)

If StrCmp(GetPlayerUser(Player), "Garrot") Then PlayerWarp(Player, 1173, 3, 5)
If StrCmp(GetPlayerUser(Player), "Calvin") Then PlayerWarp(Player, 1173, 3, 5)

End Sub