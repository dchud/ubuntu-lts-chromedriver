FROM ubuntu:20.04

ENV TZ=America/New_York
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN apt-get update -y
RUN apt-get install -y apt-utils --no-install-recommends
RUN apt-get install -y apt-transport-https
RUN apt-get install -y curl
RUN apt-get install -y libglib2.0 libglib2.0-dev
RUN apt-get install -y libnss3 libnss3-dev
RUN apt-get install -y libx11-6 libx11-dev
RUN apt-get install -y unzip

RUN curl -k https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb -o chrome.deb
RUN dpks -i /chrome/deb || apt-get install -yf
RUN rm /chrome.deb

RUN curl -k https://chromedriver.storage.googleapis.com/86.0.4240.22/chromedriver_linux64.zip -o /root/chromedriver_linux64.zip
RUN unzip -d /usr/local/bin /root/chromedriver_linux64.zip
RUN chmod +x /usr/local/bin/chromedriver

RUN apt-get install -y python3-pip python3-dev

RUN apt-get install -y vim-tiny
