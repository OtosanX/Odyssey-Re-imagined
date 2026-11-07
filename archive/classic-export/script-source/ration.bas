Function Main(Player as Long) AS LONG
dim Ration as Long

'HP Potion
'Ancient Tome
'Sushi
'Fish Cakes
'Fish Stew
'Candy Apple
'Kank's Cake
'Cookie
'Witch's Brew

Ration = HasObj(Player, 39) + HasObj(Player, 99) + HasObj(Player, 48) + HasObj(Player, 329) + HasObj(Player, 330) + HasObj(Player, 41) + HasObj(Player, 138) + HasObj(Player, 198) + HasObj(Player, 149)
If Ration >= 5 Then
	Main = Stop
Else
	Main = Continue
End If

End Function