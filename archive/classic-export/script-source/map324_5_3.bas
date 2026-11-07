Sub Main(Player as Long)

If Random(100) = 1 Then
	CreateMapFloatText(324, 6, 3, "Meow", White)
Else
	CreateMapFloatText(324, 6, 3, "Grrrr", BrightRed)
End If

End Sub