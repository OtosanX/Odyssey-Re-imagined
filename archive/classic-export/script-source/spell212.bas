SUB Main(Player AS LONG)
If HasObj(Player,413) then
  if GetPlayerMana(Player) >= 23 then
TakeObj(Player,413,1)
     PlayCustomWav(Player, 0)
     CreatePlayerFloatText(Player, "Lo Hem!", BRIGHTGREEN)
  '   CreateCharacterEffect(getplayermap(player),player,5,1,7,2,5)
     SetPlayerMana(Player, GetPlayerMana(Player) - 23)
     SetPlayerHP(Player, GetPlayerHP(Player) + 15)
     If GetPlayerHP(Player) > GetPlayerMaxHP(Player) then
        SetPlayerHP(Player, GetPlayerMaxHP(Player))
     END IF
  Else
     PlayerMessage(Player, "You have insufficient mana to cast this spell.", grey)
  END IF
 Else
     PlayerMessage(Player, "You have no Holy Water!", grey)
  END IF
END SUB