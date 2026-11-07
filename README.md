# Odyssey Reimagined

See [REIMAGINED.md](REIMAGINED.md) for current launch instructions, features, controls, mobile access and known limitations.

The current launcher, character creation, Crendale start/guard fixes and customizable Player Panel/HUD are described in [LAUNCHER-AND-HUD.md](LAUNCHER-AND-HUD.md). Restart the server and reopen clients after updating.

The optional **3D View** now gives scenery throughout the Classic collection height and depth using its original silhouettes. Studio includes height/wall/house tools and the same 3D preview. See [3D-VIEW.md](3D-VIEW.md) for controls and conversion limits.

The original restoration notes below are historical.

# Odyssey workspace

## Launch

- Double-click `Odyssey.exe` in this folder to start the modern server and game together.
- Double-click `Odyssey Studio.exe` to open the map and sprite editors.
- Keep the executables in this folder: they use the adjacent client/server folders and installed Node.js. They are launchers, not standalone distributable game packages. They run the existing compiled code; use the PowerShell script below to rebuild TypeScript after source changes.
- `Start-Odyssey.ps1`: builds and starts the modern server and scrolling client. Closing the client stops its server. Logs are in `logs/`.
- `Start-Editor.cmd`: opens Odyssey Studio without starting a server.

The modern client now loads 1,520 recovered original maps with archived artwork, exits, warps and PvP zones. New characters start in Throne Hall. See [RESTORATION.md](RESTORATION.md) for controls, implemented game systems, verification, and remaining work. Original game binaries, source, and database remain under `archive/`.

## Map editor

Choose an original tile from the palette and paint. There are six drawing layers, a separate collision layer, zoom, grid, erasing, and undo/redo. Foreground layers draw above players in the game.

Choose **Place anchor**, type a name, and click a walkable cell. Anchors are saved with the map. Use the anchor list to jump to a location or choose the starting spawn. The spawn cannot be removed until another anchor is selected as spawn. Collision painting protects anchor cells.

Studio now has a searchable **Map Library** and **World Builder**. It discovers all 1,520 recovered Classic maps and existing JSON maps automatically. Search names, IDs, area/region labels, tags or nested folder paths; switch between thumbnail grid and compact list, or filter favorites and recent edits. Unclassified originals appear under **Classic Maps / Unsorted**. Custom maps live under **Player Made**. Folders are virtual and never change server IDs.

Classic maps open protected. Duplicate into Player Made for independent editing, or explicitly authorize an original draft. **Save draft** stores editor changes separately from the server. **Export JSON** writes an interchange file under `maps/`; **Open JSON** opens a safe Player Made copy. **Publish to server** shows the exact map/exit changes, requires confirmation for original edits, and backs up the server collection. Restart the server to apply published maps.

World Builder places 12 × 12 segments beside one another, supports cross-segment painting and tile-region copy/paste, and saves named layouts. Inserting a reference leaves exits unchanged; **Connect neighbor** stages a two-way connection for later confirmation. Area labels do not change map IDs. Larger custom maps (12–40 by 12–30) remain available in the individual Map editor and existing standalone server mode.

See [MAP-LIBRARY.md](MAP-LIBRARY.md) for the workflow, storage and safeguards. The recovered database was exported using `tools/export-classic.ps1` and converted using `tools/convert-classic.cjs`.

Command-line import: `node tools/import-map.cjs maps/your-map.json`.

## Sprite editor

Tools include pencil, eraser, flood fill, color picker, brush sizes, mirrored painting, horizontal/vertical flips, rotation, transparency, grid, preview, and undo/redo. Choose 16, 32, 48, 64, or 128 pixels when creating a new sprite. Import PNG/JPEG/WebP/BMP images to fit into the selected size. Browse original sprite frames as starting points.

**Save PNG** exports to `sprites/`. Exporting a sprite does not assign it to a player or upload it to the server yet. Animation timelines and custom character assignment remain future work.

## Checks

`node smoke-test.cjs` runs an isolated local server and checks accounts, movement, maps, anchors, imports and network framing. `odyssey-2-client-develop/test-studio.cjs` is an Electron test entry point for an invisible test window; it writes `map-library-ui-test-result.txt` and `map-library-preview.png`. These checks do not automate the desktop.

The inherited server Mocha suite currently references a removed ClassicServer module and fails before running. The separate smoke test covers the current implementation.

The latest 3D corrections include connected castle/house models with proper rear walls and roofs, continuous interior/cave side walls, and a complete used-tile audit. Original NPC-combat protection is enforced on all 45 Classic maps carrying that rule. Restart the server and reopen clients. See [3D-VIEW.md](3D-VIEW.md) and [VALIDATION.md](VALIDATION.md) for behavior, checks and remaining limits.

