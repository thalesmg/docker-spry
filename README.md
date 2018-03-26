# Dockerfile for Spry language

## Usage

To use a pre-built image, just run:

```bash
$ docker run --rm -it thalesmg/spry

Welcome to interactive Spry!
An empty line will evaluate previous lines, so hit enter twice.
>>> echo "Hello World!"
>>>
Hello World!
nil
>>>
```

## Building

To rebuild this image with another Spry commit hash:

```bash
$ docker build -t spry --build-arg SPRY_COMMIT_HASH=<NEW_HASH> .
```
