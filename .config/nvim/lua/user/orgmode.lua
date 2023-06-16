local orgmode = require('orgmode')

orgmode.setup_ts_grammar()
orgmode.setup({
    org_agenda_files = { '~/.org/**/*.org'},
    org_default_notes_file = '~/.org/refile.org',
})

vim.opt.conceallevel = 2
vim.opt.concealcursor = 'nc'
