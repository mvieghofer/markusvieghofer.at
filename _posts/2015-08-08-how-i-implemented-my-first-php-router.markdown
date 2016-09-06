---
layout: post
title: How I implemented my first PHP Router
date: '2015-08-08 10:38:25'
disqus: true
tags:
- php
- router
---


I’ve recently started to learn PHP and created a small example project. The small project soon got bigger and bigger and I added feature after feature.

The first version of the project was really messy. It was coded as you would expect if from a PHP beginner. I soon realized that this is not the way a PHP application works and so I started to split everything up and use MVC to structure the application.

To be as flexible as possible it is a good idea to use a router to execute controller steps according to the requested URL. Therefore I started to implemented my first and very simple router.


# Simple Router

First I edited the .htaccess file to rewrite the URL and pass it to my index.php file. If I entered the URL http://localhost/post/new the URL would have been modified in a way that it looks like this: http://localhost/index.php?url=post/new. So everything after the http://localhost/ was cut off and set to the url parameter which is then added to the end of the URL.

The .htaccess file I use look like the following:

```bash
Options -MultiViews
RewriteEngine On
RewriteBase /public/
RewriteCond %{REQUEST_FILENAME} !-d
RewriteCond %{REQUEST_FILENAME} !-f
RewriteRule ^(.+)$  index.php?url=$1 [QSA,L]
```

Now the url I request is passed to the index.php and can be processed.

To do this I wrote a little class that accomplishes this. This class originally had two public methods: (1) an <span class="code">add</span> method and (2) a <span class="code">run</span> method.

You could add a mapping between an url and a controller method to the router and when you are done you just had to execute the run method to start the controller. Whenever a new url was requested the router was initialized and processed the url parameter in the run method.

The <span class="code">add</span> method of the router class looks like the following:

```php
public function add($uri, $function) {
    $uri = str_replace('/', '\/', $uri);
    $this->urlMap[$uri] = $function;
}
```

It takes an url parameter and maps it to the function passed. This can be either the name of a controller as well as the method that should be invoked separated by a # or a function.

Example calls for this method could look like this:

```php
$router = new Router();
$router->add('/home', 'HomeController#indexAction');
$router->add('/about', function() {
    $controller = new AboutController();
    $controller->indexAction();
});
```

After you added the url patterns and the corresponding functions to execute the router has to actually map the incoming url to the configured urls. For doing this I’ve implemented a <span class="code">run</span> method.

The run method iterates over all mapped url and checks them against the incoming url. If a url matches the incoming url either the function that is mapped to the url is executed.

This is either a real function that just has to be called or it is a string representation of the controller and the function of the controller that should be called. In the second case the string is split so that I have the controller step and the function to call in an array.

I can build the path to the controller and include it to my PHP script. Then I can call the method of the controller by using the <span class="code">call\_user\_func\_array</span> function.

The parameters passed to that function are extracted by the getParamsFromUrl function. This function basically compares the mapped url with the incoming url and cuts off everything from the incoming url that is also defined in the mapped url. For example, when the mapped url is <span class="code">/post/\d+</span> and the incoming url is <span class="code">/post/15</span> the extracted parameters are <span class="code">15</span>.

```php
public function run() {
    $url = '/';
    if (isset($_GET['url'])) {
        $url .= $_GET['url'];
    }

    foreach ($this->urlMap as $key =&gt; $value) {
        if (preg_match("/^$key$/", $url)) {
            $this->mapUrl($url, $key, $value);
        }
    }
}

protected function getControllerFileName($controllerName) {
    return APP_PATH . '/controllers/' . $controllerName . '.php';
}

private function mapUrl($url, $key, $function) {
    if (is_string($function)) {
        // extract the params form the url and create an array
        // from them
        $params = $this->getParamsFromUrl($url, $key);
        $params = $params ? array_values($params) : [];

        // split the controller#function string at the # symbol
        $function = explode('#', $function);

        // include the controller and create an instance
        require_once($this->getControllerFileName($function[0]));
        $controller = new $function[0];

        // call the function of the controller and pass the params      
        call_user_func_array([$controller, $function[1]], $params);
    } else {
        call_user_func($function);
    }
}

private function getParamsFromUrl($url, $regex) {
    if (isset($url) &amp;&amp; isset($regex)) {
        $regex = str_replace('\/', '/', $regex);
        $url = explode('/', filter_var(rtrim($url, '/'), FILTER_SANITIZE_URL));
        $regex = explode('/', filter_var(rtrim($regex, '/'), FILTER_SANITIZE_URL));
        if (sizeof($url) != sizeof($regex)) {
            return [];
        }
        foreach ($url as $index =&gt; $value) {
            if ($regex[$index] == $value) {
                unset($url[$index]);
            }
        }
        return $url;
    }
}
```

After implementing this function it has to be called. This is done in the index.php file right after all urls are added to the router.

```php
$router = new Router();
$router->add('/home', 'HomeController#indexAction');
$router->add('/about', function() {
    $controller = new AboutController();
    $controller->indexAction();
});
$router->run();
```


# Advanced Router

To be able to do more than just add urls to function mappings I’ve extended the router and added some more functionality. Instead of having just an add method I’ve added a <span class="code">get</span>, <span class="code">post</span>, <span class="code">put</span> and <span class="code">delete</span> method. Also the <span class="code">add</span> method got another parameter, an array of methods.

As you already guessed, the <span class="code">get</span> method executes a function if a certain url is accessed via the HTTP get method. For the <span class="code">post</span>, <span class="code">put</span> and <span class="code">delete</span> method it is similar.

The new <span class="code">add</span> method does basically the same thing as before, it just stores the urls and functions in a matrix where the second dimension are the HTTP methods.

```php
public function get($uri, $function) {
    $this->add($uri, $function, ['GET']);
}

public function post($uri, $function) {
    $this->add($uri, $function, ['POST']);
}

public function put($uri, $function) {
    $this->add($uri, $function, ['PUT']);
}

public function delete($uri, $function) {
    $this->add($uri, $function, ['DELETE']);
}

public function add($uri, $function, array $methods) {
    $uri = str_replace('/', '\/', $uri);
    if (!isset($this->urlMap[$uri]) || empty($this->urlMap[$uri])) {
        $this->urlMap[$uri] = [];
    }
    foreach($methods as $method) {
        $this->urlMap[$uri][$method] = $function;
    }
}
```

After this change also the <span class="code">run</span> method has to be adapted. The correct method for the current HTTP method has to be used.

```php
public function run() {
    $method = $_SERVER['REQUEST_METHOD'];
    $url = '/';
    if (isset($_GET['url'])) {
        $url .= $_GET['url'];
    }
    foreach ($this->urlMap as $key => $value) {
        if (preg_match("/^$key$/", $url) && isset($value) && isset($value[$method])) {
            $this->mapUrl($url, $key, $value[$method]);
        }
    }
}
```

After these changes were implemented the configuration of the router has to be adapted. All urls that should only be mapped for a certain HTTP method are mapped using the corresponding method. All urls that should be mapped for multiple methods are mapped using the <span class="code">add</span> method. For this case also the methods have to be passed.

```php
$router = new Router();
$router->get('/home', 'HomeController#getAction');
$router->post('/home', 'HomeController#postAction');
$router->add('/about', function() {
    $controller = new AboutController();
    $controller->indexAction();
}, ['GET', 'POST', 'DELETE', 'PUT']);
$router->run();
```
 

<span style="color: #999999;">Featured image take from https://flic.kr/p/hW31Na</span>
