FUNCTION Main(Player AS LONG) AS LONG
   If HasObj(Player, 235) Then
      Main = Stop
      Exit Function
   Else
      Main = Continue
   End If
END FUNCTION