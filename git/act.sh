act () {
    echo "Do you want to commit with message: \"[$this] $1\"? [y/n]:"
    read -n 1 shouldCommit
    echo

    if [ $shouldCommit == "y" ]
    then
        git commit -m "[$this] $1"
    else
        echo "Aborted"
    fi
}