Function Main(Player as Long) as Long
dim A as Long, Slot as Long

A = 0
For Slot = 1 To 20
	If GetPlayerInvObject(Player, Slot) = 0 Then A = A + 1
Next Slot

If A = 0 Then Main = Stop Else Main = Continue

End Function