Function Main(Player as Long) as Long

If RunScript1("EnergyRation", Player) = 1 Then
	PlayerMessage(player, "You can not carry more than five energy boosters.", Grey)
	Main = Stop
Else
	Main = Continue
End If

End Function