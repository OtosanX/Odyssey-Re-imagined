Function Main(Player as Long) AS LONG
dim Loop as Long

GlobalMessage("TREATS FOR ALL!!", BrightGreen)

For Loop = 1 To GetMaxUsers()
	GiveObj(Loop, 487, 1)
Next Loop

End Function