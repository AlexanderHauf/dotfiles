let mapleader =","

if ! filereadable(expand('~/.config/nvim/autoload/plug.vim'))
	echo "Downloading junegunn/vim-plug to manage plugins..."
	silent !mkdir -p ~/.config/nvim/autoload/
	silent !curl "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim" > ~/.config/nvim/autoload/plug.vim
endif

call plug#begin('~/.config/nvim/plugged')
"Plug 'tpope/vim-surround' "parentheses , brackets formating
"Plug 'scrooloose/nerdtree' "file system explorer
Plug 'jreybert/vimagit' "performe git operations in vim
Plug 'bling/vim-airline' "Statusline
Plug 'vim-airline/vim-airline-themes'
Plug 'jreybert/vimagit' " Git in vim
"Plug 'vifm/vifm.vim' "Mutt Shortcuts
Plug 'xuhdev/vim-latex-live-preview', { 'for': 'tex' } "Compile and preview LaTeX documents
Plug 'kovetskiy/sxhkd-vim' "Syntaxhighlighting for SXHKD
Plug 'neoclide/coc.nvim', {'branch': 'release'} "Syntaxcompletion LaTeX
"Plug 'rhysd/vim-clang-format' "Clang formating
Plug 'junegunn/fzf', { 'dir': '~/.install/fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-commentary'
Plug 'arcticicestudio/nord-vim'
Plug 'altercation/vim-colors-solarized'
"Plug 'clangd/coc-clangd', {'do': 'yarn install --frozen-lockfile'}
"Plug 'fannheyward/coc-texlab', {'do': 'yarn install --frozen-lockfile'}
"Plug 'neoclide/coc-python', {'do': 'yarn install --frozen-lockfile'}
"Plug 'josa42/coc-sh', {'do': 'yarn install --frozen-lockfile'}
call plug#end()

"" colorscheme
    colorscheme nord
    set bg=light

"colorscheme solarized
    "set bg=dark
    "syntax enable

"" set indents
    set expandtab
    set shiftwidth=2

"" Some basics:
    set go=a
    set mouse=a	"in vim kopierte Sachen außerhalb auch zugänglich machen
    set nohlsearch	"Suche
    set clipboard=unnamedplus

    nnoremap c "_c  
    "yank something after delting
    set nocompatible
    filetype plugin on
    syntax on
    set encoding=utf-8
    set number
    "set number relativenumber

" Enable autocompletion:
    set wildmode=longest,list,full
" Disables automatic commenting on newline:
    autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
" no tex indent
    let g:tex_indent_items=0
    let g:tex_indent_and=0
    let g:tex_indent_brace=0
" Ensure files are read as what I want:
    let g:vimwiki_ext2syntax = {'.Rmd': 'markdown', '.rmd': 'markdown','.md': 'markdown', '.markdown': 'markdown', '.mdown': 'markdown'}
    let g:vimwiki_list = [{'path': '~/vimwiki', 'syntax': 'markdown', 'ext': '.md'}]
    autocmd BufRead,BufNewFile /tmp/calcurse*,~/.calcurse/notes/* set filetype=markdown
    autocmd BufRead,BufNewFile *.ms,*.me,*.mom,*.man set filetype=groff
    autocmd BufRead,BufNewFile *.tex set filetype=tex

"Map Esc to CapsLock
    au VimEnter * silent! !xmodmap -e 'clear Lock' -e 'keycode 0x42 = Escape'
    au VimLeave * silent! !xmodmap -e 'clear Lock' -e 'keycode 0x42 = Caps_Lock'

" Spell-check set to <leader>o, 'o' for 'orthography':
    map <leader>o :setlocal spell! spelllang=de_de<CR>

" Check file in shellcheck:
    map <leader>s :!clear && shellcheck %<CR>

" Compile document, be it groff/LaTeX/markdown/etc.
    map <leader>c :w! \| !~/.config/nvim/compiler <c-r>%<CR>

    map <leader>cc :LLPStartPreview<Enter>
    inoremap <leader>cc <Esc>:LLPStartPreview<Enter>a

" Update time: used for COC and latex preview
    set updatetime=300

" Open corresponding .pdf/.html or preview
    map <leader>p :!~/.config/nvim/opout <c-r>%<CR><CR>

" Copy selected text to system clipboard (requires gvim/nvim/vim-x11 installed):
    vnoremap <C-c> "+y
    map <C-p> "+P

" Navigating with guides
    inoremap <leader><leader> <Esc>/<++><Enter>"_4cl
    vnoremap <leader><leader> <Esc>/<++><Enter>"_4c
    map <leader><leader> <Esc>/<++><Enter>"_4c

"""COC
" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
if has('patch8.1.1068')
  " Use `complete_info` if your (Neo)Vim version supports it.
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  imap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif


"""LATEX
    " Word count:
    autocmd FileType tex map <leader>w :wi
    " Code snippets
    "autocmd FileType tex inoremap ,fr \begin{frame}<Enter>\frametitle{}<Enter><Enter><++><Enter><Enter>\end{frame}<Enter><Enter><++><Esc>6kf}i
    autocmd FileType tex inoremap ,bf \textbf{}<++><Esc>T{i
    "autocmd FileType tex inoremap ,del <Esc>T\dwdwdwdwdw
    autocmd FileType tex inoremap ,it \textit{}<++><Esc>T{i
    autocmd FileType tex inoremap ,tx \text{}<++><Esc>T{i
    autocmd FileType tex inoremap ,ol \begin{enumerate}<Enter><Enter>\end{enumerate}<Enter><Enter><++><Esc>3kA\item<Space>
    autocmd FileType tex inoremap ,ul \begin{itemize}<Enter><Enter>\end{itemize}<Enter><Enter><++><Esc>3kA\item<Space>
    autocmd FileType tex inoremap ,ref \ref{}<Space><++><Esc>T{i
    autocmd FileType tex inoremap ,chap \chapter{}<Enter><Enter><++><Esc>2kf}i
    autocmd FileType tex inoremap ,s \section{}<Enter><Enter><++><Esc>2kf}i
    autocmd FileType tex inoremap ,ss \subsection{}<Enter><Enter><++><Esc>2kf}i
    autocmd FileType tex inoremap ,sss \subsubsection{}<Enter><Enter><++><Esc>2kf}i
    autocmd FileType tex inoremap ,bt {\blindtext}
    autocmd FileType tex inoremap ,fr \frac{}{<++>}<++><Esc>11ha
    autocmd FileType tex inoremap ,fig \begin{figure}[h!]<Esc>o\centering<Esc>o\includegraphics[scale=.5]{pics/}<Esc>o\caption{<++>}<Esc>o\end{figure}<Esc>2k29li
    autocmd FileType tex inoremap ,wf \begin{wrapfigure}{r}{0.5\textwidth}<Esc>o\includegraphics[scale=.5]{pics/}<Esc>o\caption{<++>}<Esc>o\end{wrapfigure}<Esc>2k25li
    autocmd FileType tex inoremap $$ $$<++><Esc>4hi
    autocmd FileType tex inoremap () ()<++><Esc>4hi
    autocmd FileType tex inoremap {} {}<++><Esc>4hi
    autocmd FileType tex inoremap [] []<++><Esc>4hi
    autocmd FileType tex inoremap ,ar $\rightarrow$
    autocmd FileType tex inoremap ,Ar $\Rightarrow$
    autocmd FileType tex inoremap ,Ra $\Rightarrow$
    autocmd FileType tex inoremap ,ra $\rightarrow$
    autocmd FileType tex inoremap ,la $\leftarrow$
    autocmd FileType tex inoremap ,La $\Leftarrow$
    autocmd FileType tex inoremap ,su _{}<++><Esc>4hi
    autocmd FileType tex inoremap ,u ^{}<++><Esc>T{i
    autocmd FileType tex inoremap ,hat \hat{}<++>T{i
    autocmd FileType tex inoremap ,df \begin{figure}[h!]<Esc>o\centering<Esc>o\subfigure[]{\includegraphics[width=.49\textwidth]{pics/<++>}}<Esc>o\subfigure[<++>]{\includegraphics[width=.49\textwidth]{pics/<++>}}<Esc>o\caption{<++>}<Esc>o\end{figure}<Esc>o<Esc>o<++><Esc>5k12li
    autocmd FileType tex inoremap ,tf \begin{figure}[h!]<Esc>o\centering<Esc>o\subfigure[]{\includegraphics[width=.49\textwidth]{pics/<++>}}<Esc>o\subfigure[<++>]{\includegraphics[width=.49\textwidth]{pics/<++>}}<Esc>o\subfigure[<++>]{\includegraphics[width=.49\textwidth]{pics/<++>}}<Esc>o\caption{<++>}<Esc>o\end{figure}<Esc>o<Esc>o<++><Esc>6k10li
    autocmd FileType tex inoremap ,ts \tabto{\tabspace}<Space>
    autocmd FileType tex inoremap ,p \par<Esc>o
    autocmd FileType tex inoremap ,ov \overline{}<++><Esc>4hi
    autocmd FileType tex inoremap ,sq \sqrt{}<++><Esc>4hi
    autocmd FileType tex inoremap ,hs \hspace{}<++><Esc>4hi
    autocmd FileType tex inoremap ,vs \vspace{}<++><Esc>4hi
    autocmd FileType tex inoremap ,qq $\qquad$
    autocmd FileType tex inoremap ,q $\quad$
    autocmd FileType tex inoremap ,w <Esc>:w<Enter>a
    autocmd FileType tex inoremap ,dot $\bullet$
    autocmd FileType tex inoremap ,fb \FloatBarrier
    autocmd FileType tex inoremap ,tab \begin{tabular}[\|l\|c\|r\|]<Esc>o\hline<Esc>o & <++> & <++> \\ \hline<Esc>o<++> & <++> & <++> \\ \hline<Esc>o<++> & <++> & <++> \\ \hline<Esc>o\end{tabular}<Esc>3k4hi


""".bib
    autocmd FileType bib inoremap ,a @article{<Enter>author<Space>=<Space>{<++>},<Enter>year<Space>=<Space>{<++>},<Enter>title<Space>=<Space>{<++>},<Enter>journal<Space>=<Space>{<++>},<Enter>volume<Space>=<Space>{<++>},<Enter>pages<Space>=<Space>{<++>},<Enter>}<Enter><++><Esc>8kA,<Esc>i
    autocmd FileType bib inoremap ,b @book{<Enter>author<Space>=<Space>{<++>},<Enter>year<Space>=<Space>{<++>},<Enter>title<Space>=<Space>{<++>},<Enter>publisher<Space>=<Space>{<++>},<Enter>isbn<Space>=<Space>{<++>},<Enter>}<Enter><++><Esc>7kA,<Esc>i
    autocmd FileType bib inoremap ,c @incollection{<Enter>author<Space>=<Space>{<++>},<Enter>title<Space>=<Space>{<++>},<Enter>booktitle<Space>=<Space>{<++>},<Enter>editor<Space>=<Space>{<++>},<Enter>year<Space>=<Space>{<++>},<Enter>publisher<Space>=<Space>{<++>},<Enter>}<Enter><++><Esc>8kA,<Esc>i
    autocmd FileType bib inoremap ,o @online{<Enter>author<Space>=<Space>{<++>},<Enter>title<Space>=<Space>{<++>},<Enter>year<Space>=<Space>{<++>},<Enter>url<Space>=<Space>{<++>},<Enter>urldate<Space>=<Space>{<++>},<Enter>}<Enter><++><Esc>7kA,<Esc>i
    autocmd FileType bib inoremap ,t @techreport{<Enter>author<Space>=<Space>{<++>},<Enter>title<Space>=<Space>{<++>},<Enter>institution<Space>=<Space>{<++>},<Enter>year<Space>=<Space>{<++>},,<Enter>number<Space>=<Space>{<++>},<Enter>type<Space>=<Space>{<++>},<Enter>}<Enter><++><Esc>8kA,<Esc>i


"MARKDOWN
    autocmd Filetype markdown,rmd map <leader>w yiWi[<esc>Ea](<esc>pa)
    autocmd Filetype markdown,rmd inoremap ,n ---<Enter><Enter>
    autocmd Filetype markdown,rmd inoremap ,b ****<++><Esc>F*hi
    autocmd Filetype markdown,rmd inoremap ,s ~~~~<++><Esc>F~hi
    autocmd Filetype markdown,rmd inoremap ,e **<++><Esc>F*i
    autocmd Filetype markdown,rmd,text inoremap ,h ========<Esc>o<++><Esc>ka
    autocmd Filetype markdown,rmd inoremap ,i ![](<++>)<++><Esc>F[a
    autocmd Filetype markdown,rmd inoremap ,a [](<++>)<++><Esc>F[a
    autocmd Filetype markdown,rmd inoremap ,1 #<Space><Enter><++><Esc>kA
    autocmd Filetype markdown,rmd inoremap ,2 ##<Space><Enter><++><Esc>kA
    autocmd Filetype markdown,rmd inoremap ,3 ###<Space><Enter><++><Esc>kA
    autocmd Filetype markdown,rmd inoremap ,l --------<Enter>
