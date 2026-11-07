	Sub Main(Player as Long, Attack as Long)
	Dim A as Long, B as Long
	'If StrCmp(GetPlayerUser(Player), "acidman") Then A = 1262
	If getplayerguild(player) = getflag(186) & getflag(185) > 0 Then A = 32
	If A > 0 Then
		For B = 0 to 5
			If GetMonsterType(A, B) = 411 Then
				SetMonsterTarget(A, B, Attack)
			End If
		Next B
	else
	playermessage(player, "Your guild does not have special access to the Darkcone Fort.", white)
	End If
	End Sub
	