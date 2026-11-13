# Crendale and !HELL! surface audit — November 12, 2026

Fixed the shared source classification, not individual map drafts. Tile 147 (lava floor) was incorrectly included in the tables-and-beds family. The previous wall-thickness and manual-repair work did not resolve that automatic classification.

Reviewed the atlas for 603 tile IDs used by 69 Crendale-area maps and rendered 24 representative original maps alongside their Classic artwork. Corrected ten confirmed ground-art IDs: 47, 105, 147, 507, 735, 751, 965, 1228, 1229, 1450 (lava, dirt, gravel, bones and blood details). These occur 3,029 times across 371 original maps. Ambiguous wall/stair art was not broadly reclassified based solely on collision or drawing layer.

The corrections live in `tools/scenery-families.cjs`, with the generated catalog shared by gameplay and Studio. Explicit user-created surface overrides still take precedence. No saved draft is required for the original maps to receive these corrections; reopen the client/editor to load the new catalog.

!HELL! is the GOD/admin-item punishment destination, per Caleb's clarification. This change does not alter its access, scripts, collision, items or gameplay rules. Its lava floor stays horizontal while its brick walls and fire remain upright. Classic 2D artwork is unchanged.

Validation:
- Hidden Studio test opens protected `classic:666` before any duplication or manual repair and checks that lava has no standing geometry.
- Regression checks cover corrected placements across all affected maps and preserve Hell fire/walls.
- All 1,520 original maps render in both animation phases without WebGL errors or unbounded geometry. This is a render-health check, not a claim that every map is visually perfect.
- Manually inspected 24 rendered map comparisons, including Crendale town/interiors, keep, guild halls, mines and !HELL!.
- Wall shapes, tile assemblies, instance overrides, undo/redo, saved repair reopening and ceiling geometry checks pass.
- Original world SHA-256 remains `58e2a4abebf84c6d748f2aa5a8b8d48fd97a84417145013a9f9e7b80c9924a70`.

Before/after contact sheets: `scenery-audit/crendale-before-{0,1,2}.png` and `scenery-audit/crendale-after-{0,1,2}.png`.
