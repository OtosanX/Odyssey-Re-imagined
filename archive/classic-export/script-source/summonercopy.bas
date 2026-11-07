Function Main(Player as Long) AS LONG
dim Monster as Long

PlayerMessage(Player, "The Master calls forth an avatar of himself to fight by his side!", White)
SpawnMonster(1489, 242, 5, 5, 0)
CreateMonsterEffect(GetPlayerMap(Player), Player, 0, 10, 40, 8, 0)

For Monster = 0 To 5
	SetMonsterTarget(1489, Monster, Player)
Next Monster

End Function