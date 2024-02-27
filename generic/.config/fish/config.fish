set -gx GOPATH '/vacht/.go'

alias ls='exa -aln --octal-permissions --no-permissions --no-time'

function fish_title
    set -q argv[1]; or set argv fish
    echo "$USER at $hostname": (fish_prompt_pwd_full_dirs=5 prompt_pwd);
end

function fish_greeting
    echo (set_color -o blue)$USER (set_color white)'at' (set_color -o blue)$hostname
end

function fish_prompt
    echo -n (set_color blue)(prompt_pwd) (set_color white)'❯'(set_color yellow)'❯'(set_color green)'❯ '  
end

function fish_right_prompt 
end

if status is-interactive
end

if status is-login
    bass source /etc/profile
end


