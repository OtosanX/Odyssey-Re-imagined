SUB Main(Player AS LONG)
   If StrCmp(GetPlayerUser(Player), "blackstar") Then OpenDoor(1830, 5, 4)
   If StrCmp(GetPlayerUser(Player), "sirwilliam") Then OpenDoor(1830, 5, 4)
   If StrCmp(GetPlayerUser(Player), "supernova") Then OpenDoor(1830, 5, 4)
   If StrCmp(GetPlayerUser(Player), "smokex") Then OpenDoor(1830, 5, 4)
END SUB