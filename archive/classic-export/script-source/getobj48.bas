Function Main(Player as Long) as Long

If RunScript1("Ration", Player) = 1 Then
	PlayerMessage(player, "You can not carry more than three ration items.", Grey)
	Main = Stop
Else
	Main = Continue
End If

End Function