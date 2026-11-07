Sub Main(Player as long)
If HasObj(Player,270) & HasObj(Player,269) & HasObj(Player,271) then
TakeObj(Player,269,1)
TakeObj(Player,270,1)
TakeObj(Player,271,1)
PlayerMessage(Player,"You secure the three shards and climb down into the abyss.",white)
PlayerWarp(Player,1351,1,8)
Else
PlayerMessage(Player,"You need three different glacial shards.",white)
PlayerWarp(Player,1324,5,7)
End If
End Sub