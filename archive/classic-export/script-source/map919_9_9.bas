Function main(player as long) as long
timer(player, 10, "resetflag45")
if getflag(45) = 0 then
timer(player, 10, "bunnyattack")
else
end if
main = continue
End Function