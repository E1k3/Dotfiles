function remote_session
{
	if [[ -n $SSH_CLIENT ]]; then
		echo '%n@%m '
	fi
}

function where_am_i
{
	local ref
	# Is pwd in git repo?
	if [[ -n $(git_prompt_info) ]]; then
		ref="%{$fg_bold[green]%}$(basename `git remote get-url origin 2>/dev/null` 2>/dev/null)%{$reset_color%}"
		local ret=$?
		if [[ $ret != 0 ]]; then
			ref="%{$fg_bold[red]%}$(basename `git rev-parse --show-toplevel`)%{$reset_color%}"
		fi

		ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[green]%}$(git_current_branch)%{$reset_color%}"
		ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[red]%}$(git_current_branch)%{$reset_color%}"
		# Print repo:branch with colorcoding for existing remote origin and git status
		ref="${ref}:$(parse_git_dirty) "
	else
		ref="%~ "
	fi

	echo $ref
}

PROMPT='$(where_am_i)%{${fg_bold[black]}%}$(remote_session)> %{$reset_color%}'
