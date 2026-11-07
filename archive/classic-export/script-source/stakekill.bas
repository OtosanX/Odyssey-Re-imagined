Function Main(Killer as Long, Killed as Long) AS LONG

PlayerWarp(Killer, 1949, 4, 2)
PlayerWarp(Killed, 1949, 8, 11)

SetPlayerFlag(Killer, 13, 4)
SetPlayerFlag(Killed, 13, 0)

MapMessage(1949, strcat(GetPlayerName(Killer), strcat(" has defeated ", GetPlayerName(Killed))), BrightGreen)
MapMessage(1949, strcat(GetPlayerName(Killer), strcat(": ", strcat(str(GetPlayerHP(Killer)), "HP"))), Yellow)

RunScript1("Restore", Killer)
RunScript1("Restore", Killed)

End Function