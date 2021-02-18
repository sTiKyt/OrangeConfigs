""" SETTINGS SECTION
"" Has to be before settings.vim, can be first
source $HOME/.config/nvim/settings/gui_color_check.vim
source $HOME/.config/nvim/settings/providers.vim
source $HOME/.config/nvim/settings/settings.vim
""" KEYBINDS SECTION
source $HOME/.config/nvim/keybindings/buffers.vim
""" PLUGINS SECTION
source $HOME/.config/nvim/vim-plug/plugins.vim
" coc and coc extensions 
source $HOME/.config/nvim/plug-settings/coc-base.vim
source $HOME/.config/nvim/plug-settings/coc-extensions.vim
source $HOME/.config/nvim/plug-settings/coc-explorer_config.vim
"" plugins specific configs
source $HOME/.config/nvim/plug-settings/hexokinase_config.vim
source $HOME/.config/nvim/plug-settings/airline_config.vim
source $HOME/.config/nvim/plug-settings/rainbow_parentheses_config.vim
source $HOME/.config/nvim/plug-settings/better_whitespace_config.vim
""" THEMES SECTION

source $HOME/.config/nvim/themes/tender.vim
