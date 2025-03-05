function setup
    switch $argv[1]
        case base
            set -U fish_greeting
            echo 'Base environment setup done!'
        case desktop
            set -Ux CLUTTER_BACKEND wayland
            set -Ux GDK_BACKEND wayland
            set -Ux GTK_SCALE 1
            set -Ux GTK_THEME Adwaita:dark
            set -Ux QT_AUTO_SCREEN_SCALE_FACTOR 1
            set -Ux QT_QPA_PLATFORM wayland
            set -Ux QT_WAYLAND_DISABLE_WINDOWDECORATION 1
            set -Ux QT_WPA_PLATFOMRTHEME qt5ct
            set -Ux SDL_VIDEODRIVER wayland
            set -Ux XDG_CURRENT_DESKTOP river
            set -Ux XDG_SESSION_DESKTOP river
            set -Ux XDG_SESSION_TYPE wayland
            set -Ux TERM footclient
            echo 'Desktop environment setup done!'
        case '*'
            echo hi
    end
end
