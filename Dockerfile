MAINTAINER cprogrammer

# Freshen RUN apt-get -y update
RUN apt-get -y update
RUN apt-get install -y wget openssl man-db vim net-tools gnupg2 procps systemd less debianutils telnet openssh-server
RUN wget -nv https://download.opensuse.org/repositories/home:mbhangui/Debian_9.0/Release.key -O - | apt-key add -
RUN echo 'deb http://download.opensuse.org/repositories/home:/mbhangui/Debian_9.0/ /' > /etc/apt/sources.list.d/indimail.list 
RUN apt-get -y update
#RUN apt-get -y install indimail
#RUN /usr/sbin/svctool --config=cert --postmaster=postmaster@indimail.org --common_name=indimail.org
RUN echo 'PermitRootLogin yes' >> /etc/ssh/sshd_config
