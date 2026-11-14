# Odyssey Reimagined

A work-in-progress reimagining of Odyssey Online Classic, with a downloadable Windows client, offline profiles, player-run servers and Odyssey Studio for creating maps and worlds.

## Download and play

Download the Windows ZIP from Releases and **extract the entire ZIP** into a writable folder. Open **Odyssey.exe**. No Node.js installation, browser account or internet connection is required for offline play. Keep the EXE and its accompanying folders together.

- **Play offline:** add a local profile, select it, and play. No password prompt. The same game simulation runs privately on loopback, with its own accounts and saves. Story and MMO rules are available; choosing MMO rules offline does not connect to a public MMO.
- **Host profile for friends:** opens that same local profile and its existing Story saves on the configured game port. Friends connect to your reachable address, create accounts on your host, then enter the Story join code. Closing/signing out of the host saves and ends the session; saves remain available for offline play later.
- **Join a server:** enter the host's hostname/IP and game port (default 5751). Create or select an account on that server. Saved passwords are separated by server address and port.
- **Host & create:** start a separate community server or open its world in Studio. Keep the hosting window open while people play.
- **Odyssey Server.exe** opens the hosting launcher. **Odyssey Studio.exe** opens the editor. For a configured community world, use **Edit community world** in the launcher to select the exact server workspace.

Windows x64 is the packaged platform. This is an unsigned testing build. Classic 2D and modern 3D are both available in the game. Four simultaneous game clients are allowed per Windows user.

## Saves and backups

Offline profiles and saves live under `%APPDATA%/OdysseyReimagined/`. Each local profile has a separate world under `offline/<profile-id>/server/data/`. Back up that entire profile directory, including `offline-profiles.json`, which holds the local profile credentials used behind the scenes. These are local game identities, not online account passwords.

Story saves are stored independently of join codes. Losing or rotating a join code does not delete a save. Online progress stays on the chosen community server. A server address change currently creates a separate remembered-account list; existing server accounts still work with their original credentials.

The first launch seeds maps into a new world. Subsequent launches preserve the world's edits and progress. Updating the download does not automatically migrate existing custom worlds. Close the relevant server before copying or restoring saves. One running server owns each data folder.

## Run your own server

Edit `community-server.json` beside the EXEs:

```json
{
  "name": "My Odyssey server",
  "host": "0.0.0.0",
  "port": 5751,
  "workspace": "community-world"
}
```

Start **Odyssey Server.exe**, then click **Start server**. The first start copies the seed maps into `community-world/server/data/`. Accounts, MMO progress, Story saves, drops, markets and guilds are owned by this world. The bundled seed is never a copy of the developer's accounts or saves.

Players on your LAN use this PC's LAN IP and the configured port. Players on other networks need a reachable public address, forwarded TCP port or suitable private-network/tunnel service. This build does not automatically change firewall/router settings. The native game protocol currently uses plain TCP; use a trusted private network or encrypted tunnel for testing across the internet and a unique game password. A public production MMO requires transport hardening and deployment review.

The managed desktop host disables the legacy admin API and browser listener. Existing source-based browser hosting remains available through the server configuration. The desktop and browser use the same simulation, but this release's portable hosting UI is desktop-first.

## Edit maps and worlds

Click **Edit community world**. Studio indexes all original maps automatically, supports searchable folders, Player Made copies, 2D/3D editing, connected worlds, sprite artwork and publishing. Publish the intended changes to this server, then save/stop and restart it. Preserve map IDs/connections when updating existing worlds. Other server owners can modify their own copies without changing yours.

Studio's map library and drafts live in the selected workspace. Global scenery profile overrides and artwork belong to the installed game copy; distributing new artwork/profile code currently requires giving players the updated client too. Server map data is transmitted by the existing game protocol.

## GitHub, MMO hosting and Story invitations

GitHub hosts source, issue tracking and downloadable releases. GitHub Pages serves static websites; it cannot run this always-on Node/TCP game server. Use a server/VPS or your own computer for the MMO process and durable data storage.

Story mode can run on a player's PC with up to eight participants, using the host's reachable community-server address and then the Story join code. Current codes identify a Story save **on that server**, not an internet address. Automatic code-only joining through arbitrary home routers is not implemented in this release. It needs a separately hosted rendezvous/relay service; GitHub is not that service. A future relay should keep saves on the host PC, forward only game traffic, expire invitations and preserve save IDs across new codes. Offline mode deliberately opens no internet listener.

## Build from source

Install Node.js 22 or newer and run:

```powershell
npm ci --prefix server
npm ci --prefix client
npm run build --prefix server
npm run build --prefix client
node tools/test-desktop-runtime.cjs
node tools/build-portable.cjs
```

Windows packaging uses the installed Node runtime, Electron's downloaded Windows runtime and the Windows .NET Framework C# compiler. The output includes all required runtimes, maps and tools. The build writes a new timestamped directory rather than overwriting existing worlds. See `THIRD-PARTY-NOTICES.md` for upstream credits.

## Project status

This is an early playable testing build, not a completed replacement for Classic. Rendering is still being reviewed, some legacy scripts and interactions need validation, and automatic internet Story relaying is pending. Report the map ID/name, 2D/3D view, reproduction steps and a screenshot when reporting a problem. Never attach account databases or private save folders to public issues.
