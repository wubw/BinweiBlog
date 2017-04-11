
Git: Branch Basic
=====================

.. post:: Jan 18, 2017
   :tags: git
   :category: ComputerScience

Written by Binwei@Oslo

One of the biggest advantage of Git is branching. Git is very strong at handling branches, no matter on functionality or on efficiency. Let's try out the Git branch commands.

Create Branch

git branch f1

The command will create a new branch called f1. Compared to 'classical' version control system, git will not create a separate folder for new branch. All the branches 'share' the same folder on your file system.

git checkout f1

git checkout command will switch from current branch to f1 branch. f1 becomes your current branch, your followings changes will happen on f1. HEAD is the 'pointer' which point to the current commit, which also indicates what is the current branch.

When you switch a branch, the data in repository does not change. It is the HEAD switch to the different commit. And also copy the files from repository to index, working area.

If you are confused about the term: commit, index, and working area, please check my previous blogs:

Git: Getting Started

Git: Areas

git checkout -b f2

The above command will quickly create a new branch f2 and switch to this new branch.

Visualisation of History

In order to have a clear picture of the current repository, the branching situation, and what is the current branch status, you can simply use the following command:

git log --oneline --all --decorate --graph

You will see console output like following:

* 660caea (HEAD -> feature2) f2

| * 90e5174 (feature4, feature3) feature 3 changes

|/ 

| * cf54ec8 (feature1) modification from feature1

| | *   a51f214 (master) Merge branch 'feature2'

| | |\ 

| |/ / 

| | /   

| |/    

|/|     

* | bb32dd5 commit feature2

| * 0ac3396 commit feature1

| * 3fb48f2 feature1 first commit

|/ 

* d3033b2 Add more file and change main.txt

* 6b07c39 First commit

The numbers are the short version hash for commits. For simplicity, you can regard these numbers as commit id now. From the output, you can see how many branches are in current repository and their relationship. The commit HEAD point to means the current branch.

The above command is cumbersome to type, you can use git alias in stead.

git config --global alias.loadg 'log --oneline --all --decorate --graph'

It will create an alias 'loadg' for the long parameters. Then you can simply type to get the history graph:

git loadg

The alias data will be added into ~/.gitconfig in following format. You can also add the alias manually in this file.

[alias]

loadg = log --oneline --all --decorate --graph

 With this command, you can see the graph and understand repository branching situation easily.

 

Other Basic Commands

Branch can also be created from the hash number.

git branch f3 66ocaea

This command will create a new branch f3 based on the commit which has hash number 66ocaea.

git branch -m f3 f4

The command will rename branch f3 to f4.

git branch -d f4

The command will delete the branch f4.

git diff f2 f3

This command shows the difference between two branches.

Summary

This blog only covers the basic branch commands, e.g. create a new branch, modify the branch, view the branch status. Still not touch the real power of git branch.

In next blog, I will show how to do the merge, rebase and other advance branch commands.


