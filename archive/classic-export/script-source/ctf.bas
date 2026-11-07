Sub Main(Player as Long, Limit as Long)
dim Loop as Long, Team as Long

Start:
If Limit > 0 Then
	GlobalMessage("CTF has begun!", BrightGreen)
	SetFlag(10, Limit)
	SetFlag(82, 0)
	SetFlag(11, 0)
	SetFlag(12, 0)
For Loop = 1 To GetMaxUsers()
	If IsPlaying(Loop) Then
		If GetPlayerMap(Loop) = 68 Then
			If GetPlayerAccess(Loop) > 0 Then
				PlayerWarp(Loop, 74, 5, 0)
			Else
				SetPlayerFlag(Loop, 5, GetPlayerGuild(Loop))
				SetPlayerFlag(Loop, 10, 6)
				SetPlayerFlag(Loop, 12, 0)
				If Team = 0 Then
					SetPlayerGuild(Loop, 100)
					SetPlayerSprite(Loop, 132)
					SetPlayerStatus(Loop, 17)
					SetPlayerFlag(Loop, 11, 1)
					PlayerWarp(Loop, 70, 1, 10)
					Team = 1
				Else
					SetPlayerGuild(Loop, 101)
					SetPlayerSprite(Loop, 133)
					SetPlayerStatus(Loop, 3)
					SetPlayerFlag(Loop, 11, 2)
					PlayerWarp(Loop, 78, 10, 10)
					Team = 0
				End If
			End If
		End If
	End If
Next Loop

Else
	Limit = 3
	Goto Start
End If
RunScript0("CtfResetFlags")

End Sub