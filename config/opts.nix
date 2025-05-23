{ ... }: {
  opts = {
    autoread = true; # automatically read file on mod
    colorcolumn = "0"; # Column highlighted to align text at
    completeopt = "menu,menuone"; # Completion options
    copyindent = true; # Copy indention from line above
    cursorline = true; # A line highlighting the cursor position
    equalalways = true; # auto resize splits on split or window close
    expandtab = true; # Use spaces instead of tabs
    gdefault = true; # substitute all by default
    hidden = true; # Enable modified buffers in background
    ignorecase = true; # Ignore case
    joinspaces = false; # No double spaces with join after a dot
    list = true; # Show some invisible characters
    listchars = "tab:▸ ,trail:-,precedes:←,extends:→";
    mouse = "a"; # Mouse support
    number = true; # Absolute line number
    relativenumber = true; # Relative line numbers
    scrolloff = 4; # Lines of context
    shell = "zsh"; # Use zsh shell
    shiftround = true; # Round indent
    shiftwidth = 2; # Size of an indent
    shortmess = "filnxttTF"; # Shorten certain messages
    showcmd = true; # Show (partial) command in last line
    showmode = false; # last line shows insert mode
    sidescrolloff = 8; # Columns of context
    signcolumn = "yes:2"; # reserve space for 2 signs
    smartcase = true; # Don't ignore case with capitals
    smartindent = false; # Do smart autoindenting when starting a new line, incl #
    autoindent = true; # Copy indent from current line when starting a new line
    splitbelow = true; # Put new windows below current
    splitright = true; # Put new windows right of current
    swapfile = false; # Use a swapfile for the buffer
    tabstop = 2; # Number of spaces tabs count for
    termguicolors = true; # True color support
    title = true; # Set terminal title
    undofile = true; # Save history to a file
    updatetime = 150; # CursorHold autocommand timeout
    viewoptions = "cursor,folds"; # What to save with mkview
    whichwrap = "b,s"; # Backspace and cursor keys wrap
    wildignore = ""; # Ignore files in wildmenu
    wildmenu = false; # Do not classic list of completions in cmd
    wrap = false; # line wrap
    splitkeep = "screen"; # Keep the text on the same screen line when split
    linebreak = true; # Break lines at breakat (default " ^I!@*-+;:,./?")
    breakindent = true; # Wrapped line will continue visually indented
    showbreak = "·"; # Character to show at the end of wrapped lines
    fillchars = "diff:╱"; # Fill chars
    cmdheight = 1; # Cmd line height/hiding
  };

    clipboard.register = "unnamedplus";

  globals = {
    mapleader = " ";
    maplocalleader = " ";
  };
}
