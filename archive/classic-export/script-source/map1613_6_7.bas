SUB Main(Player AS LONG)
   If StrCmp(GetPlayerUser(Player), "Billie_joe") Then OpenDoor(1613, 6, 8)
END SUB