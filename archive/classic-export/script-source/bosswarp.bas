sub main(player as long)
if getplayermap(Player) = 1856 & getplayerx(player) >=1 & getplayerx(player)<= 11 & getplayery(player) >= 3 & getplayery(player) <= 9 then 
playerwarp(player, 1856, random(11)+1,random(6)+3)
SetMonsterTarget(1856, 1, Player)
timer(player, 2,"bosswarp")
end if
end sub