FUNCTION Main(Player AS LONG) AS LONG
   GlobalMessage(StrCat(GetPlayerName(Player), " has dropped the Blue Flag!"), BRIGHTBLUE)
   TakeObj(Player, 493, 1)
   SpawnObject(1552, 493, 1, 11, 8)
   If GetPlayerGuild(Player) = 30 Then
      SetPlayerSprite(Player, 102)
      SetPlayerStatus(Player, 22)
   End If
   If GetPlayerGuild(Player) = 31 Then
      SetPlayerSprite(Player, 92)
      SetPlayerStatus(Player, 3)
   End If
   Main = Stop
END FUNCTION