# ==============================================================================
# 1. INSTANT PROMPT (CRITICAL: MUST BE AT THE VERY TOP)
# ==============================================================================
# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# ==============================================================================
# 2. ENVIRONMENT VARIABLES
# ==============================================================================

# React Native Android: Azul Zulu JDK 17
export JAVA_HOME="/Library/Java/JavaVirtualMachines/zulu-17.jdk/Contents/Home"

# Android SDK
export ANDROID_HOME="$HOME/Library/Android/sdk"
export PATH="$PATH:$ANDROID_HOME/emulator"
export PATH="$PATH:$ANDROID_HOME/platform-tools"

# Path to your dotfiles
export DOTFILES="$HOME/.dotfiles"

# Locale (Modern: LANG + LC_CTYPE, not LC_ALL)
export LANG="en_US.UTF-8"
export LC_CTYPE="en_US.UTF-8"

# ==============================================================================
# 3. HISTORY & ZSH OPTIONS
# ==============================================================================

# History file and size
export HISTFILE="$HOME/.zsh_history"
export HISTSIZE=50000
export SAVEHIST=20000
HIST_STAMPS="dd.mm.yyyy"

# History behavior
setopt HIST_IGNORE_DUPS           # Do not record immediately repeated commands
setopt HIST_IGNORE_ALL_DUPS       # Remove older duplicate entries
setopt HIST_FIND_NO_DUPS          # Do not show dupes during history search
setopt SHARE_HISTORY              # Share history between sessions
setopt INC_APPEND_HISTORY_TIME    # Append commands with timestamp as they are entered

# Usability options
setopt AUTO_CD                    # `cd` by just typing directory
setopt INTERACTIVE_COMMENTS       # Allow comments in interactive commands
setopt EXTENDED_GLOB              # Powerful globbing
setopt NO_BEEP                    # No bell

# ==============================================================================
# 4. OH MY ZSH CONFIGURATION
# ==============================================================================

# Path to your Oh My Zsh installation
export ZSH="$HOME/.oh-my-zsh"

# Theme: Leave empty because Powerlevel10k is loaded manually below
# This prevents OMZ from loading a theme that gets immediately overwritten
ZSH_THEME=""

# Use your dotfiles repo as the custom OMZ directory
export ZSH_CUSTOM="$DOTFILES"

# Plugins (order matters: syntax-highlighting should be last)
plugins=(
  git
  zsh-autosuggestions
  zsh-syntax-highlighting
)

# Load Oh My Zsh
source "$ZSH/oh-my-zsh.sh"

# ==============================================================================
# 5. NODE.JS VIA FNM (Fast Node Manager)
# ==============================================================================

# Auto-switch Node versions based on .node-version or .nvmrc
# Guarded with 'command -v' so the shell doesn't crash if fnm is missing
if command -v fnm >/dev/null 2>&1; then
  eval "$(fnm env --use-on-cd --shell zsh)"
fi

# ==============================================================================
# 6. POWERLEVEL10K THEME
# ==============================================================================

# Load Powerlevel10k from Homebrew if installed
if command -v brew >/dev/null 2>&1; then
  if [[ -r "$(brew --prefix)/share/powerlevel10k/powerlevel10k.zsh-theme" ]]; then
    source "$(brew --prefix)/share/powerlevel10k/powerlevel10k.zsh-theme"
  fi
fi

# Load your personal P10k config
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# ==============================================================================
# 7. USER ALIASES & CUSTOMIZATIONS
# ==============================================================================

# Add your personal aliases here
# alias zshconfig="nvim ~/.zshrc"
# alias dotfiles="cd $DOTFILES"

# ==============================================================================
# 8. REFERENCE: OH MY ZSH OPTIONS (Inactive)
# ==============================================================================
# Keep these for reference when exploring Oh My Zsh features

# CASE_SENSITIVE="true"                    # Case-sensitive completion
# HYPHEN_INSENSITIVE="true"                # Hyphen-insensitive completion
# DISABLE_AUTO_UPDATE="true"               # Disable auto-updates
# zstyle ':omz:update' frequency 13        # Update frequency (days)
# DISABLE_MAGIC_FUNCTIONS="true"           # Fix paste issues
# DISABLE_LS_COLORS="true"                 # Disable ls colors
# DISABLE_AUTO_TITLE="true"                # Disable auto-setting terminal title
# ENABLE_CORRECTION="true"                 # Command auto-correction
# COMPLETION_WAITING_DOTS="true"           # Display dots while waiting
# DISABLE_UNTRACKED_FILES_DIRTY="true"     # Speed up large repos

# ==============================================================================
# 9. ANDROID STUDIO NODE.JS FIX (DO NOT ADD TO .zshrc)
# ==============================================================================
# ⚠️ If Android Studio can't find Node, run this ONCE manually in terminal:
# sudo ln -s "$(which node)" /usr/local/bin/node
