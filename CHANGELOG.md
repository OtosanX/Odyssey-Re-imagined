# Changelog

This log summarizes implemented changes from repository history and development notes. A passing audit is not a claim that every original quest or map is fully restored.

## v0.1.0-testing.20261116.2 — 2026-11-16

### Fixed

- Classic 2D player and NPC names now sit above their health bars instead of overlapping the sprite's body. The 3D label position is unchanged.

### Documentation

- Added this consolidated changelog and linked it from the project documentation.
- Backfilled the earlier changes below from the development handoff and existing commits.

## v0.1.0-testing.20261116 — 2026-11-16

### Windows download and launchers

- Published the first complete Windows game ZIP, including Electron and Node runtimes, the game, server launcher and Studio.
- Replaced the misleading “extract the ZIP” error for source downloads with an explanation and a link to the playable release. Incomplete game packages identify the missing file.
- Added package checks to the three EXEs and release build, plus an extracted-ZIP check for file hashes and the fresh-profile login screen.
- Added tagged-release publishing to the Windows build workflow.
- Put the playable download at the top of the README and in the repository About link. GitHub's automatic source ZIP is still for developers.

### Scenery

- Tables use low horizontal tops and legs. Left ends, repeated middle pieces and right ends form complete assemblies.
- Full multi-tile beds render horizontally, including their lower blanket tiles.
- Gravestones stand upright; stools remain low; small stones stay on the ground.
- Added wooden chair seats, legs and backs, and fountains with stone basins, water surfaces and raised centre features.
- Corrected chair texture sampling that could fall back to gray masonry.
- Reviewed prop families occur on 406 maps. Eight map renders and the all-map classification check passed; this is not a visual certification of every prop. Original 2D artwork and map collision data were preserved.

## Earlier changes included in the first Windows release — 2026-11-14 to 2026-11-15

### Accounts, characters and Story saves

- Opening Odyssey account login precedes Story/MMO selection. Offline play belongs to Story; MMO offers server browsing and hosting.
- Added optional Windows-protected password remembering, separate from community-server credentials.
- Story save cards show appearance, level, location and difficulty. Continue opens the existing save offline or hosts it for friends.
- Story save identities remain separate from replaceable join invitations. Invitations are hidden by default with reveal/copy controls.
- Character names can differ from account usernames. New names are case-insensitively unique within a server; ownership is checked when listing or continuing characters.
- Multiple MMO characters per difficulty keep independent inventories/progress. Story retains one character per account per save, with different names across saves. Existing username-based characters remain accessible.
- Character creation explains Normal and Hardcore death penalties, equipment-protection exceptions, loot recovery and guidance defaults.

### Hosting

- Added server list status for player counts and password locks, plus configured Official/Community labels and community-host settings.
- Added temporary NAT-PMP/UPnP Story forwarding and full ODY1 invitations containing connection information and the save code.
- Managed Story hosting stops on window closure; forwarding leases are renewed while hosting and removed on orderly shutdown. Forced termination relies on lease expiry.
- Added authentication/invitation rate limits, input bounds and restrictions to the selected hosted Story save.
- Router support is required; CGNAT is not bypassed. There is no deployed global server directory or relay, and no claim of encrypted gameplay transport.

### Quests, items and Hardcore

- NPC trade offers appear inside the portrait dialogue window, with player replies and trade results retained in history.
- Restored non-stack trade quantities and original get/drop restrictions. Equipped items are protected from merchant exchanges; reward capacity is checked before exchange scripts.
- Quest logs show accepted/progressed quests only, grouped into Active and Completed. Lumberjack and Alchemy require explicit acceptance before automatic hand-in.
- Hardcore trackers/arrows default off and use separate opt-in preferences from Normal mode. Full-item drops and one-level loss remain the requested Hardcore rules.
- Added original key-door use: stand beside the door and face it. Matching keys open it; original item rules control consumption or reuse. Doors wait for occupants before reclosing.
- Added inventory double-click use/equip, matching the Use button.
- Fixed item scripts returning Continue incorrectly suppressing the normal equipment, consumable or key action. Stop and failed scripts still block fallback.
- Dialogue/item teleports deliver map updates immediately.
- Checks cover five complete errand chains, 566 merchant offers, 342 standard key-door pairs, and targeted scripted-key, ticket, recipe, equipment and teleport cases. These counts cover different checks, not hundreds of fully verified quests.

### Remaining quest limitations

- Sanctuary Wench stops at stage 2 in the archive. Missing: conditional Shaman's Amulet award, Granny's potion exchange, return dialogue, completion/reward and recovery safeguards.
- Thelonious Monk has a door-access check but no quest-flag progression scripts. Acceptance, objectives, progression, unlock conditions and rewards still need original source or new design.
- The item-use audit inventoried 146 scripts: 97 had no statically unresolved dependencies; 112 passed baseline execution; 34 failed under those starting conditions. Missing enchantment and special-combat functions remain. Baseline execution does not test every branch.

## Earlier project baseline and restoration — through 2026-11-14

These are consolidated historical entries, not new changes in the latest patch.

- Established downloadable desktop/offline hosting, server-side saved worlds and accounts, Story/MMO and Normal/Hardcore modes, inventory/equipment, respawning, combat feedback, guild halls and player market foundations.
- Added NPC portrait dialogue/history, tabbed resizable chat, configurable controls and controller/touch support, and HUD editing with import/export.
- Added Classic 2D and optional 3D rendering, with configurable 3D camera settings and up to 5×5 connected-map scenery. Gameplay and local-chat range remain bounded separately.
- Added editor/map-library/world-builder tools, original-map discovery, previews and custom organization, plus explicit surface/profile overrides and surface-aware editing.
- Corrected ground-versus-wall classification, cave volumes, wall/floor gaps, tree assemblies and overgrown-ruin joins through several targeted passes. Scenery restoration remains ongoing.
- Reorganized the project into client/server/tools directories and separated generated artifacts and private save data from distributable files.

For detailed evidence and older limitations, see [development handoff](docs/ODYSSEY_DEV_HANDOFF.md) and [validation notes](docs/VALIDATION.md).
