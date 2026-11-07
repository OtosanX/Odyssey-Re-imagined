SUB Main(Player AS LONG)
	If StrCmp(GetPlayerName(Player), "haze") | StrCmp(GetPlayerName(Player), "BuMy") Then
		OpenDoor(775, 5, 8)
	End If
END SUB