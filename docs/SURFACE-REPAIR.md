# Repairing existing 3D surfaces in Studio

Open a Player Made copy, or explicitly authorize editing the original. Use **Fix existing 3D surfaces** below the drawing toolbar.

1. Choose the **Repair layer** containing the artwork. This is independent of **Paint layer** in the main painting toolbar.
2. Choose **Floor**, **Wall**, **Ceiling**, or **Upright object / fire**.
3. Either use the Select tool to mark a region and click **Apply to selected region**, or choose a tile ID (the eyedropper also works) and click **Apply matching tile on this layer**.
4. Preview in 2D + 3D Comparison. Undo/redo works. Save the draft; publishing remains a separate explicit action.

Ceilings are horizontal overhead surfaces, with height adjustable from 0 to 6 tile units. Use an upper drawing layer when preserving a separate floor below. Classic 2D keeps the original artwork. This change does not infer collision from appearance: a lava floor can remain blocked, and upright fire keeps its original blocked/unblocked cells. Inspect or edit Collision separately when intended.

For the pictured **!HELL! (map 666)**: the 84 repeated lava-floor placements use **tile 147 on Ground**. The shared catalog now classifies it as Floor automatically, including untouched Classic maps. No matching-tile repair or saved draft is needed. Explicit custom overrides still take precedence. Fire tiles 333/334 remain upright and keep their original collision. The repair was verified on a temporary copy, not published into your server.

If the map is protected, the banner above the paint controls offers **Edit original draft** (confirmation required; retains the original ID) and **Make editable copy** (independent Player Made map). The original is not modified until you explicitly publish. Status/error messages now appear above the map controls as well as in the footer.

**Painting:** select the tool, Paint layer, Tile ID and Surface (3D) in the main paint row. The shared 2D/3D paint, line, rectangle and fill tools now carry the surface setting into the draft; previously they bypassed that setting. Painting changes artwork on the chosen layer. Surface repairs change existing artwork's 3D treatment without replacing its tile image. Both support Undo.

**Camera and layout:** the default preview follows gameplay's fixed facing and tilt/zoom limits. Perspective still reveals building sides as the camera moves. Open 3D editor camera and enable **Free inspection camera** only when inspecting backs or other normally hidden geometry. Camera, structure controls, map rules and diagnostic options are collapsed by default to leave more room for the map.

## Wall thickness and direction

Choose **Wall** under Render as (repairs) or Surface (3D) (painting) to reveal the shared wall controls:

- **Automatic from original artwork:** uses reliable narrow vertical artwork strips, including separated strips from layered artwork. Unknown or broad artwork retains its previous rendering treatment. Original layers do not contain a universal thickness value, so this deliberately does not infer every wall from collision alone.
- **Full tile block:** a 1×1 tile footprint.
- **Thin north–south:** runs up/down the map; thickness controls its width. Position chooses west edge, center, or east edge.
- **Thin east–west:** runs left/right; thickness controls its depth. Position chooses north edge, center, or south edge.

Thickness accepts 0.05–1 tile units. Automatic/full modes ignore the thin-wall position/thickness controls. Explicit shapes describe solid visual wall blocks, so use Automatic for original arches/openings unless deliberately replacing their visual shape. These controls never change original movement collision.

Apply to the selected region or matching tile placements using Repair layer, or paint with Surface (3D) set to Wall. Save/publish remain separate. To change an asset throughout the map or installation, select it with Structure Inspector, open Rendering profile repair, choose category Wall, select the desired scope, and apply; installation scope requires confirmation and creates a backup.

The all-map audit found 13,673 reliable side-wall placements across 955 of the 1,520 maps, including 357 layered multi-strip placements. Automatic handling is shared by Studio, native gameplay and browser gameplay; no per-map edits are necessary for those cases. Original maps/artwork are not rewritten. Ambiguous cases still need the explicit controls above.

Verified actual rendered north–south, east–west and full-block dimensions, all original-map rendering in both animation phases, clipboard validation, and all four player-facing directions in both single-map and World Builder playtest. The editor previously used N/E/S/W indices directly as sprite rows; it now uses gameplay's N/E/S/W → 0/3/1/2 conversion, including facing when movement is blocked.

Overrides follow the existing per-coordinate/tile metadata model: the same tile ID repeated on multiple layers at the exact same coordinate shares its override. Different tile IDs at that coordinate are unaffected. Animated partner tiles on Background 1 / Foreground 1 are repaired together. Existing 1024-instance validation limits apply.

Verified with the real map: flat floor geometry, vertical wall classification, raised ceiling vertices, unchanged artwork/collision, undo/redo, saved-draft reopening, and no WebGL errors. Shared renderer and metadata validation support these repairs in both Studio and gameplay.
