Function Main(Player as Long) AS LONG

'Apples
While HasObj(Player, 41) > 3
	TakeObj(Player, 41, 1)
Wend

'Anceint Tomes
While HasObj(Player, 41) + HasObj(Player, 99) > 3
	TakeObj(Player, 99, 1)
Wend

'HP Pots
While HasObj(Player, 39) > 5
	TakeObj(Player, 39, 1)
Wend

'Energy Pots
While HasObj(Player, 40) > 5
	TakeObj(Player, 40, 1)
Wend

'Blinding Powder
While HasObj(Player, 407) > 5
	TakeObj(Player, 407, 1)
Wend

'Nightfall Dust
While HasObj(Player, 408) > 3
	TakeObj(Player, 408, 1)
Wend

'Holy Water
While HasObj(Player, 413) > 5
	TakeObj(Player, 413, 1)
Wend

'Living Essence
While HasObj(Player, 411) > 2
	TakeObj(Player, 411, 1)
Wend

End Function