FUNCTION Main(Player AS LONG) AS LONG
   Dim A as Long
   For A = 1 to 20
      If GetPlayerInvObject(Player,A) = 196 then
         If GetPlayerInvValue(Player,A) > 40 then
            PlayerMessage(Player,"Hey, that's a cheated weapon -- give me that!!",BrightRed)
            GlobalMessage(StrCat("A cheated staff has been removed from ", GetPlayerName(Player)), BrightRed)
            TakeObj(Player,196,1)
         End if
      End if
   Next A
   Main = Continue
END FUNCTION