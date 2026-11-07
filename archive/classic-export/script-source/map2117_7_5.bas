Function Main(Player as Long) AS LONG
dim Map as Long, X as Long, Y as Long
Dim a as long
a = random(6)



select case a
case 0
Attackplayer(player, player, 30)
playerwarp(player, 2117, 10, 6)
case 1
Attackplayer(player, player, 30)
playerwarp(player, 2117, 8, 8)
case 2
Attackplayer(player, player, 30)
playerwarp(player, 2117, 5, 10)
case 3
Attackplayer(player, player, 30)
playerwarp(player, 2117, 2, 7)
case 4
Attackplayer(player, player, 30)
playerwarp(player, 2117, 4, 3)
case 5
Attackplayer(player, player, 30)
playerwarp(player, 2117, 7, 3)
case 6
Attackplayer(player, player, 30)
playerwarp(player, 2117, 6, 6)

case else
end select

Map = GetPlayerMap(Player)

For X = 3 To 8
	For Y = 3 To 8
		If Random(3) = 0 Then
			CreateTileEffect(Map, X, Y, Random(70) + 1, 40 + Random(20), 8, Random(2), 0)
		End If
	Next Y
Next X




main = continue


End Function