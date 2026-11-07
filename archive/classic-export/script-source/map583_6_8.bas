Sub Main(Player as Long)

If GetPlayerDirection(Player) = Up Then PlayerWarp(Player, 583, 6, 9)
If GetPlayerDirection(Player) = Down Then PlayerWarp(Player, 583, 6, 7)
If GetPlayerDirection(Player) = Left Then PlayerWarp(Player, 583, 7, 8)
If GetPlayerDirection(Player) = Right Then PlayerWarp(Player, 583, 5, 8)

PlayerMessage(Player, "=The Sanctuary=", Yellow)
PlayerMessage(Player, "North  - Greystone Peaks", White)
PlayerMessage(Player, "East   - Crendale Housing District", White)
PlayerMessage(Player, "South - Manny's Farm, Southern Beach", White)
PlayerMessage(Player, "West  - Trapper Joe's, Monestry", White)

End Sub