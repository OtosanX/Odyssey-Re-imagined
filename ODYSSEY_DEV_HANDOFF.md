# Odyssey Reimagined — development handoff

Shared handoff for Codex/OpenCode sessions. Statuses reflect the code on disk; verify before trusting. No secrets. Last updated: November 7, 2026 (OpenCode, Priority 1 finished).

## Architecture (one paragraph per layer)

- **Gameplay server** `odyssey-2-server-develop`: TypeScript compiled to `bin/`; TCP protocol; accounts; six-layer 12x12 maps. Gameplay world instances come from `tools/world-runtime.cjs` (World extended by `tools/game-features.cjs`), routed per client by `tools/session-world.cjs` (Story/MMO rooms, invited codes, difficulty).
- **Client** `odyssey-2-client-develop`: Mithril + Electron. Classic 2D in `src/views/game/game.js`/`panels.js`/`hud.js`. 3D WebGL renderer `src/views/game/scene3d.js` shared by game, browser bundle and Studio (`src/js/studio-3d.js`).
- **Scenery pipeline** (3D): generated catalogue `src/views/game/scenery-catalog.js` ← `tools/build-scenery-catalog.cjs` (reads whole collection + `tools/scenery-rules.cjs` reviewed ranges + `tools/scenery-families.cjs` profiles). Runtime classification `src/views/game/scenery-layout.js`; geometry `scenery-mesh.js`/`scenery-models.js`; trees `vegetation-layout.js`. Profile precedence **instance > map `visual3d.assetProfiles` > installation overrides file `src/views/game/scenery-profile-overrides.js` > catalogue**.
- **Visual metadata**: `visual-format.cjs` validates `visual3d` (version 1; `assetProfiles`, instance overrides capped 1024, `heights`/`walls` grids max 6, `wallTiles`, `structures` houses max 32). Attached per map in drafts (`.map-library`) and connected worlds via `scene3d.segments`.
- **Editor**: `src/js/editor.js` (draft, undo/redo, paint), `tools/map-edit-tools.cjs` (region ops, property-aware clipboard), `tools/map-library.cjs` (drafts/publish, backups), World Builder `tools/world-builder-model.cjs`, camera `src/js/editor-camera.js`, inspectors `src/js/studio-workspace.js` + `scene-inspector.js`, repair tools `src/js/studio-profile-tools.js`, sprite editor `src/js/sprite-editor.js` with live 3D (`src/js/studio-sprite3d.js`).
- **Originals**: `archive/` (game, source, database) and `odyssey-2-server-develop/data/classic-world.json` (1,520 maps, 542 items, 2,826 scripts, 196 NPCs, 278 monsters, 49 halls). Classic maps stay protected in editors. Classic source SHA-256: 58e2a4ab…24a70.

## Build and test commands

- Server compile: `npx tsc --noEmit` (check) or `npm run build` (emits bin) in `odyssey-2-server-develop`.
- Client build: `npm run build` (tsc → `src/bin/` only; cannot clobber sources).
- Play: `Odyssey.exe` / `Odyssey Studio.exe` launchers run adjacent code; rebuild TypeScript after server source edits.
- Isolated validations (all safe, temp data): `node tools/test-reimagined.cjs`, `node smoke-test.cjs` (run alone; binds 15751 and 8080), `node tools/test-tile-assemblies.cjs`, `node tools/test-scenery-world.cjs`, `node tools/test-editor-foundation.cjs`, `node tools/test-instance-reclassification.cjs`, `node tools/test-clipboard-visual.cjs`, `node tools/test-movement.cjs`, `node tools/test-controls.cjs`, `tools/test-classic-map-combat.cjs`, `tools/test-safe-zone-monsters.cjs`, `tools/test-npc-wandering.cjs`, `tools/test-chat.cjs`.
- Hidden Electron UI checks (offscreen; run in `odyssey-2-client-develop` via `npx electron <test>.cjs`): `test-studio-overhaul-ui.cjs`, `test-scenery-all-ui.cjs`, `test-studio.cjs`, `test-map-library-ui.cjs`, `test-scene3d-ui.cjs`, `test-mobile.cjs`, `test-hud-ui.cjs`, `test-combat-ui.cjs`, `test-chat-ui.cjs`, etc. Results land in `scenery-audit/` or workspace-root TXT/PNG files.
- Known-failing by design: server Mocha suite `npm test` references a removed ClassicServer module — ignore; the checks above are the validation set.
- Git: annotated snapshot commits exist; baseline `be825c9`. `node_modules/`, `dist/`, `publish/`, `logs/`, caches are gitignored.

## Status by handed-down priority

- **P1 — floor/wall classification (DONE Nov 7)**: root causes diagnosed with visual evidence (catalogue heuristic wall-promotions: 337, 413, 523, 884, 885, 947, 948, 951, 1116, 1169, 1252, 1381, 1437 — several are legitimately vertical: 523 window, 948 palisade, 951 banner, 1116 shingles, 1169 pennant, 1437 bricks; ambiguous textures need per-map review: 337, 413, 884/885, 1252, 1381). Transparent floor decals (splatters 712/335/1228/1229/617/613, carpets 216/1252, mosaics 884/885, pebbles 751/507/221, trapdoor 151, ground bone 105/735) stand upright until a placement override reclassifies them — now fixable per cell in Studio. Implemented: instance-scope classification precedence (scenery-profiles.js), unlocked repair panel, effective-profile inspector with provenance, Surface (3D) paint brush with 2D badges and eyedropper sampling, property-aware clipboard (map-edit-tools.cjs) with overlay/replace modes, instance lifecycle, house footprint takeover, validated caps. Additive metadata only; Classic data/collision untouched; all regression suites + all-1,520-map renderer passed.
- **P2 — broken building geometry (partially done before, needs review)**: developer diagnostics exist (wireframe, face colors, normals, tile IDs, collision, entrances, warnings, export in Structure Inspector). Wall opening/closed rules now also honor per-cell instance overrides. Architectural holes still require manual per-building review against source art (`scenery-audit/structure-audit.json` lists ambiguous assemblies). Unclassified cull behavior unchanged (renderer already disables face culling).
- **P3 — roof/wall editing (partially done)**: authored houses support width/depth/height/roof-rise, wall/roof tile palettes, height/wall brushes; repair panel supports height scale, offset, rotation, opening rule per object/map/installation. Missing: per-structure roof pitch slider, roof ridge direction/rotation, wall texture alignment controls, overhang. `visual3d.structures` is the extension surface; validate in visual-format.cjs.
- **P4 — Sprite editor 3D preview (done)**: 2D/3D/side-by-side with character billboard/sprite volume/upright prop/ground treatments; orbit gestures never paint. Publishing custom sprites into the production atlas remains separate (existing limitation).
- **P5 — unified camera (done)**: one unrestricted editor camera with labeled sliders, numeric outputs, presets (front/back/left/right/top/reset/focus/fit), player-range highlighting and outside-range notice; gameplay limits untouched (`src/models/camera-settings.js` + `camera-policy.js`).
- **P6 — multi-tile objects (done in renderer; editor uses logical groups)**: source-piece profiles span layers/seams; placement anchor vs visual footprint vs collision footprint separated; object move/copy works cross-segment with cross-map undo. Note: arbitrary grouping is intentionally avoided; unknown artwork stays ungrouped until profiled.
- **P7 — World Builder/library (done;-safe guards active)**: streaming library, virtual folders, protected originals, transactional multi-map saves (staging+manifest rename), offline playtest. Deferred item listed below.

## Deferred / open items

1. Clipboard UI toggles for "artwork only" / "properties only" copies (mechanism exists: `visualMode:'art'` and clip.visual pruning; needs buttons in the Studio toolbar).
2. Rotation field for the Surface paint selector (instance profiles already support `rotation`).
3. World Builder connected-3D surface brush (single-map editor done).
4. Catalogue asset-scope corrections for ambiguous textures (337, 413, 884/885, 1252, 1381; also 947/948 context) — authors should decide family membership per map context; visual sheets in `scenery-audit/`.
5. Roof/wall property expansion (P3 remainder).
6. Sprite publishing pipeline (atlas IDs/assignment) — still separate by design.
7. Manual visual passes: real GPUs/phones, physical controllers.

## Files modified on Nov 7 (Priority 1)

- `odyssey-2-client-develop/src/views/game/scenery-profiles.js` — instance precedence merge.
- `odyssey-2-client-develop/src/js/studio-profile-tools.js` — instance-scope controls unlocked, load reads stored overrides.
- `odyssey-2-client-develop/src/js/studio-workspace.js` — effective profile in Structure Inspector, surface-aware eyedropper, object clipboard includes instances.
- `odyssey-2-client-develop/src/js/editor.js` — Surface (3D) paint/erase lifecycle, 2D badges.
- `odyssey-2-client-develop/src/editor.html` — Surface selector markup.
- `tools/map-edit-tools.cjs` — property-aware copy/paste.
- `tools/test-instance-reclassification.cjs`, `tools/test-clipboard-visual.cjs` — new checks.
- `VALIDATION.md`, `PAUSED.md`, this file — documentation.
- Revert: `git checkout be825c9 -- <path>` or reset to that baseline for all P1 work at once.

## Resuming rules (from the owner)

- Preserve everything that works; small controlled changes; isolated tests only; do not launch the user's apps; no desktop control.
- Editor drafts and published game data are separate; never auto-publish.
- Original artwork, tile IDs, map IDs, connections, collision and saves are inviolable.
