" Load pathogen
call pathogen#infect()
call pathogen#helptags()

set background=dark
colorscheme solarized
let g:solarized_termcolors=256

"Set title of tabs in iTerm so autoswap will work
set title titlestring=
set t_ts=]1;
set t_fs=

"Don't include line #'s in copy
set mouse=a

"Allow mouse scroll wheel to scroll up & down ITERM2 only
map <ScrollWheelUp> <C-Y>
map <ScrollWheelDown> <C-E>

"changing tabs to 4 spaces
set smartindent
set tabstop=2
set shiftwidth=2
set et

"turn on line numbers
set nu
"turn off line wrapping
set nowrap

"Turn on NerdTree by default if vim opened without file command
autocmd VimEnter * if !argc() | NERDTree | endif

"statusline setup
set statusline=%#identifier#
set statusline+=[%t]    "tail of the filename
set statusline+=%*
set statusline+=%{fugitive#statusline()}
set statusline+=%55(%{strftime('%a\ %b\ %e\ %I:%M\ %p')}\ %5l,%-6(%c%V%)\ %P%)

"Change the leader key
:let mapleader = ","

"CSS Colors
:let g:cssColorVimDoNotMessMyUpdatetime = 1

"Map :buffer to <leader> b 
map <leader>b :buffer

"Keymaps for vim fugitive
map <leader>gs :Gstatus<CR>
map <leader>gc :Gcommit<CR>
map <leader>gp :Git pull origin
map <leader>gu :Git push origin 
map <leader>gd :Gdiff<CR>

"Remap yiw and paste inner word
map <leader>c yiw
map <leader>v viwp

"Quick escape key in insert mode
imap jj <esc>

set clipboard=unnamed

"Map indent file
map <leader>i gg=G

"Change title back to shell when exiting vim window
let &titleold='Shell'

" Configure NerdTree
map <leader>n :NERDTreeToggle<CR>
let NERDTreeShowHidden=1

" Highlight just the 81st column of wide lines...
highlight ColorColumn ctermbg=magenta
call matchadd('ColorColumn', '\%81v', 100)

"====[ Make tabs, trailing whitespace, and non-breaking spaces visible ]======
exec "set listchars=tab:\uBB\uBB,trail:\uB7,nbsp:~"
set list

"====[ Swap v and CTRL-V, because Block mode is more useful that Visual mode "]======
nnoremap    v   <C-V>
nnoremap <C-V>     v

vnoremap    v   <C-V>
vnoremap <C-V>     v

" Open Buffergator in a horizontal split
let g:buffergator_viewport_split_policy='B'

"Enable omnicompletion
set nocompatible
filetype plugin indent on
syntax on
set omnifunc=syntaxcomplete#Complete

"Remap omnicomplete keys to something a little easier
inoremap <Ctrl-O> <Ctrl-X><Ctrl-O>
"Allow enter to select entry from omnicomplete
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

"Enable force.com plugin
if has("unix")
        let &runtimepath=&runtimepath . ',~/.vim/bundle/vim-force.com'
    elseif has("win32")
            let &runtimepath=&runtimepath . ',c:\Documents and Settings\username\vimfiles\vim-force.com'
        endif
        " make sure vim loads apexcode filetype detection
    runtime ftdetect/vim-force.com.vim"

"vim-force config settings
let g:apex_backup_folder="/tmp/apex/backup"
let g:apex_properties_folder="/Users/mhuggins/dev/sf/properties"
let g:apex_tooling_force_dot_com_path="~/dev/sf/lib/tooling-force.com-0.1.3.jar"

"vim-force shortcut keys
map <leader>as :ApexSave<CR>
map <leader>ar :ApexRefresh<CR>

:autocmd FileType make set noexpandtab

"CTags support for css
let g:tagbar_type_css = {
            \ 'ctagstype' : 'Css',
            \ 'kinds'     : [
            \ 'c:classes',
            \ 's:selectors',
            \ 'i:identities'
            \ ]
            \ }

"File type mappings for dash
let g:dash_map = {
            \ 'ruby'       : 'ruby',
            \ 'python'     : 'python2',
            \ 'javascript' : 'jquery'
            \ }
