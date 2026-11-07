SUB Main(Player AS LONG)
   If StrCmp(GetPlayerUser(Player), "Peter") Then OpenDoor(314, 8, 8)
END SUB