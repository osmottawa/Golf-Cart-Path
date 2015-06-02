Golf Cart routing API
=====================

All the files to build at latest Graphhopper build for the Golf cart routing can be found here:

https://github.com/osmottawa/Golf-Cart-Path

You would simply do the following Makefile commands.

```bash
$ git clone https://github.com/osmottawa/Golf-Cart-Path
$ cd Golf-Cart-Path
$ make init
$ make download
$ make setup
$ make start
```

This will initiate a new Graphhopper instance on port 8888.

All of the commands are based on an Ubuntu OS, so CentOS will have a few issues running this.

Amazon Server
-------------

We set up an Amazon Test Server dedicated for Graphhopper (http://52.5.34.35:8888/).

You should be able to log in using this Private Key.

```bash
$ sudo chmod 700 TheVillages.pem
$ ssh -i TheVillages.pem ubuntu@52.5.34.35
```