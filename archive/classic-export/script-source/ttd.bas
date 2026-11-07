Function Main(Player as Long) AS LONG
dim Loop as Long, Count as Long

Count = 0
SetFlag(82, 0)

For Loop = 1 To GetMaxUsers()
	If GetPlayerMap(Loop) = 68 Then
		If IsPlaying(Loop) Then
			If GetPlayerAccess(Loop) > 0 | GetPlayerFlag(Loop, 78) > 0 Then
				PlayerWarp(Loop, 1527, 4, 5)
			Else
			SetPlayerFlag(Loop, 5, GetPlayerGuild(Loop))
			SetPlayerFlag(Loop, 10, 4)
				If Count < 3 Then
					PlayerWarp(Loop, 1525, 5, 5)
					SetPlayerFlag(Loop, 11, 1)
					SetPlayerFlag(Loop, 12, 0)
					SetPlayerSprite(Loop, 19)
					SetPlayerGuild(Loop, 100)
					If GetPlayerLevel(Loop) >= 40 Then Count = Count + 1
				Else
					If GetPlayerLevel(Loop) >= 40 Then
						PlayerWarp(Loop, 1539, 5, 2)
						SetPlayerFlag(Loop, 11, 2)
						SetPlayerFlag(Loop, 12, 1)
						SetPlayerSprite(Loop, 93)
						SetPlayerGuild(Loop, 101)
						CalculateStats(Loop)
						Count = 0
					Else
						PlayerWarp(Loop, 1525, 5, 5)
						SetPlayerFlag(Loop, 11, 1)
						SetPlayerFlag(Loop, 12, 1)
						SetPlayerSprite(Loop, 19)
						SetPlayerGuild(Loop, 100)
					End If
				End If
			End If
		End If
	End If
Next Loop

End Function