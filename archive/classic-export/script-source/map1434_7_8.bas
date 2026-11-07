Sub Main(Player as Long)

If GetFlag(160) = 0 Then
	CreateMapFloatText(1434, 7, 8, "Ping!", BrightGreen)
	SetFlag(160, 1)
Else
	CreateMapFloatText(1434, 7, 8, "Bzzt!", BrightRed)
	SetFlag(160, 0)
End If

End Sub