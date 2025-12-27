# WinTux Dualboot Fullscreen GRUB Theme

<div align="center">

![Theme Preview](repo-pictures/preview.gif)

**Beautiful fullscreen GRUB theme for dual-boot**  
*One-command installation*

[![License](https://img.shields.io/badge/license-Custom-blue.svg)](LICENSE.txt)
[![GRUB](https://img.shields.io/badge/GRUB-2.0%2B-green.svg)](https://www.gnu.org/software/grub/)

</div>

---

## 🙏 Credits

**Original Creator:** [@AlexanderKh](https://github.com/AlexanderKh)  
🔗 Original Repository: https://github.com/AlexanderKh/wintux-dualboot-fullscreen-grub-theme  

**Artwork:** [@ABOhiccups](https://www.pling.com/u/abohiccups)  
🔗 Artwork Source: https://www.pling.com/p/1497147  

**This fork adds:**
- Universal installer
- Automated detection and patching
- Multi-resolution support
- Multi-distro compatibility improvements

---

## 🚀 Installation
```bash
sudo ./universal-installer.sh
```

The installer automatically detects:
- Distribution
- Boot mode
- Resolution
- GRUB path
- Optional patches

---

## 📋 Requirements

**Packages required:**
- `grub`
- `imagemagick`

**Supported distributions:**
- Ubuntu / Linux Mint / Debian
- Arch / Manjaro
- Fedora
- openSUSE

---

## ⚠️ Known Issues & Fixes

### 1️⃣ magick: command not found (ImageMagick 6 vs 7 issue)

Some modern distros (Ubuntu 24.04, Linux Mint 22, etc.) ship ImageMagick 6, which provides:
- `convert`
- `identify`
- `mogrify`

But the installer expects ImageMagick 7, which uses:
- `magick`

So ImageMagick is installed, just under the older command name.

#### ✅ Quick Fix (Recommended)

Create a compatibility symlink so `magick` runs `convert`:
```bash
sudo ln -s /usr/bin/convert /usr/local/bin/magick
```

Verify:
```bash
magick -version
```

Then rerun the installer or build script.

#### 🧰 Optional: Install real ImageMagick 7

If you actually want IM7 instead of compatibility mode:
```bash
sudo snap install imagemagick
```

Then ensure `magick` exists.

---

### 2️⃣ Build completes but shows ImageMagick errors

If `magick` was missing during install, the theme may install but assets may not build properly.

Rebuild clean:
```bash
cd wintux-dualboot-grub-theme
rm -rf build
./build.sh
sudo update-grub
```

---

### 3️⃣ cp: cannot stat './LICENSE.txt'

If you see:
```
cp: cannot stat './LICENSE.txt': No such file or directory
```

This is harmless.

Some packages don't include `LICENSE.txt` and the script attempts to copy it.

Theme installs fine.

---

### 4️⃣ Secure Boot

Secure Boot must be disabled for patched GRUB modules and themes to apply correctly.

---

## 📂 Theme Paths

- `/usr/share/grub/themes/win-tux-dualboot-fullscreen`
- `/etc/default/grub`
- `/etc/grub.d/`

---

## 🔄 Restore Original GRUB

If you want to revert:
```bash
sudo cp /etc/default/grub.wintux.bak /etc/default/grub
sudo update-grub
```

---

## 💻 Troubleshooting

### Force regenerate GRUB
```bash
sudo update-grub
```

### Theme not showing?

Check:
- UEFI boot mode
- Theme exists in `/usr/share/grub/themes`
- `GRUB_THEME` set correctly in `/etc/default/grub`

---

## License

See [LICENSE.txt](LICENSE.txt)
