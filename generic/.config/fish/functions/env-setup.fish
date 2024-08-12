function export
end

function fish_desktop_setup
    set -Ux CLUTTER_BACKEND wayland
    set -Ux GDK_BACKEND wayland,x11
    set -Ux GTK_SCALE 1
    set -Ux GTK_THEME Adwaita:dark
    set -Ux QT_AUTO_SCREEN_SCALE_FACTOR 1
    set -Ux QT_QPA_PLATFORM wayland,xcb
    set -Ux QT_WAYLAND_DISABLE_WINDOWDECORATION 1
    set -Ux QT_WPA_PLATFOMRTHEME qt5ct
    set -Ux SDL_VIDEODRIVER wayland,x11
    set -Ux XDG_CURRENT_DESKTOP river
    set -Ux XDG_SESSION_DESKTOP river
    set -Ux XDG_SESSION_TYPE wayland
    echo "Desktop environment setup done!"
end
