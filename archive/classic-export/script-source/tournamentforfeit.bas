Sub Main(Player as Long)
dim Loop as Long, Winner as Long

SetPlayerFlag(Player, 10, 0)
SetPlayerFlag(Player, 11, 0)
PlayerWarp(Player, 1883, 5, 11)

For Loop = 1 To GetMaxUsers()
	If GetPlayerFlag(Loop, 10) = 14 Then
		If GetPlayerFlag(Loop, 11) = 1 Then Winner = Loop
	End If
Next Loop

MapMessage(1883, strcat(GetPlayerName(Player), strcat(" forfeits the match. ", strcat(GetPlayerName(Winner), " wins by default!"))), Yellow)

Select Case GetFlag(170)
	Case 1
		PlayerWarp(Winner, 1883, 2, 6)
		RunScript0("TournamentRound2")
	Case 2
		PlayerWarp(Winner, 1883, 4, 6)
		RunScript0("TournamentRound3")
	Case 3
		PlayerWarp(Winner, 1883, 6, 6)
		RunScript0("TournamentRound4")
	Case 4
		PlayerWarp(Winner, 1883, 8, 6)
		RunScript0("TournamentRound5")
	Case 5
		PlayerWarp(Winner, 1883, 4, 6)
		RunScript0("TournamentRound6")
	Case 6
		PlayerWarp(Winner, 1883, 6, 6)
		RunScript0("TournamentRound7")
	Case 7
		RunScript1("TournamentWin", Winner)
End Select

End Sub