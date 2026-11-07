> November 6 update: see [the current editor/rendering report](EDITOR-RENDERER-OVERHAUL.md) for the unified free editor camera, comparison editing, source-piece tree assemblies, related HUD/equipment fixes, verification and limitations. Earlier notes below describe previous stages.

# Launcher, character creation, Crendale and HUD update

Restart the server and reopen game clients after installing this update. Browser players should reload after the host restarts. Keep the client/server folders next to the existing launchers; no replacement launcher executable is required.

## Account and character flow

The flow is now **Account Selection → Sign In → Story/MMO → Character Selection**. Difficulty is chosen only when creating a character.

- Remembered account cards show usernames and a previously selected appearance when available. Add Account supports new accounts and existing-account sign-in. Passwords have Show/Hide controls, inline availability/errors and loading states. The Windows-protected credential vault and four-desktop-client reservation are unchanged. Browser clients continue to remember names without storing passwords.
- Story and MMO are separate visual mode cards. Each opens only the characters/saves belonging to that account and mode.
- Character cards show the saved appearance, name, level, area, difficulty and last-played date where available. Continue enters directly using the saved settings. It does not request a new difficulty or appearance.
- Story retains named saves, owner-only Rename, join-code rotation, masked codes and Copy. Rename now uses an inline form. Joining checks the invitation without adding a member or creating a character; an existing character continues immediately, while a first-time participant chooses an appearance before confirming. The host's saved difficulty applies automatically.
- **MMO retains its existing two account slots: one Normal and one Hardcore character.** Occupied slots are shown as existing character cards; creation cannot overwrite them. The server checks this too. This update does not migrate profiles into a different character/account identity scheme.
- Character naming remains the account name, as supported by the current server. Story creation also offers a name for the save. No unsupported rename or class-selection system is invented.

## Dedicated creation screen

Create New Character opens a separate screen for the selected mode. Normal and Hardcore cards describe the actual death rules: Normal drops carried items with most equipped gear protected and loses 5% of current-level XP; Hardcore drops all items and loses one level, with level 1 as the minimum. Existing special-PvP and item exceptions remain server-controlled.

The appearance browser discovers every nonempty atlas group in the server's supported selectable range. The current assets contain **642 valid appearances** within IDs 1–643. A blank group is omitted; IDs are not renumbered. The grid provides 64 choices per page, ID search, selected borders/checkmarks and keyboard navigation using arrows, Home and End. Thumbnails reuse the original transparent atlas with nearest-neighbor rendering.

The large preview supports facing and available walking frames, with a static fallback for sprites missing a requested frame. Desktop uses a two-column creation layout; narrow screens stack it and use an integer-scale preview. The summary shows mode, difficulty, appearance and Story save name. Only **Create Character & Play** submits creation. Browsing, searching, previewing and inspecting invitations do not create game saves.

If a saved appearance is no longer available, the card explains the problem and keeps the stored ID. The game uses a temporary render fallback instead of rewriting the save.

Character summaries are a read-only extension of the existing Story-save protocol. MMO profiles stay in the existing Normal progress file and `sessions/mmo-hardcore.json`; Story saves stay in their existing session files and ownership index. Active sessions are consulted before disk snapshots. New saves record last-played metadata during normal game saves; older profiles can use their file modification time until then.

## Crendale start and guards

New Story and MMO characters, in both difficulties, now start in **City of Crendale, map 1, tile (5,5)**. The arrival tile is protected. Configuration is separate from the original collection:

`odyssey-2-server-develop/data/start-location.json`

The runtime validates that the configured tile is walkable and does not overlap a special tile. Studio publication rejects changes that would block this configured start. Valid existing character positions are preserved. The Crendale start is also the fallback respawn location; existing valid map-specific respawn destinations still apply. Standalone custom-map mode keeps its existing anchor-based start.

The guard problem was a flag interpretation error. Original monster bit 0 means **Guard**, bit 1 means **Supersight**, and bit 3 means **Friendly**. Guards now ignore innocent players and react to actual stored criminal status or direct provocation. Dying does not make a character criminal, and respawn clears stale guard provocation. Guards can remain present in protected areas without attacking across safe boundaries. Supersight alone no longer incorrectly makes an ordinary hostile monster friendly. Enemy creatures whose names contain “guard” are not automatically treated as town guards; the original flags determine behavior.

Original map IDs, exits, scripts and archived assets are unchanged by the start configuration and guard fix.

## Player Panel and HUD

The default HUD puts the game in the center, Player Panel on the right, chat below and quest tracker near the upper-left. The lightweight menu retains quests, guild, market, settings, Worlds, sign-out, status and protected join-code controls.

HP is now in the **Player Panel**, alongside character name, level, numeric HP/XP bars and zone/PvP status. Its tabs include Inventory, Equipment, Stats, Journal, Guild, Market and Settings. Inventory remains a 20-slot grid with the existing equip/use/drop behavior and item details. Equipment uses the actual equipped inventory slots; Stats displays the fields the server provides. Inventory hotkeys can collapse/restore the panel.

Click **Edit HUD** at the upper-right:

1. Drag widget title bars toward a highlighted edge to snap them to Top, Bottom, Left or Right. Quest and menu widgets also support corner placements. Dock selectors provide an alternative to dragging.
2. Drag the gold resize handles or use the widget Size sliders. Collapse/expand widgets with their header buttons; hide/show them using the editor checkboxes.
3. Use Default, Compact, Minimal, Chat-focused or Inventory-focused presets, or enter a name and Save Custom Preset. Custom presets support load, rename and delete. Reset to Default restores the standard arrangement.
4. Click **Lock & Save**, or press Escape, to leave editing. Gameplay movement/attack input is blocked during editing, and drag/resize handles disappear when locked. The Edit HUD button remains reachable even when widgets are hidden.

Layouts and custom presets are stored per account in this client/browser's local storage, under `odyssey-hud:<username>`. The first layout can adopt the previous chat size settings. They are interface preferences, separate from server progress and protected credentials. The widget registry and docking containers can be extended for later minimap, party, buff or hotbar widgets.

Chat keeps its tabs, private routing, scrollback, NPC/player history, text size and minimize controls. The Size controls open as a small popover; while docked, its size control resizes the dock. Chat can move to a side to avoid always occupying bottom space. Width applies to horizontal chat docks. Enter restores/focuses hidden chat; Escape returns to play. NPC/death windows and touch controls remain within the game area. On phones, side widgets overlay rather than squeeze the game into an unusably narrow column; collapse the Player Panel to reveal more world.

## Implementation and checks

- `tools/character-catalog.cjs`: read-only summaries, supported sprite range and invitation inspection.
- `tools/session-world.cjs`: catalogue actions and explicit create/continue/join validation, preserving the existing storage model.
- `src/views/game/login.js`, `lobby.js`, `appearances.js`, `src/launcher.css`: pre-game flow and complete sprite browser.
- `src/views/game/hud.js`, `src/hud.css`: modular layout, docking, editing and presets.
- `src/views/game/panels.js`: Player Panel, actual equipment and character stats.
- `tools/game-features.cjs` and `world-runtime.cjs`: correct guard flags and configured start/respawn fallback.

The new server test verifies all four create paths, existing continuation, ownership/overwrite rejection, invitation difficulty, unavailable saved appearances, Crendale starts/respawn and guard behavior. The hidden launcher test verifies the six requested navigation flows, actual Windows-protected storage, every selectable sprite independently against the original bitmap, keyboard/search/pagination, desktop/phone preview scaling, no saves before confirmation, rename, invitations and account switching. The hidden HUD test performs real pointer events within its offscreen window for dragging, snapping and resizing, plus preset CRUD, hide/restore, collapse, input isolation, persistence and phone layout.

The combined regression pass also covers accounts/client limits, quests, death/respawn/PvP/loot, guild halls, markets, chat privacy/hearing, NPC portraits/history, map-library publishing, TCP framing, browser/mobile, combat, shadows, Studio and the game renderer. Tests use temporary accounts/worlds and offscreen windows. No desktop control or real save-file test writes are used.

Previews: `launcher-modes-preview.png`, `character-creation-preview.png`, `character-creation-mobile-preview.png`, `character-selection-preview.png`, `hud-preview.png`, and `hud-mobile-preview.png`.
