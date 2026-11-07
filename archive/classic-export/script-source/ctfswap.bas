Function Main(Player as Long) AS LONG
dim Loop as Long, Team as Long

For Loop = 1 To GetMaxUsers()
	If GetPlayerFlag(Loop, 10) = 1 Then
	If HasObj(Loop, 508) | HasObj(Loop, 509) Then
		Main = Continue
	Else
		If Team = 0 Then				'Red Team
			SetPlayerGuild(Loop, 30)
			SetPlayerSprite(Loop, 132)
			PlayerWarp(Loop, 150, 3, 6)
			Team = 1
		Else
			If Team = 1 Then 'Blue Team
				SetPlayerGuild(Loop, 31)
				SetPlayerSprite(Loop, 133)
				PlayerWarp(Loop, 124, 8, 6)
				Team = 2
			Else
		If Team = 2 Then				'Blue Team
			SetPlayerGuild(Loop, 31)
			SetPlayerSprite(Loop, 133)
			PlayerWarp(Loop, 124, 8, 6)
			Team = 3
		Else
			If Team = 3 Then				'Red Team
				SetPlayerGuild(Loop, 30)
				SetPlayerSprite(Loop, 132)
				PlayerWarp(Loop, 150, 3, 6)
				Team = 0
			End If
		End If
			End If
		End If
		SetPlayerStatus(Loop, 0)
	End If
	End If
Next Loop

End Function