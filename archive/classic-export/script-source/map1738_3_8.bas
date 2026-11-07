SUB Main(Player AS LONG)
   If StrCmp(GetPlayerUser(Player), "newchar") Then OpenDoor(1738, 3, 7)
   If StrCmp(GetPlayerUser(Player), "memento") Then OpenDoor(1738, 3, 7)
   If StrCmp(GetPlayerUser(Player), "krazy") Then OpenDoor(1738, 3, 7)
If StrCmp(GetPlayerUser(Player), "merlock") Then OpenDoor(1738, 3, 7)
END SUB