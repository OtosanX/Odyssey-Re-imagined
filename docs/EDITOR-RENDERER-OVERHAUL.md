# Unified editor and renderer overhaul

## Architecture inspection (November 6, 2026)

| System | Existing implementation | Integration decision |
| --- | --- | --- |
| Classic 2D / game HUD | client `src/views/game/game.js`, `panels.js`, `hud.js` | Keep Classic rendering and gameplay input independent of 3D metadata. |
| Modern 3D | `scene3d.js`: WebGL projection, atlas, terrain, actors, progressive geometry preparation and bounded caches | Use this same renderer in Studio; retain the existing default 55-degree projection. |
| Scenery | `scenery-layout.js`, `vegetation-layout.js`, `scenery-mesh.js`, `scenery-models.js` | Match source pieces across drawing layers and segment seams; separate anchor, art extent and collision. |
| Asset profiles | `tools/scenery-families.cjs`, generated `scenery-catalog.js` | Explicit reusable source-art metadata; never rewrite Classic maps to repair visuals. |
| Atlas | client `assets/tiles.png`, `sprites.png`, `objects.png`; `tools/tile-art.cjs` reads original bitmap | Native source tiles have seven columns; prepared atlas has 32. IDs remain unchanged. |
| Single map editing | `src/js/editor.js`, `map-format.cjs`, `visual-format.cjs` | One draft with undo/redo; layer editing and optional 3D metadata must stay separate from collision. |
| Studio preview | `src/js/studio-3d.js` already imports the real `Scene3D` | Extend this integration, not a second renderer. |
| Map library | `tools/map-library.cjs`, `src/js/map-library.js` | Streaming complete Classic index, virtual folders, cached thumbnails and virtualized browser already exist. |
| World Builder | `tools/world-builder-model.cjs`, `src/js/map-library.js` | Preserve individual map keys, cardinal links, authorization and cross-map undo. Sequential draft saves need transactional replacement. |
| Gameplay world | `tools/world-runtime.cjs`, `visual-world.cjs` | Connected 12×12 maps become a shared visible neighborhood; server owns collision, movement, entities and map rules. |
| MMO / Story | `tools/session-world.cjs`, `game-features.cjs` | Separate saved progress/instances; shared content and renderer. Editor preview must never connect to live progress. |
| Publishing | `tools/import-map.cjs` and MapLibrary publishing | Explicit offline draft/publish flow, backups, server restart. No invented live synchronization. |

## Diagnosed causes

- Canopy and trunk pieces often occupy different drawing layers. Adjacency-only grouping either split one tree or combined overlapping trees. Explicit source-piece coordinates identify logical objects without merging neighboring identical trees.
- Several presumed single-cell plants are two-cell or three-cell source assemblies. Source-art review plus all-layer placement checks distinguish them from shrubs and unrelated decorations.
- Narrow side-wall artwork was extruded along the wrong extent; full-width wall caps obscured rooms. Separate wall orientation/footprint handling is needed; intentional transparent entrances must remain open.
- Generic silhouette geometry has no per-object diagnostic surface in Studio. Face generation, source ownership and visibility need inspection independently. The existing renderer disables face culling, so current holes cannot all be blamed on backface culling.
- Studio is currently preview-only in 3D. Its map mutation and selection handling must be shared with the 2D canvas before adding direct tools.

## Staged implementation and evidence

1. Repair and verify shared scenery assembly, ground anchors and wall geometry; add developer geometry diagnostics. Keep source data hash and representative multi-angle images.
2. Extend Studio with 2D / 3D / comparison, shared selection and editing, a freely movable editor camera and projected picking.
3. Logical-object operations and connected-world editing with multi-map transactions and undo.
4. Repair/profile tools, bounded gameplay camera configuration and isolated playtest.
5. Representative renderer/editor tests, all-map structural audit, performance and save/load regression checks.

This is a work ledger, not a completion claim. Verification and remaining limitations are recorded with each tested stage. The earlier equipment, HUD and NPC-navigation repairs remain part of the active work.

## Implemented and verified in this pass

The subsequent camera request supersedes the earlier separate Inspection Camera / Gameplay Camera modes. Studio now has **one unrestricted editor camera**. Its internal diagnostic flag is not a user-selectable camera mode.

### Camera and editing

- Map and Sprite editors offer 2D Only, 3D Only and Comparison. Studio uses the actual game `Scene3D` class throughout, including the connected World Builder and sprite preview.
- A shared camera panel provides labeled yaw, pitch, zoom, X/Y pan, precise numbers, tooltips, default markers and highlighted player ranges. Yaw covers 360°, pitch 5–90°. Presets: front, back, left, right, top, reset, focus and fit. Alt-drag orbits, middle-drag pans, wheel zooms. These gestures do not paint.
- Existing player limits remain yaw 0°, pitch 35–70° with default 55°, zoom 16–64 with default 32. Player settings clamp to the shared policy. Studio marks out-of-range views without clamping them. No separate height slider is exposed: the renderer derives its focus height from terrain.
- Map and sprite camera positions are remembered separately while sharing the same control component. Switching display layouts preserves drafts. Comparison split and left/right swap also work in World Builder.
- Ground ray picking uses the renderer's inverse projection and terrain triangles. Structure picking intersects generated triangles; repeated clicks cycle overlapping objects. Selected objects display their source cells/layers, profile, anchor, visual bounds, collision footprint and generated-face count.
- Shared map tools include paint, erase, fill, line, rectangle, eyedropper, region copy/paste, whole-object copy/move/delete, collision, existing visual-height/house tools and undo/redo. Both comparison viewports edit one authoritative draft. Original maps remain protected.
- World Builder can add actual cardinal neighbors as references without changing exits. Its 3D view supports painting and the existing region selection/copy/paste workflow. Logical objects can move across segments; every affected map participates in one undo operation.
- Camera policy controls are developer-facing. Saving policy changes keeps a backup and affects clients when reopened. Merely orbiting in Studio never changes player settings.

### Rendering repairs and diagnostics

- Explicit source-piece profiles now cover 2-row trees, 3-row trees, wide trees, palms and snowy/dead variants. Piece matching spans drawing layers and loaded segment boundaries. A canopy and another tree's trunk in the same cell are no longer merged.
- Source-textured tree volumes retain the original silhouette and scale. Trunks use their original root cells and walkability; foliage does not acquire collision. Bushes/flowers and unrelated dragon/statue art are separated from tree profiles.
- Side-wall strips span their actual cell extent. Verified masonry can have a structural backing; designated arches/openings remain transparent. Wall tops stay narrow rather than covering rooms with broad grey surfaces.
- Fixed triangle winding on generated rear faces, gables and round surfaces. Existing rendering already disabled backface culling; incorrect grouping, extrusion and source classification were separate causes of missing/obscured surfaces.
- Developer overlays include wireframe, face colors, normals, object/tile identifiers, collision, entrances/special tile rules and suspicious geometry. Roof/cap and wall hiding is temporary. Culling can be enabled for diagnosis. Diagnostic export contains map/source metadata and warnings.
- Profile repair supports height scale, ground offset and rotation per object; asset category and intentional-opening rules at map or installation scope. Draft repairs preview immediately and support Undo. Global asset metadata requires explicit confirmation and saves a backup. Original atlas pixels and collision remain independent.
- Selected object artwork can be copied into Sprite Editor. Its live 3D preview offers the actual game character billboard, sprite-shaped volume, upright prop or ground treatment. Pixel edits refresh the same WebGL context.

### Saving and performance

- Multi-map draft saves stage immutable generations, then commit maps and layout through one manifest rename. Failure injection verified that neither map advances on a failed commit. Unreferenced staging files can remain after an interruption; they are not loaded as committed drafts.
- Shared geometry templates, progressive gameplay preparation and bounded world caching remain in place. A new 64 MiB vertex-buffer cache reuses identical geometry batches, replacing changed batches rather than re-uploading every unchanged batch. Reference counting protects buffers still used by cached/current scenes.
- Library indexing still streams the complete collection; thumbnails and visible library cards remain cached/virtualized. The 3D connected-workspace cap is 64 placed segments and 65,536 bounding cells.
- Offline walking preview supports collision, directional barriers, placed cardinal connections and warps whose destination is included in the layout. It reports area changes and never connects to a character account or server progress.

### Related gameplay/HUD fixes carried through

- NPC navigation respects original primary and secondary No Monsters attributes, directional barriers, occupancy, warps and sanctuary rules. Friendly wandering still works; guards do not attack innocent players in the tests.
- Equipment now has six named slots, with rings in slot 5 and ranged weapons in slot 6. Legacy references normalize safely; melee/ranged slots are exclusive. Items can be dragged onto the matching slot. Worn items retain their original bag references rather than being duplicated.
- HUD editing starts from Settings. Widgets can float or dock; a drag preview avoids rebuilding the dragged widget during pointer capture. Export/import shares validated layout JSON without account data. Per-account persistence, resizing, presets and mobile layout remain.

## Evidence

- `tools/test-tile-assemblies.cjs`: house/castle assemblies, original entrances, tree volumes, furniture, seated NPCs and 3,200 side-wall seam samples.
- `tools/test-scenery-world.cjs`: all **1,520 maps / 1,405 used tile IDs** indexed; original data unchanged.
- `test-scenery-all-ui.cjs`: both animation phases on all 1,520 maps, no WebGL errors or runaway geometry; GPU cache bound checked.
- Representative rendered views: Crendale (1), Northern Beach (19), Darkcone Forest (30), Ice Cavern (100), South of Crendale (107), castle (114), Draconis Tavern (324), Throne Hall (355), South Crendale Guild Hall (432). See `artifacts/scenery/interior-trees-*.png` and front/back sheets.
- `test-studio-overhaul-ui.cjs`: comparison, protected originals, 2D/3D edits, undo, source picking, overlapping tree selection, profile preview/undo, diagnostic hiding, connected edits, always-free camera, true top-down view, live sprite updates and an actual offscreen Alt-drag that leaves sprite pixels unchanged.
- `tools/test-editor-foundation.cjs`: inverse projection, terrain editing, cross-segment tree ownership/move/undo, rollback on invalid destinations, atomic save failure/reopen checks.
- `tools/test-geometry-cache.cjs`: shared-buffer reuse, bounded eviction, active ownership and exactly-once release.
- `test-map-transition-ui.cjs`: latest software-rendered test had a **9.2 ms worst preparation call**, retaining continuity during staged preparation; cached returns were 0.1–0.2 ms. This is a local test result, not a guarantee for every PC.
- `test-map-crossing-game-ui.cjs`, `test-scene3d-ui.cjs`, `test-mobile.cjs`, `test-hud-ui.cjs`: held movement, Classic fallback/view switching, browser/mobile bundle, HUD pointer controls and shared/floating layouts.
- Server checks: equipment persistence, NPC wandering, safe zones, all original combat flags, quests/death/markets/guilds, chat and Story/MMO isolation passed using temporary data.
- Classic source SHA-256 remains `58e2a4abebf84c6d748f2aa5a8b8d48fd97a84417145013a9f9e7b80c9924a70`.

## Practical limits and unresolved review

- Passing every map through the renderer proves functional coverage, **not artistic correctness of every asset**. Unclassified decorations still use conservative source-art geometry; ambiguous/partial assemblies are recorded in `artifacts/scenery/structure-audit.json` for review. No claim is made that every old wall opening is semantically identified.
- Face coloring/hiding distinguishes generated surface orientation and structure kind; roof/cap diagnostics are not a complete hand-authored architectural model. Intentional openings must still be checked against source art when changing a profile.
- Connected edits still scan the visible composition to discover changed batches; this is not a fully incremental world graph. GPU buffer reuse and template caches reduce repeated work, but very large layouts remain more expensive than a single map.
- Offline playtest is a movement/rendering preview, not an isolated execution of every original quest, combat encounter or live multiplayer system. Unplaced teleport destinations are reported rather than invented.
- Sprite PNG export does not automatically replace production atlas tiles or assign a new character sprite ID. Its 3D comparison is functional, but a complete custom-asset publishing/assignment pipeline remains separate work.
- Global profile changes use backups rather than the per-map Undo stack. Per-object overrides apply to the generated logical group, not arbitrary individual mesh vertices.

## Opening this version

Reopen `Odyssey Studio.exe` for the editor. Reopen `Odyssey.exe` for the client/HUD changes. Restart `Odyssey Server.exe` when ready to load the NPC/equipment runtime changes. No running user client or server was stopped during implementation; validation used invisible windows and temporary data.
