# Odyssey Reimagined — development handoff

Wall-shape/facing follow-up: shared `wall-shapes.js` uses source-alpha strips for automatic side-wall footprints; explicit full/NS/EW, thickness and alignment metadata validated and exposed in paint/repair/profile workflows. Browser bundle includes the module. All 1,520 maps rendered without WebGL errors. Single-map and World Builder preview now convert map directions to gameplay sprite rows through `editor-playtest.spriteDirection`. Actual geometry dimensions and both preview controls verified in isolated UI tests. Details and audit counts: `SURFACE-REPAIR.md`, `artifacts/scenery/wall-shape-audit.json`.

Editor usability follow-up: explicit Paint layer and independent Repair layer, prominent protected-map edit/copy actions and status, shared brush surface-setting bug fixed, advanced controls collapsed, player-limited default camera with opt-in free inspection. Verified Hell map floor repair, paint layer isolation, camera bounds, undo/save/reopen and full Studio overhaul regression in temporary worlds. See `SURFACE-REPAIR.md`.

November 12, 2026 repair: restored the shared scenery catalog after a malformed family-list replacement broke client startup and Studio 3D. Preserved the current family edits. Offline entry into Crendale and all-map 3D rendering verified; see `STARTUP-3D-REPAIR.md`. Feature work is paused at the owner's request.

Shared handoff for Codex/OpenCode sessions. Statuses reflect the code on disk; verify before trusting. No secrets. Last updated: November 7, 2026 (OpenCode, Priority 1 finished).

## Architecture (one paragraph per layer)

- **Gameplay server** `server`: TypeScript compiled to `bin/`; TCP protocol; accounts; six-layer 12x12 maps. Gameplay world instances come from `tools/world-runtime.cjs` (World extended by `tools/game-features.cjs`), routed per client by `tools/session-world.cjs` (Story/MMO rooms, invited codes, difficulty).
- **Client** `client`: Mithril + Electron. Classic 2D in `src/views/game/game.js`/`panels.js`/`hud.js`. 3D WebGL renderer `src/views/game/scene3d.js` shared by game, browser bundle and Studio (`src/js/studio-3d.js`).
- **Scenery pipeline** (3D): generated catalogue `src/views/game/scenery-catalog.js` ← `tools/build-scenery-catalog.cjs` (reads whole collection + `tools/scenery-rules.cjs` reviewed ranges + `tools/scenery-families.cjs` profiles). Runtime classification `src/views/game/scenery-layout.js`; geometry `scenery-mesh.js`/`scenery-models.js`; trees `vegetation-layout.js`. Profile precedence **instance > map `visual3d.assetProfiles` > installation overrides file `src/views/game/scenery-profile-overrides.js` > catalogue**.
- **Visual metadata**: `visual-format.cjs` validates `visual3d` (version 1; `assetProfiles`, instance overrides capped 1024, `heights`/`walls` grids max 6, `wallTiles`, `structures` houses max 32). Attached per map in drafts (`.map-library`) and connected worlds via `scene3d.segments`.
- **Editor**: `src/js/editor.js` (draft, undo/redo, paint), `tools/map-edit-tools.cjs` (region ops, property-aware clipboard), `tools/map-library.cjs` (drafts/publish, backups), World Builder `tools/world-builder-model.cjs`, camera `src/js/editor-camera.js`, inspectors `src/js/studio-workspace.js` + `scene-inspector.js`, repair tools `src/js/studio-profile-tools.js`, sprite editor `src/js/sprite-editor.js` with live 3D (`src/js/studio-sprite3d.js`).
- **Originals**: `archive/` (game, source, database) and `server/data/classic-world.json` (1,520 maps, 542 items, 2,826 scripts, 196 NPCs, 278 monsters, 49 halls). Classic maps stay protected in editors. Classic source SHA-256: 58e2a4ab…24a70.

## Build and test commands

- Server compile: `npx tsc --noEmit` (check) or `npm run build` (emits bin) in `server`.
- Client build: `npm run build` (tsc → `src/bin/` only; cannot clobber sources).
- Play: `Odyssey.exe` / `Odyssey Studio.exe` launchers run adjacent code; rebuild TypeScript after server source edits.
- Isolated validations (all safe, temp data): `node tools/test-reimagined.cjs`, `node smoke-test.cjs` (run alone; binds 15751 and 8080), `node tools/test-tile-assemblies.cjs`, `node tools/test-scenery-world.cjs`, `node tools/test-editor-foundation.cjs`, `node tools/test-instance-reclassification.cjs`, `node tools/test-clipboard-visual.cjs`, `node tools/test-movement.cjs`, `node tools/test-controls.cjs`, `tools/test-classic-map-combat.cjs`, `tools/test-safe-zone-monsters.cjs`, `tools/test-npc-wandering.cjs`, `tools/test-chat.cjs`.
- Hidden Electron UI checks (offscreen; run in `client` via `npx electron <test>.cjs`): `test-studio-overhaul-ui.cjs`, `test-scenery-all-ui.cjs`, `test-studio.cjs`, `test-map-library-ui.cjs`, `test-scene3d-ui.cjs`, `test-mobile.cjs`, `test-hud-ui.cjs`, `test-combat-ui.cjs`, `test-chat-ui.cjs`, etc. Results land in `artifacts/scenery/` or workspace-root TXT/PNG files.
- Known-failing by design: server Mocha suite `npm test` references a removed ClassicServer module — ignore; the checks above are the validation set.
- Git: annotated snapshot commits exist; baseline `be825c9`. `node_modules/`, `dist/`, `publish/`, `logs/`, caches are gitignored.

## Status by handed-down priority

- **P1 — floor/wall classification (DONE Nov 7)**: root causes diagnosed with visual evidence (catalogue heuristic wall-promotions: 337, 413, 523, 884, 885, 947, 948, 951, 1116, 1169, 1252, 1381, 1437 — several are legitimately vertical: 523 window, 948 palisade, 951 banner, 1116 shingles, 1169 pennant, 1437 bricks; ambiguous textures need per-map review: 337, 413, 884/885, 1252, 1381). Transparent floor decals (splatters 712/335/1228/1229/617/613, carpets 216/1252, mosaics 884/885, pebbles 751/507/221, trapdoor 151, ground bone 105/735) stand upright until a placement override reclassifies them — now fixable per cell in Studio. Implemented: instance-scope classification precedence (scenery-profiles.js), unlocked repair panel, effective-profile inspector with provenance, Surface (3D) paint brush with 2D badges and eyedropper sampling, property-aware clipboard (map-edit-tools.cjs) with overlay/replace modes, instance lifecycle, house footprint takeover, validated caps. Additive metadata only; Classic data/collision untouched; all regression suites + all-1,520-map renderer passed.
- **P2 — broken building geometry (partially done before, needs review)**: developer diagnostics exist (wireframe, face colors, normals, tile IDs, collision, entrances, warnings, export in Structure Inspector). Wall opening/closed rules now also honor per-cell instance overrides. Architectural holes still require manual per-building review against source art (`artifacts/scenery/structure-audit.json` lists ambiguous assemblies). Unclassified cull behavior unchanged (renderer already disables face culling).
- **P3 — roof/wall editing (partially done)**: authored houses support width/depth/height/roof-rise, wall/roof tile palettes, height/wall brushes; repair panel supports height scale, offset, rotation, opening rule per object/map/installation. Missing: per-structure roof pitch slider, roof ridge direction/rotation, wall texture alignment controls, overhang. `visual3d.structures` is the extension surface; validate in visual-format.cjs.
- **P4 — Sprite editor 3D preview (done)**: 2D/3D/side-by-side with character billboard/sprite volume/upright prop/ground treatments; orbit gestures never paint. Publishing custom sprites into the production atlas remains separate (existing limitation).
- **P5 — unified camera (done)**: one unrestricted editor camera with labeled sliders, numeric outputs, presets (front/back/left/right/top/reset/focus/fit), player-range highlighting and outside-range notice; gameplay limits untouched (`src/models/camera-settings.js` + `camera-policy.js`).
- **P6 — multi-tile objects (done in renderer; editor uses logical groups)**: source-piece profiles span layers/seams; placement anchor vs visual footprint vs collision footprint separated; object move/copy works cross-segment with cross-map undo. Note: arbitrary grouping is intentionally avoided; unknown artwork stays ungrouped until profiled.
- **P7 — World Builder/library (done;-safe guards active)**: streaming library, virtual folders, protected originals, transactional multi-map saves (staging+manifest rename), offline playtest. Deferred item listed below.

## Deferred / open items

1. Clipboard UI toggles for "artwork only" / "properties only" copies (mechanism exists: `visualMode:'art'` and clip.visual pruning; needs buttons in the Studio toolbar).
2. Rotation field for the Surface paint selector (instance profiles already support `rotation`).
3. World Builder connected-3D surface brush (single-map editor done).
4. Catalogue asset-scope corrections for ambiguous textures (337, 413, 884/885, 1252, 1381; also 947/948 context) — authors should decide family membership per map context; visual sheets in `artifacts/scenery/`.
5. Roof/wall property expansion (P3 remainder).
6. Sprite publishing pipeline (atlas IDs/assignment) — still separate by design.
7. Manual visual passes: real GPUs/phones, physical controllers.

## Files modified on Nov 7 (Priority 1)

- `client/src/views/game/scenery-profiles.js` — instance precedence merge.
- `client/src/js/studio-profile-tools.js` — instance-scope controls unlocked, load reads stored overrides.
- `client/src/js/studio-workspace.js` — effective profile in Structure Inspector, surface-aware eyedropper, object clipboard includes instances.
- `client/src/js/editor.js` — Surface (3D) paint/erase lifecycle, 2D badges.
- `client/src/editor.html` — Surface selector markup.
- `tools/map-edit-tools.cjs` — property-aware copy/paste.
- `tools/test-instance-reclassification.cjs`, `tools/test-clipboard-visual.cjs` — new checks.
- `VALIDATION.md`, `PAUSED.md`, this file — documentation.
- Revert: `git checkout be825c9 -- <path>` or reset to that baseline for all P1 work at once.

## Resuming rules (from the owner)

- Preserve everything that works; small controlled changes; isolated tests only; do not launch the user's apps; no desktop control.
- Editor drafts and published game data are separate; never auto-publish.
- Original artwork, tile IDs, map IDs, connections, collision and saves are inviolable.

## November 12: automatic ground classification correction
See CRENDALE-SURFACE-AUDIT.md. Removed lava147 from tables, blood47 from furnishings, dirt1450 from masonry; added ten reviewed ground IDs. Untouched protected Classic Hell now verified flat in Studio before any manual override. 3,029 placements across371 maps corrected; all1520 maps pass both-phase rendering. GOD/admin-item punishment rules and original world data unchanged. Explicit user overrides still win. Test: tools/test-reviewed-ground.cjs. Reopen client/editor to load updated shared catalog.


## November 13: cave volumes and layered ruin corners
Structural cave-rock now gets a closed full-cell volume only on original blocked tiles; manual wall shapes/openings win. Masonry tile122 blocked backing in stone-wall maps gets solid infill (explicit122 profiles disable inference). Layered240-244 corner/side pieces retain both directions instead of flattening to horizontal bars. Ruin spans maps133/134. Test tools/test-solid-rock-walls.cjs covers162 cave placements and layered corners; all original source data untouched. Reviewed six maps via artifacts/scenery/crendale-ruin-fixed-0.png. No claim of finished art for every map.


## November 13: House of PK wall and floor pass
Added floor-underlay.js shared renderer helper: keeps existing Ground artwork intact when walls are lifted from upper layers; when Ground itself is lifted, chooses nearby opaque floor within same segment instead of first square-scan result. Browser bundle includes helper. Stacked blocked240-242 masonry gets full-cell closed geometry (manual shape/opening overrides win) to close false strips/corridors seen in House of PK1960/1966/1949. No source map/collision changes. Eight PK map comparison previews artifacts/scenery/crendale-pk-after-0.png. Tests tools/test-floor-underlay.cjs, test-solid-rock-walls, tile-assemblies, instance reclassification pass. Original transparent floor patterns are deliberately preserved, not replaced with nearby grass. Reopen client/editor.

## November 13: project layout
Active folders renamed to client/ and server/. Review outputs moved to artifacts/scenery and artifacts/distribution; source staging to artifacts/publish; root JSON audit results to artifacts/reports. Updated scripts, docs, GitHub workflow and rebuilt all three EXE launchers. tools/world-paths.cjs preserves existing legacy offline/community save folders; new worlds use server/data. Source preparation uses a fresh timestamped destination so old staged files cannot leak into a new package. Real desktop test entered Crendale in 3D using the new layout. Do not globally replace legacy path literals in world-paths or its regression test.

## November 14: tree assembly first pass
Source-art audit found swamp trees801/808 and812/819, plus tall stump804/811/818, were generic objects. Generic grouping merged separate trees and unrelated decorations into3–4-row sheets. Added explicit plant families/piece coordinates in tools/scenery-families.cjs and regenerated shared catalog. Existing vegetation-layout now separates overlapping trees and anchors each at its own trunk. Tests check all16,528 plant instances against documented height, same-family composition, duplicate layers, separate anchors and connected-map seams. 1,606 corrected instances across68 maps. Genuine3-piece source trees are retained, not globally shrunk. Eight maps visually reviewed (94,151,379,1307,1313,1470,772,4). Source world/collision and2D art unchanged. Local changes only.


## November 14: overgrown ruin correction
Joined133/134 preview reproduced the large stretched slabs. Stacked-wall solid inference now leaves vegetation-overlaid stone faces to directional wall geometry; actual masonry fronts240–242 use full original tile artwork instead of stretching a small material patch. Blocked bare masonry stays solid and manual shape profiles retain precedence. test-floor-underlay covers this distinction. Reviewed combined ruin and House of PK1949/1966 with hidden renderer; source collision and2D artwork untouched. test-crendale-review accepts ODYSSEY_REVIEW_RUIN=1 for the joined fixture. Changes remain local.


## November 14: ruin outline correction supersedes beam-only fix
User confirmed narrow beams still did not match. Root cause: base wall artwork was extruded whole although upper vegetation masks much of that stone in Classic. layeredRuinWall now extracts visible stone (wall alpha minus upper plant alpha), greedily meshes its exact pixel silhouette with shallow depth and original texture crops, and leaves explicit wallShape overrides authoritative. Applies only auto ground-layer240–242 overgrown faces; ordinary bare interior walls unchanged. Original collision unchanged. tools/test-ruin-outline.cjs verifies exact visible face area for18 actual ruin cells across133/134. Joined preview artifacts/scenery/crendale-ruin-outline-0.png. This is a source-silhouette reconstruction, not a new hand-modeled castle asset.


## November 14: ruin north–south joins
Accepted EW visible-stone silhouette retained. layeredRuinWall previously returned early and skipped all NS geometry. shapedWalls now adds the original corner/side returns after generating the silhouette. ruinReturns extends toward next row only where original blocked masonry exists, matching front planes across the133/134 seam. Six real corner cells regression-tested for contact and refusal to extend into walkable cells. Roofs/enclosure remain separate from wall connectivity; no roof is inferred from these joins. Treat open ruins, outdoor walls and explicit roofed structures separately as work expands.


## 2026-11-14 — view distance and visible server login
- Added Settings → 3D map view distance: Normal (up to 3×3) / Far (up to 5×5 reciprocal connected maps). Far scenery does not expand gameplay, NPC or chat range. Bounded chunk transfer preserves packet limits and uses per-client coordinate offsets; Classic returns to normal range. Restart server and reopen client to use it.
- Launcher now presents server Sign in / Create account first; account picker has a direct username/password sign-in button. Offline profiles explicitly remain password-free and separate from server accounts. No real saves or passwords changed.
- Passed test-view-distance, test-world, test-scene3d and hidden test-desktop-ui with temporary data. Desktop test verifies actual 60×60 3D render, offline creation/reopen, remote account creation and password sign-in.

## 2026-11-14 — Odyssey login before Story/MMO
- Desktop now opens a device-local Odyssey username/password login with remembered account names; mode selection follows login. Story alone exposes offline/host-with-friends. MMO exposes server list and hosting. Existing per-server accounts remain separate; launcher password is never sent to community hosts. No central identity service has been deployed.
- Server list queries same game endpoint for live player counts and password-lock status; Official labels come only from release-maintained server-directory.json (currently empty). Saved addresses live in AppData. No automatic global discovery service is claimed.
- Added host name/port/world folder/password configuration, salted PBKDF2 join lock and HMAC nonce admission before accounts/gameplay, including browser admission. Private host settings go to ignored community-server.local.json. MMO hosting stays alive on menu return.
- Tests: test-launcher-directory covers local auth/hash, lock rejection/replay, player counts, inventory separation and official-label spoofing; test-launcher-flow-ui covers real hidden login → Story/MMO, offline placement, locked-server list/join, account creation/login, MMO character/game, count 0→1 and 60×60 3D render. Existing desktop-ui entry delegates to it.

## 2026-11-14 — Remember opening-login password
- Opening Odyssey login now offers Remember password on this PC. Uses a separate Electron safeStorage-backed vault under AppData/launcher-passwords, saving only after successful authentication. Selecting a saved account restores its password; unchecked successful sign-in removes it. Last selected username only is stored in localStorage. Server credentials remain separate.
- Hidden test-remember-login-ui passed with real Windows encryption and temporary accounts: save, reload/select, no plaintext on disk, and removal.

## 2026-11-15 — Finished Story save-card launcher
- Replaced the profile dropdown with actual saved-character cards (skin, level, location, difficulty). Continue offers Play Offline or Host for Friends for that exact save. New adventure opens character creation directly. Existing save IDs remain unchanged.
- Hosting rotates the random invitation through the running server before continuing; codes use XXXXXXXX with eye/copy controls. Joining a friend is a collapsed form; host address remains necessary without a rendezvous service. Generic MMO connection panel is hidden in Story.
- Hidden full launcher test passed: create Story, render/reveal/mask card, offline resume, hosted resume with code rotation, MMO admission/login and 3D far view. Inspected artifacts/distribution/story-save-cards.png. Updated older mask assertions.

## 2026-11-15 — Automatic temporary Story forwarding
- Added bounded NAT-PMP/UPnP support restricted to default private Windows IPv4 gateway, 120s requested lease / 600s maximum, owned-rule verification and cleanup. Story hosting uses a fresh port; forwarding failure stops host; offline/join paths do not touch router. Mapping renewal failure stops host. Renderer crashes/window closure stop managed servers; parent forced termination relies on lease expiry.
- Full masked ODY1 invitations encode endpoint plus random save code; desktop join decodes/validates them. No online directory or relay required for these longer invitations; eight-character-only global lookup remains unavailable. CGNAT/unsupported router errors are explicit.
- Added public-input bounds, auth/invitation rate limits, and selected-save policy for shared Story hosts. Tests use localhost mock routers and temporary worlds; no live-router changes made. Forced-termination test confirms listener gone and stale save lock recovery.
- Updated docs/SERVER_HOSTING.md with operational/security limitations.

- Final verification: mock-router tests and lifecycle failure/forced-exit tests passed; hidden real launcher test passed with simulated mapping, full ODY1 reveal/decode, offline/hosted Story, locked MMO sign-in and 3D far rendering. Fixed stale Mithril password-prompt redraw by mounting it in its own container before routing. No physical-router changes or live remote connectivity test performed.

## NPC trade repair — 2026-11-15
- Dirt Hermit (map 806) exchanges one Day Flower (111, dropped by Horticulterist) for Mud Key (112). Trades now appear inside the existing portrait dialogue and record player/reward history.
- Original non-stack trade values mean one item, not a quantity. Equipped items are excluded; capacity is checked before reward scripts; original get/drop restrictions execute. Script TakeObj follows Classic count/absent-item behavior. Dialogue teleports now immediately send map updates; silent merchants have a manual greeting.
- Validation: tools/test-npc-trades.cjs audits 566 map/offer combinations (565 complete, one original god-item restriction), item protection, capacity, ration rules, history and warp delivery. tools/test-reimagined.cjs passes five quest chains plus dialogue/rollback regressions. client/test-npc-trade-ui.cjs passes hidden dialogue UI checks.
- This does not claim every archived script is implemented: Sanctuary Wench and Thelonious Monk remain marked archive-incomplete. Existing saves were not modified. Restart running game/server processes to load changes.

## Accepted-only quest log — 2026-11-15
- Story and MMO log entries now require actual quest progress or explicit acceptance. Old questsSeen discovery arrays and read-only flag checks no longer expose quests.
- Lumberjack and Alchemy use Accept quest in the portrait dialogue; simply entering with the required item no longer silently consumes it. Acceptance persists separately from original completion flags. Existing progressed/completed flags remain visible.
- Quest panel now has Active and collapsible Completed sections, objectives, destinations and tracking. Conversation history stays in the NPC window and chat. /quests uses the same accepted-only list.
- Passed acceptance/persistence tests in both modes, five original errand-chain tests, 566 merchant offers and hidden interface checks including acceptance and Active/Completed groups.
- Full archive static audit: 2,826 scripts parse; 2,532 directly supported, 294 contain missing APIs. This is not full behavioral validation. quest-chain-audit.json inventories stage writes for all seven quests in the original questlog; Sanctuary Wench and Thelonious Monk remain unfinished in the archive. No invented completion/rewards added.

## Hardcore guidance defaults — 2026-11-15
Hardcore Story and MMO now default quest tracker/arrows off, using separate hardcoreTracker/hardcoreArrows opt-ins so Normal preferences cannot enable them. Original quest scripts/rewards, accepted-only log, portrait dialogue, selectable 2D/3D, and requested Hardcore death penalties remain. Checked defaults, Normal isolation and explicit opt-in. This is a Classic-oriented mode, not a claim of complete original engine parity.

## Named characters and difficulty descriptions — 2026-11-15
- Character creation requires a separate 3–24-character name (ASCII letters/digits/underscore, first character a letter). Name uniqueness is case-insensitive across this server's saved characters; independent servers/offline installations have independent registries.
- sessions/characters.json binds opaque character IDs, names, accounts and rooms. MMO supports multiple characters per difficulty with separate inventories/progress. Ownership is checked for catalogue/continuation; existing username-based characters remain accessible. Story currently retains one character per account per save, with different names across saves.
- Difficulty cards explain Normal XP/equipment protection and exceptions, Hardcore full drops/one level loss, guidance defaults, and safe-area loot protection. In-world names, chat, dialogue portraits and save cards use the chosen character identity.
- Passed server tests for multiple names/inventory isolation, duplicate/case collision rejection, ownership/impostor protection, persistence, Story continuation, legacy launcher behavior and offline runtime; hidden focused creation UI verified input and submitted identity.
- Full hidden launcher regression also passed: account/password flow, named Story/MMO Normal/Hardcore creation/continuation, 642 sprite appearances, save rename, hidden invitations, account switching and joined Story continuation.

## Classic key use and inventory double-click — 2026-11-15
- Implemented type-7 key use: adjacent tile in the player's facing direction must be attribute 3 and match the little-endian key ID. Original item data[0] decides consumption (0 consumes; nonzero reusable). Wrong key/facing preserves inventory and provides feedback.
- Inventory double-click now invokes the same use/equip action as the button, excluding empty slots and dead players.
- tools/test-key-doors.cjs passed the actual Day Flower trade → Mud Key → map 806 door opening → movement through doorway → occupied-safe reclosure chain, plus 342 original standard key-door pairs. Existing script-specific use handlers retain precedence. Hidden client/test-inventory-use-ui.cjs verified double-click/button packet equivalence and guards.
- Earlier merchant audit verified exchange only, not downstream key use. Do not describe that audit as full quest-chain coverage.

## Quest follow-up audit — 2026-11-15
Fixed shared item-use dispatch: original USEOBJ returning Continue (0) now permits the normal equipment/consumable/key action if the same item remains. Stop, script failures, consumption/removal and dead players prevent fallback. Previously every script suppressed base use, breaking scripted keys and level-gated equipment.

Validation: test-quest-followups.cjs passed an original scripted key door, Northcoast ticket opening both gates, recipe scroll prerequisites/learning/consumption, equipment level denial and Continue, god-item warp to Hell, prize-item warp with client snapshot, and the available Wench stages. Existing five chain regressions and all 342 standard key-door pairs pass. No live saves used.

The complete item-use audit is artifacts/reports/quest-item-use-audit.json: 146 scripts inventoried, 97 with no statically unresolved APIs/dependencies, 112 successful baseline executions, 34 baseline failures. These are not 112 fully verified quest chains; conditional branches and dynamic dependencies need further tests. Major remaining failures include item prefix/suffix effects, special projectiles/damage, and scripts accessing absent player slots. Unsupported interactions still fail closed with rollback rather than invented effects.

Missing quest content:
- Sanctuary Wench: only flag 243 stages 1 and 2 are written. Existing dialogue requests Granny's potion, then the Shaman's Amulet obtained using Lord Bob's Broadsword. Troll Shaman (155) has no configured drops and no attackmonster155 script. Implement the conditional amulet award, Granny's item exchange/potion, return conversation, completion flag/reward, and recovery/repeat protections. Exact missing stages/rewards cannot be recovered from these scripts and require new design or another original archive.
- Thelonious Monk: no writes to flag 241 exist. map590_2_5 checks this flag to allow entry to map597; otherwise sends the player back and says the door is locked. Needs an actual acceptance dialogue, objectives, progression, access unlock conditions, turn-in, completion and reward definitions. Existing questlog expects completion at stage 6 but supplies no progression.

## Non-tree furnishing review — 2026-11-15
Reviewed original tile artwork and corrected 16 tile classifications/assemblies used on 353 maps: upright independent gravestones/crosses (76/141), low stools (85/148), horizontal rectangular tables (149/150), full double/single bed assemblies (185/186/192/193 and 199/200/206/207), small ground stones (201/221). Models retain original pixel textures and map footprints. Generated catalogue rebuilt from source families. No original maps, collision data or Classic 2D art changed.
Passed tools/test-furnishings.cjs (assembly, separated graves, horizontal low geometry), all-map scenery indexing (1,520 maps/1,405 tiles), and hidden WebGL renders of maps 10,37,68,598,133,324,1750,235. Inspected artifacts/scenery/furnishings-0.png and furnishings-1.png; bed lower halves corrected after first visual review. Usage details in furnishings-audit.json. This is a reviewed prop-family pass, not visual certification of every non-tree sprite.
