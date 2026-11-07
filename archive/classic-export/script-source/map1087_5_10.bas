SUB Main(Player AS LONG)
   If StrCmp(GetPlayerUser(Player), "py2000") Then OpenDoor(1087, 5, 9)
END SUB