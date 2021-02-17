let g:rainbow#pairs = [['(', ')'],['[',']'],['{','}']]

augroup rainbow_group
  autocmd VimEnter * RainbowParentheses
augroup END
