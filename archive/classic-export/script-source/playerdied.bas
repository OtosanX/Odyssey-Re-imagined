Function Main(PLayer AS LONG) AS LONG   
If GetPlayerMap(Player) = 69 Then
SetPlayerStatus(Player, 9)
      Main = Stop
      Exit Function
   End If
End Function