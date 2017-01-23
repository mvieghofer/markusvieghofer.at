---
layout: post
title: "How to fix a broken git after upgrading to macOS Sierra"
date: 2016-10-06 16:29:42
tags: [git, macOS, sierra]
meta_description: "How I fixed my git errors after upgrading to macOS Sierra."
---
Yesterday I've upgraded my Mac to the new macOS Sierra. Everything worked great
except that my git installation was broken afterwards. The error message I got
when using git on the command line was the following:

```bash
xcrun: error: invalid active developer path (/Library/Developer/CommandLineTools), missing xcrun at: /Library/Developer/CommandLineTools/usr/bin/xcrun
```

Gladly there is an easy solution to this problem. Just enter `xcode-select --install`
into your terminal and (re)install the CommandLineTools.
