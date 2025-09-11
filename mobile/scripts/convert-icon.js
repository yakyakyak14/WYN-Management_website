#!/usr/bin/env node
const fs = require('fs');
const path = require('path');
const sharp = require('sharp');

async function main() {
  const src = process.argv[2];
  if (!src) {
    console.error('Usage: node scripts/convert-icon.js <source-image>');
    process.exit(1);
  }
  if (!fs.existsSync(src)) {
    console.error('Source image not found:', src);
    process.exit(1);
  }

  const out1 = path.resolve(__dirname, '..', 'resources', 'icon.png');
  const out2 = path.resolve(__dirname, '..', 'res', 'icon.png');

  for (const out of [out1, out2]) {
    fs.mkdirSync(path.dirname(out), { recursive: true });
  }

  try {
    const img = sharp(src, { failOn: 'none' });
    const metadata = await img.metadata();

    // Center crop to square then resize to 1024x1024
    const size = Math.min(metadata.width || 0, metadata.height || 0);
    if (!size || size <= 0) {
      throw new Error('Could not read image dimensions.');
    }

    const pipeline = img
      .resize({
        width: 1024,
        height: 1024,
        fit: 'cover',
        position: 'centre'
      })
      .png({
        compressionLevel: 9,
        adaptiveFiltering: true,
        palette: false,
        force: true
      });

    await pipeline.toFile(out1);
    await pipeline.toFile(out2);

    console.log('Icon generated at:', out1);
    console.log('Icon generated at:', out2);
  } catch (err) {
    console.error('Error generating icon:', err.message || err);
    process.exit(1);
  }
}

main().catch(err => {
  console.error(err);
  process.exit(1);
});
