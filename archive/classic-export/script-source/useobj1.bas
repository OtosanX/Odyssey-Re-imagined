FUNCTION Main(Player AS LONG) AS LONG
	If GetPlayerMap(Player) = 678 Then
		PlayerMessage(Player, "Congratulations, you have equipped the Rusty Dagger!  You may now proceed to the next area.", BRIGHTGREEN)
	End If
   Main = Continue
END FUNCTION