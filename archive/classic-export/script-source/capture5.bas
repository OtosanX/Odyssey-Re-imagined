
Sub Main(Player as Long)

if getplayermap(player) = 2114 & GetPlayerX(Player) = 5 & GetPlayerY(Player) = 7 Then
	
	if getplayerflag(player,191) > 30 then
	globalmessage(strcat(getplayername(player), " unlocks the fort gate momentarily."), grey)
	'playermessage(player, "test", yellow)
	'MapMessage(2760, "A fort gate is momentarily opened.", yellow)
	'playermessage(player, "You unlock the Fort Gate for a few moments.", yellow)
	'setplayerflag(player,71,100)
	OpenDoor(2114, 5, 6)
	exit sub
	end if

end if

if getplayermap(player) = 2114 & GetPlayerX(Player) = 5 & GetPlayerY(Player) = 7 Then
	
	if getplayerflag(player,191) > 0 then
	setplayerflag(player, 191, getplayerflag(player,191)+1)
	timer(player, 1, "capture5")
	end if
else
	if getplayermap(player) = 2114 & GetPlayerX(Player) = 5 & GetPlayerY(Player) = 7 Then
		if getplayermap(player) = 2114 & GetPlayerX(Player) = 6 & GetPlayerY(Player) = 7 Then
	else
	setplayerflag(player,191,0)
	end if
	end if 
end if


	
end sub