FROM debian:jessie

# Prepare directories
RUN mkdir /config
RUN mkdir /opt/oscam

# Add executable
ADD http://download.oscam.cc/index.php?action=downloadfile&filename=oscam-svn11273-x86_64-pc-linux-webif-Distribution.tar.gz&directory=1.20_TRUNK/x86_64-pc-linux& /tmp/oscam.tar.gz
WORKDIR /tmp
RUN tar xvf oscam.tar.gz
RUN mv oscam /opt/oscam/oscam
RUN rm -R /tmp/oscam*

# Fix perms
RUN chmod +x /opt/oscam/oscam

# Volume
VOLUME /config

# Ports
EXPOSE 8888 19240 15999

# Command
CMD ["/opt/oscam/oscam", "-c", "/config/"]
