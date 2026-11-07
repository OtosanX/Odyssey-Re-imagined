FUNCTION Main(Player AS LONG) AS LONG
dim Chance as Long, Map as Long

Map = GetPlayerMap(Player)

TakeObj(Player, 515, 1)
Chance = Random(8)

Select Case Chance
	Case 0
		GiveObj(Player, 347, 1)
		GlobalMessage(StrCat(GetPlayerName(Player), " opened a Duck Treasure and got a Frost Reaver!"), BrightGreen)
	Case 1
		GiveObj(Player, 237, 1)
		GlobalMessage(StrCat(GetPlayerName(Player), " opened a Duck Treasure and got a Hammer of Frost!"), BrightGreen)
	Case 2
		GiveObj(Player, 230, 1)
		GlobalMessage(StrCat(GetPlayerName(Player), " opened a Duck Treasure and got a Guardian Plate!"), BrightGreen)
	Case 3
		GiveObj(Player, 240, 1)
		GlobalMessage(StrCat(GetPlayerName(Player), " opened a Duck Treasure and got a Guardian Helm!"), BrightGreen)
	Case 4
		GiveObj(Player, 349, 1)
		GlobalMessage(StrCat(GetPlayerName(Player), " opened a Duck Treasure and got a Last Stand!"), BrightGreen)
	Case 5
		GiveObj(Player, 247, 1)
		GlobalMessage(StrCat(GetPlayerName(Player), " opened a Duck Treasure and got a Aegis!"), BrightGreen)
	Case 6
		GiveObj(Player, 516, 1)
		GlobalMessage(StrCat(GetPlayerName(Player), " opened a Duck Treasure and got a Duck Blade!"), BrightGreen)
	Case 7
		GiveObj(Player, 517, 1)
		GlobalMessage(StrCat(GetPlayerName(Player), " opened a Duck Treasure and got a Duck Armor!"), BrightGreen)
	Case Else
		GiveObj(Player, 347, 1)
		GlobalMessage(StrCat(GetPlayerName(Player), " opened a Duck Treasure and got a Frost Reaver!"), BrightGreen)
End Select

CreatePlayerFloatText(Player, "!!!", BrightGreen)
CreateCharacterEffect(GetPlayerMap(Player), Player, 45, 40, 8, 0, 0)

END FUNCTION