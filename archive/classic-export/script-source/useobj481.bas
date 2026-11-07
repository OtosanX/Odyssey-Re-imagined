Function Main(Player as Long) AS LONG

If GetFlag(122) = 1 Then
	If GetPlayerFlag(Player, 220) > 0 Then
		PlayerMessage(Player, strcat("Your ticket number is ", str(GetPlayerFlag(Player, 220))), White)
	Else
		PlayerMessage(Player, "You have not entered the lottery.", Grey)
	End If
Else
	PlayerMessage(Player, "Lottery is not open.", Grey)
End If

End Function