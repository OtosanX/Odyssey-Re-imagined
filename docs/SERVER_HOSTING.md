# Hosting and server accounts

The desktop flow is Odyssey login → Story or MMO. The opening Odyssey account is stored on this PC; it is not a central online identity service. Existing server accounts are unchanged. Use a server account on your first visit; saved server credentials are scoped to its address and port. The opening login password is never forwarded to a host.

Story contains offline play, local saves and hosting/joining friends. MMO contains the server browser and community hosting. Neither mode imports inventories from another server. Each host keeps its own accounts, character progress, inventories, equipment, economy and Story saves in its world folder.

In MMO, expand **Host your own MMO server**, enter a name, game port and a world folder name, optionally set a join password, then save and start. Blank password preserves an existing lock; select **Remove password lock** to make it open. Stop before changing settings. The join password is stored as a salted derivation, and the connection proves knowledge using a one-time challenge before account or gameplay requests are accepted.

Share the host's LAN address on your own network. For remote players, provide a reachable public address and forward the selected TCP game port through your router/firewall. CGNAT may require a reachable host or a VPN/tunnel. Do not expose the admin port. Keep the host running and back up its world folder. Changing the world folder selects a separate set of accounts and saves.

The list queries live player counts and lock status from saved addresses and `server-directory.json`. Hosts cannot claim Official status over the network: only entries marked official in that bundled directory receive the label. No official address is supplied yet. Add release-maintained entries as `{ "host": "your-host", "port": 5751, "name": "Your server", "official": true }` inside its `servers` array. Community servers can be open or password locked. Hosting does not publish an address to a worldwide directory automatically; players add the shared address themselves.

Older servers without status support show status unavailable but can still be joined. Password-locked browser servers require HTTPS (or localhost) for the browser's cryptography support. Desktop connections support the challenge directly. Standard account login still uses the existing game transport; a secure tunnel is appropriate on untrusted networks.

Hosting changes are saved in ignored `community-server.local.json`; the tracked `community-server.json` remains a password-free default. Returning to the menu keeps a community MMO running; Save & stop or closing its host window stops it. Offline Story closes its private server when returning to the launcher.
