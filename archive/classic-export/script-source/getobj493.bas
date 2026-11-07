FUNCTION Main(Player AS LONG) AS LONG
   If GetPlayerGuild(Player) = 30 Then
      GlobalMessage(StrCat(GetPlayerName(Player), " has stolen the Blue Flag!"), BRIGHTRED)
      SetPlayerStatus(Player, 24)
      SetPlayerSprite(Player, 119)
      Main = Continue
   Else
      Main = Stop
   End If
END FUNCTION