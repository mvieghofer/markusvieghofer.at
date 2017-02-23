---
layout: post
title: "Gradle Test Logs"
date: 2017-02-23 14:19:42
meta_description: "Log executed tests can be handy to find bugs in your tests. When you use gradle to build your project you need to add some code to accomplish this."
tags: [gradle, tutorial, java, junit]
---
Testing your software is important and should be part of every development process. Without tests you cannot confidently refactor important and/or big parts of your application which will lead to legacy code that gets harder and harder to work with.

The problem with testing is that it is hard. Writing good tests and software that can easily be tested is not a trivial task and even if we do our best to write good tests they sometimes fail for no obvious reason. 

[![Testing is hard](/assets/images/gradle-test-logs/tests-small.jpg)](/assets/images/gradle-test-logs/tests.jpg)

In the worst case scenario the test suite works fine on your local machine but doesn't on a colleagues laptop or on your build server.

Most of the times I've seen such a behavior some tests caused some side effects that let other tests fail. 

When your tests are written in Java using JUnit the order in which your tests are executed is random. It can neither be guaranteed that they are executed in a certain order nor that this order is the same every time your test suite is executed.

When your tests work on your local machine but fail on the build server it's often hard to tell why they fail. 

One reason might be that one of your tests produces side effects that let another test fail. In order to find such a test you need to know in which order your tests are executed.

If you build your project using Gradle the order in which your tests are executed is not logged by default. To get this you need to add some code to your Gradle file.

Luckily the test task comes with [some additional methods](https://docs.gradle.org/current/javadoc/org/gradle/api/tasks/testing/TestListener.html) to handle certain events. So basically everything is there you just have to activate it.

For example you can react to the `beforeTest`, `afterTest`, `beforeSuite` or the `afterSuite` event. As the names imply these events are triggered either before or after a certain test or test suite is executed.

[![Testing is hard](/assets/images/gradle-test-logs/logging-small.jpg)](/assets/images/gradle-test-logs/logging.jpg)

Both after events provide a descriptor of the test or test suite as well as its result. Since I also wanted to log the result of each test I chose to use the `afterTest` event. If you would use the `before` events no results but only the descriptor would be available for you.

Using the following few lines you can log the order of your tests.

<script src="https://gist.github.com/mvieghofer/c42c81746467a59a9763e559034ead88.js"></script>

I chose to remove the package of the fully qualified class name we get from `getClassName()` since I think it is better readable. After I've prepared the class name I just log all information I want using the `logger.lifecycle` method that comes with Gradle.