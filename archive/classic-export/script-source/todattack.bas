Function main(player as long) as long
Dim a as long, b as long, c as long, d as long
b = getmaxusers()
d = getmapplayercount(1563)
c = random(d)


Dim SkipCounter as Long
SkipCounter = 0
For A = 1 to GetMaxUsers()
   If GetPlayerMap(A) = 1563 Then
      If SkipCounter >= C Then
         SetMonsterTarget(1563, 1, A)
         mapmessage(1563, StrCat("The Touch of Death has been commanded to attack ", GetPlayerName(A)), white)
         Timer(A, 15, "todattack")
         Exit Function
      End If
      SkipCounter = SkipCounter + 1
   End If
Next A

'If the script got here, we didn't find a target
ResetMap(1563)

main = continue
End Function