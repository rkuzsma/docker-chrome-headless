# Container with headless Chrome browser
#
# docker build -t chrome-headless .
# docker run -it chrome-headless chrome \
# --user-data-dir=/userdata \
# --headless \
# --no-sandbox \
# --no-default-browser-check \
# --no-first-run \
# --disable-default-apps \
# --disable-popup-blocking \
# --disable-translate \
# --disable-background-timer-throttling \
# --disable-renderer-backgrounding \
# --disable-device-discovery-notifications \
# --disable-software-rasterizer \
# --no-gpu \
# --mute-audio \
# --hide-scrollbars \
# http://example.com

FROM ubuntu:18.04

RUN  apt-get update \
  && apt-get install -y wget gnupg2 \
  && rm -rf /var/lib/apt/lists/*

# OPTIONAL: Install dumb-init (Very handy for easier signal handling of SIGINT/SIGTERM/SIGKILL etc.)
RUN wget https://github.com/Yelp/dumb-init/releases/download/v1.2.0/dumb-init_1.2.0_amd64.deb
RUN dpkg -i dumb-init_*.deb
ENTRYPOINT ["dumb-init"]

# Install Google Chrome
ARG CHROME_VERSION=70.0.3538.77
RUN wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add -
RUN sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list'
RUN apt-get update && apt-get install -y google-chrome-stable=${CHROME_VERSION}-1
RUN ln -s /usr/bin/google-chrome-stable /usr/bin/chrome
