Sub Main()
Dim A as Long
For A = 1 to GetMaxUsers()
   'SetPlayerStatus(A,22)
   SetPlayerHP(A, GetPlayerMaxHP(A))
   SetPlayerEnergy(A, GetPlayerMaxEnergy(A))
   SetPlayerMana(A, GetPlayerMaxMana(A))
Next A
End Sub