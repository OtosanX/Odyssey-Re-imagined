Sub Main(Player as Long, Target as Long)
dim team1 as long
dim d as long


'setplayerflag(d, 191,0)

'If GetPlayerGuild(Player) > 0 Then
	for d = 1 to getmaxusers()
		if getplayermap(d) = 2114 & GetPlayerX(d) = 5 & GetPlayerY(d) = 7 Then
			if getplayerflag(d,191) < 30 then
				setplayerflag(d, 191,0)
			end if
		end if 
		
	next d
	
	setplayerflag(player,191,1)
	playermessage(player, "Your attempts to unlock the gate will require steady concentration for up to sixty seconds.", yellow)
	'timer(player, 15, "msg5")
	if getplayermap(player) = 2114 & GetPlayerX(Player) = 5 & GetPlayerY(Player) = 7 Then
	'globalmessage(strcat(getplayername(player), " is attempting to unlock the Fort Gate."), grey)
	timer(player, 1, "capture5")
	end if

'Else
	'PlayerMessage(Player, "Only guilded players may open this Gate.", White)
'End If

end sub 