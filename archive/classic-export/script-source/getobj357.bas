Function Main(Player as Long) as Long

If GetPlayerMap(Player) = 555 Then
	Main = Stop
	If HasObj(Player, 357) = 0 Then GiveObj(Player, 357, 1)
Else
	Main = Continue
End If

End Function