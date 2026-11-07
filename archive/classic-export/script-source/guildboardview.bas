Sub Main(Player as Long, View as Long)
	Dim Message as String
	if View <= 0 then 
		playermessage(player,"Invalid post number!",white)
	else
		message = readinistr("guildboard",str(getplayerguild(player)),strcat(Str(View),"title"),"")
		message = strcat(message, " - ")
		message = strcat(message, readinistr("guildboard",str(getplayerguild(player)),Str(View),""))
		playermessage(player,message,white)
	end if
End Sub