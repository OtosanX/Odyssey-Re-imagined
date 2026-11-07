# Chat and NPC conversation history

Restart the server and reopen game clients after this update. Browser players should reload after the host restarts. Existing characters and Story saves are kept.

Mode, difficulty, nearby-player count and control hints now appear in the top status bar. The repeated notice and status footer below chat have been removed; notices remain in their chat channels. Story join codes are masked by default in the top bar and Story save cards. Use the eye to show/hide a code or **Copy** to copy it without exposing it onscreen. Changing the code resets it to hidden. These interface changes require reopening the game; browser hosts should restart once so their updated UI bundle is served.

## Channels

The bottom chat dock includes **All**, **Local**, **World**, **Combat**, **NPC**, **Guild**, **Whispers**, and **System**. MMO worlds also show **Trade**; Story saves show **Party**. Read tabs filter messages. The channel selector beside the input chooses where your next message goes.

- **Local**: connected open ground within a 3 × 3 map neighborhood, including diagonals that sound can reach through real cardinal edges. The server follows walkable ground and reciprocal exits, never teleport destinations. Original indoor map flags, indoor/outdoor tile overrides, walls, closed paths, warp entrances and silent areas stop sound. Players in a building hear others in the same connected room, not people outside or through closed walls. This deliberately uses actual flags and connectivity rather than guessing from map names.
- **World**: everyone in your current world instance. Normal and Hardcore MMO instances remain separate; Story messages stay in that Story save.
- **Guild**: online members of your guild in the same world. Membership is checked by the server.
- **Party**: the players sharing your Story save, up to its existing eight-player limit.
- **Trade**: MMO trade discussion; this does not place a market listing automatically.
- **Whispers**: private messages to an online account in your current world, plus your own sent copy. Other players do not receive them.
- **Combat** and **System**: server combat results, deaths/respawns and notices. These are read channels. You can keep reading them while using the send selector for Local or another channel.
- **NPC**: NPC lines and your accepted replies. Select NPC as the send channel to talk or reply deliberately; ordinary Local/World chat does not invoke NPC scripts.

Type **Enter** to focus chat and **Escape** to return to the game. Typing in chat cannot move, attack, select numbered dialogue choices or trigger respawn. Enter still respawns a dead character when chat is not focused. On touch screens, tapping the game or an action control releases chat input focus. Dialogue and death windows leave the bottom chat available.

Commands: `/local` or `/l`, `/world`, `/guild` or `/g`, `/party` or `/p`, `/trade`, `/npc`, `/w account_name message`, `/r message` and `/help`. Existing `/quests`, `/craft` and `/smith` commands still route to their existing handlers. Player messages accept up to 400 characters, with server rate limiting. NPC replies retain the existing 160-character limit.

## Size and scrollback

Drag the top edge to change chat height. Drag the upper-right gold corner to change height and width. **Size** exposes sliders for height, width and text size, plus a reset button. Settings are saved on this device. On phones the dock uses full width, while height and text size remain adjustable. Resizing adjusts the game viewport rather than painting chat over it; touch controls stay in the game area above chat.

Use the arrow button to minimize/expand chat. Tabs show unread counts. Scrolling up keeps your position when messages arrive; **Jump to latest** resumes following new messages. The current session keeps up to 800 messages in memory. World, Local and whisper logs are not written to player saves by this feature.

## NPC portraits and history

NPC portraits resolve explicit Studio mappings first, then the actual matching map actor or original monster definition. King Dekkar III at spawn now uses his original sprite **84**, rather than the generic fallback. A speaker-specific portrait mapping does not accidentally apply to a different speaker on the same map. The selected player sprite remains on the right.

The conversation window now shows a scrollable NPC/player history. Numbered replies display their actual choice text rather than just a number. The same exchanges appear in the NPC chat tab. Invalid numbered replies are rejected and are not shown as accepted answers. Script failures roll back their output as well as quest side effects.

Each character/world profile retains its latest 120 conversation entries. Reconnecting restores that history to the NPC chat tab without opening a dialogue window automatically. The portrait window displays the recent history for its current NPC and map. Packet budgeting keeps history from overflowing the existing network frame size. Existing journal data remains available.

## Map hearing controls

Studio's Map editor now has **Local sound**: **Original / automatic**, **Room only**, or **Disabled**. Originals retain their existing indoor flags. These settings use the normal draft/publish safeguards and take effect after publishing and restarting the server. Optional JSON metadata `chat.group` can link adjacent indoor segments belonging to one explicit acoustic group; it does not bypass walls or the 3 × 3 range.

Implementation: `tools/chat.cjs` routes and validates messages within each `World`; protocol message 16 avoids the existing Story-save message 15. `src/views/game/chat.js` provides the shared desktop/browser dock. NPC history and portrait resolution live in `tools/game-features.cjs`, with presentation in `src/views/game/panels.js`.

## Checks

`tools/test-chat.cjs` tests channel privacy, hearing range and barriers, Story/difficulty isolation, Story-save protocol compatibility, Unicode/message limits and throttling, the actual King sprite, accepted reply labels, persisted history, script rollback and packet size limits. The hidden `test-chat-ui.cjs` checks filtering, replies, portrait/history display, safe text, focus, sizing, scrollback, minimize and phone layout. The browser/mobile integration test also checks a real WebSocket World-chat round trip and an actual conversation with the King. All use temporary worlds/accounts and offscreen windows; no desktop control is used.

## Ambient speech versus conversation

Ambient NPC barks stay in the NPC chat log and their temporary floating speech bubbles. The conversation window includes only explicit interaction and player replies for that NPC. An ambient speaker cannot replace an already open conversation or pollute its history. Older unclassified NPC lines remain in the chat log; they are omitted from the conversation window because their origin cannot be reliably recovered. Older player replies remain eligible for conversation history.
