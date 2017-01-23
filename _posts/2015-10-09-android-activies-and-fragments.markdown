---
layout: post
title: Android Activities and Fragments
date: '2015-10-09 09:41:36'
disqus: true
tags:
- android
meta_description: "My name is Markus Vieghofer and I'm an experienced Java developer located in Austria. I write about Java, Android and other technology stuff."
---


When developing an Android app for the first time isn’t easy. It is difficult to find the right starting point in the depth of available frameworks.

One of the first things you should look at is the life cycle of an Android app. Knowing when to you get the chance to interact with the android operating system is essential for developing a great app.

To fully understand how your UI is created you need to know two basic classes: (1) the [Activity](http://developer.android.com/reference/android/app/Activity.html) and the (2) the [Fragment](http://developer.android.com/reference/android/app/Fragment.html).


# Activities in your Android app

The Activity is the main entry point to your application. As the name implies an Activity is one thing the user can do inside your app.

The Activity class provides some methods you can override to intercept certain events such as the onCreate or onDestroy event. Check out the Android documentation on [this topic](http://developer.android.com/guide/components/activities.html).

If you developed an Android app before Android 3.0 your Activity would setup the UI and do all the stuff that needs to be done. Now your Activity serves as the glue between your UI, your model and everything else. Although Android apps don’t follow the MVC pattern exactly you could say that the Activity would be the controller is such a pattern.


# Fragments

Actually it would be enough to know about Activities to start creating your Android app.

However I think it is very important to write about Fragments right after you learned about Activities. The reason is that using Fragments makes Android development so much more easier, cleaner, better readable, etc.

A fragment encapsulates a certain part of your UI. Typically this is a screen on a smartphone such as a list of items or a detail view of a specific item. By putting all elements necessary for a block of UI elements inside a Fragment it is really easy to create different layouts for different screen sizes or orientations.

![Android Fragments](/assets/images/android-fragments/fragments.png "Android Fragments")

When you use Fragment to do all the UI stuff you don’t have to do that in your Activities anymore. The Activities do only the things the should do, glueing everything together and enrich it by some additional logic.
