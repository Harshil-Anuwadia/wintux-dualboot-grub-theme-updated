# 🎨 WinTux Dualboot Fullscreen GRUB Theme - Enhanced Edition# WinTux Dualboot Fullscreen GRUB Theme# WinTux Dualboot Fullscreen GRUB Theme



<div align="center">



![Theme Preview](repo-pictures/screenshot.png)> 🎨 A beautiful, minimalist fullscreen GRUB theme for Windows/Linux dual boot systems  



**A stunning fullscreen GRUB bootloader theme for dual-boot systems**  > **Enhanced with automated installation for effortless setup**

*Now with automated installation - just one command and you're done!*

> 🎨 A beautiful, minimalist fullscreen GRUB theme designed for Windows/Linux dual boot systemsBased on artwork by ABOhiccups (https://www.pling.com/p/1497147)

[![License](https://img.shields.io/badge/license-Custom-blue.svg)](LICENSE.txt)

[![GRUB](https://img.shields.io/badge/GRUB-2.0%2B-green.svg)](https://www.gnu.org/software/grub/)![Theme Preview](repo-pictures/screenshot.png)

[![Platform](https://img.shields.io/badge/platform-Linux-orange.svg)](https://www.linux.org/)



</div>

---

---

![Theme Preview](repo-pictures/screenshot.png)I really liked this artwork and wondered why it was not a theme, just a picture. It seems in GRUB there is no straightforward way to make selection menu look anything other than vertical list of rows.

## 🌟 Why This Version?

## 📢 About This Enhanced Version

This is an **enhanced fork** that makes installation **effortless**. Based on the excellent work by [AlexanderKh](https://github.com/AlexanderKh), I've added:



- ✨ **One-Command Installation** - No technical knowledge required

- 🤖 **Automatic Everything** - Detects system, installs dependencies, configures GRUBThis is an **improved version** of the original [WinTux Dualboot Fullscreen GRUB Theme](https://github.com/AlexanderKh/wintux-dualboot-fullscreen-grub-theme) created by **[AlexanderKh](https://github.com/AlexanderKh)**, featuring beautiful artwork by **[ABOhiccups](https://www.pling.com/p/1497147)**.

- 🎯 **Zero Manual Work** - From download to reboot in minutes

- 🐛 **Bug-Free** - All compatibility issues resolved## ✨ FeaturesPresented here is unique theme that uses entry "icons" stretched full-screen to make each entry look exactly how I want. I have not seen this kind of approach used anywhere before.

- 📖 **Beginner-Friendly** - Clear instructions for everyone

### 🙏 Credits to Original Creator

**Perfect for:** Users who want a beautiful GRUB theme without the hassle!



---

**Special thanks to [AlexanderKh](https://github.com/AlexanderKh)** for creating this amazing theme! The unique fullscreen approach using entry "icons" stretched to full-screen makes each boot entry look exactly as intended - something rarely seen in GRUB themes.

## 🙏 Credits & Acknowledgments

- 🖥️ **Fullscreen Design** - Immersive boot experience with custom backgroundsTools, EFI and Power icons are generated with neural networks.

### Original Creator

This theme was originally created by **[AlexanderKh](https://github.com/AlexanderKh)**  The original artwork by ABOhiccups inspired this theme, with AI-generated Tools, EFI, and Power icons completing the design.

→ [Original Repository](https://github.com/AlexanderKh/wintux-dualboot-fullscreen-grub-theme)

- 🐧🪟 **Dual Boot Ready** - Purpose-built for Windows/Linux systems

**A huge thank you** to AlexanderKh for the innovative approach of using fullscreen icons for boot entries - a brilliant design rarely seen in GRUB themes!

### 🎉 My Enhancements

### Artwork

Original beautiful artwork by **[ABOhiccups](https://www.pling.com/p/1497147)**  - 🎯 **Custom Icons** - Unique themed icons for each boot entry### Preview

AI-generated icons (Power, EFI, Tools) enhance the original design

I've **completely overhauled the installation experience** to make it accessible to everyone:

### My Contribution

I've enhanced the installation process to make this amazing theme accessible to everyone, regardless of technical skill level. No more manual configuration, dependency hunting, or troubleshooting!- 📐 **Any Resolution** - Build for any screen size with HiDPI support![Preview](./repo-pictures/preview.gif)



---#### ✨ What I Added:



## 🚀 Installation (Super Easy!)- 🚀 **Universal One-Command Installer** - Install with literally one command- 🔧 **Smart Installer** - Automated installation with system detection



### Method 1: Automatic Installation (Recommended) ⭐- 🔍 **Auto-Detection System** - Detects your Linux distro, screen resolution, and dependencies



**Just run this one command:**- 📦 **Auto-Dependency Installation** - No more manual package hunting- 💾 **Safe Backups** - All modifications backed up automatically### Choose resolution



```bash- 🎨 **Beautiful Installation UI** - Color-coded interface with emojis and progress indicators

sudo ./universal-installer.sh

```- 🐛 **Fixed All Bugs** - Resolved `bc`, `convert`, and `update-grub` compatibility issuesTo find resolution supported by your GRUB:



**That's it!** ✨ The script does everything:- 🌐 **Multi-Distro Support** - Works on Arch, Ubuntu, Debian, Fedora, openSUSE, and more



1. ✅ Detects your Linux distribution (Arch, Ubuntu, Fedora, etc.)- 📚 **Comprehensive Documentation** - Step-by-step guides, troubleshooting, and examples---* On the grub screen, press `c` to enter the command line

2. ✅ Installs required packages automatically

3. ✅ Detects your screen resolution- 💾 **Safe Backup System** - Automatic backups of all modified files

4. ✅ Builds the theme with perfect scaling

5. ✅ Backs up your current GRUB config- 🔧 **Improved Build Script** - Uses `awk` instead of `bc`, supports ImageMagick v7* Enter `vbeinfo` or `videoinfo`

6. ✅ Installs and configures the theme

7. ✅ Updates GRUB bootloader



**Time needed:** 2-3 minutes  #### 🎯 Goal:## 🚀 Quick Start

**Technical knowledge:** None!  

**Manual steps:** Zero!**Make this beautiful theme accessible to everyone**, regardless of technical expertise. No manual configuration, no hunting for dependencies, no debugging - just run one command and enjoy!



---### Installation



### Method 2: Manual Installation (For Advanced Users)---



If you prefer control over each step:### Universal One-Command Install (Recommended)I recommend to use supplied `install.sh` script.



#### Step 1: Build Theme for Your Resolution## ✨ Key Features



```bashAlthough if you want to do it manually make sure to set `GRUB_GFXMODE` to exactly match chosen theme resolution.

sudo ./build.sh [WIDTH]x[HEIGHT] [SCALING]

```- 🖥️ **Unique Fullscreen Design** - Entry icons stretched to full-screen for immersive experience



**Choose your scaling:**- 🐧🪟 **Dual Boot Ready** - Custom screens for both Windows and LinuxThe easiest way - fully automated with zero configuration:

- `1` = Full HD monitors (1920x1080, 1366x768)

- `1.5` = 2K/Retina displays (2560x1440, 2880x1800)- 🎯 **Custom Icons** - Themed graphics for every boot entry

- `2` = 4K monitors (3840x2160)

- 📐 **Any Resolution** - Build for any screen size with HiDPI scaling support### Build for your resolution

**Examples:**

```bash- 🔧 **Smart Automated Installer** - Zero manual configuration required

sudo ./build.sh 1920x1080 1        # Full HD

sudo ./build.sh 2560x1440 1.5      # 2K Monitor- 💾 **Safe Backups** - All system files automatically backed up```bashUse `build.sh` script. You need to have the following programs available:

sudo ./build.sh 2880x1800 1.5      # MacBook Retina

sudo ./build.sh 3840x2160 2        # 4K Display- 🌈 **Beautiful UI** - Modern, user-friendly installation interface

```

sudo ./universal-installer.sh* `grub-mkfont`

#### Step 2: Run Installer

---

```bash

cd "build/WinTux Dualboot Fullscreen [YOUR_RESOLUTION]-[SCALING]x"```* `convert` from ImageMagick v6

sudo ./install.sh

```## 🚀 Quick Start (Recommended)



The installer will guide you through:**What it does:**

- Setting GRUB resolution

- Choosing install location### One-Command Installation- ✅ Detects your Linux distribution

- Optional customizations

- GRUB configuration update- ✅ Installs all required dependencies



---The easiest way - **completely automated**:- ✅ Detects your screen resolution



## 📋 What You Need- ✅ Builds the theme with optimal scaling



### Required Software```bash- ✅ Installs and configures GRUB



The **automatic installer handles these for you**, but for reference:sudo ./universal-installer.sh- ✅ Creates backups of all modified files



| Package | What It Does | Auto-Installed? |```- ✅ Applies recommended patches

|---------|--------------|-----------------|

| `imagemagick` | Image processing | ✅ Yes |

| `grub` or `grub2` | Bootloader | Usually pre-installed |

| `awk` | Calculations | Built-in |That's it! The installer will:---

| `zip` | Compression | ✅ Yes (optional) |

- ✅ Detect your Linux distribution

### Supported Systems

- ✅ Install all required dependencies## 🛠️ Manual Installation

✅ **Arch Linux** (and derivatives: Manjaro, EndeavourOS)  

✅ **Ubuntu** (and derivatives: Pop!_OS, Linux Mint)  - ✅ Auto-detect your screen resolution

✅ **Debian** (and derivatives)  

✅ **Fedora** (and derivatives)  - ✅ Build the theme with optimal scaling### Step 1: Build the Theme

✅ **openSUSE** (Leap, Tumbleweed)  

- ✅ Install and configure GRUB

**More distributions work too!** The installer auto-detects your package manager.

- ✅ Create backups of all modified files```bash

---

- ✅ Apply recommended patchessudo ./build.sh <width>x<height> <scaling>

## 💡 Features That Make This Special

- ✅ Regenerate GRUB configuration```

### 🎨 Visual Design

- **Fullscreen Boot Entries** - Each option gets a beautiful full-screen background

- **Custom Icons** - Unique artwork for Linux, Windows, UEFI, Power options

- **Any Resolution** - Works on any screen size from laptop to 4K**No manual work required!** 🎉**Scaling Reference:**

- **HiDPI Support** - Crisp text on high-resolution displays

| DPI | Scaling | Common Resolutions | Example |

### 🛠️ Installation Excellence

- **Intelligent Detection** - Automatically finds your resolution and distribution---|-----|---------|-------------------|---------|

- **Safe Operations** - Backs up all files before making changes

- **Error Handling** - Clear messages if something needs attention| 96 DPI | `1` | 1920x1080, 1366x768 | Full HD |

- **Rollback Ready** - Easy restoration if you want to go back

## 🛠️ Manual Installation (Advanced)| 144 DPI | `1.5` | 2880x1800, 2560x1440 | MacBook Retina, 2K |

### 🎯 Boot Entry Support

| 192+ DPI | `2` | 3840x2160 | 4K UHD |

| Entry | Display | Notes |

|-------|---------|-------|If you prefer manual control:

| 🐧 Linux | Tux logo screen | Auto-detected |

| 🪟 Windows | Windows logo screen | Auto-detected |**Examples:**

| ⚙️ Advanced Options | Terminal-themed | Requires patch (optional) |

| 🔧 UEFI Firmware | EFI logo screen | Requires patch (optional) |### Step 1: Build the Theme```bash

| ⚡ Shutdown/Restart | Power icon | Auto-detected |

# Full HD (1080p)

---

```bashsudo ./build.sh 1920x1080 1

## ⚠️ Important: Secure Boot

sudo ./build.sh <width>x<height> <scaling>

**If you use Secure Boot**, custom fonts won't load (they're unsigned).

```# 2K Monitor

### Solution 1: Disable Secure Boot (Easiest)

1. Restart and enter BIOS (usually F2, F10, F12, or Del key)sudo ./build.sh 2560x1440 1.5

2. Find "Secure Boot" in Security settings

3. Set to "Disabled"**Scaling Reference:**

4. Save and exit

| DPI | Scaling | Common Resolutions | Example |# 4K Monitor

### Solution 2: Sign GRUB (Advanced)

For advanced users who need Secure Boot, see [this guide](https://bbs.archlinux.org/viewtopic.php?pid=2103579#p2103579).|-----|---------|-------------------|---------|sudo ./build.sh 3840x2160 2



---| 96 DPI | `1` | 1920x1080, 1366x768 | Full HD |



## 🔧 Troubleshooting| 144 DPI | `1.5` | 2880x1800, 2560x1440 | MacBook Retina, 2K |# MacBook Retina



### Theme not showing after installation?| 192+ DPI | `2` | 3840x2160 | 4K UHD |sudo ./build.sh 2880x1800 1.5



**Check your GRUB config:**```

```bash

cat /etc/default/grub | grep GRUB_THEME**Examples:**

```

```bash### Step 2: Install

**Should see:**

```# Full HD (1080p)

GRUB_THEME="/boot/grub/themes/win-tux-dualboot-fullscreen/theme.txt"

```sudo ./build.sh 1920x1080 1```bash



**Try updating GRUB again:**cd "build/WinTux Dualboot Fullscreen <resolution>-<scaling>x"

```bash

# On Arch/Manjaro:# 2K Monitorsudo ./install.sh

sudo grub-mkconfig -o /boot/grub/grub.cfg

sudo ./build.sh 2560x1440 1.5```

# On Ubuntu/Debian:

sudo update-grub



# On Fedora:# 4K MonitorThe installer will guide you through:

sudo grub2-mkconfig -o /boot/grub2/grub.cfg

```sudo ./build.sh 3840x2160 21. Setting GRUB resolution



### Fonts look weird or missing?2. Choosing install location



**Cause:** Secure Boot is blocking custom fonts  # MacBook Retina3. Optional: Disabling memtest

**Fix:** Disable Secure Boot in BIOS (see section above)

sudo ./build.sh 2880x1800 1.54. Optional: Patching boot entry scripts

### Wrong screen resolution?

```5. Regenerating GRUB configuration

**Re-run the automatic installer** - it will detect and rebuild:

```bash

sudo ./universal-installer.sh

```### Step 2: Install---



### Script errors during build?



All common issues are now **fixed** in this version:```bash## 📋 Requirements

- ✅ No more `bc: command not found`

- ✅ No more ImageMagick warningscd "build/WinTux Dualboot Fullscreen <resolution>-<scaling>x"

- ✅ Works on Arch Linux (grub-mkconfig)

- ✅ Handles missing zip gracefullysudo ./install.sh### Dependencies



---```



## 🗑️ How to Uninstall| Package | Purpose | Required |



Want to go back? Everything is backed up automatically!The installer provides a guided experience with:|---------|---------|----------|



```bash1. 📐 GRUB resolution configuration| `imagemagick` | Image processing | ✅ Yes |

# Restore original GRUB config

sudo cp /etc/default/grub.wintux.bak /etc/default/grub2. 📁 Installation location selection| `grub-mkfont` | Font generation | ✅ Yes |



# Restore GRUB scripts (if you patched them)3. ⚙️ Optional memtest disabling| `awk` | Math calculations | ✅ Yes (built-in) |

sudo cp /etc/grub.d/wintux-backup/* /etc/grub.d/ 2>/dev/null

4. 🔧 Optional boot entry script patches| `zip` | Create archives | ⭕ Optional |

# Update GRUB

sudo grub-mkconfig -o /boot/grub/grub.cfg    # Arch5. 🔄 Automatic GRUB configuration regeneration

# OR

sudo update-grub                              # Ubuntu/Debian### Install Dependencies



# (Optional) Remove theme files---

sudo rm -rf /boot/grub/themes/win-tux-dualboot-fullscreen

```**Arch Linux:**



---## 📋 Requirements```bash



## 📸 Previewsudo pacman -S imagemagick grub zip



![Preview Animation](./repo-pictures/preview.gif)### Dependencies```



*Experience a beautiful boot screen every time you start your computer!*



---| Package | Purpose | Required |**Ubuntu/Debian:**



## 🤝 Contributing & Support|---------|---------|----------|```bash



### Found a Bug?| `imagemagick` | Image processing | ✅ Yes |sudo apt install imagemagick grub2-common zip

Open an issue with:

- Your Linux distribution and version| `grub-mkfont` | Font generation | ✅ Yes |```

- Error messages (if any)

- What you were trying to do| `awk` | Math calculations | ✅ Yes (built-in) |



### Want to Improve This?| `zip` | Create archives | ⭕ Optional |**Fedora:**

Pull requests welcome! Areas to contribute:

- Support for more distributions```bash

- Additional theme variants

- Improved documentation### Auto-Install Dependenciessudo dnf install ImageMagick grub2-tools zip

- Bug fixes

```

### Like This Theme?

- ⭐ Star this repositoryThe universal installer handles this automatically, but if installing manually:

- 🔄 Share with friends who dual-boot

- 📸 Share screenshots of your setup!**openSUSE:**



---**Arch Linux:**```bash



## 📂 Project Structure```bashsudo zypper install ImageMagick grub2 zip



```sudo pacman -S imagemagick grub zip```

📦 wintux-dualboot-fullscreen-grub-theme/

│```

├── 🚀 universal-installer.sh          ← Run this!

├── 🔧 build.sh                         (Manual build script)---

│

├── 📁 src/                             (Source files)**Ubuntu/Debian:**

│   ├── image_templates/               (Boot entry graphics)

│   ├── fonts/                         (Cousine & Terminus fonts)```bash## ⚠️ Secure Boot Notice

│   ├── install.sh.tmpl                (Installer template)

│   └── theme.txt.tmpl                 (Theme config)sudo apt install imagemagick grub2-common zip

│

├── 📁 build/                           (Generated themes appear here)```**Important:** Custom fonts require Secure Boot to be disabled or GRUB to be signed with your keys.

├── 📁 repo-pictures/                   (Screenshots)

│

├── 📄 README.md                        (You are here!)

├── 📄 CHANGELOG.md                     (Version history)**Fedora:**### Option 1: Disable Secure Boot (Recommended)

├── 📄 LICENSE.txt                      (License)

└── 📄 THIRD_PARTY_ASSETS.txt           (Credits)```bash1. Reboot and enter BIOS/UEFI settings

```

sudo dnf install ImageMagick grub2-tools zip2. Navigate to Security settings

---

```3. Disable Secure Boot

## 📜 License

4. Save and exit

This enhanced version maintains the original license terms.  

See [LICENSE.txt](LICENSE.txt) for details.**openSUSE:**



**Fonts Used:**```bash### Option 2: Sign GRUB (Advanced)

- Cousine (Apache License 2.0)

- Terminus (SIL Open Font License 1.1)sudo zypper install ImageMagick grub2 zipRe-sign GRUB with your own keys. See [Arch Linux Wiki](https://bbs.archlinux.org/viewtopic.php?pid=2103579#p2103579) for details.



Full attribution in [THIRD_PARTY_ASSETS.txt](THIRD_PARTY_ASSETS.txt)```



------



## 🔗 Links---



- **This Enhanced Version:** [Your Fork URL]## 🎨 Customization

- **Original Theme by AlexanderKh:** [github.com/AlexanderKh/wintux-dualboot-fullscreen-grub-theme](https://github.com/AlexanderKh/wintux-dualboot-fullscreen-grub-theme)

- **Original Artwork:** [ABOhiccups on Pling](https://www.pling.com/p/1497147)## ⚠️ Secure Boot Notice



---### Supported Boot Entries



<div align="center">**Important:** Custom fonts require Secure Boot to be disabled or GRUB to be signed with your keys.



### 💙 Thank You!| Entry | Icon | Auto-Detected |



**To AlexanderKh** - for the brilliant original theme  ### Option 1: Disable Secure Boot (Recommended)|-------|------|---------------|

**To ABOhiccups** - for the beautiful artwork  

**To you** - for trying this theme!1. Reboot and enter BIOS/UEFI settings (usually F2, F10, F12, or Del)| Linux | Tux logo | ✅ Yes |



---2. Navigate to Security settings| Windows | Windows logo | ✅ Yes |



**Made with ❤️ to make GRUB themes accessible to everyone**3. Disable Secure Boot| Advanced Options | Tux with terminal | Requires patch |



*No manual configuration • No technical skills needed • Just works!*4. Save and exit| UEFI Firmware | EFI logo | Requires patch |



---| Shutdown/Restart | Power icon | ✅ Yes |



**Questions?** Open an issue | **Enjoying it?** Leave a star ⭐### Option 2: Sign GRUB (Advanced)



</div>Re-sign GRUB with your own keys. See [Arch Linux Wiki](https://bbs.archlinux.org/viewtopic.php?pid=2103579#p2103579) for details.### Optional Patches




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
