SUB Main(Player AS LONG)
	Dim A as Long
	For A = 1 To GetMaxUsers
		If IsPlaying(A) Then
			If GetPlayerMap(A) = 305 Then
				If GetPlayerX(A) = 7 & GetPlayerY(A) = 1 Then
					PlayerWarp(A, 305, 10, 2)
				End If
			End If
		End If
	Next A
	
	PlayerWarp(Player, 305, 1, 2)
END SUB