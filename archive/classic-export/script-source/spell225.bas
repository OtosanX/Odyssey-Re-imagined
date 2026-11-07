SUB Main(Player AS LONG)
If Hasobj(player,445) & hasobj(player, 448) >= 5 then 
Takeobj(player,445, 1) 
Takeobj(player, 448, 1)
Takeobj(player, 448, 1)
Takeobj(player, 448, 1)
Takeobj(player, 448, 1)
Takeobj(player, 448, 1)
GiveObj(player, 446, 1)
 PlayerMessage(Player, "You take the Devilkin metal and slowly temper it over the palm of the gauntlets.", grey)
     'CreatePlayerFloatText(Player, "Jur Jod Ana Dest Phy Ectu!", BRIGHTGREEN)
     'CreateCharacterEffect(getplayermap(player),player,27,1,7,2,5)
  Else
     PlayerMessage(Player, "You do not have the required materials to temper the glowing Gauntlets!", grey)
  END IF
END SUB