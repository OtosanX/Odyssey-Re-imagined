Sub Main(Player as Long, Map as Long, Time as Long)
Dim CarnScript as String

Select Case Map
	Case 0
		PlayerMessage(Player, "Available Team Maps:", BrightBlue)
		PlayerMessage(Player, "1 - Fortress", White)
		PlayerMessage(Player, "2 - Winter", White)
		PlayerMessage(Player, "3 - Swamp", White)
		PlayerMessage(Player, "4 - Space", White)
		PlayerMessage(Player, "5 - Cavern", White)
		PlayerMessage(Player, "6 - City", White)
		Exit Sub
	Case 1
		CarnScript = "FortressCarn"
	Case 2
		CarnScript = "WinterCarn"
	Case 3
		CarnScript = "SwampCarn"
	Case 4
		CarnScript = "SpaceCarn"
	Case 5
		CarnScript = "CavernCarn"
	Case 6
		CarnScript = "CityCarn"
End Select

If Time = 0 Then
	RunScript1(CarnScript, Player)
Else
	Timer(1, Time, CarnScript)
	PlayerMessage(Player, strcat(CarnScript, strcat(" runs in ", strcat(str(Time), " seconds."))), White)
End If

End Sub