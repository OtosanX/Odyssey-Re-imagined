# Odyssey Reimagined

A work-in-progress reimagining of Odyssey Online Classic, with Classic 2D and optional 3D graphics, offline play, player-run servers, and Odyssey Studio for map and sprite editing.

[Documentation](docs/README.md) · [Playing and hosting](docs/DOWNLOAD-AND-HOST.md) · [Report a bug](https://github.com/OtosanX/Odyssey-Re-imagined/issues)

## Get started

**[Download the Windows game](https://github.com/OtosanX/Odyssey-Re-imagined/releases/latest)** — choose **Odyssey-Reimagined-Windows.zip** under Assets. GitHub’s **Code → Download ZIP** and **Source code (zip)** contain source files, not a playable game.

For the Windows game download, extract the entire ZIP and open **Odyssey.exe**. Keep the accompanying folders together. **Odyssey Studio.exe** opens the editor, and **Odyssey Server.exe** opens the hosting launcher.

The small EXEs checked into this source repository are workspace launchers, not standalone downloads. Use the Windows game download above to play. Developers can build a portable package from source or use the **Windows testing build** workflow under GitHub Actions.

## Build from source

On Windows, install Node.js 22 or newer, then run from the project folder:

```powershell
npm ci --prefix server
npm ci --prefix client
npm run build --prefix server
npm run build --prefix client
node tools/test-desktop-runtime.cjs
node tools/build-portable.cjs
```

See the [hosting guide](docs/DOWNLOAD-AND-HOST.md) for offline profiles, community servers, save locations and network requirements. GitHub hosts this project's source and build downloads; it does not host the running MMO server.

## Editor and development

- [Map Library and World Builder](docs/MAP-LIBRARY.md)
- [3D view](docs/3D-VIEW.md) and [surface repair controls](docs/SURFACE-REPAIR.md)
- [Documentation index and development notes](docs/README.md)

Rendering and legacy gameplay compatibility remain under development. When reporting a bug, include the map name/ID, steps to reproduce, whether 2D or 3D is active, and a screenshot where useful. Do not upload account databases, passwords or private save files.

Local accounts, saves and running-server state are excluded from new commits. See [third-party notices](THIRD-PARTY-NOTICES.md) for upstream credits.

## Project folders

- **client/** — game client and Studio.
- **server/** — server source, compiled runtime and local server data.
- **tools/** — build, import and verification tools.
- **docs/** — guides and development notes.
- **artifacts/** — generated review images, reports and source publishing output.
- **dist/** — downloadable builds.
- **archive/** — original Classic reference material.
- **maps/** and **sprites/** — editor exports.

Existing offline and community worlds keep their original save locations. New worlds use server/data inside their workspace. No saves are moved automatically.
