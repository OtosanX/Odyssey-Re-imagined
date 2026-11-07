Function Main(Player as Long) AS LONG

If GetPlayerHP(Player) = GetPlayerMaxHP(Player) Then
	Main = Continue
Else
	PlayerWarp(Player, 1580, 5, 1)
	PlayerMessage(Player, "You require full health to enter.", Grey)
End If

End Function