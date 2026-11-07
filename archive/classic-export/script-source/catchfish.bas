Function Main(Player as Long) AS LONG
dim Chance as Long, LowChance as Long

Chance = Random(1000) + 1
LowChance = Random(2500) + 1
If Random(200) = 1 Then
	PlayerMessage(Player, "A Water Sprite grabs your line and drags you under!", White)
'	SpawnMonster(1435, 195, 6, 4, 0)
	SetPlayerFlag(Player, 210, GetPlayerMap(Player))
	SetPlayerFlag(Player, 211, GetPlayerX(Player))
	SetPlayerFlag(Player, 212, GetPlayerY(Player))
	PlayerWarp(Player, 1435, 4, 5)
End If
Select Case Chance
	Case 1
	Select Case Random(7)
		Case 0
			GiveObj(Player, 124, 1)
			PlayerMessage(Player, "You got a Shadow Key!", Green)
		Case 1
			GiveObj(Player, 193, 1)
			PlayerMessage(Player, "You got an Elven Passage!",  Green)
		Case 2
			GiveObj(Player, 122, 1)
			PlayerMessage(Player, "You got a Crypt Key!", Green)
		Case 3
			GiveObj(Player, 226, 1)
			PlayerMessage(Player, "You got an Elder Key!", Green)
		Case 4
			GiveObj(Player, 227, 1)
			PlayerMessage(Player, "You got an Elder Key 2!", Green)
		Case 5
			GiveObj(Player, 246, 1)
			PlayerMessage(Player, "You got a Guardian Key!", Green)
		Case 6
			GiveObj(Player, 191, 1)
			PlayerMessage(Player, "You got an Ephemeral Key!", Green)
	End Select
End Select
			
Select Case LowChance
	Case 1
	Select Case Random(4)
		Case 0
			GiveObj(Player, 144, 1)
			PlayerMessage(Player, "You got some Wings of Zeus!", BrightGreen)
		Case 1
			GiveObj(Player, 159, 1)
			PlayerMessage(Player, "You got a Sun Blade!", BrightGreen)
		Case 2
			GiveObj(Player, 50, 1)
			PlayerMessage(Player, "You got the King's Boots!!", BrightGreen)
		Case 3
			GiveObj(Player, 166, 1)
			PlayerMessage(Player, "You got a Glass Stiletto!", BrightGreen)
	End Select
End Select

End Function