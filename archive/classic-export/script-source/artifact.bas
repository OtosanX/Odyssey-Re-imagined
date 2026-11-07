Sub Main(Player as Long)
dim Loop as Long, Torch as Long, Candle as Long, Message as String

PlayerMessage(Player, "==Artifacts==", Yellow)
For Loop = 1 To GetMaxUsers()
	If HasObj(Loop, 393) Then Torch = Loop
	If HasObj(Loop, 389) Then Candle = Loop
Next Loop

If Torch = 0 Then
	Message = "Babylon Torch: -Free-"
Else
	Message = strcat("Babylon Torch: ", GetPlayerName(Torch))
End If
PlayerMessage(Player, Message, White)

If Candle = 0 Then
	Message = "Dragonia Candle: -Free-"
Else
	Message = strcat("Dragonia Candle: ", GetPlayerName(Candle))
End If
PlayerMessage(Player, Message, White)

End Sub