
Function Main(Player as Long) AS LONG

' Mage Reward
If GetPlayerClass(Player) = 2 Then
If GetMapPlayerCount(2134) = 0 Then
	ResetMap(2134)
	PlayerWarp(Player, 2134, 5, 6)
	
'If GetPlayerFlag(Player, 163) < 2 Then
'	PlayerMessage(Player, "You have raided the Dead King's Pyramid!", BrightGreen)
'	SetPlayerFlag(Player, 163, 2)
'End If
If GetPlayerLevel(Player) < 70 Then
	GivePlayerExp(Player, 50000)
	GivePlayerExp(Player, 50000)
	PlayerMessage(Player, "You receive 100k experience for completing Hero's Quest!", White)
End If
Else
	PlayerWarp(Player, 1826, 1, 1)
	PlayerMessage(Player, "There is already someone in there.", Grey)
End if
end if


' Knight Reward
If Getplayerclass (player) = 1 Then
If Getmapplayercount (2132) = 0 Then
Resetmap(2132)
Playerwarp(player,2132,5,6)
'If GetPlayerFlag(Player, 163) < 2 Then
'	PlayerMessage(Player, "You have raided the Dead King's Pyramid!", BrightGreen)
'	SetPlayerFlag(Player, 163, 2)
'End If
If GetPlayerLevel(Player) < 70 Then
	GivePlayerExp(Player, 50000)
	GivePlayerExp(Player, 50000)
	PlayerMessage(Player, "You receive 100k experience for completing Hero's Quest!", White)
End If
Else
PlayerWarp(Player, 1826, 1, 1)
	PlayerMessage(Player, "There is already someone in there.", Grey)
End If
end if


' Thief Reward
If Getplayerclass (player) = 3 Then
If Getmapplayercount (2133) = 0 Then
Resetmap(2133)
Playerwarp(player,2133,5,6)
'If GetPlayerFlag(Player, 163) < 2 Then
	'PlayerMessage(Player, "You have raided the Dead King's Pyramid!", BrightGreen)
	'SetPlayerFlag(Player, 163, 2)
'End If
If GetPlayerLevel(Player) < 70 Then
	GivePlayerExp(Player, 50000)
	GivePlayerExp(Player, 50000)
	PlayerMessage(Player, "You receive 100k experience for completing Hero's Quest!", White)
End If
Else
PlayerWarp(Player, 1826, 1, 1)
	PlayerMessage(Player, "There is already someone in there.", Grey)
End If
end if

'Cleric Reward
If Getplayerclass (player) = 4 Then
If Getmapplayercount (2135) = 0 Then
Resetmap(2135)
Playerwarp(player,2135,5,6)
'If GetPlayerFlag(Player, 163) < 2 Then
	'PlayerMessage(Player, "You have raided the Dead King's Pyramid!", BrightGreen)
	'SetPlayerFlag(Player, 163, 2)
'End If
If GetPlayerLevel(Player) < 70 Then
	GivePlayerExp(Player, 50000)
	GivePlayerExp(Player, 50000)
	PlayerMessage(Player, "You receive 100k experience for completing Hero's Quest!", White)
End If
Else
PlayerWarp(Player, 1826, 1, 1)
	PlayerMessage(Player, "There is already someone in there.", Grey)
End If
end if



end function