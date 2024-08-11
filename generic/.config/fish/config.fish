alias l='eza -loa --no-permissions --smart-group --time-style=relative --git'
alias c='clear'
alias ff='fastfetch'

function hx
    command hx $argv
    printf '\033[0 q'
end

function fish_greeting
end

function fish_write
    set_color $argv[1]
    echo -en $argv[2]
    set_color normal
end

function fish_prompt
    fish_write normal "\n "
    fish_write magenta (prompt_pwd --full-length-dirs=99999)
    fish_write normal "\n := "
end

if status is-interactive
end

if status is-login
    bass source /etc/profile
end
