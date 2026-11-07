sub main(player as long)
if getflag(100) = 1 then
opendoor(172,5,5)
else
playerwarp(player, 172, 5, 6)
end if
end sub