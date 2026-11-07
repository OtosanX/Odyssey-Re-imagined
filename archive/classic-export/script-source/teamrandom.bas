Sub Main(Player as Long, Map as Long)
	Select Case Map
		Case 0
			playermessage(player,"Available Team Maps:",brightblue)
			playermessage(player,"1 - Fortress",white)
			playermessage(player,"2 - Winter",white)
			playermessage(player,"3 - Swamp",white)
			playermessage(player,"4 - Space",white)
			playermessage(player,"5 - Cavern",white)
			playermessage(player,"6 - City",white)
		Case 1
			runscript1("FortressCarn",player)
		Case 2
			runscript1("WinterCarn",player)
		Case 3
			runscript1("SwampCarn",player)
		Case 4
			runscript1("SpaceCarn",player)
		Case 5
			runscript1("CavernCarn",player)
		Case 6
			runscript1("CityCarn",player)
	End Select
End Sub