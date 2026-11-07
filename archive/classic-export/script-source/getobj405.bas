FUNCTION Main(Player AS LONG) AS LONG
dim a as long, b as long, c as long

if hasobj(player,288) then
goto ok
else

a = hasobj(player,405)

   If a >= 1 Then
   PlayerMessage(player, "You can not carry more than 1 Ankh of Purity!", grey)
      Main = Stop
      Exit Function
   Else
      Main = Continue
   End If
end if

ok:
main = continue
END FUNCTION