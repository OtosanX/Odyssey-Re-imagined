FUNCTION Main(Player AS LONG) AS LONG
	TakeObj(Player, 485, 1)
   Main = Stop
   
   Exit Function

   Dim A as Long, B as Long, C as Long, D as Long, E as Long
   Select Case GetPlayerDirection(Player)
      Case UP
         A = GetPlayerX(Player)
         B = GetPlayerY(Player) - 1
         D = GetPlayerMap(Player)
         E = B - 1
         If B < 0 Then Exit Function
         For C = 1 to GetMaxUsers()
            If GetPlayerMap(C) = D & GetPlayerX(C) = A & GetPlayerY(C) = B Then
               If GetTileAtt(D, A, E) = 0 Then PlayerWarp(C, D, A, E)
            End If
         Next A
      Case DOWN
         A = GetPlayerX(Player)
         B = GetPlayerY(Player) + 1
         D = GetPlayerMap(Player)
         E = B + 1
         If B > 10 Then Exit Function
         For C = 1 to GetMaxUsers()
            If GetPlayerMap(C) = D & GetPlayerX(C) = A & GetPlayerY(C) = B Then
               If GetTileAtt(D, A, E) = 0 Then PlayerWarp(C, D, A, E)
            End If
         Next A
      Case LEFT
         A = GetPlayerX(Player) - 1
         B = GetPlayerY(Player)
         D = GetPlayerMap(Player)
         E = A - 1
         If A < 0 Then Exit Function
         For C = 1 to GetMaxUsers()
            If GetPlayerMap(C) = D & GetPlayerX(C) = A & GetPlayerY(C) = B Then
               If GetTileAtt(D, E, B) = 0 Then PlayerWarp(C, D, E, B)
            End If
         Next A
      Case RIGHT
         A = GetPlayerX(Player) + 1
         B = GetPlayerY(Player)
         D = GetPlayerMap(Player)
         E = A + 1
         If A > 10 Then Exit Function
         For C = 1 to GetMaxUsers()
            If GetPlayerMap(C) = D & GetPlayerX(C) = A & GetPlayerY(C) = B Then
               If GetTileAtt(D, E, B) = 0 Then PlayerWarp(C, D, E, B)
            End If
         Next A
   End Select
END FUNCTION