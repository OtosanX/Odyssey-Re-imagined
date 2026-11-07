Sub Main(Player as Long)
	Dim A as Long
	playermessage(player,"-Guild Statistics-",white)
	dim message as string
	dim kills as long
	dim deaths as long
	for a = 0 to getflag(106)
	if readiniint("guildstats",str(a),"guild",0) = getplayerguild(player) then
	kills = readiniInt("guildstats",str(a),"kills",0)
	deaths = readiniInt("guildstats",str(a),"deaths",0)
	message = readinistr("guildstats",str(a),"name","")
	message = strcat(message," - Kills: ")
	message = strcat(message,str(kills))
	message = strcat(message,", Deaths: ")
	message = strcat(message,str(deaths))
	playermessage(player,message,white)
	end if
	next a
End Sub