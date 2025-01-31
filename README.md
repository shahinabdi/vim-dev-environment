# Modern Vim Development Environment

A comprehensive Vim configuration for Python and Frontend development with LSP support, auto-completion, and modern features.

![Vim Logo](https://raw.githubusercontent.com/vim/vim/master/runtime/vimlogo.gif)

## 📁 Repository Structure

```
vim-dev-environment/
├── .vimrc                  # Main Vim configuration
├── coc-settings.json       # CoC LSP settings
├── install.sh             # Installation script
├── .gitignore             # Git ignore file
├── LICENSE                # MIT License
└── README.md              # Documentation
```

## ✨ Features

- 🎨 Modern theme (Gruvbox)
- 📁 File explorer (NERDTree)
- 🔍 Fuzzy finder (FZF)
- ✅ LSP support via CoC
- 🐍 Python development
  - Auto-completion
  - Type checking
  - Black formatting
  - isort import sorting
- 🌐 Frontend development
  - JavaScript/TypeScript support
  - React/JSX support
  - Prettier formatting
  - ESLint integration
- 📝 Git integration
- ⚡ Fast and lightweight

## 🚀 Quick Install

```bash
git clone https://github.com/shahinabdi/vim-dev-environment.git
cd vim-dev-environment
chmod +x install.sh
./install.sh
```

## 📋 Prerequisites

Required packages:
```bash
sudo apt-get update
sudo apt-get install -y vim git curl nodejs npm python3 python3-pip ripgrep
```

Node.js packages:
```bash
npm install -g typescript prettier eslint yarn
```

Python packages:
```bash
pip3 install black isort pylint
```

## ⚙️ Manual Installation

1. **Backup existing configuration**:
```bash
[ -f ~/.vimrc ] && mv ~/.vimrc ~/.vimrc.backup
[ -f ~/.vim/coc-settings.json ] && mv ~/.vim/coc-settings.json ~/.vim/coc-settings.json.backup
```

2. **Copy configuration files**:
```bash
cp .vimrc ~/.vimrc
mkdir -p ~/.vim
cp coc-settings.json ~/.vim/
```

3. **Install vim-plug**:
```bash
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

4. **Install plugins**:
```bash
vim +PlugInstall +qall
```

## 🎮 Key Bindings

### General
- `<Space>` - Leader key
- `<Space>w` - Save file
- `<Space>q` - Quit
- `<Ctrl>j` - Next buffer
- `<Ctrl>k` - Previous buffer

### Navigation
- `<Ctrl>n` - Toggle NERDTree
- `<Ctrl>p` - Fuzzy file search
- `<Ctrl>f` - Text search in files

### Code
- `gd` - Go to definition
- `gy` - Go to type definition
- `gi` - Go to implementation
- `gr` - Go to references
- `<Tab>` - Next completion
- `<Shift>Tab` - Previous completion
- `F9` - Format Python file

### Frontend
- `<Ctrl>z` - Emmet leader key
- Auto-format on save with Prettier

## 🖥️ Usage Examples

### Python Development
```python
# Open a Python file
vim example.py

# Features:
# - Auto-completion as you type
# - Type checking in gutter
# - F9 to format code
# - gd to go to definitions
```

### Frontend Development
```javascript
// Open a JavaScript/TypeScript file
vim app.js
// or
vim app.tsx

// Features:
// - 2-space indentation
// - JSX/TSX syntax highlighting
// - Auto-format on save
// - Emmet support
```

## 🔧 Customization

### Adding Plugins
1. Edit `~/.vimrc`
2. Add in `call plug#begin()` section:
```vim
Plug 'username/plugin-name'
```
3. Run `:PlugInstall`

### LSP Settings
Edit `~/.vim/coc-settings.json`:
```json
{
  "python.linting.enabled": true,
  "python.formatting.provider": "black"
}
```

## 🔄 Updates

Update plugins:
```vim
:PlugUpdate
```

Update CoC extensions:
```vim
:CocUpdate
```

Update tools:
```bash
pip install --upgrade black isort pylint
npm update -g prettier eslint typescript
```

## 🐛 Troubleshooting

### Plugin Issues
```bash
# Reinstall plugins
rm -rf ~/.vim/plugged
vim +PlugInstall +qall
```

### CoC Issues
```bash
# Rebuild CoC
cd ~/.vim/plugged/coc.nvim
yarn install
yarn build
```

### Tool Issues
```bash
# Verify installations
which black isort pylint prettier eslint typescript

# Reinstall if needed
pip install --upgrade black isort pylint
npm install -g prettier eslint typescript
```

## 📄 License

MIT License - see [LICENSE](LICENSE) for details

## 👥 Contributing

1. Fork the repository
2. Create a feature branch
3. Commit changes
4. Push to branch
5. Create Pull Request

## ⭐ Support

If you find this useful, please star the repository!

## 📞 Contact

- GitHub: [@shahinabdi](https://github.com/shahinabdi)