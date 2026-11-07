Sub Main(Map as Long)
dim Loop as Long

If Map = 1423 Then
	For Loop = 1 To GetMaxUsers()
		If GetPlayerFlag(Loop, 10) = 11 Then
			Select Case GetPlayerFlag(Loop, 11)
				Case 1
					PlayerWarp(Loop, 1424, 4, 5)
				Case 2
					PlayerWarp(Loop, 1424, 9, 6)
				Case 3
					PlayerWarp(Loop, 1424, 5, 0)
				Case Else
					PlayerWarp(Loop, 1424, 6, 11)
			End Select
		End If
	Next Loop
	SpawnObject(1424, 282, 1, 5, 5)
Else
	For Loop = 1 To GetMaxUsers()
		If GetPlayerFlag(Loop, 10) = 11 Then
			Select Case GetPlayerFlag(Loop, 11)
				Case 1
					PlayerWarp(Loop, 1424, 2, 5)
				Case 2
					PlayerWarp(Loop, 1424, 7, 6)
				Case 3
					PlayerWarp(Loop, 1424, 5, 0)
				Case Else
					PlayerWarp(Loop, 1424, 6, 11)
			End Select
		End If
	Next Loop
	SpawnObject(1424, 282, 1, 6, 6)
End If

End Sub