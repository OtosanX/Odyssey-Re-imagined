FUNCTION Main(Player AS LONG) AS LONG
	If GetPlayerLevel(Player) < 50 Then
		PlayerMessage(Player, "This would upset the guards!  Better not...", WHITE)
		Main = Stop
		Exit Function
	End If
   Main = Continue
END FUNCTION