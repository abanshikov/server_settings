" =============================================================================
" Установленные плагины
" =============================================================================
    " https://vimawesome.com/
    call plug#begin('~/.vim/plugged')
        " Темы
        Plug 'morhetz/gruvbox'
        Plug 'kaicataldo/material.vim', { 'branch': 'main' }
        " Дерево каталогов https://github.com/preservim/nerdtree
        Plug 'preservim/nerdtree', { 'on':  'NERDTreeToggle' }
        " Коммандная строка https://github.com/vim-airline/vim-airline
        Plug 'vim-airline/vim-airline'
        " Визуальное отображение маркеров https://github.com/kshenoy/vim-signature
        Plug 'kshenoy/vim-signature'
        " Расстановка скобок https://github.com/chun-yang/auto-pairs
        Plug 'chun-yang/auto-pairs'
        " Оборачивание скобками, кавычками https://github.com/tpope/vim-surround
        Plug 'tpope/vim-surround'
        " Комментирование/раскомментирование строк https://github.com/tpope/vim-commentary
        Plug 'tpope/vim-commentary'
        " Иконки https://github.com/ryanoasis/vim-devicons
        Plug 'ryanoasis/vim-devicons'
        " Автозаполнение emmet https://github.com/mattn/emmet-vim
        Plug 'mattn/emmet-vim'
        " Поиск по букве в файле https://github.com/easymotion/vim-easymotion
        Plug 'easymotion/vim-easymotion'
        " Автодополнение и обозначение ошибок линтера
        Plug 'neovim/nvim-lspconfig'
        Plug 'hrsh7th/nvim-cmp'
        Plug 'hrsh7th/cmp-nvim-lsp'
        Plug 'tzachar/cmp-tabnine', { 'do': './install.sh' }
        " Сниппеты
        Plug 'saadparwaiz1/cmp_luasnip'
        Plug 'L3MON4D3/LuaSnip'
        " Поиск и открытие файла по названию и содержимому файла
        Plug 'nvim-lua/plenary.nvim'
        Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.0' }
        Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
    call plug#end()


" =============================================================================
" Настройки отображения
" =============================================================================
    " Настройка цветов
    if (has('termguicolors'))
      set termguicolors
    endif

    " Выбор темы https://github.com/kaicataldo/material.vim
    " colorscheme gruvbox             
    colorscheme material
    " 'default', 'palenight', 'ocean', 'lighter', 'darker', 'default-community', 'palenight-community', 'ocean-community', 'lighter-community', 'darker-community'
    let g:material_theme_style = 'darker-community'
    " let g:material_theme_style = 'darker'
    let g:material_terminal_italics = 1
    let g:airline_theme = 'material'


" =============================================================================
" Общие настройки
" =============================================================================
    filetype indent on              " Загружать файлы отступов для конкретных типов файлов
    syntax on                       " Подсветка синтаксиса
    set autoindent                  " Автоотступ
    set background=dark             " Цветовая схема
    set colorcolumn=80              " Количество символов до вертикальной линии
    set encoding=utf-8              " Кодировка файлов
    set expandtab                   " Настройки отступов (табов)
    set fileformat=unix             " Формат файлов по умолчанию
    set foldmethod=indent           " Сворачивание кода zo-развернуть, zm-свернуть https://vim.fandom.com/wiki/Folding
    set hlsearch                    " Подсветка поиска
    set incsearch                   " Подсветка поиска
    set linebreak                   " Разрыв строки
    set mouse=a                     " Поддержка мыши
    set mousehide                   " Скрытие курсора при вводе текста
    set nobackup                    " Отключение сохранения ~ (резервных) файлов
    set nocompatible                " Для vim
    set noswapfile                  " Отключение сохранения .swp файлов
    set number                      " Нумерация строк
    set relativenumber              " Относительные номера строк
    set scrolloff=8                 " Количество показываемых внизу строк при скролинге
    set shiftwidth:4                " Величина отступов (табов)
    set showcmd                     " Показывать незавершённые команды в статусбаре
    set showtabline=1               " Отображение строки с названиями вкладок
    set smarttab                    " Настройки отступов (табов)
    set softtabstop=4               " Величина отступов (табов)
    set tabstop:4                   " Величина отступов (табов)
    set termencoding=utf-8          " Кодировка терминала
    set wrap                        " Перенос на другую строку
    " Настройка вкладок
    let g:netrw_banner = 0          " Скрывать заголовок при открытии каталога
    let g:netrw_liststyle = 3       " Открывать в виде дерева
    let g:netrw_browse_split = 3    " Открывать в новой вкладке по enter'y
    " Прочие настройки
    let python_highlight_all = 1    " Подсветка для python
    let &t_SI = "\<Esc>[6 q"        " Настройка индикатора курсора (для kitty)
    let &t_SR = "\<Esc>[4 q"        " Настройка индикатора курсора (для kitty)
    let &t_EI = "\<Esc>[2 q"        " Настройка индикатора курсора (для kitty)


" =============================================================================
" Настройки сочетиния клавиш
" =============================================================================
    " Комментировать python
    vnoremap <silent> <C-/> :s/^/# /<cr>:noh<cr>
    vnoremap <silent> <C-S-/> :s/^# //<cr>:noh<cr>
    " Копировать выделенный фрагмент Ctrl+c
    vmap <C-c> "+y
    vnoremap <c-s> <Esc>:w<CR>
    " Вставить текст из буфера обмена Ctrl+v
    imap <C-v> <C-r><C-o>+
    vmap <C-v> c<ESC>"+p
    " Вырезать выделенный фрагмент Ctrl+x
    vmap <C-x> "+c
    " Сохранение по Ctrl+s
    inoremap <c-s> <Esc>:w<CR>
    " Создать новую вкладку Ctrl+t
    inoremap <C-t> <Esc>:tabnew<CR>
    nnoremap <C-t> :tabnew<CR>
    " Отменить последнее действие Ctrl+z
    inoremap <c-z> <c-o>:u<CR>
    nnoremap <c-z> :u<CR>
    " Выход из режима ввода текста
    inoremap jj <Esc>
    " inoremap оо <Esc>
    " Убрать подсветку найденного текста ,+Spase
    nnoremap ,<space> :nohlsearch<CR>
    " Перход к вводу команд по ;
    nnoremap ; :
    " Перейти к следующей вкладке Ctrl+j
    nnoremap <C-j> gT
    " Перейти к предыдущей вкладке Ctrl+k
    nnoremap <C-k> gt
    " Сохранение по Ctrl+s
    nnoremap <c-s> :w<CR>
    " Переименовать переменную https://ask-dev.ru/info/15871/changing-variable-names-in-vim
    nnoremap <F2> gD:%s/<C-R>///gc<left><left><left>
    nnoremap <S-F2> :%s/<C-R>///gc<left><left><left>


" =============================================================================
" Настройка автокоманд
" =============================================================================
    " Перед сохранением удалить лишние пробелы (только в .py файлах)
    autocmd BufWritePre *.py normal m`:%s/\s\+$//e ``
    " Умные отступы в .py файлах после ключевых слов
    autocmd BufRead *.py set smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class
    " Запуск скриптов python
    autocmd FileType python map <buffer> <F5> :w<CR>:exec '!python3' shellescape(@%, 1)<CR>
    autocmd FileType python imap <buffer> <F5> <esc>:w<CR>:exec '!python3' shellescape(@%, 1)<CR>


" =============================================================================
" Настройки автозавершения
" =============================================================================
    lua << EOF
    vim.o.completeopt = 'menuone,noselect'
    local luasnip = require 'luasnip'
    local cmp = require 'cmp'
    cmp.setup {
    -- Раскомментировать для отключения автоматического автодополнения
    --  completion = {
    --    autocomplete = true 
    --  },
      snippet = {
        expand = function(args)
          require('luasnip').lsp_expand(args.body)
        end,
      },
      mapping = {
        ['<C-p>'] = cmp.mapping.select_prev_item(), -- Предыдущий пункт автозавершения Ctrl+p
        ['<C-n>'] = cmp.mapping.select_next_item(), -- Следующий пункт автозавершения Ctrl+n
        ['<C-d>'] = cmp.mapping.scroll_docs(-4),    -- Прокрутка меню автозавершения Ctrl+d
        ['<C-f>'] = cmp.mapping.scroll_docs(4),     -- Прокрутка меню автозавершения Ctrl+f
        ['<C-Space>'] = cmp.mapping.complete(),     -- Вызов меню автозавершения Ctrl+Spase
        ['<C-e>'] = cmp.mapping.close(),            -- Закрыть меню автозавершения Ctrl+e
        ['<CR>'] = cmp.mapping.confirm {
          behavior = cmp.ConfirmBehavior.Replace,
          select = true,
        },
        ['<Tab>'] = function(fallback)
          if vim.fn.pumvisible() == 1 then
            vim.fn.feedkeys(vim.api.nvim_replace_termcodes('<C-n>', true, true, true), 'n')
          elseif luasnip.expand_or_jumpable() then
            vim.fn.feedkeys(vim.api.nvim_replace_termcodes('<Plug>luasnip-expand-or-jump', true, true, true), '')
          else
            fallback()
          end
        end,
        ['<S-Tab>'] = function(fallback)
          if vim.fn.pumvisible() == 1 then
            vim.fn.feedkeys(vim.api.nvim_replace_termcodes('<C-p>', true, true, true), 'n')
          elseif luasnip.jumpable(-1) then
            vim.fn.feedkeys(vim.api.nvim_replace_termcodes('<Plug>luasnip-jump-prev', true, true, true), '')
          else
            fallback()
          end
        end,
      },
      sources = {
        { name = 'nvim_lsp' },
        { name = 'luasnip' },
        { name = 'cmp_tabnine' },
      },
    }
    -- Настройка tabnine
    local tabnine = require('cmp_tabnine.config')
    tabnine:setup({
        max_lines = 1000;
        max_num_results = 20;
        sort = true;
        run_on_every_keystroke = true;
        snippet_placeholder = '..';
        ignored_file_types = { -- default is not to ignore
            -- uncomment to ignore in lua:
            -- lua = true
        };
        show_prediction_strength = false;
    })
EOF


" =============================================================================
" Настройки работы с сервером ошибок python
" =============================================================================
    lua << EOF
    local nvim_lsp = require('lspconfig')
    local on_attach = function(client, bufnr)
      local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
      local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end
      buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')
      local opts = { noremap=true, silent=true }
      buf_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
      buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts) -- Перейти к определяемой функции
      buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
      buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
      buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
      buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
      buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
      buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
      buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
      buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
      buf_set_keymap('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
      buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
      buf_set_keymap('n', '<space>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
      buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
      buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
      buf_set_keymap('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
      buf_set_keymap('n', '<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)

    end

    local servers = { 'pyright' }
    for _, lsp in ipairs(servers) do
      nvim_lsp[lsp].setup {
        on_attach = on_attach,
        flags = {
          debounce_text_changes = 150,
        }
      }
    end
EOF


" =============================================================================
" Настройки отображения ошибок
" =============================================================================
    if v:version < 700 || exists('loaded_bclose') || &cp
      finish
    endif
    let loaded_bclose = 1
    if !exists('bclose_multiple')
      let bclose_multiple = 1
    endif

    " Показать сообщение об ошибке
    function! s:Warn(msg)
      echohl ErrorMsg
      echomsg a:msg
      echohl NONE
    endfunction

    " Настройка цветов сообщений об ошибках
    set termguicolors
    hi DiagnosticError guifg=#ff5252
    hi DiagnosticWarn  guifg=#ffc400
    hi DiagnosticInfo  guifg=#9e9e9e
    hi DiagnosticHint  guifg=#424242


" =============================================================================
" Настройки работы с буферами
" =============================================================================
    " Команда ':Bclose' выполняет ':bd' для удаления буфера в текущем окне.
    " Окно покажет альтернативный буфер (Ctrl-^), если он существует,
    " или предыдущий буфер (:bp), или пустой буфер, если нет предыдущего.
    " Команда ':Bclose!' то же самое, но выполняет ':bd!' (отменить изменения).
    " Необязательный аргумент может указать, какой буфер следует закрыть (имя или номер).
    function! s:Bclose(bang, buffer)
      if empty(a:buffer)
        let btarget = bufnr('%')
      elseif a:buffer =~ '^\d\+$'
        let btarget = bufnr(str2nr(a:buffer))
      else
        let btarget = bufnr(a:buffer)
      endif
      if btarget < 0
        call s:Warn('No matching buffer for '.a:buffer)
        return
      endif
      if empty(a:bang) && getbufvar(btarget, '&modified')
        call s:Warn('No write since last change for buffer '.btarget.' (use :Bclose!)')
        return
      endif
      " Numbers of windows that view target buffer which we will delete.
      let wnums = filter(range(1, winnr('$')), 'winbufnr(v:val) == btarget')
      if !g:bclose_multiple && len(wnums) > 1
        call s:Warn('Buffer is in multiple windows (use ":let bclose_multiple=1")')
        return
      endif
      let wcurrent = winnr()
      for w in wnums
        execute w.'wincmd w'
        let prevbuf = bufnr('#')
        if prevbuf > 0 && buflisted(prevbuf) && prevbuf != btarget
          buffer #
        else
          bprevious
        endif
        if btarget == bufnr('%')
          " Numbers of listed buffers which are not the target to be deleted.
          let blisted = filter(range(1, bufnr('$')), 'buflisted(v:val) && v:val != btarget')
          " Listed, not target, and not displayed.
          let bhidden = filter(copy(blisted), 'bufwinnr(v:val) < 0')
          " Take the first buffer, if any (could be more intelligent).
          let bjump = (bhidden + blisted + [-1])[0]
          if bjump > 0
            execute 'buffer '.bjump
          else
            execute 'enew'.a:bang
          endif
        endif
      endfor
      execute 'bdelete'.a:bang.' '.btarget
      execute wcurrent.'wincmd w'
    endfunction
    command! -bang -complete=buffer -nargs=? Bclose call <SID>Bclose(<q-bang>, <q-args>)
    nnoremap <silent> <Leader>bd :Bclose<CR>

    " Переход между буферами
    map gn :bn<cr>
    map gp :bp<cr>
    map gw :Bclose<cr>


" =============================================================================
" Настройки плагина Telescope
" =============================================================================
    " https://github.com/nvim-telescope/telescope.nvim
    " Поиск и открытие файлов по названию и по содержанию
    nnoremap ,f <cmd>Telescope find_files<cr>
    nnoremap ,g <cmd>Telescope live_grep<cr>
    " Поиск по содержимому файла
    lua << EOF
    require('telescope').load_extension('fzf')
EOF


" =============================================================================
" Настройки плагина NERDTree
" =============================================================================
    " https://github.com/preservim/nerdtree
    " Запуск Ctrl+b
    map <C-b> :NERDTreeToggle<CR>
    " открыть файл в новой вкладке
    let NERDTreeCustomOpenArgs={'file':{'where': 't'}}  
    " Выйдите из Vim, если NERDTree — единственное окно, оставшееся на единственной вкладке.
    autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
    " Закройте вкладку, если в ней осталось только окно NERDTree.
    autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif


" =============================================================================
" Настройки плагина Emmet
" =============================================================================
    " https://github.com/mattn/emmet-vim
    let g:user_emmet_mode='n'    " включить только функции нормального режима
    let g:user_emmet_mode='inv'  " включить все функции, что равно
    let g:user_emmet_mode='a'    " включить все функции во всех режимах
    let g:user_emmet_install_global = 0
    autocmd FileType html,css EmmetInstall  " использовать только в файлах типа
    " Стандартное сочетание <Ctrl+y> затем нажать <,>. Переоприделить <Tab>+<,>
    " let g:user_emmet_leader_key='<Tab>'


" =============================================================================
" Настройки плагина Airline
" =============================================================================
    " https://github.com/vim-airline/vim-airline
    " Настройка информационной строки
    let g:airline_powerline_fonts = 1             " Шрифт иконок nerd
    let g:airline#extensions#tabline#enabled = 1  " Отображение названий вкладок
        

" =============================================================================
" Настройки плагина Airline
" =============================================================================
    " https://github.com/easymotion/vim-easymotion
    " Быстрый переход к символу ("\" - <Leader>)
    " map  <Leader>f <Plug>(easymotion-bd-f)
    " nmap <Leader>f <Plug>(easymotion-overwin-f)
    " Быстрый переход к символам (поиск по 2-м символам)
    map  <Leader>f <Plug>(easymotion-bd-f2)
    nmap <Leader>f <Plug>(easymotion-overwin-f2)
    " Перейти к слову
    " map  <Leader>/ <Plug>(easymotion-bd-w)
    " nmap <Leader>/ <Plug>(easymotion-overwin-w)
    " Move to line
    map <Leader>/ <Plug>(easymotion-bd-jk)
    nmap <Leader>/ <Plug>(easymotion-overwin-line)





