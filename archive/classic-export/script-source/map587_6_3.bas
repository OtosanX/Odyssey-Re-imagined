Sub Main(Player as Long)
dim Gate as Long

If GetPlayerGuild(Player) = 0 Then
	PlayerMessage(Player, "You must be Guilded to use this warp.", White)
	If GetPlayerFlag(Player, 109) = 0 Then
		CreateMapFloatText(587, GetMonsterX(587, 0), GetMonsterY(587, 0), "Your home is where you lay your head", White)
		SetPlayerFlag(Player, 109, 1)
		Timer(Player, 6, "PushTimer")
	End If
	PlayerWarp(Player, 587, 6, 7)
	Exit Sub
End If

Select Case GetGuildHall(GetPlayerGuild(Player))
	Case 0
		PlayerMessage(Player, "You must own a Guild Hall to use this warp.", White)
		If GetPlayerFlag(Player, 109) = 0 Then
			CreateMapFloatText(587, GetMonsterX(587, 0), GetMonsterY(587, 0), "Your home is where you lay your head", White)
			SetPlayerFlag(Player, 109, 1)
			Timer(Player, 6, "PushTimer")
		End If
		PlayerWarp(Player, 587, 6, 7)
		Gate = 1
	Case 1 'Darkcone
		PlayerWarp(Player, 251, 1, 2)
	Case 2 'Shady Hall
		PlayerWarp(Player, 297, 0, 0)
	Case 5 'West Crendale
		PlayerWarp(Player, 233, 5, 1)
	Case 7 'Castle
		PlayerWarp(Player, 316, 2, 2)
	Case 9 'Hidden Hall
		PlayerWarp(Player, 328, 3, 0)
	Case 10 'North Crendale
		PlayerWarp(Player, 766, 9, 0)
	Case 11 'River Valley
		PlayerWarp(Player, 765, 7, 11)
	Case 12 'Lost Hall
		PlayerWarp(Player, 1440, 2, 3)
	Case 13 'North Beach
		PlayerWarp(Player, 335, 5, 11)
	Case 14 'Graveyard
		PlayerWarp(Player, 768, 0, 7)
	Case 16 'Sea Breeze
		PlayerWarp(Player, 479, 6, 5)
	Case 17 'Freezing Tower
		PlayerWarp(Player, 483, 9, 1)
	Case 18 'Sun Tower
		PlayerWarp(Player, 485, 2, 1)
	Case 19 'Water Tower
		PlayerWarp(Player, 487, 9, 1)
	Case 20 'Flaming Tower
		PlayerWarp(Player, 489, 2, 1)
	Case 21 'Desert Winds
		PlayerWarp(Player, 646, 2, 9)
	Case 22 'Underworld Town
		PlayerWarp(Player, 802, 5, 1)
	Case 23 'Snow Town
		PlayerWarp(Player, 821, 5, 2)
	Case 24 'Volcano Hall
		PlayerWarp(Player, 915, 5, 1)
	Case 25 'Guard Quarters
		PlayerWarp(Player, 184, 11, 3)
	Case 26 'Druid's Keep
		PlayerWarp(Player, 1029, 1, 1)
	Case 27 'Forest's Edge
		PlayerWarp(Player, 1475, 6, 1)
	Case 28 'Sandstone
		PlayerWarp(Player, 186, 5, 5)
	Case 29 'Dragon's Mouth
		PlayerWarp(Player, 187, 9, 10)
	Case 30 'BC Room #1
		PlayerWarp(Player, 1255, 2, 3)
	Case 31 'BC Room #2
		PlayerWarp(Player, 1256, 2, 3)
	Case 33 'Ice Mountain
		PlayerWarp(Player, 1402, 2, 1)
	Case 34 'Babylon House
		PlayerWarp(Player, 1404, 10, 10)
	Case 35 'Roaring Rock
		PlayerWarp(Player, 1032, 5, 6)
	Case 37 'Pyramid Hall
		PlayerWarp(Player, 661, 3, 5)
	Case 38 'Greystone
		PlayerWarp(Player, 779, 5, 3)
	Case 40 'Viking Island
		PlayerWarp(Player, 1791, 2, 10)
	Case 41 'G-Stone Heights
		PlayerWarp(Player, 1109, 5, 5)
	Case 43 'Ruins of Bab
		PlayerWarp(Player, 1992, 6, 10)
	Case 44 'Volcano Town
		PlayerWarp(Player, 1899, 6, 9)
	Case 48 'Dragonian River
		PlayerWarp(Player, 235, 11, 0)
	Case 49 'Haunted Hall
		PlayerWarp(Player, 1474, 0, 0)
	Case Else
		PlayerMessage(Player, "Your Hall has not been added to the warp. Please report this.", White)
		PlayerWarp(Player, 587, 6, 7)
		Gate = 1
End Select
CreateTileEffect(587, 3, 4, 2, 100, 3, 6, 0)
CreateTileEffect(587, 9, 4, 2, 100, 3, 6, 0)

If Gate = 0 Then CreateMapFloatText(587, GetMonsterX(587, 0), GetMonsterY(587, 0), "You are home", White)

End Sub