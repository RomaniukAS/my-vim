""""""""""""""""""""""""""""""""""""""""""""
"               Vim fzf                    "
""""""""""""""""""""""""""""""""""""""""""""
" Map for fzf
nmap <Leader>. :Buffers<CR>
nmap <Leader>t :Files<CR>
nmap <Leader>r :Tags<CR>
nmap <Leader>L :Lines<CR>
" Help finder
nmap <Leader>H :Helptags!<CR>
" Fazzy search commands
nmap <Leader>C :Commands<CR>
" Fazzy search history
nmap <Leader>: :History:<CR>
" Fazzy search key mappings
nmap <Leader>M :Maps<CR>
" Fazzy search filetype syntaxes
nmap <Leader>s :Filetypes<CR>

" File path completion in Insert mode using fzf
imap <c-x><c-k> <plug>(fzf-complete-word)
imap <c-x><c-f> <plug>(fzf-complete-path)
imap <c-x><c-l> <plug>(fzf-complete-buffer-line)

" Save search history
let g:fzf_history_dir = '~/.local/share/fzf-history'

" Allow passing an optional flags to the Rg command
" Example: :Rg search_text -g '*.md'
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always --smart-case -- '.shellescape(<q-args>), 1,
  \   fzf#vim#with_preview(), <bang>0)
