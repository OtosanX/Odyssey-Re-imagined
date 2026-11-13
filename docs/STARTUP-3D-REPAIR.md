# Startup and Studio 3D repair — November 12, 2026

Inspected the Git baseline, OpenCode handoff and uncommitted edits before changing code. The working scenery catalog had been replaced with `{version, maps, catalog: [59 families]}` instead of the renderer's lookup keyed by tile ID. It also began with the invalid JavaScript `use strict;`, producing `SyntaxError: Unexpected identifier 'strict'`. Both the game screen and Studio import this shared renderer, so this prevented single-player from reaching its lobby and prevented Studio from initializing 3D.

The replacement's 59 families exactly matched `tools/scenery-families.cjs`. Regenerated the proper 1,405-tile catalog from that source, preserving the seven newly added family tile IDs and the committed surface-classification work. No map, account, saved game or editor draft was reset. No live applications were controlled or restarted.

The generator now parses and checks its emitted module, verifies a profile exists for every used tile, and replaces the catalog atomically. The desktop regression test now creates a Story character and enters Crendale in 3D, rather than stopping at the mode-selection screen.

Verification:

- Before repair: syntax check reproduced the exact `strict` error; invisible desktop test could not reach Story mode. Isolated server/save tests passed, distinguishing the client loading failure from account/database corruption.
- After repair: offline profile creation, automatic login, Story character creation, Crendale in 3D, logout and reopening passed in an invisible test client.
- Studio tests passed: 3D map preview, height/wall/house editing, undo/redo, saved geometry, camera, picking, object inspection, connected 3D editing and sprite preview.
- All 1,520 original maps rendered in both animation phases without WebGL errors; all 1,405 used tile profiles validated and original map hash remained unchanged.
- Surface-classification and visual clipboard regressions passed. Syntax checked 129 client/tool JavaScript files.

Use the existing workspace `Odyssey.exe` and `Odyssey Studio.exe` after closing and reopening them. The repaired module is loaded directly; no EXE rebuild is required. Older ZIPs or separately extracted copies were not updated. Feature development and GitHub/release work remain paused pending the owner's next instruction.
