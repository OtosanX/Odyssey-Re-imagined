> November 6 update: see [the current editor/rendering report](EDITOR-RENDERER-OVERHAUL.md) for the unified free editor camera, comparison editing, source-piece tree assemblies, related HUD/equipment fixes, verification and limitations. Earlier notes below describe previous stages.

# 3D sprite world prototype

Restart the Odyssey server and reopen clients. Enter a character and click **3D View** in the top menu. **Classic View** switches back immediately. The preference is saved on this device; Classic remains the initial default.

The view now converts scenery throughout the Classic collection into raised geometry: trees, furniture, statues, walls, doors and building silhouettes. It uses original artwork for the fronts and matching solid surfaces for depth and roof contours. The eight generic Crendale house overrides were retired because they did not fit the original scenery.

All 1,520 maps and their 1,405 used tile IDs are indexed automatically. Ground classifications use original layer usage across the collection plus verified individual art families. Water, paths, carpets and floor surfaces remain horizontal. Connected roof/front and tree/trunk pieces are joined across layers and neighboring-map seams. Repeated wall pieces follow the floor plan instead of becoming tall sheets, and grouping limits keep touching groves from becoming giant objects. Animated scenery keeps a stable ground anchor.

Reviewed castle gatehouses and native houses now use connected models with real rear walls, side walls and closed roofs. Their backs do not repeat the front doors/windows. Roof materials use opaque pixel patterns derived from the original artwork palettes. Thin interior and cave side-wall strips now continue between cells without accidental seams. Grouping follows the original seven-column source atlas for verified multi-piece families; palms, fountains, stairs and floor decorations have explicit corrections.

Other assets retain automatic silhouette-based geometry rather than a handcrafted model for every asset. Unusual artwork may still need individual classification or modeling corrections. The source Classic maps and sprites are unchanged. The complete used-tile review is in artifacts/scenery/used-tile-review.json; front/rear comparisons are in artifacts/scenery/exteriors-front-back.png.

Interior walls now have narrow textured tops instead of broad grey slabs. Draconis Tavern's timber wall pieces are classified as walls, and stools, round tables and barrels use dedicated geometry. Decorative NPCs placed on stools and live NPC actors standing on stools receive a visual seat offset.

Tree geometry follows the original composited sprite outline, colour detail and height, with textured volumes for foliage and branches. Repeated neighboring trees stay separate; only explicitly identified multi-piece tree families join. The discarded rounded-canopy experiment is not used. Tree templates share the existing bounded geometry cache. Non-tree artwork accidentally included in the earlier tree family (masonry, water, presents and snow shelters) has been reclassified.

The four-piece legacy house using tiles 59–62 is assembled as one house rather than two overlapping roofs. Only facade artwork below the eaves is retained on modeled house fronts; original roof fragments are replaced by the modeled roof. Cutaway fading is directional, affecting scenery between the player and camera. Approaching a house from outside leaves its front solid. See artifacts/scenery/house-near-far.png and artifacts/scenery/interior-trees-0.png.

## Camera and controls

Settings → World graphics provides camera tilt, scenery cutaway fading and rendering resolution. Existing zoom, movement, tap-to-turn, combat, dialogue, quests, inventory and HUD controls continue to work. Shadows follow the terrain height beneath characters. Labels, speech and damage numbers use projected character positions. Depth testing hides characters behind scenery; nearby scenery can fade to keep the player visible.

The same view is included in the browser client. WebGL is required; a graphics-context failure returns to Classic and adds a System message. Mobile resolution controls are available, but testing so far used an offscreen 390px browser viewport and software WebGL, not physical Android or iPhone hardware. Performance on real GPUs remains to be measured.

## Studio authoring

Open **Odyssey Studio.exe**, then open a map from the existing Map Library. **3D preview** uses the same renderer as the game. Return with **Back to Map canvas** to paint.

Classic maps remain protected. Duplicate into Player Made, or use the existing explicit original-edit authorization, before making changes.

- **3D terrain height** paints elevation; adjacent vertices are blended into slopes.
- **3D wall height** adds raised textured wall cells. The selected palette tile supplies the surface.
- **Place 3D house** places a house using width, depth, height and roof-rise controls. The selected palette tile supplies roof colors, and **Wall tile** supplies wall colors/front artwork. Opaque repeating roof and side surfaces are generated from those original tile palettes so triangular legacy roof cutouts do not leave holes.
- Right-click erases height/walls or removes a house. The structures list also supports height changes and removal. Undo/redo includes geometry.
- World Builder supports terrain-height and wall brushes across connected segments. Place houses in the individual Map canvas. Tile-region copy/paste currently copies its existing tile/collision fields, not 3D geometry.

Save draft and Publish to server preserve the geometry through the existing validation, confirmation and backup workflow. Restart the server after publishing.

**Heights are visual metadata.** Paint collision separately where a raised wall should block walking. Geometry does not change server movement, original exits, warp coordinates, area IDs, quest triggers or PvP rules.

## Storage

`tools/scenery-rules.cjs` and `tools/scenery-families.cjs` hold reviewed art IDs and assembly rules; `tools/build-scenery-catalog.cjs` combines those with whole-collection usage evidence to generate the shared client catalogue. `scenery-layout.js` groups original pieces, and `scenery-mesh.js` builds depth-tested geometry with the dedicated house, castle, furniture and tree routines in `scenery-models.js`. The browser bundle and Studio use the same renderer. Original map names do not determine visual classifications.

`server/data/visual-world.json` still supports optional authored profiles separately from the Classic collection; its initial Crendale entries are now empty. A map's own `visual3d` field takes precedence over that fallback profile. These fields control authored heights/walls/houses; the automatic original-art conversion is handled by the renderer. Studio loads fallback metadata for viewing or duplication without writing it to the original source.

Version 1 accepts height/wall grids matching map dimensions, wall tile IDs, and up to 32 houses per map. Scene metadata follows the existing neighboring-map placements. Large stitched scenes are sent in revision-tagged chunks within the existing network packet limit. Original art textures are shared throughout a 3D session. Geometry preparation at ordinary map boundaries runs in short steps while the previous neighborhood stays visible in the correct coordinates. Three recent scene snapshots and a bounded cache of reusable scenery templates make backtracking quick. GPU uploads are split into smaller batches; static animation phases share geometry. Replaced/evicted scenes are released, and leaving 3D view frees the session resources. First entry into 3D can still perform initial artwork loading. Intentional quest/teleport travel pauses remain unchanged.
