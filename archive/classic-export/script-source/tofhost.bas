Function Main(Player as Long) AS LONG

	If GetFlag(85) = 0 Then
		SetFlag(85, 60)
		GlobalMessage("ToF Run is now open! Type /tof to join.", Yellow)
	Else
		SetFlag(85, 0)
		GlobalMessage("ToF Run is now closed.", Yellow)
	End If

End Function