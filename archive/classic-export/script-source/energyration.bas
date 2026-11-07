Function Main(Player as Long) as Long
Dim A As Long

'Energy Draft
'Wine
'Bottle of Beer

A = HasObj(Player,40) + HasObj(Player, 7) + HasObj(Player, 90)
If A >= 5 Then
	Main = Stop
Else
	Main = Continue
End If

End Function