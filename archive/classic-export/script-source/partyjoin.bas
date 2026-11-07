Function Main(Player as Long) AS LONG
dim Loop as Long, Count as Long

If GetPlayerFlag(Player, 201) = 0 Then
	If GetPlayerFlag(Player, 203) > 0 Then
		For Loop = 1 To GetMaxUsers()
			If GetPlayerFlag(Loop, 201) = GetPlayerFlag(Player, 203) Then Count = Count + 1
			If Count >= 10 Then 
				PlayerMessage(Player, "That Party is full.", Grey)
				Exit Function
			End If
		Next Loop
		SetPlayerFlag(Player, 201, GetPlayerFlag(Player, 203))
		SetPlayerFlag(Player, 203, 0)
		PlayerMessage(Player, "You have joined a Party!", Yellow)
		PlayerMessage(Player, "To leave the party type /party leave.", White)
		RunScript1("partylist", Player)
		For Loop = 1 To GetMaxUsers()
			If Player <> Loop Then
				If GetPlayerFlag(Loop, 201) = GetPlayerFlag(Player, 201) Then
					PlayerMessage(Loop, strcat(GetPlayerName(Player), " has joined your Party."), White)
				End If
			End If
		Next Loop
	Else
		PlayerMessage(Player, "You have not been invited to a Party.", Grey)
	End If
Else
	PlayerMessage(Player, "You are already in a Party.", Grey)
End If

End Function