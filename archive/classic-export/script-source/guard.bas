Sub Main(Player as Long, Attack as Long)
	Dim A as Long, B as Long
	If StrCmp(GetPlayerUser(Player), "acidman") Then A = 1262
	If StrCmp(GetPlayerUser(Player), "maxell") Then A = 1262
	If StrCmp(GetPlayerUser(Player), "t3st3r") Then A = 1262
	If StrCmp(GetPlayerUser(Player), "t3st3r2") Then A = 1262
	If StrCmp(GetPlayerUser(Player), "sdf") Then A = 826
	If StrCmp(GetPlayerUser(Player), "spzero89") Then A = 992
	If StrCmp(GetPlayerUser(Player), "racer") Then A = 992
	If StrCmp(GetPlayerUser(Player), "darkbuddy102938") Then A = 686
	If StrCmp(GetPlayerUser(Player), "endeavor") Then A = 686
	If StrCmp(GetPlayerUser(Player), "fankawhore") Then A = 686
	If StrCmp(GetPlayerUser(Player), "zorlax") Then A = 1633
	If StrCmp(GetPlayerUser(Player), "dengalepony") Then A = 1633
	If StrCmp(GetPlayerUser(Player), "mad_orber") Then A = 1679
	If StrCmp(GetPlayerName(Player), "cowman") Then
		If GetPlayerMap(Player) = 826 Then A = 826
		If GetPlayerMap(Player) = 827 Then A = 827
		If GetPlayerMap(Player) = 828 Then A = 828
	End If
	If StrCmp(GetPlayerName(Player), "bloodythief") Then A = 1690
	If StrCmp(GetPlayerName(Player), "xsin") Then A = 1690
	If StrCmp(GetPlayerUser(Player), "devilmaycry3") Then A = 1582
	If StrCmp(GetPlayerName(Player), "deathchant") Then A = 1582
	If StrCmp(GetPlayerUser(Player), "tpyboymilwaukee") Then A = 1763	
	If StrCmp(GetPlayerUser(Player), "toyboymilwaukee") Then A = 1763
	
	If StrCmp(GetPlayerUser(Player), "dcm") | StrCmp(GetPlayerName(Player), "Mader") | StrCmp(GetPlayerName(Player), "xsin") Then A = 1171
	If StrCmp(GetPlayerName(Player), "Farik") Then A = 1171
	If StrCmp(GetPlayerName(Player), "Dom") | StrCmp(GetPlayerName(Player), "carrot") Then A = 1726
	If StrCmp(GetPlayerName(Player), "Grimm") Then A = 1986
	If StrCmp(GetPlayerUser(Player), "soulreaper2") Then A = 1986

	If A > 0 Then
		For B = 0 to 5
			If GetMonsterType(A, B) = 118 Then
				SetMonsterTarget(A, B, Attack)
			End If
		Next B
	End If
End Sub