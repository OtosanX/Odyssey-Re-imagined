Sub Main(Player as Long, Limit as Long)
dim Loop as Long, Team as Long

Start:
If Limit > 0 Then
	GlobalMessage("Let Battle Commence!", BrightRed)
	SetFlag(88, Limit)
	SetFlag(82, 0)
	SetFlag(86, 0)
	SetFlag(87, 0)
For Loop = 1 To GetMaxUsers()
	If IsPlaying(Loop) Then
		If GetPlayerMap(Loop) = 68 Then
			If GetPlayerAccess(Loop) > 0 | GetPlayerFlag(Loop, 78) > 0 Then
				PlayerWarp(Loop, 1420, 5, 0)
			Else
				SetPlayerFlag(Loop, 5, GetPlayerGuild(Loop))
				SetPlayerFlag(Loop, 10, 3)
				SetPlayerFlag(Loop, 12, 0)
				SetPlayerStatus(Loop, 0)
				If Team = 0 Then
					SetPlayerGuild(Loop, 100)
					SetPlayerSprite(Loop, 1)
					SetPlayerFlag(Loop, 11, 1)
					PlayerWarp(Loop, 1421, 0, 1)
					Team = 1
				Else
					SetPlayerGuild(Loop, 101)
					SetPlayerSprite(Loop, 7)
					SetPlayerFlag(Loop, 11, 2)
					PlayerWarp(Loop, 1422, 11, 1)
					Team = 0
				End If
			End If
		End If
	End If
Next Loop

Else
	Limit = 30
	Goto Start
End If

End Sub