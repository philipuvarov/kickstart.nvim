# Neovim Configuration

This is a personal Neovim configuration based on [kickstart.nvim](https://github.com/nvim-lua/kickstart.nvim), customized and extended to meet specific needs.

## Project Overview

This configuration started from kickstart.nvim and is being gradually refactored into a modular plugin-based architecture. The goal is to maintain simplicity while adding carefully selected features.

### Key Characteristics

- **Plugin Manager**: lazy.nvim
- **Base**: kickstart.nvim (being progressively customized)
- **Architecture**: Modular plugin files in `lua/plugins/`
- **NOT using**: LazyVim distribution, Snacks plugin
- **Philosophy**: Minimal, curated plugin selection with clear purposes

## Directory Structure

```
~/.config/nvim/
├── init.lua                 # Main configuration file with core settings
├── lua/
│   ├── plugins/            # Custom plugin configurations (actively used)
│   │   ├── lsp.lua         # LSP configuration with Mason
│   │   ├── mini.lua        # mini.nvim modules
│   │   ├── blink.lua       # Completion engine
│   │   ├── fzf.lua         # Fuzzy finder
│   │   ├── trouble.lua     # Diagnostics UI
│   │   ├── whichkey.lua    # Keybind helper
│   │   ├── todo.lua        # Todo comments
│   │   ├── lazydev.lua     # Lua development
│   │   ├── miniicons.lua   # Icon support
│   │   └── bufline.lua     # Buffer line
│   ├── kickstart/          # Original kickstart files (mostly unused)
│   └── custom/             # Custom code (legacy)
└── CLAUDE.md               # This file
```

## Plugin Stack

### Core Functionality

| Plugin | Purpose | Notes |
|--------|---------|-------|
| `neovim/nvim-lspconfig` | LSP configuration | See `lua/plugins/lsp.lua` |
| `mason-org/mason.nvim` | LSP/tool installer | Auto-installs LSP servers |
| `saghen/blink.cmp` | Completion engine | Uses LuaSnip for snippets |
| `nvim-treesitter/nvim-treesitter` | Syntax highlighting | In `init.lua` |

### UI & Navigation

| Plugin | Purpose | Notes |
|--------|---------|-------|
| `nvim-mini/mini.nvim` | Multiple small modules | See mini.nvim section below |
| `ibhagwan/fzf-lua` | Fuzzy finder | Alternative to Telescope |
| `folke/trouble.nvim` | Diagnostics UI | Better diagnostic viewing |
| `folke/which-key.nvim` | Keybind hints | Helix preset |
| `folke/tokyonight.nvim` | Colorscheme | tokyonight-night variant |

### Development Tools

| Plugin | Purpose | Notes |
|--------|---------|-------|
| `stevearc/conform.nvim` | Formatting | Auto-format on save |
| `folke/todo-comments.nvim` | Todo highlights | Highlights TODO, FIXME, etc. |
| `folke/lazydev.nvim` | Lua development | Better Lua LSP for Neovim |
| `lewis6991/gitsigns.nvim` | Git signs | In `init.lua` |

### mini.nvim Modules

The configuration uses several mini.nvim modules (all in `lua/plugins/mini.lua`):

- `mini.ai` - Better text objects (around/inside)
- `mini.surround` - Add/delete/replace surroundings
- `mini.statusline` - Simple statusline
- `mini.animate` - Smooth animations
- `mini.pairs` - Auto-pair brackets
- `mini.indentscope` - Indent scope visualization
- `mini.bufremove` - Better buffer deletion
- `mini.files` - File explorer (toggle with `<leader>e`)

## Important Conventions

### 1. Plugin Organization

- **All new plugin configs go in `lua/plugins/`**
- Each file should return a lazy.nvim plugin spec (table or array of tables)
- Plugins are loaded in `init.lua` via `require 'plugins.<name>'`

### 2. Adding a New Plugin

1. Create `lua/plugins/<name>.lua`
2. Add plugin spec with configuration
3. Add `require 'plugins.<name>'` to the lazy.setup() call in `init.lua`

Example plugin file:
```lua
return {
  'author/plugin-name',
  event = 'VeryLazy',  -- or other lazy-loading trigger
  opts = {
    -- plugin options
  },
  config = function()
    -- custom configuration
  end,
}
```

### 3. Keybinding Conventions

Leader key: `<Space>`

Key groups (defined in which-key):
- `<leader>c` - Code actions (LSP)
- `<leader>s` - Search (fzf-lua)
- `<leader>x` - Diagnostics/Quickfix (trouble)
- `<leader>t` - Toggle operations
- `<leader>b` - Buffer operations
- `<leader>w` - Window operations
- `<leader>g` - Git operations
- `g` prefix - Goto operations (LSP)
- `[` / `]` - Previous/Next navigation

### 4. LSP Configuration

LSP is configured in `lua/plugins/lsp.lua` with:
- Mason for automatic installation
- blink.cmp for completion capabilities
- Standard LSP keybindings (gd, gr, gI, K, etc.)
- Custom diagnostic configuration
- File operation capabilities for renaming

To add a new LSP server:
```lua
-- In lua/plugins/lsp.lua, add to the servers table:
servers = {
  lua_ls = { ... },
  your_server = {
    settings = {
      -- server-specific settings
    },
  },
}
```

### 5. NO LazyVim, NO Snacks

**Important**: This config does NOT use:
- LazyVim distribution (it's kickstart-based)
- LazyVim utilities (`LazyVim.*` globals)
- Snacks plugin (`Snacks.*` globals)

If you see references to these, they should be replaced with:
- Standard Neovim APIs
- mini.nvim equivalents
- Custom implementations

## Key Files

### init.lua

Contains:
- Leader key setup
- Core Neovim options (line numbers, clipboard, etc.)
- Basic keymaps (window navigation, diagnostics)
- Autocommands (yank highlight)
- Lazy.nvim bootstrap
- Plugin loading via `require 'plugins.*'`
- Inline plugin specs (gitsigns, conform, colorscheme, treesitter)

### lua/plugins/lsp.lua

LSP configuration including:
- nvim-lspconfig setup
- Mason integration for tool installation
- LspAttach autocommand with keymaps
- Diagnostic configuration
- Server-specific settings (lua_ls, etc.)
- Capabilities configuration with blink.cmp

### lua/plugins/mini.lua

All mini.nvim module configurations:
- Text objects, surround, statusline
- File explorer with `<leader>e` keymap
- Pairs, indentscope, bufremove, animate

## Common Tasks

### Updating Plugins

```vim
:Lazy update
```

### Installing LSP Servers

```vim
:Mason
```

Then use `i` to install servers.

### Checking LSP Status

```vim
:LspInfo
```

### Checking Diagnostics

```vim
<leader>xx  " Open trouble diagnostics
<leader>cd  " Show line diagnostics in float
```

### File Navigation

```vim
<leader><leader>  " Search files (fzf)
<leader>sg        " Live grep (fzf)
<leader>e         " Toggle file explorer (mini.files)
```

## Development Notes

### Plugin Loading Strategy

- Most plugins use lazy-loading (`event`, `cmd`, `keys`, `ft`)
- LSP loads on `BufReadPre`, `BufNewFile` (not LazyFile)
- UI plugins load on `VeryLazy` or `VimEnter`
- Keep startup time fast by avoiding eager loading

### Formatting

- Uses conform.nvim
- Auto-format on save (except C/C++)
- Manual format: `<leader>cf`
- Configured formatters: stylua (Lua)

### Diagnostic Configuration

- Error severity underline only
- Nerd font icons in signs and virtual text
- Float window has rounded borders
- Sorted by severity

## Troubleshooting

### Global is nil (MiniFiles, LazyVim, Snacks, etc.)

- Ensure the plugin is loaded before use
- Add keymaps inside the plugin's config function
- Wrap in a function if lazy-loaded: `function() require('plugin').method() end`

### LazyVim references

- Replace with standard Neovim APIs or mini.nvim equivalents
- This config doesn't use the LazyVim distribution

### LSP not working

- Check `:LspInfo` for attached clients
- Ensure server is installed via `:Mason`
- Check server configuration in `lua/plugins/lsp.lua`

## Future Improvements

Ideas for expansion:
- Git integration (lazygit or similar)
- Debugging (nvim-dap)
- More LSP servers as needed
- Custom snippets
- Project-specific configurations
