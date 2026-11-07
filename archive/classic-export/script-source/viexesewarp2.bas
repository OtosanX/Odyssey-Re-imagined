Function main(player as long) as long
Dim a as long, b as long
SetMonsterTarget(1564, 0, Player)
SetMonsterTarget(1564, 1, Player)
SetMonsterTarget(1564, 2, Player)
SetMonsterTarget(1564, 3, Player)
SetMonsterTarget(1564, 4, Player)
SetMonsterTarget(1564, 5, Player)
a = random(7)
select case a
case 0
playerwarp(player, 1564, 4, 3)
case 1
playerwarp(player, 1564, 4, 6)
case 2
playerwarp(player, 1564, 7, 3)
case 3
playerwarp(player, 1564, 7, 6)
case 4
playerwarp(player, 1564, 6, 4)
case 5
playerwarp(player, 1564, 5, 5)
case 6
playerwarp(player, 1564, 5, 2)
case else
end select

'b = random(10)+5
timer(player, 10, "viexesewarp")
main = continue
End Function