#view
set -g theme_display_date yes
set -g theme_date_format "+%F %H:%M"
set -g theme_display_git_default_branch yes
set -g theme_color_scheme dark

#path
set -x PATH $HOME/.nodebrew/current/bin $PATH

#peco setting
set fish_plugins theme peco

function fish_user_key_bindings
    bind \cr peco_select_history
    bind \cg '__ghq_repository_search'
end

function __ghq_repository_search
    set selected_repository (ghq list | peco --query "$LBUFFER")
    if test -n "$selected_repository"
        cd (ghq root)/"$selected_repository"
        commandline -f repaint
    end
end

alias g='git'
alias gs='git status'
alias gd='git diff'
alias gco='git checkout'
alias gcp='git cherry-pick'
alias gl='git log'
alias cc='clear'

starship init fish | source