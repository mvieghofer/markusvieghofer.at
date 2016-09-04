---
layout: post
title: Why Java 8 Default Methods are cool
date: '2015-11-28 18:17:07'
tags:
- interface
- java
- java-8
---


Since [Java 8](https://docs.oracle.com/javase/tutorial/java/IandI/defaultmethods.html) you can implement default methods to interfaces. This is pretty handy if your default implementation can be implemented in a generic way.

One example are the sort methods that come with the collection interfaces. In previous versions of Java, a lot of util methods were added in util classes. The Collections class provided a lot of useful methods for collections.

With default methods this isn’t necessary anymore. The interface itself can provide the default implementations which can then be overriden or extended in the classes.


## Multiple Inheritance

This can lead to the problem of multiple inheritance. When one of your classes implements at least two interfaces with the same default method your compiler will exit with an error. You will have to manually solve this conflict.

This could be done this way:

```java
public interface A { 
    default void bar(String message) { 
        System.out.println("Hello, " + message); 
    } 
}

public interface B { 
    default void bar(String message) { 
        System.out.println("Another implementation of foo, " + message); 
    } 
}

public class Foo implements A, B { 
    public void bar(String message) { 
        A.super.bar(message); 
    } 
}
```


## Will default methods be the end of utility classes?

With default methods utility classes were made obsolete. Everything you can do with utility classes you can do with default method implementations in interface, too.

The pros about default methods are that you can add them directly to your class. If you implement some utility method that will be used for a broad range of classes maybe default methods are the better way.

However default methods make multiple inheritance a potential problem again. It might be hard to resolve such a conflict.

Since the compiler will tell you about the error as soon as the code is compiled you will realize such errors very soon. This will give you the chance to fix the errors as soon as possible.

Another point against default methods are that you might not want to let your class implement a lot of different interfaces that contain default methods. On the other hand, if you have an interface ‘A’ with a default method implementation you can easily create a util class that implements this methods if you don’t want your class to implement the interface ‘A’.

As always it is a matter of taste and dependent on the actual use case.

A project that contains the default method show cases is also available on [GitHub](https://github.com/DevCouch/DefaultMethods).

<span style="color: #999999;">Featured image taken from: [https://flic.kr/p/iQbXu9](https://flic.kr/p/iQbXu9)</span>


