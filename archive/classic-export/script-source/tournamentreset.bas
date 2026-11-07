Sub Main()
dim Loop as Long

For Loop = 170 To 178
	SetFlag(Loop, 0)
Next Loop

For Loop = 1 To GetMaxUsers()
	If GetPlayerMap(Loop) = 1883 Then PlayerWarp(Loop, 1883, 5, 11)
Next Loop

MapMessage(1883, "The Tournament Arena has been reset.", Yellow)

End Sub