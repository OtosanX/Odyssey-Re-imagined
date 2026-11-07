Sub Main(Player as Long)
dim Loop as Long, X as Long, Y as Long
dim RedCount as Long, BlueCount as Long, RedGate as Long, BlueGate as Long

If GetPlayerMap(Player) = 1443 Then
	If GetPlayerFlag(Player, 10) <> 13 Then
		PlayerMessage(Player, "You cannot start a Team Battle.", Grey)
		Exit Sub
	End If
Else
	PlayerMessage(Player, "This is not the Team Arena.", Grey)
	Exit Sub
End If

For Loop = 1 To GetMaxUsers()
	If GetPlayerMap(Loop) = 1443 Then
		If GetPlayerFlag(Loop, 10) = 13 Then
				If GetPlayerFlag(Loop, 11) = 1 Then RedCount = RedCount + 1
				If GetPlayerFlag(Loop, 11) = 2 Then BlueCount = BlueCount + 1
			X = GetPlayerX(Loop)
			Y = GetPlayerY(Loop)
			If Y = 1 Then
				If X = 0 | X = 1 Then RedGate = RedGate + 1
				If X = 10 | X = 11 Then BlueGate = BlueGate + 1
			End If
		End If
	End If
Next Loop

If RedGate < 2 | BlueGate < 2 Then
	PlayerMessage(Player, "There are not enough players on the start tiles.", White)
	Exit Sub
End If

MapMessage(1443, strcat("A Team Battle has started - ", strcat(str(RedCount), strcat("v", str(BlueCount)))), Yellow)
SetFlag(153, 1)
For Loop = 1 To GetMaxUsers()
	If GetPlayerMap(Loop) = 1443 Then
		If GetPlayerFlag(Loop, 10) = 13 Then
			If GetPlayerFlag(Loop, 11) = 1 Then PlayerWarp(Loop, 1443, 3 + Random(3), 1 + Random(3))
			If GetPlayerFlag(Loop, 11) = 2 Then PlayerWarp(Loop, 1443, 8 - Random(3), 6 - Random(3))
		End If
	End If
Next Loop

End Sub