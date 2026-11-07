Sub Main(Player as Long)

If GetFlag(160) = 1 Then
	CreateMapFloatText(1434, 6, 9, "Ping!", BrightGreen)
	SetFlag(160, 2)
Else
	CreateMapFloatText(1434, 6, 9, "Bzzt!", BrightRed)
	SetFlag(160, 0)
End If

End Sub