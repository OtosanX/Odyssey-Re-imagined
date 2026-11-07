SUB Main(Player AS LONG)
   If GetPlayerStatus(Player) = 1 Then
         SetMonsterTarget(2, 0, Player)
   End If
   
   CreateMapStaticText(2, 4, 3, "       Bank", YELLOW)
END SUB