Sub Main(Player as Long)

SpawnMonster(1785, 1, 1 + Random(5), 6 + Random(2), 0)

Timer(Player, 1, "gamekill")

End Sub