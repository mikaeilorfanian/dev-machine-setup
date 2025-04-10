-- vim.opt.updatetime = 250
vim.opt.updatetime = 100

-- vim.keymap.set('n', '<leader><leader>', builtin.buffers, { desc = '[ ] Find existing buffers' })

        -- pyright = {},
        pyright = {},
        jedi_language_server = {},
        djlint = {},

        -- python = { "isort", "black" },
        python = { 'isort', 'black' },
        html = {'djlint'}


         -- {
           --   'rafamadriz/friendly-snippets',
           --   config = function()
           --     require('luasnip.loaders.from_vscode').lazy_load()
           --   end,
           -- },
           {
            'rafamadriz/friendly-snippets',
            config = function()
              require('luasnip.loaders.from_vscode').lazy_load()
            end,
          },

          {name = 'path'},
          {name = 'copilot'},

          -- ensure_installed = { 'bash', 'c', 'diff', 'html', 'lua', 'luadoc', 'markdown', 'vim', 'vimdoc' },
          ensure_installed = { 'regex', 'markdown_inline', 'bash', 'c', 'html', 'lua', 'luadoc', 'markdown', 'vim', 'vimdoc', 'python' },

   -- require 'kickstart.plugins.debug',
   -- require 'kickstart.plugins.indent_line',
   -- require 'kickstart.plugins.lint',
   -- require 'kickstart.plugins.autopairs',
   -- require 'kickstart.plugins.neo-tree',
   -- require 'kickstart.plugins.gitsigns', -- adds gitsigns recommend keymaps
   require 'kickstart.plugins.indent_line',
   require 'kickstart.plugins.lint',
   require 'kickstart.plugins.autopairs',
   require 'kickstart.plugins.neo-tree',
   require 'kickstart.plugins.gitsigns', -- adds gitsigns recommend keymaps

  -- { import = 'custom.plugins' },
  { import = 'custom.plugins' },



-- Aerial
vim.keymap.set('n', '<leader>a', '<cmd>AerialToggle!<CR>')
 
-- close buffer
vim.keymap.set('n', '<C-q>', '<cmd>bd<CR>', { desc = ':[b]d or Close Buffer' })

-- noice setup
require('noice').setup {
    lsp = {
      -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
      override = {
        ['vim.lsp.util.convert_input_to_markdown_lines'] = true,
        ['vim.lsp.util.stylize_markdown'] = true,
        ['cmp.entry.get_documentation'] = true, -- requires hrsh7th/nvim-cmp
      },
    },
    -- you can enable a preset for easier configuration
    presets = {
      bottom_search = true, -- use a classic bottom cmdline for search
      command_palette = true, -- position the cmdline and popupmenu together
      long_message_to_split = true, -- long messages will be sent to a split
      inc_rename = false, -- enables an input dialog for inc-rename.nvim
      lsp_doc_border = false, -- add a border to hover docs and signature help
    },
  }
  
  -- harpoon
  local harpoon = require 'harpoon'
  harpoon:setup()
  vim.keymap.set('n', '<C-a>', function()
    harpoon:list():add()
  end)
  vim.keymap.set('n', '<C-e', function()
    harpoon:list()
  end, { desc = 'Open Harpoon Window' })
  vim.keymap.set('n', '<C-n>', function()
    harpoon:list():prev()
  end, { desc = 'Next Harpoon Item' })
  
  -- bufferline
  vim.opt.termguicolors = true
  bufferline = require 'bufferline'
  bufferline.setup { options = { offsets = { filetype = 'Neotree' } } }
  vim.keymap.set('n', '<leader><leader>', '<cmd>BufferLinePick<CR>', { desc = '[ ] Find Exiting Buffers' })
  
  -- zz when entering buffers
  vim.api.nvim_create_autocmd('BufEnter', {
    group = vim.api.nvim_create_augroup('zzAutoCmd', { clear = true }),
    callback = function(opts)
      if vim.bo[opts.buf].filetype == 'python' then
        vim.cmd 'norm zz'
      end
    end,
  })

  -- copilot setup
  require('copilot').setup{
    suggestion = {enabled=false},
    panel = {enabled = false}
  }

  -- python debugger snippet
  local ls = require 'luasnip'
  ls.add_snippets('python', {ls.parser.parse_snippet('pdb', 'import pdb; pdb.set_trace()')})