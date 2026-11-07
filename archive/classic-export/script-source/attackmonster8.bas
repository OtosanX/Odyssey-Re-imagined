Function Main(Player as Long) as Long

If HasObj(Player, 466) Then
	PlayerMessage(Player, "You milk the cow!", White)
	TakeObj(Player, 466, 1)
	GiveObj(Player, 464, 1)
	SetPlayerFlag(Player, 240, 6)
	Main = Stop
Else
	If HasObj(Player, 464) Then
		PlayerMessage(Player, "You already have milk.", Grey)
		Main = Continue
	Else
		PlayerMessage(Player, "You attempt to milk the cow...and fail.", White)
		Main = Continue
	End If
End If

End Function