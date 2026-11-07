Function Main(Killer as Long, Killed as Long) AS LONG

MapMessage(1414, strcat(GetPlayerName(Killer), strcat(" has defeated ", GetPlayerName(Killed))), BrightGreen)

PlayerWarp(Killer, 1414, 5, 2)
PlayerWarp(Killed, 1414, 5, 9)

MapMessage(1414, strcat(GetPlayerName(Killer), strcat(": ", strcat(str(GetPlayerHP(Killer)), "HP"))), Yellow)
SetPlayerHP(Killer, GetPlayerMaxHP(Killer))
SetPlayerEnergy(Killer, GetPlayerMaxEnergy(Killer))
SetPlayerMana(Killer, GetPlayerMaxMana(Killer))

SetPlayerHP(Killed, GetPlayerMaxHP(Killed))
SetPlayerEnergy(Killed, GetPlayerMaxEnergy(Killed))
SetPlayerMana(Killed, GetPlayerMaxMana(Killed))

SetPlayerFlag(Killer, 14, 0)
SetPlayerFlag(Killed, 14, 0)
SetFlag(151, 0)

End Function