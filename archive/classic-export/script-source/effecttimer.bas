Sub Main(Player as Long)
dim Map as Long, Effect as Long, Effect2 as Long
Map = GetPlayerMap(Player)
'Effect = 52
'Effect2 = 37
Effect = 23
Effect2 = 63

CreateCharacterEffect(Map, Player, Effect2, 100, 3, 6, 0)
CreateCharacterEffect(Map, Player, Effect, 40, 2, 13, 0)
'CreateCharacterEffect(Map, Player, Effect2, 100, 3, 2, 0)
'CreateCharacterEffect(Map, Player, Effect, 40, 2, 6, 0)

'If GetPlayerHP(Player) = GetPlayerMaxHP(Player) Then Timer(Player, 1, "EffectTimer")

End Sub