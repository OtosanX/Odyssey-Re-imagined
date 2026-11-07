FUNCTION Main(Player AS LONG, PlayerCount AS LONG) AS LONG
   Dim InventoryList as STRING
   Dim Count as LONG

         If IsPlaying(PlayerCount) & PlayerCount <> Player then
            InventoryList = StrCat(GetPlayerName(PlayerCount)," has the following inventory items: ")
            For Count = 1 to 19
             If StrCmp(GetObjectName(GetPlayerInvObject(PlayerCount,Count)), "") Then

             Else
               InventoryList = StrCat(InventoryList , StrCat(GetObjectName(GetPlayerInvObject(PlayerCount,Count)), ", "))
             End IF
            Next Count
            PlayerMessage(Player,InventoryList,White)
         End If
   Main = STOP
END FUNCTION