Function Main(Player as Long) AS LONG

''CTF Name Change
If GetPlayerLevel(Player) = 1 Then
	If StrLen(GetPlayerDesc(Player)) >= 3 & StrLen(GetPlayerDesc(Player)) <= 15 Then
		If strcmp(GetPlayerDesc(Player), "") Then
			PlayerMessage(Player, "Your description is not set.", Grey)
		Else
			SetPlayerName(Player, GetPlayerDesc(Player))
		End If
	Else
		PlayerMessage(Player, "You're description must be between 3 and 15 letters.", Grey)
	End If
Else
	PlayerMessage(Player, "You must be level 1 to use this item.", Grey)
	TakeObj(Player, 497, 1)
End If

End Function