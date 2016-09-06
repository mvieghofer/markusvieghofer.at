---
layout: post
title: Problems with Databases
---

Every person who claims to be a software developers had contact with a database at some time. That's a fact. At least in my definition of a software developer.

This means that you, dear reader, know how painful it can be to work with our beloved data stores. Often they grow too big or get too slow and we have to work around this.

## Problems of SQL Databases

Probably the biggest problem SQL database have is that they only scale horizontal. Yes, you can split up a schema and put it onto two servers but that's not actual scaling and you know that.

Real scaling is to spin up lots of servers providing the same schema and the same data. Although you can create a cluster of SQL database this not always that easy to set up.

This leads to the problem that database can get big. They can get really big to be specific. Even so big that you have to implement some hacks to make them work with all the data.

When you have to use some hacks to bend the database to your wills you know that you've reached the limit of how big your database can grow. 

Additionally to disrupting your well designed schema SQL databases with too many data in it can get really slow, too. Of course, these are only some problems you can have with SQL databases (which definitely doesn't mean you shouldn't use them; SQL databases are great in what they do and should absolutely be used if the use case is correct; Actually I would suggest you to use a SQL database if you have no good reasons not to).

Often people start to think about NoSql databases when their SQL database reached a certain level where such problems start to appear. Similar to SQL database NoSql database have their strengths but you should also consider that they aren't the allrounder database without any downsides.

## Problems with NoSql Databases

Since the term NoSql database is a very broad one, I understand that the problems I'm going to write about aren't problems for all NoSql databases (in the same extent).

Key-value databases have other problems than graph databases, and document-based databases have other problems than wide column databases.

Nevertheless, the first problem of NoSql databases that come to my mind is that it is often hard to store (complex) structured data in them. As I wrote before this statement is for some NoSql databases truer than for others.

For example in a [Redis](http://redis.io/) database (which is a key-value store) you cannot store complex data in a way to be able to properly process it.

On the other hand you can store complex data in a document oriented database, such as [MongoDb](https://www.mongodb.org/). In MongoDb you can even process the data in a more or less proper way. 

Also there is often no query language. However this is often because the operations you can perform an such a database are so simple that a query language would make no sense.

## What to choose?

Sadly, there is no correct answer to this question. It just depends on you use case. 

If you just need a data store that can tell you the value for a given key you probably want to check out Redis or [a similar database](https://en.wikipedia.org/wiki/Key-value_database#Types_and_notable_examples).

If you want to store the JSON documents for your front end maybe MongoDB or [a related database](https://en.wikipedia.org/wiki/Document-oriented_database#Implementations) is right for you.

Maybe you want a predefined schema with relations and everything. Then you probably need to use a SQL database.

No matter what you should think about your decision. Don't just pick the one you are always using just because that's how you always did it. Take the chance to learn something new and pick the best candidate for your needs. 