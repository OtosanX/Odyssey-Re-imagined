# Odyssey Reimagined — current build

Double-click **Odyssey.exe** for the game. Double-click **Odyssey Studio.exe** for the map, sprite, and server item-rule editors. Keep these launchers in this workspace with the adjacent folders.

**Odyssey Server.exe** starts a standalone server and displays its phone/browser addresses. Keep that window open for other players; closing it stops that server. Odyssey.exe can join an already running local server. If Odyssey.exe started the server itself, closing the game also stops that server.

The optional **3D View** now converts Classic scenery into raised geometry throughout the collection, preserving its original silhouettes and pixel art. Studio uses the same conversion and supports custom heights, walls and houses. See [3D-VIEW.md](3D-VIEW.md). Restart the server and reopen clients, then use the top-menu view switch. NPC dialogue windows now exclude ambient chatter; the NPC chat log retains it.

## Worlds and rules

Choose a remembered account or add one, sign in, choose Story or MMO, then select a character/save. Continue uses its saved settings. Create New Character opens difficulty selection and the complete visual appearance browser. Each difficulty and each Story world has separate characters, quest progress, drops, guilds, hall ownership, and economy. Story invite codes allow up to eight concurrent players on the same reachable server. The last Story code is remembered on the device. Clear the code to create a new world.

Normal deaths drop carried items, retain most equipped gear, and remove 5% of current-level XP without losing a level. Server owners can designate specific equipped-item exceptions in Studio's **Server item rules**. Players never choose their own death drops. Special PvP exposes all equipped gear and can only be toggled safely out of combat. Hardcore drops everything, removes one level (minimum level 1), and resets current-level XP. All losses become ground loot; other players can steal it outside strict safe zones. Safe-zone death drops are owner-only.

Death shows a prominent overlay over every game panel. Click **Respawn**, press Enter, or use controller A. The server restores HP and moves the player to the map's original death destination when valid, otherwise the original starting point. Quest progress persists. Death drops remain at the death location.

## Playing

- Direction keys: tap to face a direction; hold about 110 ms to walk. Once walking, changing direction adds no extra hold delay. Settings can adjust the initial tap-to-turn delay.
- Space: attack. E: pick up. T: talk. I: inventory. Q: quests. B: market. Escape: settings. +/−: zoom.
- Inventory is a 20-slot grid. Select a slot to inspect/equip/use/drop. Equipped slots have an E marker.
- Damage and healing numbers float above players/enemies. Enemy killing blows are included.
- Settings include keyboard remapping, controller toggle, quest tracker, pointer arrows, and touch control size, opacity and offsets. Basic controller gameplay supports left stick/D-pad movement, A attack/respawn, B talk, X pickup, Y inventory, bumpers quests/market, Start settings. Physical controller testing is still needed.

Story enables guidance by default; MMO keeps it minimal. Quest arrows are optional. NPC dialogue retains the original lines and numbered choices. Type replies, use the numbered buttons, or use supported original commands such as `/craft 6` and `/quests`. Quest-triggered warps briefly hold input and fade the view.

## Original content and limitations

Recovered: 1,520 maps, 542 item definitions, 1,413 saved ground items, 196 NPC definitions, 278 monster definitions, 49 guild halls and 2,826 readable scripts. Original archives remain untouched. Connected map neighbors scroll continuously, and original exits/warps/safe zones remain in use.

All 2,826 source scripts parse; 2,529 use only directly supported APIs in the static audit. This does **not** mean all original gameplay has been ported. A bounded interpreter exposes supported gameplay functions; unsupported interactions roll back item/progress changes and write a diagnostic report. Five original errand chains have behavioral tests: Lumberjack, Alchemy, Gibberish, Trapper Joe, and Manny Farmer. Their rewards, item exchanges and completion flags are taken from the source.

The archived Sanctuary Wench chain is unfinished and Thelonious Monk lacks completion logic; the tracker labels these **archive incomplete**. They are not presented as playable-to-completion. Other scripts may still depend on unsupported APIs, minigames, magic, special item modifiers or game systems. See `quest-runtime-coverage.json` and `quest-errors.json` for diagnostics. Monster AI, loot and combat are a simplified implementation, not an exact reproduction of every original formula. Thirteen maps contain 705 out-of-range tile references; see `data/classic-import-warnings.json`.

## Guild halls

Create a guild for the original 20,000 gold cost, join by guild invitation for 1,000 gold, and deposit gold into the guild bank. A leader can purchase an available hall at its original entrance after the guild has five members. Price and daily upkeep come from the archive. Ownership and bank funds persist per world. Owned hall touch plates and supported permission scripts use guild membership. Upkeep is charged from the bank; a hall is released if upkeep cannot be paid.

## MMO marketplace

Normal and Hardcore have separate player markets. Choose an unequipped item, quantity and unit price to list it in server-held escrow. Purchases exchange gold and items together. Sellers claim earnings from the market; they do not need to stay online. Listings can be cancelled to reclaim items. Market transactions require a safe zone and 30 seconds out of combat, so listings cannot hide equipment during a fight. Suggested prices come from original merchant offers; no fake player supply is seeded. Story worlds use original local merchant trades instead of the shared MMO market.

## Android and iPhone browser access

Start the standalone server, then open one of its displayed addresses on a phone connected to the same network, for example `http://YOUR-PC-IP:8080/`. The browser client uses the same account, world selection, map rendering and game rules. Touch controls can be adjusted in Settings. Existing network/firewall access must permit the connection; no firewall settings were changed. Invite codes join worlds on that server, not arbitrary servers over the internet.

This is a mobile **web client**, not an Android APK or iOS IPA. Public internet hosting, HTTPS and native distribution have not been configured. The built-in HTTP endpoint is intended for trusted LAN previews; do not expose account login publicly without HTTPS. Phone-size rendering, browser-only WebSocket login and touch UI have been tested in an isolated browser, but physical Android/iPhone devices and real controllers still need testing.

## Validation

- `tools/test-reimagined.cjs`: original quest chains, deaths/respawn, story capacity/isolation, market transactions, guild halls, persistence.
- `tools/test-movement.cjs` and `tools/test-controls.cjs`: tap/hold intent, steering, remapping, controller button edges, touch preferences.
- `smoke-test.cjs`: isolated TCP accounts, maps, imports, movement, saved position, fragmented headers.
- `test-game.cjs`, `test-mobile.cjs`, `test-combat-ui.cjs`, `test-studio.cjs`: hidden test windows, not desktop automation. These produce preview PNGs and result files.
- `tools/audit-quests.cjs`: parser audit. `tools/audit-script-apis.cjs`: static API audit, not full gameplay verification.

The inherited server Mocha suite still references a removed ClassicServer module. Its old failures are separate from the current checks above.

## Saved accounts, Story saves and NPC conversations — November 5 update

Login now starts with account cards and **Add account (+)**. You can create a new account or add an existing one. Username availability is checked before signup, and the server also rejects duplicates. New usernames use 3–24 letters/numbers/underscores; new passwords use 6–24 of those characters. Existing account passwords remain accepted under the earlier rules.

Desktop accounts are shared across the four client slots for the current Windows user. Password saving is optional and uses Electron's Windows-protected storage, not plaintext. Browser clients remember account names only. Forgetting a card removes it from this device, not from the server. Desktop game startup reserves one of four slots and recovers stale reservations after crashes; Studio is not counted. Close older running clients once after updating so every client uses the new limit. A game-started server stays alive while other clients are connected; standalone Server.exe remains preferable for hosting.

Story now has **named save cards**, **Continue**, **Rename**, and **New join code**. Save identity and progress are independent of the join code. Owners and previously joined players can continue from their account's list without remembering a code. Old code-based worlds migrate automatically without moving their progress files. Server files live under `odyssey-2-server-develop/data/sessions/`, with an account/save index and backups. Keep the whole data folder when moving or backing up the host PC. Join codes still require the same reachable server address; they do not provide internet hosting.

New characters choose an original appearance in the dedicated character-creation screen. The searchable grid includes all 642 nonempty appearances supported by the current server. Continuing preserves the saved sprite and difficulty. New Story/MMO characters start at the protected Crendale arrival tile; existing valid positions remain unchanged.

NPC conversations open a portrait window only after deliberate interaction (T/Talk). The NPC is on the left and the selected character on the right. Reply buttons are built from the current script's numbered options, with the actual reply text. Greetings without choices show no numbered buttons. Invalid numbered replies are rejected by the server. NPCs without a configured portrait use a fallback; Studio's Server item rules screen also contains NPC portrait mapping controls.

Ambient chatter does not open a dialogue window or replace the active choices. When the NPC's actor can be located, its speech appears briefly over that actor; otherwise it stays in the journal. Interaction pages and ambient lines use separate state.

## Safe-zone monster protection

Areas labeled **Safe zone** now block hostile animal/monster targeting and damage. Hostile creatures cannot spawn in protected maps or safe tiles, and pursuit cannot cross into protected tiles. Legacy hostile placements in protected areas are removed or relocated before they can attack. Friendly NPCs remain available. Players cannot attack monsters across safe-zone boundaries either; supported noncombat interactions, such as the cow quest, still run. Dangerous areas retain normal monster combat.

Restart the server to load this change; existing running server processes keep the old code until restarted.

Original Classic maps also retain their separate no-creature-combat rule: all 45 maps with flag 32 now reject attacks on NPCs/creatures before damage or combat scripts, including Crendale Keep's King and Jester. Studio's **Protect NPCs / creatures** checkbox controls this rule independently of PvP. Restart the server to load the enforcement and recreate NPC spawns.

Friendly creature NPCs and idle guards now wander instead of being skipped by the AI loop. Movement checks collision, directional walls, occupied cells and map bounds; NPCs do not wander through warp tiles, and hostile creatures cannot wander into sanctuary. Guards remain nonaggressive toward innocent players. Decorative NPC artwork authored directly as map tiles remains scenery. Restart the server for the AI change; reopen clients for corrected furniture seating and graphics.

## Studio Map Library and World Builder

Studio now discovers the full Classic collection and existing custom JSON maps automatically, with searchable cached thumbnails, nested virtual folders, favorites, recent edits and protected originals. Player Made copies use stable custom IDs. World Builder places 12 × 12 segments, saves layouts and drafts, paints/copies tiles across boundaries, assigns area labels and stages explicit two-way connections. Publishing shows the original/custom map changes and exit replacements for confirmation, creates a full backup and preserves unrelated server data. Restart the server after publishing. See [MAP-LIBRARY.md](MAP-LIBRARY.md) for controls, storage, protections and checks.

## Chat and conversations

The resizable bottom chat dock now separates Local, World, Combat, NPC, Guild, Trade/Story Party, Whispers and System messages, with an All view. Local hearing follows open ground within the connected 3 × 3 map area and respects buildings and barriers. Height, width and font settings persist on the device; chat also supports minimize, unread counts and scrollback. The King uses his actual original sprite, and NPC conversations retain both sides of the exchange in the portrait window and NPC tab. Recent NPC history persists per character/world. Restart the server and reopen clients to load these changes. See [CHAT.md](CHAT.md).

## Launcher and customizable HUD

The new account/mode/character flow, creation grid, Crendale start/guard fix and modular HUD are documented in [LAUNCHER-AND-HUD.md](LAUNCHER-AND-HUD.md). HP/XP now live with inventory in the Player Panel. Use **Edit HUD** to dock, resize, collapse or hide widgets and save per-account layouts/presets. The MMO model remains one character per difficulty, protected against accidental replacement. Restart the server and reopen clients to use the new catalogue and start configuration.
