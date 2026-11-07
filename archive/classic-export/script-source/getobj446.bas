Function Main(Player as Long) AS LONG
dim Ration as Long
Ration = HasObj(Player, 445) + HasObj(Player, 446) + HasObj(Player, 447)

If Ration > 1 Then
	Main = Stop
	PlayerMessage(Player, "You may only carry two stat potions.", Grey)
Else
	Main = Continue
End If

End Function