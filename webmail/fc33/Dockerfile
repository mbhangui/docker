# docker build -f dockerfile.fc33 -t cprogrammer/indimail:fc33
FROM fedora:33
MAINTAINER cprogrammer

RUN export HOSTNAME=indimail.org \
	&& dnf -y install 'dnf-command(config-manager)' \
	&& dnf config-manager \
		--add-repo https://download.opensuse.org/repositories/home:mbhangui/Fedora_33/home:mbhangui.repo \
	&& mkdir -p /root/Downloads \
	&& dnf -y update \
	&& dnf -y install \
		binutils \
		gnupg2 \
		hostname \
		initscripts \
		less \
		cronie \
		mailx \
		man-db \
		mrtg \
		net-tools \
		openssh-clients \
		openssl \
		procps \
		psmisc \
		rsync \
		systemd \
		telnet \
		vim \
		wget \
		which \
		strace \
		lsof \
		deltarpm \
		indimail \
		ezmlm-idx \
		ezmlm-idx-cgi \
		ezmlm-idx-mysql \
		iwebadmin \
		httpd \
		mod_ssl \
		php-fpm \
		roundcubemail \
		php-mysqlnd \
		php-imagick \
		ircube \
	&& /usr/sbin/svctool \
		--config=cert --postmaster=postmaster@indimail.org --common_name=indimail.org > /dev/null 2>/tmp/cert.log \
	&& (sed -i \
			-e 's};listen.owner = nobody}listen.owner = apache}g' \
			-e 's};listen.group = nobody}listen.group = apache}g' \
			-e 's};listen.mode = 0660}listen.mode = 0660}g' \
			-e 's}^listen.acl_users.};&}' /etc/php-fpm.d/www.conf) \
	&& /usr/libexec/indimail/roundcube_config > /tmp/roundcube.log 2>&1 \
	&& cat /tmp/roundcube.log \
	&& unset HOSTNAME \
	&& echo "Build Completed" 
COPY .alias .bash_profile .bashrc .exrc .gfuncs .glogout .indent.pro .vimrc /root/
ENTRYPOINT ["docker-entrypoint"]
CMD ["webmail"]
