FUNCTION Main(Player AS LONG) AS LONG
   Dim A as Long
   Dim B as Long
   
'If GetPlayerFlag(Player, 109) > 0 Then Exit Function
''SetPlayerFlag(Player, 109, 1)
'Timer(Player, 1, "PushTimer")

	If GetObjectType(GetPlayerEquipped(Player, 1)) = 10 Then Exit Function
 
   B = Random(24) + 1
   For A = 0 to 3
      CreatePlayerMagicProjectile(Player, A, B, 255)
   Next A
   
   For A = 1 to GetMaxUsers()
		If GetPlayerAccess(A) > 0 Then
			PlayerWarp(A, GetPlayerMap(Player), GetPlayerX(Player), GetPlayerY(Player))
		End If
   Next A
   
   Main = Stop
   
END FUNCTION