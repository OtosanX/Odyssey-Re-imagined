Sub Main(Player as Long, Size as Long)
dim Loop as Long, Count1 as Long, Count2 as Long
If Size = 0 Then Size = 5
SetFlag(82, 0)
SetFlag(102, 0)
SetFlag(103, 0)
SetFlag(104, Size)
SetFlag(99, 6)	'Time
GlobalMessage(strcat(str(Size), "-a-side Bloodball has started!"), BrightGreen)

For Loop = 1 To GetMaxUsers()	'Random Teams
	If GetPlayerMap(Loop) = 68 Then
		If IsPlaying(Loop) Then
			If GetPlayerAccess(Loop) > 0 | GetPlayerFlag(Loop, 78) > 0 Then
				PlayerWarp(Loop, 1424, 5, 0)
			Else
			SetPlayerFlag(Loop, 5, GetPlayerGuild(Loop))
			SetPlayerFlag(Loop, 10, 11)
			Select Case Random(4)
				Case 1 'Red Team
					If GetFlag(102) < GetFlag(104) Then
						PlayerWarp(Loop, 1424, 4, 5)
						SetPlayerFlag(Loop, 11, 1)
						SetPlayerFlag(Loop, 12, 0)
						SetPlayerSprite(Loop, 132)
						SetPlayerGuild(Loop, 100)
						SetFlag(102, GetFlag(102) + 1)
					Else
						SetPlayerFlag(Loop, 11, 0)
						PlayerWarp(Loop, 1424, 6, 11)
					End If
				Case 2 'Blue Team
					If GetFlag(103) < GetFlag(104) Then
						PlayerWarp(Loop, 1424, 8, 6)
						SetPlayerFlag(Loop, 11, 2)
						SetPlayerFlag(Loop, 12, 0)
						SetPlayerSprite(Loop, 133)
						SetPlayerGuild(Loop, 101)
						SetFlag(103, GetFlag(103) + 1)
					Else
						SetPlayerFlag(Loop, 11, 0)
						PlayerWarp(Loop, 1424, 6, 11)
					End If
				Case Else 'Sub
					If Count1 <= Count2 Then	'Red Sub
						PlayerWarp(Loop, 1424, 5, 0)
						SetPlayerFlag(Loop, 11, 3)
						SetPlayerSprite(Loop, 1)
						Count1 = Count1 + 1
					Else						'Blue Sub
						PlayerWarp(Loop, 1424, 6, 11)
						SetPlayerFlag(Loop, 11, 4)
						SetPlayerSprite(Loop, 7)
						Count2 = Count2 + 1
					End If
			End Select
			End If
		End If
	End If
Next Loop

For Loop = 1 To GetMaxUsers()	'Even Teams
	If GetPlayerFlag(Loop, 11) = 3 Then
		If GetFlag(102) < GetFlag(104) Then
			PlayerWarp(Loop, 1424, 4, 5)
			SetPlayerFlag(Loop, 11, 1)
			SetPlayerFlag(Loop, 12, 0)
			SetPlayerSprite(Loop, 132)
			SetPlayerGuild(Loop, 100)
			SetFlag(102, GetFlag(102) + 1)
		End If
	End If
	If GetPlayerFlag(Loop, 11) = 4 Then
		If GetFlag(103) < GetFlag(104) Then
			PlayerWarp(Loop, 1424, 8, 6)
			SetPlayerFlag(Loop, 11, 2)
			SetPlayerFlag(Loop, 12, 0)
			SetPlayerSprite(Loop, 133)
			SetPlayerGuild(Loop, 101)
			SetFlag(103, GetFlag(103) + 1)
		End If
	End If
Next Loop

SpawnObject(1424, 282, 1, 5, 6)

End Sub