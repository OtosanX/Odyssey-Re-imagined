Function main(player as long) as long
Dim a as long, x as long, y as long

a = random(9) + 1


select case a

case 1
mapmessage(getplayermap(player),(StrCat(GetPlayerName(player), " has caused a Raging Colossus to appear!")), white)
runscript1("randomwarptvu", player)
SpawnMonster(1561, 225, 6, 3,0)

case 2
mapmessage(getplayermap(player),(StrCat(GetPlayerName(player), " has caused a Raging Colossus to appear!")), white)
runscript1("randomwarptvu", player)
SpawnMonster(1561, 225, 6, 3,0)

case 3
playerwarp(player,1561,8,2)
Timer(Player, 10, "randomwarptvu")
case 4
playerwarp(player,1561,3,3)
Timer(Player, 10, "randomwarptvu")
case 5
playerwarp(player,1561,1,1)
Timer(Player, 10, "randomwarptvu")

case 6
playerwarp(player,1561,1,9)

case 7
playerwarp(player,1561,6,11)
SpawnMonster(1561, 231, 5, 11,0)

case 8
playerwarp(player,1561,10,4)
Timer(Player, 10, "randomwarptvu")

case 9
mapmessage(getplayermap(player),(StrCat(GetPlayerName(player), " has caused a Raging Colossus to appear!")), white)
runscript1("randomwarptvu", player)
SpawnMonster(1561, 225, 6, 3,0)
case else

end select

main = continue
End Function