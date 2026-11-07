FUNCTION Main(Player AS LONG, Value AS LONG) AS LONG
	If HasObj(Player, 413) + Value > 5 Then
		PlayerMessage(Player, "You can't carry anymore Holy Waters!", GREY)
	Else
		Main = Continue
	End If
END FUNCTION
