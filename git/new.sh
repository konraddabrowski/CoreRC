new () {
    echo "Branch type:"
    echo "1. bugfix"
    echo "2. feature"
    echo "3. hotfix"
    echo "4. release"
    read -n 1 branchType
    echo

    local branchName=""

    if [ $1 ]
    then
        branchName="$UserName/$1"
    else
        echo "JIRA number: "
        read jiraNumber
        branchName="$UserName/$jiraNumber"
    fi

    case $branchType in
        1) branchType="bugfix/"
           ;;
        2) branchType="feature/"
           ;;
        3) branchType="hotfix/"
           ;;
        4) branchType="release/"
           ;;
        *) branchType=""
           ;;
    esac

    branchName="$branchType$branchName"

    echo "Do you want to create the $branchName branch from the $this branch? [y/n]: "
    read -n 1 decission
    echo
    if [ $decission == "y" ]
    then
        this=$branchName
        git checkout -b $this
    else
        echo "How you wish."
    fi
}