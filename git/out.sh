out () {
    local selectedBranch=$1
    if [ -z $selectedBranch ] then
        local branches
        branches[0]="master"
        echo "0. master"

        local index=1
        for branch in $(git branch) do
            if [[ $branch == *"$userName"* ]]; then
                echo "$index. $branch"
                branches[index]=$branch
                ((index++))
            fi
        done

        echo "Select branch to check out:"
        read branchName
        selectedBranch=${branches[branchName]}
    fi

    echo "Do you want to checkout to $selectedBranch? [y/n]: "
    read -n 1 shouldCheckout
    echo
    if [ $shouldCheckout == "y" ] then
        git checkout $selectedBranch
        this=$(git branch | group '*' | cut -c 3-)
    else
        echo "Process aborted"
    fi
}