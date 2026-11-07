function main(player as long) as long
dim a as long

   GlobalMessage("A Team Carnage has started!", 9)
   For A = 1 to 80
      If GetPlayerMap(A) = 68 Then 
         If GetPlayerGuild(A) = 30 Then PlayerWarp(A, 69, 3, 3)
         If GetPlayerGuild(A) = 31 Then PlayerWarp(A, 69, 8, 8)
         If GetPlayerGuild(A) = 32 Then PlayerWarp(A, 69, 3, 8)
         If GetPlayerAccess(A) > 10 Then PlayerWarp(A, 69, 2, 1)
      End If
   Next A
   Main = Stop
   Exit Function
end function