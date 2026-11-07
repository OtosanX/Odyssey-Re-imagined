SUB Main(Player AS LONG)

MapMessage(305,StrCat(StrCat(GetPlayerName(Player), " has gold: "), str(hasobj(Player,6))), BRIGHTGREEN)
playerwarp(player,305,8,4)
END SUB