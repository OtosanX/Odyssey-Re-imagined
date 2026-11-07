Sub Main(player as long)

If getflag(11) = 0 then
playermessage(player,"The Orb does not react to your touch!",white)
exit sub
end if

If getflag(11) = 2 then
playermessage(player, "The light from the Orb goes out, you guessed correctly. You have 2 orbs left.",white)
setflag(11,3)
CreateTileEffect(559,6,3, 2, 1,8,1,0)
exit sub
else
playermessage(player, "The four orbs spark and the room shakes, you have guessed wrong. The trap is triggered!",white)
spawnmonster(getplayermap(player),242,6,6,1)
setflag(11,0)
CreateTileEffect(559,3,6, 7, 1,8,4,0)
CreateTileEffect(559,4,6, 7, 1,8,2,5)
CreateTileEffect(559,5,6, 7, 1,8,2,0)

CreateTileEffect(559,6,3, 7, 1,8,4,0)
CreateTileEffect(559,6,4, 7, 1,8,2,0)
CreateTileEffect(559,6,5, 7, 1,8,2,0)

CreateTileEffect(559,9,6, 7, 1,8,4,0)
CreateTileEffect(559,8,6, 7, 1,8,2,0)
CreateTileEffect(559,7,6, 7, 1,8,2,0)

CreateTileEffect(559,6,7, 7, 1,8,2,0)
CreateTileEffect(559,6,8, 7, 1,8,2,0)
CreateTileEffect(559,6,9, 7, 1,8,4,0)

CreateTileEffect(559,6,6, 1, 1,8,3,0)
exit sub
end if

End Sub