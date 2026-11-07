SUB Main(Player AS LONG)
   If StrCmp(GetPlayerUser(Player), "newchar") Then OpenDoor(1738, 5, 8)
   If StrCmp(GetPlayerUser(Player), "memento") Then OpenDoor(1738, 5, 8)
   If StrCmp(GetPlayerUser(Player), "krazy") Then OpenDoor(1738, 5, 8)
If StrCmp(GetPlayerUser(Player), "MERLOCK") Then OpenDoor(1738, 5, 8)
END SUB