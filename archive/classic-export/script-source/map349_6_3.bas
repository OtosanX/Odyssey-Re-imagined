Sub Main(Player as Long)
dim Loop as Long, Gate as Long

Gate = 0

For Loop = 1 To GetMaxUsers()
	If IsPlaying(Loop) Then
		If GetPlayerMap(Loop) = 349 & GetPlayerX(Loop) = 5 & GetPlayerY(Loop) = 3 Then
			Gate = 1
		End If
	End If
Next Loop

If Gate = 1 Then PlayerWarp(Player, 349, 4, 3)

End Sub