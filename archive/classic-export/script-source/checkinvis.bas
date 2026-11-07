Sub Main(Player as Long)
	Dim A As Long
	playermessage(player,"invis players:",yellow)
	for a = 0 to getmaxusers()
		if getplayersprite(a) = 255 then playermessage(player, getplayername(a),brightred)
		If GetPlayerStatus(a) = 9 Then playermessage(player, getplayername(a),brightblue)
	next a
End Sub