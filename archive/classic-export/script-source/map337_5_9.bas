SUB Main(Player AS LONG)
If StrCmp(GetPlayerUser(Player), "overdose") Then OpenDoor(337, 5, 8)
END SUB