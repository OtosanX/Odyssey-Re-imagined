Function main(player as long) as long
dim a as long, b as long
b = getplayeragility(player) + getplayerendurance(player) + 5
a = random(b)

if a <= 15 then
playermessage(player,"You attempt to jump the crevice but miss! You fall to your doom. Or a scorpion pit! Be careful.",white)
setplayerhp(player,1)
setplayerenergy(player,1)
playerwarp(player,232, 6, 10)
main = stop
exit function
end if

if a >= 16 then
playermessage(player,"You attempt to jump the crevice and make it across! Good job.",white)
playerwarp(player,231, 7, 7)
main = stop
exit function
end if


end function