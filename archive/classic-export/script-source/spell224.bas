SUB Main(Player AS LONG)
if hasobj(player,405) >= 1 then
if GetPlayerMana(player) = GetPlayerMana(Player) then
takeobj(player,405,1)
     PlayCustomWav(Player, 0)
     CreatePlayerFloatText(Player, "Mak Ylem Hem!", BRIGHTGREEN)
     CreateCharacterEffect(getplayermap(player),player,11,1,7,2,5)

   setplayermana(player, getplayermana(player) - getplayermana(player))
     SetPlayerHP(Player, GetPlayerHP(Player) + 200)
     If GetPlayerHP(Player) > GetPlayerMaxHP(Player) then
        SetPlayerHP(Player, GetPlayerMaxHP(Player))
     END IF
else
playermessage(player, "You have insufficient materials to cast this spell!", grey)
  END IF
  else

playermessage(player, "You have insufficient materials to cast this spell!", grey)
  END IF

playermessage(player, "You have insufficient materials to cast this spell!", grey)


END SUB