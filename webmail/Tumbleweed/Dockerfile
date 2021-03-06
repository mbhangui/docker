# docker build -f dockerfile.tumbleweed -t cprogrammer/indimail:tumbleweed
FROM opensuse/tumbleweed
MAINTAINER cprogrammer

RUN export HOSTNAME=indimail.org \
	&& mkdir -p /root \
	&& zypper --non-interactive update \
	&& zypper --non-interactive install \
		wget \
		binutils \
		openssl \
		vim \
		net-tools \
		procps \
		psmisc \
		systemd \
		less \
		telnet \
		openssh \
		which \
		systemd-sysvinit \
		sudo \
		strace \
		lsof \
	&& zypper --non-interactive addrepo \
		https://download.opensuse.org/repositories/home:mbhangui/openSUSE_Tumbleweed/home:mbhangui.repo \
	&& zypper --non-interactive addrepo \
		https://download.opensuse.org/repositories/server:database/openSUSE_Tumbleweed/server:database.repo \
	&& zypper --non-interactive addrepo \
		https://download.opensuse.org/repositories/server:monitoring/openSUSE_Tumbleweed/server:monitoring.repo \
	&& zypper --non-interactive addrepo \
		https://download.opensuse.org/repositories/server:php:applications/openSUSE_Tumbleweed/server:php:applications.repo \
	&& zypper --non-interactive --gpg-auto-import-keys refresh \
	&& sed -i -e 's{rpm.install.excludedocs = yes{rpm.install.excludedocs = no{' /etc/zypp/zypp.conf \
	&& zypper --non-interactive --gpg-auto-import-keys install \
		indimail \
		mrtg \
		ezmlm-idx \
		ezmlm-idx-cgi \
		ezmlm-idx-mysql \
		iwebadmin \
		ircube \
		apache2-mod_php7 \
		php7-ctype \
		php7-gd \
		php7-imagick \
		php7-intl \
		php7-xmlrpc \
		php7-zip \
		roundcubemail \
		mailx \
	&& echo "Creating self-signed certificate" \
	&& /usr/sbin/svctool \
		--config=cert --postmaster=postmaster@indimail.org --common_name=indimail.org > /dev/null 2>/tmp/cert.log \
	&& systemctl disable sshd \
	&& (systemctl disable mysqld 2>/dev/null; /usr/libexec/indimail/roundcube_config; ) >/tmp/roundcube.log 2>&1 \
	&& cat /tmp/roundcube.log \
	&& unset HOSTNAME \
	&& echo "Build Completed" 
COPY .alias .bash_profile .bashrc .exrc .gfuncs .glogout .indent.pro .vimrc /root/
ENTRYPOINT ["docker-entrypoint"]
CMD ["webmail"]
