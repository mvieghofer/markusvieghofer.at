---
layout: post
title: How to handle Java exceptions properly
date: '2015-11-04 19:05:07'
disqus: true
tags:
- excetions
- java
meta_description: "My name is Markus Vieghofer and I'm an experienced Java developer located in Austria. I write about Java, Android and other technology stuff."
---


One base part of the Java framework are exceptions. A lot of people use them but not everyone who use them also know how to use them properly.

One important thing to know about exceptions is how their hierarchy is built up. The root of all exceptions is the [Throwable](http://docs.oracle.com/javase/7/docs/api/index.html?java/lang/Throwable.html) interface.

Below that there are basically three types of exceptions: (1) [Error](http://docs.oracle.com/javase/7/docs/api/java/lang/Error.html)s, (2) [Exception](http://docs.oracle.com/javase/7/docs/api/java/lang/Exception.html)s and (3) [RuntimeException](http://docs.oracle.com/javase/7/docs/api/java/lang/RuntimeException.html)s.

Errors are thrown when something is wrong with the JVM. Errors should not be wrapped inside a try-catch block because they signal that the application is in a not recoverable condition.

Exceptions, or also called checked exceptions, should be thrown when some expected error happened but the application can be recovered. Examples for checked exceptions are [IOException](http://docs.oracle.com/javase/7/docs/api/java/io/IOException.html) of [SQLException](http://docs.oracle.com/javase/7/docs/api/java/sql/SQLException.html)s. These errors are not caused by the user but because of some other instance that cannot be influenced (such as the network or IO).

Checked exceptions have to be declared in the method signature and have to be explicitly dealt with. This means that when a method you are using throws an IOException you can either catch and deal with it or you add a <span style="font-family: monospace;">throws IOException </span>to your method.

Runtime exceptions are subtypes of exceptions that don’t have to be dealt with immediately. Often these exceptions are thrown when the developer made a mistake. A [NullPointerException](http://docs.oracle.com/javase/7/docs/api/java/lang/NullPointerException.html) would be an example of a runtime exception.


# When should you use which kind of exception?

You should never throw Errors (only if you have a very very good reason such as you broke the JVM).

When something happens which is predictable and the application is very likely recoverable you should throw a checked exception. As I said before examples of these are SQLExceptions which are thrown when there is a problem with a database.

Similarly when there is something wrong with your app or framework which can be repaired by the user you should throw a checked exception.

However you should always think twice if you throw a checked exception. If the method you implement throws lot of checked exception will lead the user to just catch an Exception. All the benefits you get from exception will then be lost.

When something goes wrong because your user did something wrong you should throw a RuntimeException. If you throw a RuntimeException yourself, you should always document it.


# What is the benefit of custom exceptions?

Also you should consider to create custom exceptions. With custom exceptions you can add some additional information and also don’t provide implementation details to the user.

For example if you implement a file based storage and a database storage your user shouldn’t have to deal with SQLExceptions or IOExceptions. You should wrap these exceptions in your custom StorageException.
