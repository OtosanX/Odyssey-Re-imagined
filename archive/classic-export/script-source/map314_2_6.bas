SUB Main(Player AS LONG)
   If StrCmp(GetPlayerUser(Player), "Peter") Then OpenDoor(314, 2, 7)
END SUB