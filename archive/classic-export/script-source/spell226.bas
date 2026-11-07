Sub Main(Player AS LONG)
  If GetPlayerMana(Player) >= 75 then
     PlayCustomWav(Player, 0)

      CreatePlayerFloatText(Player, "Mak Dest Gustiv Sev!", BRIGHTGREEN)
      SetPlayerMana(Player, GetPlayerMana(Player) - 60)

      Dim A as Long
      Dim CurrentMap as Long, CurrentX as Long, CurrentY as Long
      Dim CalcX as Long, CalcY as Long

      CurrentMap = GetPlayerMap(Player)
      CurrentX = GetPlayerX(Player)
      CurrentY = GetPlayerY(Player)

      For A = 1 to GetMaxUsers()
         If IsPlaying(A) Then
            If CurrentMap = GetPlayerMap(A) Then
              
               
               If A = Player Then
                  'Do Nothing
				  
               Else
			Dim RandomStatus As Long
			RandomStatus = Random(1) + 1
                  CalcX = Abs(GetPlayerX(A) - CurrentX)
                  CalcY = Abs(GetPlayerY(A) - CurrentY)

                  If CalcX < 5 & CalcY < 5 Then
                     CreateCharacterEffect(CurrentMap,A,59,1,7,2,5)
                     'CreatePlayerFloatText(A, "10", BRIGHTred)
                     MagicAttackPlayer(Player, A, 58)
					 end if
                     End If
                  End If
               End If



      Next A

   Else
      PlayerMessage(Player, "You have insufficient mana to cast this spell.", grey)
   End If

End Sub


