SUB Main(Player AS LONG)
   If StrCmp(GetPlayerUser(Player), "ffta") Then PlayerWarp(Player, 1269, 2, 2)
   If StrCmp(GetPlayerUser(Player), "sigma") Then PlayerWarp(Player, 1269, 2, 2)
END SUB