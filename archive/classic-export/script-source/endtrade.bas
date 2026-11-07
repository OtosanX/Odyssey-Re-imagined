sub main(player as long)
dim a as long
'Dim SkipCounter as Long
'SkipCounter = 0

If GetFlag(40) = 1 Then
mapmessage(305, "The Trade has ended. Another can now begin.", white)
setflag(40,0)

For A = 1 to GetMaxUsers()
   If GetPlayerMap(A) = 305 Then
'      If SkipCounter >= C Then
         playerwarp(a, 305,6,10)
      End If
Next A
End If

end sub