SUB Main(Player AS LONG)
If StrCmp(GetPlayerName(Player), "cowman") Then PlayerWarp(Player, 826, 1, 9)
If StrCmp(GetPlayerName(Player), "goatman") Then PlayerWarp(Player, 826, 1, 9)
END SUB