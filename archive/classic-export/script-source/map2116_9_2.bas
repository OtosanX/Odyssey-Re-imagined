
SUB Main(Player AS LONG)


If GetPlayerGuild(Player) > 0 Then
		If getflag(189) = 1 then
			playermessage(player, "Once the Fort Commander has accepted a challenge, you cannot interrupt him!", grey)
			playerwarp(player, 2116,9,3)
			Exit Sub
		end if
		If GetFlag(190) then
			playerwarp(player, 2116,9,3)
			playermessage(player, StrCat(StrCat("The Fort Commander cannot be challenged for ", Str(GetFlag(190))), " more minutes.''"), grey)
		else
			'If HasObj(Player, 78) >= 10 & HasObj(Player, 76) >= 10 Then
			'TakeObj(Player, 78, 10)
			'TakeObj(Player, 76, 10)
			playerwarp(player, 2117,5,5)
			Exit Sub
			'Else
			'PlayerMessage(Player, "You need 10 Scorpion Stings and 10 Pelts to enter!", White)
			'playerwarp(player, 2116,9,3)
			'end if
		end if
	else
playerwarp(player, 2116,9,3)
playermessage(player, "You must be in a guild to challenge the authority of Darkcone Fort!", grey)
end if
END SUB


