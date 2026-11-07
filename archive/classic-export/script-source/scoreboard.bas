Sub Main(Player as Long)

PlayerMessage(Player, "=Scoreboard=", Yellow)
PlayerMessage(Player, "1. Fire Catcher", White)
PlayerMessage(Player, strcat("You have won ", strcat(str(GetPlayerFlag(Player, 225)), " games of Fire Catcher.")), Grey)
PlayerMessage(Player, "2. Snowball Tag", White)
PlayerMessage(Player, strcat("You have lost ", strcat(str(GetPlayerFlag(Player, 226)), strcat("/", strcat(str(GetPlayerFlag(Player, 227)), " games of Snowball Tag.")))), Grey)
PlayerMessage(Player, "3. Game 3", White)

End Sub