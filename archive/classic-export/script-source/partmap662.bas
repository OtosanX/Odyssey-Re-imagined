Function Main(Player as Long) AS LONG

If HasObj(Player, 463) | GetPlayerEquipped(Player, 1) = 463 Then
	PlayerMessage(Player, "Cundi says, ''That is a staff of much potential, take it to an ancient church to unleash its true power.''", Grey)
End If

End Function	