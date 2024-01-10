# Deploy an Apache Reverse Proxy on your Ubuntu Server

## Step 1: Install Apache
In this guide we are going to install Apache Web Server to create a working concept of a reverse proxy. Apache comes with a few handy extension modules that enable a reverse proxy solution. To start with, connect to your server and update local package index from APT repositories:

```
sudo apt update
```
Now let’s install apache2 package from official Ubuntu 20.04 repositories:

```
sudo apt install -y apache2
```

When the installation is completed, you can verify that Apache is installed by checking its version:

```
apache2 -version
```

In case you do not know your IP address, use the following command to obtain it:


```
hostname -I
```

This command will showcase all configured IP addresses on all network interfaces that are available on your machine, including an IP address of your public network interface.

## Step 2: Enable Apache Modules for Reverse Proxy
To use reverse proxy with Apache Web Server you need to enable specific Apache modules to support additional functionality that is required for reverse proxy servers. We will need the following modules for our scenario:

mod_proxy: It is the main proxy module for Apache used to manage connections and redirect them. It allows Apache to act as a gateway to underlying back-end servers. This module is mandatory for all reverse proxy scenarios.

mod_proxy_http: This module depends on mod_proxy and is required to support HTTP and HTTPS requests for a proxy server.

mod_ssl: The module provides SSL v3 and TLS v1.x protocol support for the Apache HTTP server.
Let’s now enable these modules with a2enmod command:

```
sudo a2emod proxy && sudo a2enmod proxy_http && a2enmod ssl
```

Every time you enable new Apache modules, don’t forget to restart the apache2 server:

```
sudo systemctl restart apache2
```

You may verify that these modules are active by using the following command:

```
apache2ctl -M
```

## Step 3: Apache Reverse Proxy Configuration

It is now time to configure Apache reverse proxy to accept requests from the internet and forward them to your selected resource. You may forward reverse proxy requests anywhere you want, including other servers, but we will use a local network for educational purposes.

First, let’s disable the default Apache virtual host configuration file 000-default.conf by using the following command:

```
sudo a2dissite 000-default.conf
```

Now create a new virtual host configuration file cherry.conf in the /etc/apache2/sites-available directory with the following configuration text:

```
<VirtualHost *:80>
    ServerName site1.com
    ServerAlias www.site1.com 
    ServerAdmin postmaster@site1.com
    ErrorLog ${APACHE_LOG_DIR}/error.log
    CustomLog ${APACHE_LOG_DIR}/access.log combined

    ProxyPass / http://127.0.0.1:8080/
    ProxyPassReverse / http://127.0.0.1:8080/
    ProxyRequests Off

</VirtualHost>
```

We begin our configuration file with the <VirtualHost> command that contains the IP address and the port number that Apache accepts for this virtual host. In this case the meta character * is used, since all IP addresses are accepted, while the port number is 80 which stands for a default HTTP port. The configuration continues with the following items:

ServerName: Defines the domain name associated with a server. You may either configure it on the Internet via DNS or set it up locally via the /etc/hosts file, if you want to reach your server by the associated domain name.

ServerAlias: Allows you to define additional names that are going to be accepted by the server.
ServerAdmin: The contact email address that the server includes in error messages that are returned to the client.

ErrorLog: Sets the name of a file that Apache uses to store any errors it encounters.

CustomLog: Sets the name of a file that Apache uses to log client requests to the server.

ProxyPass: Maps remote servers into the space of the local server.Defines the target address for traffic redirection.

ProxyPassReverse: A proxy server not only receives requests but can also forward response packets back to the client. ProxyPassReverse command rewrites the original location, content-location and uri HTTP response headers of the back-end server with the proxy server’s information. This is essential to avoid bypassing the reverse proxy and isolate back-end servers from the Internet.

ProxyRequests: Prevents the Apache HTTP server from being used as a forward proxy and makes it more secure. The ProxyRequests command should usually be set to off when using ProxyPass.

Save the configuration file and enable the new virtual host with the following command:

```
sudo a2ensite cherry.conf
```

After your configuration is complete don’t forget to restart apache2 to activate the changes:

```
sudo systemctl restart apache2
```

## Step 4: Configure Flask Application

Your reverse proxy configuration is now complete, but we are still missing a web application that would be listening on port 8080, since our ProxyPass directive is forwarding incoming requests to this destination. We may use a simple Flask application for this purpose. Let’s install python3 and pip package manager first:


```
sudo apt install python3 python3-pip
```
When the installation is done, continue with installing Flask through pip:

```
pip3 install flask
```

Now we are ready to create a simple Flask web application. Let’s call it app.py:

```
vim app.py
```

In the following Python code we import Flask library, instantiate a Flask application and call the index() function on „/“ route:

```
from flask import Flask

app = Flask(__name__)

@app.route(“/”)
def index():
return “Apache reverse proxy is working!”
```

Save the Python script in your working directory and set a FLASK_APP environment variable to app.py so that Flask would know where to instantiate your web application:

```
FLASK_APP=app.py
```

Now you are ready to run your Flask application. Let’s run it on port 8080 as a background job by redirecting standard output and standard error output to /dev/null file to keep our terminal clean:
```
flask run --port=8080 > /dev/null 2 > &1 &
```
Now open your browser and try connecting to your IP address through a standard HTTP 80 port:

You have just sent an HTTP GET request to port 80 on your IP address and your request has been forwarded to port 8080 by the Apache reverse proxy where your Flask application sent back a response. Congrats, your Apache reverse proxy configuration is working!

