SUB Main(Player AS LONG)
	If StrCmp(GetPlayerName(Player), "PRETTYPRINCESS") Then OpenDoor(770, 1, 7)
	If StrCmp(GetPlayerName(Player), "Progs") Then OpenDoor(770, 1, 7)
END SUB