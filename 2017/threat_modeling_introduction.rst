
Threat Modeling: Introduction
=================================

.. post:: May 07, 2017
   :tags: security
   :category: ComputerScience

With more and more data and software go to internet, the security becomes crucial for software development. 
OWASP (Open Web Application Security Project) lists top 10 security risks:

* Injection
* Broken Authentication and session management
* Cross-site scripting
* Insecure Direct Object Reference
* Security Misconfiguration
* Sensitive data exposure
* Missing function level access control
* Cross site request forging
* Components with known vulnerabilities
* Invalidated requests and forwards

Security risks are everywhere and it is difficult to make secure software. 

Threat modeling is a systematic way to ensure that your software is designed for security. This blog explains briefly what is threat modeling.

.. contents::

=====================
Thrust boundaries
=====================

Identify thrust boundaries is the first step, which is equivalent to attack surface. There are several ways to identify thrust boundaries by:

* Accounts
* Network interfaces
* Different physical computers
* Virtual machines
* Organizational boundaries
* Almost everywhere you can argue for different privilege

========
STRIDE
========

‘STRIDE’ is mnemonic way to describe threat types.

* Spoofing: Pretending to be something or someone you’re not

* Tampering: Modifying something you’re not supposed to modify. It can include packets on the wire (or wireless network), bits on disks or bits in memory.

* Repudiation: Means claiming you didn’t do something (regardless of whether you did or not)

* Information disclosure: Exposing information to people who are not authorized to see it.

* Denial of service: Attacks designed to prevent a system from providing service, including by crashing it, making it unusually slow, or filling all its storage.

* Elevation of privilege: A program or user is technically able to do things that they are not supposed to do.

=================
Actions strategy
=================

For each threat, you can have different action strategy accordingly.

* Mitigate threats: Doing things to make it harder to take advantage of a threat.

* Eliminate threats: It is almost always achieved by eliminating features.

* Transferring threats: It is about letting someone or something else handle the risk.

* Accepting the risk: It is the final approach to addressing threats.

=====================================
Authentication: Mitigating Spoofing
=====================================

In general, only programs running at the same or lower level of trust are spoofable, and you should endeavor to trust only code running at a higher level of trust, such as in the OS.

Tactics for authentication
----------------------------

Without crypto: for example, verify IP or DNS entry which is unreliable

Using crypto: That validation cannot be delegated entirely to machines. 
You can choose to delegate it to one or the many companies that assert they validate these things. For example: PKI (public key infrastructure); CA (certification authorities)

PKI is a cryptographic technique that enables entities to securely communicate on an insecure public network, and reliably verify the identity of an entity via digital signatures.

A PKI is an arrangement that binds public keys with respective identities of entities (like people and organizations). The binding is established through a process of registration and issuance of certificates at and by a certificate authority (CA).


Authentication technologies
----------------------------
* For computer (or accounts): IPSec, DNSSEC, SSH host keys, Kerberos authentication, HTTP Digest or Basic authentication, Windows authentication (NTLM), PKI system, such as SSL or TLS with certificates

* For bits (files, messages, etc): Digital signatures, hashes

* For people:

Something you know, e.g. password; 

Something you have, e.g. access card;

Something you are, e.g. biometrics, photo graphs;

Something you know who can authenticate you

* For maintaining authentication across connection, e.g. Cookies

* Developer ways to address spoofing: Within an operating system, you should aim to use full and canonical path names for libraries, pipes, and so on to help mitigate spoofing.

==================================
Integrity: Mitigating Tampering
==================================

Tactics
---------
* Relying on system defense such as permission
* Use cryptographic mechanisms
* Use of logging technology and audit activities as a deterrent

If you are implementing a permission system, you should ensure that there’s a single permission kernel also called a reference monitor.

The most important element of assuring integrity is about process, not technology.

Technology
-----------
* For protecting files: ACL or permission, Digital signature, Hashes, Window Mandatory Integrity Control (MIC) feature, Unix immutable bits

* For protecting network traffic: SSL, SSH, IPSec, Digital signature

=========================================
Non-Repudiation: Mitigating Repudiation
=========================================

Repudiation is a somewhat different threat because it bridges the business realm, in which there are four elements to addressing:

* Preventing fraudulent transactions
* Taking note of contested issues
* Investigating them
* Responding to them

Non-Repudiation Technologies
--------------------------------
Logging, log analysis tools, Secured log storage, 
Digital signature, Secure time stamps, Trusted third parties, 
Hash trees, tools for preventing fraud

=====================================================
Confidentiality: Mitigating Information Disclosure
=====================================================
Information disclosure can happen at rest (in storage) or in motion (over a network)

Tactics
---------
* Within the confines of a system, you can use ACL
* Outside the confines, you must use cryptography

Technologies
-------------
* Protecting files: ACL/Permissions, Encryption, Appropriate key management

* Protecting network data: Encryption, Appropriate key management

* Protecting communication headers or the fact of communication: Mix network, Onion routing, Stenography

===========================================
Availability: Mitigating Denial of Service
===========================================

Technologies
-------------
ACL, Filters, 
Quotas (rate limiting, thresholding, throttling), 
High-availability design, 
Extra bandwidth (rate limiting, throttling),
Cloud services

====================================================
Authorization: Mitigating Elevation of Privilege
====================================================

Technologies
---------------
ACL, Group or role membership, Role based access control, 
Claims-based access control, Windows privileges, 
Unix sudo, Chroot, AppArmor or other unix sandboxes, 
The ‘MOICE” Windows Sandbox pattern, 
Input validation for a defined purpose

==========
Privacy
==========
Besides the security threats, we also have privacy threat. 

There are several ways to address privacy threats:

* Avoid collecting information (minimization)
* Use crypto in various clever way, and control how data is used (compliance on regulation and policy)
 
*Written by Binwei@Oslo*
