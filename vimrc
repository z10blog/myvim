set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
highlight SyntasticErrorSign guifg=white guibg=black
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'tmhedberg/SimpylFold'
Plugin 'Yggdroot/indentLine'
Plugin 'davidhalter/jedi-vim'
Plugin 'lambdalisue/vim-pyenv',{
			\ 'depends': ['davidhalter/jedi-vim'],
			\ 'autoload': {
			\ 'filetypes': ['python','python3'],
			\}}
" Plugin 'Valloric/YouCompleteMe'
call vundle#end()            " required
filetype plugin indent on    " required
" 开启语法高亮
syntax enable
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" 解决backspace不能删除tab和默认兼容模式
set backspace=indent,eol,start
" <Leader> 键设置
let mapleader = "\<Space>"
" 使用<Space>s 进入Vim 编辑模式
nnoremap <Leader>v V
" <Space>w 写入文件（保存)
nnoremap <Leader>w :w<CR>

nnoremap <CR> G
" 显示行号
set number

" 总是显示状态栏
set laststatus=2
set ruler
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%l,%v][%p%%]\ %{strftime(\"%y/%m/%d\ -\ %H:%M\")}

" tab宽度
set tabstop=2
set softtabstop=2
set shiftwidth=2
" 距离顶部和底部5行
set scrolloff=5
" 自动缩进
set autoindent
set cindent
" 自动换行
set wrap
" 开启新行时使用智能自动缩进
set smartindent

set splitbelow
set splitright

" 突出显示当前行
set cursorline
" 突出显示当前列
set cursorcolumn
" 高亮显示匹配的括号
set showmatch
" 匹配括号高亮的时间（单位是十分之一秒)
set matchtime=5
" 历史记录数
set history=100
"禁止生成临时文件
set nobackup
set noswapfile
" 设置编码
set encoding=utf-8
" 设置字体
set guifont=Liberation\ Mono\ 12

" 可以在buffer的任何地方使用鼠标
set mouse=a
set selection=exclusive
set selectmode=mouse,key
" NERDTree
autocmd vimenter * NERDTree
map <F2> :NERDTreeToggle<CR>
" 显示侧边栏行号
let NERDTreeShowLineNumbers=1
let NERDTreeAtuoCenter=1
" 设置侧边栏宽度
let NERDTreeWinSize=31
" 在终端启动时，共享NERDTree
let g:nerdtree_tabs_open_on_console_startup=1
" 忽略一下格式文件的显示
let NERDTreeIgnore=['\.pyc','\~$','\.swp']
" 显示书签列表
let NERDTreeShowBookmarks=1
" 将NERDTree窗口显示在右侧，默认在左侧
let NERDTreeWinPos="left"
nnoremap <Leader>j <C-W><C-J>
nnoremap <Leader>k <C-W><C-K>
nnoremap <Leader>l <C-W><C-L>
nnoremap <Leader>h <C-W><C-H>
" indentLine配置
let g:indentLine_color_term = 239
let g:indentLine_color_gui = '#256A09'
let g:indentLine_color_tty_light = 7
let g:indentLine_color_dark = 1
" 代码折叠
set foldmethod=indent
set foldlevel=99
let g:SimpylFold_docstring_preview=1
" <Space> + <Space> 按两次空格键
nnoremap <Leader><space> za

au BufNewFile,BufRead *.py
	\ set tabstop=4 |
	\ set softtabstop=4 |
	\ set shiftwidth=4 |
	\ set textwidth=79 |
	\ set expandtab |
	\ set autoindent |
	\ set fileformat=unix

au BufNewFile,BufRead *.js, *.html, *.css
	\ set tabstop=2 |
	\ set softtabstop=2 |
	\ set shiftwidth=2

" 显示多余空字符
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match Error /\s\+$/

" Jedi-vim 配置
let g:jedi#auto_initialization = 1
let g:jedi#auto_vim_configuration = 1
let g:jedi#use_tabs_not_buffers = 1
let g:jedi#popup_on_dot = 1
let g:jedi#popup_select_first = 1
let g:jedi#show_call_signatures = "1"
let g:jedi#goto_command = "<Leader>d"
let g:jedi#goto_assignments_command = "<Leader>g"
let g:jedi#goto_definitions_command = ""
let g:jedi#docmentation_command = "K"
let g:jedi#usages_command = "<Leader>n"
let g:jedi#completions_command = "<C-Space>"
let g:jedi#rename_command = "<Leader>r"

" vim-pyenv
if jedi#init_python()
	function! s:jedi_auto_force_py_version() abort
		let major_version = pyenv#python#get_internal_major_version()
		call jedi#force_py_version(major_version)
	endfunction
	augroup vim-pyenv-custom-augroup
		autocmd! *
		autocmd User vim-pyenv-activate-post call s:jedi_auto_force_py_version()
		autocmd User vim-pyenv-deactivate-post call s:jedi_auto_force_py_version()
	augroup END
endif

"if has('python')
"		let g:loaded_jedi = 1
"py << EOF
"import os.path
"import sys
"import vim
"if 'VIRTUAL_ENV' in os.environ:
"    project_base_dir = os.environ['VIRTUAL_ENV']
"    sys.path.insert(0, project_base_dir)
"    activate = os.path.join(project_base_dir, 'bin/activate')
"    execfile(activate, dict(__file__=activate))
"EOF
"endif
"
"
"vim:tw=78:fo=tcq2mM:ts=8:ft=help:norl
