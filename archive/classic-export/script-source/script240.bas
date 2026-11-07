Sub Main(Player as Long)
   Dim A as Long, B as Long
   For A = 1 to 20
         CreateTileEffect(GetPlayerMap(Player), Random(10), Random(10), Random(40), 0, 8, 0, 0)
   Next A
End Sub