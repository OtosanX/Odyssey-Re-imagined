Function Main(Player as Long) AS LONG
dim Loop as Long, Team as Long

globalmessage("A Team Carnage has started!",brightblue)
globalmessage("Map: Team Winter Carnage",white)
SetFlag(82, 0)

For Loop = 1 To GetMaxUsers()
	If IsPlaying(Loop) Then
		If GetPlayerMap(Loop) = 68 Then
			If GetPlayerAccess(Loop) > 0 Then
				PlayerWarp(Loop, 111, 1, 1)
			Else
				SetPlayerFlag(Loop, 10, 2)
				SetPlayerFlag(Loop, 5, GetPlayerGuild(Loop))
				SetPlayerStatus(Loop, 9)
				If Team = 0 Then
					SetPlayerGuild(Loop, 100)
					SetPlayerSprite(Loop, 71)
					SetPlayerFlag(Loop, 11, 1)
					PlayerWarp(Loop, 111, 0, 6)
					Team = 1
				Else
					SetPlayerGuild(Loop, 101)
					SetPlayerSprite(Loop, 119)
					SetPlayerFlag(Loop, 11, 2)
					PlayerWarp(Loop, 111, 11, 6)
					Team = 0
				End If
			End If
		End If
	End If
Next Loop

End Function