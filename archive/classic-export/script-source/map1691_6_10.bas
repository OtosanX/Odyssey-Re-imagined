SUB Main(Player AS LONG)

	If StrCmp(GetPlayerUser(Player), "brandon") Then OpenDoor(1691, 6, 9)
	If StrCmp(GetPlayerUser(Player), "captainmarco") Then OpenDoor(1691, 6, 89)
	If StrCmp(GetPlayerUser(Player), "wish") Then OpenDoor(1691, 6, 9)
	If StrCmp(GetPlayerUser(Player), "jeromeb") Then OpenDoor(1691, 6, 9)
	If StrCmp(GetPlayerUser(Player), "awsq") Then OpenDoor(1691, 6, 9)

END SUB