function main(player as long, message as string) as long
dim a as long
if strcmp(message,"We give up.") then
   MapMessage(635, "The puzzle has been reset", BRIGHTGREEN)
   For A = 1 to GetMaxUsers()
      If GetPlayerMap(A) = 635 Then 
         PlayerWarp(A, 635, 5, 11)
      End If
   Next A
end if
main = continue
end function