
SUB Main(Player AS LONG)


If GetPlayerGuild(Player) > 0 Then
	If GetFlag(187) then
		PlayerWarp(Player, 2118, 10, 4)
		playermessage(player, StrCat(StrCat("You must wait ", Str(GetFlag(187))), " minutes for the Fort workers to finish gathering the loot. Remember, don't come with a full inventory! Only one leader can enter."), yellow)
	else
		if getplayerguild(player) = getflag(186) & getflag(185) > 0 then 
			If GetPlayerGuildRank(Player) = 2 | GetPlayerGuildRank(Player) = 3 Then
				playerwarp(player, 2119,0,3)
			else	
				PlayerMessage(Player, "Only one leader may enter this vault.", White)
				PlayerWarp(Player, 2118, 10, 4)
			End If
		else
			playermessage(player, "You do not have special access to the Darkcone Fort.", brightred)
			PlayerWarp(Player, 2118, 10, 4)	
		end if
	end if
else
playerwarp(player, 2118,10,4)
playermessage(player, "You must be in a guild!", grey)
end if
END SUB