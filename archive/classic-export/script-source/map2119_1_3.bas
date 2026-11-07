Function Main(Player as Long) AS LONG
dim Map as Long, X as Long, Y as Long
Dim a as long
a = random(4)



select case a
case 0
playerwarp(player, 2119, 6, 7)
GiveObj(Player, 609, 1)
case 1
playerwarp(player, 2119, 6, 7)
GiveObj(Player, 614, 1)
case 2
playerwarp(player, 2119, 6, 7)
GiveObj(Player, 615, 1)
case 3
playerwarp(player, 2119, 6, 7)
GiveObj(Player, 617, 1)


case else
end select




main = continue


End Function