SUB Main(Player AS LONG)
   If StrCmp(GetPlayerUser(Player), "ffta") Then OpenDoor(1269, 6, 8)
   If StrCmp(GetPlayerUser(Player), "sigma") Then OpenDoor(1269, 6, 8)
   If StrCmp(GetPlayerUser(Player), "twem") Then OpenDoor(1269, 6, 8)
END SUB