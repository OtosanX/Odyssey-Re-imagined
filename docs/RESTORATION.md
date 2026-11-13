# Restored world implementation

The default server mode now loads `data/classic-world.json`, recovered from the archived sandbox database. This contains 1,520 original 12 × 12 maps, 542 original item definitions, 1,413 saved item placements, cardinal exits, tile warps, safe-map flags, open-PvP flags, and safe tile attributes. New characters start at the archived starting location, Throne Hall (map 355, tile 5,6). Existing meadow accounts can sign in normally; their original-world progress is stored separately.

Connected map neighbors appear around the current map. Crossing a cardinal exit adjusts the view origin to keep scrolling continuous. Warps teleport. Opposite animation layers alternate instead of painting over one another. Thirteen maps reference 705 tiles outside the recovered atlas; those cells render empty, with original references retained in `data/classic-import-warnings.json` and the untouched archive.

Controls: arrows/WASD move, Space attacks the adjacent tile you face, E picks up an item underfoot, I toggles inventory, +/− zooms. Inventory supports 20 slots, equipment, dropping, coin stacking, and HP potions. Equipment and inventory are saved along with HP and position after actions. HP zero prevents movement/actions until Respawn. Respawn uses the map's archived death destination where valid, otherwise the starting location.

Safe maps and safe tiles protect both attacker and defender. Open-PvP maps allow attacks; other PvP maps require guild membership. This version has no guild enrollment UI, so those maps stay protected for the current guildless characters. Attack range, cooldown, equipment-derived damage, and death are checked on the server. Combat uses a basic deterministic damage calculation; original classes, random armor rolls, durability, experience loss and guild-war declarations have not yet been ported.

Studio can select an original map, edit its layers/collision/anchors, set Safe/Open PvP/Guild PvP, and paint safe tiles. Importing an original map updates that map inside the recovered world with a full backup. Importing an independent custom map switches to custom mode. Restart the server after imports. An original map must remain 12 × 12 to preserve its exit geometry.

Not yet implemented: monsters and their AI/loot, scripted NPC dialogue/quests, spellcasting/mana, trading/banking, guild management and the full original death/drop rules. The exported monster definitions and original scripts remain available for those ports. Original `.exe` files and database have not been modified.

Launch `Odyssey.exe` or `Odyssey Studio.exe` yourself. Changes take effect after closing and reopening the game. The developer does not need to control your desktop.

Checks: `node tools/test-world.cjs` exercises the restored data and game rules with fake clients in temporary folders; `node smoke-test.cjs` uses an isolated TCP server; the `test-game.cjs` Electron entry point runs a hidden, isolated rendering test and writes `game-preview.png` / `game-test-result.txt`.
