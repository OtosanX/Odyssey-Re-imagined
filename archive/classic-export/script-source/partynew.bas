Function Main(Player as Long) AS LONG
dim X as Long, Loop as Long, Cost as Long
Cost = 5000

If GetPlayerFlag(Player, 201) = 0 Then
	If HasObj(Player, 6) >= Cost Then
	   X = 0
	Start:
	   X = X + 1
	   For Loop = 1 To GetMaxUsers()
		  If GetPlayerFlag(Loop, 201) = X Then
			 GoTo Start
		  End If
	   Next Loop
	   TakeObj(Player, 6, Cost)
	   SetFlag(113, GetFlag(113) + Cost) 'Gold Collected
	   SetPlayerFlag(Player, 201, X)
	   SetPlayerFlag(Player, 202, 1)
	   PlayerMessage(Player, "You have created a Party!", Yellow)
	   PlayerMessage(Player, "Type /party invite <player> to invite others to join.", Grey)
	Else
		PlayerMessage(Player, strcat("It costs ", strcat(str(Cost), " Gold to start a Party.")), Grey)
	End If
Else
	PlayerMessage(Player, "You are already in a Party.", Grey)
End If

End Function