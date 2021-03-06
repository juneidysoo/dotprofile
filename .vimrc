set tabstop=3
set shiftwidth=3
set number
set relativenumber
set colorcolumn=80
set smartindent
set textwidth=80
set cursorline
set scrolloff=2
set laststatus=2 "To force vim displaying status line even in one split
set hlsearch "Default by neovim
hi Comment ctermfg=LightBlue
syntax on
syntax enable

nnoremap <C-p><C-p> :set paste!<CR>
nnoremap <C-l><C-l> :set fileformat=unix<CR>
nnoremap <C-j><C-j> :%!python -m json.tool<CR>
nnoremap <C-k><C-k> :%s/\(\s\\|\n\)//g<CR>
nnoremap <C-s> :wa<CR>

" Sometimes in javascript the vimdiff highlight overlaps with comments colour
if &diff
    colorscheme evening
endif

" Relative or absolute number lines
function! RelativeAbsoluteNumberToggle()
	if(&rnu == 1)
		set relativenumber!
	else
		set relativenumber
	endif
endfunction

nnoremap <C-n><C-n> :call RelativeAbsoluteNumberToggle()<CR>

"""""""" BEGIN		VUNDLE
set nocompatible "default by neovim
filetype off                  " required

" set the runtime path to include Vundle and initialize
set runtimepath+=$HOME/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

"""""""" BEGIN		CUSTOM BUNDLE
Plugin 'juneidysoo/vim-javascript'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'scrooloose/syntastic'
Plugin 'Valloric/YouCompleteMe'
Plugin 'marijnh/tern_for_vim'
Plugin 'bling/vim-airline'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'
Plugin 'kien/ctrlp.vim'
Plugin 'othree/javascript-libraries-syntax.vim'
Plugin 'mxw/vim-jsx'
"""""""" END OF	CUSTOM BUNDLE

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
"""""""" END OF		VUNDLE

"""""""" BEGIN		VIM-AIRLINE
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#default#layout = [
			\ [ 'a', 'c' ],
			\ [ 'z' ]
			\ ]
let g:airline_theme='kolor'
"""""""" END OF	VIM-AIRLINE

"""""""" BEGIN 	CTRLP.VIM
set runtimepath^=$HOME/.vim/bundle/ctrlp.vim
let g:ctrlp_working_path_mode = 'a'
let g:ctrlp_map = '<space><space>'
let g:ctrlp_by_filename = 1
let g:ctrlp_custom_ignore = 'node_modules\|build\|bower_components\|certs\|resources'
"""""""" END OF	CTRLP.VIM

"""""""" BEGIN		SYNTASTIC
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_javascript_eslint_args = "--no-eslintrc --config $HOME/.eslintrc"
"let g:syntastic_javascript_jscs_args= '--config $HOME/.jscsrc'

if &diff
	let g:syntastic_check_on_open = 0
	colorscheme slate
endif

nnoremap <C-m><C-m> :SyntasticToggleMode<CR>
"""""""" END OF	SYNTASTIC

"""""""" BEGIN		VIM-JAVASCRIPT
let g:javascript_enable_domhtmlcss = 1
"""""""" END OF	VIM-JAVASCRIPT

"""""""" BEGIN		YOUCOMPLETEME
let g:ycm_autoclose_preview_window_after_insertion = 1
"""""""" END OF	YOUCOMPLETEME
