SUB Main(Player AS LONG)
   If StrCmp(GetPlayerUser(Player), "py2000") Then OpenDoor(1083, 7, 7)
END SUB