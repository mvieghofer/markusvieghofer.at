---
layout: post
title: Android REST Client
date: '2016-04-22 12:05:58'
disqus: true
tags:
- android
- rest
- http
---

When you develop an Android application that should talk to a server you often have to consume a REST API. There are some ways how you can do that. In the following post I will show you how the way recommended by the Android docs works.

Until Android 6.0 (which is API level 23) you could use the Apache HTTP Client. However since Android 6.0 this API isn't supported anymore by default. Instead they suggest to use the [HttpURLConnection](http://developer.android.com/reference/java/net/HttpURLConnection.html) .

The reason for this change is that the HttpURLConnection API is more efficient and more transparent to use as stated [here](http://developer.android.com/about/versions/marshmallow/android-6.0-changes.html#behavior-apache-http-client).

The HttpURLConnection API has a good documentation. It might be a little hard to figure everything out at first, though.

## GET Request
Retrieving a resource via an Http `GET` is the easiest use case. The following code listing (taken and adapted from the official documentation) will show you how.

{% highlight java %}
public Object getResource(String resourceUrl) {
  Object result = null;
  URL url = new URL(resourceUrl);
  HttpURLConnection urlConnection = null;
  try {
    urlConnection = (HttpURLConnection) url.openConnection();
    InputStream in = new BufferedInputStream(urlConnection.getInputStream());
    // do something with the stream and set result
  } catch (IOException e) {
    // react to the exception
  } finally {
    if (urlConnection != null) {
      urlConnection.disconnect();
    }
  }
  return result;
{% endhighlight %}

## POST Request
Posting an object to a REST API is very similar to the `GET` request. The only thing you have to do additionally is to set the [`setDoOutput(boolean)`](http://developer.android.com/reference/java/net/URLConnection.html#setDoOutput(boolean)) method to true.

Also you should set the size of the object you want to send. This can either be done with the [`setChunkedStreamingMode(int)`](http://developer.android.com/reference/java/net/HttpURLConnection.html#setChunkedStreamingMode(int)) or the [`setFixedLengthStreamingMode(int)`](http://developer.android.com/reference/java/net/HttpURLConnection.html#setFixedLengthStreamingMode(int)) method. Which method to use depends whether you know the size of the object to send or not.
{% highlight java %}
public Object postResource(String resourceUrl, Object objectToPost) {
  Object result = null;
  URL url = new URL(resourceUrl);
  HttpURLConnection urlConnection = null;
  try {
    urlConnection = (HttpURLConnection) url.openConnection();

    // this makes the urlConnection a POST request
    urlConnection.setDoOutput(true);

    // you should set the size of the object you want to send.
    urlConnection.setChunkedStreamingMode(0); // alternatively you can also use the setFixedLengthStreamingMode(int) method

    OutputStream out = new BufferedOutputStream(urlConnection.getOutputStream());
    // write the object to the out stream

    InputStream in = new BufferedInputStream(urlConnection.getInputStream());
    // read the result from the server and set result
  } catch (IOException e) {
    // react to the exception
  } finally {
    if (urlConnection != null) {
      urlConnection.disconnect();
    }
  }
  return result;
{% endhighlight %}

## PUT Request
The `PUT` request is very similar to the `POST` request. The only difference is that you have to set the request method to `PUT`. All the other options are the same.
{% highlight java %}
public Object putResource(String resourceUrl, Object objectToPut) {
  Object result = null;
  URL url = new URL(resourceUrl);
  HttpURLConnection urlConnection = null;
  try {
    urlConnection = (HttpURLConnection) url.openConnection();

    urlConnection.setDoOutput(true);

    // set the request method to PUT
    connection.setRequestMethod("PUT");

    // set the stream size

    OutputStream out = new BufferedOutputStream(urlConnection.getOutputStream());
    // write to objectToPut to the output stream

    InputStream in = new BufferedInputStream(urlConnection.getInputStream());
    // read the result from the server and set result
  } catch (IOException e) {
    // react to the exception
  } finally {
    if (urlConnection != null) {
      urlConnection.disconnect();
    }
  }
  return result;
{% endhighlight %}

## DELETE Request
As for the `PUT` request you also have to set the request method for the `DELETE` request explicitly. To execute the request you have to call the `getResponseCode()` method.

{% highlight java %}
public boolean deleteResource(String resourceUrl) {
  URL url = new URL(resourceUrl);
  HttpURLConnection urlConnection = null;
  try {
    urlConnection = (HttpURLConnection) url.openConnection();

    // set the request method to DELETE
    connection.setRequestMethod("DELETE");

    // get the result
    return connection.getResponseCode() == 200;
  } catch (IOException e) {
    // react to the exception
  } finally {
    if (urlConnection != null) {
      urlConnection.disconnect();
    }
  }
  return false;
{% endhighlight %}
