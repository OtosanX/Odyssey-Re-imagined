sub main(player as long)

'Player Flags
'2 - Broadcast Timer Flag
'3 - Unfreeze Timer
'4 - Unfreeze
'5 - Retain Guild
'6 - Sanctuary Complete
'7 - Sanctuary Warp (Where) 0 = Inactive, 1 = Nymphs, 2 = Between Two Rivers, 3 = Crag Ice Stone
'8 - Sanctuary Warp (Active)
'9 - 
'10 - Minigame: See Minigame Script
'11 - Minigame Teams: 1 - Red, 2 - Blue
'12 - Minigame Kills\Lives
'13 - Staking Arena: 1 - Staking, 2 - Can Start, 3 - Fighting, 4 - Winner
'14 - Duel Arena
'15 - Resurrect
'16 - Cleric Guild Spells Mode
'17 - New Trade Room
'18 - 
'19 - Retain Sprite
'20 - Retain Status
'21 - Retain X
'22 - Retain Y
'23 - Spell Cooldown
'24 - Retain Map
'25 - Thief - Is Invis
'26 - Bomb Cooldown
'27 - Invis Cooldown
'28 - Buff Cooldown
'29 - Mage Spell = Improve Thief Invis
'30 - arena pk res
'31 - Player is Poisoned - Amount
'32 - Player is Poisoner
'33 - Player remembers Poisoner Player Number

'40 - Jail
'41 - Unsquelch

'45 - vorpal bunny
'46 - Sanctuary Trapper Task ObjNum (0 = no task)
'47 - Sanctuary Trapper Task ObjVal
'48 - Sanctuary Food Task ObjNum (0 = no task)
'49 - Sanctuary Relic Task ObjNum (0 = no task)

'50 to 60 : weapons?

'69 - Tile of Truth - Banned from use

'90 - *SPELLS*
'91 - Errand - Lumberjack - East of Cren
'92 - Errand - Gibberish - Drag Bank
'93 - Errand - Alchemy - South of Drag
'94 - *SPELLS*
'95 - In Carnage
'96 - *SPELLS*
'97 - In Battle-Battle Score
'98 - In Titan Take Down
'99 - Titan Take Down - Lives
'100 - USED
'101 - Champ Ban (1 = Banned)

'109 - Push Timer

'110 - Fanks Keypad (Map 90)
'111 - Keypad 1
'112 - Keypad 2
'113 - Keypad 3
'114 - Keypad 4

'==STORE STUFF==
'72 - Float Text
'73 - Broadcast Timer Immunity
'74 - Player Mod - No warp-carn, for playing characters
'75 - Incognito
'76 - Push
'77 - PK Status Removal
'78 - Player God
'79 - Carnage Host
'130 - Sprite Command
'131 - Status Command
'132 - Sprite Hold
'133 - Status Hold

'==SPELLS==
'90 - Resurrect flag for Clerics (uses ClickPlayer)
'94 - Mage Spell - Telepathy
'96 - Mage Spell - Donate Mana

'==BUFFS==
'120 - Cleric Endurance Buff
'121 - Cleric Agility Buff
'122 - Cleric Intel Buff
'123 - Knight Spell - Adrenaline - Str Buff
'124 - Artifact - Bab Torch - End Buff
'125 - Dark Arts - Allows you to use buff pots
'126 - Artifact - Drag Candle - Agi Buff
'127 - Test Tile Buff
'128 - Cleric Conversion
'140 - Receipe Book - Vigorous
'141 - Receipe Book - Stout

'201 - Party Number
'202 - Party Leader (1 = Leader)
'203 - Party Invite

'204 - Mage - Evil Eye (Player Tracking)
'205 - Knight Mindset - 0 = Agressive, 1 = Defensive, 2 = Heroic
'206 - Cleric Guild Spells
'207 - Cleric Redemption
'208 - Cleric Damnation
'209 - Thief Tag

'210 - Minigame Retain Map
'211 - Minigame Retain X
'212 - Minigame Retain Y
'213 - Cleric Sacrifice Faith
'215 - Solo the Champ kills
'216 - Jims Face 2x2 kills
'217 - Jims Face 3x3 kills
'218 - ToF Runs Complete

'220 - Lottery Number

'225 - Sanctuary Game 1 Win Record
'226 - Sanctuary Game 2 Lost Record
'227 - Sanctuary Game 2 Total Record

'230 - BlackJack Score
'231 - BlackJack Card 1
'232 - BlackJack Card 2
'233 - BlackJack Card 3
'234 - BlackJack Card 4
'235 - BlackJack Card 5
'236 - BlackJack Dealer 1
'237 - BlackJack Dealer 2
'238 - BlackJack Dealer 3

'240 - Farmers Errand
'241 - Monks Errand
'242 - Trappers Errand
'243 - Wench Errand
'244 - Sanc Tasks Completed

'--------------------------------

'===SERVER FLAGS===

'2 - broadcast timer
'43: aeaml flag
'11: Scorpion Quest
'60 - 64 : Carnage
'70-71 : Lighting - Day-Night?


'80 - Tournament Host
'81 - Carnage Timer
'82 - Carnage Timer Flag 2
'83 - CTF Warp
'84 - Carnage Population
'85 - TOF Run
'86 - Battle Red Team Score
'87 - Battle Blue Team Score
'88 - Battle Kill Limit
'89 - Solo the Champ
'90 - Someone in Champ

'91 - HH Landlord
'92 - Summoner Fire
'93 - Summoner Monster
'94 - Minute Timer
'95 - Someone in Champ2
'96 - Jims Face Game 2x2
'97 - Jims Face Game 3x3
'98 - Hour Timer
'99 - Football Timer
'100 - Football Red Score
'101 - Football Blue Score
'102 - Football Red Count
'103 - Football Blue Count
'104 - Football Team Size
'105 - Fank's House
'106 - players ranking flag
'105 - player count for ranking
'107 - target spells
'108 - TIME UNTIL STAT RECALC
'109 - Push Timer

'111 - Gold Collected - Drag Energy Pot since 14.09.2008
'112 - Gold Collected - Bab Incog Shop since 14.09.2008
'113 - Gold Collected - Parties Started since 14.09.2008

'120 - Lottery Population
'121 - Lottery Pot
'122 - Lottery Open
'123 - Lottery Jackpot
'124 - Lottery Cost

'==MARKET==
'130 - Market Lumber
'131 - Market C Ore
'132 - Market F Ore
'133 - Market P Ore
'134 - Market S Fish
'135 - Market M Fish
'136 - Market B Fish

'139 - Sanctuary Game 1
'140 - Sanctuary Game 1
'141 - Dodgeball Red Count
'142 - Dodgeball Blue Count
'143 - Dodgeball Red Kills
'144 - Dodgeball Blue Kills
'145 - Sanctuary Game 2

'150 - Stake Arena
'151 - Duel Arena
'152 - Trade Room
'153 - Team Arena

'160 - Quest Puzzle (Map 1434)

'170 - Tournament Arena Open
'171 - Tourny Player 1
'172 - Tourny Player 2
'173 - Tourny Player 3
'174 - Tourny Player 4
'175 - Tourny Player 5
'176 - Tourny Player 6
'177 - Tourny Player 7
'178 - Tourny Player 8
'179 - Tounament Gold Pot
'180 - Tournament Entry Cost

'181 - Red Flag Timer
'182 - Blue Flag Timer
'-------------------------
'183 - Lavos Fire Shield
'-------------------------
'184 - Fort 1a
'185 - Fort 1b
'186 - Fort 1c
'187 - Fort 1d
'188 - Fort 1e
'189 - Fort 1f
'190 - Fort 1g
'191 - Fort 1h
'192 - fortguard
'193 - Fortsecondtimer
'194 - Lavossecondtimer
'------
'195 - AB boss
'---Spells
'196 - MageSpell2


' --- 1K Quest
'250 - Knight Spell
'251 - Mage Spell
'252 - Thief Spell
'253 - Cleric Spell


end sub