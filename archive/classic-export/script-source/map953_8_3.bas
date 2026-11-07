Sub Main(Player as long)
      If HasObj(Player,87) & HasObj(Player,89) then
               TakeObj(Player,87,1)
               TakeObj(Player,89,1)
      GiveObj(Player, 141, 1)
PlayerMessage(Player,"Timmy graciously takes your rope and hook and gives you a bottle of Evol.",white)
Else

End If
end sub