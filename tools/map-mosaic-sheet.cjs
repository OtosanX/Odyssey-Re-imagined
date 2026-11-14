'use strict';
// Render candidate maps' 2D mosaics into one contact sheet for visual identification.
const fs = require('fs');
const path = require('path');
const { png, readTiles } = require('./tile-art.cjs');
const world = require('../server/data/classic-world.json');
const read = readTiles();
const SC = 8;
const cands = [];
for (const m of Object.values(world.maps)) {
  if (!m.layers) continue;
  const c = m.layers[0].filter(t => t === 1137).length + (m.layers[1] || []).filter(t => t === 1137).length;
  if (c >= 12) cands.push({ id: m.id, name: m.name, map: m, count: c });
}
const list = cands.sort((a, b) => b.count - a.count).slice(0, 12);
console.log('row-major candidates:');
list.forEach((c, i) => console.log(i, 'map', c.id, JSON.stringify(c.name), 'plaza1137', c.count, c.map.width + 'x' + c.map.height));
const cols = 3, CW = 40 * SC + 2, CH = 30 * SC + 2, PAD = 6;
const W = cols * (CW + PAD) + PAD, H = Math.ceil(list.length / cols) * (CH + PAD) + PAD;
const px = Buffer.alloc(W * H * 4, 0);
const put = (x, y, r, g, b, a = 255) => {
  if (x < 0 || y < 0 || x >= W || y >= H || !a) return;
  const i = (y * W + x) * 4;
  if (!px[i + 3]) { px[i] = r; px[i + 1] = g; px[i + 2] = b; px[i + 3] = a; }
};
list.forEach((c, n) => {
  const ox = PAD + (n % cols) * (CW + PAD), oy = PAD + Math.floor(n / cols) * (CH + PAD);
  const m = c.map;
  for (let x = -1; x <= m.width; x++) for (let y = -1; y <= m.height; y++) put(ox + 1 + x * SC, oy + 1 + y * SC, 210, 60, 210);
  for (const l of [0, 1, 2, 4]) for (let i = 0; i < m.width * m.height; i++) {
    const id = m.layers[l][i];
    if (!id) continue;
    const art = read(id), x = i % m.width, y = Math.floor(i / m.width);
    for (let ty = 0; ty < 32; ty++) for (let tx = 0; tx < 32; tx++) {
      const a = art[(ty * 32 + tx) * 4 + 3];
      if (!a) continue;
      const dx = ox + 1 + x * SC + Math.floor(tx * SC / 32), dy = oy + 1 + y * SC + Math.floor(ty * SC / 32);
      put(dx, dy, art[(ty * 32 + tx) * 4], art[(ty * 32 + tx) * 4 + 1], art[(ty * 32 + tx) * 4 + 2], a);
    }
  }
});
const out = path.join(__dirname, '../artifacts/scenery/plaza-candidates.png');
fs.mkdirSync(path.dirname(out), { recursive: true });
fs.writeFileSync(out, png(W, H, px));
console.log('wrote', out);
