Sub Main(Player as Long)
dim Mana as Long
'Cleric Self Heal

If GetPlayerFlag(Player, 23) = 1 Then
PlayerMessage(Player, "Cooling down.", Grey)
exit sub
end if

SetPlayerFlag(Player, 23, 1)
Timer(Player, 3, "Cooldown")

Mana = 25

If GetPlayerMana(Player) < Mana Then
	PlayerMessage(Player, "You must regenerate before casting.", Grey)
	Exit Sub
End If



SetPlayerMana(Player, GetPlayerMana(Player) - Mana)

CreateCharacterEffect(GetPlayerMap(Player), Player, 31, 30, 8, 1, 0)
Timer(Player, 1, "heal2")

End Sub