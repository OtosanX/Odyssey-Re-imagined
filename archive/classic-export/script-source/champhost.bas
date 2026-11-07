 Sub Main()
	If GetFlag(89) < 10 Then
		GlobalMessage("Solo the Champ is now open! Type /champ to join.", Yellow)
		SetFlag(89,25)
	Else
		GlobalMessage("Solo the Champ has closed.", Yellow)
		SetFlag(89,0)
	End If
End Sub