push () {
    local branch=$this
    if [ $1 ] then
        branch=$1
    fi

    echo "Do you want to push to \"$branch\" branch? [y/n]:"
    read -n 1 shouldPush
    echo

    if [ $shouldPush == "y" ] then
        git push origin $branch
    fi
}