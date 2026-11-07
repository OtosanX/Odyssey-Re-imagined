SUB Main(Player AS LONG)
   If StrCmp(GetPlayerUser(Player), "MarsPhoenix") Then PlayerWarp(Player, 1596, 5, 8)
   If StrCmp(GetPlayerUser(Player), "Dash88") Then PlayerWarp(Player, 1596, 5, 8)
END SUB