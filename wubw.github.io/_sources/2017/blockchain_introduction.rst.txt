
Blockchain Introduction
============================

.. post:: Sep 06, 2017
   :tags: blockchain, security
   :category: ComputerScience

Blockchain is the technology behind Bitcoin, this blog introduce what the Blockchain is.

.. contents::

What is Blockchain
===================

Blockchain is a distributed ledger system which makes the transactions transparent and anonymous. By doing this, Blockchain brings a secure system.

Based on cryptographic proof instead of trust, allowing any two willing parties to transact directly with each other without the need for a trusted third party

The Characteristics of Blockchain:

* Global Singleton
* Accessible
* Unstoppable
* Verifiable

Major offerings

* Bitcoin
* Ethereum
* IBM Bluemix

How Blockchain works
==========================

Key pair
--------------

The users on the Blockchain have private/public key-pair. Private key must be kept as secret.

When users send money from one account to another account, transaction will be created.
Transaction using users' private key to generate signature.
People uses public key to verify the transaction is not tampered.

Besides the normal users, there is another role called miner.

Miner
---------
Miners keeps track of the transactions

* Receive transactions
* Group transactions to form a new block
* Hash previous block + hash new block + random number 
* Puzzle hash: Very compute intensive; Are rewarded for finding the number
* Miners work continuously

The purpose of puzzle hash is to grantee the 'Proof of Work'. In order to get the reward, miners need to compete to resolve a random has puzzle which can only be handled by many tries without shortcut.

The blockchain is protected from modification because the hash-puzzle takes (on average) about a one-hundred-billion-billion attempts to find — it’s more work the any individual is capable of producing. 

When the transaction kicks, it is not verified at beginning which needs to be confirmed by the minders.

Block
-------
Transactions are stored in block. Each block contains the timestamp, the hash of previous block, the hash of itself, and nonce.

The bitcoin protocol demands that a block’s hash has to look a certain way; it must have a certain number of zeroes at the start (with a certain level of difficulty). 
There’s no way of telling what a hash is going to look like before you produce it, and as soon as you include a new piece of data in the mix, the hash will be totally different.

Miners aren’t supposed to meddle with the transaction data in a block, but they must change the data they’re using to create a different hash. 
They do this using another, random piece of data called a ‘nonce’. 

The blocks are stored in a structured: Merkle Tree.

The earlier block is, the safer.
Because if one block is invalid, all the blocks after that will be invalid and needs to be recalculated again

Usage of Blockchain
======================

Blockchain is expected to enable excluded people to enter the global economy, enable the protection of privacy and people to "monetize their own information", and provide the capability to ensure creators are compensated for their intellectual property. 

Possible usages for Blockchain:

* Digital currencies
* Internet of things
* Product life cycle
* Certifications
* Secure information sharing
* Virtual products

Blockchain 2.0 technologies go beyond transactions and enable "exchange of value without powerful intermediaries acting as arbiters of money and information". 

Resource
=======================

Crypto currency overview: www.coinmarketcap.com

You can see all the transactions from: www.blockchain.info 

Development resource:

* BitCore: http://bitcore.io
* https://bitcoin.org/en/developer-documentation
* https://github.com/bitcoin/bitcoin

*Written by Binwei@Oslo*

