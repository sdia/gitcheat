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


 ```
