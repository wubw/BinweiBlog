
Https Explainations
===========================

.. post:: Jan 24, 2018
   :tags: security
   :category: ComputerScience

Introduction
=================

Typical MitM Insertion Points:

* Browser
* Wireless Router
* ISP
* Web Server

Chrome browser, press F12 and goto Security tab, you can see the certificates of the https web site

certmgr.msc, to see the trusted CA (Firefox has its own CA manager)

SSL: Secure Sockets Layer
TLS: Transport Layer Security

TLS handshake

* client talk to server, which communication protocol it supports, which cipher suite it supports
* server talk to client and agree on the communication protocol and cipher suite and public key
* client use the public key to verify whether this is the real website through CA
* client start key exchange which is encrypted by using public key
* server finished and communication begins the handshake is not encrypted

Tech details
===============

Downgrade the communication version. Client claims it only has lower TLS version, and force the communication to be on lower version. Then use the opportunity to attack

Redirecting to HTTPS

* Client send http request
* Server return HTTP 301
* Client starts https request

Through testing in Chrome network tab cannot see http 301 response
Redirecting model has MIM risk, not safe

HTTP strict transport security (STS)
You will not see 301 response, but 
Strict-Transport-Security:
max-age=15552000;
in the header
Go to HTTP site again, and you will 307 (internal redirect) 
But TOFU (Trust on first use)
Something in the header: strict-transport-security: max-age=31536000; includeSubDomain;preload
HSTSPreload.org
HSTS: HTTP Strict Transport Security
Force all the http requests converted into https, including CSS, Javascript, fonts, images, favicon, media, etc

Mixed Content:
If your page contains unsecure resource, e.g. images, videos in iframe, https is not impleted correctly
If you just use //www.resourceaddress in your code, then it will 'inherit' the parent scheme when get the resource
Or use CSP

.. image:: images/csp.png

Extended validation certificate

.. image:: images/extended_validation_certificate.png

SNI: Server Name Indication
Enables multiple certs on the one IP address 

SAN: Subject Alternative Name:
Combine multiple domain names on the one cert

PFS: Perfect Forward Secrecy
Protects past sessions against future key compromise

DNSSEC: Domain name system security extensions
Protects against forged DNS records

DANE: NDS Based Authentication of Named Entities
Specifies the cert keys at the DNS level

CAA: Certificate Authority Authorization
Specifies allowable Cas for the domain at the DNS level

CRL: certificate revocation list
List of revoked certificates maintained by the CA

OCSP: Online certificate status protocol
List of revoked certificates maintained by the CA

PKP: Public key pinning
Ensures a client will only accept predefined certs

HPKP:
Defines the public keys that are allowed
Specifies the max age
Defines whether it applies to subdomains
Facilitates reporting of violation

Tools relevant
====================

PowerShell cmlet: New-SelfSignedCertificate, Export-PfxCertificate can generate certificate locally (pfx file)

By default, Fiddler can monitor http very well, but not https. 
Fiddler almost can see no communication if visit https websites.
Port 443 is the default port for https
Check on the following options in Fiddler can see the https communication:
HTTPS tab, Decrypt HTTPS traffic
What Fiddler has done is a man in the middle attack on the machine

See Cookies:
F12 -> Application tab -> Cookies
Secure cookie cannot be get if it is on http channel

Relevant websites
======================

https://badssl.com/

http://caniuse.com
Web page to see the browser for various features

istlsfastyet.com
is a good source to read about TLS

httpvshttps.com
You can see https is faster to load
F12 -> Network -> Waterfall, the reason is https allows streaming content come all together

Certificate is not free. But you can use Let's encrypt: letsencrypt.org
certbot.eff.org can automate the certificate process

Cloudflare is reverse proxy which can play as cache, provide certificate, etc

www.ssllabs.com

HTTPS improves SEO
https://webmasters.googleblog.com/2014/08/https-as-ranking-signal.html

*Written by Binwei@Oslo*
