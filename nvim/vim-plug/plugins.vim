" auto-install vim-plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
	silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	"autocmd VimEnter * PlugInstall
	"autocmd VimEnter * PlugInstall | source $MYVIMRC
endif
" START OF PLUG SECTION
call plug#begin('~/.config/nvim/autoload/plugged')
	" Better Syntax
	Plug 'sheerun/vim-polyglot'
	" File Explorer
	Plug 'preservim/nerdtree'
	" Autopairs for blackets, parens and quotes
	Plug 'jiangmiao/auto-pairs'
	" Asynchronous displaying of colours in the file
	Plug 'rrethy/vim-hexokinase', { 'do': 'make hexokinase' }	
	" Installation of tender theme
	Plug 'jacoborus/tender.vim'
	" Nodejs extension host
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
	" Coc Jedi for Python
	Plug 'pappasam/coc-jedi', {'do':'yarn install --frozen-lockfile && yarn build'}


	" Add file type icons to Vim plugins, make sure to run it last!
	Plug 'ryanoasis/vim-devicons'
	

	" END OF PLUG SECTION
call plug#end()
