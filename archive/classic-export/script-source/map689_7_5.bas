SUB Main(Player AS LONG)
   If StrCmp(GetPlayerUser(Player), "desteen") Then PlayerWarp(Player, 689, 7, 3)
   If StrCmp(GetPlayerUser(Player), "hennet2") Then PlayerWarp(Player, 689, 7, 3)
END SUB