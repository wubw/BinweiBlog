
Vi: Configuration Example
=============================

.. post:: Apr 8, 2017
   :tags: vi
   :category: ComputerScience

Written by Binwei@Oslo

Among various text editors, I like Vi a lot. It help me a lot if I work on various operating systems and different environment since Vi is installed by default on most operating systems.

There is GUI Vi tool available on Windows called Gvim, which can be downloaded from here:

http://www.vim.org/download.php

The configuration file is named as _vimrc which is located around %ProgramFiles(x86)%\Vim. Just open and edit the _vimrc file, but you need to restart Gvim to see the changes.

The following settings will be very helpful but not set-on by default.

If the GUI is not English, you can add following content in _vimrc
set langmenu=en_US
let $LANG = 'en_US'
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim
Set to auto read when a file is changed from the outside
set autoread
Ignore case when searching
set ignorecase
Set the dark scheme
colorscheme desert
set background=dark
Set utf8 as standard encoding
set encoding=utf8
Turn backup off
set nobackup
set nowb
set noswapfile
Set the tab stop
set tabstop=4
Set the auto indent
set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines
Display line numbers on the left
set number
Set the font
set guifont=courier_new:h12
Maximize the window on startup
::
if has("gui_running")
" GUI is running or is about to start.
" Maximize gvim window (for an alternative on Windows, see simalt below).
set lines=999 columns=999
else
" This is console Vim.
if exists("+lines")
set lines=50
endif
if exists("+columns")
set columns=100
endif
endif

Easy approach is to get the example _vimrc file from: https://github.com/wubw/DevScripts/blob/master/_vimrc



