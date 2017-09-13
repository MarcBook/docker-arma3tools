FROM debian


RUN apt-get update && apt-get install -y wget unzip gnupg gnupg2 gnupg1 apt-transport-https lib32gcc1 wget
RUN dpkg --add-architecture i386 && wget -nc https://dl.winehq.org/wine-builds/Release.key && apt-key add Release.key
RUN echo deb https://dl.winehq.org/wine-builds/debian/ stretch main >> /etc/apt/sources.list
RUN mkdir -p ~/workingdir && apt-get update && apt-get -y install --install-recommends winehq-stable

RUN cd /root \
	&& wget http://media.steampowered.com/installer/steamcmd_linux.tar.gz \
	&& tar -zxvf steamcmd_linux.tar.gz \
	&& rm -f steamcmd_linux.tar.gz

RUN /root/steamcmd.sh +login anonymous +quit
RUN echo 233800 > steam_appid.txt

COPY installtools.sh /

ARG STEAM_AUTHCODE
ARG STEAM_USERNAME
ARG STEAM_PASSWORD

RUN /installtools.sh && rm -f /installtools.sh

WORKDIR /arma3

RUN cd /arma3 && ls
RUN wine start Binarize/binarize.exe
