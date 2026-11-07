Function Main(Player as Long) AS LONG
dim Mana as Long
'Absorb - Mage Spell
Mana = 45

If GetPlayerFlag(Player, 23) = 0 Then
	If GetPlayerMana(Player) >= Mana Then
		If GetPlayerEquipped(Player, 5) = 120 Then
			SetPlayerMana(Player, GetPlayerMana(Player) - Mana)
			SetPlayerFlag(Player, 23, 1)
			RunScript1("SpellCooldown", Player)
				SetEquippedItemSuffix(Player, 5, 250)
				Timer(Player, 30, "MagicArmour2")
			CreatePlayerFloatText(Player, "Os Mose!", BrightGreen)
			CreateCharacterEffect(GetPlayerMap(Player), Player, 58, 40, 8, 1, 0)
		Else
			PlayerMessage(Player, "You require Freya's Charm.", Grey)
		End If
	Else
		PlayerMessage(Player, "You must regenerate before casting.", Grey)
	End If
Else
	PlayerMessage(Player, "You must wait to cast again.", Grey)
End If

End Function