# docker-chrome-headless

No-nonsense Docker image for running Chrome headless.

The original use case for this project was to let Karma run JavaScript unit tests in headless browsers in Docker.

## Build an Image Locally

```bash
$ export CHROME_VERSION=70.0.3538.77
$ docker build -t chrome-headless:$CHROME_VERSION \
  --build-arg CHROME_VERSION=$CHROME_VERSION .
```

## Run a Locally Built Image

```bash
$ docker run -it chrome-headless:$CHROME_VERSION chrome \
--headless \
--no-sandbox \
--remote-debugging-port=9222 \
--user-data-dir=/userdata \
--no-default-browser-check \
--no-first-run \
--disable-default-apps \
--disable-popup-blocking \
--disable-translate \
--disable-background-timer-throttling \
--disable-renderer-backgrounding \
--disable-device-discovery-notifications \
--disable-software-rasterizer \
--no-gpu \
--mute-audio \
--hide-scrollbars \
http://example.com
```
