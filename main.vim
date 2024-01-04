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


set hidden
set ignorecase



" let &t_ut=''
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










ab rarr ↳
ab arr →



set path+=**
set wildmenu



set iskeyword-=_ 




let g:UltiSnipsEditSplit="vertical"








