---
layout: post
title: RoboGuice makes Android development more awesome
date: '2014-10-05 23:11:05'
disqus: true
tags:
- android
- programming
meta_description: "My name is Markus Vieghofer and I'm an experienced Java developer located in Austria. I write about Java, Android and other technology stuff."
---


I recently discovered an awesome Android framework, [RoboGuice](https://github.com/roboguice/roboguice "RoboGuice"). On the Github page they state

> RoboGuice 2 smoothes out some of the wrinkles in your Android development experience and makes things simple and fun.

and this is absolutely true. I just use it some days but it makes everything even more awesome.

So what is it? It’s a dependency injection framework that helps you dealing with boilerplate code such as initializing the view, getting objects from the intent, getting system service, etc. All that stuff that you don’t want to write anyway can be removed.

A typical Android class could look like this:

{% highlight java %}
class AndroidWay extends Activity {
    TextView name;
    ImageView thumbnail;
    LocationManager loc;
    Drawable icon;
    String myName;

    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.main);
        name = (TextView) findViewById(R.id.name);
        thumbnail = (ImageView) findViewById(R.id.thumbnail);
        loc = (LocationManager) getSystemService(Activity.LOCATION_SERVICE);
        icon = getResources().getDrawable(R.drawable.icon);
        myName = getString(R.string.app_name);
        name.setText("Hello, " + myName);
    }
}
{% endhighlight %}

With RoboGuice all the boilerplate code can be removed. Everthing is just intialized by the framework which results in code similar to this:

{% highlight java %}
class RoboWay extends RoboActivity {
    @InjectView(R.id.name)
    TextView name;

    @InjectView(R.id.thumbnail)
    ImageView thumbnail;

    @InjectResource(R.drawable.icon)
    Drawable icon;

    @InjectResource(R.string.app_name)
    String myName;

    @Inject
    LocationManager loc;

    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.main);
        name.setText("Hello, " + myName);
    }
}
{% endhighlight %}

As you can see, the lines of the onCreate method were reduced dramatically which improves the readability of the method a lot. Since I use this framework my Android code looks a lot better. You should definitely try it out!
