#!/bin/bash
## Same for pacman and Arch derivatives 
#Made to be run as root post basic KDE install. 
TARGET_USER=hadean
## Only thing to specify is user and wanted packages.
########################################## MORE Nice to haves
echo "Setting up Bonuses..." 
## Update package list first
pacman -Sy
## Extended bonuses if you remove, remove corresponding code bellow
pacman -S --noconfirm zsh micro ufw power-profiles-daemon  
systemctl enable power-profiles-daemon.service
ufw default deny incoming
ufw enable
########################################## FIX SESSIONS
echo "Setting up KDE Config..." 
mkdir -p "$HOME/.config"
## Cool prepend move totally useless file doesnt exist yet but it's cool ya know
CONFIG_FILE2="/home/$TARGET_USER/.config/ksmserverrc"
TMP_FILE="$(mktemp)"
echo -e "[General]\nloginMode=emptySession" > "$TMP_FILE"
cat "$CONFIG_FILE2" >> "$TMP_FILE" 2>/dev/null # ignore not exist error idk 
mv "$TMP_FILE" "$CONFIG_FILE2"
# Basically just makes it so that new sessions are fresh
# Simple override the whole file for 15 min lockout and 5 min password grace. 
CONFIG_FILE3="/home/$TARGET_USER/.config/kscreenlockerrc"
cat <<EOF > $CONFIG_FILE3
[Daemon]
LockGrace=300
Timeout=30
EOF

CONFIG_FILE4="/home/$TARGET_USER/.config/powerdevilrc"
cat <<EOF > $CONFIG_FILE4
[AC][Performance]
PowerProfile=performance
[Battery][Performance]
PowerProfile=performance
EOF
########################################## DIRS
echo "Setting up Directories..." 
## Admin
mkdir -p "$HOME/.config/zsh"
mkdir -p "$HOME/.config/bash"
mkdir -p "$HOME/.config/micro/"
mkdir -p "$HOME/.local/bin"
## User
mkdir -p "/home/$TARGET_USER/.config/micro/"
mkdir -p "/home/$TARGET_USER/.local/share/konsole"

########################################## FRIENDLY EDITOR NEEDS EDITING :D + Alias mc + fixed create config
echo "Setting up Micro..." 
cat > "$HOME/.config/micro/settings.json" << EOF
{
    "clipboard": "external"
}
EOF
## Do the same for the user.
cat > "/home/$TARGET_USER/.config/micro/settings.json" << EOF
{
    "clipboard": "external"
}
EOF

########################################## CREATE THE KONSOLE PROFILE 
echo "Setting up Konsole..." 
cat > "/home/$TARGET_USER/.config/konsolerc" << EOF
[Desktop Entry]
DefaultProfile=$TARGET_USER.profile
EOF
# Create the profile file with a .profile extension
cat > "/home/$TARGET_USER/.local/share/konsole/$TARGET_USER.profile" << EOF
[General]
Command=su -l -c 'zsh'
Name=$TARGET_USER
Parent=FALLBACK/
EOF

#### Give everything back to user. IMPORTANT: BELOW NO MORE USER CHANGES. ##### IMPORTANT IMPORTANT IMPORTANT #######
echo "Setting up permissions..." 
chown -R $TARGET_USER:$TARGET_USER /home/$TARGET_USER/
########################################## LOCAL BIN THE GOAT <3
echo "Setting up Localbin..." 
# Add local bin to PATH if it exists
cat > "$HOME/.config/environment" << 'EOF'
if [ -d "$HOME/.local/bin" ]; then
    export PATH="$HOME/.local/bin:$PATH"
fi
EOF

########################################## Example Script: Called "iapps" To search in installed packages. 
# Create the script file - using pacman instead of dpkg for arch-based systems
cat > ~/.local/bin/iapps << 'EOF'
#!/bin/sh
# this script lets you search your installed packages easily
if [ -z "$1" ]; then
    echo "Missing search term"
    exit 1
fi
pacman -Qs "$1"
EOF
# Make it executable ### Can now be called simply as iapps git
chmod +x ~/.local/bin/iapps

########################################## SHARED (BASH & ZSH) ALIASES
echo "Setting up aliases..." 
cat > "$HOME/.config/aliases" << EOF
alias comms="cat ~/.config/aliases | sed 's/alias//g'"
# Base alias
alias cdu="cd /home/$TARGET_USER/"
alias aus="su $TARGET_USER" 

# Utils alias
alias wztree="du -h / | sort -rh | head -n 30 | less"
alias wzhere="du -h . | sort -rh | head -n 30 | less"
alias genpw="head /dev/urandom | tr -dc A-Za-z0-9 | head -c 21; echo"
alias logd="journalctl -f"  # Changed from syslog to journalctl for Arch-based
alias logds="dmesg -r"
# Pacman aliases (changed from apt)
alias updapc="pacman -Syu"
alias apklean="pacman -Sc"
alias apka="pacman -S"
alias apkd="pacman -R"
alias apks="pacman -Ss"
alias clr="clear"
alias cls="clr"
alias ls='ls --color=auto'
alias ll='ls --color=auto -la'
alias la='ls --color=auto -a'
alias l='ls --color=auto -CF'
EOF

########################################## BASH CONFIGURATION
echo "Setting up Bash..." 
# === Create ~/.config/bash/bashrc ===
cat > "$HOME/.config/bash/bashrc" << 'EOF'
# === Custom Bash Prompt Blue ===
export PS1='\[\033[1;34m\]┌──[\[\033[0;36m\]\A\[\033[1;34m\]]─[\[\033[0m\]\u\[\033[1;34m\]@\[\033[0;36m\]\h\[\033[1;34m\]]─[\[\033[0;32m\]\w\[\033[1;34m\]]\n\[\033[1;34m\]└──╼ \[\033[0;36m\]$ \[\033[0m\]'
# === Source common aliases ===
if [ -f "$HOME/.config/aliases" ]; then
    . "$HOME/.config/aliases"
fi
EOF

# Source environment file in bash
cat >> "$HOME/.config/bash/bashrc" << 'EOF'
# === Source environment file ===
if [ -f "$HOME/.config/environment" ]; then
    . "$HOME/.config/environment"
fi
EOF

# === Ensure ~/.bashrc Sources the New Config ===
# Create ~/.bashrc if it doesn't exist
touch "$HOME/.bashrc"
# Add source line if not already present
grep -q "HOME/.config/bash/bashrc" "$HOME/.bashrc" || echo '. "$HOME/.config/bash/bashrc"' >> "$HOME/.bashrc"

########################################## ZSH 
echo "Setting up ZSH..." 
# Install ZSH plugins via package manager instead of git
pacman -S --noconfirm zsh-autosuggestions \
                      zsh-syntax-highlighting

# === Create ~/.config/zsh/zshrc ===
cat > "$HOME/.config/zsh/zshrc" << 'EOF'
# === Load Extra Completions ===
if [ -d "/usr/share/zsh/site-functions" ]; then
    fpath+=("/usr/share/zsh/site-functions")
fi

# === History Configuration ===
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.zsh_history

# === Source Zsh Plugins (with error checking) ===
# Load autosuggestions and history-substring-search first
if [ -f "/usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh" ]; then
    . "/usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh"
else
    echo "Warning: zsh-autosuggestions plugin not found"
fi

# Load syntax-highlighting last as recommended
if [ -f "/usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" ]; then
    . "/usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
else
    echo "Warning: zsh-syntax-highlighting plugin not found"
fi

# === Custom Zsh Prompt Red ===
export PROMPT='%F{red}┌──[%F{cyan}%D{%H:%M}%F{red}]─[%F{default}%n%F{red}@%F{cyan}%m%F{red}]─[%F{green}%~%F{red}]
%F{red}└──╼ %F{cyan}$ %f'

# === Source common aliases ===
if [ -f "$HOME/.config/aliases" ]; then
    . "$HOME/.config/aliases"
fi
EOF

# Source environment file in zsh
cat >> "$HOME/.config/zsh/zshrc" << 'EOF'
# === Source environment file ===
if [ -f "$HOME/.config/environment" ]; then
    . "$HOME/.config/environment"
fi
EOF

# === Ensure ~/.zshrc Sources the New Config ===
# Create ~/.zshrc if it doesn't exist
touch "$HOME/.zshrc"
# Add source line if not already present
grep -q "HOME/.config/zsh/zshrc" "$HOME/.zshrc" || echo '. "$HOME/.config/zsh/zshrc"' >> "$HOME/.zshrc"
# === Add zsh to /etc/shells if missing ===
grep -qxF '/usr/bin/zsh' /etc/shells || echo '/usr/bin/zsh' >> /etc/shells

########################################## SYSTEM HARDENING

ufw allow out 443/tcp  

#ufw limit SSH         # open SSH port and protect against brute-force login attacks
#ufw allow out DNS     # allow outgoing DNS
#ufw allow out 80/tcp  # allow outgoing HTTP/HTTPS traffic
#ufw allow 3389        # remote desktop on xorg
#ufw allow 21          # ftp
#ufw allow 22	       # sftp
#ufw allow 51820/udp   # wireguard
#ufw allow 1194/udp    # openvpn


echo "Setting up Security fixes..." 
## Not a router stuff
cat > /etc/sysctl.conf << 'EOF'
# Network performance and security
net.core.rmem_max = 16777216
net.core.wmem_max = 16777216
net.ipv4.tcp_rmem = 4096 87380 16777216
net.ipv4.tcp_wmem = 4096 65536 16777216
net.ipv4.tcp_congestion_control = bbr
net.ipv4.tcp_fastopen = 3
net.ipv4.tcp_mtu_probing = 1

# Security settings
net.ipv4.conf.all.rp_filter = 1
net.ipv4.conf.default.rp_filter = 1
net.ipv4.tcp_syncookies = 1
net.ipv4.icmp_echo_ignore_broadcasts = 1
net.ipv4.conf.all.accept_redirects = 0
net.ipv4.conf.default.accept_redirects = 0
net.ipv4.conf.all.secure_redirects = 0
net.ipv4.conf.default.secure_redirects = 0

# Enable IPv6 privacy extensions
net.ipv6.conf.all.use_tempaddr = 2
net.ipv6.conf.default.use_tempaddr = 2
EOF

# Apply settings
sysctl -p >/dev/null 2>&1
