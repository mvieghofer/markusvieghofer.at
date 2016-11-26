---
layout: post
title: Why you should use an repository manager
date: '2015-12-30 19:21:06'
disqus: true
tags:
- artifactory
- gradle
- maven
- versioning
meta_description: "My name is Markus Vieghofer and I'm an experienced Java developer located in Austria. I write about Java, Android and other technology stuff."
---


When you develop larger applications the time will come when you experience a dependency hell if you don’t handle your dependencies properly.

A scenario I experienced multiple times is that I checked out a new project from the source code repository and wanted to compile it. However when I started the compilation process my build tool told me that I miss some dependency to another of my projects. After I checked out this project and installed it into my local Maven repository I could compile the first project.

Some times this process went on for a while until I had installed all projects into my local Maven repository.

The solution that would help to avoid this problem is to install some kind of global repository which hosts all versions of your internally developed projects. During the development process everyone who needs a specific version of any project can download it from there and use it.


## How can a repository manager help you to accomplish this?

A repository manager is a tool that hosts all versions of your internally developed projects and provides a central place to download it from. It also may act as a proxy to publically available repositories (such as the the central Maven repository).

It holds all the versions of your internal projects you deploy to it. Later you can download the needed dependencies from there. If you configure your build tools correctly all this is done automatically.


## Nexus vs. Artifactory

There are two big players that provide repo managers: [Nexus](http://www.sonatype.org/nexus/) and [Artifactory](https://www.jfrog.com/artifactory/). Both tools are open source and can be used for free. This free version only provides the basic features, though. Since both tools come from the Java world, you can use the free version perfectly as a repository manager for your Java projects.

Besides the Java artifact management a of of other types of repositories can be managed, such as Docker, RPM or Bower.

Since both tools provide a wide array of features it can be pretty hard to decide what tool to use. There is a [comparison martix](https://binary-repositories-comparison.github.io/) online that can be used for comparison. However if you just need a repository manager for managing your java artifacts both tools can be used.

In such a case I would take artifactory. The reason is that it has a nicer UI and also its documentation is more straight forward. Additionally artifactory helps you to set up your build tools such as Maven or Gradle.
