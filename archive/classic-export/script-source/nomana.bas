Sub Main(Player AS LONG,Mana AS LONG)
   Dim St AS STRING
   St = StrFormat("You do not have enough mana to use this spell! (* mana)",Str(Mana))
   PlayerMessage(Player,St,White)
End Sub
