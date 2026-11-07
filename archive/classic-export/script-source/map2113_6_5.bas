sub main(player as long)
dim A as long, theguild as long


if getflag(186) = 0 then
playermessage(player, "Currently no guild controls Darkcone fort.", white)
playerwarp(player, 2113, 6, 6)
else

if getflag(186) > 0 then

PlayerMessage(Player, StrCat(StrCat("The guild ", GetGuildName(getflag(186))), " currently controls Darkcone Fort!"), WHITE)
playerwarp(player, 2113, 6, 6)
playermessage(player, strcat(strcat("The control for Darkcone Fort can be challenged in ", Str(GetFlag(190))), " minutes."), white)
end if
end if
end sub