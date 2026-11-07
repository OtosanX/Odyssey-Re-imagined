Sub Main(Player AS LONG)
   Dim N as Long
   If GetPlayerLevel(Player) = 1 & GetPlayerExperience(Player) = 0 & GetPlayerMap(Player) = 1 Then
      If GetPlayerClass(Player) = 1 Then
         For N = 1 to 510
            If HasObj(Player, N) Then
               PlayerMessage(Player, "You cannot bring anything into Capture the Flag!", WHITE)
               PlayerWarp(Player, 1, 5, 5)
               Exit Sub
            End If
         Next N
         SetPlayerFlag(Player, 10, 1)
         PlayerMessage(Player, "Welcome to Capture the Flag!", WHITE)
         PlayerWarp(Player, 79, 5, 5)
      Else
         PlayerMessage(Player, "You must be a Knight to enter Capture the Flag!", WHITE)
      End If
   Else
      PlayerMessage(Player, "You must be level 1 and be on map 1 to enter Capture the Flag!", WHITE)
   End If
End Sub