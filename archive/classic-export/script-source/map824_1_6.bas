SUB Main(Player AS LONG)
   If StrCmp(GetPlayerUser(Player), "xxmegadethxx") Then OpenDoor(824, 1,7)
   If StrCmp(GetPlayerUser(Player), "deathblow") Then OpenDoor(824, 1, 7)
END SUB