# wordmove
Wordmove on distro Alpine with ssh and lftp utils

Docker image to run [Wordmove](https://wptools.it/wordmove/).

[![Docker Build Status](https://img.shields.io/docker/automated/fejita/wordmove.svg)](https://hub.docker.com/r/fejita/wordmove/)

## What's inside

* alpine 
* openssh-server
* curl
* rsync
* sshpass
* wordmove
* mysql-client-5.5
* php5
* wp-cli
* lftp
* ENV RUBYOPT="-KU -E utf-8:utf-8" (Fix for some mysql sync issues when using old
  db adapter)

## How to use

### To run this image

```bash
docker run -it --rm -v ~/.ssh:/home/wordmove/.ssh:ro fejita/wordmove
```

This starts a shell, with `wordmove` available on the command-line.

### download
```bash
docker pull fejita/wordmove
```

### To run this image in a full Docker-based WordPress environment

See [Wordpress development made easy using Docker](
https://medium.com/cluetip/wordpress-development-made-easy-440b564185f2)

This tutorial explains how to set up a WordPress environment, using Docker
Compose, with the following four interconnected containers:

* database
* wordpress
* phpmyadmin
* wordmove

Don't forget to replace `image: mfuezesi/wordmove` with `image:
fejita/wordmove` to get the latest version of Wordmove.

## Known limitations

* If `sql_adapter` is set to `wpcli`, then the movefile must be in the same
  directory as the WordPress directory

## Advanced usage

### To become root

Run `sudo su` and use `wordmove` as the password.

## Utils 

### build
```bash
./build.sh wordmove <tag> .
```

### push in docker hub 
1. docker login
2. docker images
3. docker tag <imageID> fejita/wordmove:<tagName>
4. docker push fejita/wordmove

## Authors

* **Emilio Frusciante** - [FEj](https://github.com/fej)

## Credits 🙏🏻

Based on [welaika/docker-wordmove](https://github.com/welaika/docker-wordmove)

## Maintainers

@fej dev team 😎

