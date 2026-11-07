Function Main(Player as Long) AS LONG
'Receipe Book

PlayerMessage(Player, "==Receipe Book==", Yellow)
PlayerMessage(Player, "-Strength Potion-", White)
PlayerMessage(Player, "Ingredients: 1 Vial of Water, 10 Hell Shards, 20 Scorpian Stings", Grey)
PlayerMessage(Player, "Crush the Shards into the Vial and stir. Dissolve the Stings one at a time until yellowish brown.", Grey)

If GetPlayerFlag(Player, 140) = 1 Then
PlayerMessage(Player, "-Vigorous Potion-", White)
PlayerMessage(Player, "Ingredients: 1 Vial of Water, 10 Hell Shards, 20 Marshrooms", Grey)
PlayerMessage(Player, "Crush the Shards with Marshrooms until mixture is a sticky paste. Add to the Vial and shake vigorously.", Grey)
End If

If GetPlayerFlag(Player, 141) = 1 Then
PlayerMessage(Player, "-Stout Potion-", White)
PlayerMessage(Player, "Ingredients: 1 Vial of Water, 10 Hell Shards, 5 Demon Hearts", Grey)
PlayerMessage(Player, "Squeeze the juice of 5 Hearts into the Vial. Add crushed Shards and swirl the concoction until a deep purple.", Grey)
End If

End Function