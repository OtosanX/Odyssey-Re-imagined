FUNCTION Main(Player AS LONG, Value AS LONG) AS LONG
	If HasObj(Player, 408) + Value > 3 Then
		PlayerMessage(Player, "You can't carry anymore Nightfall Dust!", GREY)
	Else
		Main = Continue
	End If
END FUNCTION