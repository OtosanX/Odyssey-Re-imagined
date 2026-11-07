sub main(player as long)
dim a as long


select case a
a= random(5)

case 1
if hasobj(player, 446) then
takeobj(player,446,1)
giveobj(player,449,1)
playermessage(player, "You place the powerful gauntlets onto the Rune. Magical energy pours over them, and they begin to glow brighter than even before. The gauntlets are near completion.", brightred)
playerwarp(player,188,3,6)
else
end if


case else
playerwarp(player,188,3,6)
end select





end sub