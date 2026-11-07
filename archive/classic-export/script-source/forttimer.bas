Sub Main()


	If GetFlag(189) > 0 Then
		If GetMapPlayerCount(2117) = 0 then
			'MapMessage(2115, "test.", Brightred)
			GlobalMessage("The Fort Commander will not relinquish his power to such a pathetic group. Another challenge will be accepted in 5 minutes.", BRIGHTGREEN)
			SetFlag(189, 0) 
			SetFlag(190, 6)
		End If
	End If
	
	If GetFlag(193) > 0 Then 'FortBoss timer
		SetFlag(193, GetFlag(193) - 1)
		if getflag(193) = 119 then
				'GlobalMessage("Darkcone Fort has new temporary keepers!", yellow)
				GlobalMessage(StrCat(StrCat("The guild ", GetGuildName(getflag(186))), " now controls Darkcone Fort!"), yellow)
			'playermessage("test", yellow)
			'MapMessage(2115, "test.", Brightred)
	end if
	end if

	If GetFlag(190) > 0 Then 'FortBoss timer
		SetFlag(190, GetFlag(190) - 1)
		if getflag(190) = 10 then
				GlobalMessage("Darkcone Fort is open for challenge in 10 minutes.", yellow)
				'playermessage("test", yellow)
				'MapMessage(2115, "test.", yellow)

		end if
		end if
	

if getflag(190) > 0 then
		if getflag(190) = 2 then
		setflag(186, 0) 
		end if 


end if
End Sub