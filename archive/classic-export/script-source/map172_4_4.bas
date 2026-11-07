sub main(player as long)
if getflag(100) = 1 then
opendoor(172,4,5)
else
playerwarp(player, 172, 4, 6)
end if
end sub