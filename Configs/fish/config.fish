function fish_greeting
end

set -g theme_display_date no

function ls
    lsd -A --group-dirs first $argv
end
