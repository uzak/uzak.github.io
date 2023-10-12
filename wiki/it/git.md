# Git

git log --pretty=format:"%an (%ae): %s"

gd HEAD '@{2020-12-01}' -- env.sample

sync fork

    git remote -v
    git remote add upstream https://github.com/wlwg/aws-sns-message-validator
    git fetch upstream 
    git rebase upstream/master


corrupt lose object

    find .git/objects/ -size 0 -exec rm -f {} \;
    git fetch origin

# Basic

    git branch -m oldname newname           # rename a branch
    git branch -m newname                   # rename current branch
    
    git reset --hard master                 # resets the branch to master
    
    # reset to remote version
    git fetch origin
    git reset --hard origin/main
    
    git branch -d branch_name               # delete local branch
    
    git branch -a                           # list all branches (also remote)
    
    git diff HEAD 'HEAD@{1 week ago}' -- some/file/path/file.ext
    
    git merge --abort                       # abort merge
    
    git reset HEAD~                         # undo commit
    
    git rev-list --count HEAD               # revision number
    
    git commit --date=format:relative:4.hours.ago
    
    git format-patch HEAD~1
    git am *.patch
    
    git log -p -- printer.py                # history of a file
    gitk printer.py
    
    git submodule init
    git submodule update
    
    # patch directly (w/o use of git)
    diff -u OriginalFile UpdatedFile > PatchFile
    patch OriginalFile < PatchFile
    
    # 3 way diff and patch
    git diff -R 2742e63a7f759828b049ae5d3384b17beb39f48e openapi.yaml | git apply -3 
    
    
change remote:

    git branch gen_printer_name -u origin/gen_printer_name
    
[Git: merge vs. rebase](https://stackoverflow.com/a/16666418)


Merge one file from another branch:

    git checkout --patch another_branch file.txt

Stash last two commits into one:

    git rebase -i HEAD~2

Get a version from the commits:

    git describe --tags --always --dirty
    
Remove a remote branch:

    git push <remote-name> --delete <branch-name>
    
Delete a commit on remote:

    git stash
    git reset --hard <last_working_commit_id>
    git push --force

Squash all commits from a branch and merge into master
    
    git checkout master
    git merge --squash <branch>
    git commit
    
## Change remote URL 

    git remote set-url origin git@github.com:uzak/PoorWSGI.git
    
## Merge from a remote into local branch

    git remote -v
    git remote add other $URL
    git fetch other
    git checkout -b other other/master
    gco master
    git merge other --allow-unrelated-histories --no-ff

## Tag

    git tag -a v1 df50154807f5d009e3526208f266d9f57e5b3e2e
    git push origin v1          # tags are not pushed by default

    
## Stash

    git stash list
    
    
# Školenie GIT 2020-05-08

    git diff --staged
    git diff | tig
    git difftool
    git reset na zmeny

    git commit 
        napisat (more) na koniec prvej ak viacriadkovy comment
        pouzivat imperativ (add gitignore je kratsie ako added gitignore)
        
    git --am (amend)
    git log --oneline
    git log --oneline --graph
    git log --oneline
    git remote -v
    git fetch --all
    git branch --all
    git reflog          # ak si nieco totalne rozbijem
    git reset --hard
    git stash
    git stash show
    git stash show -p       # patch - show also changes
    git stash list
    git stash push -m ""    # pomenovat stashe
    git stash clear
    git branch 
    git branch --all
    git branch HEAD~3
    git push origin :foo :bar
    git push origin master:nm
    git push origin :nm

    git fetch
    git fetch --prune

    git reset HEAD~1 --hard # zmaze aj zmeny

    git rebase -i HEAD~5

    git checkout experimental
    git rebase master
    git checkout master
    git merge --ff-only experimental

nedovolovat pushnut PR s merge-commitami

https://www.metaltoad.com/blog/beginners-guide-git-bisect-process-elimination

https://editorconfig.org/

    
# Git Book

## Introduction

* Since 2005, by Linus Torvarlds
* Version Control System (VCS)
* Design goals: performance and data integrity
* Every developer has his own repository. This prevents fighting for commit rights.

## Man Pages
	$ git help status
	$ git status --help
	$ man git-status
	
## Vocabulary
* Version Control System (VCS) = Software Configuration Management (SCM) = Revision Control System.
* Repository
* Working Tree = Working Directory
* Commit
* HEAD - latest commit in the current branch
* Index - changeset. Working Tree <- Index -> repository.
* Clone
* Branch
* Tag
* master - name of the default branch. Analog to "trunk"
* Hunk - loosely related LOC

## First Steps

	git config --global user.name "MU"
	git config --global user.email "uzak+git@mailbox.org"
	git config --global color.ui auto
	
	git init example
	git status
	git add
	git commit
	git show
	git show HEAD
	git show master
	git show rev-SHA
	
non-global settings can be configurated for a project using `git config` without --global.

# Basics
	git diff          # diff between Working Dir and Index
	git diff --staged # diff between Index and Repository
	git diff --color-words
	
Interactively ask which changes (hunks) to be added to Index:

	git add -p
	
Reset Index:
	
	git reset HEAD
	git reset -p # selectively reset hunks from Index
	
Ammend a commit
	
	git commit --amend
	
Commit messages:

* First line max 50 characters. Summary
* More detailed description after a newline after the first line. Max recommended length up to 76 characters.
* write **what** and **why** was changed. What is obvious from the change.

Examine the history of a file:

	git log --follow -- FILE
Log:
	
	git grep
	git log -4
	git log -l rev-SHA
	git log --oneline
	git log --after='2005-01-01'
	git log --since='yesterday'
	git log -- *.h
	git log -i --grep XXX --author Linus

Search within the changes (Pixeaxe)

	git log -p -S<STRING>
	
Commit range

	git diff rev1..revN

## Object model

* uses SHA1 as algorithm
* Stored in ".git/objects"
* Loose objects and Packfiles
* data types: blog (file), tree (dir), commit, tag

Plumbing-commands (in contrast to porcelain commands used so far):

	git log --oneline
	git show --format=raw
	git show rev-SHA
	git ls-tree --abbrev=7 rev-SHA
	git hash-object FILE


# Bibliography
*
