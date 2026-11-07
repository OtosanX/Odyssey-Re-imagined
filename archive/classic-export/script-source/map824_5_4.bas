SUB Main(Player AS LONG)
   If StrCmp(GetPlayerUser(Player), "xxmegadethxx") Then OpenDoor(824, 5, 3)
   If StrCmp(GetPlayerUser(Player), "deathblow") Then OpenDoor(824, 5, 3)
END SUB