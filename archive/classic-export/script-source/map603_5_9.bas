Sub Main(Player as Long)
dim Loop as Long

CreateTileEffect(603, 0, 2, 11, 40, 8, 0, 0)
CreateTileEffect(603, 2, 2, 11, 40, 8, 0, 0)
CreateTileEffect(603, 2, 4, 11, 40, 8, 0, 0)
CreateTileEffect(603, 3, 7, 11, 40, 8, 0, 0)
CreateTileEffect(603, 5, 2, 11, 40, 8, 0, 0)
CreateTileEffect(603, 5, 7, 11, 40, 8, 0, 0)
CreateTileEffect(603, 7, 4, 11, 40, 8, 0, 0)
CreateTileEffect(603, 7, 9, 11, 40, 8, 0, 0)
CreateTileEffect(603, 9, 4, 11, 40, 8, 0, 0)
CreateTileEffect(603, 9, 8, 11, 40, 8, 0, 0)
CreateTileEffect(603, 9, 11, 11, 40, 8, 0, 0)
CreateTileEffect(603, 11, 9, 11, 40, 8, 0, 0)

For Loop = 1 To GetMaxUsers()
	If GetPlayerMap(Loop) = 603 Then
		If GetTileAtt(603, GetPlayerX(Loop), GetPlayerY(Loop)) = 5 Then
			MagicAttackPlayer(Player, Loop, 10)
		End If
	End If
Next Loop

End Sub