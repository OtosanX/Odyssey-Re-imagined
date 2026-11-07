Function main(player as long) as long
Dim a as long, b as long, c as long, d as long


Dim SkipCounter as Long
SkipCounter = 0

if getflag(101) = 1 then
b = random(50)+50
timer(player, b, "khargattack4")
For A = 1 to GetMaxUsers()
   If GetPlayerMap(A) = 1572 Then
      If SkipCounter >= C Then
	playermessage(a, "Your mind swims, and suddenly you lose faith in your allies.", grey)
	 SetPlayerGuild(a, 0)
         Exit Function
      End If
      SkipCounter = SkipCounter + 1
   End If
Next A
end if
main = continue
End Function