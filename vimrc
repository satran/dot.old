" All variables and optional settings
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
"set syntax=off "I'm not a big fan of syntax highlighting.
set wildmenu "This enables the menu above the command prompt for suggestions

let g:netrw_liststyle = 3 "Tree style browsing in file browser view
let g:netrw_list_hide = '.*\.pyc,.DS_Store,.git,.ropeproject'
colorscheme plain

" GUI Settings
if has("gui_running")
	set gfn=UbuntuMono\ 12
	set guioptions-=m  "remove menu bar
	set guioptions-=T  "remove toolbar
	set guioptions-=r  "remove right-hand scroll bar
	set guioptions-=L  "remove left-hand scroll bar
	"set guioptions+=a
	colorscheme solarized
endif
" Setting the SignColumn to background color.
highlight clear SignColumn

" Source the vimrc file after saving it
augroup vimrc
autocmd!
autocmd bufwritepost .vimrc source $MYVIMRC
augroup END

" Mappings
let mapleader = " "

"disable the hightlight after a search
map <leader>h :nohl<CR> 

inoremap <C-f> <Esc>la "Moving forward in insert mode like Emacs

" Map for grep under word
map <leader>* "zyw:exec "grep --exclude-dir=build --exclude-dir=.git -rIn ".@z." *"<CR>:copen<CR>

" A map for building go files and opening in quicklist
map <leader>b :!go build &> /tmp/build.txt <CR>:cfile /tmp/build.txt<CR>:copen<CR>

" Show syntax highlighting groups for word under cursor
nnoremap <C-S-l> :call <SID>SynStack()<CR>
function! <SID>SynStack()
  if !exists("*synstack")
    return
  endif
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc

" Things I want to remember
" :new|0read !go doc   - read godoc into a new buffer
