function remote_session
{
	if [[ -n $SSH_CLIENT ]]; then
		echo "%{$fg_bold[black]%}%n@%m %{$reset_color%}"
	fi
}

function where_am_i
{
	local ref
	# Is pwd in git repo?
	if [[ -n $(git_prompt_info) ]]; then
		local repo_root=$(git rev-parse --show-toplevel)
		local relative_pwd=$(realpath --relative-to=$repo_root $(pwd))

		ref="%{$fg_bold[green]%}$(basename `git remote get-url origin 2>/dev/null` 2>/dev/null)%{$reset_color%}"
		local ret=$?
		if [[ $ret != 0 ]]; then
			ref="%{$fg_bold[red]%}$(basename $repo_root)%{$reset_color%}"
		fi

		ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[green]%}$(git_current_branch)%{$reset_color%}"
		ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[red]%}$(git_current_branch)%{$reset_color%}"
		# Print repo:branch with colorcoding for existing remote origin and git status
		ref="${ref}:$(parse_git_dirty)"
		if [[ $relative_pwd != "." ]]; then
			ref="${ref}/$relative_pwd "
		else
			ref="${ref} "
		fi
	else
		ref="%~ "
	fi

	echo $ref
}

PROMPT='$(remote_session)$(where_am_i)> '
RPROMPT='%{$fg_bold[red]%}%(?..[%?])%{$reset_color%}'
