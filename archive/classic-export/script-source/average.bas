Sub Main()
	Dim A as Long, B as Long, C as Long, D as Long, E as Long, F as Long
	For A = 1 to GetMaxUsers()
	 If IsPlaying(A) & GetPlayerAccess(A) = 0 Then
		B = B + 1
		C = C + GetPlayerLevel(A)
		If GetPlayerLevel(A) = 80 Then D = D + 1
		If GetPlayerGuild(A) > 0 Then F = F + 1
	 End If
	Next A
	E = Divide(C, B)
	F = Divide(F * 100, B)
	GlobalMessage(StrCat(StrCat(Str(B), " Players' Average Level:  "), Str(E)), WHITE)
	GlobalMessage(StrCat("Players at Level 80:  ", Str(D)), WHITE)
	GlobalMessage(StrCat(StrCat("Guilded Population:  ", Str(F)), "%"), WHITE)
'	GlobalMessage("Players' Average IQ: 4", White)
End Sub