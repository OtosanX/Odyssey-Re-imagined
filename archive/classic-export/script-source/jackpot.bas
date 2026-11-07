Sub Main(Player AS LONG)
	'GlobalMessage(StrCat("Current Odyssey Jackpot Fund:  ", Str(GetFlag(123))), WHITE)
	
	If Random(100) = 77 Then
		GlobalMessage("*********************** JACKPOT *********************** ", BRIGHTGREEN)
		GlobalMessage(StrCat(GetPlayerName(Player), StrCat(" has hit the lucky #77 and won the Odyssey Lottery Commission's Jackpot Fund of ", Str(GetFlag(123)))), WHITE)
		GlobalMessage("*********************** JACKPOT *********************** ", BRIGHTGREEN)
		GiveObj(Player, 6, GetFlag(123))
		SetFlag(123, 0)
	End If
End Sub