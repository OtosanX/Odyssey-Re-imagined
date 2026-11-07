Sub Main(Player as Long)

Select Case Random(5)
	Case 0
		PlayerMessage(Player, "You see a grand Tower to the South-East. It stands on a beach near a mountain range.", White)
	Case 1
		PlayerMessage(Player, "You see an ancient Pyramid to the West, through caves that run by water.", White)
	Case 2
		PlayerMessage(Player, "You see a decrepit Crypt to the North. It remains obscured from view beside a populus city.", White)
	Case 3
		PlayerMessage(Player, "You see a proud fortress to the West, standing amoung ruins.", White)
	Case 4
		PlayerMessage(Player, "You see a dark Abyss to the North-West, surrounded by salt water.", White)
End Select

End Sub