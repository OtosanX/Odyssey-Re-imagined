Sub Main(Player as Long)

If GetFlag(160) = 4 Then
	CreateMapFloatText(1434, 6, 7, "Ping!", BrightGreen)
	SetFlag(160, 5)
Else
	CreateMapFloatText(1434, 6, 7, "Bzzt!", BrightRed)
	SetFlag(160, 0)
End If

End Sub