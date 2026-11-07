FUNCTION Main(Player AS LONG) AS LONG
If GetPlayerAccess(Player) = 0 Then
	PlayerMessage(Player, "Space Waster!", WHITE)
	Main = Stop
Else
	Main = Continue
End If

END FUNCTION