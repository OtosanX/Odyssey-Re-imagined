Sub Main()
dim Light as Long

Light = GetFlag(71)

If GetFlag(70) = 0 Then 'Daytime
	Light = Light + 5
	If Light > 140 Then
		Light = 135
		SetFlag(70, 1)
	End If
Else
	Light = Light - 5
	If Light < 20 Then
		Light = 20
		SetFlag(70, 0)
	End If
End If

SetFlag(71, Light)
SetOutdoorLight(Light)

End Sub