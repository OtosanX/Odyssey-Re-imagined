Sub Main(Player AS LONG)
dim a as long
a = GetPlayerFlag(player,80)
PlayerMessage(Player, StrCat("You hold the scroll, and glyphs begin to appear. You study them, and count a total of ", str(a)), WHITE)
takeobj(player, 439, 1)
End Sub