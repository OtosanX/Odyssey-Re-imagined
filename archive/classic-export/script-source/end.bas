Function Main(player as long) as long
dim a as long

	GlobalMessage("A Free For All Carnage has started!", 9)
	GlobalMessage("Map: The Blank Map of Death",white)

SetFlag(82, 0)
For A = 1 to GetMaxUsers()
	If IsPlaying(A) Then
		If GetPlayerMap(A) = 68 Then
			If GetPlayerAccess(A) = 0 Then
				SetPlayerFlag(A, 5, GetPlayerGuild(A))
				SetPlayerFlag(A, 10, 1)
				SetPlayerStatus(A, 9)
				SetPlayerGuild(A, 0)
				SetPlayerSprite(A, 194)
				PlayerWarp(A, 1833, 5 + Random(3), 3 + Random(5))
			Else
				PlayerWarp(A, 1833, 0, 0)
			End If
		End If
	End If
Next A

End Function