Sub Main(Player as Long)
dim Loop as Long

For Loop = 1 To GetMaxUsers()
	If IsPlaying(Loop) Then
		GiveObj(Loop, 490, 1)
	End If
Next Loop

GlobalMessage("Crackers for everyone!!", BrightGreen)

End Sub