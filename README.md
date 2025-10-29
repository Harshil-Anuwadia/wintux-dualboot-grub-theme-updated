# WinTux Dualboot Fullscreen GRUB Theme## WinTux Dualboot Fullscreen GRUB Theme



> 🎨 A beautiful, minimalist fullscreen GRUB theme designed for Windows/Linux dual boot systemsBased on artwork by ABOhiccups (https://www.pling.com/p/1497147)



![Theme Preview](repo-pictures/screenshot.png)I really liked this artwork and wondered why it was not a theme, just a picture. It seems in GRUB there is no straightforward way to make selection menu look anything other than vertical list of rows.



## ✨ FeaturesPresented here is unique theme that uses entry "icons" stretched full-screen to make each entry look exactly how I want. I have not seen this kind of approach used anywhere before.



- 🖥️ **Fullscreen Design** - Immersive boot experience with custom backgroundsTools, EFI and Power icons are generated with neural networks.

- 🐧🪟 **Dual Boot Ready** - Purpose-built for Windows/Linux systems

- 🎯 **Custom Icons** - Unique themed icons for each boot entry### Preview

- 📐 **Any Resolution** - Build for any screen size with HiDPI support![Preview](./repo-pictures/preview.gif)

- 🔧 **Smart Installer** - Automated installation with system detection

- 💾 **Safe Backups** - All modifications backed up automatically### Choose resolution

To find resolution supported by your GRUB:

---* On the grub screen, press `c` to enter the command line

* Enter `vbeinfo` or `videoinfo`

## 🚀 Quick Start

### Installation

### Universal One-Command Install (Recommended)I recommend to use supplied `install.sh` script.

Although if you want to do it manually make sure to set `GRUB_GFXMODE` to exactly match chosen theme resolution.

The easiest way - fully automated with zero configuration:

### Build for your resolution

```bashUse `build.sh` script. You need to have the following programs available:

sudo ./universal-installer.sh* `grub-mkfont`

```* `convert` from ImageMagick v6

**What it does:**
- ✅ Detects your Linux distribution
- ✅ Installs all required dependencies
- ✅ Detects your screen resolution
- ✅ Builds the theme with optimal scaling
- ✅ Installs and configures GRUB
- ✅ Creates backups of all modified files
- ✅ Applies recommended patches

---

## 🛠️ Manual Installation

### Step 1: Build the Theme

```bash
sudo ./build.sh <width>x<height> <scaling>
```

**Scaling Reference:**
| DPI | Scaling | Common Resolutions | Example |
|-----|---------|-------------------|---------|
| 96 DPI | `1` | 1920x1080, 1366x768 | Full HD |
| 144 DPI | `1.5` | 2880x1800, 2560x1440 | MacBook Retina, 2K |
| 192+ DPI | `2` | 3840x2160 | 4K UHD |

**Examples:**
```bash
# Full HD (1080p)
sudo ./build.sh 1920x1080 1

# 2K Monitor
sudo ./build.sh 2560x1440 1.5

# 4K Monitor
sudo ./build.sh 3840x2160 2

# MacBook Retina
sudo ./build.sh 2880x1800 1.5
```

### Step 2: Install

```bash
cd "build/WinTux Dualboot Fullscreen <resolution>-<scaling>x"
sudo ./install.sh
```

The installer will guide you through:
1. Setting GRUB resolution
2. Choosing install location
3. Optional: Disabling memtest
4. Optional: Patching boot entry scripts
5. Regenerating GRUB configuration

---

## 📋 Requirements

### Dependencies

| Package | Purpose | Required |
|---------|---------|----------|
| `imagemagick` | Image processing | ✅ Yes |
| `grub-mkfont` | Font generation | ✅ Yes |
| `awk` | Math calculations | ✅ Yes (built-in) |
| `zip` | Create archives | ⭕ Optional |

### Install Dependencies

**Arch Linux:**
```bash
sudo pacman -S imagemagick grub zip
```

**Ubuntu/Debian:**
```bash
sudo apt install imagemagick grub2-common zip
```

**Fedora:**
```bash
sudo dnf install ImageMagick grub2-tools zip
```

**openSUSE:**
```bash
sudo zypper install ImageMagick grub2 zip
```

---

## ⚠️ Secure Boot Notice

**Important:** Custom fonts require Secure Boot to be disabled or GRUB to be signed with your keys.

### Option 1: Disable Secure Boot (Recommended)
1. Reboot and enter BIOS/UEFI settings
2. Navigate to Security settings
3. Disable Secure Boot
4. Save and exit

### Option 2: Sign GRUB (Advanced)
Re-sign GRUB with your own keys. See [Arch Linux Wiki](https://bbs.archlinux.org/viewtopic.php?pid=2103579#p2103579) for details.

---

## 🎨 Customization

### Supported Boot Entries

| Entry | Icon | Auto-Detected |
|-------|------|---------------|
| Linux | Tux logo | ✅ Yes |
| Windows | Windows logo | ✅ Yes |
| Advanced Options | Tux with terminal | Requires patch |
| UEFI Firmware | EFI logo | Requires patch |
| Shutdown/Restart | Power icon | ✅ Yes |

### Optional Patches

The installer can patch GRUB scripts to enable themed screens for:
- **Advanced Options submenu** (`/etc/grub.d/10_linux`)
- **UEFI Firmware Settings** (`/etc/grub.d/30_uefi-firmware`)

All patches create backups automatically.

---

## 📁 Project Structure

```
wintux-dualboot-fullscreen-grub-theme/
├── 📄 universal-installer.sh      # One-command installer
├── 📄 build.sh                     # Theme builder
├── 📄 build_common.sh              # Build utilities
├── 📂 src/                         # Source files
│   ├── 📂 image_templates/        # Boot entry graphics
│   ├── 📂 fonts/                  # Font sources
│   ├── 📄 install.sh.tmpl         # Installer template
│   └── 📄 theme.txt.tmpl          # Theme config template
├── 📂 build/                       # Generated themes (after build)
├── 📂 repo-pictures/               # Screenshots
├── 📄 README.md                    # This file
├── 📄 LICENSE.txt                  # License
└── 📄 THIRD_PARTY_ASSETS.txt       # Attribution
```

---

## 🔧 Troubleshooting

### Theme doesn't appear

**Check GRUB configuration:**
```bash
cat /etc/default/grub | grep -E "GRUB_GFXMODE|GRUB_THEME"
```

Should show:
```
GRUB_GFXMODE="2880x1800"
GRUB_THEME="/boot/grub/themes/win-tux-dualboot-fullscreen/theme.txt"
```

**Regenerate GRUB config:**
```bash
# Arch Linux / Manjaro
sudo grub-mkconfig -o /boot/grub/grub.cfg

# Ubuntu / Debian / Pop!_OS
sudo update-grub

# Fedora
sudo grub2-mkconfig -o /boot/grub2/grub.cfg
```

### Fonts look wrong

- **Cause:** Secure Boot is blocking unsigned fonts
- **Solution:** Disable Secure Boot in BIOS

### Wrong resolution

- Ensure `GRUB_GFXMODE` matches your theme resolution exactly
- Rebuild theme with correct resolution and scaling
- Run `sudo universal-installer.sh` to auto-detect

### Build script errors

**`bc: command not found`**
- ✅ Fixed in latest version (uses `awk` instead)

**`convert: command not found`**
- Install ImageMagick: `sudo pacman -S imagemagick`

**`zip: command not found`**
- Install zip: `sudo pacman -S zip`
- Or ignore (only needed for distribution archives)

---

## 🗑️ Uninstallation

### Restore Original Configuration

```bash
# 1. Restore GRUB defaults
sudo cp /etc/default/grub.wintux.bak /etc/default/grub

# 2. Restore GRUB scripts (if patched)
sudo cp /etc/grub.d/wintux-backup/* /etc/grub.d/ 2>/dev/null

# 3. Regenerate GRUB configuration
sudo grub-mkconfig -o /boot/grub/grub.cfg    # Arch/Manjaro
# or
sudo update-grub                              # Ubuntu/Debian
# or
sudo grub2-mkconfig -o /boot/grub2/grub.cfg  # Fedora

# 4. (Optional) Remove theme files
sudo rm -rf /boot/grub/themes/win-tux-dualboot-fullscreen
```

---

## 📜 License & Credits

### License
This project is released under the terms in [LICENSE.txt](LICENSE.txt)

### Original Artwork
Based on artwork by ABOhiccups - [View on Pling](https://www.pling.com/p/1497147)

### Third-Party Assets
All third-party assets and licenses are documented in [THIRD_PARTY_ASSETS.txt](THIRD_PARTY_ASSETS.txt)

### Fonts
- **Cousine** - Apache License 2.0 (Google Fonts)
- **Terminus** - SIL Open Font License 1.1

### AI-Generated Assets
Power, EFI, and Tools icons were generated with neural networks.

---

## 🤝 Contributing

Contributions are welcome! Ways to contribute:

- 🐛 Report bugs via [Issues](https://github.com/AlexanderKh/wintux-dualboot-fullscreen-grub-theme/issues)
- 💡 Suggest features
- 🔧 Submit pull requests
- 📸 Share screenshots of your setup
- ⭐ Star the repository

---

## 🔗 Links

- **Repository:** [github.com/AlexanderKh/wintux-dualboot-fullscreen-grub-theme](https://github.com/AlexanderKh/wintux-dualboot-fullscreen-grub-theme)
- **Issues:** [Report a bug](https://github.com/AlexanderKh/wintux-dualboot-fullscreen-grub-theme/issues)
- **Original Artwork:** [ABOhiccups on Pling](https://www.pling.com/p/1497147)

---

<div align="center">

**Made with ❤️ for the Linux community**

*Enjoy your beautiful new GRUB theme!* 🎨

[![License](https://img.shields.io/badge/license-Custom-blue.svg)](LICENSE.txt)
[![GRUB](https://img.shields.io/badge/GRUB-2.0%2B-green.svg)](https://www.gnu.org/software/grub/)
[![Maintenance](https://img.shields.io/badge/Maintained%3F-yes-green.svg)](https://github.com/AlexanderKh/wintux-dualboot-fullscreen-grub-theme/graphs/commit-activity)

</div>
