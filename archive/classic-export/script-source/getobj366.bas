FUNCTION Main(Player AS LONG) AS LONG
dim a as long, b as long, c as long



a = hasobj(player,366)

   If a >= 4 Then
   PlayerMessage(player, "You can not carry more than four Bloodsap Potions!", grey)
      Main = Stop
      Exit Function
   Else
      Main = Continue
   End If



main = continue
END FUNCTION