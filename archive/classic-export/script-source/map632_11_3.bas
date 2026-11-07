Sub Main(Player as long)
if hasobj(player,284) >=25 then
TakeObj(Player,284,25)
PlayerWarp(Player,632,1,3)
Else
PlayerWarp(Player,632,1,5)
End If
End Sub