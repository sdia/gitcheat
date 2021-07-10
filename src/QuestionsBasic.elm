module QuestionsBasic exposing (questions)

import Question exposing (Answer, Question)


questions =
    [ Question
        "how to initialize a Git repository (in an existing directory)?"
        "hint"
        [ "git init" ]
    , Question
        "how to track file.txt?"
        "hint"
        [ "git add file.txt" ]
    , Question
        "how to check files status (staged and unstaged)?"
        "hint"
        [ "git status" ]
    , Question
        "how to stage file.txt?"
        "hint"
        [ "git add file.txt" ]
    , Question
        "how to get compact (short) files status (staged and unstaged)?"
        "hint"
        [ "git status -s"
        , "git status --short"
        ]
    , Question
        "where to declare untracked files as pattern?"
        "hint"
        [ ".gitignore" ]
    , Question
        ".gitignore: ignore all .a files"
        "hint"
        [ "*.a" ]
    , Question
        ".gitignore: *.a are ignored but track lib.a"
        "hint"
        [ "!lib.a" ]
    , Question
        ".gitignore: only ignore TODO in current directory"
        "hint"
        [ "/TODO" ]
    , Question
        ".gitignore: ignore all files in any directory named build"
        "hint"
        [ "build/" ]
    , Question
        ".gitignore: ignore txt files in doc/ but not in its subfolder"
        "hint"
        [ "doc/*.txt" ]
    , Question
        ".gitignore: ignore all .pdf files in the doc/ directory and any of its subdirectories"
        "hint"
        [ "doc/**/*.pdf" ]
    , Question
        "what have you staged that will go to the next commit?"
        "difference is key here..."
        [ "git diff --staged"
        , "git diff --cached"
        ]
    , Question
        "what have you changed but not yet staged?"
        "hint"
        [ "git diff" ]
    , Question
        "how to commit your changes?"
        "hint"
        [ "git commit" ]
    , Question
        "how to commit automatically all tracked files skipping staging step?"
        "hint"
        [ "git commit -a" ]
    , Question
        "how to untrack file.txt while keeping it in your working directory?"
        "hint"
        [ "git rm --cached file.txt" ]
    , Question
        "how to rename an already tracked file.from to file.to?"
        "hint"
        [ "git mv file.from file.to" ]
    , Question
        "how to view the commit history?"
        "hint"
        [ "git log" ]
    , Question
        "how to view the commit history as well as the change introduced by each commit?"
        "hint"
        [ "git log -p"
        , "git log --patch"
        ]
    , Question
        "how to view commit history and limit logs entries to 3?"
        "hint"
        [ "git log -3" ]
    , Question
        "how to view commit history in abbreviated stat mode?"
        "hint"
        [ "git log --stat" ]
    , Question
        "how to view commit history relative to the number of occurences of the string function_name?"
        "hint"
        [ "git log -S function_name" ]
    , Question
        "how to view commit history relative to the file path/file.txt ?"
        "hint"
        [ "git log -- path/file.txt" ]
    , Question
        "how to redo the last commit: update message, change files etc."
        "hint"
        [ "git commit --amend" ]
    , Question
        "unstaging a staged file file.txt, using reset?"
        "hint"
        [ "git reset HEAD file.txt" ]
    , Question
        "unmodifying a modified file?"
        "hint"
        [ "git checkout file" ]
    , Question
        "unstaging a staged file file.txt, using restore?"
        "hint"
        [ "git restore --staged file.txt" ]
    , Question
        "list the remotes name (shortname)?"
        "hint"
        [ "git remote"
        , "git remote -v"
        ]
    , Question
        "list the remotes, urls, and writing vs reading?"
        "hint"
        [ "git remote -v" ]
    , Question
        "add a new remote git repo named eureka located at https://eureka.git"
        "hint"
        [ "git remote add eureka https://eureka.git" ]
    , Question
        "fetch all information from the remote called origin?"
        "hint"
        [ "git fetch origin" ]
    , Question
        "what does git pull do in terms of action_a && action_b?"
        "hint"
        [ "git fetch && git merge" ]
    , Question
        "how to push your work to the master branch of origin repo? (full command)"
        "hint"
        [ "git push origin master" ]
    , Question
        "how to see more information regarding your remote called origin?"
        "hint"
        [ "git remote show origin" ]
    , Question
        "how to rename a remote called paul to mike?"
        "hint"
        [ "git remote rename paul mike" ]
    , Question
        "how to list tags?"
        "hint"
        [ "git tag"
        , "git tag -l"
        , "git tag --list"
        ]
    , Question
        "how to list tags using wildcard e.g. v1.8.5* ?"
        "hint"
        [ "git tag -l v1.8.5*"
        , "git tag --list v1.8.5*"
        ]
    , Question
        "what types of tag exist (alphabetical order)?"
        "hint"
        [ "lighweight annotated" ]
    , Question
        "how to create annotated tag v1.4 with the tagging message 'hey'."
        "hint"
        [ "git tag -a v1.4 -m 'hey'" ]
    , Question
        "how to create lighweight tag v1.4-lw?"
        "hint"
        [ "git tag v1.4-lw" ]
    , Question
        "how to show information about tag v1.4?"
        "hint"
        [ "git tag show v1.4" ]
    , Question
        "how to tag (annotated) the specific commit 9fceb02 to v1.4?"
        "hint"
        [ "git tag -a v1.4 9fceb02" ]
    , Question
        "how to push tag v1.4 to origin?"
        "hint"
        [ "git push origin v1.4" ]
    , Question
        "how to push all tags at once to origin?"
        "hint"
        [ "git push origin --tags" ]
    , Question
        "how to delete tag v1.4 (local)?"
        "hint"
        [ "git tag -d v1.4" ]
    , Question
        "how to delete a remote tag v1.4 (using refs)?"
        "hint"
        [ "git push origin :refs/tags/v1.4" ]
    , Question
        "how to delete a remote tag v1.4 (using --delete)?"
        "hint"
        [ "git push origin --delete v1.4" ]
    , Question
        "how to view version of files the tag v1.4 is pointing to?"
        "hint"
        [ "git checkout v1.4" ]
    , Question
        "how to create a branch from tag v1.4 (with switch)?"
        "hint"
        [ "git switch -c v1.4" ]
    , Question
        "how to create a branch name version1.4 from tag v1.4 (using checkout)?"
        "hint"
        [ "git checkout -b version1.4 v1.4" ]
    , Question
        "how to create new branch my-branch (using branch)?"
        "hint"
        [ "git branch my-branch" ]
    , Question
        "the name of the pointer to the branch you are currently on?"
        "hint"
        [ "HEAD" ]
    , Question
        "how to switch to branch my-branch (using checkout)?"
        "hint"
        [ "git checkout my-branch" ]
    , Question
        "how to create branch my-branch and switch to the newly created (using checkout)?"
        "hint"
        [ "git checkout -b my-branch" ]
    , Question
        "how to switch to branch my-branch (using switch)?"
        "hint"
        [ "git switch my-branch" ]
    , Question
        "how to create branch my-branch and switch to the newly created (using switch)?"
        "hint"
        [ "git switch -c my-branch"
        , "git switch --create my-branch"
        ]
    , Question
        "if you are on master how to merge the branch hotfix into master?"
        "hint"
        [ "git merge hotfix" ]
    , Question
        "how to delete locally the branch hotfix?"
        "hint"
        [ "git branch -d hotfix" ]
    , Question
        "how to list your local branches?"
        "hint"
        [ "git branch" ]
    , Question
        "how to list your current branches and see the last commit on each branch?"
        "hint"
        [ "git branch -v" ]
    , Question
        "how to list your branches and filter the one you have already merged to the current branch?"
        "hint"
        [ "git branch --merged" ]
    , Question
        "how to see all the branches that contain work you haven’t yet merged in?"
        "hint"
        [ "git branch --no-merged" ]
    , Question
        "how to rename branch bad-branch to good-branch?"
        "hint"
        [ "git branch --move bad-branch good-branch" ]
    , Question
        "how to publish the branch my-branch on the remote named origin?"
        "hint"
        [ "git push origin --set-upstream my-branch"
        , "git push origin -u my-branch"
        ]
    , Question
        "how to delete the branch my-branch on the remote named origin?"
        "hint"
        [ "git push origin --delete my-branch" ]
    , Question
        "how to list all branches local and remote?"
        "hint"
        [ "git branch --all" ]
    , Question
        "how to get full information of remote branches on the origin remote?"
        "hint"
        [ "git remote show origin" ]
    , Question
        "what is the full command to push to the branch my-branch on the remote origin?"
        "hint"
        [ "git push origin my-branch" ]
    , Question
        "how to push from my-branch to the-other-branch on remote origin?"
        "hint"
        [ "git push origin my-branch:the-other-branch" ]
    , Question
        "how to push from my-branch to the-other-branch on remote origin and track from now on?"
        "hint"
        [ "git push origin -u my-branch:the-other-branch" ]
    , Question
        "your colleague created a new branch their-branch on remote origin, create a new branch my-branch from it?"
        "hint"
        [ "git checkout -b my-branch origin/their-branch" ]
    , Question
        "how to make your current branch track orign/their-branch?"
        "hint"
        [ "git branch -u origin/their-branch"
        , "git branch --set-upstream origin/their-branch"
        ]
    , Question
        "how to see branch with tracking information?"
        "hint"
        [ "git branch -vv" ]
    , Question
        "how to rebase your current branch on master?"
        "hint"
        [ "git rebase master" ]
    , Question
        "how to check for whitespaces error before commit?"
        "hint"
        [ "git diff --check" ]
    , Question
        "how to partially stage changes in the same file?"
        "hint"
        [ "git add --patch"
        , "git add -p"
        ]
    , Question
        "how to display the commits in origin/develop that are not in my-branch?"
        "hint"
        [ "git log my-branch..origin/develop" ]
    , Question
        "how te see commit history excluding merge?"
        "hint"
        [ "git log --no-merges" ]
    , Question
        "how to compare commits between my-branch(behind) and origin/develop(ahead) excluding merges?"
        "hint"
        [ "git log --no-merges my-branch..origin/develop" ]
    , Question
        "how to merge my-branch squashing all commits into one?"
        "hint"
        [ "git merge --squash my-branch" ]
    , Question
        "how to check the work my-branch has introduced since its common ancestor with master?"
        "hint"
        [ "git diff master...my-branch" ]
    , Question
        "how to pull a single commit e43a6 into your current branch?"
        "hint"
        [ "git cherry-pick e43a6" ]
    , Question
        "how to generate a build number from master?"
        "hint"
        [ "git describe master" ]
    , Question
        "how to inspect commit 2bdf86"
        "hint"
        [ "git show 2bdf86" ]
    , Question
        "how to inspect branch my-branch?"
        "hint"
        [ "git show my-branch" ]
    , Question
        "how to see a logs of HEAD history?"
        "hint"
        [ "git reflog" ]
    ]
