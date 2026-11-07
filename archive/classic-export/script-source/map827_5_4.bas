SUB Main(Player AS LONG)
If StrCmp(GetPlayerName(Player), "cowman") Then PlayerWarp(Player, 827, 5, 2)
If StrCmp(GetPlayerName(Player), "goatman") Then PlayerWarp(Player, 827, 5, 2)
END SUB