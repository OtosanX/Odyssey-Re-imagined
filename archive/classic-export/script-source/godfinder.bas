Sub Main(Player AS LONG)
	Dim A As LONG
	For A = 1 to GetMaxUsers()
		If IsPlaying(A) & GetPlayerAccess(A) > 0 Then
			PlayerMessage(Player, StrCat(StrCat(GetPlayerUser(A), " - "), StrCat(StrCat(GetPlayerName(A), "  -  Map:  "), Str(GetPlayerMap(A)))), WHITE)
		End If
	Next A
End Sub