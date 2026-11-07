Sub Main(Player as Long, Page as Long)
	Dim A As Long, message as String
	if Page <= 0 then 
		playermessage(player,"Invalid page number!",white)
	else
		playermessage(player,strcat(strcat("-Page ", Str(Page)),"-"),white)
		for a = ((Page-1)*10+1) to ((Page-1)*10+10)
			message = str(a)
			message = strcat(message,". ")
			message = strcat(message,readinistr("guildboard",str(getplayerguild(player)),strcat(str(a),"title"),""))
			playermessage(player,message,white)
		next a
	end if
End Sub