SUB Main(Player AS LONG)
   If GetPlayerStatus(Player) = 1 Then
      SetMonsterTarget(105, Random(5)+1, Player)
   End If
END SUB