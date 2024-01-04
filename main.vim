" filetype off
" filetype plugin on
" let mapleader = "\<Space>"


" filetype plugin indent on
" syntax on

" colorscheme vscode


set splitright
set encoding=UTF-8
set diffopt+=vertical
set noswapfile
set tw=79
set fo+=t
set wm=2
set number rnu
set shiftwidth=4
set encoding=utf-8
set splitbelow splitright
set smartindent
set tabstop=2
set expandtab
set shiftwidth=2
set completeopt=menu,menuone,preview,noselect,noinsert

set laststatus=2
set mouse =a

" set guifont=Cascadia\ Code,CaskaydiaCove\ Nerd\ Font,Apple\ Color\ Emoji:h20
set guifont=Fira\ Code,CaskaydiaCove\ Nerd\ Font,Apple\ Color\ Emoji:h20
" set guifont=JetBrainsMono\ Nerd\ Font\,Apple\ Color\ Emoji:h20



set guicursor+=i:ver100-iCursor 
set hidden
set ignorecase


" highlight Normal ctermbg=none
au BufRead,BufNewFile *.md set filetype=markdown

let &t_ut=''
autocmd filetype markdown syn region match start=/\\$\\$/ end=/\\$\\$/
autocmd filetype markdown syn match math '\\$[^$].\{-}\$'
autocmd InsertEnter * norm zz



"asd 


" ================================================ "
"  _  __              ____   _             _       "
" | |/ /             |  _ \ (_)           | |      "
" | ' /  ___  _   _  | |_) | _  _ __    __| | ___  "
" |  <  / _ \| | | | |  _ < | || '_ \  / _` |/ __| "
" | . \|  __/| |_| | | |_) || || | | || (_| |\__ \ "
" |_|\_\\___| \__, | |____/ |_||_| |_| \__,_||___/ "
"             __/ |                                "
"            |___/                                 "
" ================================================ "

inoremap <expr> <Tab> search('\%#[]>)}$''"`]', 'n') ? '<Right>' : '<Tab>'





" ===================================================="
" __      __           _         _      _             "
" \ \    / /          (_)       | |    | |            "
"  \ \  / /__ _  _ __  _   __ _ | |__  | |  ___  ___  "
"   \ \/ // _` || '__|| | / _` || '_ \ | | / _ \/ __| "
"    \  /| (_| || |   | || (_| || |_) || ||  __/\__ \ "
"     \/  \__,_||_|   |_| \__,_||_.__/ |_| \___||___/ "
" ===================================================="











let g:dashboard_custom_shortcut={
\ 'last_session'       : 'SPC s l',
\ 'find_history'       : 'SPC f r',
\ 'find_file'          : 'SPC f f',
\ 'new_file'           : 'SPC c n',
\ 'change_colorscheme' : 'SPC c c',
\ 'find_word'          : 'SPC f w',
\ 'book_marks'         : 'SPC f b',
\ }



let g:rooter_patterns = ['build.gradle', '.vim','.git', '_darcs', '.hg', '.bzr', '.svn', 'Makefile', 'package.json', 'Cargo.toml']





ab rarr ↳
ab arr →



set path+=**
set wildmenu



set iskeyword-=_ 




let g:UltiSnipsEditSplit="vertical"








