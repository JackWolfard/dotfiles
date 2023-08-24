if status is-interactive
    # Commands to run in interactive sessions can go here
    fish_add_path $HOME/.cargo/bin
    fish_add_path $HOME/.local/bin

    if command -q starship
        starship init fish | source
    end

    if command -q hx
        set -U EDITOR hx
    else if command -q vim
        set -U EDITOR vim
    end
    if command -q bat
        set -U PAGER bat
    else
        set -U PAGER less
    end

    abbr -a cl clear
    abbr -a gsf git show --pretty="" --name-status
    abbr -a gus git submodule update --recursive
    abbr -a grf "git submodule deinit -f . && git submodule update --init --recursive"
    abbr -a grph git rev-parse --short HEAD
    abbr -a zp "ps -ef | rg zellij"
end
