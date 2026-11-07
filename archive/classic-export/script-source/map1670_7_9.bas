SUB Main(Player AS LONG)
   If StrCmp(GetPlayerUser(Player), "acidman") Then OpenDoor(1670, 7, 8)
 If StrCmp(GetPlayerUser(Player), "t3st3r2") Then OpenDoor(1670, 7, 8)
 END SUB