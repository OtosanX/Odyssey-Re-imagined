Function Main(Player as Long) AS LONG
dim Chance as Long

Chance = Random(1000) + 1
If Random(100) = 1 Then
	PlayerMessage(Player, "A Wood Ent drags you in with its branches!", White)
'	SpawnMonster(1438, 185, 5, 5, 0)
	SetPlayerFlag(Player, 210, GetPlayerMap(Player))
	SetPlayerFlag(Player, 211, GetPlayerX(Player))
	SetPlayerFlag(Player, 212, GetPlayerY(Player))
	PlayerWarp(Player, 1438, 5, 9)
End If


If GetPlayerMap(Player) = 623 Then
Chance = Random(500) + 1
	If Chance = 1 | Chance = 2 | Chance = 3 Then
		'Candy Apple
		If RunScript1("Ration", Player) = 0 & RunScript1("Invent", Player) = 0 Then
			GiveObj(Player, 41, 1)
		Else
			SpawnObject(GetPlayerMap(Player), 41, 1, GetPlayerX(Player), GetPlayerY(Player))
		End If
		PlayerMessage(Player, "An Apple falls from the tree!! A Candy Apple...", BrightGreen)
	End If
Else
	Select Case Chance
		Case 1
			'50 Lumber
			GiveObj(Player, 215, 50)
			PlayerMessage(Player, "You chop 50 Lumber!", White)
		Case 2
			'100 Lumber
			GiveObj(Player, 215, 100)
			PlayerMessage(Player, "You chop 100 Lumber!", White)
		Case 3
			'Candy Apple
			If RunScript1("Ration", Player) = 0 & RunScript1("Invent", Player) = 0 Then
				GiveObj(Player, 41, 1)
			Else
				SpawnObject(GetPlayerMap(Player), 41, 1, GetPlayerX(Player), GetPlayerY(Player))
			End If
			PlayerMessage(Player, "An Apple falls from the tree!! A Candy Apple...", BrightGreen)
	End Select
End If

End Function