Sub Main(Player as Long)
dim Cost1 as Long, Cost2 as Long, Cost3 as Long, Cost4 as Long
dim Cost5 as Long, Cost6 as Long, Cost7 as Long

Cost1 = 150 - Divide(GetFlag(130), 400) 'Lumber
Cost2 = 150 - Divide(GetFlag(131), 400) 'Coarse Ore
Cost3 = 300 - Divide(GetFlag(132), 160) 'Flawed Ore
Cost4 = 1000 - Divide(GetFlag(133), 20) 'Pure Ore
Cost5 = 150 - Divide(GetFlag(134), 400) 'Small Fish
Cost6 = 300 - Divide(GetFlag(135), 160) 'Medium Fish
Cost7 = 1000 - Divide(GetFlag(136), 20) 'Big Fish
If Cost1 < 75 Then Cost1 = 75
If Cost2 < 75 Then Cost2 = 75
If Cost3 < 150 Then Cost3 = 150
If Cost4 < 500 Then Cost4 = 500
If Cost5 < 75 Then Cost5 = 75
If Cost6 < 150 Then Cost6 = 150
If Cost7 < 500 Then Cost7 = 500

PlayerMessage(Player, "==Skills Market==", Yellow)

PlayerMessage(Player, "Item - Ammount - Buy/Sell Price per item", White)
PlayerMessage(Player, strcat("1. Lumber - ", strcat(str(GetFlag(130)), strcat(" - ", strcat(str(Cost1), strcat("/", str(Cost1 - 10)))))), Grey)
PlayerMessage(Player, "---", Grey)
PlayerMessage(Player, strcat("2. Coarse Ore - ", strcat(str(GetFlag(131)), strcat(" - ", strcat(str(Cost2), strcat("/", str(Cost2 - 10)))))), Grey)
PlayerMessage(Player, strcat("3. Flawed Ore - ", strcat(str(GetFlag(132)), strcat(" - ", strcat(str(Cost3), strcat("/", str(Cost3 - 50)))))), Grey)
PlayerMessage(Player, strcat("4. Pure Ore - ", strcat(str(GetFlag(133)), strcat(" - ", strcat(str(Cost4), strcat("/", str(Cost4 - 100)))))), Grey)
PlayerMessage(Player, "---", Grey)
PlayerMessage(Player, strcat("5. Small Fish - ", strcat(str(GetFlag(134)), strcat(" - ", strcat(str(Cost5), strcat("/", str(Cost5 - 10)))))), Grey)
PlayerMessage(Player, strcat("6. Medium Fish - ", strcat(str(GetFlag(135)), strcat(" - ", strcat(str(Cost6), strcat("/", str(Cost6 - 50)))))), Grey)
PlayerMessage(Player, strcat("7. Big Fish - ", strcat(str(GetFlag(136)), strcat(" - ", strcat(str(Cost7), strcat("/", str(Cost7 - 100)))))), Grey)
PlayerMessage(Player, "/market buy <Item Number> <Ammount>", DarkGrey)
PlayerMessage(Player, "/market sell <Item Number> <Ammount>", DarkGrey)

End Sub