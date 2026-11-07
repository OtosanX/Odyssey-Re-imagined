SUB Main(Player AS LONG)
   If StrCmp(GetPlayerUser(Player), "MarsPhoenix") Then PlayerWarp(Player, 1595, 1, 3)
   If StrCmp(GetPlayerUser(Player), "Dragoons") Then PlayerWarp(Player, 1595, 1, 3)


END SUB