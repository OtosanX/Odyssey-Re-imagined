Sub Main()
dim A as Long, B as Long, C as Long

For A = 1 to GetMaxUsers()
	B = GetPlayerFlag(A, 40)
	C = GetPlayerFlag(A, 41)
	If B > 0 Then
		If B = 1 Then
			RunScript1("GameWarp", A)
			PlayerMessage(A, "You have been released from jail.", WHITE)
			SetPlayerFlag(A, 40, 0)
		Else
			SetPlayerFlag(A, 40, B - 1)
		End If
	End If
	If C > 0 Then
		If C = 1 Then
			PlayerMessage(A, "You have been unsquelched.", WHITE)
			SetPlayerFlag(A, 41, 0)
		Else
			SetPlayerFlag(A, 41, C - 1)
		End If
	End If
Next A

End Sub