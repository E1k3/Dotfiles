function remote_session
{
	if [[ -n $SSH_CLIENT ]]; then
		echo '%n@%m '
	fi
}

function pwd_or_repo
{
	if [[ -n $(git_prompt_info) ]]; then
		echo %{$fg_bold[green]%}$(basename `git remote get-url origin`)%{$reset_color%}:$(git_prompt_info)
	else
		echo "%~ "
	fi
}

PROMPT='%{$fg[black]%}$(pwd_or_repo)%{$reset_color%}%{${fg_bold[black]}%}$(remote_session)> %{$reset_color%}'
RPROMPT=''

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[green]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg_bold[red]%}✗%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN=" "
