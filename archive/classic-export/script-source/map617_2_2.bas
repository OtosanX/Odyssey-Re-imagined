Sub Main(Player as Long)

PlayerWarp(Player, 619, 5, 4)
SetPlayerFlag(Player, 10, 15)
SetPlayerFlag(Player, 12, 0)


If GetFlag(139) = 0 Then
	If GetMapPlayerCount(619) >= 2 Then
		RunScript0("SancGame1Start")
		MapMessage(619, "Fire Catcher has started!", Yellow)
	Else
		PlayerMessage(Player, "You have joined Fire Catcher! The game will begin when enough players have joined.", White)
	End If
Else
	PlayerMessage(Player, "You have joined Fire Catcher!", White)
End If

End Sub