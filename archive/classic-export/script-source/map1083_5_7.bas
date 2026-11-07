SUB Main(Player AS LONG)
   If StrCmp(GetPlayerUser(Player), "armac") Then OpenDoor(1083, 4, 7)
END SUB