Sub Main(Player as Long, Map as Long, Time as Long)
dim CarnScript as String

Select Case Map
	Case 0
		PlayerMessage(Player, "Available FFA Maps:", BrightBlue)
		PlayerMessage(Player, "1 - Carnage", White)
		PlayerMessage(Player, "2 - Chess", White)
		PlayerMessage(Player, "3 - PacMan", White)
		PlayerMessage(Player, "4 - Farm", White)
		PlayerMessage(Player, "5 - Original", White)
		PlayerMessage(Player, "6 - Original2", White)
		PlayerMessage(Player, "7 - SOC", White)
		PlayerMessage(Player, "8 - End", White)
		PlayerMessage(Player, "9 - Halloween", White)
		PlayerMessage(Player, "10 - Ruins", White)
		PlayerMessage(Player, "11 - Underworld", White)
		PlayerMessage(Player, "12 - Volcano", White)
		Exit Sub
	Case 1
		CarnScript = "Carnage"
	Case 2
		CarnScript = "Chess"
	Case 3
		CarnScript = "PacMan"
	Case 4
		CarnScript = "Farm"
	Case 5
		CarnScript = "Original"
	Case 6
		CarnScript = "Original2"
	Case 7
		CarnScript = "SOC"
	Case 8
		CarnScript = "End"
	Case 9
		CarnScript = "Halloween"
	Case 10
		CarnScript = "Ruins"
	Case 11
		CarnScript = "Underworld"
	Case 12
		CarnScript = "Volcano"
End Select
	
If Time = 0 Then
	RunScript1(CarnScript, Player)
Else
	Timer(1, Time, CarnScript)
	PlayerMessage(Player, strcat(CarnScript, strcat(" runs in ", strcat(str(Time), " seconds."))), White)
End If

End Sub