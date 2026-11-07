SUB Main(Player AS LONG)
   If StrCmp(GetPlayerUser(Player), "BaD") Then OpenDoor(331, 2, 4)
END SUB