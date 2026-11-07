Function Main(Player as Long, Parm1 as Long) AS Long

Select Case Parm1	
	Case 1 'Cren
		PlayerWarp(Player, 2, 5, 5)
	Case 2 'Soc River
		PlayerWarp(Player, 107, 6, 2)
	Case 3 'Dragonia
		PlayerWarp(Player, 104, 7, 6)
	Case 4 'Babylon
		PlayerWarp(Player, 1206, 6, 8)
	Case 5 'Desert - Tombs
		PlayerWarp(Player, 139, 2, 9)
	Case 6 'Desert - Heros
		PlayerWarp(Player, 1585, 5, 7)
	Case 7 'CVR River
		PlayerWarp(Player, 16, 7, 3)
	Case 8 'Volcanic Island
		PlayerWarp(Player, 910, 5, 7)
	Case 9 'Shadecall Bog
		PlayerWarp(Player, 1314, 8, 6)
	Case 10 'Fishing Event
		PlayerWarp(Player, 1435, 11, 5)
	Case 11 'Mining Event
		PlayerWarp(Player, 1437, 11, 5)
	Case 12 'Lumber Event
		PlayerWarp(Player, 1438, 11, 5)
	Case 13 'The Sanctuary
		PlayerWarp(Player, 583, 5, 7)
	Case 14 'Champ 1
		PlayerWarp(Player, 1828, 0, 2)
	Case 15 'Champ 2
		PlayerWarp(Player, 1829, 0, 2)
	Case Else
		PlayerMessage(Player, "==Minor God Warp Points==", Yellow)
		PlayerMessage(Player, "1 - Crendale", White)
		PlayerMessage(Player, "2 - Soc River", White)
		PlayerMessage(Player, "3 - Dragonia", White)
		PlayerMessage(Player, "4 - Babylon", White)
		PlayerMessage(Player, "5 - Desert - Tombs", White)
		PlayerMessage(Player, "6 - Desert - Heros", White)
		PlayerMessage(Player, "7 - CVR River", White)
		PlayerMessage(Player, "8 - Volcanic Island", White)
		PlayerMessage(Player, "9 - Shadecall Bog", White)
		PlayerMessage(Player, "10 - Fishing Event", White)
		PlayerMessage(Player, "11 - Mining Event", White)
		PlayerMessage(Player, "12 - Lumber Event", White)
		PlayerMessage(Player, "13 - The Sanctuary", White)
		PlayerMessage(Player, "14 - Champ 1", White)
		PlayerMessage(Player, "15 - Champ 2", White)
End Select

End Function