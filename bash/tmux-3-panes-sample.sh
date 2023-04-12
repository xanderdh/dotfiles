#!/bin/bash

# If inside tmux, create a new window with three panes
if [[ -n "$TMUX" ]]; then
    tmux new-window \; \
        send-keys 'cd ~; cc' C-m \; \
        split-window -v \; \
        send-keys 'cd ~; cc' C-m \; \
        split-window -h \; \
        send-keys 'cd ~; cc' C-m \; \
        select-pane -t 1 \; \;
else
    # Otherwise, start a new tmux session with one window and split into three panes
    tmux new-session \; \
        send-keys 'cd ~; cc' C-m \; \
        split-window -v \; \
        send-keys 'cd ~; cc' C-m \; \
        split-window -h \; \
        send-keys 'cd ~; cc' C-m \; \
        select-pane -t 1 \; \;
fi

