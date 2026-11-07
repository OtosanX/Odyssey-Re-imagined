Sub Main(Player AS LONG, Target AS LONG)
dim Map as Long, X as Long, Y as Long

	If GetPlayerFlag(Player, 90) = 1 Then 'Cleric Res
		If GetPlayerIsDead(Player) = 0 Then
			RunScript2("res", Player, Target)
		End If
	End If
	If GetPlayerFlag(Player, 94) = 1 Then 'Mage Telepathy
		If GetPlayerAccess(Target) = 0 Then
			RunScript2("playerscan", Player, Target)
		Else
			PlayerMessage(Player, "Gods are unaffected by your pesky mind tricks.", Grey)
		End If
	End If
	If GetPlayerFlag(Player, 96) > 0 Then 'Mage Sacrifice
		RunScript2("sacrifice", Player, Target)
	End If
	If GetPlayerFlag(Player, 204) > 0 Then	'Mage Evil Eye
		If GetPlayerFlag(Player, 23) = 0 Then
			If GetPlayerGuild(Player) = 0 & GetPlayerGuild(Target) > 0 Then
				PlayerMessage(Player, "Unguildeds may not spy on Guildeds.", Grey)
				SetPlayerFlag(Player, 204, 0)
			Else
				PlayerMessage(Player, strcat("Your Evil Eye is now tracking ", GetPlayerName(Target)), Yellow)
				SetPlayerFlag(Player, 209, Target)
				Timer(Player, 20, "Tag")
				SetPlayerFlag(Player, 204, 0)
				SetPlayerFlag(Player, 23, 1)
				RunScript1("SpellCooldown", Player)
			End If
		Else
			PlayerMessage(Player, "You must wait to cast.", Grey)
		End If
	End If
	If GetPlayerFlag(Player, 208) = 1 Then	'Cleric Damnation
		If GetPlayerIsDead(Target) = True Then
			If GetPlayerFlag(Target, 15) <> 2 Then
				SetPlayerFlag(Target, 15, 2)
				Map = GetPlayerMap(Target)
				X = GetPlayerX(Target)
				Y = GetPlayerY(Target)
				RunScript4("Explosion", Player, Map, X, Y)
			Else
				PlayerMessage(Player, "This soul has exploded.", White)
			End If
		End If
	End If
	If GetPlayerFlag(Target, 78) = 1 Then
		PlayerMessage(Player, strcat(GetPlayerName(Target), " is one of Fank's Henchmen!"), Green)
	End If
	If GetPlayerFlag(Target, 218) > 1 Then
		PlayerMessage(Player, strcat(GetPlayerName(Target), strcat(" has ruled over ToF Run ", strcat(str(GetPlayerFlag(Target, 218)), " times!"))), Green)
	Else
		If GetPlayerFlag(Target, 218) = 1 Then
			PlayerMessage(Player, strcat(GetPlayerName(Target), " has ruled over ToF Run!"), Green)
		End If
	End If
'	If GetPlayerFlag(Target, 125) > 0 Then
'		PlayerMessage(Player, strcat(GetPlayerName(Target), " has received knowledge of the Dark Arts!"), Blue)
'	End If
	Select Case GetPlayerFlag(Target, 215)
		Case 1
			PlayerMessage(Player, strcat(GetPlayerName(Target), " has slain the Champ single handed!"), Red)
		Case 2
			PlayerMessage(Player, strcat(GetPlayerName(Target), " has slain the Bremen in close quarters!"), Red)
		Case 3
			PlayerMessage(Player, strcat(GetPlayerName(Target), " has slain the Vorpal Bunny in close quarters!"), Red)
		Case 4
			PlayerMessage(Player, strcat(GetPlayerName(Target), " has stared into the eyes of Death and preveiled!"), Red)
	End Select
	If GetPlayerFlag(Player, 196) = 1 Then	'Cleric Damnation
			'If GetPlayerFlag(Target, 15) <> 2 Then
				'SetPlayerFlag(Target, 15, 2)
				Map = GetPlayerMap(Target)
				X = GetPlayerX(Target)
				Y = GetPlayerY(Target)
				RunScript4("magespell2", Player, Map, X, Y)
			'Else
				PlayerMessage(Player, "This soul has exploded.", White)
			'End If
			End if
End Sub