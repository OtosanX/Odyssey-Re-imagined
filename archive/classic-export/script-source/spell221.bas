SUB Main(Player AS LONG)
If HasObj(Player,413) >= 2 then
  if GetPlayerMana(Player) >= 34 then
TakeObj(Player,413,2)
     PlayCustomWav(Player, 0)
     CreatePlayerFloatText(Player, "Diem Hem!", BRIGHTGREEN)
  '   CreateCharacterEffect(getplayermap(player),player,5,1,7,2,5)
     SetPlayerMana(Player, GetPlayerMana(Player) - 34)
     SetPlayerHP(Player, GetPlayerHP(Player) + 22)
     If GetPlayerHP(Player) > GetPlayerMaxHP(Player) then
        SetPlayerHP(Player, GetPlayerMaxHP(Player))
     END IF
  Else
     PlayerMessage(Player, "You have insufficient mana to cast this spell.", grey)
  END IF
 Else
     PlayerMessage(Player, "You have insufficient Holy Water!", grey)
  END IF
END SUB