function main(player as long) as long

spawnmonster(getplayermap(player),231,6,5,6)
CreateTileEffect(getplayermap(player),6,5,9,1,6,1,5)
playermessage(player,"Suddenly your back becomes very, very, hot.",white)

end function