Sub Main(Player as Long, A as Long)
If GetFlag(40) = 0 Then
	If GetPlayerMap(Player) = 305 & GetPlayerX(Player) = 3 & GetPlayerY(Player) = 6 Then
		If GetPlayermap(A) = 305 & getplayerx(a) = 8 & getplayery(a) = 6 Then
			setflag(40, 1)
			'runscript1("begintrade", player)
			MapMessage(305,StrCat(StrCat(GetPlayerName(Player), " has gold: "), str(hasobj(Player,6))), BRIGHTGREEN)
			MapMessage(305,StrCat(StrCat(GetPlayerName(A), " has gold: "), str(hasobj(a,6))), BRIGHTGREEN)
			'timer(player, 60, "60seconds")
			'timer(player,90, "30seconds")
			timer(player,110, "10seconds")
			timer(player,120,"endtrade")
			playerwarp(player, 305, 1,3)
			playerwarp(a, 305, 10,3)
			playermessage(player, "PLEASE do not log off while trading!!", grey)
			mapmessage(305, "You have 2 minutes to complete the trade.", grey)
		Else
			playermessage(player, "Player must be in the correct place in the trading room!", grey)
		End If
	Else
		playermessage(player, "You must be in the correct place in the trading room!", grey)
	End If
End If

End Sub