---
layout: post
title: "Gradle Test Logs"
date: 2017-02-23 14:19:42
meta_description: "TODO"
tags: [gradle, tutorial]
---


```
test {
    afterTest { descriptor, result ->
        def className = descriptor.getClassName()
        if (className != null) {
            className = className.substring(className.lastIndexOf(".") + 1)
        }
        logger.lifecycle("Test: " + className + "." + descriptor.getName() + " (" + result.getResultType() + ")")
    }
}
```