_homesick() 
{
    local cur prev opts
    COMPREPLY=()
    cur="${COMP_WORDS[COMP_CWORD]}"
    prev="${COMP_WORDS[COMP_CWORD-1]}"

    if [[ ${cur} == -* ]] ; then
        opts="--force --pretend --quiet --skip --no-pretend --no-quiet --no-skip"
        COMPREPLY=( $(compgen -W "${opts}" -- ${cur}) )
        return 0
    fi

    if [[ ${cur} == - ]] ; then
        opts="-f -p -q -s"
        COMPREPLY=( $(compgen -W "${opts}" -- ${cur}) )
        return 0
    fi
    
    if [[ ${cur} == * ]] ; then
        opts="cd clone commit destroy diff exec exec_all generate help link list open pull push rc show_path status track unlink version"
        COMPREPLY=( $(compgen -W "${opts}" -- ${cur}) )
        return 0
    fi

}
complete -F _homesick homesick
