Sub Main(Player as Long)
dim Loop as Long, Gate as Long

Gate = 0

For Loop = 1 To GetMaxUsers()
	If IsPlaying(Loop) Then
		If GetPlayerMap(Loop) = 90 & GetPlayerX(Loop) = 11 & GetPlayerY(Loop) = 5 Then
			Gate = 1
		End If
	End If
Next Loop

If GetMonsterX(90, 0) = 11 & GetMonsterY(90, 0) = 5 Then Gate = 1

If Gate = 1 Then
	PlayerWarp(Player, 90, 11, 6)
	PlayerMessage(Player, "Works every time.", Yellow)
Else
	PlayerMessage(Player, "You reckon you could just about make it.. but its too risky.", Yellow)
End If

End Sub