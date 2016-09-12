---
layout: post
title: Create your first Android App
date: '2015-05-21 19:18:12'
disqus: true
tags:
- android
- tutorial
---


You want to write your first Android app?

That’s great!

It also makes a lot of sense to develop Android apps. It comes with its own distribution system, so you don’t have to take care of that.

Also every day more than 1 million new Android devices are activated. This means that there are a lot of potential customers out there.

In this post I want to walk you through the basic setup of what you need to develop your first Android app. I also want to guide you while you create your first Android app.


# Setup System

For Android development you can use [Android Studio](http://developer.android.com/sdk/index.html) (at the time of this writing I used version 1.2), the official IDE for Android apps. It’s based on IntelliJ and comes with everything you need preinstalled.

Of course you can also use Eclipse and the [ADT Plugin](http://developer.android.com/sdk/installing/installing-adt.html). However it is suggested to use Android Studio.

After installing your IDE you have to install the SDK you want to used. This can be done using the SDK Manager.

You can start the SDK Manager directly from your IDE which is really handy since you can install missing SDKs as you code. To start the SDK Manager from Android Studio select **Tools > Android > SDK Manager** or you click on the ![SDK Manager Icon](/assets/images/android/sdk-manager-icon.png) button.

Then you install the SDK you want to develop your Android app for. You should take a look at the current distribution of Android versions. Currently KitKat is installed on about 40% of all Android devices. That means it makes a lot of sense to develop for this (or newer) distributions instead for older ones.

When you opened your SDK Manager you can choose between all available SDKs and install the needed SDK.

![SDK Manager](/assets/images/android/sdk-manager.png)

Congratulations, you’ve just finished your setup. Now its time to start your first project.


# Create Your first Android App

When you start Android Studio you can select one of your recent projects or you choose any option from the Quick Start menu.

![Android Studio Quick Start](/assets/images/android/sdk-manager-start.png)

We want to “Start a new Android Studio project”. After you’ve clicked this button a wizards opens that helps you creating your first android app.

Choose any application name and company domain. The values entered here are used to generate the package structure so it doesn’t matter if you develop just for yourself and don’t have an actual company or a domain.

I used “Hello World” as the application name and used my domain devcouch.net. This results in the package `net.devcouch.helloworld`. You can edit this package name if you want, I will leave it as it is, though.

![Application name and domain](/assets/images/android/sdk-manager-domain.png)

After you have chosen these two value select the project path and the API level (on the next screen).

Then a selection of project templates will be presented to you. You can choose one of these templates which will then generate some files for you to make it easier to start.

![Template Selection](/assets/images/android/sdk-manager-template.png)

For our example please select the “Blank Activity” template and go to the next screen. There you can adjust the suggested file names contained in the template. I will leave them as they are.

After you click finished you have successfully created your first Android app.


# Hello world

Typically the first application you write in a new programming language is a Hello World application. Also Android sticks with this convention.

![Hello World Project](/assets/images/android/project.png)

In your project you will find a few files.

For example the [AndroidMainfest.xml](http://developer.android.com/guide/topics/manifest/manifest-intro.html) which defines e.g. the [Activities](http://developer.android.com/guide/components/activities.html) used in or the [Permissions](http://developer.android.com/guide/topics/manifest/manifest-intro.html#perms) used by your project.

However the most important files in our first project are the `MainActivity.java` and the `activity_main.xml` files.

The `MainActivity.java` is your first activity. In the `AndroidManifest.xml` this file is declared as the entry point to your application.

When you open it, you see a few methods implemented. The `onCreate` method is the method that is called when the activity is created. It sets the content view and (for more advanced applications) does some other initialization.

We will leave this file as it is since it does exactly what it should by now.

The second interesting file is the `activity_main.xml` file. It is the layout for the `MainActivity`. You maybe already saw, that this file was set as the view in the `MainActivity#onCreate` method using this code:

{% highlight java %}
setContentView(R.layout.activity_main);
{% endhighlight %}

When you open this file you will see that it is written in XML. Inside the root element (a [RelativeLayout](http://developer.android.com/reference/android/widget/RelativeLayout.html)) there is a [TextView](http://developer.android.com/reference/android/widget/TextView.html) element. This element contains a text property with the value “Hello World”.

As you can see that value isn’t hard coded into the layout file but it is located in another file. This file is located in `src/main/res/values/strings.xml`. The reason for this is that your values can easily be translated into any other language.

If you want to translate your application to German you just have to create a `values-de` folder next to the values folder which contains the same `strings.xml` file but with the translated values. Android will now automatically choose the correct `strings.xml` file according to the users system language.

That’s basically it. When you start the application by clicking the Run button your Hello World application can either run in an emulator or on your phone. From there you can start coding your super awesome first android app!
