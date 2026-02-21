const { ipcRenderer } = require('electron');
const fs = require('fs');
const path = require('path');
const os = require('os');

// Updated Directory: ~/Aura/
const AURA_DIR = path.join(os.homedir(), 'Aura');
const SCRIPTS_DIR = path.join(AURA_DIR, 'Scripts');
const AUTOEXEC_DIR = path.join(AURA_DIR, 'AutoExec');

// Ensure directories exist
[AURA_DIR, SCRIPTS_DIR, AUTOEXEC_DIR].forEach(dir => {
  if (!fs.existsSync(dir)) fs.mkdirSync(dir, { recursive: true });
});