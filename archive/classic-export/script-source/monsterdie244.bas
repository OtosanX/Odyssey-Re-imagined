Function main(player as long) as long
Dim a as long, x as long, y as long, b as long, Chance as Long, TileAtt as Long, Loop as Long

a = random(90) + 1
Chance = Random(30) + 1
x = getplayerx(player)
y = getplayery(player)

if getplayerdirection(player) = left then x = x - 1
if getplayerdirection(player) = right then x = x + 1
if getplayerdirection(player) = up then y = y - 1 
if getplayerdirection(player) = down then y = y + 1 
If X < 0 | X > 11 Then Exit Function
If Y < 0 | Y > 11 Then Exit Function

select case a

case 1
spawnobject(getplayermap(player),6,2000,x,y)

case 2
spawnobject(getplayermap(player),6,4000,x,y)

case 3
spawnobject(getplayermap(player),6,6000,x,y)

case 4
spawnobject(getplayermap(player),6,8000,x,y)

case 5
spawnobject(getplayermap(player),6,2000,x,y)

case 6
spawnobject(getplayermap(player),6,4000,x,y)

case 7
spawnobject(getplayermap(player),6,6000,x,y)

case 8
spawnobject(getplayermap(player),6,8000,x,y)

case 9
spawnobject(getplayermap(player),6,8000,x,y)

case 10
spawnobject(getplayermap(player),6,8000,x,y)

case 11
spawnobject(getplayermap(player),6,2000,x,y)

case 12
spawnobject(getplayermap(player),6,4000,x,y)

case 13
spawnobject(getplayermap(player),6,6000,x,y)

case 14
spawnobject(getplayermap(player),6,8000,x,y)

case 15
spawnobject(getplayermap(player),6,2000,x,y)

case 16
spawnobject(getplayermap(player),6,4000,x,y)

case 17
spawnobject(getplayermap(player),6,6000,x,y)

case 18
spawnobject(getplayermap(player),6,8000,x,y)
spawnobject(getplayermap(player),431,1,x,y)

case 19
spawnobject(getplayermap(player),6,8000,x,y)
spawnobject(getplayermap(player),431,1,x,y)

case 20
spawnobject(getplayermap(player),6,8000,x,y)
end select

Select Case Chance
	Case 1
		TileAtt = GetTileAtt(GetPlayerMap(Player), X, Y)
		If TileAtt = 1 | TileAtt = 2 | TileAtt = 3 Then
			X = GetPlayerX(Player)
			Y = GetPlayerY(Player)
		End If
		SpawnObject(GetPlayerMap(Player), 500, 1, X, Y)
End Select

'Guild Exp Share
If GetPlayerGuild(Player) = 0 Then
	Main = Continue
Else
	For Loop = 1 To GetMaxUsers()
		If Loop <> Player Then
'			If strcmp(GetPlayerIP(Loop), GetPlayerIP(Player)) Then
'				Main = Stop
'			Else
				If GetPlayerGuild(Loop) = GetPlayerGuild(Player) Then
					If GetPlayerMap(Loop) = GetPlayerMap(Player) Then
						GivePlayerExp(Loop, 1000)
					End If
				End If
'			End If
		End If
	Next Loop
End If

main = continue
End Function