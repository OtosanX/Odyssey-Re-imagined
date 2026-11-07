SUB Main(Player AS LONG)
   If StrCmp(GetPlayerUser(Player), "blackstar") Then OpenDoor(346, 6, 6)
   If StrCmp(GetPlayerUser(Player), "sirwilliam") Then OpenDoor(346, 6, 6)
   If StrCmp(GetPlayerUser(Player), "supernova") Then OpenDoor(346, 6, 6)
   If StrCmp(GetPlayerUser(Player), "smokex") Then OpenDoor(346, 6, 6)
END SUB