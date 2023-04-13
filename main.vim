filetype off
filetype plugin on
let mapleader = "\<Space>"


filetype plugin indent on
syntax on

colorscheme onedark


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

" set guifont=Cascadia\ Code,CaskaydiaCove\ Nerd\ Font,Apple\ Color\ Emoji:h15
set guifont=Fira\ Code,CaskaydiaCove\ Nerd\ Font,Apple\ Color\ Emoji:h15

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

" noremap <F5> "=strftime("%c")<CR>P7bd$0i#<Space><Esc>o
" nnoremap <leader>o :setlocal spell! spelllang=en_us<CR>
" nnoremap <leader><leader> :w<CR>
" nnoremap <leader>w <C-w>
" nnoremap <leader>. :lua vim.lsp.buf.code_action()<CR>
" nnoremap <leader>k :lua vim.lsp.buf.hover()<CR>
" nnoremap gd        :lua vim.lsp.buf.definition()<CR>
" nnoremap <CR> :noh<CR><CR>
" nnoremap <leader>] :bnext<CR>
" nnoremap <leader>[ :bprev<CR>
" nnoremap <leader>c :bd<CR>
" nnoremap <leader>d :bd<CR>
" nnoremap <leader>D :Dashboard<CR>
" nnoremap <leader><Tab> <C-^>  
" nnoremap <C-p> :Rg<CR>
" nnoremap <leader>p "+p
" nnoremap <leader>y "+y
" nnoremap <leader>n :NvimTreeToggle<CR>
" nnoremap <silent> <Leader>fr :DashboardFindHistory<CR>
" nnoremap <silent> <Leader>ff :DashboardFindFile<CR>
" nnoremap <silent> <Leader>cc :DashboardChangeColorscheme<CR>
" nnoremap <silent> <Leader>fw :DashboardFindWord<CR>
" nnoremap <silent> <Leader>fb :DashboardJumpMark<CR>
" nnoremap <silent> <Leader>cn :DashboardNewFile<CR>
" nnoremap <C-c> "+y
" nnoremap <Tab> za
" nnoremap <leader>gs :Neogit<CR>
" nnoremap `` :Marks<CR>
" nnoremap <leader>lc :!g++ %:t && ./a.out<CR>
inoremap <expr> <Tab> search('\%#[]>)}$''"`]', 'n') ? '<Right>' : '<Tab>'
" imap <C-j> <C-n>
" inoremap <C-k> <C-p>
" inoremap <C-v> <Esc>"+p
" inoremap <C-c> "+y
" inoremap <C-s> <C-t>
" vnoremap<leader>y "+y
" vnoremap<leader>p "+p
" vnoremap <C-j> <C-n>
" vnoremap <C-k> <C-p>
" noremap <C-j> <C-n>
" noremap <C-k> <C-p>

" nnoremap <leader>gc :GCheckout<CR>



" ===================================================="
" __      __           _         _      _             "
" \ \    / /          (_)       | |    | |            "
"  \ \  / /__ _  _ __  _   __ _ | |__  | |  ___  ___  "
"   \ \/ // _` || '__|| | / _` || '_ \ | | / _ \/ __| "
"    \  /| (_| || |   | || (_| || |_) || ||  __/\__ \ "
"     \/  \__,_||_|   |_| \__,_||_.__/ |_| \___||___/ "
" ===================================================="

let g:markdown_fenced_languages = ['cpp', 'sql', 'html', 'python', 'bash=sh']
let g:vim_markdown_new_list_item_indent = 1
let g:vim_markdown_math = 1
let g:vim_markdown_auto_insert_bullets = 0
let g:vim_markdown_new_list_item_indent = 0
let g:vim_markdown_folding_disabled = 0
let g:markdown_folding = 1
let g:mkdp_refresh_slow=1
let g:mkdp_markdown_css='~/.local/lib/github-markdown.css'
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_statusline_ontop=0
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ''
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'
let g:airline_theme='deus'
let g:NERDTreeShowHidden = 1
let g:rustfmt_autosave = 1
let g:doom_one_terminal_colors = v:true
" let g:neovide_transparency=0.9
let g:neovide_cursor_vfx_mode = "sonicboom"
let g:neovide_refresh_rate=240
let g:dashboard_default_executive ='fzf'
let g:dashboard_custom_header =<< trim END
=================     ===============     ===============   ========  ========
\\ . . . . . . .\\   //. . . . . . .\\   //. . . . . . .\\  \\. . .\\// . . //
||. . ._____. . .|| ||. . ._____. . .|| ||. . ._____. . .|| || . . .\/ . . .||
|| . .||   ||. . || || . .||   ||. . || || . .||   ||. . || ||. . . . . . . ||
||. . ||   || . .|| ||. . ||   || . .|| ||. . ||   || . .|| || . | . . . . .||
|| . .||   ||. _-|| ||-_ .||   ||. . || || . .||   ||. _-|| ||-_.|\ . . . . ||
||. . ||   ||-'  || ||  `-||   || . .|| ||. . ||   ||-'  || ||  `|\_ . .|. .||
|| . _||   ||    || ||    ||   ||_ . || || . _||   ||    || ||   |\ `-_/| . ||
||_-' ||  .|/    || ||    \|.  || `-_|| ||_-' ||  .|/    || ||   | \  / |-_.||
||    ||_-'      || ||      `-_||    || ||    ||_-'      || ||   | \  / |  `||
||    `'         || ||         `'    || ||    `'         || ||   | \  / |   ||
||            .===' `===.         .==='.`===.         .===' /==. |  \/  |   ||
||         .=='   \_|-_ `===. .==='   _|_   `===. .===' _-|/   `==  \/  |   ||
||      .=='    _-'    `-_  `='    _-'   `-_    `='  _-'   `-_  /|  \/  |   ||
||   .=='    _-'          '-__\._-'         '-_./__-'         `' |. /|  |   ||
||.=='    _-'                                                     `' |  /==.||
=='    _-'                   BETTER WITH VIM                          \/   `==
\   _-'                                                                `-_   /
 `''                                                                      ``'
END
let g:dashboard_custom_header = [
\ ' ███╗   ██╗ ███████╗ ██████╗  ██╗   ██╗ ██╗ ███╗   ███╗',
\ ' ████╗  ██║ ██╔════╝██╔═══██╗ ██║   ██║ ██║ ████╗ ████║',
\ ' ██╔██╗ ██║ █████╗  ██║   ██║ ██║   ██║ ██║ ██╔████╔██║',
\ ' ██║╚██╗██║ ██╔══╝  ██║   ██║ ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║',
\ ' ██║ ╚████║ ███████╗╚██████╔╝  ╚████╔╝  ██║ ██║ ╚═╝ ██║',
\ ' ╚═╝  ╚═══╝ ╚══════╝ ╚═════╝    ╚═══╝   ╚═╝ ╚═╝     ╚═╝',
\]
let g:dashboard_custom_shortcut={
\ 'last_session'       : 'SPC s l',
\ 'find_history'       : 'SPC f r',
\ 'find_file'          : 'SPC f f',
\ 'new_file'           : 'SPC c n',
\ 'change_colorscheme' : 'SPC c c',
\ 'find_word'          : 'SPC f w',
\ 'book_marks'         : 'SPC f b',
\ }
let g:gruvbox_bold=1
let g:gruvbox_italic =1
let g:gruvbox_guisp_fallback =1
let g:airline_theme="gruvbox"
let g:gruvbox_contrast_dark="soft"
let g:rooter_patterns = ['build.gradle', '.vim','.git', '_darcs', '.hg', '.bzr', '.svn', 'Makefile', 'package.json', 'Cargo.toml']
let g:airline#extensions#branch#enabled=1
let g:vscode_style = "light"
let g:vscode_italic_comment = 1



" =================================================================================
"            _      _                        _         _    _
"     /\    | |    | |                      (_)       | |  (_)
"    /  \   | |__  | |__   _ __  ___ __   __ _   __ _ | |_  _   ___   _ __   ___
"   / /\ \  | '_ \ | '_ \ | '__|/ _ \\ \ / /| | / _` || __|| | / _ \ | '_ \ / __|
"  / ____ \ | |_) || |_) || |  |  __/ \ V / | || (_| || |_ | || (_) || | | |\__ \
" /_/    \_\|_.__/ |_.__/ |_|   \___|  \_/  |_| \__,_| \__||_| \___/ |_| |_||___/
"
" =================================================================================
" asdasda

ab rarr ↳
ab arr →



set path+=**
set wildmenu

" set foldmethod=expr
" set foldexpr=nvim_treesitter#foldexpr() 
" nnoremap J ddp 
" nnoremap K ddkP
" nnoremap <leader>b :Buffers<CR>
" nnoremap <leader>m :make<Cr>



autocmd FileType *.md nnoremap <leader>lr :!pandoc %:t -o %:t.pdf
autocmd FileType *.py nnoremap <leader>lr :!python3 %:t 
set iskeyword-=_ 

" nnoremap <leader>cds :e ~/Documents/School/mod4/<CR>
" nnoremap <leader>cdd :e ~/Documents/Development/<CR>
" nnoremap <leader>cdn :e ~/.config/nvim/init.lua<CR>
" nnoremap <leader>r :e ~/.reminders<CR>
" noremap <C-=> :lua Increment()<CR>
" noremap <C--> :lua Decrement()<CR>
" noremap <C-0> :lua Print_font()<CR> 



" ab <h1 <h1>Q</h1><Esc>FQxi
" ab <h2 <h2>Q</h2><Esc>FQxi

" MAKE FILE STUFF
" nnoremap <leader>m :TermExec cmd='make'<CR>

ab pf print(f"")<Esc>hi


let g:loaded_python3_provider = 0
let g:UltiSnipsEditSplit="vertical"

nnoremap <silent> <Leader>h :call fzf#run({
\   'source': 'sed "1d" $HOME/.cache/neomru/file',
\   'sink': 'e '
\ })<CR>


nnoremap <silent> <Leader>fr :call fzf#run({
\   'source': 'sed "1d" $HOME/.cache/neomru/file',
\   'sink': 'e '
\ })<CR>





