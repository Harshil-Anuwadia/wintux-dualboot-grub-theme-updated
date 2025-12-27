# WinTux Dualboot Fullscreen GRUB Theme

![Theme Preview](repo-pictures/preview.gif)

A clean, fullscreen GRUB theme for dual-boot systems. No more ugly boot menus.

---

## 🚀 Quick Install

```bash
sudo ./universal-installer.sh
```

That's it. The script handles everything—detects your distro, installs dependencies, builds the theme, and configures GRUB.

**Want auto-mode?** Add `--auto` flag for zero interaction.

---

## ✅ Supported Distros

Works on pretty much everything:

- **Arch Linux** (pacman)
- **Ubuntu / Debian / Mint** (apt)
- **Fedora / CentOS** (dnf/yum)
- **openSUSE** (zypper)
- **Alpine** (apk)
- **Void Linux** (xbps)
- **Gentoo** (emerge)
- **Solus** (eopkg)

If it has GRUB, it'll probably work.

---

## 🎨 Features

- Auto-detects your screen resolution and DPI
- Handles ImageMagick 6 & 7 automatically (no more "magick not found" errors)
- Custom icons for Windows, Linux, and advanced boot options
- UEFI and BIOS support
- Multiple scaling options (1080p, 2K, 4K)

---

## 🛠️ Manual Options

```bash
sudo ./universal-installer.sh --auto                    # Full auto
sudo ./universal-installer.sh -r 2560x1440 -s 1.5       # Custom resolution/scaling
sudo ./universal-installer.sh --skip-deps               # Skip dependency check
```

---

## 🙏 Credits

**Original creator:** [@AlexanderKh](https://github.com/AlexanderKh/wintux-dualboot-fullscreen-grub-theme)  
**Artwork:** [@ABOhiccups](https://www.pling.com/p/1497147)

This fork adds universal distro support, auto-detection, and fixes various build issues.

---

## 📝 License

See [LICENSE](LICENSE)
