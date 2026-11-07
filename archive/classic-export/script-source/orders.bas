Sub Main(Player AS LONG)
	'Order #512338880041078
	If StrCmp(GetPlayerName(Player), "tails396") Then
		SetPlayerFlag(Player, 75, 1)
	End If
	If StrCmp(GetPlayerUser(Player), "tails396") Then
		SetPlayerFlag(Player, 75, 1)
	End If
	
	'Order #342096222543770
	'Order # 349143015031009
	If StrCmp(GetPlayerName(Player), "SpellBound") Then
		SetPlayerSprite(Player, 167)
		SetPlayerFlag(Player, 72, 1)
		SetPlayerFlag(Player, 75, 1)
		SetPlayerFlag(Player, 76, 1)
	End If
	
	'Order #763860491920862
	If StrCmp(GetPlayerName(Player), "Hmm") Then
		SetPlayerFlag(Player, 75, 1)
	End If
	
	' Order # 648792720033448
	If StrCmp(GetPlayerName(Player), "Smelly") Then
		If GetPlayerStatus(Player) = 1 Then SetPlayerStatus(Player, 1) Else SetPlayerStatus(Player, 10)
	End If
	
	'Order # 161313143005774
	If StrCmp(GetPlayerName(Player), "Zayos") Then
		SetPlayerSprite(Player, 80)
		If GetPlayerStatus(Player) = 1 Then SetPlayerStatus(Player, 1) Else SetPlayerStatus(Player, 10)
		SetPlayerFlag(Player, 75, 1)
	End If
	
	'Order # 955313101221566
	If StrCmp(GetPlayerName(Player), "Blizzard") Then
		SetPlayerFlag(Player, 77, 1)
	End If
End Sub