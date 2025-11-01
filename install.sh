#!/bin/bash

# --- 1. Basic Setup and Tool Installation ---
# /workspaces/.codespaces/.persistedshare/dotfiles/

echo "Starting dotfiles installation for Codespace..."

# Update package lists
sudo apt-get update
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Install essential tools: Neovim, tmux, and ripgrep (for faster search in nvim)
echo "Installing Neovim, Tmux, and other dependencies..."
sudo apt-get install -y tmux ripgrep git
brew install neovim

# --- 2. Symlinking Configuration Files ---

echo "Creating symbolic links for configuration files..."

# Ensure the .config directory exists in the HOME directory
mkdir -p "$HOME/.config"

# Symlink Neovim config (assuming your nvim config is at ~/.config/nvim)
# Replace 'mydotfiles' with the actual name of your dotfiles repository
# The codespace clones your dotfiles repo to ~/dotfiles (or similar)
ln -sf "/workspaces/.codespaces/.persistedshare/dotfiles/nvim" "$HOME/.config/nvim"

# Symlink Tmux configuration
ln -sf "/workspaces/.codespaces/.persistedshare/dotfiles/.tmux.conf" "$HOME/.tmux.conf"

# Symlink shell configuration (e.g., .zshrc or .bashrc)
# If you use Zsh, you can symlink your .zshrc
ln -sf "/workspaces/.codespaces/.persistedshare/dotfiles/.zshrc" "$HOME/.zshrc"

# Set Zsh as the default shell (optional, but a common dotfile setup)
if command -v zsh >/dev/null 2>&1; then
  echo "Changing default shell to zsh..."
  sudo chsh -s "$(command -v zsh)" "$(whoami)"
fi

# --- 3. Neovim Plugin Installation (Optional) ---

# Run the Neovim command to automatically install plugins defined in your configuration
# The '--headless' flag runs Neovim without a GUI, which is necessary in a script
# echo "Installing Neovim plugins..."
# nvim --headless "+Lazy! sync" +qa

echo "Dotfiles installation complete. Next time you start your terminal, it will use your custom shell and config."
