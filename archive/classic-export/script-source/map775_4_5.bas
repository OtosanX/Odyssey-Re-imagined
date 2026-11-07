SUB Main(Player AS LONG)
	If StrCmp(GetPlayerName(Player), "haze") | StrCmp(GetPlayerName(Player), "BuMy") Then
		PlayerWarp(Player, 775, 4, 3)
	End If
END SUB