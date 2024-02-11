set splitbelow
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

" set laststatus=2
set mouse =a
set hidden

autocmd InsertEnter * norm zz



ab rarr ↳
ab arr →



set iskeyword-=_ 

nnoremap <silent> <Leader>fs :call fzf#run({
\   'source': 'sed "1d" $HOME/.cache/neomru/file',
\   'sink': 'e '
\ })<CR>


function! SetCwdToGitRoot()
    " Save the current file name
    let l:current_file = expand('%:p')
    if l:current_file == '' || !filereadable(l:current_file)
        " If no file is open or if the file isn't readable, don't change the cwd
        return
    endif

    " Find the .git directory or file starting from the directory of the current file and going up
    let l:git_root = finddir('.git', expand('%:p:h').';')
    if l:git_root != ''
        " If a .git directory or file is found, change to its parent directory
        let l:git_root_dir = fnamemodify(l:git_root, ':h')
        execute 'cd ' . l:git_root_dir
    endif
endfunction

" Call SetCwdToGitRoot function whenever a buffer is entered
autocmd BufEnter * call SetCwdToGitRoot()

nnoremap <leader>ll oconsole.log("Count: ", ++count);<CR><Esc>
