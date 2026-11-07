function main(player as long, message as string) as long

if strcmp(message,"Help") then
playermessage(player, "To use the secure trading room, stand on the left blue tile, with the triangle, and type /barter and then type whoever's name you want to trade with, and the person must be standing on the right blue tile.",white) 
playermessage(player, "You will then enter the trading rooms. You only have TWO MINUTES to trade, and then you are kicked out!",grey)
playermessage(player, "Place your items on the ground (for your customer to see) and when you're both ready, stand on the blue tiles. The player on the left needs to type /switch (playername) of the player on the right blue tile.",white)
playermessage(player, "You will then trade places. Quickly pick up your items, and leave the room by using the warp at the top wall.",grey)
playermessage(player, "(If a player has a space in his name, like Sir Bill, then simply put the name in quotations marks, like /barter ''Sir Bill''.)",white)

end if
main = continue

end function
