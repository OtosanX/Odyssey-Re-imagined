Function Main(Player as Long) AS LONG
dim Colour as Long

PlayerMessage(Player, "==Quest Log==", Yellow)

'NOVICE ERRANDS
PlayerMessage(Player, "Crendale", White)

If GetPlayerFlag(Player, 91) = 0 Then Colour = Red Else Colour = BrightGreen
PlayerMessage(Player, "-Lumberjack", Colour)

'INTERMEDIATE ERRANDS
PlayerMessage(Player, "Dragonia", White)

If GetPlayerFlag(Player, 93) = 0 Then Colour = Red Else Colour = BrightGreen
PlayerMessage(Player, "-Alchemy", Colour)

If GetPlayerFlag(Player, 92) = 0 Then Colour = Red
If GetPlayerFlag(Player, 92) > 0 & GetPlayerFlag(Player, 92) < 5 Then Colour = Yellow
If GetPlayerFlag(Player, 92) = 5 Then Colour = BrightGreen
PlayerMessage(Player, "-Gibberish", Colour)

'SANCTUARY ERRANDS
PlayerMessage(Player, "Sanctuary", White)

If GetPlayerFlag(Player, 242) = 0 Then Colour = Red
If GetPlayerFlag(Player, 242) > 0 & GetPlayerFlag(Player, 242) < 6 Then Colour = Yellow
If GetPlayerFlag(Player, 242) >= 6 Then Colour = BrightGreen
PlayerMessage(Player, "-Trapper Joe", Colour)

If GetPlayerFlag(Player, 240) = 0 Then Colour = Red
If GetPlayerFlag(Player, 240) > 0 & GetPlayerFlag(Player, 240) < 7 Then Colour = Yellow
If GetPlayerFlag(Player, 240) >= 7 Then Colour = BrightGreen
PlayerMessage(Player, "-Manny Farmer", Colour)

If GetPlayerFlag(Player, 243) = 0 Then Colour = Red
If GetPlayerFlag(Player, 243) > 0 & GetPlayerFlag(Player, 243) < 6 Then Colour = Yellow
If GetPlayerFlag(Player, 243) >= 6 Then Colour = BrightGreen
PlayerMessage(Player, "-Sanctuary Wench", Colour)

If GetPlayerFlag(Player, 241) = 0 Then Colour = Red
If GetPlayerFlag(Player, 241) > 0 & GetPlayerFlag(Player, 241) < 6 Then Colour = Yellow
If GetPlayerFlag(Player, 241) >= 6 Then Colour = BrightGreen
PlayerMessage(Player, "-Thelonious Monk", Colour)

PlayerMessage(Player, strcat("Sanctuary Tasks Completed: ", str(GetPlayerFlag(Player, 244))), White)

End Function