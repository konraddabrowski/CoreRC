add () {
    if [ "$this" != 'master' ] then
        git add $1
    else
        echo "You are currently on master branch. You can't add this changes"
    fi
}