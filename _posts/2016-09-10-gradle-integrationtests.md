---
layout: post
title: "Integration Testsets with Gradle"
date: 2016-09-10 08:29:42
tags: [java, gradle, intelliJ]
meta_description: "How to execute your integration tests with gradle independently from your unit tests."
---
Some time ago I wrote [a blogpost](http://dev.karriere.at/a/gradle-integrationtests) on our companies Blog about how we accomplished to create an integration-testset for our gradle projects. Since this post was written in german I wanted to translate and repost it here.

First you have to declare a new sourceSet for your integration tests in your build.gradle file. Additionally I've created the integrationTest task which can be used to execute the integration tests on their own.

{% highlight groovy %}
// ...
apply plugin: 'java'

sourceSets {
    integrationTest {
        java {
            srcDir 'src/integrationTest/java'
        }
        resources {
            srcDir 'src/integrationTest/resources'
        }
        compileClasspath += sourceSets.test.compileClasspath
        runtimeClasspath += sourceSets.test.runtimeClasspath
    }
}

dependencies {
    // ....
}

task integrationTest(type: Test) {
    group = 'verification'
    testClassesDir = sourceSets.integrationTest.output.classesDir
    classpath = sourceSets.integrationTest.runtimeClasspath
}
{% endhighlight %}

If you use IntelliJ IDEA as your IDEA make sure to upgrade to the version 2016.1 or higher. Otherwise it might happen that the gradle source sets don't work as expected (see [this blogpost by Jetbrains](https://blog.jetbrains.com/idea/2016/03/intellij-idea-2016-1-is-here/)).

Now your unit and integration tests are completely seperated. You can execute your integration tests using the `integrationTest` task and your unit tests with the `test` task.
