SUB Main(Player AS LONG)
   If StrCmp(GetPlayerUser(Player), "fang") Then OpenDoor(1262, 8, 5)
   If StrCmp(GetPlayerUser(Player), "fangbank") Then OpenDoor(1262,8, 5)
If StrCmp(GetPlayerUser(Player), "gage") Then OpenDoor(1262, 8, 5)
 END SUB