Function Main(Player as Long, Target as Long) AS LONG

If GetPlayerFlag(Player, 201) > 0 Then
	If GetPlayerFlag(Player, 202) = 1 Then
		If GetPlayerFlag(Player, 201) = GetPlayerFlag(Target, 201) Then
			SetPlayerFlag(Target, 201, 0)
			PlayerMessage(Player, strcat("You have booted ", strcat(GetPlayerName(Target), " from the Party.")), White)
			PlayerMessage(Target, "You have been booted from the Party.", White)
			Exit Function
		Else
			PlayerMessage(Player, "That player is not in your Party.", Grey)
		End If
	Else
		PlayerMessage(Player, "You are not Leader of the Party.", Grey)
	End If
Else
	PlayerMessage(Player, "You are not in a Party.", Grey)
End If

End Function