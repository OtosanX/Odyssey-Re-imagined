FUNCTION Main(Player AS LONG) AS LONG
dim Chance as Long, Map as Long

Map = GetPlayerMap(Player)

PlayerMessage(Player, "You open your present and...!", White)
TakeObj(Player, 513, 1)
Chance = Random(4)

Select Case Chance
	Case 0
		GiveObj(Player, 248, 1)
		PlayerMessage(Player, StrCat(GetPlayerName(Player), " opened a Duck Present and got a Hero's Guard!"), BrightGreen)
	Case 1
		GiveObj(Player, 250, 1)
		PlayerMessage(Player, StrCat(GetPlayerName(Player), " opened a Duck Present and got a Ztiwshborflail!"), BrightGreen)
	Case 2
		GiveObj(Player, 196, 1)
		PlayerMessage(Player, StrCat(GetPlayerName(Player), " opened a Duck Present and got a Staff of Wardos!"), BrightGreen)
	Case 3
		GiveObj(Player, 96, 1)
		PlayerMessage(Player, StrCat(GetPlayerName(Player), " opened a Duck Present and got a Axe of the Ruin!"), BrightGreen)
	Case Else
		GiveObj(Player, 248, 1)
		PlayerMessage(Player, StrCat(GetPlayerName(Player), " opened a Duck Present and got a Hero's Guard!"), BrightGreen)
End Select

CreatePlayerFloatText(Player, "!!!", BrightGreen)
CreateCharacterEffect(GetPlayerMap(Player), Player, 45, 40, 8, 0, 0)

END FUNCTION