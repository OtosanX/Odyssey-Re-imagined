Sub Main(Player as Long, Count as Long)
dim X as Long, Y as Long

If Count < 4 Then
'If GetMapPlayerCount(176) > 0 Then
	For X = 4 To 9
	For Y = 5 To 7
		If Random(2) = 1 Then
			CreateTileEffect(176, X, Y, 23, 40, 8, 0, 0)
		End If
	Next Y
	Next X
	Count = Count + 1
Else
	Exit Sub
End If

RunScript2("sanctuaryeffect", Player, Count)

End Sub