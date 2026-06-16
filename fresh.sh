#!/bin/sh

echo "Setting up your Mac..."

# Check if Xcode Command Line Tools are installed
if ! xcode-select -p &>/dev/null; then
  echo "Xcode Command Line Tools not found. Installing..."
  xcode-select --install
else
  echo "Xcode Command Line Tools already installed."
fi

# Check for Oh My Zsh and install if we don't have it
# RUNZSH=no keeps it from dropping you into a new shell mid-script;
# KEEP_ZSHRC=yes stops it touching .zshrc (we symlink our own below).
if [ ! -d "$HOME/.oh-my-zsh" ]; then
  RUNZSH=no KEEP_ZSHRC=yes /bin/sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/HEAD/tools/install.sh)"
fi

# Check for Homebrew and install if we don't have it
if test ! $(which brew); then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

  # Persist brew on PATH for future shells (.zprofile loads before .zshrc on login)
  echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> $HOME/.zprofile
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# Back up existing .zshrc (if it exists as a real file) and symlink the dotfiles version
if [ -f "$HOME/.zshrc" ] && [ ! -L "$HOME/.zshrc" ]; then
  mv "$HOME/.zshrc" "$HOME/.zshrc.backup"
fi
ln -sf "$HOME/.dotfiles/.zshrc" "$HOME/.zshrc"

# Update Homebrew recipes
brew update

# Install all our dependencies with bundle (See Brewfile)
brew bundle --file ./Brewfile

# Update Git submodules (for Zsh plugins)
echo "Updating Git submodules..."
git submodule update --init --recursive

# Create a projects directory
mkdir $HOME/dev

## Clone Github repositories
#./clone.sh

## Symlink the Mackup config file to the home directory
#ln -s ./.mackup.cfg $HOME/.mackup.cfg

# Set macOS preferences - we will run this last because this will reload the shell
source ./.macos
