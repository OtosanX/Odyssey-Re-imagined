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
