function main(player as long) as long

spawnmonster(getplayermap(player),231,getplayerx(player)-2,getplayery(player),6)
CreateTileEffect(getplayermap(player),getplayerx(player)-2,getplayery(player),9,1,6,1,5)
playermessage(player,"Suddenly your back becomes very, very, hot.",white)
 SetMonsterTarget(190, 0, player)
 SetMonsterTarget(190, 1, player)
 SetMonsterTarget(190, 2, player)
 SetMonsterTarget(190, 3, player)
 SetMonsterTarget(190, 4, player)
 SetMonsterTarget(190, 5, player)
end function