SUB Main(Player AS LONG)
   If StrCmp(GetPlayerUser(Player), "py2000") Then OpenDoor(1081, 1, 8)
END SUB