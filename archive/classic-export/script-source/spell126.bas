Sub Main(Player as Long)
Dim A as Long, CalcX as Long, CalcY as Long, Mana as Long
Dim CurrentMap as Long, CurrentX as Long, CurrentY as Long
'Mage Spell - Drain

CurrentMap = GetPlayerMap(Player)
CurrentX = GetPlayerX(Player)
CurrentY = GetPlayerY(Player)

If GetPlayerFlag(Player, 23) > 0 Then
	PlayerMessage(Player, "You must wait to cast again.", Grey)
	Exit Sub
End If

SetPlayerFlag(Player, 23, 1)
RunScript1("SpellCooldown", Player)
CreatePlayerFloatText(Player, "By Zag Ma!", BrightGreen)

For A = 1 To GetMaxUsers()
	If IsPlaying(A) Then
		If A <> Player Then
			If GetPlayerMap(A) = GetPlayerMap(Player) Then
				If GetPlayerIsDead(A) = 1 Then
					CalcX = Abs(GetPlayerX(A) - CurrentX)
					CalcY = Abs(GetPlayerY(A) - CurrentY)
					If CalcX < 3 & CalcY < 3 Then
						Mana = GetPlayerMana(A)
						SetPlayerMana(Player, GetPlayerMana(Player) + Mana)
						If GetPlayerMana(Player) > GetPlayerMaxMana(Player) Then SetPlayerMana(Player, GetPlayerMaxMana(Player))
						CreateCharacterEffect(GetPlayerMap(A), A, 51, 40, 8, 0, 0)
					End If
				End If
			End If
		End If
	End If
Next A
	
End Sub