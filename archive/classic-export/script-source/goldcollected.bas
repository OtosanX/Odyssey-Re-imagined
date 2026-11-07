Sub Main(Player as Long)

PlayerMessage(Player, "==Gold Collected==", Yellow)
PlayerMessage(Player, strcat("Drag Energy Potion - ", strcat(str(GetFlag(111)), " Gold.")), White)
PlayerMessage(Player, strcat("Bab Incog Shop - ", strcat(str(GetFlag(112)), " Gold.")), White)
PlayerMessage(Player, strcat("Training Parties - ", strcat(str(GetFlag(113)), " Gold.")), White)
PlayerMessage(Player, strcat("Total = ", strcat(str(GetFlag(111) + GetFlag(112) + GetFlag(113)), " Gold.")), White)
PlayerMessage(Player, strcat("The Odyssey Lottery Jackpot Fund is ", strcat(str(GetFlag(123)), " Gold!")), Grey)

End Sub