pull () {
    local branch=$this
    if [ $1 ] then
        branch=$1
    fi 

    echo "Do you want to pull from \"$branch\" branch? [y/n]: "
    read -n 1 shouldPull
    echo

    if [ $shouldPull == "y" ] then
        git pull origin $1
    fi    
}