Sub Main()
dim Loop as Long



For Loop = 1 to GetMaxUsers()
	If IsPlaying(Loop) Then
		If GetPlayerMap(Loop) = 2119 Then
					PlayerWarp(Loop, 1, 5, 5)
				Else
			End If
		End If

Next Loop

End Sub

