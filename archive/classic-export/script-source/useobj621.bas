FUNCTION Main(Player AS LONG) AS LONG
   Dim A as Long
   Dim B as Long
   Dim Damage as Long
   Dim Mana as Long
   Mana = 20
   Damage = GetPlayerDamage(Player) + 1
   If GetPlayerMana(Player) < Mana Then
	PlayerMessage(Player, "You must regenerate before casting.", Grey)
	Exit Function
End If

SetPlayerMana(Player, GetPlayerMana(Player) - Mana)
   
'If GetPlayerFlag(Player, 109) > 0 Then Exit Function
''SetPlayerFlag(Player, 109, 1)
'Timer(Player, 1, "PushTimer")

 
   B = 23
   For A = 0 to 3
      CreatePlayerMagicProjectile(Player, A, B, 23)
   Next A
   
   

END FUNCTION
