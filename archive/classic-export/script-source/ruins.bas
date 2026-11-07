Function Main(player as long) as long
dim a as long

	GlobalMessage("A Free For All Carnage has started!", 9)
	GlobalMessage("Map: Ruins of Crendale",white)
	  
SetFlag(82, 0)
For A = 1 to GetMaxUsers()
	If IsPlaying(A) Then
		If GetPlayerMap(A) = 68 Then
			If GetPlayerAccess(A) = 0 Then
				SetPlayerFlag(A, 5, GetPlayerGuild(A))
				SetPlayerFlag(A, 10, 1)
				SetPlayerStatus(A, 9)
				SetPlayerGuild(A, 0)
				SetPlayerSprite(A, 11)
				PlayerWarp(A, 1011, 3 + random(7), 3 + random(7))
			Else
				PlayerWarp(A, 1011, 0, 1)
			End If
		End If
	End If
Next A

End Function