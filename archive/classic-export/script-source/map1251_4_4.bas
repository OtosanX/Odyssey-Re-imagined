Sub Main(Player as long)
      If HasObj(Player,188) & HasObj(Player,254) then
               TakeObj(Player,188,1)
               TakeObj(Player,254,1)
      GiveObj(Player, 251, 1)
PlayerMessage(Player,"You give Page your ink and paper and he quickly draws you a map.",white)
Else

End If
end sub