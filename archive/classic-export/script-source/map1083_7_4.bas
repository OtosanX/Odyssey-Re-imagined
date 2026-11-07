SUB Main(Player AS LONG)
   If StrCmp(GetPlayerUser(Player), "py2000") Then OpenDoor(1083, 8, 4)
   If StrCmp(GetPlayerUser(Player), "dorigurl1021") Then OpenDoor(1083, 8, 4)
END SUB