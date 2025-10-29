# WinTux Dualboot Fullscreen GRUB Theme# WinTux Dualboot Fullscreen GRUB Theme## WinTux Dualboot Fullscreen GRUB Theme



> 🎨 A beautiful, minimalist fullscreen GRUB theme for Windows/Linux dual boot systems  

> **Enhanced with automated installation for effortless setup**

> 🎨 A beautiful, minimalist fullscreen GRUB theme designed for Windows/Linux dual boot systemsBased on artwork by ABOhiccups (https://www.pling.com/p/1497147)

![Theme Preview](repo-pictures/screenshot.png)



---

![Theme Preview](repo-pictures/screenshot.png)I really liked this artwork and wondered why it was not a theme, just a picture. It seems in GRUB there is no straightforward way to make selection menu look anything other than vertical list of rows.

## 📢 About This Enhanced Version



This is an **improved version** of the original [WinTux Dualboot Fullscreen GRUB Theme](https://github.com/AlexanderKh/wintux-dualboot-fullscreen-grub-theme) created by **[AlexanderKh](https://github.com/AlexanderKh)**, featuring beautiful artwork by **[ABOhiccups](https://www.pling.com/p/1497147)**.

## ✨ FeaturesPresented here is unique theme that uses entry "icons" stretched full-screen to make each entry look exactly how I want. I have not seen this kind of approach used anywhere before.

### 🙏 Credits to Original Creator



**Special thanks to [AlexanderKh](https://github.com/AlexanderKh)** for creating this amazing theme! The unique fullscreen approach using entry "icons" stretched to full-screen makes each boot entry look exactly as intended - something rarely seen in GRUB themes.

- 🖥️ **Fullscreen Design** - Immersive boot experience with custom backgroundsTools, EFI and Power icons are generated with neural networks.

The original artwork by ABOhiccups inspired this theme, with AI-generated Tools, EFI, and Power icons completing the design.

- 🐧🪟 **Dual Boot Ready** - Purpose-built for Windows/Linux systems

### 🎉 My Enhancements

- 🎯 **Custom Icons** - Unique themed icons for each boot entry### Preview

I've **completely overhauled the installation experience** to make it accessible to everyone:

- 📐 **Any Resolution** - Build for any screen size with HiDPI support![Preview](./repo-pictures/preview.gif)

#### ✨ What I Added:

- 🚀 **Universal One-Command Installer** - Install with literally one command- 🔧 **Smart Installer** - Automated installation with system detection

- 🔍 **Auto-Detection System** - Detects your Linux distro, screen resolution, and dependencies

- 📦 **Auto-Dependency Installation** - No more manual package hunting- 💾 **Safe Backups** - All modifications backed up automatically### Choose resolution

- 🎨 **Beautiful Installation UI** - Color-coded interface with emojis and progress indicators

- 🐛 **Fixed All Bugs** - Resolved `bc`, `convert`, and `update-grub` compatibility issuesTo find resolution supported by your GRUB:

- 🌐 **Multi-Distro Support** - Works on Arch, Ubuntu, Debian, Fedora, openSUSE, and more

- 📚 **Comprehensive Documentation** - Step-by-step guides, troubleshooting, and examples---* On the grub screen, press `c` to enter the command line

- 💾 **Safe Backup System** - Automatic backups of all modified files

- 🔧 **Improved Build Script** - Uses `awk` instead of `bc`, supports ImageMagick v7* Enter `vbeinfo` or `videoinfo`



#### 🎯 Goal:## 🚀 Quick Start

**Make this beautiful theme accessible to everyone**, regardless of technical expertise. No manual configuration, no hunting for dependencies, no debugging - just run one command and enjoy!

### Installation

---

### Universal One-Command Install (Recommended)I recommend to use supplied `install.sh` script.

## ✨ Key Features

Although if you want to do it manually make sure to set `GRUB_GFXMODE` to exactly match chosen theme resolution.

- 🖥️ **Unique Fullscreen Design** - Entry icons stretched to full-screen for immersive experience

- 🐧🪟 **Dual Boot Ready** - Custom screens for both Windows and LinuxThe easiest way - fully automated with zero configuration:

- 🎯 **Custom Icons** - Themed graphics for every boot entry

- 📐 **Any Resolution** - Build for any screen size with HiDPI scaling support### Build for your resolution

- 🔧 **Smart Automated Installer** - Zero manual configuration required

- 💾 **Safe Backups** - All system files automatically backed up```bashUse `build.sh` script. You need to have the following programs available:

- 🌈 **Beautiful UI** - Modern, user-friendly installation interface

sudo ./universal-installer.sh* `grub-mkfont`

---

```* `convert` from ImageMagick v6

## 🚀 Quick Start (Recommended)

**What it does:**

### One-Command Installation- ✅ Detects your Linux distribution

- ✅ Installs all required dependencies

The easiest way - **completely automated**:- ✅ Detects your screen resolution

- ✅ Builds the theme with optimal scaling

```bash- ✅ Installs and configures GRUB

sudo ./universal-installer.sh- ✅ Creates backups of all modified files

```- ✅ Applies recommended patches



That's it! The installer will:---

- ✅ Detect your Linux distribution

- ✅ Install all required dependencies## 🛠️ Manual Installation

- ✅ Auto-detect your screen resolution

- ✅ Build the theme with optimal scaling### Step 1: Build the Theme

- ✅ Install and configure GRUB

- ✅ Create backups of all modified files```bash

- ✅ Apply recommended patchessudo ./build.sh <width>x<height> <scaling>

- ✅ Regenerate GRUB configuration```



**No manual work required!** 🎉**Scaling Reference:**

| DPI | Scaling | Common Resolutions | Example |

---|-----|---------|-------------------|---------|

| 96 DPI | `1` | 1920x1080, 1366x768 | Full HD |

## 🛠️ Manual Installation (Advanced)| 144 DPI | `1.5` | 2880x1800, 2560x1440 | MacBook Retina, 2K |

| 192+ DPI | `2` | 3840x2160 | 4K UHD |

If you prefer manual control:

**Examples:**

### Step 1: Build the Theme```bash

# Full HD (1080p)

```bashsudo ./build.sh 1920x1080 1

sudo ./build.sh <width>x<height> <scaling>

```# 2K Monitor

sudo ./build.sh 2560x1440 1.5

**Scaling Reference:**

| DPI | Scaling | Common Resolutions | Example |# 4K Monitor

|-----|---------|-------------------|---------|sudo ./build.sh 3840x2160 2

| 96 DPI | `1` | 1920x1080, 1366x768 | Full HD |

| 144 DPI | `1.5` | 2880x1800, 2560x1440 | MacBook Retina, 2K |# MacBook Retina

| 192+ DPI | `2` | 3840x2160 | 4K UHD |sudo ./build.sh 2880x1800 1.5

```

**Examples:**

```bash### Step 2: Install

# Full HD (1080p)

sudo ./build.sh 1920x1080 1```bash

cd "build/WinTux Dualboot Fullscreen <resolution>-<scaling>x"

# 2K Monitorsudo ./install.sh

sudo ./build.sh 2560x1440 1.5```



# 4K MonitorThe installer will guide you through:

sudo ./build.sh 3840x2160 21. Setting GRUB resolution

2. Choosing install location

# MacBook Retina3. Optional: Disabling memtest

sudo ./build.sh 2880x1800 1.54. Optional: Patching boot entry scripts

```5. Regenerating GRUB configuration



### Step 2: Install---



```bash## 📋 Requirements

cd "build/WinTux Dualboot Fullscreen <resolution>-<scaling>x"

sudo ./install.sh### Dependencies

```

| Package | Purpose | Required |

The installer provides a guided experience with:|---------|---------|----------|

1. 📐 GRUB resolution configuration| `imagemagick` | Image processing | ✅ Yes |

2. 📁 Installation location selection| `grub-mkfont` | Font generation | ✅ Yes |

3. ⚙️ Optional memtest disabling| `awk` | Math calculations | ✅ Yes (built-in) |

4. 🔧 Optional boot entry script patches| `zip` | Create archives | ⭕ Optional |

5. 🔄 Automatic GRUB configuration regeneration

### Install Dependencies

---

**Arch Linux:**

## 📋 Requirements```bash

sudo pacman -S imagemagick grub zip

### Dependencies```



| Package | Purpose | Required |**Ubuntu/Debian:**

|---------|---------|----------|```bash

| `imagemagick` | Image processing | ✅ Yes |sudo apt install imagemagick grub2-common zip

| `grub-mkfont` | Font generation | ✅ Yes |```

| `awk` | Math calculations | ✅ Yes (built-in) |

| `zip` | Create archives | ⭕ Optional |**Fedora:**

```bash

### Auto-Install Dependenciessudo dnf install ImageMagick grub2-tools zip

```

The universal installer handles this automatically, but if installing manually:

**openSUSE:**

**Arch Linux:**```bash

```bashsudo zypper install ImageMagick grub2 zip

sudo pacman -S imagemagick grub zip```

```

---

**Ubuntu/Debian:**

```bash## ⚠️ Secure Boot Notice

sudo apt install imagemagick grub2-common zip

```**Important:** Custom fonts require Secure Boot to be disabled or GRUB to be signed with your keys.



**Fedora:**### Option 1: Disable Secure Boot (Recommended)

```bash1. Reboot and enter BIOS/UEFI settings

sudo dnf install ImageMagick grub2-tools zip2. Navigate to Security settings

```3. Disable Secure Boot

4. Save and exit

**openSUSE:**

```bash### Option 2: Sign GRUB (Advanced)

sudo zypper install ImageMagick grub2 zipRe-sign GRUB with your own keys. See [Arch Linux Wiki](https://bbs.archlinux.org/viewtopic.php?pid=2103579#p2103579) for details.

```

---

---

## 🎨 Customization

## ⚠️ Secure Boot Notice

### Supported Boot Entries

**Important:** Custom fonts require Secure Boot to be disabled or GRUB to be signed with your keys.

| Entry | Icon | Auto-Detected |

### Option 1: Disable Secure Boot (Recommended)|-------|------|---------------|

1. Reboot and enter BIOS/UEFI settings (usually F2, F10, F12, or Del)| Linux | Tux logo | ✅ Yes |

2. Navigate to Security settings| Windows | Windows logo | ✅ Yes |

3. Disable Secure Boot| Advanced Options | Tux with terminal | Requires patch |

4. Save and exit| UEFI Firmware | EFI logo | Requires patch |

| Shutdown/Restart | Power icon | ✅ Yes |

### Option 2: Sign GRUB (Advanced)

Re-sign GRUB with your own keys. See [Arch Linux Wiki](https://bbs.archlinux.org/viewtopic.php?pid=2103579#p2103579) for details.### Optional Patches



---The installer can patch GRUB scripts to enable themed screens for:

- **Advanced Options submenu** (`/etc/grub.d/10_linux`)

## 🎨 Customization- **UEFI Firmware Settings** (`/etc/grub.d/30_uefi-firmware`)



### Supported Boot EntriesAll patches create backups automatically.



| Entry | Icon | Auto-Detected |---

|-------|------|---------------|

| Linux | Tux logo | ✅ Yes |## 📁 Project Structure

| Windows | Windows logo | ✅ Yes |

| Advanced Options | Tux with terminal | Requires patch |```

| UEFI Firmware | EFI logo | Requires patch |wintux-dualboot-fullscreen-grub-theme/

| Shutdown/Restart | Power icon | ✅ Yes |├── 📄 universal-installer.sh      # One-command installer

├── 📄 build.sh                     # Theme builder

### Optional Patches├── 📄 build_common.sh              # Build utilities

├── 📂 src/                         # Source files

The installer can patch GRUB scripts to enable custom themed screens for:│   ├── 📂 image_templates/        # Boot entry graphics

- **Advanced Options submenu** (`/etc/grub.d/10_linux`)│   ├── 📂 fonts/                  # Font sources

- **UEFI Firmware Settings** (`/etc/grub.d/30_uefi-firmware`)│   ├── 📄 install.sh.tmpl         # Installer template

│   └── 📄 theme.txt.tmpl          # Theme config template

All patches create backups automatically before making any changes.├── 📂 build/                       # Generated themes (after build)

├── 📂 repo-pictures/               # Screenshots

---├── 📄 README.md                    # This file

├── 📄 LICENSE.txt                  # License

## 📁 Project Structure└── 📄 THIRD_PARTY_ASSETS.txt       # Attribution

```

```

wintux-dualboot-fullscreen-grub-theme/---

├── 📄 universal-installer.sh      # ⭐ One-command automated installer

├── 📄 build.sh                     # Theme builder script## 🔧 Troubleshooting

├── 📂 src/                         # Source files

│   ├── 📂 image_templates/        # Boot entry graphics### Theme doesn't appear

│   ├── 📂 fonts/                  # Font sources (Cousine, Terminus)

│   ├── 📄 install.sh.tmpl         # Enhanced installer template**Check GRUB configuration:**

│   └── 📄 theme.txt.tmpl          # Theme configuration template```bash

├── 📂 build/                       # Generated themes (created after build)cat /etc/default/grub | grep -E "GRUB_GFXMODE|GRUB_THEME"

├── 📂 repo-pictures/               # Screenshots and previews```

├── 📄 README.md                    # This file

├── 📄 CHANGELOG.md                 # Version historyShould show:

├── 📄 LICENSE.txt                  # License information```

└── 📄 THIRD_PARTY_ASSETS.txt       # Third-party attributionGRUB_GFXMODE="2880x1800"

```GRUB_THEME="/boot/grub/themes/win-tux-dualboot-fullscreen/theme.txt"

```

---

**Regenerate GRUB config:**

## 🔧 Troubleshooting```bash

# Arch Linux / Manjaro

### Theme doesn't appear after installationsudo grub-mkconfig -o /boot/grub/grub.cfg



**Check GRUB configuration:**# Ubuntu / Debian / Pop!_OS

```bashsudo update-grub

cat /etc/default/grub | grep -E "GRUB_GFXMODE|GRUB_THEME"

```# Fedora

sudo grub2-mkconfig -o /boot/grub2/grub.cfg

Should show something like:```

```

GRUB_GFXMODE="2880x1800"### Fonts look wrong

GRUB_THEME="/boot/grub/themes/win-tux-dualboot-fullscreen/theme.txt"

```- **Cause:** Secure Boot is blocking unsigned fonts

- **Solution:** Disable Secure Boot in BIOS

**Regenerate GRUB config:**

```bash### Wrong resolution

# Arch Linux / Manjaro

sudo grub-mkconfig -o /boot/grub/grub.cfg- Ensure `GRUB_GFXMODE` matches your theme resolution exactly

- Rebuild theme with correct resolution and scaling

# Ubuntu / Debian / Pop!_OS- Run `sudo universal-installer.sh` to auto-detect

sudo update-grub

### Build script errors

# Fedora

sudo grub2-mkconfig -o /boot/grub2/grub.cfg**`bc: command not found`**

```- ✅ Fixed in latest version (uses `awk` instead)



### Fonts look wrong or missing**`convert: command not found`**

- Install ImageMagick: `sudo pacman -S imagemagick`

- **Cause:** Secure Boot is blocking unsigned fonts

- **Solution:** Disable Secure Boot in BIOS/UEFI settings**`zip: command not found`**

- Install zip: `sudo pacman -S zip`

### Resolution doesn't match screen- Or ignore (only needed for distribution archives)



- Ensure `GRUB_GFXMODE` in `/etc/default/grub` matches your theme resolution exactly---

- Rebuild theme with correct resolution and scaling

- Run `sudo ./universal-installer.sh` to auto-detect resolution## 🗑️ Uninstallation



### Build script errors (Fixed in this version!)### Restore Original Configuration



All these issues have been resolved:```bash

# 1. Restore GRUB defaults

**✅ `bc: command not found`**sudo cp /etc/default/grub.wintux.bak /etc/default/grub

- Fixed! Now uses `awk` which is universally available

# 2. Restore GRUB scripts (if patched)

**✅ `convert: command not found` or deprecated warnings**sudo cp /etc/grub.d/wintux-backup/* /etc/grub.d/ 2>/dev/null

- Fixed! Now uses `magick` command (ImageMagick v7)

# 3. Regenerate GRUB configuration

**✅ `update-grub: command not found` on Arch**sudo grub-mkconfig -o /boot/grub/grub.cfg    # Arch/Manjaro

- Fixed! Now detects distribution and uses appropriate command# or

sudo update-grub                              # Ubuntu/Debian

**✅ `zip: command not found`**# or

- Now handled gracefully with informative messagesudo grub2-mkconfig -o /boot/grub2/grub.cfg  # Fedora



---# 4. (Optional) Remove theme files

sudo rm -rf /boot/grub/themes/win-tux-dualboot-fullscreen

## 🗑️ Uninstallation```



### Restore Original Configuration---



All backups are created automatically. To restore:## 📜 License & Credits



```bash### License

# 1. Restore GRUB defaultsThis project is released under the terms in [LICENSE.txt](LICENSE.txt)

sudo cp /etc/default/grub.wintux.bak /etc/default/grub

### Original Artwork

# 2. Restore GRUB scripts (if patched)Based on artwork by ABOhiccups - [View on Pling](https://www.pling.com/p/1497147)

sudo cp /etc/grub.d/wintux-backup/* /etc/grub.d/ 2>/dev/null

### Third-Party Assets

# 3. Regenerate GRUB configurationAll third-party assets and licenses are documented in [THIRD_PARTY_ASSETS.txt](THIRD_PARTY_ASSETS.txt)

sudo grub-mkconfig -o /boot/grub/grub.cfg    # Arch/Manjaro

# or### Fonts

sudo update-grub                              # Ubuntu/Debian- **Cousine** - Apache License 2.0 (Google Fonts)

# or- **Terminus** - SIL Open Font License 1.1

sudo grub2-mkconfig -o /boot/grub2/grub.cfg  # Fedora

### AI-Generated Assets

# 4. (Optional) Remove theme filesPower, EFI, and Tools icons were generated with neural networks.

sudo rm -rf /boot/grub/themes/win-tux-dualboot-fullscreen

```---



---## 🤝 Contributing



## 📜 License & CreditsContributions are welcome! Ways to contribute:



### Original Creator- 🐛 Report bugs via [Issues](https://github.com/AlexanderKh/wintux-dualboot-fullscreen-grub-theme/issues)

**[AlexanderKh](https://github.com/AlexanderKh)** - Original theme concept and implementation  - 💡 Suggest features

[Original Repository](https://github.com/AlexanderKh/wintux-dualboot-fullscreen-grub-theme)- 🔧 Submit pull requests

- 📸 Share screenshots of your setup

### Original Artwork- ⭐ Star the repository

**[ABOhiccups](https://www.pling.com/p/1497147)** - Beautiful background artwork that inspired this theme

---

### This Enhanced Version

**Improvements by:** Your username here  ## 🔗 Links

- Automated installation system

- Multi-distribution support- **Repository:** [github.com/AlexanderKh/wintux-dualboot-fullscreen-grub-theme](https://github.com/AlexanderKh/wintux-dualboot-fullscreen-grub-theme)

- Bug fixes and compatibility improvements- **Issues:** [Report a bug](https://github.com/AlexanderKh/wintux-dualboot-fullscreen-grub-theme/issues)

- Enhanced documentation and user experience- **Original Artwork:** [ABOhiccups on Pling](https://www.pling.com/p/1497147)



### License---

This project is released under the terms in [LICENSE.txt](LICENSE.txt)

<div align="center">

### Third-Party Assets

All third-party assets and licenses are documented in [THIRD_PARTY_ASSETS.txt](THIRD_PARTY_ASSETS.txt)**Made with ❤️ for the Linux community**



### Fonts*Enjoy your beautiful new GRUB theme!* 🎨

- **Cousine** - Apache License 2.0 (Google Fonts)

- **Terminus** - SIL Open Font License 1.1[![License](https://img.shields.io/badge/license-Custom-blue.svg)](LICENSE.txt)

[![GRUB](https://img.shields.io/badge/GRUB-2.0%2B-green.svg)](https://www.gnu.org/software/grub/)

### AI-Generated Assets[![Maintenance](https://img.shields.io/badge/Maintained%3F-yes-green.svg)](https://github.com/AlexanderKh/wintux-dualboot-fullscreen-grub-theme/graphs/commit-activity)

Power, EFI, and Tools icons were generated with neural networks (original theme).

</div>

---

## 🤝 Contributing

Contributions are welcome! Ways to contribute:

- 🐛 Report bugs via Issues
- 💡 Suggest new features
- 🔧 Submit pull requests
- 📸 Share screenshots of your setup
- ⭐ Star the repository if you find it useful
- 📢 Share with others who might benefit

---

## 🔗 Links

- **This Enhanced Version:** Your repository link here
- **Original Theme:** [AlexanderKh/wintux-dualboot-fullscreen-grub-theme](https://github.com/AlexanderKh/wintux-dualboot-fullscreen-grub-theme)
- **Original Artwork:** [ABOhiccups on Pling](https://www.pling.com/p/1497147)

---

<div align="center">

**Enhanced with ❤️ for the Linux community**

*Thanks to AlexanderKh for the amazing original theme!*

*Making GRUB themes accessible to everyone* 🎨

[![License](https://img.shields.io/badge/license-Custom-blue.svg)](LICENSE.txt)
[![GRUB](https://img.shields.io/badge/GRUB-2.0%2B-green.svg)](https://www.gnu.org/software/grub/)
[![Maintenance](https://img.shields.io/badge/Maintained%3F-yes-green.svg)](https://github.com/AlexanderKh/wintux-dualboot-fullscreen-grub-theme/graphs/commit-activity)

**Original Theme:** [AlexanderKh/wintux-dualboot-fullscreen-grub-theme](https://github.com/AlexanderKh/wintux-dualboot-fullscreen-grub-theme)

</div>
