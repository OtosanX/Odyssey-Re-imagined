Sub Main(Map as Long, X as Long, Y as Long)
dim Effect as Long

Effect = 1
CreateTileEffect(Map, X, Y, Effect, 40, 8, 0, 0)

CreateTileEffect(Map, X-1, Y, Effect, 60, 8, 0, 0)
CreateTileEffect(Map, X, Y-1, Effect, 60, 8, 0, 0)
CreateTileEffect(Map, X+1, Y, Effect, 60, 8, 0, 0)
CreateTileEffect(Map, X, Y+1, Effect, 60, 8, 0, 0)

CreateTileEffect(Map, X-1, Y-1, Effect, 80, 8, 0, 0)
CreateTileEffect(Map, X+1, Y-1, Effect, 80, 8, 0, 0)
CreateTileEffect(Map, X-1, Y+1, Effect, 80, 8, 0, 0)
CreateTileEffect(Map, X+1, Y+1, Effect, 80, 8, 0, 0)

End Sub