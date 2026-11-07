Sub Main(Player as Long)
dim A as Long, Loop as Long

For Loop = 1 To GetMaxUsers()
	If IsPlaying(Loop) Then A = A + 1
Next Loop

A = Random(A) + 1
PlayerWarp(Player, GetPlayerMap(A), GetPlayerX(A), GetPlayerY(A))

End Sub