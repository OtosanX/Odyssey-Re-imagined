Sub Main(Player AS LONG, Status AS LONG)

'Temporarily Disabled
Exit Sub

	If GetPlayerStatus(Player) = 1 Then
		PlayerMessage(Player, "You currently have a PK status which overrides your name color!", YELLOW)
		Exit Sub
	End If

If GetPlayerFlag(Player, 10) > 0 Then Exit Sub

	If GetPlayerFlag(Player, 131) > 0 Then
		If Status = 9 Then Status = 0
		If Status = 1 Then Status = 0
		If Status < 24 Then
			SetPlayerStatus(Player, Status)
			SetPlayerFlag(Player, 133, Status)
		Else
			PlayerMessage(Player, "Valid statuses are 1 - 23!", YELLOW)
		End If
	Else
		PlayerMessage(Player, "You do not have this command.  Purchase it from the store!", YELLOW)
	End If
End Sub