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
if test ! $(which omz); then
  /bin/sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

# Check for Homebrew and install if we don't have it
if test ! $(which brew); then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

#  echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> $HOME/.zprofile #MacOS silicone
#  eval "$(/opt/homebrew/bin/brew shellenv)"#MacOS silicone
fi

# Back up existing .zshrc (if it exists as a real file) and symlink the dotfiles version
if [ -f "$HOME/.zshrc" ] && [ ! -L "$HOME/.zshrc" ]; then
  mv "$HOME/.zshrc" "$HOME/.zshrc.backup"
fi
ln -sf "$HOME/.dotfiles/.zshrc" "$HOME/.zshrc"

# Update Homebrew recipes
brew update

# Install all our dependencies with bundle (See Brewfile)
brew tap homebrew/bundle
brew bundle --file ./Brewfile

# Ensure scripts are executable
chmod +x keyboard-shortcuts.sh
chmod +x zsh-plugins-setup.sh

# Install Zsh plugins using the script
echo "Installing Zsh plugins..."
./zsh-plugins-setup.sh

# Create a projects directories
mkdir $HOME/dev

## Create Code subdirectories
mkdir $HOME/dev/work
mkdir $HOME/dev/personal

## Clone Github repositories
#./clone.sh

## Symlink the Mackup config file to the home directory
#ln -s ./.mackup.cfg $HOME/.mackup.cfg

# Set macOS preferences - we will run this last because this will reload the shell
source ./.macos
