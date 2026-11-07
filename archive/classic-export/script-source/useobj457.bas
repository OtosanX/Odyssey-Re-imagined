Function Main(Player as Long) AS LONG
'Stout Potion Scroll

If HasObj(Player, 454) Then
	PlayerMessage(Player, "You copy the receipe into your Receipe Book.", White)
	SetPlayerFlag(Player, 141, 1)
	TakeObj(Player, 457, 1)
Else
	PlayerMessage(Player, "You'll need something to write this down on, the scroll is falling apart.", Grey)
End If

End Function