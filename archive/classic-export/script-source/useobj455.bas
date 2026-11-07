FUNCTION Main(Player AS LONG) AS LONG
   Dim MyMap as Long
   Dim MyX as Long
   Dim MyY as Long
   Dim UsedAdvocate as Long
   MyMap = GetPlayerMap(Player)
   MyX = GetPlayerX(Player)
   MyY = GetPlayerY(Player)

   Dim A as Long
   For A = 1 to GetMaxUsers()
      If GetPlayerMap(A) = MyMap Then
         Dim DistX as Long, DistY as Long
         DistX = Abs(MyX - GetPlayerX(A))
         DistY = Abs(MyY - GetPlayerY(A))

         If DistX <= 1 & DistY <= 1 Then
            If Player = A Then
               'Do Nothing
            Else
               UsedAdvocate = 1
               AttackPlayer(Player, A, 255)
               AttackPlayer(Player, A, 255)
               AttackPlayer(Player, A, 255)
               AttackPlayer(Player, A, 255)
               AttackPlayer(Player, A, 255)
               AttackPlayer(Player, A, 255)
               AttackPlayer(Player, A, 255)
               AttackPlayer(Player, A, 255)
               AttackPlayer(Player, A, 255)
               AttackPlayer(Player, A, 255)
               AttackPlayer(Player, A, 255)
               AttackPlayer(Player, A, 255)
               AttackPlayer(Player, A, 255)
               AttackPlayer(Player, A, 255)
               AttackPlayer(Player, A, 255)
            End If
         End If   
      End If
   Next A

   If UsedAdvocate = 1 Then 
      GlobalMessage(StrCat(GetPlayerName(Player), " has used a Death's Advocate!"), BRIGHTGREEN)
      TakeObj(Player, 455, 1)
   End If

   Main = Continue
END FUNCTION