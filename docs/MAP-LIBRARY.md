# Odyssey Studio: Map Library and World Builder

Open **Odyssey Studio.exe**, then use the Map editor workspace. Restart Studio if it was already running when these files changed. The first scan indexes the full recovered collection (currently 1,520 original maps), plus valid JSON maps already under `maps/` and nested directories. No manual import of the original collection is needed.

## Browse and organize

- Search is case-insensitive and matches partial names, Classic numeric IDs, full or partial custom IDs, published server IDs, area/region names, tags and virtual folder paths. Typing a search clears folder scope so it searches both libraries; the chosen library/favorites/recent filter still applies.
- Choose **Thumbnail grid** or **Compact list**. Only visible rows are rendered. Click a card for its larger preview and metadata; double-click to open it. Star cards to save favorites. **Recently Edited** lists saved map drafts.
- **Classic Maps / Unsorted** contains originals without reliable category metadata. Names are never used to guess categories. Create folders such as Beaches or Castles and assign maps deliberately using **Folder / area / tags**.
- **Player Made** contains custom maps, duplicate originals and new segments. Choose a folder to browse it, or use **+ Folder**, **Rename**, **Move** and **Delete**. Folder deletion moves maps and child folders to the parent; it does not delete map files. Built-in root and Unsorted folders are protected. Folder operations never touch server IDs or connections.
- **Refresh library** discovers externally changed map data and JSON files. Save tile drafts first. Drafts remain separate from server source changes; a conflicting original draft cannot publish over a newer server map.

## Original protection and drafts

Originals open read-only. **Duplicate to Player Made** creates a stable custom ID, keeps the source Classic ID as provenance, and clears cardinal exits on the copy. Other original metadata, including tile warps, death destinations, scripts, monsters and hall references, remains intact; those references still point to their existing definitions. The original map and its exits are unchanged.

**Authorize original editing** allows changes for this Studio session. **Save draft** stores changes under `.map-library/drafts/`; it does not overwrite server data. **Discard Classic draft** restores the current indexed server map and keeps a recovery JSON copy under `.map-library/recovery/`. Authorization is required again in a new session.

**New map** makes a blank 12 × 12 map. **Open JSON** opens a new Player Made copy and removes original-edit authority. **Export JSON** writes the current map or selected World Builder segment into `maps/`, asking before replacement. New custom IDs persist independently of names or folder moves.

## Build a connected world

1. Select a library card and click **Insert into World Builder**, or open **World Builder** and drag a card onto an empty canvas position. First insertion starts at `(0, 0)`. Further insertions use the selected segment and the North/East/South/West selector. A given map can appear once per layout; duplicate it for an independent second copy.
2. Click **+ Blank 12 × 12** to create and insert a new segment. Pan by dragging with **Select / pan**, or with the middle mouse button. Zoom with the wheel. Click a placed segment to select it. **Edit segment** opens it in the individual editor; original protection applies in both views.
3. **Paint tiles** uses the existing palette, layer selector and eraser across placed boundaries. Classic segments must be authorized before painting. Undo/redo restores tile edits. Original collision, safe-tile attributes, anchors and graphic layers remain separate.
4. With **Select tile region**, drag a rectangle spanning one or more maps. Choose all graphical layers or the current graphical layer, then **Copy region**. In **Paste region**, click the destination's top-left tile. The highlighted rectangle previews the footprint. A confirmation lists all affected maps. **Skip empty tiles** pastes only nonzero tiles; **Include collision** is opt-in. Paste preserves tile attributes, scripts, anchors, entities and exits. If it would touch a protected map, empty segment or block an anchor, the entire paste is rejected.
5. **Area for selected region** sets one area label on all segments touched by the selected rectangle, or the selected segment. These labels leave names and IDs intact. They become the in-game area label after explicit publication and restart.
6. Placing references changes no exits. Select a segment and direction, then **Connect neighbor** to stage a two-way exit. Its confirmation shows the existing forward and return exits. Replacement is explicit; old destination maps and their other exits are left unchanged. Layout lines show staged connections. **Remove reference** changes only the layout and its staged connections.
7. Name the layout, then **Save draft** to save its placements, staged connections and edited map drafts. Use the saved-layout selector to reopen it. Unsaved map/layout changes trigger a close warning. Existing maps larger than 12 × 12 open in the individual editor; World Builder will not silently resize them.

## Publish

**Publish to server** validates changed segments and resolves stable custom IDs to unused numeric server IDs within the existing 16-bit range. Every original included in the publish plan requires authorization. The final confirmation lists maps and every changed exit, including replacements. No source changes occur if confirmation is cancelled.

Publication checks that the server source and drafts have not changed since planning, backs up the full Classic collection, and atomically installs it. It preserves original IDs, unrelated maps, scripts, items, monster definitions and the world starting point. Player Made maps remain Player Made when rediscovered after publication. Publishing the same custom map reuses its assigned server ID.

**Restart the server after publishing.** Running worlds retain their already-loaded maps. There is no live world mutation endpoint in the current server. Larger standalone maps retain the previous backed-up `world.json` import path and standalone server mode.

## Files and implementation

- `tools/map-library.cjs`: streaming Classic index, lazy per-map files, custom discovery, metadata, draft/folder/layout storage and backed-up publish transactions.
- `tools/world-builder-model.cjs`: segment placement, staged edges, bounded map cache, cross-map clipboard and undo/redo.
- `odyssey-2-client-develop/src/js/map-library.js` and `src/studio-library.css`: integrated visual browser and canvas. Existing Map and Sprite editor tools remain available.
- `.map-library/library.json`: folders, favorite flags, stable custom/server IDs and saved-layout list. `.map-library/worlds/` holds layouts. Back up `.map-library/` along with your maps to retain organization and drafts.
- `.map-library-cache/`: disposable per-map Classic cache, lightweight index and generated PNG thumbnails. Thumbnails use the original tile atlas and static frame of ground/background/foreground rendering; alternate animation layers are not stacked over their base frames. Map content and atlas changes invalidate cached thumbnails. Maps load lazily, thumbnail jobs are limited to two at once, and non-dirty World Builder maps use a bounded cache.
- Server item/NPC catalogues now load only when their Studio tab is opened, so they do not force full collection parsing during library startup.

The broader Tile Editor and sprite animation timeline described in the overhaul notes remain separate future phases. This step implements the map library and connected-world workflow within the existing editor.

## Verification

`node tools/test-map-library.cjs` uses temporary server data. It compares every streamed Classic record with the full source, tests global search and nested folders, stable discovery/copies, protected/atomic cross-map paste, undo/redo, saved layouts, four-way publication, real game edge movement and area labels, stale-source conflicts, original authorizations and recovery backups.

Run `test-studio.cjs` with the client's Electron executable for the offscreen UI suite. It uses a temporary library/server root and tests the complete index, virtualization, cached previews, original protection, duplication, blank adjacent segments, cross-map model editing, layout saving, nested-folder tag searches, favorites, list/grid switching and the original Sprite editor. Results are written to `map-library-ui-test-result.txt` and `map-library-preview.png`. No desktop controls or visible game windows are used.
