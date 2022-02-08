  "Load plugins
  execute pathogen#helptags()
  execute pathogen#incubate()

  "Various options
  execute pathogen#infect()
  syntax enable
  filetype plugin indent on

  "256 colors
  set  t_Co=256
  colorscheme distinguished

  set autoindent
  set splitbelow
  set hlsearch
  set cursorline
  "set relativenumber
  set number
  set showcmd "show incomplete commands.
  set showmode "show current mode

  set tabstop=2
  set expandtab
  set et
  set bs=2
  set shiftwidth=2
  set guifont=Panic\ Sans:h12

  "set clipbard for tmux
  set clipboard=unnamedplus

  "set cindent
  "Indents were getting really annoying, autoindent is the way to go
  set nocindent
  set smartindent
  "set foldenable
  "set foldmethod=indent
  set ruler
  set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%) " a ruler on steroids

  set nobackup       "no backup files
  set nowritebackup  "no backup files
  set noswapfile     "no swap files

  "always show status bar
  set laststatus=2
  set statusline=%t[%{strlen(&fenc)?&fenc:'none'},%{&ff}]%h%m%r%y%=%c,%l/%L\ %P

  "Search options
  set hls is " highlight search text throughout the document.
  set wrapscan " wrap the scan around the document
  set ignorecase
  set smartcase "ignore case in search
  set gdefault
  set incsearch "show searches as they are typed
  set showmatch
  set hlsearch "highlight matches
  nnoremap <leader><space> :noh<cr>

  "Text Editing options
  "set wrap
  "set textwidth=79
  "set formatoptions=qrn1
  "set colorcolumn=85

  "Use F2 to toggle paste insanity
  nnoremap <F2> :set invpaste paste?<CR>
  imap <F2> <C-O>:set invpaste paste?<CR>
  set pastetoggle=<F2>

  "Use movement keys to navigate window splits
  map <C-J> <C-W>j<C-W>_gg
  map <C-K> <C-W>k<C-W>_gg
  nmap <c-h> <c-w>h<c-w><Bar>
  nmap <c-l> <c-w>l<c-w><Bar>
  set wmh=0

  "Ruby/Rails omnicomplete
  autocmd FileType ruby,eruby set omnifunc=rubycomplete#Complete
  autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1
  autocmd FileType ruby,eruby let g:rubycomplete_rails = 1
  autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1

  "Atomic Save - don't actually delete file on save
  "autocmd BufWriteCmd *.php call AtomicSave()

  "Autocompletion
  set wildmenu
  set wildmode=list:longest

  " Disable output and VCS files
  set wildignore+=*.o,*.out,*.obj,.git,*.rbc,*.rbo,*.class,.svn,*.gem

  " Disable archive files
  set wildignore+=*.zip,*.tar.gz,*.tar.bz2,*.rar,*.tar.xz

  " Ignore bundler and sass cache
  set wildignore+=*/vendor/gems/*,*/vendor/cache/*,*/.bundle/*,*/.sass-cache/*,*node_modules/*,*tmp/*,*bower_components/*

  " Disable temp and backup files
  set wildignore+=*.swp,*~,._*



  "JS Syntax highlighting with node
  let $JS_CMD='node'

  "Ragtag
  let g:ragtag_global_maps = 1

  "ctags
  let g:ctags_statusline=2
  let generate_tags=1
  let g:ctags_title=1

  "cool it jasmine
  let g:jasmine_use_templates=""

  "Rainbow Parentheses https://github.com/kien/rainbow_parentheses.vim
  let g:rbpt_colorpairs = [
  \ ['brown',       'RoyalBlue3'],
  \ ['Darkblue',    'SeaGreen3'],
  \ ['darkgray',    'DarkOrchid3'],
  \ ['darkgreen',   'firebrick3'],
  \ ['darkcyan',    'RoyalBlue3'],
  \ ['darkred',     'SeaGreen3'],
  \ ['darkmagenta', 'DarkOrchid3'],
  \ ['brown',       'firebrick3'],
  \ ['gray',        'RoyalBlue3'],
  \ ['black',       'SeaGreen3'],
  \ ['darkmagenta', 'DarkOrchid3'],
  \ ['Darkblue',    'firebrick3'],
  \ ['darkgreen',   'RoyalBlue3'],
  \ ['darkcyan',    'SeaGreen3'],
  \ ['darkred',     'DarkOrchid3'],
  \ ['red',         'firebrick3'],
  \ ]


  "unmap window + c as close because it's annoying
  nmap <C-w>c <Esc>
  nmap <C-w><C-C> <Esc>

  nmap <Leader>w :w<CR>
  nmap <Leader>ww :w<CR>
  nmap <Leader>wq :wq<CR>

" Ag // SilverSearcher
"let g:ag_prg="ag --column --ignore=*json"
let g:ag_prg="ag --column"

  "Ack mapping
  "ack with quotes
  map <Leader>a :Ag!<Space>""<Left>
  "find under cursor
  map <Leader>aw *#:Ag!<CWORD><CR>

  "Taglist mapping
  nmap <Leader>tl :TlistToggle<CR>

  "Paste toggle
  nmap <Leader>p :set invpaste paste?<CR>

  "quick open vimrc
  nmap <Leader>ov :sp ~/.vimrc<CR>
  nmap <Leader>sv :so ~/.vimrc<CR>

  "some tab bindings
  map <leader>tt :tabnew<cr>
  map <leader>te :tabedit
  map <leader>tc :tabclose<cr>
  map <leader>to :tabnew<cr>
  map <leader>tn :tabnext<cr>
  map <leader>tp :tabprevious<cr>
  map <leader>tf :tabfirst<cr>
  map <leader>tm :tabmove<cr>

  "this just seems obvious.
  map <C-N> <C-W>n
  "and a corresponding close
  map <C-Q> <C-W>n


  map <leader>bb :cprev<cr>
  map <leader>nn :cnext<cr>

  "Uppercase word
  map <leader>ucw mQviwU`Q

  "Lowercase word
  map <leader>lcw mQviwu`Q

  "Lower case first letter of word
  map <leader>lcl mQgewvu`Q

  "Upper case first letter of word
  map <leader>ucl mQgewvU`Q

  "JSON
  au BufNewFile,BufRead {*.json} set ft=javascript

  "Eco templates
  au BufNewFile,BufRead *.jst.eco set ft=html

  "Rabl? templates
  au BufNewFile,BufRead *.rabl set ft=ruby

  "Format whole file
  nmap <leader>fef ggVG=

  " following 22 lines from https://github.com/cwick
  " open files in directory of current file
  function! DirectoryOfFile()
   return expand('%:h').'/'
  endfunction

  map <leader>v :view <C-R>=DirectoryOfFile()<cr><cr>

  " Ctrlp config
  let g:ctrlp_cache_dir = $HOME . '/.cache/ctrlp'
  if executable('ag')
    let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
  endif
  let g:ctrlp_working_path_mode = 0
  let g:ctrlp_map = '<leader>f'
  let g:ctrlp_cmd = 'CtrlP'
  let g:ctrlp_match_window = 'results:50,max:50'

  " Ctrlp mappings
  map <leader>gc :CtrlP app/controllers<cr>
  map <leader>gs :CtrlP spec<cr>
  map <leader>gv :CtrlP app/views<cr>
  map <leader>gj :CtrlP app/assets/javascripts<cr>
  map <leader>gm :CtrlP app/models<cr>

  map <leader>b :FufBuffer<cr>

let g:airline#extensions#hunks#enabled = 0
let g:airline_powerline_fonts = 1

" NerdTree {
  "map <C-e> :NERDTreeToggle<CR>:NERDTreeMirror<CR>
  "nmap <leader>nt :NERDTreeFind<CR>

  "nmap <space> :
  nmap <Leader>nt :NERDTreeToggle<CR>
  let NERDTreeShowHidden=1
  au BufNewFile,BufRead *.ctp set filetype=php


  let NERDTreeShowBookmarks=1
  let NERDTreeIgnore=['\.pyc', '\~$', '\.swo$', '\.swp$', '\.git', '\.hg', '\.svn', '\.bzr']
  let NERDTreeChDirMode=0
  let NERDTreeQuitOnOpen=1
  let NERDTreeMouseMode=2
  let NERDTreeShowHidden=1
  let NERDTreeKeepTreeInNewTab=1
  let g:nerdtree_tabs_open_on_gui_startup=0
" }

" Tabularize {
  nmap <Leader>t= :Tabularize /=<CR>
  vmap <Leader>t= :Tabularize /=<CR>
  nmap <Leader>t- :Tabularize /-<CR>
  nmap <Leader>t: :Tabularize /:<CR>
  vmap <Leader>t: :Tabularize /:<CR>
  nmap <Leader>t:: :Tabularize /:\zs<CR>
  vmap <Leader>t:: :Tabularize /:\zs<CR>
  nmap <Leader>t, :Tabularize /,<CR>
  vmap <Leader>t, :Tabularize /,<CR>
  nmap <Leader>t,, :Tabularize /,\zs<CR>
  vmap <Leader>t,, :Tabularize /,\zs<CR>
  nmap <Leader>t<Bar> :Tabularize /<Bar><CR>
  vmap <Leader>t<Bar> :Tabularize /<Bar><CR>
" }

nmap <Leader>cc :call g:OpenComments()<CR>

" Yank from the cursor to the end of the line, to be consistent with C and D.
nnoremap Y y$


      if !exists('g:spf13_no_indent_guides_autocolor')
            let g:indent_guides_auto_colors = 1
        else
            " for some colorscheme ,autocolor will not work,like 'desert','ir_black'.
            autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=#212121   ctermbg=3
            autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=#404040 ctermbg=4
        endif
        let g:indent_guides_start_level = 2
        let g:indent_guides_guide_size = 1
        let g:indent_guides_enable_on_vim_startup = 1

let g:rubytest_cmd_spec = "zeus rspec %p"
let g:rubytest_cmd_example = "zeus rspec %p"

map <Leader>rs <Plug>RubyTestRun

" Search for selected text, forwards or backwards.
vnoremap <silent> * :<C-U>
  \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
  \gvy/<C-R><C-R>=substitute(
  \escape(@", '/\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
  \gV:call setreg('"', old_reg, old_regtype)<CR>
vnoremap <silent> # :<C-U>
  \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
  \gvy?<C-R><C-R>=substitute(
  \escape(@", '?\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
  \gV:call setreg('"', old_reg, old_regtype)<CR>

"whitespace

highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()


"syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_rust_checkers = ['rustc']
"let g:syntastic_ruby_checkers = ['rubocop']
let g:syntastic_scss_checkers = ['sass']
let g:syntastic_json_checkers = ['jsonlint']
let g:syntastic_coffee_script_checkers = ['coffee']

let g:syntastic_always_populate_loc_list = 0
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0


" Ensure that helptags are generated for the vim help directory
let g:DocPath = expand("$VIMRUNTIME/doc")
let g:DocTags = join([g:DocPath, "tags"], "/")
if !filereadable(g:DocTags)
    execute join(["helptags", g:DocPath])
endif

" supertab
let g:SuperTabNoCompleteAfter = ['^', ',', '\s']

"vim-jsx-pretty
let g:vim_jsx_pretty_highlight_close_tag = 1

"coc
augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

autocmd User EasyMotionPromptBegin silent! CocDisable
autocmd User EasyMotionPromptEnd silent! CocEnable

"https://github.com/neoclide/coc.nvim/issues/357
let g:coc_auto_copen=1

"end coc
"
"ale

let g:ale_fixers = {}
let g:ale_fixers = {
\   'javascript': ['prettier'],
\   'typescript': ['prettier'],
\   'ruby': ['prettier'],
\   'html': ['prettier'],
\   'css': ['prettier'],
\}
let g:ale_fixers['*'] = ['remove_trailing_lines', 'trim_whitespace']
let g:ale_javascript_prettier_options = '--use-spaces'
let g:ale_fix_on_save = 1

if executable('ag')
  " Use Ag over Grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
endif
