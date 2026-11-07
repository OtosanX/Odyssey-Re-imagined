SUB Main(Player AS LONG)
Dim A as Long
If GetPlayerClass(Player) = 1 Then
   If GetPlayerLevel(Player) = 1 Then
      For A = 1 to 255
         If HasObj(Player, A) Then
            PlayerWarp(Player, 1, 5, 5)
            Exit Sub
         End If
      Next A
      SetPlayerFlag(Player, 6, 1)
      PlayerWarp(Player, 79, 5, 5)
      PlayerMessage(Player, "Welcome to Capture the Flag!", 15)
   Else
      PlayerMessage(Player, "You must be a level 1!", 15)
      PlayerWarp(Player, 1, 5, 5)
   End If
Else
   PlayerMessage(Player, "Only a Knight can enter the Capture the Flag realm!", 15)
   PlayerWarp(Player, 1, 5, 5)
End If
END SUB