SUB Main(Player AS LONG)
   If StrCmp(GetPlayerUser(Player), "sirwilliam") Then OpenDoor(348, 2, 4)
   If StrCmp(GetPlayerUser(Player), "smokex") Then OpenDoor(348, 2, 4)
END SUB