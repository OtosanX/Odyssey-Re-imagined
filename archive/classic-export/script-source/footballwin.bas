Sub Main()

If GetFlag(100) > GetFlag(101) Then
	GlobalMessage(strcat("Red Team has won Bloodball ", strcat(str(GetFlag(100)), strcat(" - ", str(GetFlag(101))))), BrightGreen)
Else
	If GetFlag(100) = GetFlag(101) Then
		GlobalMessage(strcat("Bloodball ends a draw ", strcat(str(GetFlag(100)),strcat(" - ", str(GetFlag(101))))), Green)
	Else
		GlobalMessage(strcat("Blue Team has won Bloodball ", strcat(str(GetFlag(101)), strcat(" - ", str(GetFlag(100))))), BrightGreen)
	End If
End If

End Sub