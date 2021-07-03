# how to initialize a Git repository (in an existing directory)?
- git init

# how to track file.txt?
- git add file.txt

# how to check files status (staged and unstaged)?
- git status

# how to stage file.txt?
- git add file.txt

# how to get compact (short) files status (staged and unstaged)?
- git status -s
- git status --short

# where to declare untracked files as pattern?
- .gitignore

# .gitignore: ignore all .a files
- *.a

# .gitignore: *.a are ignored but track lib.a
- !lib.a

# .gitignore: only ignore TODO in current directory
- /TODO

# .gitignore: ignore all files in any directory named build
- build/

# .gitignore: ignore txt files in doc/ but not in its subfolder
- doc/*.txt

# .gitignore: ignore all .pdf files in the doc/ directory and any of its subdirectories
- doc/**/*.pdf

# what have you staged that will go to the next commit?
- git diff --staged
- git diff --cached

# what have you changed but not yet staged?
- git diff

# how to commit your changes?
- git commit

# how to commit automatically all tracked files skipping staging step?
- git commit -a

# how to untrack file.txt while keeping it in your working directory?
- git rm --cached file.txt

# how to rename an already tracked file.from to file.to?
- git mv file.from file.to

# how to view the commit history?
- git log

# how to view the commit history as well as the change introduced by each commit?
- git log -p
- git log --patch

# how to view commit history and limit logs entries to 3?
- git log -3

# how to view commit history in abbreviated stat mode?
- git log --stat

# how to view commit history relative to the number of occurences of the string function_name?
- git log -S function_name

# how to view commit history relative to the file path/file.txt ?
- git log -- path/file.txt

# how to redo the last commit: update message, change files etc.
- git commit --amend

# unstaging a staged file file.txt, using reset?
- git reset HEAD file.txt

# unmodifying a modified file?
- git checkout file

# unstaging a staged file file.txt, using restore?
- git restore --staged file.txt

# list the remotes name (shortname)?
- git remote
- git remote -v

# list the remotes, urls, and writing vs reading?
- git remote -v

# add a new remote git repo named eureka located at https://eureka.git
- git remote add eureka https://eureka.git

# fetch all information from the remote called origin?
- git fetch origin

# what does git pull do in terms of action_a && action_b?
- git fetch && git merge

# how to push your work to the master branch of origin repo? (full command)
- git push origin master

# how to see more information regarding your remote called origin?
- git remote show origin

# how to rename a remote called paul to mike?
- git remote rename paul mike

# how to list tags?
- git tag
- git tag -l
- git tag --list

# how to list tags using wildcard e.g. v1.8.5* ?
- git tag -l v1.8.5*
- git tag --list v1.8.5*

# what types of tag exist (alphabetical order)?
- lighweight annotated

# how to create annotated tag v1.4 with the tagging message "hello world"
- git tag -a v1.4 -m "hello world"

# how to create lighweight tag v1.4-lw?
- git tag v1.4-lw

# how to show information about tag v1.4?
- git tag show v1.4

# how to tag (annotated) the specific commit 9fceb02 to v1.4?
- git tag -a v1.4 9fceb02

# how to push tag v1.4 to origin?
- git push origin v1.4

# how to push all tags at once to origin?
- git push origin --tags

# how to delete tag v1.4 (local)?
- git tag -d v1.4

# how to delete a remote tag (using refs)?
- git push origin :refs/tags/v1.4

# how to delete a remote tag (using --delete)?
- git push origin --delete v1.4

# how to view version of files the tag v1.4 is pointing to?
- git checkout v1.4

# how to create a branch from tag v1.4 (with switch)?
- git switch -c v1.4

# how to create a branch name version1.4 from tag v1.4 (using checkout)?
- git checkout -b version1.4 v1.4

# how to create new branch my-branch (using branch)?
- git branch my-branch

# the name of the pointer to the branch you are currently on?
- HEAD

# how to switch to branch my-branch (using checkout)?
- git checkout my-branch

# how to create branch my-branch and switch to the newly created (using checkout)?
- git checkout -b my-branch

# how to switch to branch my-branch (using switch)?
- git switch my-branch

# how to create branch my-branch and switch to the newly created (using switch)?
- git switch -c my-branch
- git switch --create my-branch

# if you are on master how to merge the branch hotfix into master?
- git merge hotfix

# how to delete locally the branch hotfix?
- git branch -d hotfix

# how to list your local branches?
- git branch

# how to list your current branches and see the last commit on each branch?
- git branch -v

# how to list your branches and filter the one you have already merged to the current branch?
- git branch --merged

# how to see all the branches that contain work you haven’t yet merged in?
- git branch --no-merged

# how to rename branch bad-branch to good-branch?
- git branch --move bad-branch good-branch

# how to publish the branch my-branch on the remote named origin?
- git push origin --set-upstream my-branch
- git push origin -u my-branch

# how to delete the branch my-branch on the remote named origin?
- git push origin --delete my-branch

# how to list all branches local and remote?
- git branch --all

# how to get full information of remote branches on the origin remote?
- git remote show origin

# what is the full command to push to the branch my-branch on the remote origin?
- git push origin my-branch

# how to push from my-branch to the-other-branch on remote origin?
- git push origin my-branch:the-other-branch

# how to push from my-branch to the-other-branch on remote origin and track from now on?
- git push origin -u my-branch:the-other-branch

# your colleague created a new branch their-branch on remote origin, create a new branch my-branch from it?
- git checkout -b my-branch origin/their-branch

# how to make your current branch track orign/their-branch?
- git branch -u origin/their-branch
- git branch --set-upstream origin/their-branch

# how to see branch with tracking information?
- git branch -vv

# how to rebase your current branch on master?
- git rebase master

# how to check for whitespaces error before commit?
- git diff --check

# how to partially stage changes in the same file?
- git add --patch
- git add -p

# how to display the commits in origin/develop that are not in my-branch?
- git log my-branch..origin/develop

# how te see commit history excluding merge?
- git log --no-merges

# how to compare commits between my-branch(behind) and origin/develop(ahead) excluding merges?
- git log --no-merges my-branch..origin/develop

# how to merge my-branch squashing all commits into one?
- git merge --squash my-branch

# how to check the work my-branch has introduced since its common ancestor with master?
- git diff master...my-branch

# how to pull a single commit e43a6 into your current branch?
- git cherry-pick e43a6

# how to generate a build number from master?
- git describe master

# how to inspect commit 2bdf86
- git show 2bdf86

# how to inspect branch my-branch?
- git show my-branch

# how to see a logs of where HEAD had been?
- git reflog




































##
