Sub Main(Player as Long)
dim Health as Long
If HasObj(Player, 41) Then	'Candy Apple - 20hp
	TakeObj(Player, 41, 1)
	Health = 20
Else
	If HasObj(Player, 330) Then	'Fish Stew - 18hp
		TakeObj(Player, 330, 1)
		Health = 18
	Else
		If HasObj(Player, 138) Then	'Kank's Cake - 15hp
			TakeObj(Player, 138, 1)
			Health = 15
		Else
			If HasObj(Player, 198) Then	'Cookie - 15hp
				TakeObj(Player, 198, 1)
				Health = 15
			Else
				If HasObj(Player, 149) Then	'Witch's Brew - 15hp
					TakeObj(Player, 149, 1)
					Health = 15
				Else
					If HasObj(Player, 329) Then	'Fish Cakes - 12hp
						TakeObj(Player, 329, 1)
						Health = 12
					Else
						If HasObj(Player, 99) Then	'Ancient Tome - 12hp
							TakeObj(Player, 99, 1)
							Health = 12
						Else
							If HasObj(Player, 48) Then	'Sushi - 6hp
								TakeObj(Player, 48, 1)
								Health = 6
							Else
								If HasObj(Player, 39) Then	'HP Potion - 5hp
									TakeObj(Player, 39, 1)
									Health = 5
								Else
									PlayerMessage(Player, "You have no Health Potions to use.", Grey)
									Exit Sub
								End If
							End If
						End If
					End If
				End If
			End If
		End If
	End If
End If

SetPlayerHP(Player, GetPlayerHP(Player) + Health)
If GetPlayerHP(Player) > GetPlayerMaxHP(Player) Then SetPlayerHP(Player, GetPlayerMaxHP(Player))
CreatePlayerFloatText(Player, str(Health), BrightGreen)

End Sub