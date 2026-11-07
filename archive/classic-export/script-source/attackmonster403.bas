
Function Main(Player as Long) as Long
 dim x as long,y as long
 Attackplayer(player,player,27)
CreateTileEffect(GetPlayerMap(Player), GetPlayerX(Player), GetPlayerY(Player), 1, 1, 8, 0, 0)


   Main = Continue
dim Monster1 as Long, a as Long
Monster1 = 403
dim Chance as Long, Map as Long

Map = GetPlayerMap(Player)


Chance = Random(12)


Select Case Chance
	Case 0
main = continue
	Case 1
playerwarp(player, 2111, 8, 2)
CreateCharacterEffect(GetPlayerMap(Player), Player, 58, 40, 8, 1, 0)
playermessage(player, "You feel dazed as a ball of fire from the Fire Lord blasts you away.", brightred)
main = continue
	Case 2
playerwarp(player, 2111, 1, 10)
CreateCharacterEffect(GetPlayerMap(Player), Player, 58, 40, 8, 1, 0)
playermessage(player, "You feel dazes as a ball of fire from the Fire Lord blasts you away.", brightred)
main = continue
	Case 3
main = continue
	Case 4
main = continue
	Case 5
main = continue
	Case 6
main = continue
	Case 7
main = continue
	Case 8
main = continue
	Case 9
main = continue
	Case 10
main = continue
	Case 11
IF GetPlayerDirection(Player) = LEFT THEN
  IF GetTileAtt(GetPlayerMap(Player), (GetPlayerX(Player) + 1), GetPlayerY(Player)) = FALSE THEN
   IF GetTileAtt2(GetPlayerMap(Player), (GetPlayerX(Player) + 1), GetPlayerY(Player)) = FALSE THEN
 PlayerWarp(Player, GetPlayerMap(Player), (GetPlayerX(Player) + 1), GetPlayerY(Player))
   END IF
  END IF
END IF



IF GetPlayerDirection(Player) = RIGHT THEN
  IF GetTileAtt(GetPlayerMap(Player), (GetPlayerX(Player) - 1), GetPlayerY(Player)) = FALSE THEN
   IF GetTileAtt2(GetPlayerMap(Player), (GetPlayerX(Player) - 1), GetPlayerY(Player)) = FALSE THEN
 PlayerWarp(Player, GetPlayerMap(Player), (GetPlayerX(Player) - 1), GetPlayerY(Player))
   END IF
  END IF
END IF



IF GetPlayerDirection(Player) = UP THEN
  IF GetTileAtt(GetPlayerMap(Player), GetPlayerX(Player), (GetPlayerY(Player) + 1)) = FALSE THEN
   IF GetTileAtt2(GetPlayerMap(Player), GetPlayerX(Player), (GetPlayerY(Player) + 1)) = FALSE THEN
 PlayerWarp(Player, GetPlayerMap(Player), GetPlayerX(Player), (GetPlayerY(Player) + 1))
   END IF
  END IF
END IF



IF GetPlayerDirection(Player) = DOWN THEN
  IF GetTileAtt(GetPlayerMap(Player), GetPlayerX(Player), (GetPlayerY(Player) - 1)) = FALSE THEN
   IF GetTileAtt2(GetPlayerMap(Player), GetPlayerX(Player), (GetPlayerY(Player) - 1)) = FALSE THEN
 PlayerWarp(Player, GetPlayerMap(Player), GetPlayerX(Player), (GetPlayerY(Player) - 1))
   END IF
  END IF
END IF


Main=Continue
end select

end function