# WinTux Dualboot Fullscreen GRUB Theme

![Theme Preview](repo-pictures/preview.gif)

Every time you boot up, make the choice.

A fullscreen GRUB theme inspired by the Matrix - because choosing between Windows and Linux should look as cool as it feels. No more staring at that ugly default boot menu from 1995.

---

## Install

```bash
sudo ./universal-installer.sh
```

That's it. Script does everything - figures out your distro, installs what's needed, builds the theme, configures GRUB. Reboot and you're done.

Add `--auto` if you want zero prompts.

---

## Works On

Tested on basically everything with GRUB:

- Arch Linux
- Ubuntu / Debian / Mint
- Fedora / CentOS
- openSUSE
- Alpine
- Void Linux
- Gentoo
- Solus

If your distro has GRUB, it'll probably work. Let me know if it doesn't.

---

## What It Does

- Auto-detects your screen resolution and DPI
- Handles both ImageMagick 6 and 7 (no more version conflicts)
- Custom icons for Windows, Linux, and advanced options
- Scales properly on 1080p, 2K, and 4K displays
- Works with both UEFI and BIOS
- Zero manual config needed

---

## Custom Install Options

```bash
sudo ./universal-installer.sh --auto                    # full auto, no questions
sudo ./universal-installer.sh -r 2560x1440 -s 1.5       # force resolution/scaling
sudo ./universal-installer.sh --skip-deps               # skip dependency install
```

---

## Credits

**Original theme design:** [@AlexanderKh](https://github.com/AlexanderKh/wintux-dualboot-fullscreen-grub-theme)  
**Artwork:** [@ABOhiccups](https://www.pling.com/p/1497147)

**What I added:**
- Universal installer that actually works across distros
- Auto-detection for resolution, DPI, boot mode
- ImageMagick 6/7 compatibility fixes
- Support for 9+ different Linux distributions
- Various bug fixes and improvements

---

## Help Out

If this made your boot menu not suck:

- ⭐ Star the repo so others can find it
- 🐛 Report bugs in [Issues](../../issues)
- 🔀 Submit PRs for new distros or fixes

---

## License

See [LICENSE](LICENSE)

---

**Something broke?** Check [Issues](../../issues) or open a new one. I try to respond pretty quick.
