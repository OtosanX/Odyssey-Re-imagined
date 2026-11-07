sub main(player as long)
'If StrCmp(Command, "RESET") & GetPlayerAccess(Player) > 10 Then
'   For A = 1 to 80
'      If GetPlayerFlag(A, 5) = 0 Then
'      Else
'         SetPlayerGuild(A, GetPlayerFlag(A, 5))
'         SetPlayerFlag(A, 5, 0)
'         SetPlayerSprite(A, 0)
'         If GetPlayerMap(A) = 69 Then PlayerWarp(A, 1, 5, 5)
'      End If
'      If GetPlayerFlag(A, 6) = 0 Then
'      Else
'         If GetPlayerMap(A) = 91 | GetPlayerMap(A) = 90 Then
'            PlayerWarp(A, 90, 5, 5)
'            SetPlayerGuild(A, 0)
'            SetPlayerSprite(A, 0)
'         Else
'               If HasObj(A, 252) Then
'                  TakeObj(A, 252, 1)
'                  SpawnObject(70, 252, 1, 1, 5)
'               End If
'               If HasObj(A, 253) Then
'                  TakeObj(A, 252, 1)
'                  SpawnObject(78, 252, 1, 10, 5)
'               End If
'               SetPlayerGuild(A, 0)
'               SetPlayerSprite(A, 0)
'               SetPlayerStatus(A, 0)
'               PlayerWarp(A, 79, 5, 5)
'         End If
'      End If
'   Next A
'   Main = Stop
'   Exit Function
'End If

'If StrCmp(Command, "SET1") & GetPlayerAccess(Player) >= 10 Then
'   A = FindPlayer(Parm1)
'  SetPlayerFlag(A, 5, GetPlayerGuild(A))
'   SetPlayerGuild(A, 30)
'   SetPlayerSprite(A, 102)
'   Main = Stop
'   Exit Function
'End If

'If StrCmp(Command, "SET2") & GetPlayerAccess(Player) >= 10 Then
'   A = FindPlayer(Parm1)
'   SetPlayerFlag(A, 5, GetPlayerGuild(A))
'   SetPlayerGuild(A, 31)
'   SetPlayerSprite(A, 90)
'   Main = Stop
'   Exit Function
'End If

'If StrCmp(Command, "SET3") & GetPlayerAccess(Player) >= 10 Then
'   A = FindPlayer(Parm1)
'   SetPlayerFlag(A, 5, GetPlayerGuild(A))
'   SetPlayerGuild(A, 32)
'   SetPlayerSprite(A, 115)
'   Main = Stop
'   Exit Function
'End If

'//ManualTeam: Teams manually added with SET1, starts carnage.
'If StrCmp(Command, "manualteam") & GetPlayerAccess(Player) >= 10 Then
'runscript1("manualteam",player)
'End If

end sub