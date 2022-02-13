#!/bin/bash
if tty -s || [[ $CI == true && $GITHUB_ACTIONS == true ]]; then
	if tput setaf 0 &> /dev/null; then
		ALL_OFF="$(tput sgr0)"
		BOLD="$(tput bold)"
		BLUE="${BOLD}$(tput setaf 4)"
		GREEN="${BOLD}$(tput setaf 2)"
		RED="${BOLD}$(tput setaf 1)"
		YELLOW="${BOLD}$(tput setaf 3)"
	else
		ALL_OFF="\033[0m"
		BOLD="\033[1m"
		BLUE="${BOLD}\033[34m"
		GREEN="${BOLD}\033[32m"
		RED="${BOLD}\033[31m"
		YELLOW="${BOLD}\033[33m"
	fi
	readonly ALL_OFF BOLD BLUE GREEN RED YELLOW
fi

dbug()
{
	local mesg=$1
	shift
	printf "::debug::${BLUE}::${ALL_OFF}${BOLD} ${mesg}${ALL_OFF}\n" "$@" >&2
}

info()
{
	local mesg=$1
	shift
	printf "${GREEN}::${ALL_OFF}${BOLD} ${mesg}${ALL_OFF}\n" "$@" >&2
}

warn()
{
	local warn=$1 mesg=$2
	shift 2
	if [[ $CI == true && $GITHUB_ACTIONS == true ]]; then
		printf "::notice${warn:+ $warn}:::: ${mesg}\n" "$@" >&2
		return
	fi
	printf "::${YELLOW}::${ALL_OFF}${BOLD} ${mesg}${ALL_OFF}, ${warn:+ $warn}\n" "$@" >&2
}

fail()
{
	local err=$1 mesg=$2
	shift 2
	if [[ $CI == true && $GITHUB_ACTIONS == true ]]; then
		printf "::error${err:+ $err}:::: ${mesg}\n" "$@" >&2
		return
	fi
	printf "::${RED}::${ALL_OFF}${BOLD} ${mesg}${ALL_OFF}, ${err:+ $err}\n" "$@" >&2
}
