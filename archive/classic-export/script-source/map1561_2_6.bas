Function main(player as long) as long
Dim a as long, x as long, y as long

a = random(4) + 1


select case a

case 1
playerwarp(player,1561,3,1)
Timer(Player, 10, "randomwarptvu")
case 2
playerwarp(player,1561,3,3)
Timer(Player, 10, "randomwarptvu")
case 3
playerwarp(player,1561,1,1)
Timer(Player, 10, "randomwarptvu")
case 4
playerwarp(player,1561,1,3)
Timer(Player, 10, "randomwarptvu")



end select

main = continue
End Function