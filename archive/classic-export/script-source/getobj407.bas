FUNCTION Main(Player AS LONG, Value AS LONG) AS LONG
	If HasObj(Player, 407) + Value > 5 Then
		PlayerMessage(Player, "You can't carry anymore Blinding Powder!", GREY)
	Else
		Main = Continue
	End If
END FUNCTION