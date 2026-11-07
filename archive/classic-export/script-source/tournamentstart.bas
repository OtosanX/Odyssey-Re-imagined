Sub Main()
dim Loop as Long, Flag as Long
dim Count as Long

Count = 0
If GetFlag(171) = 0 Then
	For Loop = 1 To GetMaxUsers()
		If GetPlayerMap(Loop) = 1883 Then
			For Flag = 171 To 178
				If GetFlag(Flag) = Loop Then Count = Count + 1
			Next Flag
			If Count = 0 Then
				PlayerWarp(Loop, 1883, 2, 6)
				SetFlag(171, Loop)
				GoTo EndLoop1
			End If
		End If
	Next Loop
	If GetFlag(171) = 0 Then
		If GetFlag(172) > 0 Then
			'Player 1 Forfeits
			'Player 2 Wins by Default
		Else
			'Tournament Reset, not enough players
		End If
	End If
End If
EndLoop1:

Count = 0
If GetFlag(172) = 0 Then
	For Loop = 1 To GetMaxUsers()
		If GetPlayerMap(Loop) = 1883 Then
			For Flag = 171 To 178
				If GetFlag(Flag) = Loop Then Count = Count + 1
			Next Flag
			If Count = 0 Then
				PlayerWarp(Loop, 1883, 2, 8)
				SetFlag(172, Loop)
				GoTo EndLoop2
			End If
		End If
	Next Loop
	If GetFlag(172) = 0 Then
		'Player 2 Forfeits
		'Player 1 Wins by Default
	End If
End If
EndLoop2:

For Loop = 1 To GetMaxUsers()
	If GetPlayerMap(Loop) = 1883 Then
		If GetFlag(171) = Loop Then PlayerWarp(Loop, 1883, 2, 1)
		If GetFlag(172) = Loop Then PlayerWarp(Loop, 1883, 9, 4)
	End If
Next Loop

End Sub