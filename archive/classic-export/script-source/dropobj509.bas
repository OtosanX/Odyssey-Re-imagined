Function Main(Player as Long) as Long

If GetPlayerAccess(Player) = 0 Then
	PlayerMessage(Player, "You can't drop the Flag.", Grey)
	Main = Stop
Else
	Main = Continue
End If

End Function