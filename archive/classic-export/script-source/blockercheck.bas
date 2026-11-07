SUB MAIN()
	'House of PK
	Dim A AS LONG
	For A = 1 to GetMaxUsers()
		If GetPlayerMap(A) = 1960 Then
			If GetPlayerY(A) = 10 Then
				If GetPlayerX(A) >= 4 & GetPlayerX(A) =< 7 Then
					PlayerWarp(A, 1960, 11, 1)
				End If
			End If
		End If
	Next A
END SUB