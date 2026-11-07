FUNCTION Main(Player AS LONG, Message AS String) AS LONG
	If StrCmp(Message, "info") Then
		PlayerMessage(Player, "The Frost Wizard tells you, ''I can enchant your items for 30,000 gold coins.  There is no telling what the enchantment will do, and it costs 5,000 gold to remove it.  I can enchant all sorts of things!  To enchant an item, simply say 'enchant' followed by 'weapon', 'helm', 'armor' or 'shield'. The item must be equipped.  If you want to remove an enchantment, say purge followed by weapon, armor, shield, or helm.''", Grey)
	End If
	
	Dim EnchantCost As Long
	EnchantCost = 30000
	if strcmp(message,"enchant weapon") then
	   If HasObj(Player, 6) >= EnchantCost Then
		  If GetEquippedItemPrefix(Player, 1) = 0 Then
			 TakeObj(Player, 6, EnchantCost)
			 Dim Prefix As Long
			 Prefix = Random(8) + 1

			 Dim PrefixID As Long
			 Select Case Prefix
				Case 1
				   PrefixID = 1
				Case 2
				   PrefixID = 11
				Case 3
				   PrefixID = 21
				Case 4
				   PrefixID = 31
				Case 5
				   PrefixID = 41
				Case 6
				   PrefixID = 51
				Case 7
				   PrefixID = 61
				Case 8
				   PrefixID = 71
				Case Else
				   GlobalMessage("Enchanting error!", BRIGHTRED)
			 End Select
			 SetEquippedItemPrefix(Player, 1, PrefixID)
			 PlayerMessage(player, StrCat(StrCat("The Frost Wizard says, ''I have given your item the enchantment ", GetPrefixName(PrefixID)), ".''"),grey)
		  Else
			 PlayerMessage(player, "The Frost Wizard says, ''That item has already been enchanted!''",grey)
		  End If
	   Else
		  PlayerMessage(player, "The Frost Wizard says, ''You don't have enough money!  You need 2,000 gold to enchant.''",grey)
	   End If
	end if

		if strcmp(message,"enchant shield") then
	   If HasObj(Player, 6) >= EnchantCost Then
		  If GetEquippedItemPrefix(Player, 2) = 0 Then
			 TakeObj(Player, 6, EnchantCost)
			 Prefix = Random(8) + 1
			 Select Case Prefix
				Case 1
				   PrefixID = 1
				Case 2
				   PrefixID = 11
				Case 3
				   PrefixID = 21
				Case 4
				   PrefixID = 31
				Case 5
				   PrefixID = 41
				Case 6
				   PrefixID = 51
				Case 7
				   PrefixID = 61
				Case 8
				   PrefixID = 71
				Case Else
				   GlobalMessage("Enchanting error!", BRIGHTRED)
			 End Select
			 SetEquippedItemPrefix(Player, 2, PrefixID)
			 PlayerMessage(player, StrCat(StrCat("The Frost Wizard says, ''I have given your item the enchantment ", GetPrefixName(PrefixID)), ".''"),grey)
		  Else
			 PlayerMessage(player, "The Frost Wizard says, ''That item has already been enchanted!''",grey)
		  End If
	   Else
		  PlayerMessage(player, "The Frost Wizard says, ''You don't have enough money!  You need 2,000 gold to enchant.''",grey)
	   End If
	end if
	
		if strcmp(message,"enchant armor") then
	   If HasObj(Player, 6) >= EnchantCost Then
		  If GetEquippedItemPrefix(Player, 3) = 0 Then
			 TakeObj(Player, 6, EnchantCost)
			 Prefix = Random(8) + 1

			 Select Case Prefix
				Case 1
				   PrefixID = 1
				Case 2
				   PrefixID = 11
				Case 3
				   PrefixID = 21
				Case 4
				   PrefixID = 31
				Case 5
				   PrefixID = 41
				Case 6
				   PrefixID = 51
				Case 7
				   PrefixID = 61
				Case 8
				   PrefixID = 71
				Case Else
				   GlobalMessage("Enchanting error!", BRIGHTRED)
			 End Select
			 SetEquippedItemPrefix(Player, 3, PrefixID)
			 PlayerMessage(player, StrCat(StrCat("The Frost Wizard says, ''I have given your item the enchantment ", GetPrefixName(PrefixID)), ".''"),grey)
		  Else
			 PlayerMessage(player, "The Frost Wizard says, ''That item has already been enchanted!''",grey)
		  End If
	   Else
		  PlayerMessage(player, "The Frost Wizard says, ''You don't have enough money!  You need 2,000 gold to enchant.''",grey)
	   End If
	end if
	
		if strcmp(message,"enchant helm") then
	   If HasObj(Player, 6) >= EnchantCost Then
		  If GetEquippedItemPrefix(Player, 4) = 0 Then
			 TakeObj(Player, 6, EnchantCost)
			 Prefix = Random(8) + 1

			 Select Case Prefix
				Case 1
				   PrefixID = 1
				Case 2
				   PrefixID = 11
				Case 3
				   PrefixID = 21
				Case 4
				   PrefixID = 31
				Case 5
				   PrefixID = 41
				Case 6
				   PrefixID = 51
				Case 7
				   PrefixID = 61
				Case 8
				   PrefixID = 71
				Case Else
				   GlobalMessage("Enchanting error!", BRIGHTRED)
			 End Select
			 SetEquippedItemPrefix(Player, 4, PrefixID)
			 PlayerMessage(player, StrCat(StrCat("The Frost Wizard says, ''I have given your item the enchantment ", GetPrefixName(PrefixID)), ".''"),grey)
		  Else
			 PlayerMessage(player, "The Frost Wizard says, ''That item has already been enchanted!''",grey)
		  End If
	   Else
		  PlayerMessage(player, "The Frost Wizard says, ''You don't have enough money!  You need 2,000 gold to enchant.''",grey)
	   End If
	end if
	
	Dim PurgeCost as Long
	PurgeCost = 5000
	if strcmp(message,"purge shield") then
	   If HasObj(Player, 6) >= PurgeCost Then
		  If GetEquippedItemPrefix(Player, 2) > 0 Then
			 TakeObj(Player, 6, PurgeCost)
			 SetEquippedItemPrefix(Player, 2, 0)
			 PlayerMessage(player, "The Frost Wizard says, ''I have purged your item of it's magic.''",grey)
		  Else
			 PlayerMessage(player, "The Frost Wizard says, ''I cannot purge that item, because it has no magic power.''",grey)
		  End If
	   Else
		  PlayerMessage(player, "The Frost Wizard says, ''You don't have enough money!  You need 5,000 gold to purge.''",grey)
	   End If
	end if

	if strcmp(message,"purge weapon") then
	   If HasObj(Player, 6) >= PurgeCost Then
		  If GetEquippedItemPrefix(Player, 1) > 0 Then
				If GetPlayerequipped(player,1) < 180 | GetPlayerequipped(player,1) > 192 then
					TakeObj(Player, 6, PurgeCost)
					SetEquippedItemPrefix(Player, 1, 0)
					PlayerMessage(player, "The Frost Wizard says, ''I have purged your item of it's magic.''",grey)
				Else
				 PlayerMessage(player, "The Frost Wizard says, ''I cannot purge Arcticite weapons, fool.''", grey)
			  End If
			Else
			 PlayerMessage(player, "The Frost Wizard says, ''I cannot purge that item, because it has no magic power.''",grey)
		  End If
	   Else
		  PlayerMessage(player, "The Frost Wizard says, ''You don't have enough money!  You need 5,000 gold to purge.''",grey)
	   End If
	end if

	if strcmp(message,"purge armor") then
	   If HasObj(Player, 6) >= PurgeCost Then
		  If GetEquippedItemPrefix(Player, 3) > 0 Then
			 TakeObj(Player, 6, PurgeCost)
			 SetEquippedItemPrefix(Player, 3, 0)
			 PlayerMessage(player, "The Frost Wizard says, ''I have purged your item of it's magic.''",grey)
		  Else
			 PlayerMessage(player, "The Frost Wizard says, ''I cannot purge that item, because it has no magic power.''",grey)
		  End If
	   Else
		  PlayerMessage(player, "The Frost Wizard says, ''You don't have enough money!  You need 5,000 gold to purge.''",grey)
	   End If
	end if

	if strcmp(message,"purge helm") then
	   If HasObj(Player, 6) >= PurgeCost Then
		  If GetEquippedItemPrefix(Player, 4) > 0 Then
			 TakeObj(Player, 6, PurgeCost)
			 SetEquippedItemPrefix(Player, 4, 0)
			 PlayerMessage(player, "The Frost Wizard says, ''I have purged your item of it's magic.''",grey)
		  Else
			 PlayerMessage(player, "The Frost Wizard says, ''I cannot purge that item, because it has no magic power.''",grey)
		  End If
	   Else
		  PlayerMessage(player, "The Frost Wizard says, ''You don't have enough money!  You need 5,000 gold to purge.''",grey)
	   End If
	end if
	
   Main = Continue
END FUNCTION