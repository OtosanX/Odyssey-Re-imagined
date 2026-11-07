FUNCTION Main(Player AS LONG) AS LONG
dim a as long, b as long, c as long

if hasobj(player,288) then
goto ok
else

a = hasobj(player,198) + hasobj(player,41) + hasobj(player,99)

   If a > 5 Then
   PlayerMessage(player, "You can not carry more than five ration items!", grey)
      TakeObj(Player, 41, 1)
      TakeObj(Player, 41, 1)
      TakeObj(Player, 41, 1)
Main = Stop
      Exit Function
   Else
      Main = Continue
   End If
end if

ok:
main = continue
END FUNCTION