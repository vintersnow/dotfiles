augroup MyAutoCmd
  autocmd!

  autocmd CursorHold *? syntax sync minlines=300

  " シェルスクリプト１行実行
  autocmd FileType sh :noremap R :.w !$SHELL<Return>
augroup END
