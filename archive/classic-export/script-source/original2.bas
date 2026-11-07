Function Main(player as long) as long
dim a as long

	GlobalMessage("A Free For All Carnage has started!", 9)
	GlobalMessage("Map: Flooded Death Island Carnage",white)

SetFlag(82, 0)
For A = 1 to GetMaxUsers()
	If IsPlaying(A) Then
		If GetPlayerMap(A) = 68 Then
			If GetPlayerAccess(A) = 0 Then
				SetPlayerFlag(A, 5, GetPlayerGuild(A))
				SetPlayerFlag(A, 10, 1)
				SetPlayerStatus(A, 9)
				SetPlayerGuild(A, 0)
				SetPlayerSprite(A, 125)
				PlayerWarp(A, 1555, Random(6) + 3, Random(6) + 3)
			Else
				PlayerWarp(A, 1555, 0, 0)
			End If
		End If
	End If
Next A

End Function