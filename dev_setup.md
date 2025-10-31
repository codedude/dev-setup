# Macos env setup 

## yabai & skhd

> (SKHD)[https://github.com/koekeishiya/skhd], (Yabai)[https://github.com/koekeishiya/yabai/wiki#quickstart-guide]

### TODO
- config skhd avec les commandes de yabai
- config yabai


## tmux

[-> Official documentation](https://github.com/tmux/tmux/wiki/Getting-Started)

> The prefix key is <C-b> by default.

> The meta key is M.

> Command prompt starts with <C-b :>, let's call it <CMD>


- tmux help: <C-b ?> or "tmux lsk"
- start tmux: tmux new
- attach: tmux attach [-tSESSION] (-dtSESSION detach other clients)
  - -ASESSIONS: attach to SESSION or create it (-D for -d behavior)
- detach: <C-b d>
- list sessions/windows/panes: tmux ls[s|w|p]
- kill tmux: ":kill-server"
- new window: <C-b c> or "<CMD> neww ..." (same flags as cli)
- split window: <C-b %> = hor, <C-b "> = ver
  - tmux splitw:  -f: take whole width or height
                  -h/-v: split hor/ver
                  -d: do not change active pane
                  -b: puts new pane left/above instead of right/below
- change window: <C-b X>
  - 0, 1...: to window 0, 1...
  - ': ask for window index
  - n/p/i: next/previous/last
- change active pane: <C-b X>
  - Up/Down/Left/Right
  - q: prints pane number + size
  - q X: change to pane X
  - o: moves to next pane
  - C-o: swaps pane (pos and size)
- kill window: <C-b &>
- kill pane: <C-b x>
- rename session/window: <C-b $/,>
- list other clients: <C-b D>
- detach other clients: <C-b d/D/x/X> d/x=selected, D/X=tagged, d=detach, x=detach+kill shell
- swap windows and panes:
  - mark as swappable: <C-b m> (M reset marks, only one)
  - swap: <CMD swap-pane>
  - swap above/below (index): <C-b {/}>
  - renumbered windows: <CMD movew -r>
  - move window: <C-b .> or <CMD move-window -kt999>
- resize panes:
  - small steps: <C-b> <C-Left/Right/Up/Down>
  - larger steps: <C-b><M-Left/Right/Up/Down>
  - zoom/unzoom temporarly: <C-b z>
- window layouts: <C-b Space> or <C-b M-1/2/3/4/5>
- activate mouse: <CMD set -g mouse on>
- conf file: ~/.tmux.conf (<CMD source ~/.tmux.conf>)


### TODO
- copy vi style

