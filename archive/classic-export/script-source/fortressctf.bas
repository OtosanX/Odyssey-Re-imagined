function main(player as long) as long   
dim a as long, b as long, c as long, d as long

   GlobalMessage("Capture the Flag has started!", 9)
   B = 0
   C = 0
   For A = 1 to 10
      SpawnObject(70, 40, 1, A, 1)
      SpawnObject(78, 40, 1, A, 10)
   Next A
   For A = 1 to 10
      SpawnObject(70, 40, 1, A, 10)
      SpawnObject(78, 40, 1, A, 1)
   Next A
   For A = 1 to 80
      If GetPlayerMap(A) = 79 Then
       If A = Player | GetPlayerAccess(A) > 0 Then
          PlayerWarp(Player, 74, 3, 3)
       Else   
         D = Random(2)
         If D = 0 Then
            If B > C Then
               C = C + 1
               SetPlayerGuild(A, 31)
               SetPlayerSprite(A, 92)
               SetPlayerStatus(A, 3)
               PlayerWarp(A, 78, 5, 5)
            Else
               B = B + 1
               SetPlayerGuild(A, 30)
               SetPlayerSprite(A, 102)
               SetPlayerStatus(A, 22)
               PlayerWarp(A, 70, 5, 5)
            End If
         Else
            If C > B Then
               B = B + 1
               SetPlayerGuild(A, 30)
               SetPlayerSprite(A, 102)
               SetPlayerStatus(A, 22)
               PlayerWarp(A, 70, 5, 5)
            Else
               C = C + 1
               SetPlayerGuild(A, 31)
               SetPlayerSprite(A, 92)
               SetPlayerStatus(A, 3)
               PlayerWarp(A, 78, 5, 5)
            End If
         End If
       End If
      End If
   Next A
   Main = Stop
   Exit Function

end function