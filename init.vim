let mapleader=" "
let g:user42 = 'xchalle'
let g:mail42 = 'xchalle@student.42.fr'

nnoremap <leader>c :read ~/.vim/templates/cpp_class_template<CR>:%s/T/
nnoremap <leader>h :read ~/.vim/templates/hpp_class_template<CR>:%s/T/

call plug#begin()
Plug 'preservim/nerdtree'
Plug 'bling/vim-airline'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/nvim-cmp'
Plug 'neovim/nvim-lspconfig'
call plug#end()

set completeopt=menu,menuone,noselect
lua <<EOF
  -- setup nvim-lspconfig
  require'lspconfig'.clangd.setup{on_attach = on_attach,
    flags = {
      debounce_text_changes = 150,}
      }
  -- Setup nvim-cmp.
  local cmp = require'cmp'

  cmp.setup({
    mapping = {
      ['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
      ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
      ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
      ['<C-y>'] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
      ['<C-e>'] = cmp.mapping({
        i = cmp.mapping.abort(),
        c = cmp.mapping.close(),
      }),
      ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    },
    sources = {
      { name = 'path' },
      { name = 'buffer' }
    },
  })
EOF
