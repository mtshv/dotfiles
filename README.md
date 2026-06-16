# mtshv's Dotfiles

My personal dotfiles for setting up and maintaining my Mac. Heavily customized for a modern development workflow with Node.js, React Native, and AI assistance.

Based on the excellent [dotfiles by Dries Vints](https://github.com/driesvints/dotfiles).

## A Fresh macOS Setup

These instructions are for setting up a new Mac device. 

### Backup your data

If you're migrating from an existing Mac, you should first make sure to backup all of your existing data.

- Did you commit and push any changes/branches to your git repositories?
- Did you save all important documents from non-iCloud directories?
- Did you save all of your work from apps which aren't synced through iCloud?

### Setting up your Mac

1. Update macOS to the latest version.
2. Setup an SSH key (if you don't already sync them via 1Password):
   ```zsh
   ./ssh.sh "<your-email-address>"
   ```
   Add the generated key to your GitHub account.

3. Clone this repo to `~/.dotfiles`:
    ```zsh
    git clone --recursive git@github.com:mtshv/dotfiles.git ~/.dotfiles
    ```

4. Run the installation script:
    ```zsh
    ~/.dotfiles/fresh.sh
    ```

5. Restart your computer to finalize the process.

Your Mac is now ready to use!

## Local Configuration

For machine-specific configurations or secrets (like API keys), create a `~/.zshrc.local` file in your home directory. This file is ignored by Git and is securely loaded at the end of your Zsh session.

## Architecture

- **Package Management:** Homebrew (via `Brewfile`)
- **Shell:** Zsh + Oh My Zsh + Powerlevel10k
- **Node Management:** Fast Node Manager (`fnm`)
- **Plugin Management:** Git Submodules