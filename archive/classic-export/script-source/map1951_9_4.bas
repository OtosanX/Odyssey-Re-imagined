SUB Main(Player AS LONG)
   If StrCmp(GetPlayerUser(Player), "newchar") Then OpenDoor(1951, 9, 3)
   If StrCmp(GetPlayerUser(Player), "memento") Then OpenDoor(1951, 9, 3)
   If StrCmp(GetPlayerUser(Player), "krazy") Then OpenDoor(1951, 9, 3)
If StrCmp(GetPlayerUser(Player), "merlock") Then OpenDoor(1951, 9, 3)
END SUB