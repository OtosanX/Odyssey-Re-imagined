Function Main(Player as Long, Target as Long) AS LONG
dim Loop as Long, Count as Long

If GetPlayerFlag(Player, 201) > 0 Then
	If GetPlayerFlag(Player, 202) = 1 Then
		For Loop = 1 To GetMaxUsers()
			If GetPlayerFlag(Loop, 201) = GetPlayerFlag(Player, 201) Then Count = Count + 1
			If Count >= 10 Then 
				PlayerMessage(Player, "Your Party is full.", Grey)
				Exit Function
			End If
		Next Loop
		If GetPlayerFlag(Target, 203) = GetPlayerFlag(Player, 201) Then
			PlayerMessage(Player, strcat("You have already invited ", strcat(GetPlayerName(Target), " to your party.")), Grey)
		Else
			PlayerMessage(Player, strcat("You have invited ", strcat(GetPlayerName(Target), " to your Party.")), White)
			PlayerMessage(Target, strcat(GetPlayerName(Player), " has invited you to their Party. Type /party join."), White)
			SetPlayerFlag(Target, 203, GetPlayerFlag(Player, 201))
		End If
	Else
		PlayerMessage(Player, "You are not Leader of the Party.", Grey)
	End If
Else
	PlayerMessage(Player, "You are not in a Party.", Grey)
End If

End Function