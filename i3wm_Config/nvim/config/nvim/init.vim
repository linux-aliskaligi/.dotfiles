set encoding=utf8
set guifont=DroidSansMono\ Nerd\ Font\ 11
set shell=zsh
set clipboard+=unnamedplus
set smartindent
set number
set relativenumber

call plug#begin("~/.vim/plugged")
" Plugin Section
	Plug 'dracula/vim'
	Plug 'scrooloose/nerdtree'
	Plug 'ryanoasis/vim-devicons'	
	Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
	Plug 'junegunn/fzf.vim'
	Plug 'yuezk/vim-js'
	Plug 'maxmellon/vim-jsx-pretty'
	" React Snippets
	Plug 'epilande/vim-es2015-snippets'
	Plug 'epilande/vim-react-snippets'
	Plug 'SirVer/ultisnips'
	
	Plug 'neoclide/coc.nvim', {'branch': 'release'}

	Plug 'tpope/vim-commentary'
	Plug 'alvan/vim-closetag'
	Plug 'astrand/xclip'
	" Plug 'ActivityWatch/aw-watcher-vim'
	Plug 'airblade/vim-gitgutter'
	Plug 'vim-airline/vim-airline'
	Plug 'vim-airline/vim-airline-themes'
        Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
	Plug 'tpope/vim-fugitive'
	Plug 'digitaltoad/vim-pug'
call plug#end()
"Coc
	let g:coc_global_extensions = ['coc-snippets', 'coc-pairs', 'coc-emmet', 'coc-css', 'coc-html', 'coc-json', 'coc-prettier', 'coc-tsserver']
"Git Gutter
	let g:gitgutter_enabled = 1
	nmap ghp <Plug>(GitGutterPreviewHunk)

"md reader
	let g:mkdp_browser = 'firefox'
	nmap <C-M-d> <Plug>MarkdownPreview
	nmap <C-M-a> <Plug>MarkdownPreviewToggle
"Config Section
	if (has("termguicolors"))
		set termguicolors
	endif
	syntax enable
	colorscheme dracula

	let g:NERDTreeShowHidden = 1
	let g:NERDTreeMinimalUI = 1
	let g:NERDTreeIgnore = []
	let g:NERDTreeStatusline = ''
	
" Trigger configuration (Optional)
	let g:UltiSnipsExpandTrigger="<C-l>"
 
" Automaticaly close nvim if NERDTree is only thing left open
	autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Toggle
	nnoremap <silent> <C-b> :NERDTreeToggle<CR>

" open new split panes to right and below
	set splitright
	set splitbelow

" turn terminal to normal mode with escape
	tnoremap <Esc> <C-\><C-n>

" start terminal in insert mode
	au BufEnter * if &buftype == 'terminal' | :startinsert | endif

" open terminal on ctrl+n
	function! OpenTerminal()
	split term://zsh
	resize 10
	endfunction
	nnoremap <c-n> :call OpenTerminal()<CR>
	
" use alt+hjkl to move between split/vsplit panels
	tnoremap <A-h> <C-\><C-n><C-w>h
	tnoremap <A-j> <C-\><C-n><C-w>j
	tnoremap <A-k> <C-\><C-n><C-w>k
	tnoremap <A-l> <C-\><C-n><C-w>l
	nnoremap <A-h> <C-w>h
	nnoremap <A-j> <C-w>j
	nnoremap <A-k> <C-w>k
	nnoremap <A-l> <C-w>l

" file sarching
	nnoremap <C-p> :FZF<CR>
	let g:fzf_action = {
	  \ 'ctrl-t': 'tab split',
	  \ 'ctrl-s': 'split',
	  \ 'ctrl-v': 'vsplit'
	  \}
	let $FZF_DEFAULT_COMMAND = 'rg --files --follow --no-ignore-vcs --hidden -g "!{node_modules/*,.git/**,.next/*}"'
" go to definition
	nnoremap gd :YcmCompleter GoTo<CR>
	nnoremap gd :call CocActionAsync('jumpDefinition')<CR>

" Highlight symbol under cursor on CursorHold
	autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
	nmap <F2> <Plug>(coc-rename)

" Save
	nnoremap <C-s> :w <CR>
" New tab
	nnoremap <C-t> :tabnew <CR>:terminal<CR>:startinsert<CR>
" Replace all is aliased to S.
	nnoremap S :%s//g<Left><Left>
" Auto completion TAB
	inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

let g:closetag_filenames = '*.html,*.xhtml,*.phtml'
let g:closetag_xhtml_filenames = '*.xhtml,*.jsx'
let g:closetag_filetypes = 'html,xhtml,phtml'
let g:closetag_xhtml_filetypes = 'xhtml,jsx'
let g:closetag_emptyTags_caseSensitive = 1
let g:closetag_shortcut = '>'
let g:closetag_close_shortcut = '<leader>>'
let g:closetag_regions = {
    \ 'typescript.tsx': 'jsxRegion,tsxRegion',
    \ 'javascript.jsx': 'jsxRegion',
    \ 'typescriptreact': 'jsxRegion,tsxRegion',
    \ 'javascriptreact': 'jsxRegion',
    \ }


command! -nargs=0 Prettier :CocCommand prettier.formatFile

