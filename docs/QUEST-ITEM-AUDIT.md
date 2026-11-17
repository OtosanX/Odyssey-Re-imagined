# Quest item audit — November 17, 2026

## Fixed

- Restored the original attribute-7 map item sources: 971 placements covering 194 item types across the complete 1,520-map collection. Previous runtime only loaded a snapshot of loose ground objects; it never generated these map sources.
- Examples restored: Papa’s Journal (Oasis Encampment), Water of Life (Raider’s Cavern), Golden Orb (Locksmith Willy’s / Dead Ahead), Demon Torches and Bridge Pieces.
- Sources initialize once for old saves, preserve collected state across save/reload, and refill on return after two empty minutes. Original secondary map flag bit 2 disables refill. Existing inventories and unrelated ground/death drops are retained.
- Restored ground-object lookup/removal APIs used by scripted pickups. Norse Gem now becomes its original class-dependent reward and disappears for all connected players. Failed full-bag rewards preserve the gem; dead characters cannot invoke pickup rewards.
- Script inventory-value queries now distinguish stack quantity from equipment/item value.

## Verified

- 971 real pickup attempts: 919 ordinary pickups, one scripted Norse Gem replacement, and 51 intentional restrictions (49 Pac Food placements and two class-restricted Living Essences). No script errors in these attempts.
- Norse Gem reward tested for all four original class values, plus full inventory and dead-player cases. This does not add a character-class selector.
- 566 NPC trade combinations: 565 successful exchanges and one preserved original restricted-item rule.
- All 342 standard key-door pairs, plus the Day Flower → Mud Key trade → door opening → walking through → safe reclosure sequence.
- Five available named errand chains, accepted-only quest logs, existing scripted-key/ticket/recipe/teleport cases, and item rollback regressions pass.
- All 2,826 scripts parse. This is not proof that every script branch or quest is complete.

## Still unresolved

Sanctuary Wench lacks the original Shaman’s Amulet award, Granny’s potion exchange and final completion/reward stages. Thelonious Monk has no progression writes for its original quest flag. Neither chain was given invented rewards or completion behavior.

The following 43 item IDs have consumers but no **statically identified source** among map spawns, saved ground objects, placed NPC trades/monster drops, or literal script awards. Some are admin-only/unused, and some may be supplied by the 101 dynamic item references that still need individual tracing. This list is not a claim that 43 playable quests are broken.

| ID | Item | Example consumer |
|---|---|---|
| 93 | Pickaxe | key door, map 1356 |
| 155 | Soul Elixir | cookfish |
| 174 | Snowball | trade, map 930 |
| 200 | Cup of Water | trade, map 639 |
| 235 | Bolt Scroll | getobj235 |
| 241 | Flare Scroll | key door, map 1179 |
| 253 | Elitist Pass | map99_3_10 |
| 264 | Amazon Key | key door, map 942 |
| 267 | Old Skulls Rope | map1203_7_4 |
| 272 | Silver Pick | trade, map 1845 |
| 277 | Warp Ticket | map593_2_3 |
| 285 | Demon Heart | trade, map 163 |
| 322 | Amazon's Pick | key door, map 943 |
| 338 | Diamond Pick | map524_6_3 |
| 351 | Explosives | joinmap239 |
| 352 | Hold Key | joinmap239 |
| 365 | Braykt's Staff | braykt |
| 366 | Bloodsap Potion | getobj366 |
| 401 | Forge Fire | map190_6_5 |
| 403 | Vial of Water | cookpotions |
| 409 | Antidote | useobj409 |
| 410 | BOMB | useobj410 |
| 415 | Light Mana Sip | getobj415 |
| 416 | Fair Mana Sip | getobj415 |
| 417 | Dark Mana Sip | getobj415 |
| 418 | MISSING ITEM DEFINITION | getobj418 |
| 421 | Balt's Oil | map2114_3_0 |
| 423 | Viexese' Key | key door, map 1564 |
| 424 | Rahve's Key | key door, map 1563 |
| 425 | Aeaml's Key | key door, map 1561 |
| 427 | Breaker's Key | key door, map 1560 |
| 428 | Arena Key | key door, map 1567 |
| 436 | V'Drazzigs Tome | map1856_11_11 |
| 439 | Runed Scroll | useobj439 |
| 455 | Deaths Advocate | useobj455 |
| 472 | Soul of Cezos | key door, map 1296 |
| 480 | Minor God Plate | useobj480 |
| 485 | Push | useobj485 |
| 497 | Name Change | joingame |
| 501 | Map Checker | map66_1_9 |
| 506 | God Weapon | getobj480 |
| 510 | Incognito | joingame |
| 605 | Guild Trust | useobj605 |

Machine-readable details: [quest-item-source-audit.json](../artifacts/reports/quest-item-source-audit.json), [pickup results](../artifacts/reports/map-item-spawn-tests.json).

The remaining item-use baseline audit still reports 34 failures involving unsupported gameplay APIs or missing test-world prerequisites. These require targeted behavior work; this repair does not label them complete.

Changes are included in the November 17 source update, but not yet in the downloadable Windows ZIP. Restart the game/server to load the repaired source behavior; no save reset is required.
