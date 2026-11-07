SUB Main(Player AS LONG)
   If StrCmp(GetPlayerUser(Player), "mystix") Then OpenDoor(1078, 10, 1)
   If StrCmp(GetPlayerUser(Player), "sobe") Then OpenDoor(1078, 10, 1)
   If StrCmp(GetPlayerUser(Player), "overdose") Then OpenDoor(1078, 10, 1)
END SUB