Sub Main(Player as Long)

PlayerWarp(Player, 1428, 7, 1)
OpenDoor(1428, 5, 10)
CreateMapFloatText(1428, GetMonsterX(1428, 0), GetMonsterY(1428, 0), "You wont get away with this!", BrightRed)

End Sub