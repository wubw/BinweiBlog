
Bash: Useful Commands
=========================

.. post:: Aug 19, 2017
   :tags: shell
   :category: ComputerScience

Bash is a widely shell, which is the default shell in many operating systems, e.g. Unix, Linux, Mac OS. 
Bash can help you achieve a lot. 
To invest time to learn some useful commands in bash is a good idea.

.. contents::

Directory commands 
======================

Home directory
------------------

For every user, there is a home directory which is presented by ~

*cd* will go to home directory

Handle space
-----------------

There are two ways to handle space in the path:

.. code::

    cd 'My Documents'

    cd My\ Documents

List files
-----------

*ls -R*: will show directory recursively

*file **: can show files with format

Others
------------

*pwd* : show the working directory

*rm -rf [directory]*: remove a not empty directory

Wildcard
===========

Bash supports wild card to match files.

.. code::

    *

Matches anything, including nothing at all

.. code::

    ?

Matches exactly 1 character

.. code::

    [acd7_]

Matches one of the characters in the list, above example would match a, c, d, 7 or _

Another example is: [^ax2] matches anything but a, x, 2

You can also use ranges, e.g. [a-z], [0-9], [A-C3-5]

Brace Expansion
--------------------

Brace expansion is another handy way for you to write compact commands.

.. code::

    touch {a,b,c}.txt => touch a.txt b.txt c.txt

    mv file.{txt,jpg} dir/ => mv file.txt file.jpg dir

    touch {a..c}{1..3}.txt => touch a1.txt a2.txt ... c2.txt c3.txt

    mv *{txt,jpg} Documents => mv *txt *jpg Documents

File Manipulation
====================

Input/Output redirection
---------------------------
Output redirection is very important tool, which has two modes:

.. code::

    > will overwrite
    >> will append

< is input redirect

cp
------
cp is the copy file command.

*cp -R* will copy files recursively

Modify file
-------------
Touch will create a empty file or update access time on an existing file

sort command can sort the content in the file. 

.. code::

    sort -nk2 [filename]*: can sort the content of file according to the second column

tr can replace character

.. code::

    tr 'Hello' 'hello' < test > test2

cut: cut out selected positions of each line of a file

.. code::

    cut -c2 test => cut the second character of each line in test file

paste: get content from various files and put into one file

.. code::

    paste test test2

join: do the similar thing like paste but get rid of the header for each row

Search file
-------------
grep command will do the search and list all the relevant lines

.. code::

    grep -nr security . => search keyword security in current folder

find can use pattern to find files

.. code::

    find . -name "*.rst" => find all rst files under current folder

wc: count lines, words and characters in a file

uniq: do not show duplicated items

head and tail: show the beginning and end of the file


View help and file content
=============================

Use man to see the help manual

.. code::

    Space: down the page
    B: up the page
    /: search. N, n to go to next/previous match
    Q: exit

Use less command to view a file, use the same keys like man

Process
============

If you start a long process by a normal way, the terminal will be blocked. 

* Ctrl + Z will pause the process. 
* fg will bring back the process. 
* bg will let the process run in the background

When you start a long program, you can also ends up a &, which means run in background

jobs: see the process in background

kill can kill a process. e.g. kill %1

ps -e: list processes

The difference between jobs and ps is jobs only list the process managed by the shell.

Other tips
=================

Commands parameters
--------------------

The command option can be combined in one dash

.. code::

    For example: ls -l -a
    Can be: ls -la

Avoid keeping sudo
-------------------

In some operating system, if your account is not admin you will be asked to type sudo often. It is inconvenient.

*sudo -s*: can avoid typing sudo every time

Shortcut keys
---------------
* Ctrl-a: Start of line
* Ctrl-e: End of line
* Ctrl-Left: Forward 1 word
* Ctrl_Right: Back 1 word
* Alt-D: Delete a word
* Alt-Backspace: Delete a word backward
* Ctrl-K: Delete rest of line
* Ctrl-U: Delete from start of line
* Ctrl-R: Search back in history

Alias
--------

*alias* to show the alias

alias v=gvim

*\\ls* will use the original commands and ignore the alias

Others
--------
Select the text and click mid mouse button will do the copy/paste the selected text in terminal

ssh allows you to login the another system

var1='hello'

echo $var1

*Written by Binwei@Oslo*
