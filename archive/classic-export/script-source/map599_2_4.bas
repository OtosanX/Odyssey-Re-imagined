SUB Main(Player AS LONG)
If StrCmp(GetPlayerUser(Player), "overdose") Then OpenDoor(599, 2, 5)
END SUB