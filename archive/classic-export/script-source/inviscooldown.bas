Function Main(Player as Long) AS LONG

Select Case GetPlayerClass(Player)
	Case 1
		Timer(Player, 18, "Cooldown2")
	Case 2
		Timer(Player, 18, "Cooldown2")
	Case 3
		Timer(Player, 18, "Cooldown2")
	Case 4
		Timer(Player, 18, "Cooldown2")
End Select

End Function