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

### aliases
