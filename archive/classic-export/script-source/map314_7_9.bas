SUB Main(Player AS LONG)
   If StrCmp(GetPlayerUser(Player), "Peter") Then OpenDoor(314, 7, 8)
END SUB