SUB Main(Player AS LONG)
If StrCmp(GetPlayerName(Player), "cowman") Then PlayerWarp(Player, 826, 6, 2)
If StrCmp(GetPlayerName(Player), "goatman") Then PlayerWarp(Player, 826, 6, 2)
End Sub