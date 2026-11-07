FUNCTION Main(Player AS LONG) AS LONG
   If GetPlayerGuild(Player) = 31 Then
      GlobalMessage(StrCat(GetPlayerName(Player), " has stolen the Red Flag!"), BRIGHTBLUE)
      SetPlayerStatus(Player, 24)
      SetPlayerSprite(Player, 128)
      Main = Continue
   Else
      Main = Stop
   End If
END FUNCTION