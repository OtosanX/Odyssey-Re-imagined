Sub Main(Player as Long)
dim Chance as Long, Map as Long

Map = GetPlayerMap(Player)

PlayerMessage(Player, "You open Lavos' Chest and...!", White)
TakeObj(Player, 602, 1)
Chance = Random(17)

Select Case Chance
	Case 0
		GiveObj(Player, 237, 1)
		PlayerMessage(Player, "You find a Hammer of Frost!", BrightGreen)
		Globalmessage(strcat(getplayername(player), " finds a Hammer of Frost in the Lavos Chest!!!"), BRIGHTRED)

	Case 1
		GiveObj(Player, 237, 1)
		PlayerMessage(Player, "You find a Hammer of Frost!", BrightGreen)
		Globalmessage(strcat(getplayername(player), " finds a Hammer of Frost in the Lavos Chest!!!"), BRIGHTRED)
	Case 2
		GiveObj(Player, 237, 1)
		PlayerMessage(Player, "You find a Hammer of Frost!", BrightGreen)
		Globalmessage(strcat(getplayername(player), " finds a Hammer of Frost in the Lavos Chest!!!"), BRIGHTRED)
	
	Case 3
		GiveObj(Player, 237, 1)
		PlayerMessage(Player, "You find a Hammer of Frost!", BrightGreen)
		Globalmessage(strcat(getplayername(player), " finds a Hammer of Frost in the Lavos Chest!!!"), BRIGHTRED)

	Case 4
		GiveObj(Player, 237, 1)
		PlayerMessage(Player, "You find a Hammer of Frost!", BrightGreen)
		Globalmessage(strcat(getplayername(player), " finds a Hammer of Frost in the Lavos Chest!!!"), BRIGHTRED)

	Case 5
		GiveObj(Player, 237, 1)
		PlayerMessage(Player, "You find a Hammer of Frost!", BrightGreen)
		Globalmessage(strcat(getplayername(player), " finds a Hammer of Frost in the Lavos Chest!!!"), BRIGHTRED)

	Case 6
		GiveObj(Player, 230, 1)
		PlayerMessage(Player, "You find a Guardian Plate", BrightGreen)
		Globalmessage(strcat(getplayername(player), " finds a Guardian Plate in the Lavos Chest!!!"), BRIGHTRED)

	Case 7
		GiveObj(Player, 240, 1)
		PlayerMessage(Player, "You find a Guardian Helm", BrightGreen)
		Globalmessage(strcat(getplayername(player), " finds a Guardian Helm in the Lavos Chest!!!"), BRIGHTRED)

	Case 8
		GiveObj(Player, 240, 1)
		PlayerMessage(Player, "You find a Guardian Helm!", BrightGreen)
		Globalmessage(strcat(getplayername(player), " finds a Guardian Helm in the Lavos Chest!!!"), BRIGHTRED)

	Case 9
		GiveObj(Player, 601, 1)
		PlayerMessage(Player, "You find a Lavos' Necklace!", BrightGreen)
		Globalmessage(strcat(getplayername(player), " finds a Lavos' Necklace in the Lavos Chest!!!"), BRIGHTRED)
	Case 10
		GiveObj(Player, 240, 1)
		PlayerMessage(Player, "You find a Guardian Helm", BrightGreen)
		Globalmessage(strcat(getplayername(player), " finds a Guardian Helm in the Lavos Chest!!!"), BRIGHTRED)

	Case 11
		GiveObj(Player, 240, 1)
		PlayerMessage(Player, "You find a Guardian Helm!", BrightGreen)
		Globalmessage(strcat(getplayername(player), " finds a Guardian Helm in the Lavos Chest!!!"), BRIGHTRED)

	Case 12
		GiveObj(Player, 230, 1)
		PlayerMessage(Player, "You find a Guardian Plate!", BrightGreen)
		Globalmessage(strcat(getplayername(player), " finds a Guardian Plate in the Lavos Chest!!!"), BRIGHTRED)

	Case 13
		GiveObj(Player, 230, 1)
		PlayerMessage(Player, "You find a Guardian Plate!", BrightGreen)
		Globalmessage(strcat(getplayername(player), " finds a Guardian Plate in the Lavos Chest!!!"), BRIGHTRED)

	Case 14
		GiveObj(Player, 230, 1)
		PlayerMessage(Player, "You find a Guardian Plate", BrightGreen)
		Globalmessage(strcat(getplayername(player), " finds a Guardian Plate in the Lavos Chest!!!"), BRIGHTRED)

	Case 15
		GiveObj(Player, 230, 1)
		PlayerMessage(Player, "You find a Guardian Plate", BrightGreen)
		Globalmessage(strcat(getplayername(player), " finds a Guardian Plate in the Lavos Chest!!!"), BRIGHTRED)

	Case 16
		GiveObj(Player, 230, 1)
		PlayerMessage(Player, "You find a Guardian Plate", BrightGreen)
		Globalmessage(strcat(getplayername(player), " finds a Guardian Plate in the Lavos Chest!!!"), BRIGHTRED)

	
End Select

CreatePlayerFloatText(Player, "!!", BrightGreen)
CreateCharacterEffect(GetPlayerMap(Player), Player, 45, 40, 8, 0, 0)

End Sub