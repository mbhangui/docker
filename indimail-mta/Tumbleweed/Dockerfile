# docker build -f dockerfile.tumbleweed -t cprogrammer/indimail-mta:tumbleweed
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
		patch \
	&& zypper --non-interactive addrepo https://download.opensuse.org/repositories/home:mbhangui/openSUSE_Tumbleweed/home:mbhangui.repo \
	&& zypper --non-interactive addrepo https://download.opensuse.org/repositories/server:database/openSUSE_Tumbleweed/server:database.repo \
	&& zypper --non-interactive --gpg-auto-import-keys refresh \
	&& zypper --non-interactive --gpg-auto-import-keys install \
		indimail-mta \
		logalert \
		procmail \
		indimail-auth \
		indimail-access \
		indimail-utils \
		bogofilter-wordlist \
		indimail-spamfilter \
		mailx \
	&& echo "Creating self-signed certificate" \
	&& /usr/sbin/svctool --config=cert --postmaster=postmaster@indimail.org --common_name=indimail.org > /dev/null 2>/tmp/cert.log \
	&& systemctl disable sshd \
	&& unset HOSTNAME \
	&& echo "Build Completed" 
COPY .alias .bash_profile .bashrc .exrc .gfuncs .glogout .indent.pro .vimrc /root/
ENTRYPOINT ["docker-entrypoint"]
CMD ["indimail-mta"]
