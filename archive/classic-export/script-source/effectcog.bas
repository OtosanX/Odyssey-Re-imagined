Sub Main(Player as Long)
dim Effect as Long

Effect = Random(71) + 1

'CreateCharacterEffect(GetPlayerMap(Player), Player, Effect, 40, 8, 0, 0)
CreateTileEffect(GetPlayerMap(Player), GetPlayerX(Player), GetPlayerY(Player), Effect, 40, 8, 1, 0)

End Sub