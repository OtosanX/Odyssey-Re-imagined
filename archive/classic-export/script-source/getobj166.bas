FUNCTION Main(Player AS LONG) AS LONG
   If HasObj(Player, 166) >=3 Then
   PlayerMessage(player, "You can not carry more than three Glass Stilettos.", grey)
      Main = Stop
      Exit Function
   Else
      Main = Continue
   End If
END FUNCTION