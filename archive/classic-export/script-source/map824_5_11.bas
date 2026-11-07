SUB Main(Player AS LONG)
   If StrCmp(GetPlayerUser(Player), "xxmegadethxx") Then OpenDoor(824, 5, 10)
   If StrCmp(GetPlayerUser(Player), "deathblow") Then OpenDoor(824, 5, 10)
END SUB