SUB Main(Player AS LONG)
   If StrCmp(GetPlayerUser(Player), "py2000") Then OpenDoor(1084, 3, 5)
END SUB