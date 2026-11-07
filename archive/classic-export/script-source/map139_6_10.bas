Function Main(Player as Long) AS LONG

If HasObj(Player, 390) = 0 Then
	PlayerWarp(Player, 139, 7, 10)
	PlayerMessage(Player, "You say, ''If only I had a raft...''", Grey)
Else
	If GetPlayerHP(Player) = GetPlayerMaxHP(Player) Then
		Main = Continue
		If GetPlayerDirection(Player) = Left Then
			PlayerMessage(Player, "You hop on your raft", Grey)
		End If
	Else
		PlayerMessage(Player, "You need full health to traverse the current!", Grey)
		PlayerWarp(Player, 139, 7, 10)
	End If
End If

End Function