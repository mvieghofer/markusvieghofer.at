---
layout: post
title: How to avoid NullPointerExceptions
date: '2015-12-13 20:22:19'
disqus: true
tags:
- design-pattern
- java
- 'null'
meta_description: "My name is Markus Vieghofer and I'm an experienced Java developer located in Austria. I write about Java, Android and other technology stuff."
---


NullPointerExceptions are a bad thing. It’s probably the worst Exception that can occur in a Java program.

Your app dies and you, probably always, cannot recover it.

Even the “inventor” of null, Tony Hoare, claims null references was his [billion dollar mistake](http://www.infoq.com/presentations/Null-References-The-Billion-Dollar-Mistake-Tony-Hoare).

If you don’t check your variables for null you risk NullPointerExceptions. This bloats up your code and makes it harder to read.

You have to add lots of <span class="code">if (variable != null)</span> to your code even though you know that at this point the variable can never be null. Just to be save you add it anyway.

But it doesn’t have to be this way. You can be sure that your code is save and remove all the unnecessary if checks at the same time.


## How your IDE can help you to avoid NullPointerExceptions?

Your IDE helps you with a lot of things. Besides the typical stuffs such as autocompletion, syntax highlighting, code navigation it can do something special for you.

It can help you get rid of NullPointerExceptions and unnecessary null checks.

All you have to do is to use the @Nonnull and @Nullable annotations and tell your IDE to check for them.

The problem that occurred with these annotations is that there was no default implementations of them, so a few vendors implemented them on there own. This resulted in the fact, that there is now a [@NonNull](http://findbugs.sourceforge.net/api/edu/umd/cs/findbugs/annotations/NonNull.html) and a [@Nullable](http://findbugs.sourceforge.net/api/edu/umd/cs/findbugs/annotations/Nullable.html) annotation by [findbugs](http://findbugs.sourceforge.net/), one by IntelliJ (they are called [@NotNull and @Nullable](https://www.jetbrains.com/idea/help/nullable-and-notnull-annotations.html)) and [some more](http://stackoverflow.com/questions/4963300/which-notnull-java-annotation-should-i-use).

There is also the [Checker framework](http://types.cs.washington.edu/checker-framework/) that provides these annotations. This framework was also suggested on the [oracle blog](https://blogs.oracle.com/java-platform-group/entry/java_8_s_new_type).

You should decide which of these annotations you want to use and add them to your code.


## Which annotation should you use?

Since most IDEs can work with different annotations it doesn’t really matter which annotation you use.

![Configure the annotations to use in IntelliJ](/assets/images/nullable/nullable-setup.png "Configure the annotations to use in IntelliJ")

You have to make sure that your IDE supports the annotation you want to use. Of course, you should also only use the annotations of one vendor to keep your code clean.


## Example

At first I had to add a dependency to the annotations. I chose to use the findbugs annotations.

{% highlight groovy %}
dependencies { compile 'com.google.code.findbugs:annotations:3.0.1' }
{% endhighlight %}

After that I created an Address class that holds a very simplified version of an address object of a person.

{% highlight java %}
package net.devcouch;

public class Address {
    public final String street;
    public final String city;

    public Address(String street, String city) {
        this.street = street;
        this.city = city;
    }

    @Override
    public String toString() {
        return "Address{"
            + "street='" + street + '''
            + ", city='" + city + '''
            + '}';
    }
}
{% endhighlight %}

Then I create a Person class. This class hold the first and the last name of a person and his or her address. However the address is optional and can be null.

{% highlight java %}
package net.devcouch;

import javax.annotation.Nonnull;
import javax.annotation.Nullable;

public class Person {
    public final String firstName;
    public final String lastName;
    public Address address;

    public Person(String firstName, String lastName) {
        this.firstName = firstName;
        this.lastName = lastName;
    }

    public Person(String firstName, String lastName, Address address) {
        this(firstName, lastName);
        this.address = address;
    }

    @Nonnull
    public String getFullName() {
        return firstName + " " + lastName;
    }

    @Nullable
    public String getAddressString() {
        if (address == null) {
            return null;
        }
        return address.toString();
    }
}
{% endhighlight %}

Last but not least I create a Main class which used these both classes.

{% highlight java %}
package net.devcouch;

public class Main {
    public static void main(String[] args) {
        Person person = new Person("Markus", "Vieghofer");
        System.out.println("Hello " + person.getFullName());
        if (person.getAddressString() != null) {
            System.out.println(person.getAddressString());
        }

        Address address = new Address("street", "city");
        person = new Person("Markus", "Vieghofer", address);
        if (person.getFullName() != null) {
            System.out.println("Hello, " + person.getFullName());
        }
        if (person.getAddressString() != null) {     
            System.out.println(person.getAddressString());
        }
    }
}
{% endhighlight %}

Since I added the <span class="code">@Nonnull</span> annotation to the <span class="code">Person#getFullName()</span> I got a warning from my IDE.

![Warning because of unnecessary null check](/assets/images/nullable/warning.png "Warning because of unnecessary null check")

The <span class="code">@Nullable</span> annotation gets displayed when you show the javadoc of the method.

![@Nullable appears in the javadoc](/assets/images/nullable/javadoc.png "@Nullable appears in the javadoc")

You can also check out the code at [Github](https://github.com/DevCouch/Nullable).

Using these techniques will help you slim down your code and make it better documented and more secure at the same time.
