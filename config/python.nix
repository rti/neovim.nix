{
  extraConfigVim = ''
    function! StartIPython()
      botright 15split
      terminal ipython --quick --TerminalInteractiveShell.separate_in="" --TerminalInteractiveShell.separate_out="" --TerminalInteractiveShell.separate_out2=""
      let g:ipython_buf = bufnr()
      normal! G
      wincmd p
    endfunction

    function! SendLine()
      call chansend(
            \ getbufvar(g:ipython_buf, '&channel'),
            \ getline('.') . "\n"
            \ )
    endfunction

    function! SendSelection() range
      let l:text = join(getline(a:firstline, a:lastline), "\n") . "\n"
      call chansend(
            \ getbufvar(g:ipython_buf, '&channel'),
            \ l:text
            \ )
    endfunction

    command! IPython call StartIPython()
    nnoremap <leader>xp :call SendLine()<CR>
    xnoremap <leader>xp :call SendSelection()<CR>
  '';
}
