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
# it lists the url for the remote repo as well as the tracking branch information

$ git remote show
# shorthand, shwo more information



```
