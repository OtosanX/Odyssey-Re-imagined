SUB Main(Player AS LONG)
	If StrCmp(GetPlayerUser(Player), "trick") Then OpenDoor(742,6,7)
	If StrCmp(GetPlayerUser(Player), "benenen") Then OpenDoor(742,6,7)
END SUB