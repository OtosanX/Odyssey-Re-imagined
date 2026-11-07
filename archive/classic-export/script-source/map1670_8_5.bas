SUB Main(Player AS LONG)
   If StrCmp(GetPlayerUser(Player), "acidman") Then OpenDoor(1670, 8, 4)
 If StrCmp(GetPlayerUser(Player), "t3st3r2") Then OpenDoor(1670, 8, 4)
 END SUB