 Sub Main(Player as Long, Parm1 as Long)
	If GetFlag(80) = 0 Then
		If Parm1 = 0 Then
			SetFlag(180, 10000)
		Else
			SetFlag(180, Parm1)
		End If
		GlobalMessage(strcat("The Tournament Arena has been opened! Type /tourny with ", strcat(str(GetFlag(180)), " Gold to join.")), Yellow)
		SetFlag(80,60)
	Else
		GlobalMessage("The Tournament Arena has closed.", Yellow)
		SetFlag(80,0)
	End If
End Sub