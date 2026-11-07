Sub Main()

If GetFlag(184) > 0 Then 'Lavos Timer
		SetFlag(184, GetFlag(184) - 1)
		if getflag(184) = 60 then
				'GlobalMessage("You hear volcanic eruptions in the distance indicating Fire Lord Lavos will ascend from the depths in approximately 60 minutes.", Brightred)
End if

If GetFlag(184) > 0 Then 'Lavos Timer
		SetFlag(184, GetFlag(184) - 1)
		if getflag(184) = 30 then
				'GlobalMessage("You hear volcanic eruptions in the distance indicating Fire Lord Lavos will ascend from the depths in approximately 30 minutes.", Brightred)
End if
End if
	End If
	If GetFlag(183) > 0 Then
		If GetMapPlayerCount(2111) = 0 then
			'GlobalMessage("The fire shield has 10 minutes of remaining energy.", BRIGHTGREEN)
			SetFlag(183, 0)
			SetFlag(184, 10)
		End If
	End If
	
	'If GetFlag(219) > 0 Then
		'If GetMapPlayerCount(2765) = 0 then
			'GlobalMessage("The Fort Commander will not relinquish his power to such a pathetic group. He will be accepting another challenge in 5 minutes.", BRIGHTGREEN)
			'SetFlag(219, 0)
			'SetFlag(149, 5)
		'End If
	'End If
	
	'If GetFlag(149) > 0 Then 'FortBoss timer
		'SetFlag(149, GetFlag(149) - 1)
		'if getflag(149) = 10 then
				'GlobalMessage("Darkcone Fort is open for challenge in 10 minutes.", yellow)
'end if
'end if




End Sub