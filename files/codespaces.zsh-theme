# Codespaces zsh prompt theme
__zsh_prompt() {
    local prompt_username
    if [ ! -z "${USER}" ]; then
        prompt_username="${USER}"
    else
        prompt_username="%n"
    fi
    local user_colour
    if [ "${USER}" = "root" ]; then
        user_colour="%F{#FE4C46}${prompt_username}"
    else
        user_colour="%F{#3FEB6A}${prompt_username}"
    fi
    PROMPT="${user_colour}%F{#FFFFFF}@%F{#3FEB6A}%m %(?:%f➜ :%{$fg_bold[red]%}➜ )" # User/exit code arrow
    PROMPT+='%{$fg_bold[blue]%}%(5~|%-1~/…/%3~|%4~)%f ' # cwd
    PROMPT+='$([ "$(git config --get codespaces-theme.hide-status 2>/dev/null)" != 1 ] && git_prompt_info)' # Git status
    PROMPT+='%{$fg[white]%}$ %{$reset_color%}'
    unset -f __zsh_prompt
}
ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[cyan]%}(%{$fg_bold[red]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%f "
ZSH_THEME_GIT_PROMPT_DIRTY=" %{$fg_bold[yellow]%}✗%{$fg_bold[cyan]%})"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg_bold[cyan]%})"
__zsh_prompt
