Function Main(Player as Long) AS LONG
dim Mana as Long

Mana = 20

If GetPlayerFlag(Player, 94) = 0 Then
	If GetPlayerMana(Player) >= Mana Then
		SetPlayerMana(Player, GetPlayerMana(Player) - Mana)
		SetPlayerFlag(Player, 94, 1)
		PlayerMessage(Player, "You store enough energy to tap into the minds of others.", Yellow)
	Else
		PlayerMessage(Player, "You must regenerate before casting.", Grey)
	End If
Else
	PlayerMessage(Player, "You have already stored enough energy.", Grey)
End If

End Function