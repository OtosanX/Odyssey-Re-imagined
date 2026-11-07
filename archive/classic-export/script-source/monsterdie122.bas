Function Main(Player as Long) AS LONG
dim Loop as Long

If GetPlayerFlag(Player, 201) = 0 Then
	Main = Continue
Else
	For Loop = 1 To GetMaxUsers()
		If Loop <> Player Then
'			If strcmp(GetPlayerIP(Loop), GetPlayerIP(Player)) Then
'				Main = Stop
'			Else
				If GetPlayerFlag(Loop, 201) = GetPlayerFlag(Player, 201) Then
					If GetPlayerMap(Loop) = GetPlayerMap(Player) Then
						GivePlayerExp(Loop, 100)
					End If
				End If
'			End If
		End If
	Next Loop
End If

End Function