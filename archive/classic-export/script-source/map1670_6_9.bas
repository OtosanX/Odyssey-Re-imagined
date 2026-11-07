SUB Main(Player AS LONG)
   If StrCmp(GetPlayerUser(Player), "acidman") Then OpenDoor(1670, 6, 8)
 If StrCmp(GetPlayerUser(Player), "t3st3r2") Then OpenDoor(1670, 6, 8)
 END SUB