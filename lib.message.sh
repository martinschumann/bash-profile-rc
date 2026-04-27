function _printMessage()
{
    r="\\033[0;31m";
    g="\\033[0;32m";
    b="\\033[0;34m";
    reset="\\033[0m";

    local message=$1;
    local type=$2;

    case "$type" in
        error)
            printf "\\r${r}[FAILED]${reset}   %s\\n" "${message}"
            ;;
        success)
            printf "\\r${g}[SUCCESS]${reset}  %s\\n" "${message}"
            ;;
        info)
            printf "\\r${b}[INFO]${reset}     %s\\n" "${message}"
            ;;
        *)
            ;;
    esac;
}
