SUB Main(Player AS LONG)
   If GetPlayerStatus(Player) = 1 Then
      Dim A As Long
      For A = 1 to 2
         SetMonsterTarget(97, A, Player)
      Next A
   End If
END SUB