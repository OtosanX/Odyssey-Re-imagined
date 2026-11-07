Function Main(Player as Long) AS LONG
dim Monster as Long

ResetMap(1489)
PlayerMessage(Player, "As the Infernal Beast retreats to the ethereal world, a Lesser Summoner emerges.", White)
SpawnMonster(1489, 241, 5, 5, 6)

For Monster = 0 To 5
	SetMonsterTarget(1489, Monster, Player)
Next Monster

End Function