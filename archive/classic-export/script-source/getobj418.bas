function main(player as long) as long
            If GetPlayerClass(Player) = 3 Then
main = continue
else
playermessage(player, "You cannot pick this book up.", white)
main = stop
end if

dim a as long, b as long, c as long

if hasobj(player,288) then
goto ok
else

a = hasobj(player,418) + hasobj(player,405)

   If a >= 1 Then
   PlayerMessage(player, "You can not carry more than one Ankh!", grey)
      Main = Stop
      Exit Function
   Else
      Main = Continue
   End If
end if

ok:
main = continue
END FUNCTION



















