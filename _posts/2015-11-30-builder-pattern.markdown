---
layout: post
title: The Builder Pattern
date: '2015-11-30 19:13:14'
tags:
- builder-pattern
- design-pattern
- java
---


Most of the time when you create a Java bean you add all properties as private fields and create a public getter and setter for each field. In this post I will tell you why this isn’t good practices and how you can make it better.


## Why getters and setters are most of the time not necessary?

Most getters and setters will just return the value they are created for. This results in huge files with a lot of unnecessary code. The benefit of such getters and setters is not really given. It just makes the code less readable.

A much better approach is to make all fields publicly available so that they can be accessed from outside. To make the beans more robust you should also implement a builder for each bean.


## What’s the builder pattern?

A builder can be used to configure a bean and then return a final version of it. The huge benefit of this pattern is that your beans get immutable. This will prevent developers to set values after a bean was created. If this has be done, a new bean has to be created.

The builder for a certain bean contains private instances of all fields the bean to create also contains. They are typically exposed them using a fluent interface.

This way the builder can be configured in a very readable way. When everything is done the actual bean can be built using the build method of the builder.

```java
public class Bean { 
    public final String firstName; 
    public final String lastName; 
    
    public Bean(String firstName, String lastName) { 
        this.firstName = firstName; 
        this.lastName = lastName; 
    } 

    public String toString() { 
        return firstName + " " + lastName; 
    } 

    public static class Builder { 
        private String firstName; 
        private String lastName; 
    
        public Builder firstName(String firstName) { 
            this.firstName = firstName; 
            return this; 
        } 

        public Builder lastName(String lastName) { 
            this.lastName = lastName; 
            return this; 
        } 

        public Bean build() { 
            return new Bean(firstName, lastName); 
        } 
    } 
}
```

You can then use the builder to create the build like this:

```java
public class Main { 
    public static void main(String[] args) { 
        Bean bean = new Bean.Builder() 
                            .firstName("Markus") 
                            .lastName("Vieghofer") 
                            .build(); 
        System.out.println(bean.toString()); 
    } 
}
```

The project is also hosted on [GitHub](https://github.com/DevCouch/BuilderPattern).

<span style="color: #999999;">Featured image taken from: https://flic.kr/p/g5TFN5</span>


