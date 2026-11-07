Function Main(Player as Long) as Long
dim Loop as Long, Chance as Long, Object as Long

'Party Leveling
If GetPlayerFlag(Player, 201) > 0 Then
	For Loop = 1 To GetMaxUsers()
		If Loop <> Player Then
'			If strcmp(GetPlayerIP(Loop), GetPlayerIP(Player)) Then
'				Main = Stop
'			Else
				If GetPlayerFlag(Loop, 201) = GetPlayerFlag(Player, 201) Then
					If GetPlayerMap(Loop) = GetPlayerMap(Player) Then
						GivePlayerExp(Loop, 75)
					End If
				End If
'			End If
		End If
	Next Loop
End If

Chance = 20000
Object = 356
RunScript3("RareDrop", Player, Chance, Object)

Main = Continue

End Function