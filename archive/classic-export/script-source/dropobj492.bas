FUNCTION Main(Player AS LONG) AS LONG
   GlobalMessage(StrCat(GetPlayerName(Player), " has dropped the Red Flag!"), BRIGHTRED)
   TakeObj(Player, 492, 1)
   SpawnObject(1552, 492, 1, 0, 8)
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