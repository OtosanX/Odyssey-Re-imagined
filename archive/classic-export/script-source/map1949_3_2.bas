Sub Main(Player as Long)
dim Loop as Long
If GetPlayerFlag(Player, 13) = 2 Then SetPlayerFlag(Player, 13, 1)

For Loop = 1 To GetMaxUsers()
	If GetPlayerMap(Loop) = 1949 Then
		If GetPlayerX(Loop) = 10 & GetPlayerY(Loop) = 4 Then
			SetPlayerFlag(Loop, 13, 2)
		End If
	End If
Next Loop

End Sub