sub main(player as long)
if getflag(100) = 1 then
opendoor(162,7,10)
else
playerwarp(player, 162, 7, 9)
end if
end sub