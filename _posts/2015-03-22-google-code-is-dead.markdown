---
layout: post
title: Why Google Code is dead and why GitHub is the better choice
date: '2015-03-22 19:28:04'
disqus: true
tags:
- bitbucket
- git
- github
- google-code
meta_description: "My name is Markus Vieghofer and I'm an experienced Java developer located in Austria. I write about Java, Android and other technology stuff."
---


The project hosting platform [Google Code](https://code.google.com/ "Google Code") was started in 2006. After 9 years the platform lost its shine. A lot of projects migrated to GitHub and Google Code got more and more a cemetery of dead projects. Due to these trend Google [decided](http://google-opensource.blogspot.co.at/2015/03/farewell-to-google-code.html "Google Code is dead") to close Google Code.


# Why did Google Code die?

I think mostly because of two reasons: it’s design and the missing ability to browse through the code.

When you visit Google Code or any repository hosted there you think you just went back in time. It seems that its design stands still since it was launched in 2006.

Some time ago a tool for developers didn’t have to have a nice design. It had to be useful and easy to use. Good looks wasn’t a feature most developers presumed.

This changed. Now a clean design is necessary, too, even for a tool for developers.

A project hosting platform for open source project without the ability to browse through the code probably always looses against a platform that has this feature. This is a crucial feature that lets you easily gain a quick overview of the code.


# GitHub for President

It seems that GitHub is the new president of project hosting platforms. In the end of 2013 it hits the [10 million project](https://github.com/blog/1724-10-million-repositories "10 million GitHub projects") mark which makes it the largest projects hosting platform out there.

![GitHub Office](/assets/images/google-code/github.jpg)
But why did GitHub grow so massively in the last couple of years?

The main reason GitHub grew so fast was the success of [git](http://git-scm.com/ "Git"). GitHub was one if not the first platform that effectively supported hosting of git projects.

The number of projects that use git grew in the last couple of years. A lot of big open source projects such as [Linux](https://github.com/torvalds/linux "Linux on GitHub") ([of course](http://git-scm.com/book/en/v2/Getting-Started-A-Short-History-of-Git "The history of Git")), [some Facebook libraries](https://github.com/facebook "Facebook on GitHub"), [Ruby on Rails](https://github.com/rails/rails "Ruby on Rails on GitHub") or [jQuery](https://github.com/jquery/jquery "jQuery on GitHub") use git. Also all these mentioned projects are hosted on GitHub.

This increases the coolness factor of GitHub a lot. Who wouldn’t want to host his or her open source project on the same platform as basically all major open source projects.

Additionally to the coolness factor, GitHub has a nice and clean UI. This makes it easy to use and also beginners get a good overview of a repository.

Besides the nice UI you also have the ability to browse the code directly on the platform. This is super handy especially if you don’t have the repository checked out (or you don’t want to check out the repository) but still need to know a certain implementation detail. I find it especially useful we the documentation about the configuration isn’t perfect.

So is there even a drawback of this platform, you ask?

Well, yes. At least if you are an independent developer and don’t want to make your code open source. If you want to create a private repository on GitHub you need to pay. Even though the cheapest [plan](https://github.com/pricing "GitHub Pricing Plan") (which includes 5 private repos) costs only 7$ per month there are cheaper options.


# Bitbucket vs. GitHub

There is one large GitHub competitor, Bitbucket.

![Bitbucket Latte](/assets/images/google-code/bitbucket.jpg)

Similar to GitHub its a project hosting platform, too. However, it originally was developed for [Mercurial](http://mercurial.selenic.com/ "Mercurial SCM") projects. Git support was added later.

It basically provides all the same features as GitHub does but its [pricing plans](https://bitbucket.org/plans "Bitbucket Pricing Plans ") are different. If you are only 5 or less contributors, you can have your private repos for free.

So unlimited private repos for private projects, startups or small companies. This is also the reason why I use both of them. My private repos are on Bitbucket, my open source repos are on GitHub.
