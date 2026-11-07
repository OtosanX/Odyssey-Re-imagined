Function Main(Player as Long) AS LONG

GlobalMessage(strcat(GetPlayerName(Player), " rules over ToF Run!!"), BrightGreen)
GiveObj(Player, 484, 1)
SetPlayerFlag(Player, 218, GetPlayerFlag(Player, 218) + 1)
RunScript0("tofreset2")
PlayerWarp(Player, 66, 11, 6)

End Function