SUB Main(Player AS LONG)
Dim A as Long, B as Long, RedFlag as Long, BlueFlag as Long
RedFlag = 492
BlueFlag = 493
If GetPlayerGuild(Player) = 31 Then
   If HasObj(Player, RedFlag) Then
      For B = 1 to 80
         If HasObj(B, BlueFlag) Then
            PlayerMessage(Player, "You must recover your flag first!", 15)
            Exit Sub
         End If
      Next B
      TakeObj(Player, RedFlag, 1)
      SpawnObject(1552, RedFlag, 1, 0, 8)
      GlobalMessage(StrCat(GetPlayerName(Player), " returned the Red Flag to the Blue Base.  Blue Team Wins!"), 11)
      GiveObj(Player, 504, 1)
      For A = 1 to 80
         If GetPlayerMap(A) = 1552 Then
               If HasObj(A, RedFlag) Then
                  TakeObj(A, RedFlag, 1)
                  SpawnObject(78, RedFlag, 1, 10, 5)
               End If
               PlayerWarp(A, 79, 5, 5)
               If GetPlayerGuild(A) = 31 Then GiveObj(A, 504, 1)
               If GetPlayerAccess(A) = 0 Then
                  SetPlayerGuild(A, 0)
                  SetPlayerSprite(A, 0)
                  SetPlayerStatus(A, 0)
               End If
         End If
      Next A
   Else
      PlayerWarp(Player, 78, 10, 7)
   End If
Else
   PlayerWarp(Player, 78, 10, 7)
End If
END SUB