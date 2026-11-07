Function main(player as long) as long

dim a as long, b as long, c as long

a = hasobj(player,198) + hasobj(player,41) + hasobj(player,99)

   If a >= 6 Then
   PlayerMessage(player, "You are carrying to much food to drop this!", white)
      Main = Stop
      Exit Function
   Else
      Main = Continue
   End If  

main = continue
end function