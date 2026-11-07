Function main(player as long) as long

GlobalMessage("The gates of Tal von Ubel have opened for an hour to all intrepid adventurers.", BRIGHTgreen)

setflag(100, 1)
timer(player, 3600, "closetvu")


main = continue
End Function