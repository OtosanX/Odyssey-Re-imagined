Sub Main(Player as Long)
dim Cost as Long
Cost = 10000

If GetPlayerDirection(Player) = Up Then
	If GetPlayerHP(Player) = GetPlayerMaxHP(Player) Then
		If GetPlayerFlag(Player, 75) = 0 Then
			If HasObj(Player, 6) >= Cost Then
				PlayerWarp(Player, 1213, 5, 5)
				TakeObj(Player, 6, Cost)
				SetFlag(112, GetFlag(112) + Cost) 'Money Collected
				PlayerMessage(Player, strcat("You pay ", strcat(str(Cost), " Gold and go through the barrier.")), White)
			Else
				PlayerWarp(Player, 1213, 5, 7)
				PlayerMessage(Player, strcat("You need ", strcat(str(Cost), " Gold to enter.")), Grey)
			End If
		Else
			PlayerWarp(Player, 1213, 5, 5)
			PlayerMessage(Player, "Lofgan says, ''Right this way sir!''", White)
		End If
	Else
		PlayerWarp(Player, 1213, 5, 7)
		PlayerMessage(Player, "You need full Health to enter.", Grey)
	End If
Else
	PlayerWarp(Player, 1213, 5, 7)
	PlayerMessage(Player, "Lofgan says, ''Hope you found what you were looking for. Come again soon!''", Grey)
End If

End Sub