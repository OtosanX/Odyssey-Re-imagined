Sub Main(Player as Long)
dim Chance as Long, Map as Long

Map = GetPlayerMap(Player)

PlayerMessage(Player, "You open your present and...!", White)
TakeObj(Player, 484, 1)
Chance = Random(9)

Select Case Chance
	Case 0
		GiveObj(Player, 50, 1)
		PlayerMessage(Player, "You got some King's Boots!", BrightGreen)
	Case 1
		GiveObj(Player, 306, 1)
		PlayerMessage(Player, "You got a Glass Shield!", BrightGreen)
	Case 2
		GiveObj(Player, 166, 1)
		PlayerMessage(Player, "You got a Glass Stiletto!", BrightGreen)
	Case 3
		GiveObj(Player, 135, 1)
		PlayerMessage(Player, "You got an Excalibur!", BrightGreen)
	Case 4
		GiveObj(Player, 450, 1)
		PlayerMessage(Player, "You got a Flamewave Sabre!!", BrightGreen)
	Case 5
		GiveObj(Player, 196, 1)
		PlayerMessage(Player, "You got a Staff of Wardos!", BrightGreen)
	Case 6
		GiveObj(Player, 195, 1)
		PlayerMessage(Player, "You got a Shield of Krogg!", BrightGreen)
	Case 7
		GiveObj(Player, 117, 1)
		PlayerMessage(Player, "You got a Soulbinders!", BrightGreen)
	Case 8
		GiveObj(Player, 197, 1)
		PlayerMessage(Player, "You got a Crown of Zeugg!", BrightGreen)
End Select

CreatePlayerFloatText(Player, "!!", BrightGreen)
CreateCharacterEffect(GetPlayerMap(Player), Player, 45, 40, 8, 0, 0)

End Sub