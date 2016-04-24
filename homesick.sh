_homesick_list_castles()
{
    echo $(homesick list | sed -e 's/^[ \t]*//' -e "s/  .*//g")
}

_homesick()
{
    local cur prev opts
    COMPREPLY=()
    cur="${COMP_WORDS[COMP_CWORD]}"
    prev="${COMP_WORDS[COMP_CWORD-1]}"

    # Long options
    if [[ ${cur} == -* ]] ; then
        long_opts="--force --pretend --quiet --skip --no-pretend --no-quiet --no-skip"
        COMPREPLY=( $(compgen -W "${long_opts}" -- ${cur}) )
        return 0
    fi

    # Short options
    if [[ ${cur} == - ]] ; then
        short_opts="-f -p -q -s"
        COMPREPLY=( $(compgen -W "${short_opts}" -- ${cur}) )
        return 0
    fi

    # Commands
    case "${prev}" in
        cd|commit|destroy|diff|exec)
            opts=$(_homesick_list_castles)
            COMPREPLY=( $(compgen -W "${opts}" -- ${cur}) )
            return 0
            ;;
        clone|exec_all)
            COMPREPLY=( $(compgen -f ${cur}) )
            return 0
            ;;
        *)
            ;;
    esac

    # ToDo: homesick generate PATH
    # ToDo: homesick help [COMMAND]
    # ToDo: homesick link CASTLE
    # ToDo: homesick list
    # ToDo: homesick open CASTLE
    # ToDo: homesick pull CASTLE
    # ToDo: homesick push CASTLE
    # ToDo: homesick rc CASTLE
    # ToDo: homesick show_path CASTLE
    # ToDo: homesick status CASTLE
    # ToDo: homesick track FILE CASTLE
    # ToDo: homesick unlink CASTLE
    # ToDo: homesick version

    opts="cd clone commit destroy diff exec exec_all generate help link list open pull push rc show_path status track unlink version"
    COMPREPLY=( $(compgen -W "${opts}" -- ${cur}) )
    return 0

}
complete -F _homesick homesick
