# Advanced Git

sce: https://www.youtube.com/watch?v=0SJCYPsef54


## Commit by hand (repo internals)

A commit is not a diff, its more like a snapshot

  $ git init projectname
  $ echo "hello world" | git hash-object -w --stdin
  $ git cat-file -p 1e0d4ee
  $ git cat-file -t 1e0d4ee
  $ git updade-index --add --cacheinfo 1e0d4ee hello-world.txt
  $ git write-tree
  $ git cat-file -t bf8cc
  $ git cat-file -p bf8cc
  $ git commit-tree bf8cc -m "commit message"  3f62


refs/head is where branches are stored, branches are file in refs/head

  $ cat .git/HEAD
    ref: refs/heads/master

  $ git update-ref refs/heads/master 3f62    # commit hash


now git status and git log work

but we still do not have files in the working directory

  $ git checkout HEAD -- hello-world.txt
    # dash-dash (--) separate all the options switches and parameters from the list of files

git status is finally happy

  $ cat hello-world.txt




## Rebase

When you don't want a merge commit

  $ git merge feature
  $ git reset --hard fc60

  $ git rev-parse master  #896e

  $ git reflog

  $ git rev-parse HEAD@{1}

  $ git reset --hard HEAD@{1}

  $ git reset --hard HEAD@{3}


reset applies to the branch you are on, be carefull when you reset

  $ git rev-parse master

  $ git checkout feature
  $ git rebase master


rebase can make a mess in the reflog, be prepare... squash?

  $ git checkout master
  $ git merge feature # fast-forward





## Interative Rebase

Commit often,
Commit should tell a story,
Cherry pick will let you pull a commit,
Checkpoint commit are note cherry pickable,
Git encourage cohesive commits,
Some commits are coupled together, we can fix that, with interactive rebase



To interactive rebase you need to provide the commit that is one pass the commit you want to pick,

if you are a checkpointer, squash before you share,

  git rebase fcee60


a better alternative

  git rev-parse HEAD~5   # fcee60
  git rebase -i HEAD~5   # 5 commits ago instead of the exact commit


if something bad happen, in most cases undo is HEAD@{1}

  git reset --hard HEAD@{1}






## rebase-on-pull


## Pull Requests




## External diff tools
Never work right the first time

  git diff # regular diff

P4merge merge tool, a free tool
Configuration manager,

  .git/config                      # local config, highest priority
  git config monkey.angry  true    # create a new section in .git/config

  git config --global monkey.angry false
    # global is overwritten by local
    # monkey is still angry

  git config merge.tool p4merge




## Advanced logging





## Reflog





## Reset
