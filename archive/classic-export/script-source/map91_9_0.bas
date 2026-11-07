Function Main(Player as Long) AS LONG

GlobalMessage(strcat(GetPlayerName(Player), " has found the ToF's Present stash!!"), BrightGreen)
GiveObj(Player, 483, 1)
RunScript0("tofreset")
PlayerWarp(Player, 66, 0, 6)

End Function