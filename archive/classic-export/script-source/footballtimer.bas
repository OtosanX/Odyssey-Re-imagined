Sub Main()
dim Loop as Long
SetFlag(99, GetFlag(99) - 1)
'If GetFlag(99) = 3 Then
'	MapMessage(1426, "Half Time!!", BrightGreen)
'	For Loop = 1 To GetMaxUsers()
'		If GetPlayerFlag(Loop, 10) = 11 Then PlayerWarp(Loop, 1426, Random(12), Random(12))
'	Next Loop
'End If
If GetFlag(99) = 0 Then
	RunScript1("FootballWin", Loop)
	For Loop = 1 To GetMaxUsers()
		If GetPlayerFlag(Loop, 10) = 11 Then RunScript1("FootballEnd", Loop)
	Next Loop
	RunScript0("FootballReset")
End If

End Sub