Sub Main(Player as Long)
dim Loop as Long

SetFlag(82, 0)
SetFlag(141, 0) 'Red Count
SetFlag(142, 0) 'Blue Count
SetFlag(143, 5) 'Red Kills
SetFlag(144, 5) 'Blue Kills

GlobalMessage("Dodgeball has started!", BrightGreen)

For Loop = 1 To GetMaxUsers()
	If GetPlayerMap(Loop) = 68 Then
		If IsPlaying(Loop) Then
			If GetPlayerAccess(Loop) > 0 | GetPlayerFlag(Loop, 78) > 0 Then
				PlayerWarp(Loop, 1427, 5, 11)
			Else
			SetPlayerFlag(Loop, 5, GetPlayerGuild(Loop))
			SetPlayerFlag(Loop, 10, 12)
				If GetFlag(141) <= GetFlag(142) Then
					PlayerWarp(Loop, 1427, 5, 0)
					SetPlayerFlag(Loop, 11, 3)
					SetPlayerSprite(Loop, 1)
					SetPlayerFlag(Loop, 12, 0)
					SetPlayerGuild(Loop, 100)
					SetFlag(141, GetFlag(141) + 1)
				Else
					PlayerWarp(Loop, 1427, 6, 11)
					SetPlayerFlag(Loop, 11, 4)
					SetPlayerSprite(Loop, 7)
					SetPlayerFlag(Loop, 12, 0)
					SetPlayerGuild(Loop, 101)
					SetFlag(142, GetFlag(142) + 1)
				End If
			End If
		End If
	End If
Next Loop

End Sub