Sub Main()
	dim Loop as Long

	For Loop = 1 To GetMaxUsers()
		If IsPlaying(Loop) Then
			If HasObj(Loop, 508) Then TakeObj(Loop, 508, HasObj(Loop, 508))
			If HasObj(Loop, 509) Then TakeObj(Loop, 509, HasObj(Loop, 509))
		End If
	Next Loop
	For Loop = 0 To 80
		If GetObjNum(70, Loop) = 508 Then DestroyObject(70, Loop)
		If GetObjNum(78, Loop) = 509 Then DestroyObject(78, Loop)
	Next Loop

	SpawnObject(70, 508, 1, 1, 6)
	SpawnObject(78, 509, 1, 10, 6)

	SetFlag(181, 0)
	SetFlag(182, 0)
End Sub