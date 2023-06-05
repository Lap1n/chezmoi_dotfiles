#!/usr/bin/env bash

# replace with your terminal
term_exec=wezterm

server_path=$HOME/.cache/nvim/com.unity.server.pipe

if ! [ -e $server_path ]; then
    # start the server if its pipe doesn't exist
    $term_exec start -- nvim --listen $server_path +$2 $1
fi

# open file in server
$term_exec start -- nvim --server $server_path --remote-send "<C-\><C-n>:n $1<CR>:call cursor($2,$3)<CR>"
