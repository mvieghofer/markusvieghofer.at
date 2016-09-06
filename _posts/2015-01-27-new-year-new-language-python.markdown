---
layout: post
title: New Year, New Language - Python
date: '2015-01-27 20:54:48'
disqus: true
tags:
- programming
- programming-language
- python
---


I’ve decided to learn a new programming language this year. It’s going to be Python.

Why Python you ask?

It’s something new, kind of different than Java (the programming language I currently work with) and provides some awesome features. This is my current top 5 list of Python features.

It is…


# 1. Dynamically Typed

Python is dynamically typed whereas Java is statically typed. The difference between the two type system is that Java determines the type at compile time and Python at runtime.

This makes Python a lot more flexible. You don’t have to define the type of a variable, Python infers it from the variables value.

```python
def test():
    myInt = 5
    myString = "test string"
```

Although Python is dynamically typed it is still is strongly typed. This means a variable that holds a string value will always be of the type string. You cannot modify type of a string by e.g. adding a number to it.

```python
def test():
    myVar = "test"

    # this works
    myVar = 5
    myVar += 10

    #this doesn't work
    print "test" + myVar
```


# 2. List Functions

Python provides some awesome list functions. This is one of the most powerful features of Python.

You can easily define a list.

```python
def test2():
    list = [1, 2, 3, 4]
```

You can also apply a lot of functions on lists.

```python
def test2():
    list = [1, 2, 3, 4]
    list += [5, 6] # list = [1, 2, 3, 4, 5, 6]
    list[2:3] # prints [3, 4]
    list[-1] # prints [6], this feature is really awesome!!
    list.remove(4) # list = [1, 2, 3, 5, 6]
    list.insert(1, 17) # list = [1, 17, 2, 3, 5, 6]
    element = list.pop() # element = 6, list = [1, 17, 2, 3, 5]
    list.reverse() # list = [5, 3, 2, 17, 1]
    list.sort() # list = [1, 2, 3, 5, 17]
```

However, the coolest feature for lists is that you can apply functions directly on lists (and all its items). You can use this to modify all elements in a certain list. And you do all this in one line.

```python
def test2():
    list = [1, 2, 3, 4]
    doubleList = [elem * 2 for elem in list]
    # doubleList = [2, 4, 6, 8]
```

# 3. Named Arguments

You can define named arguments for methods and set default values for them. Later, when you invoke the method you can set the values of the arguments by name.

This allows you to use certain default values and only pass the necessary values to the method.

```python
def test(stringArg, intArg=5, booleanArg=True):
    if booleanArg:
        print stringArg + str(intArg)
    else:
        print stringArg + str(intArg * 2)

test("test")
test("test", 3)
test("test", booleanArg=False)
test("test", booleanArg=False, intArg=2)
```

# 4. Readability

Python is really easy to read. There isn’t any clutter, nearly nothing that isn’t absolutely necessary.

Differently than Java, which uses curly braces for defining blocks, Python programs use intention for doing that. This also means, that most Python programs will look similar.

Therefore it is easy for developers to read any Python program by any developer. You will probably agree with me that this is one of the most important features of any programming language.


# 5. Purely Object Oriented

In Python everything is an object. There are no primitive data types as in Java.

Even though it doesn’t change the basic programming principle it makes Python differently from Java. I wanted to learn a purely object oriented language for once. Therefore Python seems to be a very good fit.

<span style="color: #808080;">Feature image taken from: [https://flic.kr/p/NWe1M](https://flic.kr/p/NWe1M "Python Photo Link")</span>
