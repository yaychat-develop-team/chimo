# 检测分支是否存在于本地仓库。
# 本地存在返回 1，否则返回 0。
function branch_is_in_local() {
    local branch=${1}
    local git_dir='./.git/'
    
    # 若设置了 $2，则 git_dir=$2
    [ -z ${2} ] || git_dir=${2}

    local existed_in_local=`git --git-dir ${git_dir} branch --list ${branch}`
    if [[ -z ${existed_in_local} ]]; then
        echo 0
    else
        echo 1
    fi
}

# 检测分支是否存在于远程仓库。
# 远程存在返回 1，否则返回 0。
function branch_is_in_remote() {
    local branch=${1}
    local git_dir='./.git/'
    
    # 若设置了 $2，则 git_dir=$2
    [ -z ${2} ] || git_dir=${2}

    local existed_in_remote=$(git --git-dir ${git_dir} ls-remote --heads origin ${branch})

    if [[ -z ${existed_in_remote} ]]; then
        echo 0
    else
        echo 1
    fi
}

# 检测分支是否存在于远程仓库。
# 远程存在返回 1，否则返回 0。
function is_branch_exist() {
    local branch=${1}
    local git_dir='./.git/'
    
    # 若设置了 $2，则 git_dir=$2
    [ -z ${2} ] || git_dir=${2}

    retval=1
    branch_exist=$( branch_is_in_local $BRANCH_NAME $git_dir)
    if [[ $branch_exist == 0 ]]; then
        branch_exist=$( branch_is_in_remote $BRANCH_NAME $git_dir)
        if [[ $branch_exist == 0 ]]; then
            retval=0
        fi
    fi

    echo $retval
}


function checkout_and_pull() {
    local branch=${1}
    local git_dir='./.git/'

    # 若设置了 $2，则 git_dir=$2
    [ -z ${2} ] || git_dir=${2}

    # 清除所有本地改动
    git --git-dir $git_dir checkout .
    git --git-dir $git_dir clean -df

    # 拉取本地可能尚不存在的新分支
    git --git-dir $git_dir fetch origin $branch

    # 强制切换到 $branch
    git --git-dir $git_dir checkout -f $branch

    # 清除切换新分支带来的所有改动
    git --git-dir $git_dir checkout .
    git --git-dir $git_dir clean -df

    # 将远程新改动拉取到本地
    git --git-dir $git_dir pull origin $branch --progress -v
} 
