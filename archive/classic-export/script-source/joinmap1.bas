SUB Main(Player AS LONG)
   If GetPlayerStatus(Player) = 1 Then
         SetMonsterTarget(1, 0, Player)
   End If
END SUB