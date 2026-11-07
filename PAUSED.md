# Resumed November 7, 2026

Safety-and-preservation rules received from the user are now in force: inspect before modifying, small controlled changes, protect all working systems and data, verify with isolated tests only. No user task was assigned yet in this opening turn, so only inspection and baseline work was done — no source, data, map or asset files were modified.

## Baseline established (2026-11-07)

- `git init` at the workspace root created rollback commit **`be825c981655d7ca0d7bdfae62e9354c1a69af75`** (4,825 objects, ~121 MB) covering source, tools, docs, maps, sprites, `odyssey-2-server-develop/data/`, `community-world/` and the full untouched `archive/` originals. New `.gitignore` excludes only generated outputs: `node_modules/`, `dist/`, `publish/`, `logs/`, `.map-library/`, `.map-library-cache/`, `.editor-test-profile/`, `*.log`. US-ASCII file only; no working files touched.
- Server TypeScript compiles clean: `npx tsc --noEmit` (exit 0) in `odyssey-2-server-develop`.
- `node tools/test-reimagined.cjs`: all three PASS groups (five errand chains/rewards/repeat preven­tion/rollback/teleport freeze; Normal+Hardcore deaths, safe-zone loot theft rules; dialogue interaction, accept/decline, invalid replies, ambient speech; story capacity/isolation; story respawn; market escrow; guilds halls persistence).
- `node smoke-test.cjs`: PASS (import backup, invalid import rejection, six layers, anchors, spawn, accounts, movement, saved position, fragmented TCP header). Caveat: it spawns an isolated server that also binds the mobile web port 8080; a run executed in parallel with other heavy Node processes failed transiently with ECONNREFUSED and then passed when run alone. Run it alone.
- Client build (`odyssey-2-client-develop`) compiles `lib/**` to `src/bin/` only; it cannot overwrite hand-written sources. Not run in this turn.

## Known pre-existing conditions (not caused by this turn)

- The inherited server Mocha suite (`npm test`) still references the removed ClassicServer module and fails before running; README and REIMAGINED document this and the smoke/reimagined checks are the intended validation.
- Stray odyssey-2-server-develop/data/undefined file (0.3 KB) exists; left untouched and included in the baseline snapshot.
- Operational constraints carried over: user permits isolated tests only, no desktop automation, do not launch the user's apps.

# Resumed November 5, 2026

The pause below is historical and was revoked by the user's continue instruction. Current implementation and limitations are documented in REIMAGINED.md. Do not treat earlier test results as validating later edits.

# Paused — resume Odyssey Reimagined here

User requested pause to shut down the PC. Stop work until they resume. Do not shut down the PC or control their desktop. User permits asking to run isolated tests, not desktop automation. No tests or GUI launches were started during this feature batch.

## User's current requirements

- Restore original quests faithfully, including scripted teleports. Short fades/static movement pauses may be necessary for quest scenes.
- MMO and Story, each with Normal and Hardcore. Story invite codes with max 8 players per world on the same server; guidance, quest tracker and optional arrows. MMO, especially Hardcore, should feel closer to OG Odyssey.
- Normal death: drop carried items; generally keep equipped items; some server-defined endgame exceptions; special PvP opting in exposes equipped items. Players must NOT choose what drops. User delegated final balance decisions. Proposed 5% current-level XP loss, no level loss.
- Hardcore death: all carried/equipped items drop; exactly one level lost, floor level 1.
- Other players may steal death loot except inside strictly safe/no-PvP areas, where only owner can recover it.
- Guild creation/joining, bank, purchasable original halls around world, permissions and upkeep.
- MMO marketplace: player-set prices, reasonable suggested prices from original NPC offers; server escrow/atomic transfers; normal and hardcore economies separated.
- Remappable keys, controller support, adjustable mobile controls for Android/iPhone. Best first target is mobile browser/PWA, not unverified native APK/IPA claims.

## Previously verified baseline

Launchers `Odyssey.exe` and `Odyssey Studio.exe` exist in workspace and are launchers using adjacent folders/installed Node. Existing original restoration had 1,520 maps, 542 items, 1,413 saved drops, smooth adjacent-map view, original artwork, basic inventory/equip/potions/HP/PvP, original-map editing/import. Previously passed tests: tools/test-world.cjs, smoke-test.cjs, hidden test-game.cjs and test-studio.cjs. Those results predate current feature batch and MUST NOT be represented as validating it.

## Recovered more archive data this turn

`tools/export-classic.ps1` now also exports Scripts, NPCs, Halls, Guilds (Guilds table is empty so no Guilds.json output).
Ran 32-bit Windows PowerShell with transient -ExecutionPolicy Bypass for read-only Jet database export (no desktop control).
`archive/classic-export/Scripts.json`: 2,826 scripts with readable BASIC Source and native compiled Data. Never execute native Data.
`archive/classic-export/NPCs.json`: 196 NPC definitions, dialogue and 10 trade slots each.
`archive/classic-export/Halls.json`: 49 halls with prices/upkeep/start locations.
`archive/classic-export/Monsters.json`: 278 definitions.
`archive/classic-export/script-source/`: source text copies for rg; use these instead of dumping huge JSON.
`tools/augment-classic.cjs` was run. It augments existing `data/classic-world.json` with scripts, NPCs, halls, monsters, guildRules and per-map npc, monsterSpawns, hall. It preserves map layers. Backup: data/classic-world.before-quests.json.
Original guild rules: create level 1, 20,000 gold; join level 1, 1,000 gold; hall purchase minimum 5 members. Halls detected from map attr type8 data[2]; original touchplate opens target cell data[0],data[1] only for owning guild. Purchase uses guild bank and one hall per guild. Price/upkeep from archive.
Original XP threshold: floor(1000*level^1.3); GainExp increments at most one level and sets XP to zero. Source modServer.bas around238.
Original script triggers include joinmap{map}, mapsay{map}, map{map}_{x}_{y} for attr11, getobj{id}, useobj{id}, attackmonster{id}, killmonster events. Check exact monster death event name in source before claiming fidelity.

## Current UNTESTED work-in-progress files

- tools/basic-vm.cjs: bounded BASIC parser/interpreter; no eval/native/FS/network calls. Supports Main, expressions, calls, If/ElseIf/Else including inline, Select Case, For, While/Do, Goto, Exit, Dim, RunScript nesting. Needs syntax/coverage audits and tests! Known concern: splitThen/splitElse scan word boundaries relative to substrings and should also check preceding character; parser may reject archival dialect variants. Unknown functions should fail transaction and roll back, never pretend quest completed.
- tools/game-features.cjs: subclass mixin adding modes state, XP, flags, quest tracker (seven questlog errands), journal, safe death drops, special-PvP, NPC dialogue/trades, guild/halls/upkeep, bounded script API adapter, transaction rollback, timers, doors, basic monsters/loot/AI and quest hooks. Complete text file, NOT compiled/tested. Needs careful review for bugs/fidelity. No claim all quests currently work.
- tools/market.cjs: server escrow marketplace functions; suggested prices from original NPC gold trades; browse/list/buy/cancel/claim. Transactions intended to roll back failures. Needs tests. Ensure dead players cannot trade and numeric bounds cover cumulative balances. Seller earnings held until claim. Story must reject market.
- tools/session-world.cjs: router per client to independent world instances; MMO normal/hardcore; story create/join 8-char code with limit8. Room metadata persisted in data/sessions/rooms.json. World options id0 JSON; id8 leave. Default empty id0 backward-compatible MMO Normal. Session manifest and fresh-session resource cleanup/caps need review.
- tools/world-runtime.cjs: modified by tools/patch-runtime.cjs (do not rerun blindly; string edits are not guaranteed idempotent). Base constructor now accepts options, save file override, content/savedGame. State and save call feature methods. Adds XP/flags defaults, protected loot filtering, calls attackMonster and monsterView, special-PvP exception for guild restrictions. Exports enhanced World via game-features.extend. Saved file/game metadata, base persistence compatibility require tests.
- tools/patch-features.cjs and patch-market.cjs already ran. Do not rerun blindly.
- odyssey-2-server-develop/src/game/world.ts now exports require('../../../tools/session-world.cjs').SessionWorld instead of previous World. NOT compiled in this feature batch! Compiled bin/game/world.js remains baseline export of tools/world-runtime.cjs. So built server won't use room router until build.
- tools/export-classic.ps1 modified; tools/augment-classic.cjs added.

## Must do next on resume

1. Read these checkpoint notes, applicable AGENTS, and inspect actual files; do not restart prior restored-world work.
2. Syntax/review current new modules, fix script VM and transaction issues, then ask user to run isolated tests. User explicitly wants approval for tests and forbids desktop control. Use tool escalation question for tests needing network/hidden rendering. Do not launch user's apps.
3. Wire game-state update to router tick (currently NOT done). Also implement safe cleanup/error handling.
4. Build/test session isolation, story capacity/codes persistence, separate difficulty progress/loot/guilds/markets; death rules apply exactly once incl attacks/AI/potions/scripts; protected loot cannot be stolen; no equipment-player drop selection.
5. Test original seven errand chains from original script sources (questlog flags91,92,93,240,241,242,243) including actual reward amounts/transactions, repeated interactions, NPC text/choices and teleports. Audit remaining scripts; document unsupported functions honestly.
   - joinmap54/map54_3_5 Lumberjack: hatchet27, flag91, 1k XP or flowers; source has different level cap in two triggers, preserve source execution.
   - joinmap1003 Alchemy: beak307 flag93, 3k XP or flowers.
   - Gibberish map342/662 flag92, min level30; source mapsay342 etc for choices.
   - Trapper Joe map585 ->1120 ->585 ->325 ->585, flag242.
   - Manny map595 ->300 ->4 ->300 ->cow (attackmonster8); flag240.
6. Implement client lobby (MMO/story difficulty/create/join) and route Auth to lobby; game.oninit must send selected options; handle server msg4/id5 errors and leave id8.
7. Implement client tracker/journal/dialogue choices/T interact, merchant offers, optional pointer arrows and cinematic input freeze, guild/hall panel and marketplace. Server message4/id6 reserved market responses. Current game.js client is still baseline and has NONE of these changes.
8. Settings/keybindings/controller/touch controls still NOT started. Plan pure browser-compatible settings module, localStorage, Gamepad API polling, adjustable touch control size/position, reset, avoid unbound duplicate keys and keyboard events while typing.
9. Mobile/PWA still NOT started. Need mobile HTTP/WebSocket server (no exposing admin API), shared Mithril client and portable network shim. Avoid claiming Internet access/hosting from invite codes alone: users must connect to same reachable server. TCP desktop currently only127.0.0.1; no new dependencies installed. Native packaging remains separate.
10. Add per-item server/editor deathDrop settings, not player-facing choices. Rules remain configurable for later balance tweaks.
11. Update docs and run meaningful checks approved by user. Existing test files need adaptation for sessions/modes. Do NOT cite previous PASS files as new results. Leave user to launch executable themselves.

## Risks/bugs noted while writing

- BASIC transaction rollback Object.assign originally retained newly-added keys; patched to delete old keys first, inspect actual code.
- api GiveObj third argument is VALUE/durability for nonstackables, quantity for type6/11; adapter handles this, base give helper uses quantity. Verify merchant trades and market preserve per-item value without duplication.
- State packet limit remains65535; quest/journal/market needs bounds, many ground drops may require chunking; base broadcast currently sends entire drop list in one packet.
- No full script coverage audit or gameplay feature test has run; source interpreter API stubs only visual effects are noops, unsupported gameplay APIs must fail closed.
- Basic monster AI/loot is a new simplified implementation, not exact original simulation. Do not label fully faithful without review.
- Story sessions loaded in memory can accumulate; remove empty instances after save and retain manifest/file for reconnect, cap loaded worlds.
- Read-only export command once had failed schema inspection and a runaway null-recordset loop; Ctrl+C ended session90914. A later source inspection session53671 may have completed; no intentional background game/test was started in this batch.

