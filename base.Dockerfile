FROM buildpack-deps:bionic AS base

ARG DEBIAN_FRONTEND=noninteractive

RUN set -ex; \
	dist=$(grep DISTRIB_CODENAME /etc/lsb-release | cut -d= -f2); \
	echo "deb http://ppa.launchpad.net/ethereum/cpp-build-deps/ubuntu $dist main" >> /etc/apt/sources.list ; \
	apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 1c52189c923f6ca9 ; \
	apt-get update; \
	apt-get install -qqy --no-install-recommends \
		build-essential \
		software-properties-common \
		cmake ninja-build clang++-8 \
		libboost-regex-dev libboost-filesystem-dev libboost-test-dev libboost-system-dev \
		libboost-program-options-dev \
		libjsoncpp-dev \
		llvm-8-dev libz3-static-dev \
		; \
	apt-get install -qy python-pip python-sphinx; \
	update-alternatives --install /usr/bin/llvm-symbolizer llvm-symbolizer /usr/bin/llvm-symbolizer-8 1; \
	pip install codecov; \
	rm -rf /var/lib/apt/lists/*

FROM base AS libraries
