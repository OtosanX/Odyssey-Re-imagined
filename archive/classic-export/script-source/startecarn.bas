Sub Main()
   Dim A as Long
   GlobalMessage("Equal opportunity carnage has started!", BRIGHTGREEN)
   For A = 1 to GetMaxUsers()
      If GetPlayerMap(A) = 92 Then
         If GetPlayerAccess(A) = 0 Then
            SetPlayerStatus(A, 9)
            SetPlayerSprite(A, 128)
            If HasObj(A, 505) Then BanPlayer(A, 1, "Has Death Stick!")
            PlayerWarp(A, 69, Random(6) + 3, Random(6) + 3)
         Else
            PlayerWarp(A, 69, 1, 1)
         End If
      End If
   Next A
End Sub