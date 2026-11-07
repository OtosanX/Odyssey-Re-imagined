Sub Main(Player as Long, Size as Long)
dim Loop as Long
If Size = 0 Then Size = 5
SetFlag(102, 0)
SetFlag(103, 0)
SetFlag(104, Size)
SetFlag(99, 6)	'Time
GlobalMessage(strcat(str(Size), "-a-side Football has started!"), BrightGreen)

For Loop = 1 To GetMaxUsers()
	If GetPlayerMap(Loop) = 68 Then
		If IsPlaying(Loop) Then
			If GetPlayerAccess(Loop) > 0 | GetPlayerFlag(Loop, 78) > 0 Then
				PlayerWarp(Loop, 1424, 5, 0)
				SetPlayerFlag(Player, 10, 11)
				SetPlayerFlag(Player, 11, 0)
			Else
			SetPlayerFlag(Loop, 5, GetPlayerGuild(Loop))
			SetPlayerFlag(Loop, 10, 11)
				If GetFlag(102) = GetFlag(104) Then
					Select Case Random(2)
						Case 0
							PlayerWarp(Loop, 1424, 5, 0)
						Case 1
							PlayerWarp(Loop, 1424, 6, 11)
					End Select
					SetPlayerFlag(Loop, 11, 0)
				Else
					If GetFlag(102) < GetFlag(103) | GetFlag(102) = 0 Then
						PlayerWarp(Loop, 1424, 4, 5)
						SetPlayerFlag(Loop, 11, 1)
						SetPlayerFlag(Loop, 12, 0)
						SetPlayerSprite(Loop, 1)
						SetPlayerGuild(Loop, 100)
						SetFlag(102, GetFlag(102) + 1)
					Else
						PlayerWarp(Loop, 1424, 8, 6)
						SetPlayerFlag(Loop, 11, 2)
						SetPlayerFlag(Loop, 12, 0)
						SetPlayerSprite(Loop, 7)
						SetPlayerGuild(Loop, 101)
						SetFlag(103, GetFlag(103) + 1)
					End If
				End If
			End If
		End If
	End If
Next Loop

SpawnObject(1424, 282, 1, 5, 6)

End Sub