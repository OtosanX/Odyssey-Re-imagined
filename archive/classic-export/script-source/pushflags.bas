Sub Main(Player AS LONG)
	If StrCmp(GetPlayerName(Player), "MaxwellWin") Then SetPlayerFlag(Player, 76, 1)
	If StrCmp(GetPlayerName(Player), "Enzo") Then SetPlayerFlag(Player, 76, 1)
End Sub