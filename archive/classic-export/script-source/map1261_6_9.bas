SUB Main(Player AS LONG)
   If StrCmp(GetPlayerUser(Player), "kai") Then OpenDoor(1261, 6, 8)
'   If StrCmp(GetPlayerUser(Player), "jerry") Then OpenDoor(1261, 6, 8)
END SUB