# dev-machine-setup
Install pipx.

Install Atuin.

Install fx.

Install Starship.

Insall eza.

Install lazygit.

Add to `.zshrc`:
```bash
eval "$(atuin init zsh)"
eval "$(starship init zsh)"

alias lg="lazygit"
alias ls="eza"
alias la="eza --long --all --group"
```

Install Lunarvim dependencies for nvim.

Copy paste nvim configs from nvim_configs dir.

Copy paste tmuxp configs from tmuxp_configs dir.