# dotfiles

I usually work on Git Bash (on Windows), connecting to Ubuntu & CentOS servers. Root access is not always (in fact seldom) available.

## bashrc (for Git Bash)

Major features include,

- Auto-completion support for SSH hosts;
- Start `ssh-agent` automatically;
- ~Fixed issues when not started as login shell;~ Why not start bash using `-l -i`

## tmux.conf

I've merged some features from [tony/tmux.conf](https://github.com/tony/tmux-config). Major features include,

- Support for some older versions of `tmux` (1.8 on CentOS);
- Mouse support;
- Forked panes now inherent the cwd from the parent;
- `hjkl`-style pane navigation;
- `Control-a` prefix;
- Use `v` and `y` in `copy-mode-vi`;
