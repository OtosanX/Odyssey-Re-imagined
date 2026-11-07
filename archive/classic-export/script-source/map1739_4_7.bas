SUB Main(Player AS LONG)
   If StrCmp(GetPlayerUser(Player), "newchar") Then OpenDoor(1739, 4, 6)
   If StrCmp(GetPlayerUser(Player), "loco6") Then OpenDoor(1739, 4, 6)
   If StrCmp(GetPlayerUser(Player), "krazy") Then OpenDoor(1739, 4, 6)
If StrCmp(GetPlayerUser(Player), "merlock") Then OpenDoor(1739, 4, 6)
END SUB