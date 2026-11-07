Function Main(Player as Long) AS LONG
'Vigorous Potion Scroll

If HasObj(Player, 454) Then
	PlayerMessage(Player, "You copy the receipe into your Receipe Book.", White)
	SetPlayerFlag(Player, 140, 1)
	TakeObj(Player, 456, 1)
Else
	PlayerMessage(Player, "You'll need something to write this down on, the scroll is falling apart.", Grey)
End If

End Function