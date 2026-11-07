function main(player as long) as long
dim a as long, b as long, c as long, d as long  

 GlobalMessage("Deathball has started!", 9)
   B = 0
   C = 0
   For A = 1 to 80
      If GetPlayerMap(A) = 90 Then
       If A = Player | GetPlayerAccess(A) > 0 Then
          PlayerWarp(Player, 91, 6, 0)
       Else   
         D = Random(2)
         If D = 0 Then
            If B > C Then
               C = C + 1
               SetPlayerGuild(A, 31)
               SetPlayerSprite(A, 1)
               PlayerWarp(A, 91, 1, Random(10))
            Else
               B = B + 1
               SetPlayerGuild(A, 30)
               SetPlayerSprite(A, 102)
               PlayerWarp(A, 91, 10, Random(10))
            End If
         Else
            If C > B Then
               B = B + 1
               SetPlayerGuild(A, 30)
               SetPlayerSprite(A, 102)
               PlayerWarp(A, 91, 10, Random(10))
            Else
               C = C + 1
               SetPlayerGuild(A, 31)
               SetPlayerSprite(A, 1)
               PlayerWarp(A, 91, 1, Random(10))
            End If
         End If
       End If
      End If
   Next A
   Main = Stop
   Exit Function
end function