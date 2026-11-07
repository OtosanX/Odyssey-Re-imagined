Function Main(Player as Long) AS LONG
dim Ration as Long

Ration = HasObj(Player, 445) + HasObj(Player, 446) + HasObj(Player, 447) + HasObj(Player, 449)
SetFlag(93, 0)
ResetMap(1489)
PlayerMessage(Player, "The Master Summoner concedes, ''You have done well, I see the bloodlust in your eyes. I will teach you.", White)
PlayerMessage(Player, "You receive knowledge of Potions and Elixiers", BrightGreen)
PlayerWarp(Player, 1315, 5, 5)
SetPlayerFlag(Player, 125, 1)
If HasObj(Player, 454) = 0 Then GiveObj(Player, 454, 1)
If Ration < 2 Then GiveObj(Player, 445, 1)
If Ration < 1 Then GiveObj(Player, 446, 1)

End Function