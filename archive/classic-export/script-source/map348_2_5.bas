SUB Main(Player AS LONG)
   If StrCmp(GetPlayerUser(Player), "sirwilliam") Then OpenDoor(348, 3, 5)
   If StrCmp(GetPlayerUser(Player), "smokex") Then OpenDoor(348, 3, 5)
END SUB