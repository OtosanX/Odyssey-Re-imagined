FUNCTION Main(Player AS LONG, Message AS String) AS LONG
	Dim EnchantCost as Long
	EnchantCost = 80000
	if strcmp(message,"enchant ring") then
	   If HasObj(Player, 6) >= EnchantCost Then
		  If GetEquippedItemPrefix(Player, 5) = 0 Then
			 TakeObj(Player, 6, EnchantCost)
			 Dim Prefix as Long
			 Dim PrefixID as Long
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
			 SetEquippedItemPrefix(Player, 5, PrefixID)
			 PlayerMessage(player, StrCat(StrCat("Taylor Tailor says, ''I have given your item the enchantment ", GetPrefixName(PrefixID)), ".''"),grey)
		  Else
			 PlayerMessage(player, "Taylor Tailor says, ''That item has already been enchanted!''",grey)
		  End If
	   Else
		  PlayerMessage(player, "Taylor Tailor says, ''You don't have enough money!  You need 2,000 gold to enchant.''",grey)
	   End If
	end if
	
	Dim PurgeCost as Long
	PurgeCost = 10000
	if strcmp(message,"purge ring") then
	   If HasObj(Player, 6) >= PurgeCost Then
		  If GetEquippedItemPrefix(Player, 5) > 0 Then
			 TakeObj(Player, 6, PurgeCost)
			 SetEquippedItemPrefix(Player, 5, 0)
			 PlayerMessage(player, "Taylor Tailor says, ''I have purged your item of it's magic.''",grey)
		  Else
			 PlayerMessage(player, "Taylor Tailor says, ''I cannot purge that item, because it has no magic power.''",grey)
		  End If
	   Else
		  PlayerMessage(player, "Taylor Tailor says, ''You don't have enough money!  You need 5,000 gold to purge.''",grey)
	   End If
	end if

   Main = Continue
END FUNCTION