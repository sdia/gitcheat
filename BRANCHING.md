A branch is a pointer to commit

HEAD is a special pointer, it points to the local branch you are currently on.

git log, shows where point is


```bash
$ git branch testing     # create branch
$ git checkout testing   # switch to testing
$ git switch testing     # since Git 2.23
$ git switch -c testing  # create and switch to branch
$ git switch -  # returns to previously checked out
```


```bash
$ git switch -c hotfix
$ git switch master
$ git merge hotfix  # fast-forward means the merge is just moving pointers,
# there is no conflicts and no divergence, therefore the new master is got by
# moving pointers to last commit of branch hotfix
$ git branch -d hotfix
```


## 3 way merge
when merging two diverging branches, i.e the current branch is not a direct
ancestor of the branch to be merged in, Git does a 3 way merge: using the 2
snapshots pointed to by the branch tips(B and C) and the common ancestor of the
2 (A)

```bash
        /--------------(B)
------(A)------
               \-----------------(C)
```

The result of the 3-way merge is a new commit pointing to both (B) and (C), i.e
a merge commit.


## merge conflicts

remember HEAD is your current branch in which you want to merge in
use git status and follow instructions


## more branches

 ```bash
$ git branch
$ git branch --all
$ git branch -v
$ git branch --merged
$ git branch --no-merged
$ git branch -d testing
$ git checkout testing
$ git switch testing
$ git switch -c testing
$ git branch --no-merged master
$ git branch --move bad-branch-name corrected-branch-name
$ git push origin --delete bad-branch-name




$ git branch --move main master
$ git push --set-upstream origin master
$ git push origin --delete main

```


## remote branches
... or orgin/master vs master


## pushing
```bash
$ git push origin server-fix
$ git fetch origin
$ git checkout -b serverfix origin/serverfix
```


## tracking branches
```bash
$ git checkout --track origin/serverfix
# is a shorthand for: git checkout -b serverfix origin/serverfix

$ git checkout serverfix  # if the branch name exist already on remote,
# this shortcut command will checkout and track in one go

$ git checkout -b sf origin/serverfix # now your local branch sf will pull
# from origin/serverfix

$ git branch -u origin/serverfix # set upstream

$ git branch -vv  # maybe run; git fetch --all

```


## pulling
```bash
$ git fetch && git merge  ## this is git pull
# generally it is better to simply use the fetch and merge commands explicitly
# as the magic of git pull can often be confusing
```





## basic rebase
