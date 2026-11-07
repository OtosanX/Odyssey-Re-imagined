Sub Main(Player as Long)

If GetFlag(160) = 3 Then
	CreateMapFloatText(1434, 5, 8, "Ping!", BrightGreen)
	SetFlag(160, 4)
Else
	CreateMapFloatText(1434, 5, 8, "Bzzt!", BrightRed)
	SetFlag(160, 0)
End If

End Sub