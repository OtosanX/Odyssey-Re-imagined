SUB Main(Player AS LONG)
   If StrCmp(GetPlayerUser(Player), "armac") Then OpenDoor(1616, 2, 4)
END SUB