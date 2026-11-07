Function Main(Player as Long, Cost as Long) AS LONG
dim Loop as Long

If GetFlag(122) = 0 Then
	If Cost = 0 Then Cost = 10000
	SetFlag(124, Cost)
	GlobalMessage(strcat("The Odyssey Lottery is now open! Type /lottery with ", strcat(str(GetFlag(124)), " Gold to play!")), BrightGreen)
	SetFlag(122, 1)
Else
'	GlobalMessage("The Odyssey Lottery is now closed.", Grey)
'	SetFlag(120, 0)
'	SetFlag(121, 0)
'	SetFlag(122, 0)
'	For Loop = 1 To GetMaxUsers()
'		If GetPlayerFlag(Loop, 220) > 0 Then
'			SetPlayerFlag(Loop, 220, 0)
'			GiveObj(Loop, 6, GetFlag(124))
'			TakeObj(Loop, 481, 1)
'		End If
'	Next Loop
	PlayerMessage(Player, "Lottery is already open.", White)
End If

End Function