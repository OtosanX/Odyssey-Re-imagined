Sub Main(Player as Long)

If GetFlag(160) = 2 Then
	CreateMapFloatText(1434, 4, 9, "Ping!", BrightGreen)
	SetFlag(160, 3)
Else
	CreateMapFloatText(1434, 4, 9, "Bzzt!", BrightRed)
	SetFlag(160, 0)
End If

End Sub