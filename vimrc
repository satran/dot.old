set number
set pastetoggle=<F3>	"turn off auto-indent when pasting text
set nolist " Disable list chars
set showcmd
set mouse=a " Set use of mouse when using the terminal
set wrap " Wrapping without line break and in words instead of letters
set encoding=utf-8
set fileformat=unix
set clipboard=unnamed "Setting global clipboard
set autoindent
set t_Co=256 " Explicitly tell Vim that the terminal supports 256 colors
" No swap and backup files. I hate the .swp files polluting my system.
set nobackup
set nowritebackup
set noswapfile
set ruler "Always show current position
set ignorecase "Ignore case when searching
set smartcase
set hlsearch "Highlight search things
set incsearch
set syntax=off "I'm not a big fan of syntax highlighting.
set wildmenu "This enables the menu above the command prompt for suggestions

let g:netrw_liststyle= 3 "Tree style browsing in file browser view
colorscheme plain

" GUI Settings
if has("gui_running")
	set gfn=DejaVu\ Sans\ Mono\ 17
	set guioptions-=m  "remove menu bar
	set guioptions-=T  "remove toolbar
	set guioptions-=r  "remove right-hand scroll bar
	set guioptions-=L  "remove left-hand scroll bar
	"set guioptions+=a
endif

" Source the vimrc file after saving it
augroup vimrc
autocmd!
autocmd bufwritepost .vimrc source $MYVIMRC
augroup END

let mapleader = ","
map <leader><space> :nohl<CR>
