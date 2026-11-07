Function Main(Player as Long) AS LONG
dim Loop as Long

For Loop = 0 To GetMaxUsers()
	If GetPlayerStatus(Loop) = 9 Then
		If GetPlayerFlag(Loop, 25) = 0 Then
			SetPlayerStatus(Loop, 0)
		End If
	End If
Next Loop

End Function