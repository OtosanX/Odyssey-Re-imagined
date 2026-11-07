Function main(player as long) as long
Dim a as long
a = random(18)
select case a
case 0
playerwarp(player, 1826, 3, 6)
case 1
playerwarp(player, 1826, 3, 6)
case 2
playerwarp(player, 1826, 3, 7)
case 3
playerwarp(player, 1826, 4, 5)
case 4
playerwarp(player, 1826, 4, 6)
case 5
playerwarp(player, 1826, 4, 7)
case 6
playerwarp(player, 1826, 5, 5)
case 7
playerwarp(player, 1826, 5, 6)
case 8
playerwarp(player, 1826, 5, 6)
case 9
playerwarp(player, 1826, 6, 5)
case 10
playerwarp(player, 1826, 6, 6)
case 11
playerwarp(player, 1826, 6, 6)
case 12
playerwarp(player, 1826, 7, 5)
case 13
playerwarp(player, 1826, 7, 6)
case 14
playerwarp(player, 1826, 7, 7)
case 15
playerwarp(player, 1826, 8, 6)
case 16
playerwarp(player, 1826, 8, 6)
case 17
playerwarp(player, 1826, 8, 7)
case else
end select
main = continue
End Function