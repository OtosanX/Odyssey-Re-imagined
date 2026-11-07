Sub Main(Player as Long)
dim Loop as Long

For Loop = 1 To GetMaxUsers()
	If GetPlayerMap(Loop) = 1828 Then
		If GetPlayerY(Loop) = 1 Then
			If GetPlayerX(Loop) = 10 Then
				RunScript1("champ1", Loop)
			Else
				PlayerWarp(Loop, 1828, GetPlayerX(Loop) + 1, 1)
			End If
		End If
	End If
Next Loop

End Sub