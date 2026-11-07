Sub Main(Player AS LONG)
	Dim A AS LONG, B AS LONG
	
	For A = 1 to GetMaxUsers()
		If GetPlayerMap(A) = 68 & GetPlayerAccess(A) = 0 Then
			B = B + 1
		End If
	Next A
	
	GlobalMessage(StrCat("Total players in waiting room: ", Str(B)), WHITE)
End Sub