function main(player as long) as long

if hasobj(player,383) >=1 then
playermessage(player,"You may only carry one Snowtossers at a time.",white)
main = stop
exit function
else
main = continue
end if

main = continue
end function