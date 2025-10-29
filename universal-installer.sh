#!/usr/bin/env bash

#═══════════════════════════════════════════════════════════════════════════════
#  WinTux Dualboot Fullscreen GRUB Theme - Universal Installer
#  Automated setup, build, and installation script
#  Supports: Arch, Debian, Ubuntu, Fedora, openSUSE, and more
#═══════════════════════════════════════════════════════════════════════════════

set -e

# Colors and styling
readonly RED='\033[0;31m'
readonly GREEN='\033[0;32m'
readonly YELLOW='\033[1;33m'
readonly BLUE='\033[0;34m'
readonly MAGENTA='\033[0;35m'
readonly CYAN='\033[0;36m'
readonly WHITE='\033[1;37m'
readonly BOLD='\033[1m'
readonly DIM='\033[2m'
readonly NC='\033[0m'

# Script configuration
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
BUILD_DIR="$SCRIPT_DIR/build"
LOG_FILE="/tmp/wintux-installer-$(date +%Y%m%d-%H%M%S).log"

# Default values
AUTO_MODE=false
SKIP_DEPS=false
DETECTED_RESOLUTION=""
DETECTED_SCALING="1"

#═══════════════════════════════════════════════════════════════════════════════
# Utility Functions
#═══════════════════════════════════════════════════════════════════════════════

print_banner() {
    clear
    echo -e "${BOLD}${CYAN}"
    cat << "EOF"
╔════════════════════════════════════════════════════════════════════════════╗
║                                                                            ║
║                    WinTux Dualboot Fullscreen GRUB Theme                   ║
║                         Universal Installer v2.0                           ║
║                                                                            ║
║                  Automated Setup • Build • Installation                    ║
║                                                                            ║
╚════════════════════════════════════════════════════════════════════════════╝
EOF
    echo -e "${NC}"
}

log() {
    echo -e "$@" | tee -a "$LOG_FILE"
}

log_info() {
    log "${CYAN}[INFO]${NC} $*"
}

log_success() {
    log "${GREEN}[✓]${NC} $*"
}

log_warning() {
    log "${YELLOW}[⚠]${NC} $*"
}

log_error() {
    log "${RED}[✗]${NC} $*"
}

log_step() {
    log "\n${BOLD}${MAGENTA}▶ $*${NC}"
    log "${BLUE}$(printf '━%.0s' {1..78})${NC}"
}

prompt_yes_no() {
    local prompt="$1"
    local default="${2:-n}"
    local response
    
    if [[ "$AUTO_MODE" == "true" ]]; then
        [[ "$default" == "y" ]] && return 0 || return 1
    fi
    
    while true; do
        if [[ "$default" == "y" ]]; then
            read -p "$(echo -e "${CYAN}$prompt [Y/n]:${NC} ")" response
            response=${response:-y}
        else
            read -p "$(echo -e "${CYAN}$prompt [y/N]:${NC} ")" response
            response=${response:-n}
        fi
        
        case "$response" in
            [Yy]* ) return 0 ;;
            [Nn]* ) return 1 ;;
            * ) echo -e "${RED}Please answer yes or no.${NC}" ;;
        esac
    done
}

prompt_choice() {
    local prompt="$1"
    shift
    local options=("$@")
    
    if [[ "$AUTO_MODE" == "true" ]]; then
        echo "1"
        return
    fi
    
    echo -e "\n${BOLD}${prompt}${NC}"
    for i in "${!options[@]}"; do
        echo -e "  ${CYAN}$((i+1)))${NC} ${options[$i]}"
    done
    
    while true; do
        read -p "$(echo -e "${CYAN}Enter your choice [1-${#options[@]}]:${NC} ")" choice
        if [[ "$choice" =~ ^[0-9]+$ ]] && [ "$choice" -ge 1 ] && [ "$choice" -le "${#options[@]}" ]; then
            echo "$choice"
            return
        fi
        echo -e "${RED}Invalid choice. Please try again.${NC}"
    done
}

check_root() {
    if [[ $EUID -ne 0 ]]; then
        log_error "This script must be run as root or with sudo"
        echo -e "${YELLOW}Please run: ${CYAN}sudo $0${NC}"
        exit 1
    fi
}

#═══════════════════════════════════════════════════════════════════════════════
# System Detection
#═══════════════════════════════════════════════════════════════════════════════

detect_distribution() {
    log_step "Detecting Linux Distribution"
    
    if [[ -f /etc/os-release ]]; then
        . /etc/os-release
        DISTRO_ID="$ID"
        DISTRO_NAME="$NAME"
        DISTRO_VERSION="$VERSION_ID"
        
        log_success "Detected: ${BOLD}$DISTRO_NAME${NC}"
        log_info "Distribution ID: $DISTRO_ID"
        log_info "Version: ${DISTRO_VERSION:-N/A}"
    else
        log_error "Cannot detect distribution. /etc/os-release not found"
        exit 1
    fi
}

detect_package_manager() {
    log_step "Detecting Package Manager"
    
    if command -v pacman &>/dev/null; then
        PKG_MANAGER="pacman"
        PKG_INSTALL="pacman -S --noconfirm"
        PKG_UPDATE="pacman -Sy"
        log_success "Package Manager: ${BOLD}pacman${NC} (Arch-based)"
    elif command -v apt-get &>/dev/null; then
        PKG_MANAGER="apt"
        PKG_INSTALL="apt-get install -y"
        PKG_UPDATE="apt-get update"
        log_success "Package Manager: ${BOLD}apt${NC} (Debian/Ubuntu-based)"
    elif command -v dnf &>/dev/null; then
        PKG_MANAGER="dnf"
        PKG_INSTALL="dnf install -y"
        PKG_UPDATE="dnf check-update"
        log_success "Package Manager: ${BOLD}dnf${NC} (Fedora-based)"
    elif command -v yum &>/dev/null; then
        PKG_MANAGER="yum"
        PKG_INSTALL="yum install -y"
        PKG_UPDATE="yum check-update"
        log_success "Package Manager: ${BOLD}yum${NC} (RHEL-based)"
    elif command -v zypper &>/dev/null; then
        PKG_MANAGER="zypper"
        PKG_INSTALL="zypper install -y"
        PKG_UPDATE="zypper refresh"
        log_success "Package Manager: ${BOLD}zypper${NC} (openSUSE-based)"
    else
        log_error "No supported package manager found"
        exit 1
    fi
}

detect_display_resolution() {
    log_step "Detecting Display Resolution"
    
    local resolution=""
    
    # Try xrandr first (X11)
    if command -v xrandr &>/dev/null && [[ -n "$DISPLAY" ]]; then
        resolution=$(xrandr 2>/dev/null | grep '\*' | awk '{print $1}' | head -1)
        if [[ -n "$resolution" ]]; then
            log_success "Detected resolution via xrandr: ${BOLD}$resolution${NC}"
            DETECTED_RESOLUTION="$resolution"
            return
        fi
    fi
    
    # Try wayland methods
    if command -v wlr-randr &>/dev/null; then
        resolution=$(wlr-randr 2>/dev/null | grep -oP '\d+x\d+' | head -1)
        if [[ -n "$resolution" ]]; then
            log_success "Detected resolution via wlr-randr: ${BOLD}$resolution${NC}"
            DETECTED_RESOLUTION="$resolution"
            return
        fi
    fi
    
    # Try reading from framebuffer
    if [[ -e /sys/class/graphics/fb0/virtual_size ]]; then
        local fb_size=$(cat /sys/class/graphics/fb0/virtual_size)
        resolution=$(echo "$fb_size" | sed 's/,/x/')
        if [[ -n "$resolution" ]]; then
            log_success "Detected resolution via framebuffer: ${BOLD}$resolution${NC}"
            DETECTED_RESOLUTION="$resolution"
            return
        fi
    fi
    
    # Common resolutions fallback
    log_warning "Could not auto-detect resolution"
    DETECTED_RESOLUTION=""
}

detect_display_scaling() {
    log_step "Detecting Display Scaling Factor"
    
    local dpi=""
    
    # Try to get DPI
    if command -v xdpyinfo &>/dev/null && [[ -n "$DISPLAY" ]]; then
        dpi=$(xdpyinfo 2>/dev/null | grep -oP 'resolution:\s+\K\d+' | head -1)
    fi
    
    if [[ -n "$dpi" ]]; then
        log_info "Detected DPI: $dpi"
        
        if (( dpi >= 192 )); then
            DETECTED_SCALING="2"
            log_success "Recommended scaling: ${BOLD}2x${NC} (HiDPI)"
        elif (( dpi >= 144 )); then
            DETECTED_SCALING="1.5"
            log_success "Recommended scaling: ${BOLD}1.5x${NC} (2K)"
        elif (( dpi >= 120 )); then
            DETECTED_SCALING="1.25"
            log_success "Recommended scaling: ${BOLD}1.25x${NC}"
        else
            DETECTED_SCALING="1"
            log_success "Recommended scaling: ${BOLD}1x${NC} (Standard)"
        fi
    else
        log_warning "Could not detect DPI, using default scaling"
        DETECTED_SCALING="1"
    fi
}

detect_boot_mode() {
    log_step "Detecting Boot Mode"
    
    if [[ -d /sys/firmware/efi ]]; then
        BOOT_MODE="UEFI"
        log_success "Boot Mode: ${BOLD}UEFI${NC}"
        
        # Check secure boot status
        if command -v mokutil &>/dev/null; then
            if mokutil --sb-state 2>/dev/null | grep -q "SecureBoot enabled"; then
                SECURE_BOOT="enabled"
                log_warning "Secure Boot is ${BOLD}ENABLED${NC}"
            else
                SECURE_BOOT="disabled"
                log_success "Secure Boot is ${BOLD}DISABLED${NC}"
            fi
        elif [[ -f /sys/firmware/efi/efivars/SecureBoot-* ]]; then
            SECURE_BOOT="unknown"
            log_warning "Secure Boot status: ${BOLD}UNKNOWN${NC}"
        fi
    else
        BOOT_MODE="BIOS"
        SECURE_BOOT="N/A"
        log_success "Boot Mode: ${BOLD}BIOS/Legacy${NC}"
    fi
}

#═══════════════════════════════════════════════════════════════════════════════
# Dependency Management
#═══════════════════════════════════════════════════════════════════════════════

check_dependencies() {
    log_step "Checking Dependencies"
    
    local deps_missing=()
    local deps_needed=()
    
    # Core dependencies
    local core_deps=("grub-mkfont" "envsubst" "awk" "sed")
    
    # Check ImageMagick (magick or convert)
    if ! command -v magick &>/dev/null && ! command -v convert &>/dev/null; then
        deps_missing+=("ImageMagick")
    fi
    
    # Check grub-mkfont
    if ! command -v grub-mkfont &>/dev/null; then
        deps_missing+=("grub")
    fi
    
    # Check envsubst (part of gettext)
    if ! command -v envsubst &>/dev/null; then
        deps_missing+=("gettext")
    fi
    
    # Optional but recommended
    if ! command -v zip &>/dev/null; then
        deps_needed+=("zip")
    fi
    
    if [[ ${#deps_missing[@]} -eq 0 ]]; then
        log_success "All required dependencies are installed"
        
        if [[ ${#deps_needed[@]} -gt 0 ]]; then
            log_info "Optional dependencies missing: ${deps_needed[*]}"
        fi
        return 0
    else
        log_warning "Missing dependencies: ${BOLD}${deps_missing[*]}${NC}"
        return 1
    fi
}

install_dependencies() {
    log_step "Installing Dependencies"
    
    if [[ "$SKIP_DEPS" == "true" ]]; then
        log_warning "Skipping dependency installation (--skip-deps flag)"
        return
    fi
    
    log_info "Updating package database..."
    $PKG_UPDATE 2>&1 | tee -a "$LOG_FILE" || true
    
    case "$PKG_MANAGER" in
        pacman)
            log_info "Installing: grub imagemagick gettext zip"
            $PKG_INSTALL grub imagemagick gettext zip 2>&1 | tee -a "$LOG_FILE"
            ;;
        apt)
            log_info "Installing: grub2-common imagemagick gettext zip"
            $PKG_INSTALL grub2-common imagemagick gettext zip 2>&1 | tee -a "$LOG_FILE"
            ;;
        dnf|yum)
            log_info "Installing: grub2-tools ImageMagick gettext zip"
            $PKG_INSTALL grub2-tools ImageMagick gettext zip 2>&1 | tee -a "$LOG_FILE"
            ;;
        zypper)
            log_info "Installing: grub2 ImageMagick gettext-tools zip"
            $PKG_INSTALL grub2 ImageMagick gettext-tools zip 2>&1 | tee -a "$LOG_FILE"
            ;;
    esac
    
    log_success "Dependencies installed successfully"
}

#═══════════════════════════════════════════════════════════════════════════════
# Configuration
#═══════════════════════════════════════════════════════════════════════════════

configure_resolution() {
    log_step "Configure Display Resolution"
    
    if [[ "$AUTO_MODE" == "true" ]] && [[ -n "$DETECTED_RESOLUTION" ]]; then
        SELECTED_RESOLUTION="$DETECTED_RESOLUTION"
        log_info "Auto-selected resolution: ${BOLD}$SELECTED_RESOLUTION${NC}"
        return
    fi
    
    echo ""
    echo -e "${BOLD}Common Resolutions:${NC}"
    echo -e "  ${CYAN}1)${NC} 1920x1080  (Full HD)"
    echo -e "  ${CYAN}2)${NC} 2560x1440  (2K/QHD)"
    echo -e "  ${CYAN}3)${NC} 2880x1800  (MacBook Pro 15\")"
    echo -e "  ${CYAN}4)${NC} 3840x2160  (4K/UHD)"
    echo -e "  ${CYAN}5)${NC} 1366x768   (HD)"
    echo -e "  ${CYAN}6)${NC} 1600x900   (HD+)"
    
    if [[ -n "$DETECTED_RESOLUTION" ]]; then
        echo -e "  ${CYAN}7)${NC} $DETECTED_RESOLUTION  ${GREEN}(Detected)${NC}"
        echo -e "  ${CYAN}8)${NC} Custom resolution"
    else
        echo -e "  ${CYAN}7)${NC} Custom resolution"
    fi
    
    echo ""
    read -p "$(echo -e "${CYAN}Enter your choice:${NC} ")" res_choice
    
    case "$res_choice" in
        1) SELECTED_RESOLUTION="1920x1080" ;;
        2) SELECTED_RESOLUTION="2560x1440" ;;
        3) SELECTED_RESOLUTION="2880x1800" ;;
        4) SELECTED_RESOLUTION="3840x2160" ;;
        5) SELECTED_RESOLUTION="1366x768" ;;
        6) SELECTED_RESOLUTION="1600x900" ;;
        7)
            if [[ -n "$DETECTED_RESOLUTION" ]]; then
                SELECTED_RESOLUTION="$DETECTED_RESOLUTION"
            else
                read -p "$(echo -e "${CYAN}Enter custom resolution (e.g., 1920x1080):${NC} ")" SELECTED_RESOLUTION
            fi
            ;;
        8)
            read -p "$(echo -e "${CYAN}Enter custom resolution (e.g., 1920x1080):${NC} ")" SELECTED_RESOLUTION
            ;;
        *)
            SELECTED_RESOLUTION="$DETECTED_RESOLUTION"
            [[ -z "$SELECTED_RESOLUTION" ]] && SELECTED_RESOLUTION="1920x1080"
            ;;
    esac
    
    log_success "Selected resolution: ${BOLD}$SELECTED_RESOLUTION${NC}"
}

configure_scaling() {
    log_step "Configure Display Scaling"
    
    if [[ "$AUTO_MODE" == "true" ]]; then
        SELECTED_SCALING="$DETECTED_SCALING"
        log_info "Auto-selected scaling: ${BOLD}${SELECTED_SCALING}x${NC}"
        return
    fi
    
    echo ""
    echo -e "${BOLD}Scaling Options:${NC}"
    echo -e "  ${CYAN}1)${NC} 0.75x  - For older low-DPI displays"
    echo -e "  ${CYAN}2)${NC} 1.0x   - Standard definition displays ${GREEN}(recommended for 1080p)${NC}"
    echo -e "  ${CYAN}3)${NC} 1.25x  - Slightly higher DPI"
    echo -e "  ${CYAN}4)${NC} 1.5x   - 2K displays ${GREEN}(recommended for 1440p-1800p)${NC}"
    echo -e "  ${CYAN}5)${NC} 2.0x   - HiDPI/4K displays ${GREEN}(recommended for 4K)${NC}"
    
    if [[ -n "$DETECTED_SCALING" ]]; then
        echo -e "  ${CYAN}6)${NC} ${DETECTED_SCALING}x   ${GREEN}(Recommended for your display)${NC}"
    fi
    
    echo ""
    read -p "$(echo -e "${CYAN}Enter your choice [default: ${DETECTED_SCALING:-1}]:${NC} ")" scale_choice
    
    case "$scale_choice" in
        1) SELECTED_SCALING="0.75" ;;
        2) SELECTED_SCALING="1" ;;
        3) SELECTED_SCALING="1.25" ;;
        4) SELECTED_SCALING="1.5" ;;
        5) SELECTED_SCALING="2" ;;
        6) SELECTED_SCALING="$DETECTED_SCALING" ;;
        "") SELECTED_SCALING="${DETECTED_SCALING:-1}" ;;
        *) SELECTED_SCALING="$scale_choice" ;;
    esac
    
    log_success "Selected scaling: ${BOLD}${SELECTED_SCALING}x${NC}"
}

configure_installation() {
    log_step "Configure Installation Options"
    
    if [[ "$AUTO_MODE" == "true" ]]; then
        INSTALL_LOCATION="/boot/grub/themes"
        DISABLE_MEMTEST="yes"
        PATCH_10_LINUX="yes"
        PATCH_30_UEFI="yes"
        log_info "Auto-mode: Using recommended settings"
        return
    fi
    
    # Installation location
    echo ""
    echo -e "${BOLD}Installation Location:${NC}"
    echo -e "  ${CYAN}1)${NC} /boot/grub/themes ${GREEN}(recommended)${NC}"
    echo -e "  ${CYAN}2)${NC} /usr/share/grub/themes"
    echo ""
    local loc_choice=$(prompt_choice "Choose installation location" "/boot/grub/themes (recommended)" "/usr/share/grub/themes")
    
    if [[ "$loc_choice" == "1" ]]; then
        INSTALL_LOCATION="/boot/grub/themes"
    else
        INSTALL_LOCATION="/usr/share/grub/themes"
    fi
    
    # Memtest
    if prompt_yes_no "Disable memtest86+ entry in GRUB menu?" "y"; then
        DISABLE_MEMTEST="yes"
    else
        DISABLE_MEMTEST="no"
    fi
    
    # Patch 10_linux
    if prompt_yes_no "Patch 10_linux for custom 'Advanced Options' screen?" "y"; then
        PATCH_10_LINUX="yes"
    else
        PATCH_10_LINUX="no"
    fi
    
    # Patch 30_uefi-firmware
    if [[ "$BOOT_MODE" == "UEFI" ]]; then
        if prompt_yes_no "Patch 30_uefi-firmware for custom EFI screen?" "y"; then
            PATCH_30_UEFI="yes"
        else
            PATCH_30_UEFI="no"
        fi
    else
        PATCH_30_UEFI="no"
    fi
    
    log_success "Installation configured"
}

#═══════════════════════════════════════════════════════════════════════════════
# Build Theme
#═══════════════════════════════════════════════════════════════════════════════

build_theme() {
    log_step "Building Theme"
    
    cd "$SCRIPT_DIR"
    
    log_info "Building for resolution: ${BOLD}$SELECTED_RESOLUTION${NC}"
    log_info "Scaling factor: ${BOLD}${SELECTED_SCALING}x${NC}"
    
    if [[ ! -x "$SCRIPT_DIR/build.sh" ]]; then
        log_error "build.sh not found or not executable"
        exit 1
    fi
    
    log_info "Running build script..."
    bash "$SCRIPT_DIR/build.sh" "$SELECTED_RESOLUTION" "$SELECTED_SCALING" 2>&1 | tee -a "$LOG_FILE"
    
    if [[ $? -eq 0 ]]; then
        log_success "Theme built successfully"
    else
        log_error "Theme build failed"
        exit 1
    fi
}

#═══════════════════════════════════════════════════════════════════════════════
# Installation
#═══════════════════════════════════════════════════════════════════════════════

install_theme() {
    log_step "Installing Theme"
    
    local theme_dir_name="WinTux Dualboot Fullscreen ${SELECTED_RESOLUTION}-${SELECTED_SCALING}x"
    local theme_build_dir="$BUILD_DIR/$theme_dir_name"
    local theme_compliant_name="win-tux-dualboot-fullscreen"
    
    if [[ ! -d "$theme_build_dir" ]]; then
        log_error "Built theme not found at: $theme_build_dir"
        exit 1
    fi
    
    # Create backup of /etc/default/grub
    if [[ ! -f /etc/default/grub.wintux.bak ]]; then
        log_info "Creating backup: /etc/default/grub.wintux.bak"
        cp -an /etc/default/grub /etc/default/grub.wintux.bak
    fi
    
    # Copy theme files
    log_info "Copying theme to $INSTALL_LOCATION"
    mkdir -p "$INSTALL_LOCATION"
    cp -ar "$theme_build_dir/$theme_compliant_name" "$INSTALL_LOCATION/"
    
    # Update /etc/default/grub
    log_info "Updating /etc/default/grub"
    
    # Set GRUB_GFXMODE
    if grep -q "^GRUB_GFXMODE=" /etc/default/grub; then
        sed -i "s|^GRUB_GFXMODE=.*|GRUB_GFXMODE=\"$SELECTED_RESOLUTION\"|" /etc/default/grub
    else
        echo "" >> /etc/default/grub
        echo "GRUB_GFXMODE=\"$SELECTED_RESOLUTION\"" >> /etc/default/grub
    fi
    
    # Set GRUB_THEME
    local theme_txt="$INSTALL_LOCATION/$theme_compliant_name/theme.txt"
    if grep -q "^GRUB_THEME=" /etc/default/grub; then
        local escaped_theme_txt=$(echo "$theme_txt" | sed 's|\/|\\\/|g')
        sed -i "s|^GRUB_THEME=.*|GRUB_THEME=\"$escaped_theme_txt\"|" /etc/default/grub
    else
        echo "" >> /etc/default/grub
        echo "GRUB_THEME=\"$theme_txt\"" >> /etc/default/grub
    fi
    
    # Disable memtest
    if [[ "$DISABLE_MEMTEST" == "yes" ]]; then
        log_info "Disabling memtest86+ entry"
        if grep -q "^GRUB_DISABLE_MEMTEST=" /etc/default/grub; then
            sed -i "s|^GRUB_DISABLE_MEMTEST=.*|GRUB_DISABLE_MEMTEST=true|" /etc/default/grub
        else
            echo "" >> /etc/default/grub
            echo "GRUB_DISABLE_MEMTEST=true" >> /etc/default/grub
        fi
    fi
    
    # Patch 10_linux
    if [[ "$PATCH_10_LINUX" == "yes" ]]; then
        if [[ -f /etc/grub.d/10_linux ]]; then
            log_info "Patching /etc/grub.d/10_linux"
            
            if [[ ! -f /etc/grub.d/wintux-backup/10_linux ]]; then
                mkdir -p /etc/grub.d/wintux-backup
                cp -an /etc/grub.d/10_linux /etc/grub.d/wintux-backup/10_linux
            fi
            
            if ! grep -q '^SUBMENU_CLASS="--class gnu-linux-adv"' /etc/grub.d/10_linux; then
                sed -i '/CLASS="--class gnu-linux --class gnu --class os"/ a\SUBMENU_CLASS="--class gnu-linux-adv"' /etc/grub.d/10_linux
            fi
            sed -i 's|\(echo "submenu '"'"'$(.*)'"'"' \).*\(\\$menuentry_id_option.*\)|\1${SUBMENU_CLASS} \2|' /etc/grub.d/10_linux
        fi
    fi
    
    # Patch 30_uefi-firmware
    if [[ "$PATCH_30_UEFI" == "yes" ]]; then
        if [[ -f /etc/grub.d/30_uefi-firmware ]]; then
            log_info "Patching /etc/grub.d/30_uefi-firmware"
            
            if [[ ! -f /etc/grub.d/wintux-backup/30_uefi-firmware ]]; then
                mkdir -p /etc/grub.d/wintux-backup
                cp -an /etc/grub.d/30_uefi-firmware /etc/grub.d/wintux-backup/30_uefi-firmware
            fi
            
            sed -i 's|\(menuentry '"'"'$LABEL'"'"' \).*\(\\$menuentry_id_option.*\)|\1--class efi \2|' /etc/grub.d/30_uefi-firmware
        fi
    fi
    
    # Regenerate GRUB config
    log_info "Regenerating GRUB configuration"
    if command -v update-grub &>/dev/null; then
        update-grub 2>&1 | tee -a "$LOG_FILE"
    elif command -v grub-mkconfig &>/dev/null; then
        grub-mkconfig -o /boot/grub/grub.cfg 2>&1 | tee -a "$LOG_FILE"
    elif command -v grub2-mkconfig &>/dev/null; then
        grub2-mkconfig -o /boot/grub2/grub.cfg 2>&1 | tee -a "$LOG_FILE"
    else
        log_error "Cannot find grub-mkconfig or update-grub command"
        exit 1
    fi
    
    log_success "Theme installed successfully"
}

#═══════════════════════════════════════════════════════════════════════════════
# Main Installation Flow
#═══════════════════════════════════════════════════════════════════════════════

show_summary() {
    log_step "Installation Summary"
    
    echo ""
    echo -e "${BOLD}Configuration:${NC}"
    echo -e "  ${CYAN}Distribution:${NC}     $DISTRO_NAME"
    echo -e "  ${CYAN}Package Manager:${NC}  $PKG_MANAGER"
    echo -e "  ${CYAN}Boot Mode:${NC}        $BOOT_MODE"
    if [[ "$BOOT_MODE" == "UEFI" ]]; then
        echo -e "  ${CYAN}Secure Boot:${NC}      ${SECURE_BOOT}"
    fi
    echo ""
    echo -e "${BOLD}Theme Settings:${NC}"
    echo -e "  ${CYAN}Resolution:${NC}       $SELECTED_RESOLUTION"
    echo -e "  ${CYAN}Scaling:${NC}          ${SELECTED_SCALING}x"
    echo -e "  ${CYAN}Install Location:${NC} $INSTALL_LOCATION"
    echo -e "  ${CYAN}Disable Memtest:${NC}  $DISABLE_MEMTEST"
    echo -e "  ${CYAN}Patch 10_linux:${NC}   $PATCH_10_LINUX"
    echo -e "  ${CYAN}Patch 30_uefi:${NC}    $PATCH_30_UEFI"
    echo ""
    
    if [[ "$SECURE_BOOT" == "enabled" ]]; then
        log_warning "Secure Boot is enabled - custom fonts may not work"
        echo -e "${YELLOW}Consider disabling Secure Boot in BIOS for best results${NC}"
        echo ""
    fi
}

show_completion() {
    echo ""
    echo -e "${GREEN}${BOLD}"
    cat << "EOF"
╔════════════════════════════════════════════════════════════════════════════╗
║                                                                            ║
║                     ✓ Installation Completed Successfully!                ║
║                                                                            ║
╚════════════════════════════════════════════════════════════════════════════╝
EOF
    echo -e "${NC}"
    
    echo -e "${BOLD}Next Steps:${NC}"
    echo -e "  ${GREEN}1.${NC} Reboot your computer"
    echo -e "  ${GREEN}2.${NC} Your new GRUB theme will be active!"
    echo ""
    
    echo -e "${BOLD}Troubleshooting:${NC}"
    echo -e "  • Configuration: ${CYAN}/etc/default/grub${NC}"
    echo -e "  • Theme location: ${CYAN}$INSTALL_LOCATION/win-tux-dualboot-fullscreen${NC}"
    echo -e "  • Log file: ${CYAN}$LOG_FILE${NC}"
    echo -e "  • Backups: ${CYAN}/etc/default/grub.wintux.bak${NC}"
    echo -e "             ${CYAN}/etc/grub.d/wintux-backup/${NC}"
    echo ""
    
    echo -e "${BOLD}To restore original configuration:${NC}"
    echo -e "  ${CYAN}sudo cp /etc/default/grub.wintux.bak /etc/default/grub${NC}"
    echo -e "  ${CYAN}sudo grub-mkconfig -o /boot/grub/grub.cfg${NC}"
    echo ""
    
    echo -e "${BOLD}Enjoy your new GRUB theme! 🎨${NC}"
    echo ""
}

usage() {
    cat << EOF
Usage: $0 [OPTIONS]

Universal installer for WinTux Dualboot Fullscreen GRUB Theme

Options:
  -a, --auto              Run in automatic mode with detected settings
  -r, --resolution RES    Set resolution (e.g., 1920x1080)
  -s, --scaling SCALE     Set scaling factor (e.g., 1.5)
  -l, --location PATH     Installation location (default: /boot/grub/themes)
  --skip-deps             Skip dependency installation
  -h, --help              Show this help message
  
Examples:
  $0                                    # Interactive mode
  $0 --auto                             # Automatic mode with detection
  $0 -r 2560x1440 -s 1.5                # Specific resolution and scaling
  $0 --auto --skip-deps                 # Auto mode, skip dependency check

EOF
    exit 0
}

#═══════════════════════════════════════════════════════════════════════════════
# Argument Parsing
#═══════════════════════════════════════════════════════════════════════════════

parse_arguments() {
    while [[ $# -gt 0 ]]; do
        case $1 in
            -a|--auto)
                AUTO_MODE=true
                shift
                ;;
            -r|--resolution)
                SELECTED_RESOLUTION="$2"
                shift 2
                ;;
            -s|--scaling)
                SELECTED_SCALING="$2"
                shift 2
                ;;
            -l|--location)
                INSTALL_LOCATION="$2"
                shift 2
                ;;
            --skip-deps)
                SKIP_DEPS=true
                shift
                ;;
            -h|--help)
                usage
                ;;
            *)
                echo -e "${RED}Unknown option: $1${NC}"
                usage
                ;;
        esac
    done
}

#═══════════════════════════════════════════════════════════════════════════════
# Main Function
#═══════════════════════════════════════════════════════════════════════════════

main() {
    parse_arguments "$@"
    
    print_banner
    
    log_info "Starting installation at $(date)"
    log_info "Log file: $LOG_FILE"
    
    # Root check
    check_root
    
    # System detection
    detect_distribution
    detect_package_manager
    detect_boot_mode
    detect_display_resolution
    detect_display_scaling
    
    # Check and install dependencies
    if ! check_dependencies; then
        if prompt_yes_no "Install missing dependencies?" "y"; then
            install_dependencies
        else
            log_error "Cannot proceed without dependencies"
            exit 1
        fi
    fi
    
    # Configuration
    if [[ -z "$SELECTED_RESOLUTION" ]]; then
        configure_resolution
    else
        log_info "Using specified resolution: ${BOLD}$SELECTED_RESOLUTION${NC}"
    fi
    
    if [[ -z "$SELECTED_SCALING" ]]; then
        configure_scaling
    else
        log_info "Using specified scaling: ${BOLD}${SELECTED_SCALING}x${NC}"
    fi
    
    if [[ -z "$INSTALL_LOCATION" ]]; then
        configure_installation
    else
        log_info "Using specified location: ${BOLD}$INSTALL_LOCATION${NC}"
        # Set defaults for auto mode
        DISABLE_MEMTEST="${DISABLE_MEMTEST:-yes}"
        PATCH_10_LINUX="${PATCH_10_LINUX:-yes}"
        PATCH_30_UEFI="${PATCH_30_UEFI:-yes}"
    fi
    
    # Show summary and confirm
    show_summary
    
    if [[ "$AUTO_MODE" != "true" ]]; then
        if ! prompt_yes_no "Proceed with installation?" "y"; then
            log_warning "Installation cancelled by user"
            exit 0
        fi
    fi
    
    # Build and install
    build_theme
    install_theme
    
    # Completion
    show_completion
    
    log_info "Installation completed at $(date)"
}

#═══════════════════════════════════════════════════════════════════════════════
# Entry Point
#═══════════════════════════════════════════════════════════════════════════════

main "$@"
