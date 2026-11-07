Sub Main(Player as Long)

If StrCmp(GetPlayerUser(Player), "Isaac") Then PlayerWarp(Player, 730, 2, 8)
If StrCmp(GetPlayerUser(Player), "Huesos") Then PlayerWarp(Player, 730, 2, 8)
If StrCmp(GetPlayerUser(Player), "Lakai") Then PlayerWarp(Player, 730, 2, 8)

End Sub