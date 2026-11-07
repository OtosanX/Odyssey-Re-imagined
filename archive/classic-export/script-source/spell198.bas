Sub Main(Player as Long)
dim Map as Long, X as Long, Y as Long
dim Loop as Long, CalcX as Long, CalcY as Long
dim Mana as Long

Map = GetPlayerMap(Player)
X = GetPlayerX(Player)
Y = GetPlayerY(Player)
Mana = Divide((GetPlayerMaxMana(Player) - Divide(GetPlayerWisdom(Player), 2)), 4)

If GetPlayerGuild(Player) = 0 Then
	PlayerMessage(Player, "You must be guilded to use this spell.", Grey)
	Exit Sub
End If
If GetPlayerFlag(Player, 27) > 0 Then
	PlayerMessage(Player, "You must wait to cast again.", Grey)
	Exit Sub
End If
If GetPlayerMana(Player) < Mana Then
	PlayerMessage(Player, "You must regenerate before casting.", Grey)
	Exit Sub
End If

CreatePlayerFloatText(Player, "Eva Nescent!", BrightGreen)
SetPlayerFlag(Player, 27, 1)
SetPlayerMana(Player, GetPlayerMana(Player) - Mana)

For Loop = 1 To GetMaxUsers()
	If GetPlayerMap(Loop) = Map Then
		If GetPlayerGuild(Loop) = GetPlayerGuild(Player) Then
			CalcX = Abs(GetPlayerX(Loop) - X)
			CalcY = Abs(GetPlayerY(Loop) - Y)
			If CalcX < 4 & CalcY < 4 Then
				SetPlayerFlag(Loop, 19, GetPlayerSprite(Loop))
				SetPlayerFlag(Loop, 20, GetPlayerStatus(Loop))
				SetPlayerSprite(Loop, GetGuildSprite(GetPlayerGuild(Loop)))
				SetPlayerStatus(Loop, 9)
				SetPlayerFlag(Loop, 25, 1)
				Timer(Loop, 10, "TurnVisible3")
			End If
		End If
	End If
Next Loop

End Sub