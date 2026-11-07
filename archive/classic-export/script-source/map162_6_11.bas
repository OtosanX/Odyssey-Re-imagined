sub main(player as long)
if getflag(100) = 1 then
opendoor(162,6,10)
else
playerwarp(player, 162, 6, 9)
end if
end sub