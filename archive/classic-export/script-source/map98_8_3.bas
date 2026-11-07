FUNCTION Main(player AS LONG) AS LONG
 Dim Intelligence AS LONG,Strength AS LONG,Agility AS LONG,Endurance AS LONG
 Dim Guild AS LONG,Name AS STRING,Level AS LONG
 Dim Map AS LONG,X AS LONG,Y AS LONG
 Dim Class AS LONG,Status AS LONG
 Dim HP AS LONG,Energy AS LONG,Mana AS LONG
 Dim BA AS LONG,BB AS LONG,BC AS LONG
 Dim VALUA AS LONG, VALUB AS LONG, VALUC AS LONG

   Intelligence = Getplayerintelligence(player)
   Strength = GetplayerStrength(player)
   Agility = Getplayeragility(player)
   Endurance = Getplayerendurance(player)

   Guild = Getplayerguild(player)
   Name = Getplayername(player)
   Level = Getplayerlevel(player)
 
   Map = Getplayermap(player)
   X = GetplayerX(player)
   Y = GetplayerY(player)

   Class = Getplayerclass(player)
   Status = Getplayerstatus(player)
 
   HP = GetplayerHP(player)
   Energy = Getplayerenergy(player)
   Mana = Getplayermana(player)


 If HasObj(player, 249) >= 1 Then

  Takeobj(player, 249, 1)

    BA = Random(5)

      If BA = 0 Then
       playermessage(player, "Slot Machine: JOKER", yellow)
       VALUA = 0
      End If
      If BA = 1 Then
       playermessage(player, "Slot Machine: ORANGE", yellow)
       VALUA = 1
      End If
      If BA = 2 Then
       playermessage(player, "Slot Machine: APPLE", yellow)
       VALUA = 2
      End If
      If BA = 3 Then
       playermessage(player, "Slot Machine: BAR", yellow)
       VALUA = 3
      End If
      If BA = 4 Then
       playermessage(player, "Slot Machine: MEDUSA", yellow)
       VALUA = 4
      End If
      If BA = 5 Then
       playermessage(player, "Slot Machine: COIN", yellow)
       VALUA = 5
      End If

    BB = Random(5)

      If BB = 0 Then
       playermessage(player, "Slot Machine: JOKER", yellow)
       VALUB = 0
      End If
      If BB = 1 Then
       playermessage(player, "Slot Machine: ORANGE", yellow)
       VALUB = 1
      End If
      If BB = 2 Then
       playermessage(player, "Slot Machine: APPLE", yellow)
       VALUB = 2
      End If
      If BB = 3 Then
       playermessage(player, "Slot Machine: BAR", yellow)
       VALUB = 3
      End If
      If BB = 4 Then
       playermessage(player, "Slot Machine: MEDUSA", yellow)
       VALUB = 4
      End If
      If BB = 5 Then
       playermessage(player, "Slot Machine: COIN", yellow)
       VALUB = 5
      End If

    BC = Random(5)

      If BC = 0 Then
       playermessage(player, "Slot Machine: JOKER", yellow)
       VALUC = 0
      End If
      If BC = 1 Then
       playermessage(player, "Slot Machine: ORANGE", yellow)
       VALUC = 1
      End If
      If BC = 2 Then
       playermessage(player, "Slot Machine: APPLE", yellow)
       VALUC = 2
      End If
      If BC = 3 Then
       playermessage(player, "Slot Machine: BAR", yellow)
       VALUC = 3
      End If
      If BC = 4 Then
       playermessage(player, "Slot Machine: MEDUSA", yellow)
       VALUC = 4
      End If
      If BC = 5 Then
       playermessage(player, "Slot Machine: COIN", yellow)
       VALUC = 5
      End If

   If VALUA <> VALUB | VALUB <> VALUC | VALUC <> VALUA | VALUA <> VALUC | VALUC <> VALUB | VALUB <> VALUA Then
    playermessage(player, "You lose!", brown)
   End If

   If VALUA = 0 & VALUB = 0 & VALUC = 0 Then
    playermessage(player, "You Win! -<JOKER>- 5 Elitist Coins aquired!", brightred)
    Giveobj(player, 249, 5)
   End If

   If VALUA = 1 & VALUB = 1 & VALUC = 1 Then
    playermessage(player, "You Win! -<ORANGE>- 10 Elitist Coins aquired!", brightred)
    Giveobj(player, 249, 10)
   End If

   If VALUA = 2 & VALUB = 2 & VALUC = 2 Then
    playermessage(player, "You Win! -<APPLE>- 20 Elitist Coins aquired!", brightred)
    Giveobj(player, 249, 20)
   End If

   If VALUA = 3 & VALUB = 3 & VALUC = 3 Then
    playermessage(player, "You Win! -<BAR>- 30 Elitist Coins aquired!", brightred)
    Giveobj(player, 249, 30)
   End If

   If VALUA = 4 & VALUB = 4 & VALUC = 4 Then
    playermessage(player, "You Win! -<MEDUSA>- 40 Elitist Coins aquired!", brightred)
    Giveobj(player, 249, 40)
   End If

   If VALUA = 5 & VALUB = 5 & VALUC = 5 Then
    playermessage(player, "You Win! -<COIN>- 50 Elitist Coins aquired!", brightred)
    Giveobj(player, 249, 50)
   End If
else
playermessage(player,"You need an elitist coin to play!",white)
 End If
End FUNCTION