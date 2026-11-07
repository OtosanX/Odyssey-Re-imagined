FUNCTION Main(Player AS LONG) AS LONG
dim a as long, b as long, c as long



a = hasobj(player,416) + hasobj(player,415) + hasobj(player,417)

   If a >= 5 Then
   PlayerMessage(player, "You can not carry more than five conjured mana potions!", grey)
      Main = Stop
      Exit Function
   Else
      Main = Continue
   End If


ok:
main = continue
END FUNCTION