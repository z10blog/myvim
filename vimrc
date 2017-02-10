set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Bundle 'scrooloose/nerdtree'
Bundle 'vim-scripts/indentpython.vim'
Bundle 'davidhalter/jedi-vim'
Bundle 'altercation/vim-color-solarized'
call vundle#end()



" 不使用vi的键盘模式
" set nocompatible

"语法高亮
set syntax=on
" 配色方案
set background=dark
colorscheme solarized
" 在处理未保存或只读文件时，弹出确认
set confirm

" 自动缩进
set autoindent
set cindent

" 自动换行
set wrap

" 整词换行
set linebreak

" Tab建的宽度
set tabstop=4

" 统一缩进为4
set softtabstop=4
set shiftwidth=4

" 不要使用空格代替制表符
set noexpandtab

" 在行和段开始处使用制表符
set smarttab

" 显示行号
set number

" 突出显示当前行
set cursorline

" 历史记录数
set history=1000

" 禁止生成临时文件
set nobackup
set noswapfile

"搜索忽略大小写
set ignorecase

" 搜索逐字符高亮
set hlsearch
set incsearch

" 行内替换
set gdefault

" 编码设置
set enc=utf-8
set fencs=utf-8,ucs-bom,shift-jis,gb18030,gbk,gbk2312,cp936

" 语言设置
set helplang=cn
set encoding=utf-8
set langmenu=zh_CN.UTF-8
set imcmdline
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim

" 字体设置
set guifont=Liberation\ Mono\ 12

" 状态栏内容
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%l,%v][%p%%]\ %{strftime(\"%d/%m/%y\ -\ %H:%M\")}

" 总是显示状态栏
set laststatus=2

" 在编辑过程中，在右下角显示光标位置的状态
set ruler

" 命令行（在状态行下）的高度，默认为1,这里是2
set cmdheight=2

" 隐藏工具栏
set guioptions-=T

" 隐藏滚动条
set guioptions-=r

" 开启新行时使用智能自动缩进
set smartindent
" 侦测文件类型
filetype on

" 载入文件类型插件
filetype plugin on

" 为特定文件类型载入相关缩进文件
filetype indent on

" 保存全局变量
set viminfo+=!

" 带有如下符号的单词不要被换行分割
set iskeyword+=_,$,@,%,#,-

" 字符间插入的像素行数目
set linespace=0

" 增强模式中的命令行自动完成操作
set wildmenu

" 使回格键正常处理indent,eol,start
set backspace=indent,eol

" 允许backspace和光标键跨越行边界
set whichwrap+=<,>,h,l

" 可以在buffer的任何地方使用鼠标(类似Office中在工作区双击鼠标定位)
set mouse=a
set selection=exclusive
set selectmode=mouse,key

" 通过使用:commands命令，告诉我们文件的那一行被修改过
set report=0

" 启动的时候不显示那个援助索马里儿童的提示
" set hortmess=atl

" 在被分割的窗口间显示空白，便于阅读
" set fillchars=vert:\,stl:\,stlnc:\

" 高亮显示匹配的括号
set showmatch

" 匹配括号高亮的时间（单位是十分之一秒）
set matchtime=5

" 光标移动到buffer的顶部和底部时保持3行距离
set scrolloff=3

" 为c程序提供自动缩进
set smartindent

" 用空格键来开关折叠
set foldenable
set foldmethod=manual
nnoremap<space>@=((foldclosed(line('.'))<0)?'zc':'zo')<CR>

" NERDTree 插件
" 启动vim时自动打开NERDTree
autocmd VimEnter * NERDTree

" 打开与关闭侧边栏
map <F2> :NERDTreeToggle<CR>
" 显示侧边栏行号
let NERDTreeShowLineNumbers=1
let NERDTreeAutoCenter=1
" 设置侧边栏宽度
let NERDTreeWinSize=31
" 在终端启动vim时，共享NERDTree
let g:nerdtree_tabs_open_on_console_startup=1
" 忽略一下文件的显示
let NERDTreeIgnore=['\.pyc','\~$','\.swp']
" 显示书签列表
let NERDTreeShowBookmarks=1

" 将NERDTree 的窗口设置在vim窗口的右侧（默认为左侧)
let NERDTreeWinPos="left"

