let mapleader=" "

syntax on
filetype on
filetype indent on
filetype plugin on
filetype plugin indent on
set encoding=utf-8

" indend
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4

set list
set listchars=tab:\|\ ,trail:▫

set autochdir
set nocompatible
set number
set relativenumber
set cursorline
set wrap
set showcmd
set wildmenu

" search
set hlsearch
set incsearch
set ignorecase
set smartcase

set updatetime=100

" back to edit record
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" Buffer move
:nn <M-1> 1gt
:nn <M-2> 2gt
:nn <M-3> 3gt
:nn <M-4> 4gt
:nn <M-5> 5gt
:nn <M-6> 6gt
:nn <M-7> 7gt
:nn <M-8> 8gt
:nn <M-9> 9gt
:nn <M-0> :tablast<CR>

" noremap s <nop>
" window split
map sl :set splitright<CR>:vsplit<CR>
map sj :set nosplitright<CR>:vsplit<CR>
map si :set nosplitbelow<CR>:split<CR>
map sk :set splitbelow<CR>:split<CR>

" window move
map zj <C-w>h
map zk <C-w>j
map zi <C-w>k
map zl <C-w>l

" windows size
map <up> :res +5<CR>
map <down> :res -5<CR>
map <left> :vertical resize-5<CR>
map <right> : vertical resize+5<CR>

" window style
map sv <C-w>t<C-w>H
map sh <C-w>t<C-w>K

map <C-a> 0
map <C-e> $

noremap = nzz
noremap - Nzz
noremap <LEADER><CR> :nohlsearch<CR>

noremap J 5j
noremap K 5k
noremap H 5h
noremap L 5l

map S :w<CR>
map Q :q<CR>
map R :source ~/.config/nvim/init.vim<CR>

call plug#begin('~/.vim/plugged')
Plug 'morhetz/gruvbox'
Plug 'mhinz/vim-startify'
Plug 'vim-airline/vim-airline'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'jiangmiao/auto-pairs'
Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'ryanoasis/vim-devicons'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'honza/vim-snippets'
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() } }
Plug 'dhruvasagar/vim-table-mode'
Plug 'dkarter/bullets.vim'
Plug 'airblade/vim-gitgutter'
Plug 'connorholyday/vim-snazzy'
Plug 'tpope/vim-commentary'
Plug 'lfv89/vim-interestingwords'
Plug 'voldikss/vim-translator'
Plug 'luochen1990/rainbow'
Plug 'Yggdroot/LeaderF', { 'do': '.\install.bat'  }
Plug 'liuchengxu/vista.vim'
Plug 'voldikss/vim-floaterm'
Plug 'junegunn/fzf', { 'do': { -> fzf#install()  }  }
Plug 'junegunn/fzf.vim'
" Plug '/home/king/.fzf/bin/fzf'
call plug#end()

color snazzy

" color gruvbox
" set background=dark
" depends on the terminal transparent
" hi Normal ctermfg=252 ctermbg=none


"""
" vim-go
"""
let g:go_fmt_command = "goimports"
let g:go_def_mapping_enabled = 1
let g:go_doc_keywordprg_enabled = 0


"""
" coc
"""
" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
" inoremap <silent><expr> <TAB>
"       \ pumvisible() ? "\<C-n>" :
"       \ <SID>check_back_space() ? "\<TAB>" :
"       \ coc#refresh()
" inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

inoremap <silent><expr> <TAB>
      \ pumvisible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
" Use <C-l> for trigger snippet expand.
imap <C-l> <Plug>(coc-snippets-expand)

" Use <C-j> for select text for visual placeholder of snippet.
vmap <C-j> <Plug>(coc-snippets-select)

" Use <C-j> for jump to next placeholder, it's default of coc.nvim
let g:coc_snippet_next = '<c-j>'

" Use <C-k> for jump to previous placeholder, it's default of coc.nvim
let g:coc_snippet_prev = '<c-k>'

" Use <C-j> for both expand and jump (make expand higher priority.)
imap <C-j> <Plug>(coc-snippets-expand-jump)

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

let g:coc_snippet_next = '<tab>'

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" coc-highlight
" autocmd CursorHold * silent call CocActionAsync('highlight')
" Use K to show documentation in preview window.
" nnoremap <silent> dK :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)


" Compile function
noremap r :call CompileRunGcc()<CR>
func! CompileRunGcc()
	exec "w"
	if &filetype == 'c'
		exec "!g++ % -o %<"
		exec "!time ./%<"
	elseif &filetype == 'cpp'
		set splitbelow
		exec "!g++ -std=c++11 % -Wall -o %<"
		:sp
		:res -15
		:term ./%<
	elseif &filetype == 'java'
		exec "!javac %"
		exec "!time java %<"
	elseif &filetype == 'sh'
		:!time bash %
	elseif &filetype == 'python'
		set splitbelow
		:sp
		:term python3 %
	elseif &filetype == 'html'
		silent! exec "!".g:mkdp_browser." % &"
	elseif &filetype == 'markdown'
		exec "MarkdownPreview"
	elseif &filetype == 'tex'
		silent! exec "VimtexStop"
		silent! exec "VimtexCompile"
	elseif &filetype == 'dart'
		CocCommand flutter.run
	elseif &filetype == 'go'
		set splitbelow
		:sp
		:term go run %
	endif
endfunc

"""
" startify
"""
let g:startify_custom_footer = [
            \ '+--------------------------------------------------------------------------------------------------------------------------------------+',
            \ '|                                              最簡單的事是堅持，最難的事還是堅持。                                                    |',
            \ '+--------------------------------------------------------------------------------------------------------------------------------------+',
            \]

"""
" nerdtree
"""
" 开启/关闭NERDTree快捷键
nmap ,f :NERDTreeToggle<CR>
" 当NERDTree为剩下的唯一窗口时自动关闭
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
""修改树的显示图标
let g:NERDTreeDirArrowExpandable = '►'
let g:NERDTreeDirArrowCollapsible = '▼'
let NERDTreeAutoCenter=1
let g:NERDTreeGitStatusUseNerdFonts = 1 
let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ "Unknown"   : "?"
    \ }

"""
" nerdtree-syntax-highlight
"""
""""""""""""""""""""""""""""""
"vim-nerdtree-syntax-highlight settings
""""""""""""""""""""""""""""""
"highlight full name (not only icons). you need to add this if you don't have vim-devicons and want highlight.
let g:nerdtreefileextensionhighlightfullname = 1
let g:nerdtreeexactmatchhighlightfullname = 1
let g:nerdtreepatternmatchhighlightfullname = 1

"highlight full name (not only icons). you need to add this if you don't have vim-devicons and want highlight.
let g:nerdtreehighlightfolders = 1

"highlights the folder name
let g:nerdtreehighlightfoldersfullname = 1

"you can add these colors to your .vimrc to help customizing
let s:brown = "905532"
let s:aqua =  "3affdb"
let s:blue = "689fb6"
let s:darkblue = "44788e"
let s:purple = "834f79"
let s:lightpurple = "834f79"
let s:red = "ae403f"
let s:beige = "f5c06f"
let s:yellow = "f09f17"
let s:orange = "d4843e"
let s:darkorange = "f16529"
let s:pink = "cb6f6f"
let s:salmon = "ee6e73"
let s:green = "8faa54"
let s:turquoise = "40e0d0"
let s:lightgreen = "31b53e"
let s:white = "ffffff"
let s:rspec_red = "fe405f"
let s:git_orange = "f54d27"
let s:gray = "808a87"

let g:nerdtreeextensionhighlightcolor = {} " this line is needed to avoid error
let g:nerdtreeextensionhighlightcolor['o'] = s:gray " sets the color of o files to blue
let g:nerdtreeextensionhighlightcolor['h'] = s:blue " sets the color of h files to blue
let g:nerdtreeextensionhighlightcolor['c'] = s:green " sets the color of c files to blue
let g:nerdtreeextensionhighlightcolor['cpp'] = s:green " sets the color of cpp files to blue
let g:nerdtreeextensionhighlightcolor['go'] = s:green " sets the color of c++ files to blue

"""
" Markdown
"""
" let g:vim_markdown_folding_disabled = 1
set conceallevel=2
let g:vim_markdown_toc_autofit = 1
let g:vim_markdown_fenced_languages = ['golang=gl']
let g:vim_markdown_autowrite = 1
let g:vim_markdown_no_default_key_mappings = 1
let g:vim_markdown_toc_autofit = 1


"""
" MarkdownPreview
"""
let g:mkdp_preview_options = {
    \ 'mkit': {},
    \ 'katex': {},
    \ 'uml': {},
    \ 'maid': {},
    \ 'disable_sync_scroll': 0,
    \ 'sync_scroll_type': 'middle',
    \ 'hide_yaml_meta': 1,
    \ 'sequence_diagrams': {},
    \ 'flowchart_diagrams': {}
    \ }
" nmap <C-s> <Plug>MarkdownPreview
" nmap <M-s> <Plug>MarkdownPreviewStop
" nmap <C-p> <Plug>MarkdownPreviewToggle
let g:mkdp_auto_start = 0
let g:mkdp_auto_close = 1
let g:mkdp_command_for_global = 0
let g:mkdp_browserfunc = ''


"""
" markdown write
"""
" 添加锚点
autocmd Filetype markdown inoremap <buffer> <silent> ,, <++>
" 跳转到下一个锚点
autocmd Filetype markdown inoremap <buffer> <silent> ,f <Esc>/<++><CR>:nohlsearch<CR>c4l
" 跳转到锚点并且删除锚点前的空格
autocmd Filetype markdown inoremap <buffer> <silent> ,s <Esc>/ <++><CR>:nohlsearch<CR>c5l
" 分割线
autocmd Filetype markdown inoremap <buffer> <silent> ,- ---<Enter><Enter>
" 粗体
autocmd Filetype markdown inoremap <buffer> <silent> ,b **** <++><Esc>F*hi
" 斜体
autocmd Filetype markdown inoremap <buffer> <silent> ,p ** <++><Esc>F*i
" 行内代码
autocmd Filetype markdown inoremap <buffer> <silent> ,q `` <++><Esc>F`i
" 代码块
autocmd Filetype markdown inoremap <buffer> ,c ``` <++><Enter>```<Enter><Enter><++><Esc>4kA
" todo
autocmd Filetype markdown inoremap <buffer> <silent> ,g - [ ] <Enter><++><ESC>kA
" 下划线
autocmd Filetype markdown inoremap <buffer> <silent> ,u <u></u><++><Esc>F/hi
" 图片
autocmd Filetype markdown inoremap <buffer> ,p ![](<++>) <++><Esc>F[a
" 链接
autocmd Filetype markdown inoremap <buffer> <silent> ,a [](<++>) <++><Esc>F[a
" 标题
autocmd Filetype markdown inoremap <buffer> <silent> ,1 #<Space><Enter><++><Esc>kA
autocmd Filetype markdown inoremap <buffer> <silent> ,2 ##<Space><Enter><++><Esc>kA
autocmd Filetype markdown inoremap <buffer> <silent> ,3 ###<Space><Enter><++><Esc>kA
" 插入时间
autocmd Filetype markdown inoremap <buffer> <silent> ,t <C-R>=strftime("%Y-%m-%d %H:%M:%S")<CR>


"""
" bullets
"""
let g:bullets_enable_in_empty_buffers = 0
let g:bullets_enabled_file_types = [
    \ 'markdown',
    \ 'text',
    \ 'gitcommit',
    \ 'scratch'
    \]


"""
" vim-table-mode
"""
function! s:isAtStartOfLine(mapping)
  let text_before_cursor = getline('.')[0 : col('.')-1]
  let mapping_pattern = '\V' . escape(a:mapping, '\')
  let comment_pattern = '\V' . escape(substitute(&l:commentstring, '%s.*$', '', ''), '\')
  return (text_before_cursor =~? '^' . ('\v(' . comment_pattern . '\v)?') . '\s*\v' . mapping_pattern . '\v$')
endfunction

inoreabbrev <expr> <bar><bar>
          \ <SID>isAtStartOfLine('\|\|') ?
          \ '<c-o>:TableModeEnable<cr><bar><space><bar><left><left>' : '<bar><bar>'
inoreabbrev <expr> __
          \ <SID>isAtStartOfLine('__') ?
          \ '<c-o>:silent! TableModeDisable<cr>' : '__'


"""
" vim-translator
"""
" Leader>w 翻译光标下的文本，在窗口中显示
nmap <silent> <Leader>w <Plug>TranslateW
vmap <silent> <Leader>w <Plug>TranslateWV
let g:translator_default_engines=['bing','youdao']


"""
" rainbow
"""
let g:rainbow_active=1


"""
" vista
"""
function! NearestMethodOrFunction() abort
      return get(b:, 'vista_nearest_method_or_function', '')
endfunction

set statusline+=%{NearestMethodOrFunction()}

" By default vista.vim never run if you don't call it explicitly.
" "
" " If you want to show the nearest function in your statusline
" automatically,
" " you can add the following line to your vimrc
autocmd VimEnter * call vista#RunForNearestMethodOrFunction()
let g:vista_icon_indent = ["╰▸ ", "├▸ "]
let g:vista#render#enable_icon = 1
map <silent> T :Vista<CR>

"""
" LeaderF
"""
let g:Lf_WindowPosition = 'popup'
let g:Lf_PreviewInPopup = 1
let g:Lf_PreviewResult = {'Function': 0, 'BufTag': 0 }


"""
" floaterm
"""
" nnoremap <silent>,t :FloatermToggle<CR>
" tnoremap <silent>,t :FloatermToggle<CR>
let g:floaterm_shell = 'zsh'
let g:floaterm_keymap_new    = '<F7>'
" let g:floaterm_keymap_prev   = '<F8>'
" let g:floaterm_keymap_next   = '<F9>'
let g:floaterm_keymap_toggle = ',t'
" Set floaterm window's background to black
" hi Floaterm guibg=black
" Set floating window border line color to cyan, and background to orange
" hi FloatermBorder guibg=orange guifg=cyan

"""
" Bullets.vim
"""
let g:bullets_enabled_file_types = [
    \ 'markdown',
    \ 'text',
    \ 'gitcommit',
    \ 'scratch'
    \]

"""
" fzf.vim
"""
" Empty value to disable preview window altogether
let g:fzf_preview_window = ''
" Always enable preview window on the right with 60% width
let g:fzf_preview_window = 'right:60%'"
noremap <silent> <C-h> :History<CR>
noremap <silent> <C-p> :Files<CR>
noremap <silent> <C-f> :Rg<CR>
noremap <leader>; :History:<CR>


