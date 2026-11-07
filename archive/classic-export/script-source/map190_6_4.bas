Function Main(Player as Long) AS LONG

If HasObj(Player, 448) >= 400 Then
	TakeObj(Player, 448, 400)
	GiveObj(Player, 237, 1)
	PlayerMessage(Player, "You throw the Devilkin Metals into the forge, and watch as they take the form of a Hammer of Frost", Yellow)
	Exit Function
Else
	PlayerMessage(Player, "You hear a voice coming from the flames of the forge, ''Bring me many metals of great strength and I shall show you unrivaled power.''", Grey)
End If

End Function