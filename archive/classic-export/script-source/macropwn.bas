Sub Main(Player AS LONG)
	If IsPlaying(Player) Then
		SetPlayerSkillLevel(Player, 1, 0)
		SetPlayerSkillLevel(Player, 2, 0)
		SetPlayerSkillLevel(Player, 3, 0)
		'GlobalMessage(StrCat(GetPlayerName(Player), " has been MACROPWNED and their skills have been reset!  Better luck next time..."), BRIGHTGREEN)
	End If
End Sub