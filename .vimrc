syntax on 
:set number
:set background=dark
:set mouse=a
:set whichwrap=b,s,[,],<,>
:set virtualedit=block
:set  tabstop=2
:set hlsearch
set backspace=indent,eol,start
highlight LineNr ctermfg=blue

" 全角スペースの表示
""""""""""""""""""""""""""""""
function! ZenkakuSpace()
    highlight ZenkakuSpace cterm=underline ctermfg=lightblue guibg=darkgray
endfunction

if has('syntax')
	augroup ZenkakuSpace
		autocmd!
		autocmd ColorScheme * call ZenkakuSpace()
		autocmd VimEnter,WinEnter,BufRead * let w:m1=matchadd('ZenkakuSpace', '　')
	augroup END
	call ZenkakuSpace()
endif"
"""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""
" 自動的に閉じ括弧を入力
""""""""""""""""""""""""""""""
imap { {}<LEFT>
imap [ []<LEFT>
imap ( ()<LEFT>
""""""""""""""""""""""""""""""

" -------------------------------
" NeoBundle
" -------------------------------
if has('vim_starting')
  if &compatible
    set nocompatible
  endif

  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#begin(expand('~/.vim/bundle'))

NeoBundleFetch 'Shougo/neobundle.vim'

NeoBundle 'mattn/emmet-vim'


" コード補完
NeoBundle 'Shougo/neocomplete.vim'
NeoBundle 'marcus/rsense'
NeoBundle 'supermomonga/neocomplete-rsense.vim'

" ドキュメント参照
NeoBundle 'thinca/vim-ref'
NeoBundle 'yuku-t/vim-ref-ri'

" 自動で閉じる
NeoBundle 'tpope/vim-endwise'

call neobundle#end()

NeoBundleCheck

" -------------------------------
" Rsense
" -------------------------------
let g:rsenseHome = '/usr/local/lib/rsense-0.3'
let g:rsenseUseOmniFunc = 1

" --------------------------------
" neocomplete.vim
" --------------------------------
let g:acp_enableAtStartup = 0
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_smart_case = 1
if !exists('g:neocomplete#force_omni_input_patterns')
  let g:neocomplete#force_omni_input_patterns = {}
endif
let g:neocomplete#force_omni_input_patterns.ruby = '[^.*\t]\.\w*\|\h\w*::'

" --------------------------------
" rubocop
" --------------------------------
" syntastic_mode_mapをactiveにするとバッファ保存時にsyntasticが走る
" active_filetypesに、保存時にsyntasticを走らせるファイルタイプを指定する
let g:syntastic_mode_map = { 'mode': 'passive', 'active_filetypes': ['ruby'] }
let g:syntastic_ruby_checkers = ['rubocop']

" --------------------------------
" 基本設定
" --------------------------------
" vim内部で使われる文字エンコーディングをutf-8に設定する
set encoding=utf-8

" 想定される改行コードの指定する
set fileformats=unix,dos,mac

" 新しい行を開始したとき、新しい行のインデントを現在行と同じにする
set autoindent

" ファイル形式の検出の有効化する
" ファイル形式別プラグインのロードを有効化する
" ファイル形式別インデントのロードを有効化する
filetype plugin indent on
