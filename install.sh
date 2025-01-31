#!/bin/bash

echo "📦 Installing Vim Development Environment..."

# Check if vim is installed
if ! command -v vim &> /dev/null; then
    echo "❌ Vim not found. Please install vim first."
    exit 1
fi

# Install required packages
echo "📥 Installing system packages..."
if command -v apt-get &> /dev/null; then
    sudo apt-get update
    sudo apt-get install -y git curl nodejs npm python3 python3-pip ripgrep
elif command -v yum &> /dev/null; then
    sudo yum install -y git curl nodejs npm python3 python3-pip ripgrep
elif command -v brew &> /dev/null; then
    brew install git curl node python3 ripgrep
else
    echo "⚠️  Package manager not found. Please install dependencies manually."
fi

# Install Node.js packages
echo "📥 Installing Node.js packages..."
npm install -g typescript prettier eslint yarn

# Install Python packages
echo "📥 Installing Python packages..."
pip3 install black isort pylint

# Backup existing configuration
echo "💾 Backing up existing configuration..."
[ -f ~/.vimrc ] && mv ~/.vimrc ~/.vimrc.backup
[ -f ~/.vim/coc-settings.json ] && mv ~/.vim/coc-settings.json ~/.vim/coc-settings.json.backup

# Create vim directories
echo "📁 Creating vim directories..."
mkdir -p ~/.vim/autoload

# Install vim-plug
echo "📥 Installing vim-plug..."
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Copy configuration files
echo "📝 Copying configuration files..."
cp .vimrc ~/.vimrc
mkdir -p ~/.vim
cp coc-settings.json ~/.vim/

# Install plugins
echo "🔌 Installing plugins..."
vim +PlugInstall +qall

echo "✅ Installation complete!"
echo "🎉 Enjoy your new Vim development environment!"