Function Main(Player as Long) AS LONG

If GetPlayerFlag(Player, 10) = 1 Then
	If HasObj(Player, 505) = 0 Then
		GiveObj(Player, 505, 1)
	End If
End If

End Function