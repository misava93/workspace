# taken from: https://transitory.technology/fish-shell/
function fish_prompt

    # define hostname if not already defined
    if not set -q __fish_prompt_hostname
        set -g __fish_prompt_hostname (hostname|cut -d . -f 1)
    end

    # shortcuts for colors
    #set -l cyan (set_color -o cyan)
    #set -l yellow (set_color -o yellow)
    #set -l magenta (set_color -o magenta)
    set -l red (set_color -o red)
    #set -l blue (set_color -o blue)
    set -l normal (set_color normal)

    set -l user_color yellow
    set -l user_host_del_color white
    set -l host_color yellow
    set -l path_color magenta

    # pwd length
    set -U fish_prompt_pwd_dir_length 9999

    # cool emoji cat
    set -l cat $normal"🐱"

    # user
    set -l user "$USER"
    # user-host delimiter
    set -l user_host_del "@"
    # host
    set -l host "$__fish_prompt_hostname"
    #set -l user_host $cyan"$USER@$__fish_prompt_hostname"

    # set path
    set -l cwd (prompt_pwd)
    #set -l cwd $magenta(prompt_pwd)

    set -g __fish_git_prompt_show_informative_status 1
    set -g __fish_git_prompt_hide_untrackedfiles 1

    set -g __fish_git_prompt_color_branch magenta --bold
    set -g __fish_git_prompt_showupstream "informative"
    set -g __fish_git_prompt_char_upstream_ahead "↑"
    set -g __fish_git_prompt_char_upstream_behind "↓"
    set -g __fish_git_prompt_char_upstream_prefix ""

    set -g __fish_git_prompt_char_stagedstate "●"
    set -g __fish_git_prompt_char_dirtystate "✚"
    set -g __fish_git_prompt_char_untrackedfiles "…"
    set -g __fish_git_prompt_char_conflictedstate "✖"
    set -g __fish_git_prompt_char_cleanstate "✔"

    set -g __fish_git_prompt_color_dirtystate blue
    set -g __fish_git_prompt_color_stagedstate yellow
    set -g __fish_git_prompt_color_invalidstate red
    set -g __fish_git_prompt_color_untrackedfiles $fish_color_normal
    set -g __fish_git_prompt_color_cleanstate green --bold
    
    printf '%s ' $cat
    set_color $user_color
    printf '%s ' $user
    # set_color $user_host_del_color
    # printf '%s ' $user_host_del
    # set_color $host_color
    # printf '%s ' $host
    set_color white
    printf '%s ' 'in'
    set_color $path_color
    printf '%s %s %s\n\r' $cwd (__fish_git_prompt) $cat
end

