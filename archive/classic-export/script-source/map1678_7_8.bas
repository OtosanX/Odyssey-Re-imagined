SUB Main(Player AS LONG)
   If StrCmp(GetPlayerUser(Player), "acidman") Then OpenDoor(1678, 7, 7)
 If StrCmp(GetPlayerUser(Player), "t3st3r2") Then OpenDoor(1678, 7, 7)
 END SUB