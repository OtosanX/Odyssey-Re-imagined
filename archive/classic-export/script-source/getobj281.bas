Function Main(Player as Long) AS LONG

If GetPlayerLevel(Player) < 30 Then
	Main = Stop
Else
	Main = Continue
End If

If HasObj(Player, 281) Then
	Main = Stop
Else
	Main = Continue
End If

End Function