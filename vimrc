"Be iMproved
set nocompatible

"Set the leader to coma.
"Important to note is that it must be set before anything else
let mapleader="\<Space>"

"Source our plugins file
so ~/.vim/plugins.vim





"------------------Visuals-----------------------
"Set the text font to something more readable.
set guifont=Fira_Code_Retina:h16
"Macvim-specifc line-height.
set linespace=14
"Set the colorscheme to something more appealing
colorscheme atom-dark
"Ligatures are used for printing characters consisting of two or more characters
set macligatures
"Explicitly set the number of colors available in the terminal
set t_CO=256
"We don't want GUI tabs
set guioptions-=e

"Remove scrollbars.
set guioptions-=l
set guioptions-=L
set guioptions-=r
set guioptions-=R


"Sets the color for the line numbers
highlight LineNr guifg=#575757
"Sets the color for the gutter
highlight LineNr guibg=bg
"Sets the color for the current line highlight
highlight CursorLineNr guifg=#919191
"Enable cursor line
set cursorline

"Get rid of ugly split borders
"This doesnt work for some reason
hi vertsplit guifg=#575757 guibg=#575757





"------------------Text and Fonts------------------
"Wrap the text
set wrap
"...to 79 characters
set textwidth=79

set formatoptions=qrn1
"Show special characters
set list
set listchars=tab:▸\ ,eol:¬

"Fix the fonts
let g:airline_powerline_fonts = 1
set encoding=utf8





"------------------Search------------------
set hlsearch 
set incsearch
set ignorecase
set smartcase
"Ignore these files from search
set wildignore+=*/tmp/*,*.so,*.swp,*.zip




"------------------Navigation-----------------------
map <silent> <D-1> :tabn 1<cr>
map <silent> <D-2> :tabn 2<cr>
map <silent> <D-3> :tabn 3<cr>
map <silent> <D-4> :tabn 4<cr>
map <silent> <D-5> :tabn 5<cr>





"------------------Plugins-----------------------

"/
"/ TagList
"/
 let Tlist_Show_One_File=1

"/
"/ CtrlP
"/
"Open up CtrlP in current working directory
nmap <c-P> :CtrlPCurWD<cr>
"Open up CtrlP in file directory
nmap <c-s-P> :CtrlP<cr>
"Search for a tag or symbol inside the currently open file
nmap <c-R> :CtrlPBufTag<cr>
"Open most recently used files
nmap <c-E> :CtrlPMRUFiles<cr>
"Ignored files and directories
let g:ctrlp_custom_ignore = 'node_modules/'
"The way the window will look and behave
let g:ctrlp_match_window = 'bottom,order:btt,min:1,max:10,results:10'
"Set this to 1 to set searching by filename (as opposed to full path)
let g:ctrlp_by_filename = 0


"/
"/ Airline
"/
"Show the bar even when a split han't been created yet
set laststatus=2
"Set the colorscheme
let g:airline_theme='powerlineish'





"------------------Laravel Spesific Mappings-----------------------
"Open up routes file
nmap <Leader>lr :e app/Http/routes.php<cr>
"Open up routes file in a vertical split
nmap <Leader>lrv :vsplit app/Http/routes.php<cr>
"List the application routes
nmap <Leader>llr :!php artisan route:list<cr>
"Open up the User model
nmap <Leader>lu :e app/User.php<cr>
"Open up the User controller
nmap <Leader>luc :e app/Http/Controllers/UsersController.php<cr>


"
"
"
"------------------Project Navigation Mappings-----------------------
"Navigate to some tag
nmap <Leader>t :ta 
"Navigate to next tag
nmap ]t :tnext<cr>
"Navigate to prev tag
nmap [t :tprev<cr>










"------------------Misc Mappings-----------------------
"Open .vimrc
nmap <Leader>ev :e $MYVIMRC<cr>
"Remove search highlight
nmap <Leader>, :nohlsearch<cr>
"Open plugins file
nmap <Leader>pl :tabedit ~/.vim/plugins.vim<cr>

"Close current buffer
nmap <Leader>w :bd<cr>

"Map for easier typing
map ; :

"Enter a blank line below the cursor
nmap <S-Enter> O<Esc>j
"Enter a blank line above the cursor
nmap <CR> o<Esc>k

"Open the file browser in a vertical split
nmap <Leader>e :Vexplore<cr>
"Remap backspace to Control carret for easier switching between two files
nnoremap <BS> <C-^>


"------------------Various Settings-----------------------
"Increase the history size from the default of 20
set history=1000
"Better auto-completion
set wildmenu
"More context around the cursor
set scrolloff=5
"Stifle interruptive prompts
set shortmess=atI
"Enable syntax
syntax enable
"Make backspace behave in a sane manner
set backspace=indent,eol,start	

"Sets relative instead of absolute numbers
set relativenumber

"Automatically write the file when switching buffers
set autowriteall

"Open new vsplits to the right instead of the dafault, which is to the left
set splitright
"Open new splits bellow the current one, instead of the default
set splitbelow

" Tell vim to remember certain things when we exit
"  '10  :  marks will be remembered for up to 10 previously edited files
"  "100 :  will save up to 100 lines for each register
"  :20  :  up to 20 lines of command-line history will be remembered
"  %    :  saves and restores the buffer list
"  n... :  where to save the viminfo files
set viminfo='10,\"100,:20,%,n~/.viminfo

" Have Vim jump to the last position when reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif





"------------------Auto-Commands-----------------------
"Automatically source the Vimrc file on save.
augroup autosourcing
	autocmd!
	autocmd BufWritePost .vimrc source %
augroup END




"-------------------Notes and tips-----------------------
"Switch between tabs using gt or gT

"When in CtrlP window, pressing Ctrl+T on a file will open it in a new tab.
"Pressing Ctrl+V will open it in a vertical and Ctrl+S horizontal split.
"
"Single Quote (') - 0 opens the last edited file, and it saves it between
"sessions
"
"Crtl+O jumps backward in the (jump) edit list
"Ctrl+I jumps forward
"
"zz or z. 	set current line at center of window
"
"
" ***Tags***
"
":ta t↵	jump to tag t"
":ts t↵	list matching tags and select one for jump
":tj t↵	jump to tag or select one if multiple matches
":tl↵	jump to last matching tag
"Command for generating ctags excluding the following directories
"ctags -R --exclude=.git --exclude=node_modules --exclude=vendor"
"
" ***Editing***
" J joins the lines 
"
"
" ***Search***
" # *	search backward, forward for word under cursor
"
"
"
"
"
"
