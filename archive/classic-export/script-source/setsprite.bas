Sub Main(Player AS LONG, Sprite AS LONG)

'Temporarily Disabled
Exit Sub

If GetPlayerFlag(Player, 10) > 0 Then Exit Sub
If GetPlayerHP(Player) < GetPlayerMaxHP(Player) Then
	PlayerMessage(Player, "You require full HP to set your sprite.", Grey)
	Exit Sub
End If

If GetPlayerFlag(Player, 130) > 0 Then
	If Sprite < 216 Then
		SetPlayerSprite(Player, Sprite)
		SetPlayerFlag(Player, 132, Sprite)
	Else
		PlayerMessage(Player, "Valid sprites are 1 - 215!", YELLOW)
	End If
Else
	PlayerMessage(Player, "You do not have this command.  Purchase it from the store!", YELLOW)
End If
	
End Sub