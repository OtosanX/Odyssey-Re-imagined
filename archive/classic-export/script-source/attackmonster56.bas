Function Main(Player as LONG) AS LONG
	If GetPlayerLevel(Player) < 50 Then
		PlayerMessage(Player, "Have you lost your marbles?  You are far too weak to take on Odyssey's finest patrol guards!", WHITE)
		Main = Stop
		Exit Function
	End If
	
	Main = Continue
End Function