function print () {
    if [ -x "$(command -v gum)" ]; then
        gum log --time rfc822 --level info $1
        return
    fi
    tput setaf 2;
    echo $1;
    tput sgr 0;
}