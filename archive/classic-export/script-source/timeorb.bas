FUNCTION Main(Player AS LONG) AS LONG
   If HasObj(Player,216) > 0 & GetPlayerAccess(Player) = 0 then
     RunScript1("DropObj216", player)
   End If
   Main = Continue
END FUNCTION