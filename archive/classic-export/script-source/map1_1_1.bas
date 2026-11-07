SUB Main(Player AS LONG)
   If GetPlayerLevel(Player) > 10 Then
      If GetPlayerFlag(Player, 69) = 0 Then
         GlobalMessage(StrCat(StrCat(GetPlayerName(Player), " has stepped on the Tile of Truth and is level "), Str(GetPlayerLevel(Player))), WHITE)
         SetPlayerFlag(Player, 69, 1)
         PlayerWarp(Player, 1, 5, 5)
      Else
         PlayerWarp(Player, 1, 5, 5)
      End If
   Else
      PlayerMessage(Player, "You are too weak to approach the tile of truth!", BRIGHTRED)
      PlayerWarp(Player, 1, 5, 5)
   End If
END SUB