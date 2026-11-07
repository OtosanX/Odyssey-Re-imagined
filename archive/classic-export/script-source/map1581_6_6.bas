SUB Main(Player AS LONG)
   If StrCmp(GetPlayerUser(Player), "MarsPhoenix") Then PlayerWarp(Player, 1581, 6, 8)
   If StrCmp(GetPlayerUser(Player), "Dragoons") Then PlayerWarp(Player, 1581, 6, 8)
If StrCmp(GetPlayerUser(Player), "DragoonsThief") Then PlayerWarp(Player, 1581, 6, 8)
END SUB