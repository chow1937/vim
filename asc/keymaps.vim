"======================================================================
"
" keymaps.vim - keymaps start with using <space>
"
" Created by skywind on 2016/10/12
" Last Modified: 2018/02/10 02:08
"
"======================================================================

"----------------------------------------------------------------------
" VimTools
"----------------------------------------------------------------------
for s:index in range(10)
	let s:button = (s:index > 0)? 'F'.s:index : 'F10'
	exec 'noremap <space>'.s:index.' :VimTool ' . s:index . '<cr>'
	if has('gui_running')
		exec "noremap <C-".s:button."> :VimTool c".s:index . '<cr>'
		exec "inoremap <C-".s:button."> <ESC>:VimTool c".s:index . '<cr>'
	endif
endfor

noremap <F1> :VimTool 1<cr>
noremap <F2> :VimTool 2<cr>
noremap <F3> :VimTool 3<cr>
noremap <F4> :VimTool 4<cr>
inoremap <F1> <ESC>:VimTool 1<cr>
inoremap <F2> <ESC>:VimTool 2<cr>
inoremap <F3> <ESC>:VimTool 3<cr>
inoremap <F4> <ESC>:VimTool 4<cr>


" keymap for VimTool
if (has('gui_running') || has('nvim')) && (has('win32') || has('win64'))
	let s:keys = [')', '!', '@', '#', '$', '%', '^', '&', '*', '(']
	for s:index in range(10)
		let s:name = ''.s:index
		if s:index == 0 | let s:name = '10' | endif
		exec 'noremap <silent><M-'.s:keys[s:index].'> :VimTool '.s:index.'<cr>'
		exec 'inoremap <silent><M-'.s:keys[s:index].'> <ESC>:VimTool '.s:index.'<cr>'
	endfor
else
	" require to config terminal to remap key alt-shift+? to '\033[{0}?~'
	for s:index in range(10)
		let s:name = ''.s:index
		if s:index == 0 | let s:name = '10' | endif
	endfor
endif


"----------------------------------------------------------------------
" window control
"----------------------------------------------------------------------
noremap <silent><space>= :resize +3<cr>
noremap <silent><space>- :resize -3<cr>
noremap <silent><space>, :vertical resize -3<cr>
noremap <silent><space>. :vertical resize +3<cr>

nnoremap <silent><c-w><c-e> :ExpSwitch edit<cr>
nnoremap <silent><c-w>e :ExpSwitch edit<cr>
nnoremap <silent><c-w>m :ExpSwitch vs<cr>
nnoremap <silent><c-w>M :ExpSwitch tabedit<cr>

noremap <silent><space>hh :nohl<cr>
noremap <silent><tab>, :call Tab_MoveLeft()<cr>
noremap <silent><tab>. :call Tab_MoveRight()<cr>
noremap <silent><tab>6 :VinegarOpen leftabove vs<cr>
noremap <silent><tab>7 :VinegarOpen vs<cr>
noremap <silent><tab>8 :VinegarOpen belowright sp<cr>
noremap <silent><tab>9 :VinegarOpen tabedit<cr>
noremap <silent>+ :VinegarOpen edit<cr>

noremap <silent><space>ha :GuiSignRemove
			\ errormarker_error errormarker_warning<cr>

" replace
noremap <space>p viw"0p
noremap <space>y yiw


"----------------------------------------------------------------------
" space + e : vim control
"----------------------------------------------------------------------
noremap <silent><space>eh :call Tools_SwitchSigns()<cr>
noremap <silent><space>en :call Tools_SwitchNumber()<cr>


"----------------------------------------------------------------------
" Movement Enhancement
"----------------------------------------------------------------------
noremap <M-h> b
noremap <M-l> w
noremap <M-j> 10j
noremap <M-k> 10k
noremap <M-J> gj
noremap <M-K> gk
noremap <M-y> d$
inoremap <M-h> <c-left>
inoremap <M-l> <c-right>
inoremap <M-j> <c-\><c-o>10j
inoremap <M-k> <c-\><c-o>10k
inoremap <M-J> <c-\><c-o>gj
inoremap <M-K> <c-\><c-o>gk
inoremap <M-y> <c-\><c-o>d$
cnoremap <M-h> <c-left>
cnoremap <M-l> <c-right>
cnoremap <M-b> <c-left>
cnoremap <M-f> <c-right>


"----------------------------------------------------------------------
" gui hotkeys - alt + ?
"----------------------------------------------------------------------
if has('gui_running') || (has('nvim') && (has('win32') || has('win64')))
	noremap <silent><A-o> :call Open_Browse(2)<cr>
	inoremap <silent><A-o> <ESC>:call Open_Browse(2)<cr>
	noremap <S-cr> o<ESC>
	noremap <c-cr> O<esc>
	noremap <C-S> :w<cr>
	inoremap <C-S> <ESC>:w<cr>
	noremap <M-Left> :call Tab_MoveLeft()<cr>
	noremap <M-Right> :call Tab_MoveRight()<cr>
	inoremap <M-Left> <ESC>:call Tab_MoveLeft()<cr>
	inoremap <M-Right> <ESC>:call Tab_MoveRight()<cr>
	noremap <M-r> :VimExecute run<cr>
	inoremap <M-r> <ESC>:VimExecute run<cr>
	noremap <M-b> :VimBuild emake<cr>
	inoremap <M-b> <ESC>:VimBuild emake<cr>
	noremap <M-a> ggVG
	inoremap <M-a> <ESC>ggVG
	noremap <m-_> :call Change_Transparency(-2)<cr>
	noremap <m-+> :call Change_Transparency(+2)<cr>
	if has('gui_macvim')
		noremap <m-\|> :call Toggle_Transparency(9)<cr>
	else
		noremap <m-\|> :call Toggle_Transparency(15)<cr>
	endif
	if has('win32') || has('win64') || has('win16')
		noremap <silent><m-f> :VimMake -mode=0 -cwd=<root> mingw32-make -f Makefile<cr>
		noremap <silent><m-g> :VimMake -mode=4 -cwd=<root> mingw32-make -f Makefile test<cr>
	else
		noremap <silent><m-f> :VimMake -mode=0 -cwd=<root> make -f Makefile<cr>
		noremap <silent><m-g> :VimMake -mode=4 -cwd=<root> make -f Makefile test<cr>
	endif
endif

nnoremap <m--> za


"----------------------------------------------------------------------
" space + s : svn
"----------------------------------------------------------------------
noremap <space>sc :VimMake svn co -m "update from vim"<cr>
noremap <space>su :VimMake svn up<cr>
noremap <space>st :VimMake svn st<cr>

" editing commands
noremap <space>aa ggVG


"----------------------------------------------------------------------
" space + j : make
"----------------------------------------------------------------------
noremap <silent><space>jj  :VimMake -cwd=<root> make<cr>
noremap <silent><space>jc  :VimMake -cwd=<root> make clean<cr>
noremap <silent><space>jk  :VimMake -mode=4 -cwd=<root> make run<cr>
noremap <silent><space>jl  :VimMake -mode=4 -cwd=<root> make test<cr>
noremap <silent><space>j1  :VimMake -mode=4 -cwd=<root> make t1<cr>
noremap <silent><space>j2  :VimMake -mode=4 -cwd=<root> make t2<cr>
noremap <silent><space>j3  :VimMake -mode=4 -cwd=<root> make t3<cr>
noremap <silent><space>j4  :VimMake -mode=4 -cwd=<root> make t4<cr>
noremap <silent><space>j5  :VimMake -mode=4 -cwd=<root> make t5<cr>
noremap <silent><space>k1  :VimMake -cwd=<root> make t1<cr>
noremap <silent><space>k2  :VimMake -cwd=<root> make t2<cr>
noremap <silent><space>k3  :VimMake -cwd=<root> make t3<cr>
noremap <silent><space>k4  :VimMake -cwd=<root> make t4<cr>
noremap <silent><space>k5  :VimMake -cwd=<root> make t5<cr>

noremap <silent><space>jm :call Tools_SwitchMakeFile()<cr>


"----------------------------------------------------------------------
" space + t : toggle plugins
"----------------------------------------------------------------------
noremap <silent><space>tt :TagbarToggle<cr>
noremap <silent><space>tq :call Toggle_QuickFix(6)<cr>
noremap <silent><space>tb :TagbarToggle<cr>
noremap <silent><space>tf :FuzzyFileSearch<cr>

"noremap <silent><C-F10> :call Toggle_Taglist()<cr>
"inoremap <silent><C-F10> <c-\><c-o>:call Toggle_Taglist()<cr>
noremap <silent><S-F10> :call quickmenu#toggle(0)<cr>
inoremap <silent><S-F10> <ESC>:call quickmenu#toggle(0)<cr>
noremap <silent><M-;> :call asclib#preview_tag(expand("<cword>"))<cr>
noremap <silent><M-:> :call asclib#preview_close()<cr>
noremap <silent><tab>; :call asclib#preview_goto('')<cr>
noremap <silent><tab>: :call asclib#preview_goto('tab')<cr>

if has('autocmd')
	function! s:update_tags()
		let names = []
		let name = expand('~/.vim/tags/'. &filetype .'.tags')
		if filereadable(name)
			let &l:tags = &g:tags . ',' . name
		endif
	endfunc
	function! s:quickfix_keymap()
		if &buftype != 'quickfix'
			return
		endif
		nnoremap <silent><buffer> p :call asclib#preview_quickfix(0)<cr>
		nnoremap <silent><buffer> u :call asclib#quickfix_switch(0, 'bottom')<cr>
		setlocal nonumber
	endfunc
	function! s:insert_leave()
		if get(g:, 'echodoc#enable_at_startup') == 0
			set showmode
		endif
	endfunc
	augroup AscQuickfix
		autocmd!
		autocmd FileType qf call s:quickfix_keymap()
		autocmd FileType * call s:update_tags()
		autocmd InsertLeave * call s:insert_leave()
		" autocmd InsertLeave * set showmode
	augroup END
endif

nnoremap <silent><m-a> :call asclib#function_echo(0)<cr>
inoremap <silent><m-a> <c-\><c-o>:call asclib#function_echo(1)<cr>
"inoremap <silent><c-^> <c-\><c-o>:call asclib#function_echo(1)<cr>
"nnoremap <silent><m-/> :call asclib#function_echo()<cr>


"----------------------------------------------------------------------
" GUI/Terminal
"----------------------------------------------------------------------
noremap <silent><M-[> :call Tools_QuickfixCursor(2)<cr>
noremap <silent><M-]> :call Tools_QuickfixCursor(3)<cr>
noremap <silent><M-{> :call Tools_QuickfixCursor(4)<cr>
noremap <silent><M-}> :call Tools_QuickfixCursor(5)<cr>
noremap <silent><M-u> :call Tools_PreviousCursor(6)<cr>
noremap <silent><M-d> :call Tools_PreviousCursor(7)<cr>

inoremap <silent><M-[> <c-\><c-o>:call Tools_QuickfixCursor(2)<cr>
inoremap <silent><M-]> <c-\><c-o>:call Tools_QuickfixCursor(3)<cr>
inoremap <silent><M-{> <c-\><c-o>:call Tools_QuickfixCursor(4)<cr>
inoremap <silent><M-}> <c-\><c-o>:call Tools_QuickfixCursor(5)<cr>
inoremap <silent><M-u> <c-\><c-o>:call Tools_PreviousCursor(6)<cr>
inoremap <silent><M-d> <c-\><c-o>:call Tools_PreviousCursor(7)<cr>


"----------------------------------------------------------------------
" space + f : open tools
"----------------------------------------------------------------------
noremap <silent><space>fd :call Open_Dictionary("<C-R>=expand("<cword>")<cr>")<cr>
noremap <silent><space>fm :!man -S 3:2:1 "<C-R>=expand("<cword>")<CR>"<CR>
noremap <silent><space>fh :call Open_HeaderFile(1)<cr>
noremap <silent><space>ff :call Open_Explore(-1)<cr>
noremap <silent><space>ft :call Open_Explore(0)<cr>
noremap <silent><space>fe :call Open_Explore(1)<cr>
noremap <silent><space>fo :call Open_Explore(2)<cr>
noremap <silent><space>fb :TagbarToggle<cr>
noremap <silent><space>fp :call Tools_Pydoc("<C-R>=expand("<cword>")<cr>", 1)<cr>
noremap <silent><space>fs :mksession! ~/.vim/session.txt<cr>
noremap <silent><space>fl :so ~/.vim/session.txt<cr>

set ssop-=options    " do not store global and local values in a session
set ssop-=folds      " do not store folds

for s:index in range(5)
	exec 'noremap <silent><space>f'.s:index.'s :mksession! ~/.vim/session.'.s:index.'<cr>'
	exec 'noremap <silent><space>f'.s:index.'l :so ~/.vim/session.'.s:index.'<cr>'
endfor


"----------------------------------------------------------------------
" leader + b/c : buffer
"----------------------------------------------------------------------
noremap <silent><leader>bc :BufferClose<cr>
noremap <silent><leader>cw :call Change_DirectoryToFile()<cr>


"----------------------------------------------------------------------
" space + h : fast open files
"----------------------------------------------------------------------
noremap <space>hp :FileSwitch tabe ~/.vim/project.txt<cr>
noremap <space>hl :FileSwitch tabe ~/.vim/cloud/Documents/agenda.otl<cr>
noremap <space>hf <c-w>gf
noremap <space>he :call Show_Explore()<cr>
noremap <space>hb :FileSwitch tabe ~/.vim/bundle.vim<cr>
noremap <space>hq :FileSwitch tabe ~/.vim/quicknote.txt<cr>
noremap <space>hd :FileSwitch tabe ~/Dropbox/Documents/notes.txt<cr>
noremap <space>ho :FileSwitch tabe ~/.vim/cloud/Documents/cloudnote.txt<cr>
noremap <space>h; :call asclib#owncloud_sync()<cr>

if (!has('nvim')) && (has('win32') || has('win64'))
	noremap <space>hr :FileSwitch tabe ~/_vimrc<cr>
elseif !has('nvim')
	noremap <space>hr :FileSwitch tabe ~/.vimrc<cr>
else
	noremap <space>hr :FileSwitch tabe ~/.config/nvim/init.vim<cr>
endif

let s:filename = expand('<sfile>:p')
exec 'nnoremap <space>hk :FileSwitch tabe '.fnameescape(s:filename).'<cr>'
let s:skywind = fnamemodify(s:filename, ':h:h'). '/skywind.vim'
exec 'nnoremap <space>hs :FileSwitch tabe '.fnameescape(s:skywind).'<cr>'
let s:bundle = fnamemodify(s:filename, ':h:h'). '/bundle.vim'
exec 'nnoremap <space>hv :FileSwitch tabe '.fnameescape(s:bundle).'<cr>'
let s:asclib = fnamemodify(s:filename, ':h:h'). '/autoload/asclib.vim'
exec 'nnoremap <space>hc :FileSwitch tabe '.fnameescape(s:asclib).'<cr>'
let s:auxlib = fnamemodify(s:filename, ':h:h'). '/autoload/auxlib.vim'
exec 'nnoremap <space>hu :FileSwitch tabe '.fnameescape(s:auxlib).'<cr>'
let s:nvimrc = expand("~/.config/nvim/init.vim")
if has('win32') || has('win16') || has('win95') || has('win64')
	let s:nvimrc = expand("~/AppData/Local/nvim/init.vim")
endif
exec 'nnoremap <space>hn :FileSwitch tabe '.fnameescape(s:nvimrc).'<cr>'


"----------------------------------------------------------------------
" space + g : misc
"----------------------------------------------------------------------
nnoremap <space>gr :%s/\<<C-r><C-w>\>//gc<Left><Left><Left>
nnoremap <space>gq :AsyncStop<cr>
nnoremap <space>gQ :AsyncStop!<cr>
nnoremap <space>gj :%!python -m json.tool<cr>
nnoremap <space>gg :setlocal ts=8 sts=4 sw=4 et<cr>
nnoremap <space>gG :setlocal ts=4 sts=4 sw=4 noet<cr>
nnoremap <silent><space>gf :call Tools_QuickfixCursor(3)<cr>
nnoremap <silent><space>gb :call Tools_QuickfixCursor(2)<cr>

noremap <silent><space>g; :call asclib#preview_tag(expand("<cword>"))<cr>
noremap <silent><space>g: :call asclib#preview_close()<cr>
noremap <silent><space>g' :call asclib#preview_goto('')<cr>
noremap <silent><space>g" :call asclib#preview_goto('tab')<cr>

if has('win32') || has('win64')
	noremap <space>gc :silent !start cmd.exe<cr>
	noremap <space>gs :silent !start powershell.exe<cr>
	noremap <space>ge :silent !start /b cmd.exe /C start .<cr>
else
endif


"----------------------------------------------------------------------
" linting
"----------------------------------------------------------------------
noremap <silent><space>lp :call asclib#lint_pylint('')<cr>
noremap <silent><space>lf :call asclib#lint_flake8('')<cr>
noremap <silent><space>ls :call asclib#lint_splint('')<cr>
noremap <silent><space>lc :call asclib#lint_cppcheck('')<cr>
noremap <silent><space>lg :call asclib#open_gprof('', '')<cr>
noremap <silent><space>lt :call asclib#html_prettify()<cr>


"----------------------------------------------------------------------
" more personal in gvim
"----------------------------------------------------------------------
if has('gui_running') && (has('win32') || has('win64'))
	noremap <S-F11> :VimMake -mode=4 -cwd=$(VIM_FILEDIR) -save=1 d:\\dev\\python36\\python.exe "$(VIM_FILENAME)"<cr>
	inoremap <S-F11> <ESC>:VimMake -mode=4 -cwd=$(VIM_FILEDIR) d:\\dev\\python36\\python.exe "$(VIM_FILENAME)"<cr>
	noremap <S-F12> :VimMake -mode=4 -save=1 -cwd=$(VIM_FILEDIR) d:\\dev\\python64\\python.exe "$(VIM_FILENAME)"<cr>
endif

noremap <C-F10> :VimBuild gcc -pg<cr>

if has('gui_running') && 0
	noremap <silent> <m-U> :call asclib#smooth_scroll_up(&scroll, 0, 4)<CR>
	noremap <silent> <m-D> :call asclib#smooth_scroll_down(&scroll, 0, 4)<CR>
endif



"----------------------------------------------------------------------
" g command
"----------------------------------------------------------------------
nnoremap gb :YcmCompleter GoToDeclaration<CR>
nnoremap gl :YcmCompleter GoToDefinition<CR>
nnoremap gx :YcmCompleter GoToDefinitionElseDeclaration<CR>
nnoremap gy :YcmCompleter GoToReferences<CR>


"----------------------------------------------------------------------
" vimmake faster
"----------------------------------------------------------------------
noremap <silent><F12> :call quickmenu#toggle(0)<cr>
inoremap <silent><F12> <ESC>:call quickmenu#toggle(0)<cr>
noremap <silent><F11> :call quickmenu#toggle(1)<cr>
inoremap <silent><F11> <ESC>:call quickmenu#toggle(1)<cr>

noremap <silent><c-f10> :call quickmenu#toggle(1)<cr>
inoremap <silent><c-f10> <ESC>:call quickmenu#toggle(1)<cr>
noremap <silent><c-f11> :call quickmenu#toggle(2)<cr>
inoremap <silent><c-f11> <ESC>:call quickmenu#toggle(2)<cr>
noremap <silent><c-s-f12> :call asclib#common#script_menu()<cr>
inoremap <silent><c-s-f12> <ESC>:call asclib#common#script_menu()<cr>

nnoremap <silent>g1 :GrepCode <C-R>=expand("<cword>")<cr><cr>
nnoremap <silent>g2 :GrepCode! <C-R>=expand("<cword>")<cr><cr>
nnoremap <silent>g3 :VimScope g <C-R>=expand("<cword>")<cr><cr>
nnoremap <silent>g4 :VimScope s <C-R>=expand("<cword>")<cr><cr>
nnoremap <silent>g5 :call asclib#preview_tag(expand("<cword>"))<cr>
nnoremap <silent>g6 :call vimmake#update_tags('!', 'cs', '.cscope')<cr>
nnoremap <silent>g7 :call vimmake#update_tags('!', 'py', '.cscopy')<cr>
nnoremap <silent>g9 :call vimmake#update_tags('!', 'ctags', '.tags')<cr>

nnoremap <silent><space>ww :call asclib#touch_file('wsgi')<cr>


"----------------------------------------------------------------------
" others
"----------------------------------------------------------------------
nnoremap <silent><space>at :MyCheatSheetAlign<cr>
vnoremap <silent><space>at :MyCheatSheetAlign<cr>




