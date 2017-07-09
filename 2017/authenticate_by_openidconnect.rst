
Authenticate Node.js App by OpenId Connect
===========================================

.. post:: Jul 09, 2017
   :tags: security
   :category: ComputerScience

OpenID Connect (OIDC) is an authentication layer on top of OAuth 2.0; while OAuth 2.0 is an authorization framework. 
The standard is controlled by the OpenID Foundation. 
This blog post will go through an example to use your google account to login a Node.js app by using OpenID Connect.

.. contents::

Authentication vs Authorization
===============================

Authentication and Authorization are big topics, this blog only touches the basic and will have follow-up blogs to explain the details.
If you are still confused about the difference between authentication and authorization, the followings are the explanations.

Authentication: is the process of ascertaining that somebody really is who he claims to be.

Authorization: refers to rules that determine who is allowed to do what.

'Jargon' explanations
=======================

If you are confused about the difference between various protocols, e.g. OpenID, OAuth, OpenID Connect, don't worry. It is a common challenge to most people.

OpenID
---------

Authentication is delegated: 

Server A wants to authenticate user U, but U's credentials (e.g. U's name and password) are sent to another server, B, that A trusts (at least, trusts for authenticating users). 

Indeed, server B makes sure that U is indeed U, and then tells to A: "ok, that's the genuine U".

OAuth
--------

Authorization is delegated: 

Entity A obtains from entity B an "access right" which A can show to server S to be granted access; B can thus deliver temporary, specific access keys to A without giving them too much power. 

You can imagine an OAuth server as the key master in a big hotel; he gives to employees keys which open the doors of the rooms that they are supposed to enter, but each key is limited (it does not give access to all rooms); furthermore, the keys self-destruct after a few hours.

OpenID Connect
----------------

To some extent, authorization can be abused into some pseudo-authentication, on the basis that if entity A obtains from B an access key through OAuth, and shows it to server S, then server S may infer that B authenticated A before granting the access key. 
So some people use OAuth where they should be using OpenID. This schema may or may not be enlightening; but I think this pseudo-authentication is more confusing than anything. 

OpenID Connect does just that: it abuses OAuth into an authentication protocol. 

In the hotel analogy: if I encounter a purported employee and that person shows me that he has a key which opens my room, then I suppose that this is a true employee, on the basis that the key master would not have given him a key which opens my room if he was not.

OpenID Connect standardize how authentication with OAuth2 works

* OpenID connect is built on top of Oauth 2.0
* it contains authorization code flow and implicit flow
* standard scopes and claims
* token type is JWT (Json web token)
* ID token
* UserInfo endpoint
* Simple
* Supports multiple Relying Party (client) types
* Optional: encryption, discovery, dynamic client registration & session management

http://openid.net/connect

Setup Google Account
======================

Since this blog uses google account to do the login, so let's setup the account first.

Go to the following URL:

https://console.developers.google.com/apis/credentials

* Create credential
* Create OAuth client id

Ensure the redirect URL is setup correctly, e.g. http://localhost:5000/oidc-client-sample.html

This redirect URL will be used in the next chapter.

Test the google authentication first by using auth0.com: https://auth0.com/docs/connections/social/google

If your manage to connect to the google account, then it's time to move to the next chapter. 

Setup Node.Js App
===================

In this blog, the focus in on OpenID Connect, then we will not build Node.JS app from scratch.
Let's use the existing git repository:
https://github.com/IdentityModel/oidc-client-js

Then follow the steps:

* Clone a local git repository
* Install the modules by: npm i
* Modify the code in example/oidc-client-sample.js

.. code:: 

    var settings = {
        authority: 'https://accounts.google.com',
        client_id: 'xxxxx',
        redirect_uri: 'http://localhost:5000/oidc-client-sample.html',
        post_logout_redirect_uri: 'http://localhost:5000/oidc-client-sample.html',
        response_type: 'id_token token',
        scope: 'openid email',
    
        filterProtocolClaims: true,
        loadUserInfo: true
    };

* Start the Node.JS app: npm start
* Test the app in browser: localhost:5000
* Click the signin button to sign by using your google account
* Click processignin response button to get the response

If everything goes well, you are suppose to see the following response content.

.. code::

 signin response
 {
   "state": {
     "bar": 15
   },
   "id_token": "eyJhbGciOiJSUzI1NiIsImtpZCI6IjAwOThiMzFlNDA2NTE0OTNjZDA4YzFkYjA1NmQ2ZGI2YWU5NTY1MzMifQ.eyJhenAiOiI2MjQyNjc2NTM5MDgtcTllNDZ2dmU2Mzk3aHBvcHZ2NzZ0azk4bWlkN2EwY3EuYXBwcy5nb29nbGV1c2VyY29udGVudC5jb20iLCJhdWQiOiI2MjQyNjc2NTM5MDgtcTllNDZ2dmU2Mzk3aHBvcHZ2NzZ0azk4bWlkN2EwY3EuYXBwcy5nb29nbGV1c2VyY29udGVudC5jb20iLCJzdWIiOiIxMDc0Njc3ODM4NTgxMzE3ODA2MTAiLCJlbWFpbCI6InN1bW1lcnNub3dlQGdtYWlsLmNvbSIsImVtYWlsX3ZlcmlmaWVkIjp0cnVlLCJhdF9oYXNoIjoiZ3lzNm5uX2VobVVaR0FoV0FFZGFMUSIsIm5vbmNlIjoiMTc1ZDEyOTY2MzBkNGI2NmIzMDBlNDY0OTg1YzBiMjAiLCJpc3MiOiJodHRwczovL2FjY291bnRzLmdvb2dsZS5jb20iLCJpYXQiOjE0OTk2MDY4OTMsImV4cCI6MTQ5OTYxMDQ5M30.XJmRpaf5VLBZIV9EdlhR_m0zlmkkbwdf8_ekXjsseCzX1gMdTDgJSea4paIsakPkZbsoUz3y2yEg2qg5Had9aEicHqgU0YjEGIRmjAToYhDWsI20Eb0RVfNmKaHLS9R7SRoVuMsmO7cvpCZumr0UIWyX3ZY1lOpk0e2W-hJegLoya-esijp9ZajcFS-M3oNtPVZISVxRi0uTMaFvmSE3yM-_15YczLbkHiJWlblvEMbiCxbsi9J6AsEl5z8v5MYfuac0Nr7I3SHgbM2tUc0LFMhwCDGAAf7MomcuHLL6SVA73V7iS5Qiqe1DeYwXCf4JjiN9qqnMz5mI8BMI3v0i4g",
   "session_state": "6b51bc71b013627ec110cb21b7ce19846399ae2d..28cf",
   "access_token": "ya29.GluCBIpJ8UKUuTIdz9TIcIsBflxM66xnsPlEi66GBn_Putc3qnQeQnDYt7QKWkdoQr1nctU0Zkbz8cIPxujpnUabNY2GfgM0gELdeXMYmzj-Nua9GRUexq4_VO7N",
   "token_type": "Bearer",
   "profile": {
     "azp": "624267653908-q9e46vve6397hpopvv76tk98mid7a0cq.apps.googleusercontent.com",
     "sub": "107467783858131780610",
     "email": "summersnowe@gmail.com",
     "email_verified": true,
     "name": "Summer Snow",
     "given_name": "Summer",
     "family_name": "Snow",
     "profile": "https://plus.google.com/107467783858131780610",
     "picture": "https://lh6.googleusercontent.com/-fC9bhpKev6k/AAAAAAAAAAI/AAAAAAAAATo/maihymGPzVM/photo.jpg",
     "gender": "male"
   },
   "expires_at": 1499610496
 }

Congratulations, you managed to get your Node.JS app authenticated by your google account!

*Written by Binwei@Oslo*

