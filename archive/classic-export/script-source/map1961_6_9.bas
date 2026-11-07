Sub Main(Player as Long)

If GetPlayerDirection(Player) = Up Then
	If GetPlayerGuild(Player) = 0 Then
		PlayerWarp(Player, 1961, 6, 10)
		PlayerMessage(Player, "You must be guilded to enter this arena.", Grey)
	End If
End If

If GetPlayerDirection(Player) = Down Then
	If GetPlayerHP(Player) <> GetPlayerMaxHP(Player) Then
		PlayerWarp(Player, 1961, 6, 8)
		PlayerMessage(Player, "You must have full health to leave this arena.", Grey)
	End If
End If

End Sub