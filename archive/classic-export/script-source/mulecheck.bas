Sub Main(Player AS LONG)
	Dim A AS LONG, B As LONG
	Dim DupeCount AS LONG
	
	For A = 1 to 80
		SetPlayerFlag(A, 256, 0)
	Next A
	
	For A = 1 to 80
		If IsPlaying(A) Then
			For B = 1 to 80
				If IsPlaying(B) Then
					If A = B Then
					
					Else
						If StrCmp(GetPlayerIP(A), GetPlayerIP(B)) Then
							If GetPlayerFlag(B, 256) = 0 Then
								SetPlayerFlag(A, 256, 1)
								SetPlayerFlag(B, 256, 1)
								DupeCount = DupeCount + 1
								PlayerMessage(Player, StrCat(StrCat(GetPlayerName(A), " - "), GetPlayerName(B)), WHITE)
							End If
						End If
					End If
				End If
			Next B
		End If
	Next A
	
	PlayerMessage(Player, StrCat("Total dupes: ", Str(DupeCount)), WHITE)
	
	For A = 1 to 80
		SetPlayerFlag(A, 256, 0)
	Next A
End Sub