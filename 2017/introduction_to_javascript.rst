
Introduction to Javascript
===============================

.. post:: Sep 9, 2017
   :tags: web, frontend
   :category: ComputerScience

Javascript is the fundumantal programming language for frontend development. 
This blog introduces the basic concept of Javascript language. 

.. contents::

Javascript Basic
====================

First, let's compare Javascript with a OOP programming language C#.

+-----------------------+-----------------------+
| C#	                | Javascript            |
+-----------------------+-----------------------+
| Strongly-Typed        | Loosely-typed         |
+-----------------------+-----------------------+
| Static                | Dynamic               |
+-----------------------+-----------------------+
| Classical Inheritance	| Prototypal            |
+-----------------------+-----------------------+
| Classes               | Functions             |
+-----------------------+-----------------------+
| Constructors	        | Functions             |
+-----------------------+-----------------------+
| Methods               | Functions             |
+-----------------------+-----------------------+

Strongly typed or weakly typed (loosely typed)
-------------------------------------------------
In general, a strongly typed language is more likely to generate an error or refuse to compile if the argument passed to a function does not closely match the expected type. 
On the other hand, a weakly typed language may produce unpredictable results or may perform implicit type conversion.

.. code-block:: javascript

    var x = 0;
    var isNumber = typeof x == "number";
    x = new Object();

Duck typing
---------------
Type is less important, but shape is important

.. code-block:: javascript

    function Feed(ani) { ani.Feed() } // accepts any object implements Feed function

Dynamic Typing
------------------

A language is statically typed if the type of a variable is known at compile time.
A language is dynamically typed if the type is associated with run-time values, and not named variables/fields/etc.

.. code-block:: javascript

    var x = {
    	name: "Shawn",
    	city: "Atlanta"
    };
    x.phone = "xxx-xx-xxx";
    x.makeCall = function() {
    	callSomeone(this.phone);
    };

Type
======

Type Coalescing
------------------
Javascript wants to coalesce values.

.. code-block:: javascript

	"test " + "me"
	"test " + 1
	"test " + true
	"test " + (1 == 1)
	100 + "25" // 10025

Most operators in Javascript are identical to .net, except…

* Equality/NotEqual (==, !=): The means determines equality with coalescing (if necessary)
* Javascript's identically Equality operators (===, !==) which is similar to .Equal(). Determines quality without coalescing

.. code-block:: javascript

	"hello" == "hello"; // true
	1 == 1; // true
	1 == "1"; // true
	1 === "1"; // false
	1 !== "1"; // true

Types Primitives
---------------------
Javascript has basic types

* Value types: boolean, string, number
* Reference Type: object
* Delegate type: function
* Special: undefined, null

.. code-block:: javascript

    var a = typeof 1; //number
    var b = typeof 1.0; // number
    var c = typeof true; // boolean
    var d = typeof false; // boolean
    var e = typeof "hello world"; // string

Number
---------

Examples of number:

* 1, 1.5, 070, 0xffff, 1.34e6, 10.0
* Number.MIN_VALUE
* Number.MAX_VALUE
* Number.POSITIVE_INFINITY;
* Number.NEGATIVE_INFINITY;

Operator
---------

.. code-block:: javascript

    var fail = 10/"zero"; // NaN
    var test1 = NaN == NaN; // false
    var test2 = isNaN(NaN); // true
    var test3 = isNaN(fail); //true
    var test4 = isNaN(10); // false
    var test5 = isNaN("10"); //false
    var test6 = isNaN("fail");//true
    
All the following values are false

.. code-block:: javascript

    if("")
    if(0)
    if(10/0)
    if(null)
    if(undefined)

Function
============

Overloading function
---------------------

Javascript does not support function overload.

.. code-block:: javascript

    function foo(one) {
        alert('first);
    }
    function foo(one, two) {
        alert('second');
    }
    foo(1); // second

The second one simply overrule the first one

Arguments object
------------------
Arguments object is available inside function body only.

.. code-block:: javascript

    function foo(one, two, three) {
    	alert(arguments.length); 
    }
    foo(1);     //1
    foo(1, 2);  //2
    foo(1,2,3); //3

Accessing the values through arguments object.

.. code-block:: javascript

    function foo() {
    	for(var x = 0; x < arguments.length; x++) {
    		alert(arguments[x]);
    	}
    }
    foo(1, 2, 3); // 1,2,3

All functions return a value
--------------------------------
If not defined then it's 'undefined'

.. code-block:: javascript

    function foo() {
    	return;
    }
    var x = foo();

Function is just an object
----------------------------
Has properties and member functions

.. code-block:: javascript

    function log(s) { alert('yup'); }
    var x = log.length; // 1 parameter
    var y = log.name; // 'log' 
    var z = log.toString() // 'function log(s) { alert('yup'); }

Function Body Variable
---------------------------
"this" applies to the owner of the function

.. code-block:: javascript

    var f = function() {
    	alert(this);
    };
    f(); // [Object Window]
    
    var obj = {
    	name: 'myObj',
    	myFunc: function() {
    		console.log(this.name);
    	}
    };
    obj.myFunc(); // 'myObj'
    
    var f = obj.myFunc.bind(this);
    f(); // this == global object

bind() lets you change the owner.

For details, see:
https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Operators/this

Closures
----------
JavaScript closure makes it possible for a function to have "private" variables.

.. code-block:: javascript

    var add = (function () {
        var counter = 0;
        return function () {return counter += 1;}
    })();

    add();
    add();
    add();

    // the counter is now 3

The variable add is assigned the return value of a self-invoking function.

The self-invoking function only runs once. It sets the counter to zero (0), and returns a function expression.

This way add becomes a function. The "wonderful" part is that it can access the counter in the parent scope.

The counter is protected by the scope of the anonymous function, and can only be changed using the add function.

The magic is that in JavaScript a function reference also has a secret reference to the closure it was created in — similar to how delegates are a method pointer plus a secret reference to an object.

.. code-block:: javascript

    function say667() {
    	var num = 42;
    	var say = function() { console.log(num); }
    	num++;
    	return say;
    }
    var sayNumber = say667();
    sayNumber(); //logs 43

.. code-block:: javascript

    var gLogNumber, gIncreaseNumber, gSetNumber;
    function setupSomeGlobals() {
    	var num = 42;
    	gLogNumber = function() { console.log(num); }
    	gIncreaseNumber = function() { num++; }
    	gSetNumber = function(x) { num = x; }
    }
    setupSomeGlobals();
    gIncreaseNumber();
    gLogNumber(); //43
    gSetNumber(5);
    gLogNumber(); // 5
    
    var oldLog = gLogNumber;
    
    setupSomeGlobals();
    gLogNumber(); // 42
    oldLog() //5

Note that in the above example, if you call setupSomeGlobals() again, then a new closure (stack-frame!) is created. 

The old gLogNumber, gIncreaseNumber, gSetNumber variables are overwritten with new functions that have the new closure.

Closure can also introduce tricky bugs if not used correctly.

.. code-block:: javascript

    function buildList(list) {
    	var result = [];
    	for (var i = 0; i < list.length; i++) {
    		var item = 'item' + i;
    		result.push(function() { console.log(item + ' ' + list[i]) });
    	}
    	return result;
    }
    function testList() {
    	var fnlist = buildList([1,2,3]);
    	for (var j = 0; j < fnlist.length; j++) {
    		fnlist[j]();
    	}
    }
    testList() // logs 'item2 undefined' 3 times

This is because just like previous examples, there is only one closure for the local variables for buildList. 
When the anonymous functions are called on the line fnlist[j](); they all use the same single closure, and they use the current value for i and item within that one closure (where i has a value of 3 because the loop had completed, and item has a value of 'item2'). 
Note we are indexing from 0 hence item has a value of item2. 
And the i++ will increment i to the value 3.

Self-executing function
---------------------------

.. code-block:: javascript

    (function() {
    	var private_variable = 'private';
    })();

Scope
-------------
Javascript has scope chain. 
When looking for the definition of a variable, the javascript engine first looks at the local execution context object. 
If the definition isn't there, it jumps up the scope chain to the execution context it was created in and looks for the variable definition in that execution context object, and so on until it finds the definition or reaches the global scope.

Global scope. Objects at root are 'global'.

.. code-block:: javascript

    var a = 'Hello'
    if(true) {
    	var b = a;
    }
    var c = b; //this works

.. code-block:: javascript

    var a = 'hello';
    function() {
    	var b = a;
    }
    var c = b; //this doesn't work

Javascript lacks real namespaces.
We can mimic by creating with objects to avoid polluting the global scope.

.. code-block:: javascript

    // Construct or Import Namespace
    var WilderMinds = WilderMinds || {};
    WilderMinds.currentTime = function() {
    	return new Date();
    };

Anonymous self-executing functions: protects the global namespace by function scope
All Together: Namespaces and Anonymous Self-Executing Functions

.. code-block:: javascript

    (function(ns) {
    	var currentDate = new Date();
    	ns.currentTime = function() {
    		return currentDate;
    	};
    })(window.WilderMinds = window.WilderMinds || {});

OOP in Javascript
===================

Javascript also support OOP paradiam.

Inheritance
------------

.. code-block:: javascript

    var proto = {
    	sentence: 4,
    	probation: 2
    };

    var Prisoner = function (name, id) {
    	this.name = name;
    	this.id = id;
    };

    Prisoner.prototype = proto;
    var firstPrisoner = new Prisoner('Joe', '12A');
    var secondPrisoner = new Prisoner('Sam', '2BC');

Object.Create can also do the same thing

Javascript also has prototype chain. __proto__

__proto__ is the actual object that is used in the lookup chain to resolve methods, etc. 
prototype is the object that is used to build __proto__ when you create an object with new().

'Class' in Javascript
-----------------------------
Closures can make properties private

.. code-block:: javascript

    funciton Customer(name, company) {
    	//public
    	this.name = name;
    	this.company = company;
    	
    	// private
    	var mailServer = 'mail.google.com';
    	
    	this.sendEmail = function(email) {
    		sendMailViaServer(mailServer);
    	};
    }

Static Members
------------------

.. code-block:: javascript

    function Customer(name, company) {
    	this.name = name;
    	this.company = company;
    }
    Customer.mailServer = 'mail.google.com';

Sharing a function
------------------------
That way each instance doesn't have it's own copy

.. code-block:: javascript

    Customer.prototype.send = funciton(email) { … }

Basic inheritance with the Prototype object

.. code-block:: javascript

    function Cow(color) {
    	this.color = color;
    }
    Cow.prototype = new Animal('Hay');
    
    var c = new Cow('White');
    c.feed();
    var test = c instanceof Animal; // true
    var test2 = c instanceof Cow; // true

Can Fake Abstract Classes with some caveats

.. code-block:: javascript

    var Animal = {
    	foodType: 'None',
    	feed: function() {
    		log('fed the animal: ' + this.foodType);
    	}
    };
    var a = new Animal(); //Fails (not a constructor)

Object Reflection
---------------------
Property Syntaxes

* Dot syntax: cust.name
* Bracket Syntax: cust["name"]

Enumerating members: simplest version of reflection

.. code-block:: javascript

    var cust = {
    	name: 'Shawn',
    	'company name': 'Wilder Minds',
    	sendMail: function() { … }
    };
    for (var prop in cust) {
    	alert(prop);
    	alert(cust[prop]);
    }

    var has = cust.hasOwnProperty('name');
    var isEnum = cust.propertyIsEnumerable('name');

Extension methods
----------------------
prototype can be used to add extension methods
Add to existing type's prototype

.. code-block:: javascript

    Array.prototype.calculateCount = function() {
    	return this.length;
    };
    var a = ['one', 'two'];
    var count = a.calculateCount();

*Written by Binwei@Trondheim*

