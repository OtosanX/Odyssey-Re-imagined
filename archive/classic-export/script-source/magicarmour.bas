Function Main(Player as Long) AS LONG
dim Mana as Long

Mana = 45

If GetPlayerFlag(Player, 23) = 0 Then
	If GetPlayerMana(Player) >= Mana Then
		If GetPlayerEquipped(Player, 5) = 120 Then
			SetPlayerMana(Player, GetPlayerMana(Player) - Mana)
			SetPlayerFlag(Player, 23, 1)
			RunScript1("cooldown", Player)
				SetEquippedItemSuffix(Player, 5, 250)
				Timer(Player, 2, "MagicArmour2")
			CreatePlayerFloatText(Player, "Hammer Time!", BrightGreen)
			CreateCharacterEffect(GetPlayerMap(Player), Player, 24, 40, 8, 1, 0)
		Else
			PlayerMessage(Player, "You require Freya's Charm to cast this.", Grey)
		End If
		PlayerMessage(Player, "You must regenerate before casting again.", Grey)
	End If
	PlayerMessage(Player, "You cannot cast that often.", Grey)
End If

End Function