Function Main(Player as Long) AS LONG
dim Chance as Long, LowChance as Long

Chance = Random(100) + 1
LowChance = Random(500) + 1
If Random(100) = 1 Then
	PlayerMessage(Player, "A Stone Golem grabs you and pulls you into the wall!", White)
'	SpawnMonster(1437, 194, 8, 6, 0)
	SetPlayerFlag(Player, 210, GetPlayerMap(Player))
	SetPlayerFlag(Player, 211, GetPlayerX(Player))
	SetPlayerFlag(Player, 212, GetPlayerY(Player))
	PlayerWarp(Player, 1437, 5, 6)
End If
Select Case Chance
	Case 1
		'Amethyst
		GiveObj(Player, 82, 1)
		PlayerMessage(Player, "You mine an Amethyst!", Green)
	Case 2
		'Sapphire
		GiveObj(Player, 86, 1)
		PlayerMessage(Player, "You mine a Sapphire!", Green)
	Case 3
		'Emerald
		GiveObj(Player, 84, 1)
		PlayerMessage(Player, "You mine an Emerald!", Green)
	Case 4
		'Ruby
		GiveObj(Player, 85, 1)
		PlayerMessage(Player, "You mine a Ruby!", Green)
	Case 5
		'Diamond
		GiveObj(Player, 83, 1)
		PlayerMessage(Player, "You mine a Diamond!", Green)
	Case 6
		'Gold Nugget
		GiveObj(Player, 186, 1)
		PlayerMessage(Player, "You mine a Gold Nugget!", Green)
	Case Else
		Select Case LowChance
			Case 1
				'Perfect Diamond
				GiveObj(Player, 434, 1)
				PlayerMessage(Player, "You mine a Perfect Diamond!!", BrightGreen)
			Case 2
				'Shining Ruby
				GiveObj(Player, 435, 1)
				PlayerMessage(Player, "You mine a Shining Ruby!!", BrightGreen)
			Case 3
				'Clear Emerald
				GiveObj(Player, 441, 1)
				PlayerMessage(Player, "You mine a Clear Emerald!!", BrightGreen)
			Case 4
				'Bright Sapphire
				GiveObj(Player, 438, 1)
				PlayerMessage(Player, "You mine a Bright Sapphire!!", BrightGreen)
			Case 5
				'Shined Amethyst
				GiveObj(Player, 458, 1)
				PlayerMessage(Player, "You mine a Cut Amethyst!!", BrightGreen)
			Case 6
				'10 Gold Nuggets
				GiveObj(Player, 186, 10)
				PlayerMessage(Player, "You mine 10 Gold Nuggets!!", BrightGreen)
		End Select
End Select

End Function