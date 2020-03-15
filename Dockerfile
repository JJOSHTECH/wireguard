# Use a Debian Image
FROM debian:stretch-slim

# Getting Wireguard into the Repo
RUN echo "deb http://deb.debian.org/debian/ unstable main" > /etc/apt/sources.list.d/unstable.list
RUN printf 'Package: *\nPin: release a=unstable\nPin-Priority: 90\n' > /etc/apt/preferences.d/limit-unstable

# Update and Upgrade Repo
RUN apt update && apt full-upgrade -y && apt autoremove && apt clean

# Install wireguard
RUN apt install wireguard -y

# Enviroment to describe the server from which you want to make an update
ENV LISTEN_PORT="/port/"
ENV ALLOWED_IPS="/Allowed Network/"

# Environment to describe the https hook address for slack
ENV SLACK_HOOK="/Slackhook/"

# Certifivate Volume
VOLUME /etc/keys

#Copy Cronscript File into Container
COPY startUp.sh /root/startUp.sh

#Add Executable right to cronscript
RUN chmod +x /root/startUp.sh

# Start SSH Server in Debug mode
CMD ["/root/startUp.sh"]
