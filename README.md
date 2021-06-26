
## very basics
```bash
$ git init
$ git add *.c
$ git commit -m 'Initial project version'
$ git clone https://github.com/libgit2/libgit2
$ git clone https://github.com/libgit2/libgit2 mylibgit
$ git status # always use this, this is more powerful than it seems
$ git add README.md
$ git status -s  # short status
$ echo "*.[oa]" >> .gitignore
$ git diff
$ git diff --staged # --staged and --cached are synonyms
$ git commit
$ git commit -m "Story 182: fix benchmarks for speed"
$ git commit -a -m 'Add new benchmarks' # stage and commit all files already tracked
$ git rm PROJECTS.md
$ git rm lob/\*.log # git does its own filename expansion, hence the backslash
$ git rm \*~  # remove all files ending with a ~
$ git rm -f PROJECTS.md  # in case unstaged modifications to file
$ git rm --cached README.md # keep files in working tree, but remove them from staging, e.g. you forgot to update the .gitignore
$ git mv file_from file_to


$ git log
$ git log -p                # shows the difference introduced by each commit
$ git log -p -2             # limit log entries to 2
$ git log --stat            # shows abbreviated stats for each commit
$ git log --since=2.weeks
$ git log -S function_name
$ git log -- path/to/file
```


## undoing things
```bash
$ git commit --amend
# you commit too early and forgot to add files


```






## Showing your remotes
```bash
# "origin" is the default name Git gives to the server you cloned from
$ git remote     # lists the shortnames of each remote
$ git remote -v  # in addition shows the urls
```


## Adding remote repositories
```bash
# "git clone" will implicitly adds the "origin" remote for you
# git remote add <shortname> <url>
$ git remote add pb https://github.com/pb/my-repo
$ git remote -v
$ git fetch pb  # fetch all info from this remote

# pb master is now availale at "pb/master"
```


## Fetching and pulling from your remotes
```bash
# git fetch <remote> ;
# to fetch data from remote projects, e.g. all branches
# only download data, does not merge
$ git fetch origin

# git pull
# automatically fetch and then merge
# use this if your current branch is set up to trach a remote branch

# git config --global pull.rebase "false"
# turn on/off automatic rebase when pulling
```


## Pushing to your remotes
```bash
# git push <remote> <branch>
$ git push origin master

$ git push
# By default only updates the corresponding branch on the remote
# use git status to know th ebranch you are about to push in
```


## Inspecting a remote
```bash
# git remote show <remote>
# show information about a particular remote
$ git remote show origin
# it lists the url for the remote repo as well as the tracking branch info
```


## Renaming and removing remotes
```bash
$ git remote rename pb paul
# will rename pb to paul
# pb/master is now at paul/master

$ git remote remove paul
# delete reference to remote
# all remote tracking branches and configurations settings are also deleted
```


## listing your tags
```bash
$ git tag
# lists the tags in alphabetical order

$ git tag -l "v1.8.5*"
# searches for tag tht match a particular pattern
# listing tag wildcard requires -l or --list option
```


## creating tags
2 types of tags:
*
* annotated -



## annotated tags
```bash
$ git tag -a v1.4 -m "my version 1.4"
# -a means annotated
# annotated tags are full objects in Git database,
# they are checksummed, contains metadata like email of creator, can be signed
# and verify

# -m specifies the tagging message

$ git show v1.4
# shows the tag data along with the commit that was tagged
```


## lightweight tags
```bash
# lightweight - like a static branch, just a pointer to a specific commit
# it is basically the commit checksum stored in a file
$ git tag v1.4-lw
```


## tagging past commits

```bash
$ git tag -a v1.2 9fceb02
# you can tag commit after you've moved past them
# 9fceb02 is the commit checksum
```


## sharing tags
```bash
# git push, by default won't transfer tags to remote servers
# you have to explicitly push tags
# git push origin <tagname>
$ git push origin v1.5

$ git push origin --tags
# will push all tags at once, both lightweight and annotated
```


## deleting tags
```bash
# git tag -d <tagname>
# will delete tag on your local repository
$ git tag -d v1.4-lw


# git push <remote> :refs/tags/v1.4-lw
# will delete tag from remote server

# git push <remote> --delete <tagname>
# is a more intuitive way to delete tag from remote
```


## checking out tags
```bash
# if you want the version of repo a given tag points to...
$ git checkout v2.0.0
# this will create detached HEAD, i.e. new commits are not reachable
# instead you may want to create a branch from a given tag, like this
$ git checkout -b version_2_fix v2.0.0
