
Git: Branch Continue
========================

.. post:: Jan 30, 2017
   :tags: git
   :category: ComputerScience
   
This blog will cover the Git commands which to transfer the changes between branches. If you are not familiar with the basic Git branch commands, you can have a look of my previous blog: :ref:`git_branch-basic` 

=============
Merge Branch
=============

When you have two or more branches, you need to integrate some changes from one branch to another.

.. code-block:: bash

    git merge f1

Git merge command will try to integrate all the changes from branch f1 into the current branch (HEAD points to). After run this command, you can check the status by *git status* and use *git add/commit* to check-in the changes.

If f1 and current branch have changes on same files, conflict will happen in the *git merge* command. Git will present the conflicts directly in the files, see following example:

.. code-block:: console

    <<<<<<< HEAD

    current change

    =======

    greeting from f1

    >>>>>>> f1

You can use text editor tool to resolve the conflict manually or you can use *git mergetool* to resolve the conflict.

================
Rebase Branch
================

In most cases, git branch is created based on an existing branch by using *git branch* command. Then the newly created branch has relationship with the existing branch. If we want to change the relationship, e.g. let the current branch base on another branch, then you need to use the rebase command.

.. code-block:: bash

    git rebase f2

This command will rebase your current branch on branch f2.

================
Cherry Pick
================

Sometimes, if you only want to integrate one specific commit from one branch into current branch, then you can use cherry pick command.

.. code-block:: bash

    git cherry-pick 0ac3396

The above command will integrate the specific commit: 0ac3396 into the current branch.

If you call merge/rebase command after cherry pick, git will understand the changes and will not re-apply the unnecessary changes.

========
Summary
========

Merge/Rebase/Cherry Pick are three basic commands to transfer changes from one branch to another.

In order to use git branch in a correct way, you need to understand the good practice of using git flow. There is a good blog explains the `git flow <http://nvie.com/posts/a-successful-git-branching-model/>`_.


*Written by Binwei@Oslo*

