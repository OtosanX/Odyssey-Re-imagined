Sub Main(Player as Long)
dim Damage as Long

Select Case Random(6)
	Case 0
		Damage = 15
	Case 1
		Damage = 10
	Case 2
		Damage = 10
	Case Else
		Damage = 5
End Select

If GetPlayerHP(Player) > Damage Then SetPlayerHP(Player, GetPlayerHP(Player) - Damage)
PlayerMessage(Player, "Ouch, you got burnt!", Red)

End Sub