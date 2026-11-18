# Experimental 3D conversion

This is a local Studio prototype, not the default game renderer or a new map format.

## Try it

1. Restart Odyssey Studio and open a map.
2. Expand **Experimental 3D conversion — preview only** above the map workspace.
3. Leave **Wall interpretation** on Auto and click **Auto-render map**. Studio opens the existing 2D + 3D comparison view.
   Generation opens a visible **Needs review** notice when uncertain, naming the map and listing tile coordinates/reasons. A selected-region retry reports only that region. The technical JSON remains optional.
4. Click **Show current renderer** to compare the existing and experimental 3D views.
5. To retry part of a map, choose the existing **Select** tool and drag a rectangle in the 2D view. Choose a wall direction or solid blocks, thickness, optional floor tile, or tree scale; click **Re-render selection**.
6. **Discard test** restores the normal preview. Editing/switching the source map invalidates the test automatically.

Each retry starts from the original draft and replaces the previous experiment. Generated texture IDs and repairs remain in memory; Save/Publish still operate on the original draft. For permanent edits, discard the experiment and use Studio's existing surface/profile repair tools.

## What it does

- Reads the actual tile layers and collision. Uses nearby opaque, walkable floor samples to look for a floor-colored lower strip in wall artwork.
- Generates separate temporary wall textures from the upper strip and draws a complete inferred floor underneath.
- Recognizes narrow vertical wall silhouettes and their left/right alignment.
- Retains existing explicit profiles and openings in Auto. It never changes collision or interprets every blocked tile as a wall.
- Reuses the documented multi-tile tree assembly system: separate neighboring trees, deduplicated repeated layers, original root anchors and silhouette heights. Missing pieces are reported rather than invented. Tree scale is an optional visual adjustment, not collision editing.
- Reconstructs ground under transparent tree artwork where a local floor sample exists.

## Test results and limits

- All 1,520 original maps analyzed without source/collision changes; 860 have candidate wall conversions (including narrow strips). This count is not visual approval of every candidate.
- Synthetic tests cover mixed wall/floor artwork, adjacent two-piece trees, duplicate layers, selection boundaries and protected openings.
- Hidden Studio tests cover whole-map generation, comparison toggle, selection retry, discard and original draft preservation; actual WebGL comparisons generated for Haunted Clearing, House of PK, Crendale Mines, Down The Well and Hell.
- House of PK: 14 candidate narrow wall pieces. Down The Well: 37 candidate pieces. These need player review of the resulting geometry.
- Crendale Mines and Hell: no sufficiently confident automatic splits in this pass. Existing rendering is retained. Manual region interpretation is available for known wall tiles, but does not reclassify arbitrary unknown artwork.
- This is a pixel/color heuristic plus existing tile-family metadata, not general scene understanding. Similar colored floor/wall art can mislead it. Openings, overlapping structures and incomplete tree families still require review.
- No adoption into the live game, save-format changes or publishing of generated maps is included. Approve the approach after trying it before expanding it into a full conversion pipeline.

Audit: `artifacts/scenery/conversion-prototype-audit.json`. Hidden UI results: `artifacts/scenery/conversion-ui-result.json`. Local comparison sheets: `artifacts/scenery/conversion-comparison-0.png` through `conversion-comparison-2.png`.

## Direct artwork movement
Choose **Click & edit (Ctrl-drag)** in the Paint tool dropdown. Click a generated object to inspect it; repeated clicks cycle overlapping objects. Hold Ctrl while starting a left drag to move its selected artwork, snapped to map tiles. The yellow outline previews the destination; release commits one undoable edit. Esc cancels. Occupied destinations and moves outside the map are rejected. Alt-drag retains camera rotation. This moves the selected generated object, which may contain multiple wall tiles; it does not move gameplay collision, anchors or connections. Discard experimental conversion previews before editing source artwork.

Thin NW, NE, SW and SE corner shapes are available in surface repair and experimental interpretation. The persistent **3D review** button beside view controls shows whether analysis has run and its warning count. Open it and use Auto-render map to analyze; simply opening 3D does not run conversion analysis.
