# Laravel Worker

Creates a Laravel Docker image with php-cli, optimized for running queue workers.

[speakbox/laravel-worker](https://hub.docker.com/r/speakbox/laravel-worker)

## Packages

- php-cli 7.3
- curl
- git
- supervisor
- composer

## Ports

- 80

## Makefile

```bash
// Build docker image
$ make build

// Run docker image
$ make run

// Push docker image
$ make push
```

## Login to Docker Hub from CLI

Simply run and follow the steps:

```bash
$ docker login
```
