Function Main(Player as Long) AS LONG
dim Mana as Long
'Test Tile Buff

	If GetPlayerMana(Player) >= Mana Then
		
			SetPlayerMana(Player, GetPlayerMana(Player) - Mana)
				SetEquippedItemSuffix(Player, 3, 250)
				Timer(Player, 30, "testbuff")
			CreatePlayerFloatText(Player, "Os Mose!", BrightGreen)
			CreateCharacterEffect(GetPlayerMap(Player), Player, 58, 40, 8, 1, 0)

		End If

		PlayerMessage(Player, "You must regenerate before casting.", Grey)


	PlayerMessage(Player, "You must wait to cast again.", Grey)


End Function