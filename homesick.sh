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

        # homesick cd CASTLE
        if [[ ${prev} == "cd" ]]; then
            opts=$(homesick list | sed -e 's/^[ \t]*//' -e "s/  .*//g")
            COMPREPLY=( $(compgen -W "${opts}" -- ${cur}) )
            return 0
        fi

        # homesick clone URI CASTLE_NAME
        if [[ ${prev} == "clone" ]]; then
            return 0
        fi

        # homesick commit CASTLE MESSAGE
        if [[ ${prev} == "commit" ]]; then
            opts=$(homesick list | sed -e 's/^[ \t]*//' -e "s/  .*//g")
            COMPREPLY=( $(compgen -W "${opts}" -- ${cur}) )
            return 0
        fi

        # homesick destroy CASTLE
        if [[ ${prev} == "destroy" ]]; then
            opts=$(homesick list | sed -e 's/^[ \t]*//' -e "s/  .*//g")
            COMPREPLY=( $(compgen -W "${opts}" -- ${cur}) )
            return 0
        fi

        # homesick diff CASTLE
        if [[ ${prev} == "diff" ]]; then
            opts=$(homesick list | sed -e 's/^[ \t]*//' -e "s/  .*//g")
            COMPREPLY=( $(compgen -W "${opts}" -- ${cur}) )
            return 0
        fi

        opts="cd clone commit destroy diff exec exec_all generate help link list open pull push rc show_path status track unlink version"
        COMPREPLY=( $(compgen -W "${opts}" -- ${cur}) )
        return 0

    fi

}
complete -F _homesick homesick
