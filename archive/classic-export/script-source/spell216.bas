SUB Main(Player AS LONG)
dim a as long
a = getplayerlevel(player) * 200
if hasobj(player,405) = 0 then
If HasObj(Player, 6) >= a & hasobj(player, 413) >= 20 & hasobj(player, 9) >= 1 then 
TakeObj(Player, 6, a)
Takeobj(player, 413, 20)
Takeobj(player, 9, 1)
GiveObj(player, 405, 1)

     CreatePlayerFloatText(Player, "!", BRIGHTGREEN)
     CreateCharacterEffect(getplayermap(player),player,27,1,7,2,5)
  else
     PlayerMessage(Player, "You do not have the materials to form an Ankh!", grey)
  END IF
  else
  playermessage(player, "You already have an Ankh!", grey)
 end if
END SUB