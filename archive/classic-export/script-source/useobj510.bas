function main(player as long) as long
	TakeObj(Player, 510, 1)
	Exit Function
	
	'If GetPlayerFlag(Player, 100) = 0 Then
		SetPlayerFlag(Player, 100, 1)
		Timer(Player, 0, "removeflag100")
		SetPlayerSprite(Player, Random(198))
		If GetPlayerStatus(Player) = 1 Then 
			Main = Stop
			Exit Function
		End If
		Dim RandomStatus As Long
	    RandomStatus = Random(24) + 1
		If RandomStatus = 9 Then RandomStatus = 3
		If RandomStatus = 1 Then RandomStatus = 4
		SetPlayerStatus(Player, RandomStatus)
		Main = Stop
	'Else
	'	PlayerMessage(Player, "Changing forms so quickly could destabilize your molecular structure causing spontaneous combustion!", BRIGHTRED)
	'End If
end function