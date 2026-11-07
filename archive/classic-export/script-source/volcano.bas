Function Main(player as long) as long
dim a as long, Sprite as Long

If Random(2) = 0 Then Sprite = 39 Else Sprite = 176

	GlobalMessage("A Free For All Carnage has started!", 9)
	GlobalMessage("Map: Volcano",white)
	  
SetFlag(82, 0)
For A = 1 to GetMaxUsers()
	If IsPlaying(A) Then
		If GetPlayerMap(A) = 68 Then
			If GetPlayerAccess(A) = 0 Then
				SetPlayerFlag(A, 5, GetPlayerGuild(A))
				SetPlayerFlag(A, 10, 1)
				SetPlayerStatus(A, 9)
				SetPlayerGuild(A, 0)
				SetPlayerSprite(A, Sprite)
				PlayerWarp(A, 109, 3 + random(6), 3 + random(6))
			Else
				PlayerWarp(A, 109, 1, 1)
			End If
		End If
	End If
Next A

End Function