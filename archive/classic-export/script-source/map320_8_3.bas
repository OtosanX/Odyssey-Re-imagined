SUB Main(Player AS LONG)
   If GetPlayerLevel(Player) = 1 & GetPlayerExperience(Player) = 0 Then
      If GetPlayerClass(Player) = 1 Then
         Dim A as Long
         For A = 1 to 510
            If HasObj(Player, A) Then
               PlayerMessage(Player, "You cannot bring anything into Capture the Flag!", WHITE)
               PlayerWarp(Player, 1, 5, 5)
               Exit Sub
            End If
         Next A
         SetPlayerFlag(Player, 10, 1)
         PlayerMessage(Player, "Welcome to Capture the Flag!", WHITE)
         PlayerWarp(Player, 79, 5, 5)
      Else
         PlayerMessage(Player, "You must be a Knight to enter Capture the Flag!", WHITE)
         PlayerWarp(Player, 1, 5, 5)
      End If
   Else
      PlayerMessage(Player, "You must be level 1 to enter Capture the Flag!", WHITE)
      PlayerWarp(Player, 1, 5, 5)
   End If
END SUB