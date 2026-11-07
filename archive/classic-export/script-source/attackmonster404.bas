
Function Main(Player as Long) as Long

dim Monster1 as Long, a as Long
Monster1 = 404
dim Chance as Long, Map as Long

Map = GetPlayerMap(Player)


Chance = Random(4)


Select Case Chance
	Case 0
main = continue
	Case 1
main = continue
	Case 2
main = continue
	Case 3

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