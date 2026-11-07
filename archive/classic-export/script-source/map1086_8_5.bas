SUB Main(Player AS LONG)
   If StrCmp(GetPlayerUser(Player), "misquelito") Then OpenDoor(1086, 7, 5)
   If StrCmp(GetPlayerUser(Player), "michael") Then OpenDoor(1086, 7, 5)
   If StrCmp(GetPlayerUser(Player), "vandal") Then OpenDoor(1086, 7, 5)
   If StrCmp(GetPlayerUser(Player), "armach") Then OpenDoor(1086, 7, 5)
   If StrCmp(GetPlayerUser(Player), "py2000") Then OpenDoor(1086, 7, 5)
END SUB