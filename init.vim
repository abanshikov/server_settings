call plug#begin('~/.vim/plugged')
  " Темы
  Plug 'morhetz/gruvbox'
  Plug 'mhartington/oceanic-next'  " colorscheme OceanicNext
  Plug 'kaicataldo/material.vim', { 'branch': 'main' }
  Plug 'ayu-theme/ayu-vim'
  " Дерево каталогов
  Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
  " Умная расстановка скобок
  Plug 'chun-yang/auto-pairs'
  " Поиск по букве в файле
  Plug 'easymotion/vim-easymotion'
  " Коммандная строка
  Plug 'vim-airline/vim-airline'
  " Автодополнение и обозначение ошибок линтера
  Plug 'neovim/nvim-lspconfig'
  Plug 'hrsh7th/nvim-cmp'
  Plug 'hrsh7th/cmp-nvim-lsp'
  Plug 'saadparwaiz1/cmp_luasnip'
  Plug 'L3MON4D3/LuaSnip'
call plug#end()

colorscheme gruvbox             " Выбор темы
filetype indent on              " Загружать файлы отступов для конкретных типов файлов
syntax on                       " Подсветка синтаксиса

set autoindent                  " Автоотступ
set background=dark             " Цветовая схема
set colorcolumn=80              " Количество символов до вертикальной линии
set encoding=utf-8              " Кодировка файлов
set expandtab                   " Настройки отступов (табов)
set fileformat=unix             " Формат файлов по умолчанию
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
set showtabline=0               " Отображение символа отступов (табов)
set smarttab                    " Настройки отступов (табов)
set softtabstop=4               " Величина отступов (табов)
set tabstop:4                   " Величина отступов (табов)
set termencoding=utf-8          " Кодировка терминала
set wrap                        " Перенос на другую строку

" Вставить текст из буфера обмена Ctrl+v
imap <C-v> <C-r><C-o>+
vmap <C-v> c<ESC>"+p

" Сохранение по Ctrl+s
inoremap <c-s> <Esc>:w<CR>l

" Создать новую вкладку Ctrl+t
inoremap <C-t> <Esc>:tabnew<CR>
nnoremap <C-t> :tabnew<CR>

" Отменить последнее действие Ctrl+z
inoremap <c-z> <c-o>:u<CR>
nnoremap <c-z> :u<CR>

" Выход из режима ввода текста
inoremap jj <Esc>
inoremap оо <Esc>

" Запуск NERDTree (дерева каталогов) Ctrl+b
map <C-b> :NERDTreeToggle<CR>

" Быстрый переход к тексту
map <Leader> <Plug>(easymotion-prefix)

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

" Копировать выделенный фрагмент Ctrl+c
vmap <C-c> "+y
vnoremap <c-s> <Esc>:w<CR>

" Вырезать выделенный фрагмент Ctrl+x
vmap <C-x> "+c


let python_highlight_all = 1    " Подсветка для python
let &t_SI = "\<Esc>[6 q"        " Настройка индикатора курсора (для kitty)
let &t_SR = "\<Esc>[4 q"        " Настройка индикатора курсора (для kitty)
let &t_EI = "\<Esc>[2 q"        " Настройка индикатора курсора (для kitty)

" Перед сохранением удалить лишние пробелы (только в .py файлах)
autocmd BufWritePre *.py normal m`:%s/\s\+$//e ``
" Умные отступы в .py файлах после ключевых слов
autocmd BufRead *.py set smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class
" Запуск скриптов python
autocmd FileType python map <buffer> <F5> :w<CR>:exec '!python3' shellescape(@%, 1)<CR>
autocmd FileType python imap <buffer> <F5> <esc>:w<CR>:exec '!python3' shellescape(@%, 1)<CR>


" Настройки автозавершения
lua << EOF
vim.o.completeopt = 'menuone,noselect'
local luasnip = require 'luasnip'
local cmp = require 'cmp'
cmp.setup {
  completion = {
    autocomplete = true -- Автоматическое отображение автодополнения
  },
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
  },
}
EOF


lua << EOF
local nvim_lsp = require('lspconfig')
local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end
  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')
  local opts = { noremap=true, silent=true }
  buf_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
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

local servers = { 'pyright', 'rust_analyzer' }
for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup {
    on_attach = on_attach,
    flags = {
      debounce_text_changes = 150,
    }
  }
end
EOF


" Настройки отображения ошибок
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

map gn :bn<cr>
map gp :bp<cr>
map gw :Bclose<cr>
