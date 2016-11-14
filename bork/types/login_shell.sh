action=$1
shell=$2
shift 2

case $action in
desc)
    echo "asserts current user's login shell"
    echo "* shell /bin/zsh        (sets current shell)"
    ;;
status)
    case $platform in
        Darwin) current_shell="$(dscl localhost -read /Local/Default/Users/"$USER" shell|grep -oE '[^ ]+$')" ;;
        *) current_shell="$(getent passwd "$USER" | awk -F : '{print $NF}')" ;;
    esac
    [ $current_shell = $shell ] && return $STATUS_OK
    return $STATUS_MISSING
    ;;

install)
    bake 'chsh -s $shell'
    ;;

*) return 1 ;;
esac
