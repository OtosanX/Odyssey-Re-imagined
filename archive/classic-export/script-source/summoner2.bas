Function Main(Player as Long) AS LONG
dim Monster as Long

ResetMap(1489)
PlayerMessage(Player, "A deep voice booms, ''Stop! Stand back apprentice.''", White)
SpawnMonster(1489, 230, 5, 5, 0)

For Monster = 0 To 5
	SetMonsterTarget(1489, Monster, Player)
Next Monster

End Function