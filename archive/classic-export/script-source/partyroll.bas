Function Main(Player as Long) AS LONG
dim Loop as Long

If GetPlayerFlag(Player, 201) > 0 Then
	If GetPlayerFlag(Player, 202) = 1 Then
		PlayerMessage(Player, "=Party Dice Rolls=", Yellow)
		For Loop = 1 To GetMaxUsers()
			If GetPlayerFlag(Loop, 201) = GetPlayerFlag(Player, 201) Then
				PlayerMessage(Player, strcat(GetPlayerName(Loop), strcat(" - ", str(Random(100) + 1))), Grey)
			End If
		Next Loop
	Else
		PlayerMessage(Player, "You are not Leader of the Party.", Grey)
	End If
Else
	PlayerMessage(Player, "You are not in a party.", Grey)
End If

End Function