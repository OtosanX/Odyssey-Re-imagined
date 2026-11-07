Sub Main(Player as Long)
dim Loop as Long
SetPlayerFlag(Player, 17, 1)

For Loop = 1 To GetMaxUsers()
	If GetPlayerMap(Loop) = 554 Then
		If GetPlayerX(Loop) = 7 & GetPlayerY(Loop) = 1 Then
			SetPlayerFlag(Loop, 17, 2)
		End If
	End If
Next Loop

End Sub