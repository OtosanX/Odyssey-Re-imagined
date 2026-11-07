SUB Main(Player AS LONG)
   If StrCmp(GetPlayerUser(Player), "sirwilliam") Then OpenDoor(348, 9, 3)
   If StrCmp(GetPlayerUser(Player), "smokex") Then OpenDoor(348, 9, 3)
END SUB