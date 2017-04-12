
Git: Getting Started
===========================

.. post:: Jan 11, 2017
   :tags: git
   :category: ComputerScience

Git is an open source distributed version control system, which plays important role in current software ecosystem.
You may find many GUI Git tools like SourceTree, Github Desktop, TortoiseGit etc, however the best way to learn Git is to deep dive into the Git commands and understand the fundamental. Let's start the 'Git journey' by using the basic commands.

.. contents::

=============
Install Git
=============

First, go to Git download page: https://git-scm.com/downloads

Download and install the git on your operating system.


=======================
Initialize Repository
=======================

In order to use Git, you need to initialize a local repository first.

.. code-block:: bash

    mkdir FirstRepo
    cd FirstRepo
    git init

The folder and file operation commands will be slightly different depends on your operating system.

A hidden .git folder should be created by the above command. You can use *ls -a* to verify it.

=============
Check Status
=============

*git status* is a handy command to check the current repository status. It is recommended it is used from time to time.

If you use *git status* now, the console output will be:

.. code-block:: console

    On branch master
    Inital commit
    nothing to commit (create/copy files and use "git add" to track)

=============
Add Files
=============

Let's add some example files and folders in the repository.

.. code-block:: console

    mkdir SubFolder
    touch main.txt
    touch SubFolder\sub.txt

Use *tree* command to verify that two files and one folder are created in the repository. 

.. code-block:: console

    .

    ├── SubFolder

    │   └── sub.txt

    └── main.txt

Type *git status* again, and the console output should tell you that there are 'untracked files'.

============================
Commit to Local Repository
============================

Go to the repository root folder, and run *git add .*

Type *git status* and you can see from console output that there are changes to be committed and no untracked files. (If you run the above command in sub folder, then only the files under subfolders will be tracked)

Run *git commit* command to commit the change to local repository, and you will encounter a vi look-like program to ask you provide the description for the up-comming commit. Type i and go into text edit mode; write down the description for the commit, like 'First commit'; then press Esc and :wq to save and quit that vi look like program.

If everything goes well, you will see that files are commit and *git status* will tell that nothing to commit, and working directory clean.

============================
Commit to Remote Repository
============================

In order to collaborate with other developers, you need to publish the repository to a remote repository or a center repository like GitHub.

Now go to GitHub do the registration, create a repository on GitHub, and get the git URL of the repository.

The URL looks like: https://github.com/{username}/{repositoryname}.git

Use the following command to 'push' your local repository to the Github:

.. code-block:: bash

    git push --set-upstream https://github.com/{username}/{repositoryname}.git master

You will be asked to enter your Github user name and credential. After the 'push' command succeeds, you can see the files appear on the Github repository.

Congratulations! You manage to use the basic git commands.

==========
Summary
==========

Git commands are the best way to learn git, but it is not straight forward to understand and remember. Practice will help.

There will be following blogs explain further how to use git well and the git fundamental.

*Written by Binwei@Oslo*
