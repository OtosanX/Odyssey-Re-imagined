Sub Main()



'If GetFlag(184) > 0 Then 'Lavos Timer
		'SetFlag(184, GetFlag(184) - 1)
		'if getflag(184) = 290 then
				'GlobalMessage("You hear volcanic eruptions in the distance indicating Fire Lord Lavos will ascend from the depths in approximately 290 minutes.", Brightred)
'end if
'end if

If GetFlag(184) > 0 Then 'Lavos Timer
		SetFlag(184, GetFlag(184) - 1)
		if getflag(184) = 15 then
				GlobalMessage("You hear volcanic eruptions in the distance indicating Fire Lord Lavos will ascend from the depths in 15 minutes.", Brightred)
				'MapMessage(2110, "You hear volcanic eruptions in the distance indicating Fire Lord Lavos will ascend from the depths in approximately 15 minutes.", Brightred)

end if
end if

If GetFlag(194) > 0 Then 'Lavos Timer 2
		SetFlag(194, GetFlag(194) - 1)
		if getflag(194) = 40 then
				GlobalMessage("You hear volcanic eruptions in the distance indicating Fire Lord Lavos will ascend from the depths in 40 minutes.", Brightred)
				'MapMessage(2110, "You hear volcanic eruptions in the distance indicating Fire Lord Lavos will ascend from the depths in approximately 15 minutes.", Brightred)

end if
end if





	
	If GetFlag(183) > 0 Then
		If GetMapPlayerCount(2111) = 0 then
			GlobalMessage("The fire shield has 10 minutes of remaining energy.", BRIGHTGREEN)
			SetFlag(183, 0)
			SetFlag(184, 10)
		End If
	End If
	
	'If GetFlag(189) > 0 Then
	'	If GetMapPlayerCount(2117) = 0 then
	'		MapMessage(2115, "test.", Brightred)
			'GlobalMessage("The Fort Commander will not relinquish his power to such' a pathetic group. He will be accepting another challenge in 5 minutes.", BRIGHTGREEN)
	'		SetFlag(189, 0)
	'		SetFlag(190, 5)
	'	End If
	'End If
	
	'If GetFlag(190) > 0 Then 'FortBoss timer
	'	SetFlag(190, GetFlag(190) - 1)
	'	if getflag(190) = 179 then
	'			GlobalMessage("Darkcone Fort has new temporary keepers!", yellow)
			'playermessage("test", yellow)
	'		MapMessage(2115, "test.", Brightred)
	'end if
	'end if

	'If GetFlag(190) > 0 Then 'FortBoss timer
	'	SetFlag(190, GetFlag(190) - 1)
	'	if getflag(190) = 166 then
				'GlobalMessage("Darkcone Fort is open for challenge in 10 minutes.", yellow)
				'playermessage("test", yellow)
	'			MapMessage(2115, "test.", yellow)
	'end if
	'	end if
	


End Sub