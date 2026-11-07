SUB Main(Player AS LONG)
   If StrCmp(GetPlayerUser(Player), "Dragoons") Then PlayerWarp(Player, 1597, 10, 5)
   If StrCmp(GetPlayerUser(Player), "MarsPhoenix") Then PlayerWarp(Player, 1597, 10, 5)
END SUB