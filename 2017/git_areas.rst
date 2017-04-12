
Git: Areas
==============

.. post:: Jan 14, 2017
   :tags: git
   :category: ComputerScience

Git has four areas:

* Working area
* Index
* Repository
* Stash

To understand these four areas is essential to learn the git workflow. The following paragraphs will go through these four areas and explain the git workflow. If you are new to git and not familiar with the basic git commands, it is recommended to read my blog post :ref:`git_getting-started` first.

.. contents::

=============
Working area
=============

Working area is where you start adding/modifying/deleting files. Working area is equal to what you see on your file system.

If *git status* returns nothing, it means working area, index, repository are equal.

*git diff* command can show the difference between working area and index.

*git checkout --* can discard the changes on working area.

=============
Index
=============

Index is a staging area for git, which stays in the middle of working area and repository.

*git add* command can copy the changes from working area to index.

*git reset HEAD* command can discard the changes in index.

*git diff --cached* command can show the difference between index and repository.

*git rm --cached* command can remove a file from index.

*git mv* command can rename a file name in index and working area

=============
Repository
=============

Repository is the place to store all the commits, no matter it is a local one or a central one.

Basically, all the commits are immutable.

*git commit* is the command to copy changes from index to repository.

=============
Stash
=============

Stash is a place to store temporary changes from working areas and index, which is like a clipboard of your project.

Use *git stash* when you want to record the current state of the working directory and the index, but want to go back to a clean working directory. The command saves your local modifications away and reverts the working directory to match the HEAD commit.

*git stash* list shows all the stashed changes.

*git stash show* can view the details of stashed change.

*git stash apply* can retrieve the stashed change.

*git stash clear* clean-up the stash area.

==========
Summary
==========

In order to use git efficiently, it is necessary to understand the areas your files reside now, and the workflow of the git files.

It is not easy to remember all the commands and arguments. Just remember the basic and visit `git doc <https://git-scm.com/doc/>`_ when necessary will help.


*Written by Binwei@Oslo*
