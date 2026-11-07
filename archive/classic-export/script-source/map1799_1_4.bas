Sub Main(Player as Long)
dim Loop as Long
SetPlayerFlag(Player, 13, 1)

For Loop = 1 To GetMaxUsers()
	If GetPlayerMap(Loop) = 1799 Then
		If GetPlayerX(Loop) = 10 & GetPlayerY(Loop) = 3 Then
			SetPlayerFlag(Loop, 13, 2)
		End If
	End If
Next Loop

End Sub