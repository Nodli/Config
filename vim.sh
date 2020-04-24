#!/bin/bash

cd $(dirname $0)
cd source

executable_path="./../linux/makerun.sh"
session_path="./../linux/session.vim"

vim -c ":nnoremap <F5> :wa<CR> :!${executable_path}<CR>"                                                                                                                        \
    -c ":nnoremap <F6> :!<CR>"                                                                                                                                                  \
    -c ":autocmd VimEnter * if filereadable(\"${session_path}\") | :source ${session_path} | else | :args **/*.h **/*.cpp **/*.inl | :set filetype=cpp | endif"                 \
    -c ":autocmd VimLeave * :mksession! ${session_path}"                                                                                                                        \
    -c ":set number"                                                                                                                                                            \
    -c ":nnoremap <F7> :e %:p:s,.h$,.X123X,:s,.cpp$,.h,:s,.X123X$,.cpp,<CR>"                                                                                                    \
    -c ":autocmd VimEnter * :b main.cpp | :set filetype=cpp"                                                                                                                    \
