scriptencoding utf8 "diz o encoding deste arquivo

syntax on
set number
set ruler "mostra a posicao atual na barra de status
set showcmd "no modo visual, mostra a quantidade de linhas selecionadas
set is hls ic scs
set nobackup
set visualbell
"colorscheme desert
"colorscheme ir_black
"colorscheme darkblue
colorscheme synic

"Por algum motivo o gnome-terminal não se entende com o colorscheme synic
if ($COLORTERM == 'gnome-terminal')
    colorscheme desert
endif

set mouse=a

"Desabilita o modo de compatibilidade
set nocp

"4 espacos no lugar de tab
set expandtab
set tabstop=4
set smarttab
set softtabstop=4
"shifting de igual ao tab
set shiftwidth=4
"auto identação - com o problema de levar o comentário pro inicio da linha
"resolvido
set smartindent
inoremap # X#
set autoindent

"faz o backspace se comportar como o esperado
set bs=2

"Ativa o suporte a filetype
filetype plugin on

"do .vimrc do aurelio (coluna-09.vim):
imap <F7> <c-n>
imap <F8> <c-x><c-n>

"Python code completion
autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType python compiler pylint "PyLint como compilador de Python
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS

"de http://blog.sontek.net/2008/05/11/python-with-a-modular-ide-vim/
"map CTRL+Space as for code completion
"inoremap <Nul> <C-x> <C-o>

"Usa Ctrl+espaço para autocomplete
inoremap <C-space> <C-p>
imap <Nul> <C-p>

"Inclui o diretorio do python no path
set path+=/usr/lib/python2.5/site-packages/
"Inclui o diretorio atual
set path+=

"da wiki do python.org
"autocmd BufRead,BufNewFile *.py syntax on
"autocmd BufRead,BufNewFile *.py set smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class
"
"foi substituido por isso:
filetype indent on

"Faz o tabcompletion se comportar direito; :help wildmode
set wildmode=longest:list,full

"Tem muita coisa boa nesta pergunta do stackoverflow:
"http://stackoverflow.com/questions/164847/what-is-in-your-vimrc

"Define folds onde encontrar marcas: {{{ }}}
"set foldmethod=marker

" Stolen from http://docs.google.com/View?docid=dfkkkxv5_65d5p3nk
 " This enables you to see tab characters and stray whitespace

" Show tabs and trailing whitespace visually
if (&termencoding == "utf-8") || has("gui_running")
    if v:version >= 700
        set list listchars=tab:»\ ,trail:·,extends:…,nbsp:‗
    else
        set list listchars=tab:»\ ,trail:·,extends:…
    endif
else
    if v:version >= 700
        set list listchars=tab:>\ ,trail:.,extends:>,nbsp:_
    else
        set list listchars=tab:>\ ,trail:.,extends:>
    endif
endif

"http://vim.wikia.com/wiki/Remove_unwanted_spaces#Automatically_removing_all_trailing_whitespace
autocmd BufWritePre * :%s/\s\+$//e

"de http://github.com/developernotes/vim-setup
"Setup 80 column word wrap.
"set wrap
"set linebreak
"set textwidth=80

"Do vimrc do Vagner Fonseca
"
set magic                       "usa 'magia' ao procurar texto =)
"set bs=indent,eol,start
set laststatus=1                "mostra sempre a statusbar com o nome do arquivo
set title                       "mostra o nome do arquivo no titulo do terminal


"do vim maratonistico:
" Faz as setas para esquerda/direita voltarem/avançarem para a linha
" anterior/seguinte, tornando o comportamento do Vim mais parecido com o
" comportamento dos outros editores.
set whichwrap=<,>,b,s,[,]

map <F9> :NERDTreeMirror<return>
map <F10> :NERDTreeToggle<return>
let NERDTreeIgnore = ['\.pyc$', '\.pyo$']

"Code folding
function ToggleFold()
   if foldlevel('.') == 0
      " No fold exists at the current line,
      " so create a fold based on indentation

      let l_min = line('.')   " the current line number
      let l_max = line('$')   " the last line number
      let i_min = indent('.') " the indentation of the current line
      let l = l_min + 1

      " Search downward for the last line whose indentation > i_min
      while l <= l_max
         " if this line is not blank ...
         if strlen(getline(l)) > 0 && getline(l) !~ '^\s*$'
            if indent(l) <= i_min

               " we've gone too far
               let l = l - 1    " backtrack one line
               break
            endif
         endif
         let l = l + 1
      endwhile

      " Clamp l to the last line
      if l > l_max
         let l = l_max
      endif

      " Backtrack to the last non-blank line
      while l > l_min
         if strlen(getline(l)) > 0 && getline(l) !~ '^\s*$'
            break
         endif
         let l = l - 1
      endwhile

      "execute "normal i" . l_min . "," . l . " fold"   " print debug info

      if l > l_min
"         " Create the fold from l_min to l
         execute l_min . "," . l . " fold"
      endif
   else
      " Delete the fold on the current line
      normal zd
   endif
endfunction

nmap <space> :call ToggleFold()<CR>

"Configurações pro gvim
if has("gui_running")
   set guioptions-=T " desabilita barra de ferramentas
   set guioptions-=t " desabilita tear-off
   set guioptions-=m " desabilita menu
   set guioptions-=l
   set guioptions-=r
   set guioptions-=b

   set mouse=a   " habilita uso pleno do mouse
   colorscheme synic
   set gfn=Inconsolata\ 15
endif

"Configurações específicas do pylint.vim
let g:pylint_cwindow = 0
let g:pylint_onwrite = 0
"
":cope "abre a lista de erros
":cclo "fecha a lista de erros
":make "compila o código
":make! "compila mas não pula pro primeiro erro
let g:pydiction_location='/home/flavio/.vim/complete_dict'


"Mostra caracteres que passaram de 80 colunas
highlight OverLength ctermbg=lightred ctermfg=black guibg=#592929
match OverLength /\%81v.*/
au BufNewFile,BufRead *.pde setf arduino
